Return-Path: <linux-gpio+bounces-5414-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A61F8A2E31
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 14:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60A58B22030
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 12:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C36B56763;
	Fri, 12 Apr 2024 12:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="h3p4C1Rz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414DE56472
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 12:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712924901; cv=none; b=oZlwK4snCEgtPTVflIxkQXMFz827sy8Tkkpuhdplf1B0bVcSBNNtxL6kkX+Ou9z+87ucvBHublCNEr/N+a2CVZ/rmddCbyIHJdM/VLTuQNVKA2BATE9Jpoj3/v+bhC6302sFhH4sbPQNFTcsIcgVG+1x/XIlXiyWdRTClPr22Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712924901; c=relaxed/simple;
	bh=ARxS4dWSYre8JoC0fMpI7Ff2HUUC7hnXlqvFNzywc8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VCy/e2u3pStxV8ZOzI0q29hnL+Z19oaLQpqqevznIFCIVh0A1yUnVZqESjAGZnuDIDLHhINUMd+Jv3k/z3baH2LFxqvyYfCbe6Vn+aNGhgr0Ll+IKq4YHNrZ4vrpv4Yu5Ym1ykapNwpV8ReVPtt6YoWxvnEvPq3R9DMd51mGAwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=h3p4C1Rz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-418031b617bso2563975e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 05:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712924897; x=1713529697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MGYUbzbDXrGACpOL6OC+jvuT4aty+H817QFUU4QQQI=;
        b=h3p4C1RzPjdVfL85AMGP22Rb0rBt4jh1hjeWG/53+SlaA7WdVOvTkvnXrnmBcYEIiy
         kLWihtgqw3SqSOk5PUBL9XxPMeRNR5T4TxLnIXQrt2GAQuM1yLs5SPM3AI3U153AFCB/
         hjmof/mSEdscKAlXCljlmkWzTZ3Rl2XPmKkqrLUZlFgAfk+OKsFtTHDyJfbOuX7hYO+J
         a9hDlRL7X4fa66MGobsX72xVBQhKvqkj+6OxlHVPSg0dGnHIjUfE7iwf7m4b46HEiSbC
         /NmmEnVTsDvTEPq7Cu4EqcCDgdbtZQLBp1zejxVXv1rbImLSGK77Ym78YnWmYLkNgCA9
         SBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712924897; x=1713529697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MGYUbzbDXrGACpOL6OC+jvuT4aty+H817QFUU4QQQI=;
        b=epFYbiQEZwI52sOIN/0P+BbBRaHy7F27vRi/PTTsW9MjzPK/d2ATDWi61hBha8dF3A
         CedTOmcTG5ot6uC4YcrjgoXV2KcuzKXD1lucp5OTPch+ClD9LB+RxKSHljl2ZkWKaN4h
         pFcqNpl2rRyxCXQ3Glsyobr1Gh77h5a7EPHUlnSDy9c84KpnpEYvLhfJYk6jLrAh8Zqk
         zhGvENu6N2YnHKfU7IOMYVZ5X8N3JBhRyxk2+0MhbUStUwXo8qGOKLNITbldxTOS+5kY
         KGs1zbblrolhp0wf+LUhjfMFZCr/l/KY8wzCwGeCfDe2M7fnkIht7vANcEhDSXP8wUeH
         NkPw==
X-Gm-Message-State: AOJu0Yww+eurzEMIbHBx0GkKZDl6XoXWhFCZPsqz317TGLxPKtQ1rPnP
	zDwsIRqlctvPNAF8T20m+wWttLLzPHkjRjZH+PlIc/n2A39I2GXtApujGWuKH7s=
X-Google-Smtp-Source: AGHT+IHuHEZ3tyn+TFbHC6tVweIXvfWaTbhdXhyuodQIklZtHS+Q+m86tL5WOh/vYK/G6WXAbxv27w==
X-Received: by 2002:a05:600c:3544:b0:416:4de7:62c8 with SMTP id i4-20020a05600c354400b004164de762c8mr2230646wmq.12.1712924897550;
        Fri, 12 Apr 2024 05:28:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:3e87:b228:de9:1398])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm8752211wms.26.2024.04.12.05.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 05:28:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][RFC/RFT 03/18] bindings: glib: add build files
