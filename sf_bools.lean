inductive bool' : Type
| true' | false'

open bool'

def or' : bool' -> bool' -> bool'
| true' _ := true'
| _ true' := true'
| _ _ := false'

infixr `||` := or'

example : true' || false' = true' := rfl
example : true' || true' = true' := rfl
example : false' || false' = false' := rfl
example : false' || true' = true' := rfl

def and' : bool' -> bool' -> bool'
| false' _ := false'
| true' false' := false'
| _ _ := true'

infixr `&&` := and'

def not' : bool' → bool'
| true' := false'
| _ := true'
