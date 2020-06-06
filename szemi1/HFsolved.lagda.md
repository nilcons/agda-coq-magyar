# Szeminárium № 1: házi feladatok, megoldások

Ez a fájl egyszerre Markdown és agda file. Meg lehet nyitni emacsban
és közvetlenül a file-t olvasni és dolgozni benne. Ehhez ki kell adni
az `M-x agda2-mode` parancsot, ha a file nem Agda módban töltődik be.
(Ez főleg a megoldásoknál előnyös, mert elválasztottam a különböző
részeket sok üres sorral, így nem spoilereződnek véletlenül.)

```agda
module HFsolved where

open import Data.Nat
```

# Magasabbrendű függvények

```agda
funadd : (ℕ -> ℕ) -> ℕ -> ℕ -> ℕ
funadd f a b = f a + f b
```

<!-- Lapozz!-->Spoilers ⟱ <hr>



















































# Mixfix operátorok

**TODO**

```agda
-- Ez lehetne infixl, de szerintem csak zavaró
_+[_]+_ : ℕ -> (ℕ -> ℕ) -> ℕ -> ℕ
a +[ f ]+ b = f a + f b

-- Ez nem félrevezető, nem tud se l se r lenni
[_]_+_ : (ℕ -> ℕ) -> ℕ -> ℕ -> ℕ
[ f ] a + b = f a + f b
```

<!-- Lapozz!-->Spoilers ⟱ <hr>



















































# Magasabbrendű függvények, folytatás


```agda
iterate : ℕ -> (ℕ -> ℕ) -> ℕ -> ℕ
iterate zero f x = x
iterate (suc n) f x = f (iterate n f x)
```

A `_+_`, `_*_` és `_^_` lásd a végén!

<!-- Lapozz!-->Spoilers ⟱ <hr>

















































# Polimorf függvények

```agda
id : {A : Set} -> A -> A
id x = x

infixr 9 _∘_
_∘_ : {A B C : Set} -> (B -> C) -> (A -> B) -> (A -> C)
g ∘ f = λ x -> g (f x)

infixl 10 _^ᶠ_
_^ᶠ_ : {A : Set} -> (A -> A) -> ℕ -> (A -> A)
f ^ᶠ zero = id
f ^ᶠ suc n = f ∘ f ^ᶠ n
```

<!-- Lapozz!-->Spoilers ⟱ <hr>



















































```agda
_+'_ : ℕ -> ℕ -> ℕ
_+'_ a = suc ^ᶠ a

_*'_ : ℕ -> ℕ -> ℕ
a *' b = (a +'_ ^ᶠ b) 0

_^'_ : ℕ -> ℕ -> ℕ
a ^' b = (a *'_ ^ᶠ b) 1
```