Date: Fri, 12 Apr 2024 14:27:49 +0200
Message-Id: <20240412122804.109323-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240412122804.109323-1-brgl@bgdev.pl>
References: <20240412122804.109323-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the directory structure and build files as well as changes to
.gitignore and Doxygen.in for GLib bindings.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .gitignore                           |  2 +
 Doxyfile.in                          |  4 +-
 bindings/Makefile.am                 |  7 +++
 bindings/glib/Makefile.am            | 78 ++++++++++++++++++++++++++++
 bindings/glib/examples/.gitignore    | 14 +++++
 bindings/glib/examples/Makefile.am   | 22 ++++++++
 bindings/glib/gpiod-glib.pc.in       | 14 +++++
 bindings/glib/gpiod-glib/Makefile.am | 18 +++++++
 bindings/glib/tests/.gitignore       |  4 ++
 bindings/glib/tests/Makefile.am      | 29 +++++++++++
 configure.ac                         | 24 +++++++++
 11 files changed, 215 insertions(+), 1 deletion(-)
 create mode 100644 bindings/glib/Makefile.am
 create mode 100644 bindings/glib/examples/.gitignore
 create mode 100644 bindings/glib/examples/Makefile.am
 create mode 100644 bindings/glib/gpiod-glib.pc.in
 create mode 100644 bindings/glib/gpiod-glib/Makefile.am
 create mode 100644 bindings/glib/tests/.gitignore
 create mode 100644 bindings/glib/tests/Makefile.am

diff --git a/.gitignore b/.gitignore
index cf66e97..c3a29d8 100644
--- a/.gitignore
+++ b/.gitignore
@@ -4,6 +4,8 @@
 *.o
 *.lo
 *.la
+generated-*.c
+generated-*.h
 doc
 *.pc
 *.tar.gz
diff --git a/Doxyfile.in b/Doxyfile.in
index 9c85e21..548a0da 100644
--- a/Doxyfile.in
+++ b/Doxyfile.in
@@ -46,7 +46,9 @@ WARN_FORMAT            =
 WARN_LOGFILE           =
 INPUT                  = @top_srcdir@/include/gpiod.h \
                          @top_srcdir@/bindings/cxx/gpiod.hpp \
-                         @top_srcdir@/bindings/cxx/gpiodcxx/
+                         @top_srcdir@/bindings/cxx/gpiodcxx/ \
+                         @top_srcdir@/bindings/glib/gpiod-glib.h \
+                         @top_srcdir@/bindings/glib/gpiod-glib/
 SOURCE_BROWSER         = YES
 INLINE_SOURCES         = NO
 REFERENCED_BY_RELATION = YES
diff --git a/bindings/Makefile.am b/bindings/Makefile.am
index 004ae23..a177187 100644
--- a/bindings/Makefile.am
+++ b/bindings/Makefile.am
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
 SUBDIRS = .
 
@@ -20,3 +21,9 @@ if WITH_BINDINGS_RUST
 SUBDIRS += rust
 
 endif
