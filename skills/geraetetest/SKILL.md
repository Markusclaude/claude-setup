---
name: geraetetest
description: Baut die Cockpit-iOS-App, installiert sie auf Markus' iPhone und liest die Konsole mit. Nutzen bei jeder Swift-Änderung, wenn Markus sagt das Handy hängt am Mac, oder wenn etwas am Gerät nicht funktioniert.
---

# Gerätetest Cockpit iOS

Projekt: `~/Documents/CockpitApp/Cockpit` · Gerät: iPhone 13 Pro Max

## Die Regel, die alles trägt

>>> INSTALLIEREN IST NICHT PRÜFEN. Die App kann starten, „läuft" melden und
>>> nichts tun. Am 29.07. meldete das Wake Word `lauscht auf „Kairo"`, während
>>> jede einzelne Vorhersage in einer ONNX-Fehlerzeile endete. Wer nur den
>>> Install-Erfolg meldet, meldet nichts.

**Immer die Konsole mitlesen und auf Fehlerzeilen prüfen, bevor „fertig"
gesagt wird.**

## Ablauf

```bash
# 1 Gerät finden — die UUID ändert sich nicht, der Zustand schon
xcrun devicectl list devices | grep -i iphone
# "connected" = Kabel steckt. "available (paired)" = NICHT erreichbar,
# Markus bitten, das Kabel neu anzustecken.

# 2 Bauen
cd ~/Documents/CockpitApp/Cockpit
xcodebuild -scheme Cockpit -sdk iphoneos -configuration Debug \
  -derivedDataPath /tmp/ddwake -allowProvisioningUpdates build 2>&1 | tail -3

# 3 Installieren
xcrun devicectl device install app --device <UUID> \
  /tmp/ddwake/Build/Products/Debug-iphoneos/Cockpit.app

# 4 Starten UND MITLESEN — im Hintergrund, sonst blockiert es
cd /tmp && xcrun devicectl device process launch --device <UUID> \
  --console com.markus.Cockpit > /tmp/log.txt 2>&1 &
# danach warten und /tmp/log.txt lesen
```

## Was in der Konsole zu suchen ist

```
[KairoWakeWord]    Start, Treffer mit Konfidenz, Unterbrechungen
[E:onnxruntime]    JEDE dieser Zeilen ist ein toter Rechenweg
Fehler / error     alles, was nach Ausnahme aussieht
```

## Fallen, die schon zugeschnappt sind

- **Eine offene Konsolen-Sitzung blockiert die nächste Installation.** Vorher
  `pkill -f "devicectl device process launch"`.
- **Ressourcen im Bundle prüfen, nicht annehmen:**
  `find /tmp/ddwake/Build/Products/Debug-iphoneos/Cockpit.app -name "*.onnx"`
- **`timeout` gibt es auf macOS nicht.** Stattdessen Hintergrundstart plus
  `sleep`.
- **Zwei Komponenten, eine Audio-Sitzung.** `KairoVoiceManager.stop()` ruft
  `setActive(false)` — das reißt jedem anderen Hörer das Mikrofon weg. Wer
  Audio anfasst, prüft, ob das Wake Word danach noch läuft.
