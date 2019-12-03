namespace nat_pg

inductive nat' : Type
| zero : nat'
| succ : nat' → nat'
open nat_pg.nat'

def dec : nat' → nat'
| zero := zero
| (succ n) := n

def inc : nat' → nat' := succ

def plus : nat' → nat' → nat'
| x zero := x
| x (succ y) := plus (inc x) y 

def minus : nat' → nat' → nat'
| x zero := x
| zero _ := zero
| (succ x) (succ y) := minus x y

def leanify : nat' → nat
| zero := 0
| (succ n) := leanify n + 1

def deleanify : nat → nat'
| 0 := zero
| (n + 1) := inc (deleanify n)

def ledel : (nat' → nat') → (nat → nat) := λf, leanify ∘ f ∘ deleanify
def ledel2 : (nat' → nat' → nat') → (nat → nat → nat) := λf, λx y, leanify (f (deleanify x) (deleanify y))

def ldec := ledel dec
def linc := ledel inc
def lplus : nat → nat → nat := ledel2 plus
def lminus := ledel2 minus

#reduce lplus 5 2
#reduce lminus 5 3

end nat_pg