+
+if WITH_BINDINGS_GLIB
+
+SUBDIRS += glib
+
+endif
diff --git a/bindings/glib/Makefile.am b/bindings/glib/Makefile.am
new file mode 100644
index 0000000..750a913
--- /dev/null
+++ b/bindings/glib/Makefile.am
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+SUBDIRS = . gpiod-glib
+
+if WITH_TESTS
+
+SUBDIRS += tests
+
+endif
+
+if WITH_EXAMPLES
+
+SUBDIRS += examples
+
+endif
+
+lib_LTLIBRARIES = libgpiod-glib.la
+
+libgpiod_glib_la_SOURCES = \
+	chip.c \
+	chip-info.c \
+	edge-event.c \
+	error.c \
+	info-event.c \
+	internal.c \
+	internal.h \
+	line-config.c \
+	line-info.c \
+	line-request.c \
+	line-settings.c \
+	misc.c \
+	request-config.c
+
+EXTRA_DIST = \
+	generated-enums.c.template \
+	generated-enums.h.template
+
+project_headers = \
+	$(srcdir)/gpiod-glib/line.h \
+	$(srcdir)/gpiod-glib/edge-event.h \
+	$(srcdir)/gpiod-glib/info-event.h
+
+generated-enums.c: $(project_headers) generated-enums.c.template
+	$(AM_V_GEN)$(GLIB_MKENUMS) \
+		--symbol-prefix=G \
+		--template=$(srcdir)/generated-enums.c.template \
+		--output=$(builddir)/$@ \
+		$(project_headers)
+
+gpiod-glib/generated-enums.h: $(project_headers) generated-enums.h.template
+	$(AM_V_GEN)$(GLIB_MKENUMS) \
+		--symbol-prefix=G \
+		--template=$(srcdir)/generated-enums.h.template \
+		--output=$(srcdir)/$@ \
+		$(project_headers)
+
+nodist_libgpiod_glib_la_SOURCES = \
+	generated-enums.c \
+	gpiod-glib/generated-enums.h
+
+BUILT_SOURCES = $(nodist_libgpiod_glib_la_SOURCES)
+CLEANFILES = $(nodist_libgpiod_glib_la_SOURCES)
+
+libgpiod_glib_la_CFLAGS = -Wall -Wextra -g
+libgpiod_glib_la_CFLAGS += -I$(top_srcdir)/include/ -include $(top_builddir)/config.h
+libgpiod_glib_la_CFLAGS += $(GLIB_CFLAGS) $(GIO_CFLAGS) $(GIO_UNIX_CFLAGS)
+libgpiod_glib_la_CFLAGS += -DG_LOG_DOMAIN=\"gpiod-glib\"
+libgpiod_glib_la_CFLAGS += $(PROFILING_CFLAGS)
+libgpiod_glib_la_LDFLAGS = -version-info $(subst .,:,$(ABI_GLIB_VERSION))
+libgpiod_glib_la_LDFLAGS += -lgpiod -L$(top_builddir)/lib
+libgpiod_glib_la_LDFLAGS += $(GLIB_LIBS) $(GIO_LIBS) $(GIO_UNIX_LIBS)
+libgpiod_glib_la_LDFLAGS += $(PROFILING_LDFLAGS)
+
+include_HEADERS = gpiod-glib.h
+
+pkgconfigdir = $(libdir)/pkgconfig
+pkgconfig_DATA = gpiod-glib.pc
diff --git a/bindings/glib/examples/.gitignore b/bindings/glib/examples/.gitignore
new file mode 100644
index 0000000..c2415ae
--- /dev/null
+++ b/bindings/glib/examples/.gitignore
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+find_line_by_name_glib
+get_chip_info_glib
+get_line_info_glib
+get_line_value_glib
+get_multiple_line_values_glib
+reconfigure_input_to_output_glib
+toggle_line_value_glib
+toggle_multiple_line_values_glib
+watch_line_info_glib
+watch_line_value_glib
+watch_multiple_edge_rising_glib
diff --git a/bindings/glib/examples/Makefile.am b/bindings/glib/examples/Makefile.am
new file mode 100644
index 0000000..fb4e5b1
--- /dev/null
+++ b/bindings/glib/examples/Makefile.am
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+bin_PROGRAMS = \
+	find_line_by_name_glib \
+	get_chip_info_glib \
+	get_line_info_glib \
+	get_line_value_glib \
+	get_multiple_line_values_glib \
+	reconfigure_input_to_output_glib \
+	toggle_line_value_glib \
+	toggle_multiple_line_values_glib \
+	watch_line_info_glib \
+	watch_line_value_glib \
+	watch_multiple_edge_rising_glib
+
+AM_CFLAGS = -I$(top_srcdir)/bindings/glib/
+AM_CFLAGS += -include $(top_builddir)/config.h
+AM_CFLAGS += -Wall -Wextra -g -std=gnu89 $(GLIB_CFLAGS) $(GOBJECT_CFLAGS)
+AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiotools-glib\"
+LDADD = $(top_builddir)/bindings/glib/libgpiod-glib.la
+LDADD += $(GLIB_LIBS) $(GOBJECT_LIBS)
diff --git a/bindings/glib/gpiod-glib.pc.in b/bindings/glib/gpiod-glib.pc.in
new file mode 100644
index 0000000..5da56da
--- /dev/null
+++ b/bindings/glib/gpiod-glib.pc.in
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+prefix=@prefix@
+exec_prefix=@exec_prefix@
+libdir=@libdir@
+includedir=@includedir@
+
+Name: gpiod-glib
+Description: GObject bindings for libgpiod
+URL: @PACKAGE_URL@
+Version: @PACKAGE_VERSION@
+Libs: -L${libdir} -lgpiod-glib
+Cflags: -I${includedir}
diff --git a/bindings/glib/gpiod-glib/Makefile.am b/bindings/glib/gpiod-glib/Makefile.am
new file mode 100644
index 0000000..3d47772
--- /dev/null
+++ b/bindings/glib/gpiod-glib/Makefile.am
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+otherincludedir = $(includedir)/gpiod-glib
+otherinclude_HEADERS = \
+	chip.h \
+	chip-info.h \
+	edge-event.h \
+	error.h \
+	generated-enums.h \
+	info-event.h \
+	line.h \
+	line-config.h \
+	line-info.h \
+	line-request.h \
+	line-settings.h \
+	misc.h \
+	request-config.h
diff --git a/bindings/glib/tests/.gitignore b/bindings/glib/tests/.gitignore
new file mode 100644
index 0000000..8eb499f
--- /dev/null
+++ b/bindings/glib/tests/.gitignore
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+gpiod-glib-test
diff --git a/bindings/glib/tests/Makefile.am b/bindings/glib/tests/Makefile.am
new file mode 100644
index 0000000..a90587a
--- /dev/null
+++ b/bindings/glib/tests/Makefile.am
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+noinst_PROGRAMS = gpiod-glib-test
+gpiod_glib_test_SOURCES = \
+	helpers.c \
+	helpers.h \
+	tests-chip.c \
+	tests-chip-info.c \
+	tests-edge-event.c \
+	tests-info-event.c \
+	tests-line-config.c \
+	tests-line-info.c \
+	tests-line-request.c \
+	tests-line-settings.c \
+	tests-misc.c \
+	tests-request-config.c
+
+AM_CFLAGS = -I$(top_srcdir)/bindings/glib/
+AM_CFLAGS += -I$(top_srcdir)/tests/gpiosim-glib/
+AM_CFLAGS += -I$(top_srcdir)/tests/harness/
+AM_CFLAGS += -include $(top_builddir)/config.h
+AM_CFLAGS += -Wall -Wextra -g -std=gnu89 $(GLIB_CFLAGS) $(GIO_CFLAGS)
+AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiod-glib-test\"
+LDADD = $(top_builddir)/bindings/glib/libgpiod-glib.la
+LDADD += $(top_builddir)/tests/gpiosim/libgpiosim.la
+LDADD += $(top_builddir)/tests/gpiosim-glib/libgpiosim-glib.la
+LDADD += $(top_builddir)/tests/harness/libgpiod-test-harness.la
+LDADD += $(GLIB_LIBS) $(GIO_LIBS)
diff --git a/configure.ac b/configure.ac
index 3595071..fa486f4 100644
--- a/configure.ac
+++ b/configure.ac
@@ -31,6 +31,8 @@ AC_SUBST(ABI_CXX_VERSION, [3.0.1])
 # ABI version for libgpiosim (we need this since it can be installed if we
 # enable tests).
 AC_SUBST(ABI_GPIOSIM_VERSION, [1.1.0])
