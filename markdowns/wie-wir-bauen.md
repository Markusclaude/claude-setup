# Wie wir bauen

*Die Regeln, die aus Fehlern entstanden sind. Stand 31.07.2026.*

## Die drei unverhandelbaren
1. **Zuerst besprechen, dann bauen.** Kein Code ohne ausdrückliches Go.
2. **Verifikation gegen Code.** Grep und lies, bevor du schreibst. Die Doku
   kann stale sein — der Code ist die Wahrheit.
3. **tsc vor Commit.** Kein Push mit rotem tsc.

## Die Hygiene
- **Wurzel-Pflicht:** Jeder Fix nennt seine Wurzel. Kein NEXT-Eintrag = das
  ist ein FUND, gehört auf die Liste, nicht in den Bau.
- **Entwertungs-Pflicht:** Ein Bau ist nicht fertig, bevor jemand gefragt
  hat: *wer liest noch die alte Version?* Kein DECISIONS-Eintrag ohne
  `entwertet:`-Zeile.
- **Verdrahten im selben Commit:** Neues, das gelesen werden soll, wird im
  selben Commit angeschlossen — sonst entsteht ein Bauteil ohne Aufrufer.

## Was sich als Prinzip bewährt hat
- **Keine Geste ohne Wirkung.** Ein Wisch, der Erledigung *behauptet*, ohne
  etwas zu ändern, ist eine Lüge im Interface. (Fund 31.07.: drei von vier
  Kartenarten auf der Bühne taten genau das — zurückgebaut.)
- **Ehrliche Leere.** Lieber „kein Sensor" als eine erfundene Zahl. Lieber
  „Ziele nicht gesetzt — nach Frist sortiert" als eine erfundene Priorität.
- **Stille als Default.** Ein Agent, der jede Woche etwas meldet, wird
  überhört. Kein urteilswürdiges Delta → kein Stück, nur eine Quittung.
- **Der Agent kann nicht schweigen.** Herzschlag, Quittung mit Negativ-Teil,
  Wächter. Das *Ausbleiben* ist der Alarm, nicht der Fehler.
- **Eine Wahrheit pro Sache.** Zwei Tabellen mit denselben Werten driften.
  Zwei Flächen mit derselben Information verwirren.

## Die teuersten Lehren (31.07.2026)
- Ein vergessener API-Schlüssel auf einer Maschine kostet echtes Geld, auch
  wenn „alles übers Abo läuft". **Prüfen, nicht annehmen.**
- Ein lokaler Test kann täuschen: Er benutzte die Mac-Anmeldung statt des
  Tokens, das er prüfen sollte. **Isoliert testen (leeres HOME).**
- Ein Cron, der nicht in `vercel.json` steht, läuft nie — auch wenn die
  Route perfekt ist. **Die Verdrahtung ist Teil des Baus.**
