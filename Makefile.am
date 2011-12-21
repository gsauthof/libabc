EXTRA_DIST =
CLEANFILES =
ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
AM_MAKEFLAGS = --no-print-directory

AM_CPPFLAGS = \
	-include $(top_builddir)/config.h \
	-I${top_srcdir} \
	-DSYSCONFDIR=\""$(sysconfdir)"\" \
	-DLIBEXECDIR=\""$(libexecdir)"\"

AM_CFLAGS = ${my_CFLAGS} \
	-fvisibility=hidden \
	-ffunction-sections \
	-fdata-sections

AM_LDFLAGS = \
	-Wl,--gc-sections \
	-Wl,--as-needed

SED_PROCESS = \
	$(AM_V_GEN)$(MKDIR_P) $(dir $@) && $(SED) \
	-e 's,@VERSION\@,$(VERSION),g' \
	-e 's,@prefix\@,$(prefix),g' \
	-e 's,@exec_prefix\@,$(exec_prefix),g' \
	-e 's,@libdir\@,$(libdir),g' \
	-e 's,@includedir\@,$(includedir),g' \
	< $< > $@ || rm $@

%.pc: %.pc.in Makefile
	$(SED_PROCESS)

LIBABC_CURRENT=2
LIBABC_REVISION=0
LIBABC_AGE=2

pkginclude_HEADERS = libabc/libabc.h
lib_LTLIBRARIES = libabc/libabc.la

libabc_libabc_la_SOURCES =\
	libabc/libabc-private.h \
	libabc/libabc.c

EXTRA_DIST += libabc/libabc.sym

libabc_libabc_la_LDFLAGS = $(AM_LDFLAGS) \
	-version-info $(LIBABC_CURRENT):$(LIBABC_REVISION):$(LIBABC_AGE) \
	-Wl,--version-script=$(top_srcdir)/libabc/libabc.sym
libabc_libabc_la_DEPENDENCIES = ${top_srcdir}/libabc/libabc.sym

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = libabc/libabc.pc
EXTRA_DIST += libabc/libabc.pc.in
CLEANFILES += libabc/libabc.pc

TESTS = test-libabc

check_PROGRAMS = test-libabc
test_libabc_SOURCES = test-libabc.c
test_libabc_LDADD = libabc/libabc.la
