module start where

{-
## Emacs billentyűzet parancsok

* C-x C-f : file (akár új file) megnyítása
* C-g : **abort, abort, abort!** Ha valami furát kérdez az emacs vagy nem tudjuk, hogy mi történik, ezt kell nyomogatni
* C-x b : bufferek (megnyitott file-ok) között váltás
* Shift-nyilak vagy `C-x o` : window (panelek) közötti mozgás
* C-x 1 : minden window (panel) bezárása, kivéve amelyikben vagyunk

## Agda

* C-c C-l : buffer (file) ellenőrzése
* M-. : definicióra ugrás
* M-, : vissza
* C-c C-n : kiértékelni egy kifejezést (működik „lyukakban” is)
* C-c C-d : kifejezés típúsa („lyukakban” is)

### Unicode

* M-x quail-show-key : egy furi karakteren állva megmutatja, hogy lehet bevinni
* C-x 8 RET : Összes Unicode karakter között keresés hivatalos nevük alapján

* \bN : ℕ
* \-> : →
* \Gl : λ
* \== : ≡
* \o : ∘
* \.- : ∸


### „Lyukak”

* C-c C-, : lyuk típusa és környezete
  + Egy `C-u` prefixszel (C-u C-c C-,): minden egyszerűsítés nélkül
  + Két `C-u` prefixszel: normalizálva
* C-c C-. : ugyan az, mint az elöző, plusz még a lyukba írt kifejezés típusa
* C-c C-c : eset szétválasztás. A lyukba írt változó(k)ra, vagy kérdez
* C-c C-a : automata lyukbetöltő („Agsy”), lást lejjebb
* C-c C-SPC : beadni a lyukba a kifejezést
* C-c C-r : „finomítás”: beadni a lyukba a függvényt, hiányzó argumentumokból új lyukak lesznek.

### „Agsy”, az automata lyukbetöltő

* -l : lehetőségek listázása (10 db)
* -s 3 : 3. lehetőség kiválasztása (a `-l`-es listából)
* -l -s 10 : további lehetőségek listázása
* -c : esetszétválasztás is engedélyezve van

## VNC

* `F8`: a VNC kliens fő menüje. Itt lehet opciókat állítani, full screenbe tenni és vissza, kilépni…
* `Ctrl-Alt-nyilak`: a VNC-n belül mozgás desktopok között
* `Ctrl-Alt-F`: a **VNC-n belül** full screen ki/be
-}

open import Data.Nat
open import Relation.Binary.PropositionalEquality
