Return-Path: <linux-gpio+bounces-7786-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE4F91C1B7
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 16:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FE361C20BAF
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 14:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A8E1C0DEC;
	Fri, 28 Jun 2024 14:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PKhUaIw+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F751C0048
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 14:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719586427; cv=none; b=J4GPGGfJHDbhScag3kC2Ncu8jXXryfPQS2MMP8IqKtpjIkFLolxkuqjcJ2apZT+tUd5BOg5z7X0tsW18aMOYbrIoBG4AaK0hwduAfjZua2NF679oiXjGfOR6y3tZBdWr8cXL5l0Tfn6HgH4aWdb2xyjvOhB6h316O5oRjLvj6vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719586427; c=relaxed/simple;
	bh=nx35SMGyCmGDoHSsGlRMPayVQHogftwsCObguTDAj6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D8eEUPR2dJIFP/Blyc+zT7Gro4yI4CFBqWrPpX1AMEwhuaMRBJMscnhSMCvYrqifFwSsXekiXsyevK8tlfX+lhTCfy9tfX4cgmgsviNH6jpkkc1V1mWArbwnkhbwaNcdXDgFkWoaNZwvm295rcouBMwn5NPNWxVpp5Xg3Or6GjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PKhUaIw+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4256788e13bso5402905e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 07:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719586424; x=1720191224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bhudZ7lKqVZB2QRIZFDSc9FQA2MNVAfGe2CqNxgvX4M=;
        b=PKhUaIw+JUNscVHRZbXQYv+7b5Drms3ReRm13gwloaLLesr8N1hdyvWC08gQr276WV
         sf4A2Fdkh0N5HmU0m5v8vci0w2QC3PbXLdwk6DDtITjGLZX46qqjkuZXt+tVzKX+q4+g
         RJ3FDT8BJPpqvuI4/5GcH5VBLH+dNgtc0/sv/MyIBzjsi+r7JjVmjyJsGE46OuJKpQDU
         1R72ht/0FQCHuQXEHX391GLPyc2BztfuRs+7jnTCN4YG2J6l1VfOUMt8h9iSWTgmPO77
         6n0L/BFVdcHEGqrf6wjsfBnQaPBRaKYWyeScQ/5qgZCmeq10M56sTmBARrbVMxMwit3K
         ZpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719586424; x=1720191224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhudZ7lKqVZB2QRIZFDSc9FQA2MNVAfGe2CqNxgvX4M=;
        b=tn+7fC+fUjs1AnFtY9eFwScAmqJU9/xA8ObNuQF0yPayvLZEl+bVvhoKnXWqqkuRtD
         eRGQDf/atiRxA5C01+DDOAb0E4uggVkmJhBdHNonlhgdX1JTeeLDVAlzubCF8tZKDsXP
         KMq8wq9ED9GhmchPXFhH36PsW7Vs04nZULFDm7SmfxS8kilp0oaUkvaOLB0w8orPFjOz
         WLBM8RAXwVcXn6zWqOX7L4r5DxYbMZkjV4iXSAiLz6R0394L1HIDEfImJ+lV/dvh+W5W
         X6o4ktA5SzZTjvax+VJSWLL5XJdJTtKt2VFXXIbZtAcDOH+pda6gal9vuI8CF/J8ET8l
         xtww==
X-Forwarded-Encrypted: i=1; AJvYcCW/zIv+Z2/gy9/0X13vL23ZCx5wPWcr4PTW7e6vISHDsfmR2t3O6cRjB5UsxoLXuFHeGSWgPjZONOu4N/XvdbMks5gMGQT/XEZSiQ==
X-Gm-Message-State: AOJu0Yw9SQdnH83At8olL/3I0vAR0ol2whCeyfLeq61OJ/Mbl8UkJlSJ
	EFjNTR/+2JL5g2neCrj9AKO1ked0J5iY7sPpwzSrahYg4NdK1NqrRzP6xuo0wQc=
