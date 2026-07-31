---
name: menueplan
description: Erstellt den Mittagsmenüplan für Hotel Restaurant Allmer als druckfertiges A4-PDF. Nutzen, wenn Markus einen Menüplan für eine Woche braucht, einen bestehenden ändern will, oder nach Gerichtsvorschlägen für die Karte fragt.
---

# Menüplan Allmer

Ein Plan besteht aus **zehn Hauptspeisen**. Alles andere auf dem Blatt ist
Schablone. Suppe, Salat und Dessert werden spontan nach Warenbestand
entschieden und stehen nie im Plan — Markus, 28.07.: *„Hauptspeisen sind
geplant."*

## Die Wände — nicht verhandelbar

- **150 Gedecke in zwei Stunden** (11:30–13:30). Das ist keine Küche, das ist
  eine Straße. Jedes Gericht muss entweder im **Kessel** vorproduziert und
  gehalten werden können oder in gerader Linie durch die **Panierstraße**
  laufen. Alles, was pro Teller einzeln komponiert oder auf den Punkt gegart
  wird, fällt raus — egal wie gut es schmeckt.
- **Niedriger Wareneinsatz.** Menüs sind das Hauptgeschäft und günstig.
  AUSNAHME, die Markus genannt hat: Zander und Backhendl sind über
  Lieferantenkonditionen und Mengen billig, obwohl sie es normalerweise nicht
  wären. Nicht von Marktpreisen ausgehen.
- **Das Publikum sind Bauarbeiter.** Gerichte, die jeder kennt und beim Namen
  bestellt. Nichts Erklärungsbedürftiges.

## Die Gewohnheiten — gewachsen, dürfen hinterfragt werden

Aus fünf Archivwochen gelesen (22.06., 06.07., 13.07., 20.07., 27.07.2026):

- **Dienstag ist Backtag** in Menü I — 5 von 5 Wochen. Dreimal Cordon bleu.
- **Rotationsabstand zwei Wochen**, nicht vier bis sechs. Bei Stammpublikum ist
  Wiedererkennung ein Feature.
- **Freitag ist Fischtag** in Menü I — 3 von 5, jedes Mal Zander.
- **Geschlossener Beilagen-Pool**, rund acht Positionen: Pommes · Wedges &
  Gemüse · Kroketten · Gemüsereis · Semmelknödel · Spätzle · Kartoffelpüree ·
  Erbsenreis · Petersilkartoffeln.
- **Menü I ist nie vegetarisch** — 18× Fleisch, 2× Zander in 20 Einträgen.
- **Menü II ist NICHT die vegetarische Linie**, sondern die *andere*: kleiner in
  der Sättigung, variabler, etwa halb/halb Fleisch. Trägt den
  Wareneinsatz-Ausgleich.
- **Kein Teller ohne Sättigung.** Fehlt die Beilage, steht „und Gebäck".
- **Varianten statt Neuheiten:** Cordon bleu in drei Ausführungen, Schnitzel in
  drei, Kotelett in zwei. Bekannter Anker, neue Beilage.
- **Menü II driftet seit 13.07. moderner** (Crispy Chickenburger, Sweet-Chili,
  Asiatische Nudelpfanne, Haustoast). Die Juni-Anker (Schafskäse Di, Leberkäse
  Fr, Schweinsbraten Mi) fehlen seither. Ob Absicht: ungeklärt, Markus fragen.

## Die Richtung — Markus, 29.07.

> *„Stillstand ist Rückstand, auch wenn es funktioniert."*

Die Gewohnheiten oben sind **keine Naturgesetze**. Wer diesen Plan erzeugt, darf
sie nicht als Kopiervorlage behandeln. Ziel ist, pro Woche **eine Position**
bewusst zu bewegen und danach nachzusehen, was passiert ist.

**Was der Karte fehlt** (Befund 28.07. gegen die Weizer Konkurrenz): In fünf
Wochen stehen **drei Kesselgerichte von fünfundzwanzig** in Menü I. Die
Nachbarn — Ederer, Feiertag, JUFA, Tannenwirt — fahren Reisfleisch,
Kalbsgulasch, Rindsbraten, gekochtes Rindfleisch. Bei 150 Gedecken ist das
Kesselgericht das dankbarste, was es gibt. Hier liegt der größte Hebel.

## Vorgehen

1. **Die laufende und die letzte Woche holen.** Ohne sie kann der
   Zwei-Wochen-Abstand nicht geprüft werden. Quelle: Markus fragen oder
   `https://www.tourismus-weiz.at/kulinarik/menueplan/` — dort stehen alle
   Weizer Häuser inklusive Allmer, das ist zugleich die Konkurrenzbeobachtung.
2. **Zehn Hauptspeisen wählen** nach Wänden und Gewohnheiten oben. Beilagen ohne
   Doppelung und ohne Überschneidung zur laufenden Woche.
3. **Jede Abweichung markieren und begründen** — besonders Gerichte, die in
   keinem Archivblatt stehen. Markus entscheidet, nicht der Plan.
4. **PDF erzeugen** (siehe unten), A4 hoch, eine Seite, Seitenzahl nachmessen.
5. **Vorlegen mit den zwei bis drei Stellen, die sein Urteil brauchen.**

## Das PDF

Vorlage: `~/Code/cockpit/docs/vorlagen/menueplan.html` (falls vorhanden), sonst
neu bauen. Zwingend:

- `<!doctype html>` + `<meta charset="utf-8">` + Umlaute als Entities.
  **Ohne beides kommt Zeichensalat** — am 28.07. passiert, „Menü" wurde „MenÃ¼".
- Farben: Band `#c9b193` · Papier `#f5f1ea` · Zellen `#fbf8f3` · Schrift
  `#33291f` · Linien `#e0d6c6`
- Kopf: Schreibschrift „Mittagsmenü's", darunter `11:15 – 14:30 Uhr`, darunter
  der Datumsstempel `KALENDERWOCHE NN · TT. – TT. MONAT JJJJ`
- Zwei Spalten `Menü I` / `Menü II`, fünf Tagesbänder, je Zelle
  `Tagessuppe / HAUPTGANG / gemischter Salat / Dessert`
- Fußzeile rechts: `Erstellt am TT.MM.JJJJ`
- **Kein Logo erfinden** — der Platz oben rechts bleibt frei, bis Markus die
  Bilddatei schickt.

Erzeugen mit Chrome headless:
```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless \
  --disable-gpu --no-pdf-header-footer --print-to-pdf="Menueplan-KWnn.pdf" \
  --virtual-time-budget=3000 "file://$PWD/druck.html"
```

**Danach die Seitenzahl MESSEN**, nicht annehmen — der erste Versuch am 28.07.
hatte zwei Seiten:
```
python3 -c "import re;d=open('x.pdf','rb').read();print(len(re.findall(rb'/Type\s*/Page[^s]',d)))"
```
