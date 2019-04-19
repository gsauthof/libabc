This Repository is a fork of
https://git.kernel.org/pub/scm/linux/kernel/git/kay/libabc.git
that adds [Meson][1] build support.

See `meson.build` for details.

## Build Example

    mkdir build
    cd build
    meson --prefix $HOME/local/libabc --buildtype=debug
    ninja
    ninja test
    ninja install
    ninja dist

## Comparison with Autotools

The `meson.build` pretty much yields the same results as the existing autotools
configuration. But it's more concise and arguably more developer friendly:

    $ wc -l autogen.sh configure.ac Makefile.am src/libabc.pc.in | tail -1
    187 total
    $ wc -l meson.build 
    70 meson.build


2019, Georg Sauthoff <mail@gms.tf>

[1]: https://mesonbuild.com
