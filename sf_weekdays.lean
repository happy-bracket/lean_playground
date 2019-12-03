inductive day : Type
| monday
| tuesday
| wednesday
| thursday
| friday
| saturday
| sunday

def next_weekday : day -> day
| day.monday := day.tuesday
| day.tuesday := day.wednesday
| day.wednesday := day.thursday
| day.thursday := day.friday
| day.friday := day.saturday
| day.saturday := day.sunday
| day.sunday := day.monday

example : next_weekday (next_weekday day.saturday) = day.monday := rfl
