EXTRA_DIST =
CLEANFILES =
ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
AM_MAKEFLAGS = --no-print-directory

AM_CPPFLAGS = \
	-include $(top_builddir)/config.h \
	-DSYSCONFDIR=\""$(sysconfdir)"\" \
	-DLIBEXECDIR=\""$(libexecdir)"\" \
	-I${top_srcdir}/src

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

pkginclude_HEADERS = src/abc/libabc.h
lib_LTLIBRARIES = src/libabc.la

src_libabc_la_SOURCES =\
	src/libabc-private.h \
	src/libabc.c

EXTRA_DIST += src/libabc.sym

src_libabc_la_LDFLAGS = $(AM_LDFLAGS) \
	-version-info $(LIBABC_CURRENT):$(LIBABC_REVISION):$(LIBABC_AGE) \
	-Wl,--version-script=$(top_srcdir)/src/libabc.sym
src_libabc_la_DEPENDENCIES = ${top_srcdir}/src/libabc.sym

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = src/libabc.pc
EXTRA_DIST += src/libabc.pc.in
CLEANFILES += src/libabc.pc

TESTS = src/test-libabc

check_PROGRAMS = src/test-libabc
src_test_libabc_SOURCES = src/test-libabc.c
src_test_libabc_LDADD = src/libabc.la