X-Google-Smtp-Source: AGHT+IEAZ3dHzrZLTMLdUuEoOd50FdI/awNNIU62hPLxajJNkurtCbqOkJoJhGGSmP8EapImzsBHYw==
X-Received: by 2002:a05:600c:56cc:b0:421:7bed:5274 with SMTP id 5b1f17b1804b1-4248b95d0edmr131653585e9.10.1719586424271;
        Fri, 28 Jun 2024 07:53:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fba4fsm2518124f8f.85.2024.06.28.07.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:53:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 16:53:19 +0200
Subject: [PATCH libgpiod v2 03/18] bindings: glib: add build files
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-3-e42336efe2d3@linaro.org>
References: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: "As advised by Dan Carpenter - I'm CC'ing dbus"@lists.freedesktop.orgto, 
 linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10872;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7iHAWmvZxf8paOvWUKi12iHzBsy0F9vg70QLyYNBX0Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfs5x+F5p5XDUn/d4tnY3i9J/Pmu3GF7KLFAQt
 UOs2K3AOz+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn7OcQAKCRARpy6gFHHX
 cmBFEADYqmRjaKVC2jNgu8dLh8Io7mdUs4h1ouvBv3+tPjPbTAWEEJDtnwLP8N9Ga61bWDFSKCk
 7YwMxJVxjAiwBkjTK5pjxc4GRu6OwgUCTs+XYf0kQAJrjS7b2sHHAoYiudJK+D2ERj6aJHrWhp6
 S2lwu6AwxF2Z/u3twQRlFASAgzbGbkG0HIjgoZbK5FP+bE5o1k9K3C34ogcvvpaJu9YwIC7O26W
 lbyiYbk3VjE0XzUtnYhba6ieRgbCH/UIDynV2LgLNEss0UEcBDRkWoi/DK2OBJav8+Drx5HQWAm
 QUdJGvmGwS7YhmvmoigPFZYCTKKdRDST6CdTOAGR2fPdEedpFmkV5gbAxBu+SSjC5Xl7Fk7KxE9
 cFItf/oxkiDx0FULmBsvkEIDKx81L5Ap1JotxIjIwQlTT2OSMnd5cEYCmiC4/GLREaBd1XI0bGT
 qo6ZrK+1F05hpbGYgB72u4MTy7qUhs7wtCDlJxrN7a/K4UurcJCSLAyM51sVxcdEqmCl4tyRr3B
 Cv87RLZRuyjj1k6JqMV7mgU7GyP3KN/ZMdPv48lx3NIXFBzqLudJiZWYHCXXOYwtlArO2SMDJgW
 O26m/p9pO4YyWhTBsr8rJavwQdqBBUGVI8NZmi0qR175LTZ4B/7SbxagrrNrGqkRMiySW0Y89QR
 +3q+euCH5U7jOaQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the directory structure and build files as well as changes to
.gitignore and Doxygen.in for GLib bindings.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .gitignore                           |  2 +
 Doxyfile.in                          |  4 +-
 bindings/Makefile.am                 |  7 ++++
 bindings/glib/Makefile.am            | 78 ++++++++++++++++++++++++++++++++++++
 bindings/glib/examples/.gitignore    | 14 +++++++
 bindings/glib/examples/Makefile.am   | 22 ++++++++++
 bindings/glib/gpiod-glib.pc.in       | 14 +++++++
 bindings/glib/gpiod-glib/Makefile.am | 18 +++++++++
 bindings/glib/tests/.gitignore       |  4 ++
 bindings/glib/tests/Makefile.am      | 29 ++++++++++++++
 configure.ac                         | 24 +++++++++++
 11 files changed, 215 insertions(+), 1 deletion(-)

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
index 93d9d75..74ba004 100644
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
@@ -248,6 +250,23 @@ then
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
@@ -284,6 +303,11 @@ AC_CONFIG_FILES([Makefile
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
2.43.0


