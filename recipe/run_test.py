from importlib.metadata import version
assert version("z3-solver").startswith('${{ version }}.')

import z3
x = z3.Real('x')
y = z3.Real('y')
s = z3.Solver()
s.add(x + y > 5, x > 1, y > 1)
print(s.check())
print(s.model())
