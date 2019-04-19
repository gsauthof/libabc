# 2019, Georg Sauthoff <mail@gms.tf>
# Public Domain

project('libabc', 'c')

version   = '4.0.0'
soversion = '4'

cc        = meson.get_compiler('c')
conf_data = configuration_data()

conf_data.set_quoted('VERSION', soversion)
if cc.has_function('__secure_getenv', prefix : '#include <stdlib.h>')
    conf_data.set('HAVE___SECURE_GETENV', '1')
endif
if cc.has_function('secure_getenv', prefix : '''#define _GNU_SOURCE
     #include <stdlib.h>''')
    conf_data.set('HAVE_SECURE_GETENV', '1')
endif

configure_file(
    output        : 'config.h',
    configuration : conf_data,
)

add_project_arguments('-D_GNU_SOURCE', language: 'c')

wflags = [ '-Wall',
    '-Wchar-subscripts',
    '-Wformat-security',
    '-Wmissing-declarations',
    '-Wmissing-prototypes',
    '-Wnested-externs',
    '-Wpointer-arith',
    '-Wshadow',
    '-Wsign-compare',
    '-Wstrict-prototypes',
    '-Wtype-limits' ]
add_project_arguments(cc.get_supported_arguments(wflags), language: 'c')


libabc = library('abc', 'src/libabc.c',
    include_directories : ['src'],
    version             : version,
    soversion           : soversion,
    install             : true,
    link_args           : ('-Wl,--version-script,@0@/src/libabc.sym'
                          .format(meson.current_source_dir()))
)

install_headers('src/abc/libabc.h', subdir: 'abc')


pkg = import('pkgconfig')

pkg.generate(
    libraries   : [libabc],
    version     : version,
    name        : meson.project_name(),
    filebase    : meson.project_name(),
    description : 'Library for something with abc'
)

test_libabc = executable('test-libabc', 'src/test-libabc.c',
    link_with: [ libabc ],
    include_directories : ['src']
)
    
test('libabc', test_libabc, timeout: 100)

