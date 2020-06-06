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
module hf where

open import Data.Nat
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
