# Szeminárium № 1: házi feladatok

Ez a házifeladat/anyag gyűjtemény a következőképpen van strukturálva:

* Spoilermentes/challenge változat. Ha valaki kihívásra vágyik vagy
  maga akar kisérletezni/utánaolvasni/gondolkozni a dolgokon, annak
  ajánlom hogy kezdje ezzel. Itt a kiegészítő anyagok nincsenek
  elmagyarázva és a feladatok inkább open-ended módon vannak
  megfogalmazva. Lásd [itt](HFopen.lagda.md).
* Normál változat. Kiegészítő anyagok és részletes(ebb)en felépített
  feladatok. A kihívás feladatok meg vannak jelölve ★-okkal. Ez a
  dokumentum.
* [Megoldások](HFsolved.lagda.md). Ha elakadtál, vagy csak
  összehasonlítani a megoldásokat. A kihívás feladatokhoz nem mindig
  van megoldás. ;)

Mindegyik fájl egyszerre Markdown és agda file. Pullolva a repó-t meg
lehet nyitni emacsban és közvetlenül a file-t olvasni és dolgozni
benne. Ehhez ki kell adni az `M-x agda2-mode` parancsot, ha a file nem
Agda módban töltődik be.  (Ez főleg a megoldásoknál előnyös, mert
elválasztottam a különböző részeket sok üres sorral, így nem
spoilereződnek véletlenül.)

Lássunk neki.

```agda
module HF where

open import Data.Nat
open import Data.Bool using (Bool; true; false)
```

# Magasabbrendű függvények

**Feladat:** Írjunk egy olyan függvényt ami úgy ad össze két számot,
hogy előtte végrehajta rajtuk ugyan azt a műveletet (egy argumentumban
átadott `ℕ -> ℕ` függvényt hív meg rajtuk):

```agda
funadd : (ℕ -> ℕ) -> ℕ -> ℕ -> ℕ
funadd = {!!}
```

Teszteljük le a függvényünket néhány példán. Mi ez (★):

```agda
factorial : ℕ -> ℕ
factorial zero = 1
factorial n'@(suc n) = n' * factorial n

x1 = funadd (funadd factorial 5) 6 7
```

És ezek mik (★): `ff1 = funadd ff1 1`, `ff2 = funadd ff2`? Mi lenne a
típusuk? Mit szól rájuk az Agda?


# Kiegészítő anyag: Mixfix operátorok

Agdának nagyon egyszerű és rugalmas mechanizmusa van a prefix, infix,
postfix, és mindenféle keverék operátorok definiálására. Ha egy
függvény nevében a függvény argumentumainak megfelelő számú `_`
karakter található, akkor a függvény használható „operátorként” úgy
hogy az argumentumokat az aláhúzások helyére (szép szellősen,
szóközökkel körülvéve) tesszük.

Például a sztenderd `Data.Bool` modulban így vanak definiálva az „és”
és a „vagy” függvények:

```agda
_∧_ : Bool → Bool → Bool
true  ∧ b = b
false ∧ b = false

_∨_ : Bool → Bool → Bool
true  ∨ b = true
false ∨ b = b
```

Ezek után így használható:

```agda
x2 : Bool
x2 = true ∧ true
```

Természetesen továbbra is használaható a függvény mint sima függvény,
ha a teljes, aláhúzásokat tartalmazó, nevén szólítjuk:
`_∧_ true true`. Sőt, az aláhúzásos helyekből lehet csak néhányat, nem
az összeset kitölteni, az eredmény kifejezés ilyenkor egy függvény,
aminek a megmaradt aláhúzásokhoz tartozó argumentumai vannak:

```agda
andtrue : Bool -> Bool
andtrue = _∧ true
```

Az hogy egy operátor milyen erősen „köt” (a többi operátorhoz képest)
és hogy „merre asszociál”, merre kell zárojelezni ha többször van
egymás után, az ún. „fixity” deklarációkkal adjuk meg. Szintén a
sztenderd libraryből:

```agda
infixr 6 _∧_
infixr 5 _∨_
```

