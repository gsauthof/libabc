AC_PREREQ(2.60)
AC_INIT([libabc],
	[1],
	[libabc-devel@example.com],
	[libabc],
	[http://www.example.com/libs/libabc/])
AC_CONFIG_SRCDIR([libabc/libabc.c])
AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE([check-news foreign 1.11 -Wall -Wno-portability silent-rules tar-pax dist-bzip2 subdir-objects])
AC_DISABLE_STATIC
AC_USE_SYSTEM_EXTENSIONS
AC_SYS_LARGEFILE
AC_CONFIG_MACRO_DIR([m4])
AM_SILENT_RULES([yes])
LT_INIT
AC_PREFIX_DEFAULT([/usr])

AC_ARG_ENABLE([logging],
	AS_HELP_STRING([--disable-logging], [disable system logging]),
	[], enable_logging=yes)
if test "x$enable_logging" = "xyes"; then
	AC_DEFINE(ENABLE_LOGGING, [1], [System logging.])
fi

AC_ARG_ENABLE([debug],
	AS_HELP_STRING([--enable-debug], [enable debug messages]),
	[], [enable_debug=no])
if test "x$enable_debug" = "xyes"; then
	AC_DEFINE(ENABLE_DEBUG, [1], [Debug messages.])
fi

AC_CONFIG_HEADERS(config.h)
AC_CONFIG_FILES([
	Makefile
	libabc/libabc.pc
])

AC_OUTPUT
AC_MSG_RESULT([
	libabc $VERSION
	========

	prefix:			${prefix}
	sysconfdir:		${sysconfdir}
	libdir:			${libdir}
	includedir:		${includedir}

	compiler:		${CC}
	cflags:			${CFLAGS}
	ldflags:		${LDFLAGS}

	logging:		${enable_logging}
	debug:			${enable_debug}
])
