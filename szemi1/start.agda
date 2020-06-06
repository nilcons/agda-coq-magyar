module start where

-- Egy sor komment

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

-- +-commutative : ∀ {x y x+y} -> x + y ≡ x+y -> y + x ≡ x+y
-- +-commutative = _


factorial : ℕ -> ℕ
factorial zero = 1
factorial (suc n) =  suc n * factorial n

-- 5! : ℕ
-- 5! = factorial 5

fib : ℕ -> ℕ
fib zero = 0
fib (suc zero) = 1
fib (suc (suc n)) = fib n + fib (suc n)

{-
fib 30
fib 28 + fib 29
fib 28 + (fib 27 + fib 28)
(fib 26 + fib 27) + (fib 27 + (fib 26 + fib 27))
-}

add2 : ℕ -> ℕ
add2 n = n + 2

fura : ℕ -> (ℕ -> ℕ)
fura zero = factorial
fura (suc zero) = fib
fura (suc (suc _)) = add2

f = fura 1

x = fura 1 10

-- nev1 nev2 nev3 nev4
-- ugyan az:
-- ((nev1 nev2) nev3) nev4

add : ℕ -> ℕ -> ℕ
add a b = a + b

add' : ℕ -> (ℕ -> ℕ)
add' a = fv-ami-a-t-add-hozza where
  fv-ami-a-t-add-hozza : ℕ -> ℕ
  fv-ami-a-t-add-hozza b = a + b

add3 : ℕ -> (ℕ -> (ℕ -> ℕ))
-- add3 a = λ b -> (λ c -> a + b + c)
add3 = λ a -> (λ b -> (λ c -> a + b + c))

add3' : ℕ -> ℕ -> ℕ -> ℕ
add3' a b c = a + b + c

y' = add3' 1 2 3

y = ((add3 1) 2)

{-
Iteralo fuggveny:
(ℕ -> ℕ) -> ℕ -> ℕ -> ℕ
megirni az add-ot (+ -ot nem hasznalva)
-}

----------------------------------------------------------------------------------------------------
-- Random kérdések a vége után

-- Mixfix operátorok és slice-ok

haromplusszolo = 3 +_           -- (3+) Haskellben

haromminuszolo = _∸ 3           -- monus

open import Data.Bool hiding (if_then_else_)

-- ifthenelse :: forall a. Bool -> a -> a -> a

if_then_else_ : {A : Set} -> Bool -> A -> A -> A
if false then t else f = f
if true then t else f = t

_z_ = if_then 5 else_

_ = true z 7

-- ¬ : Bool -> Bool
-- ¬ false = true
-- ¬ true = false

¬_ : Bool -> Bool
¬ false = true
¬ true = false

x0 = ¬ false ∧ true

-- „valódi” függő típus
-- type family: NatVector : ℕ -> Set
-- repeat : (n : ℕ) -> ℕ -> NatVector n

-- Nem lehet két _ egymás után
-- __++_ : ℕ -> ℕ -> ℕ -> ℕ
-- a b ++ c = a + b + c
