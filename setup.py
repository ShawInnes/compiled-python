from distutils.core import setup
from Cython.Distutils import build_ext
from Cython.Build import cythonize


def test():
    print("Hello World!")


setup(
    name='Hello Flask',
    cmdclass={'build_ext': build_ext},
    ext_modules=cythonize("src/api.pyx",
                          compiler_directives={'language_level': "3"},
                          build_dir="build"
                          )
)
