---
name: wakeword-lauf
description: Trainiert das Wake-Word-Modell „Kairo" neu — Aufnahme zerlegen, mit synthetischen Stimmen mischen, trainieren, Schwelle am Gerät messen. Nutzen, wenn das Wake Word schlecht erkennt oder neue Sprachaufnahmen vorliegen.
---

# Wake-Word-Lauf

Ort: `~/Code/cockpit-wakeword` · Paket: livekit-wakeword (Apache 2.0)

## Die drei Fallen, jede schon zugeschnappt

**1 · `generate` überspringt volle Ordner.** *„Split already complete, skipping"*
(`generate.py:353`). Lauf 1 starb daran: Ein Skript hatte die Positiv-Ordner mit
echten Aufnahmen gefüllt, die Synthese sprang in null Sekunden darüber hinweg,
und das Modell kannte genau eine Stimme. Ergebnis: 50 Fehlalarme pro Stunde.
**Vor jedem Lauf `output/kairo/positive_train` und `positive_test` leeren.**

**2 · Echte Aufnahmen ERGÄNZEN, nie ersetzen.** `positive_mischen.py` schreibt
mit eigenem Präfix und löscht nur die eigenen Dateien.

**3 · Labor ist nicht Feld.** Der Testsatz misst gegen Clips desselben
Mikrofons. Am Gerät gilt das nicht. Lauf 2 maß 0.71 Recall bei Schwelle 0.34 —
am iPhone sprang es nur bei bewusster Aussprache an.

## Ablauf

```bash
cd ~/Code/cockpit-wakeword
# Aufnahme (Sprachmemo vom iPHONE, nicht vom Mac) nach 16 kHz mono
ffmpeg -y -i ~/Desktop/aufnahme.m4a -ac 1 -ar 16000 stimme/iphone/roh.wav
.venv/bin/python zerlegen.py            # → einzelne Rufe, mit Protokoll
# Hörprobe bauen und Markus vorlegen, BEVOR trainiert wird
rm -rf output/kairo/positive_train output/kairo/positive_test
mkdir -p output/kairo/positive_train output/kairo/positive_test
./kette3.sh &                            # generate → mischen → augment → train → export
```

Dauer: rund 1,3 s je synthetischem Clip. 5000 Clips ≈ zwei Stunden.
Monitor auf `lauf3.log` setzen, nicht pollen.

## Die Schwelle wird GEMESSEN, nie gesetzt

1. Messfassung bauen: `schwelle = 0.05`, `debounce = 0.4`, jeder Wert ins Log
2. Markus sagt zehnmal „Kairo" — **beiläufig, wie im Alltag**, nicht im
   Testmodus. Am 29.07. wurde seine Teststimme gemessen und daraus eine
   Alltagsschwelle abgeleitet. Zwei verschiedene Stimmen, eine Zahl.
3. Werte sortieren, Bänder suchen. Am 29.07.: Rauschen 0.05–0.18, Zwischenband
   0.21–0.44, seine zehn Rufe 0.485–0.706. Schwelle in die größte Lücke.
4. **Entprellung nicht vergessen.** 2,0 s war die eigentliche Ursache von
   „hört einmal von zehn mal": Ein Rauschwert startete die Sperre, und der
   echte Ruf fiel hinein. 1,0 s.

## Am Gerät zwingend

- `executionProvider: .cpu` — der Standard `.coreML` scheitert auf dem
  iPhone 13 Pro Max bei jeder Vorhersage, während der Listener „lauscht" meldet.
- Das Ohr muss das Gespräch überleben: Neustart, wenn der Sprachzustand auf
  `idle` fällt, plus Netz gegen Unterbrechungen von außen.