Alacsonyabb szám gyengébben köt. Ami azt jelenti, hogy az `a ∧ b ∨ c`
így zárójeleződik: `(a ∧ b) ∨ c`. És az `r` az `infixr`-ben azt
jelenti, hogy jobbra köt, azaz `a ∧ b ∧ c` így zárójeleződik: `a ∧ (b
∧ c)`. (`infixl` — balra köt; `infix` — se jobbra se balra,
pl. `a ≡ b ≡ c` az hiba.)

**Fontos:** a függvényalkalmazás az minden operátornál erősebben köt.
`f a ∧ b` ⇒ `(f a) ∧ b`, és ha `f (a ∧ b)` -t akarunk, azt explicíte
zárójelezni kell.

**Feladat:** mi történik ha egy ilyen mixfix (aláhúzásokat tartalmazó)
függvénynek több argumentuma van, mint ahány aláhúzás van a nevében?
Van-e ennek értelme? Mi történik ha kevesebb argumentuma van, mint
aláhúzás?

Példák az Agda sztenderd library-jéből: `if_then_else_`, `⟨_,_⟩` — pár
képző operátor, `⟦_⟧`, `_≤⟨_⟩_` — kisebbegyenlő egy bizonyítással a
közepében…

**Feladat:** írjuk át a `funadd` függvényünket mixfixre. Hanyadiknak
érdemes tenni a függvény argumentumot?

# Magasabbrendű függvények, folytatás

**Feladat:** írjunk egy olyan függvényt ami eszik egy `ℕ -> ℕ`
függvényt, egy darabszámot, hogy hányszor kell ezt alkalmazni és egy
input természetes számot, amire kell alkalmazni. Milyen sorrendbe
érdemes tenni az argumentumokat?

```agda
iterate : {!!}
iterate = {!!}
```

<!-- Lapozz!-->Spoilers ⟱ <hr style="height: 1000px; visibility: hidden;">


















































Tegyük fel, hogy az `iterate count function input` argumentumsorrendet
választottuk. Azaz `iterate : ℕ -> (ℕ -> ℕ) -> ℕ -> ℕ`. Ezt a típust
úgy is olvashatjuk, mint `ℕ -> (ℕ -> ℕ) -> (ℕ -> ℕ)`, vagyis egy
darabszámot várunk meg egy függvényt és egy szintén `ℕ -> ℕ` függvényt
adunk vissza. Ami a beadott függvény darabszámodik „hatványát” adja
vissza.

**Feladat:** definiáljuk az identitás függvényt, a függvénykompozició
operátort, és ezek segítségével állítsuk elő az `iterate` függvényt
ilyen módon és mixfix operátorként. Merre érdemes kötniük az
operátoroknak?

**Feladat:** a `suc` függvényből kiindulva az
iteráló/függvényhatványozó operátort használva definiáljuk a
természetes számok összeadását, szorzását, hatványozását.
(★) Ackermann függvény valamelyik változatát.


# Kiegészítő anyag: polimorf függvények

Egy kicsit előreszaladva észrevehetjük, hogy a függvényeink nem eléggé
„általánosak”, pl. a kompozició operátornak ugyan az a definiciója
működne nem csak `ℕ -> ℕ` függvényekre. A `const` függvény példáján, a
szintaxis magyarázatába nem belemenve egyelőre, így lehet definiálni
olyan függvényt, ami polimorf (azaz működik akármilyen típusú
értékekre).

```agda
const : {A B : Set} -> A -> B -> A
const a b = a
```

A `const` függvény az a kétargumentumú függvény, ami a második
argumentumát eldobja és mindig az elsőt adja vissza. (Hasznos olyan
esetekben, amikor van egy magasabbredű függvény, ami mondjuk egy
`ℕ -> ℕ` argumentumot vár, de mi ott mindig 5-öt akarunk adni,
függetlenül a bemenettől, ilyenkor a `const 5` pont belepasszol a
lyukba. :))

Ezzel a tudással felfegyverkezve írjuk át az eddigi függvényeinket a
„legáltalánosabbra”.

(★) Micsoda az így általánosított `iterate` függvény? Tényleg a
legáltalánosabb? (★★) Meg lehet-e írni a segítségével minden
természetes számokat evő függvényt anélkül, hogy rekurzálnánk a
természetes számokon?