+# ... and another one for GLib bindings:
+AC_SUBST(ABI_GLIB_VERSION, [1.0.0])
 
 AC_CONFIG_AUX_DIR([autostuff])
 AC_CONFIG_MACRO_DIRS([m4])
@@ -245,6 +247,23 @@ then
 	fi
 fi
 
+AC_ARG_ENABLE([bindings-glib],
+	[AS_HELP_STRING([--enable-bindings-glib],[enable GLib 2.0 bindings [default=no]])],
+	[if test "x$enableval" = xyes; then with_bindings_glib=true; fi],
+	[with_bindings_glib=false])
+AM_CONDITIONAL([WITH_BINDINGS_GLIB], [test "x$with_bindings_glib" = xtrue])
+
+if test "x$with_bindings_glib" = xtrue
+then
+	PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.54])
+	PKG_CHECK_MODULES([GOBJECT], [gobject-2.0 >= 2.54])
+	PKG_CHECK_MODULES([GIO], [gio-2.0 >= 2.54])
+	PKG_CHECK_MODULES([GIO_UNIX], [gio-unix-2.0 >= 2.54])
+	PKG_PROG_PKG_CONFIG([0.28])
+	PKG_CHECK_VAR([GLIB_MKENUMS], [glib-2.0], [glib_mkenums], [],
+		AC_MSG_ERROR([glib-mkenums not found - needed to build GLib bindings]))
+fi
+
 AC_CHECK_PROG([has_doxygen], [doxygen], [true], [false])
 AM_CONDITIONAL([HAS_DOXYGEN], [test "x$has_doxygen" = xtrue])
 if test "x$has_doxygen" = xfalse
@@ -281,6 +300,11 @@ AC_CONFIG_FILES([Makefile
 		 bindings/cxx/gpiodcxx/Makefile
 		 bindings/cxx/examples/Makefile
 		 bindings/cxx/tests/Makefile
+		 bindings/glib/gpiod-glib.pc
+		 bindings/glib/Makefile
+		 bindings/glib/examples/Makefile
+		 bindings/glib/gpiod-glib/Makefile
+		 bindings/glib/tests/Makefile
 		 bindings/python/Makefile
 		 bindings/python/gpiod/Makefile
 		 bindings/python/gpiod/ext/Makefile
-- 
2.40.1


