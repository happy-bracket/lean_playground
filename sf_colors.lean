inductive rgb : Type
| red
| green
| blue
open rgb

inductive color : Type
| black
| white
| other : rgb → color
open color

def mono : color -> bool
| black := tt
| white := tt
| (other _) := ff

def is_red : color -> bool
| (other red) := tt
| _ := ff
