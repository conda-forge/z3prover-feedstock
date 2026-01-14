import os
import importlib.metadata
import z3

PKG_VERSION = os.environ["PKG_VERSION"]
PKG_NAME = os.environ["PKG_NAME"]


def test_version():
    """Verify various versions agree (if are not the same): seems to be a trailing digit."""
    module_version = importlib.metadata.version(PKG_NAME)
    libz3_version = z3.get_version_string()
    print(f"{PKG_NAME} module version:", module_version)
    print("libz3 version:", libz3_version)
    assert module_version.startswith(f"{PKG_VERSION}.")
    assert libz3_version == PKG_VERSION


def test_z3():
    """Verify simple smoke test, adapted from upstream example."""
    s = z3.Solver()
    x, y = z3.Real("x"), z3.Real("y")
    s.add(x + y > 5, x > 1, y > 1)
    print(s.check())
    print(s.model())
