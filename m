Return-Path: <linux-gpio+bounces-8626-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C875794A3CA
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A6861F22C1C
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F591CCB4A;
	Wed,  7 Aug 2024 09:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yvvMfjj7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5031A1CCB40
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 09:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021851; cv=none; b=oCVqJX8g9MnxwAb6JiZn7gStfiU7QWhcfHCKdOf6MTICt4xSEKNxvnLQNVFslxSDoD62w06uOJm0hJGMvvsUENboVpuNUEMb6DcsuijVBdBKKGuju1G2Rgxi4ohWTUu9e4Ji6k2msjgbGdM50OyM0BjCtQARyDjQAFMVTKAQchI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021851; c=relaxed/simple;
	bh=M7BzYNzswDegV/EPZzkFJ6rIb+PLFWbu3HlzNer8mBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r4nMr7oOVGD7J7m5GCmt+qpF1ptX+9PUVcByRPAsv4lKBPLjXaK+Bpa0b1JA3sCzTTqmt90vEnqiNl2I03ZR40fxb+tvgQAJnL4vn7kXNW7o4m3nKeKEuG98bHVxYygcKIMqmLXP7UeMo4zh6rI3OtoayKlS+IE8/uLwSk/j6ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yvvMfjj7; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52fc4388a64so2005498e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2024 02:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723021847; x=1723626647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEK2A+GmCMH7zi/jRLrexqlL+pcwjeyIYU7Mz21dDMc=;
        b=yvvMfjj7HK3rXIyXUq8r8laYkigSGSLZp/3nCm+9Sg7VfRVxPteCk1VZtsR6iKpoo5
         m8VbQBrpA0MYSqhfhQ8J7UJ01XNHv8A+xKwm/3NGhKfyGtcpF4y0TH3jcFYI9jcdcsvt
         klxjH8ALi/Skya9Pz4b1rcygPBt/kOd4b7dz+F6ZiFl+JxZlGb5tgZe6K+qUi8gUIyAm
         g5pVxGC4iaZI/eOISoRWXbCAcwBAH+5S4T1hdaRl9K0xph/ftOjoDnt81It+bdMATUZL
         T/nqfqWxDydLz4BRETkC+Bit0S2k+qHFv2E5Mvy0VGSEFWhJLXh+2pDlRXLzsW2kwzfn
         +jNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021847; x=1723626647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEK2A+GmCMH7zi/jRLrexqlL+pcwjeyIYU7Mz21dDMc=;
        b=e4u5B7Io/7Ovu7TqDDQndRH2j+z3n9N8mErk8t77Natvmmjl7goOte6WkWbtwcdS8r
         RSgAOtA0k43zMQySOw0by/DyTfbdrKNlLRK9GWlO7Nw+56ZKF3BemnYAQ8+vrGbTp9JP
         KkvIGfvSQAose4Iz1eu9GF+aimozyAnkqnCRu6mKlZM+oXwMrQ++HnTOpdwlykmRveOJ
         eI84QZlIlFj/DUKewObk3FE/aTMSXKbmfZL6K+PvOSu4xK296GIjPwgM13BKBePg7FE3
         27mXtOI+kj7HKv2FIYkW27BHhmwqfQbJqpR6rItvy867WAdg94d2XR0A57GuWJleInkm
         PrvQ==
X-Gm-Message-State: AOJu0YytGBZcqaU5tPAm67b00FF2Ol4End4kTmZG8NQLYR9YTJyITAzj
	G4hQ8yVgDYV0ts7iHwC8ZsAsXpO64jOi05zVo5ECuWF6BVbaxjoo8A3cey4n5dM=
X-Google-Smtp-Source: AGHT+IGRFh6KtsV1Gdj+CFEJBlj3tBbTVZ4Ho/tNI5hl7J/0oqnT39ysCrCZswjj+UeOUMEQXTpa3g==
X-Received: by 2002:a05:6512:4002:b0:52f:79f8:a42e with SMTP id 2adb3069b0e04-530bb36bd82mr13708784e87.4.1723021847227;
        Wed, 07 Aug 2024 02:10:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a3e7:be71:fe4f:c360])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059cd2b3sm18936355e9.44.2024.08.07.02.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:10:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 07 Aug 2024 11:10:34 +0200
Subject: [PATCH libgpiod v4 03/18] bindings: glib: add build files
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-dbus-v4-3-64ea80169e51@linaro.org>
References: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
In-Reply-To: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11670;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hCPightF2v5zvwlMII+krMKSbabnFlgCPs/PuZGcmaQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmszoQMKXkUxOnJYwMeFkwymnSqwzVjCHtvih6d
 8Rx4PeArSKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrM6EAAKCRARpy6gFHHX
 cn/YEADCxUQVuMxKChZu3VvqFvPgpAmbiL9IUoPKwWGE2lbEHrM+ovHAAZpAQW+QJvAQDY5dI4i
 ar/5UfliaP780TIZRBEtUBtcbBtr/2QuMq/ZW8IwulREsVyUqDb2kF+TghCmKy4X3L8mMgERVIv
 iE9f91mZ8rLOK/c6VzP+UQtZrvvQl4AORozq2hRrNreLhIAMA8oez5tT4Y4AvUPZbCSQJ72oyNY
 e2Fflc74NmSPS4v6cquFkHA3CUO0m+YNw8JZgOAkvMirVNlo+0CHONTTg6T31p4x+AJJ8dxh51K
 1RH31kE2wvshbCiUFFyyQkm2wjOL1Gll6A2LWdYxwx3aehDJGbb68BvrULgPWp0XOsJ5Bif2j9w
 VasMPxxnosNKTtv4onw1Uq7jyQOLhQayfDI/L3DG25UaqRnCEnIdqPbXAvqqwiD+laddBTNtic0
 rEx4a7fDFrm4yGBAaEf2MckBE9PNdf33lHFUBGwng9J83oYyaywFQmGltV8tx3NeTT9TzhVJNOK
 Cfl6SkZYscBsJPhodxxLas9RvJiH/FIUWRmxjdZJS5+YpWXUvQZsr1IDE0SjP2Zdpsap0E3BJtd
 sXhMUtfB1vSxyqBgg/rTdbxzVhovnzt9VhlnFFLyZOteu5G7MSiwNX3+UVm6ooFk8cv1GZYF8Uq
 C6FmTvNTVwgQr3A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the directory structure and build files as well as changes to
.gitignore and Doxygen.in for GLib bindings.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .gitignore                         |   2 +
 bindings/Makefile.am               |   7 ++
 bindings/glib/.gitignore           |   6 ++
 bindings/glib/Makefile.am          | 131 +++++++++++++++++++++++++++++++++++++
 bindings/glib/examples/.gitignore  |  14 ++++
 bindings/glib/examples/Makefile.am |  22 +++++++
 bindings/glib/gpiod-glib.pc.in     |  15 +++++
 bindings/glib/tests/.gitignore     |   4 ++
 bindings/glib/tests/Makefile.am    |  29 ++++++++
 configure.ac                       |  36 ++++++++++
 10 files changed, 266 insertions(+)

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
diff --git a/bindings/glib/.gitignore b/bindings/glib/.gitignore
new file mode 100644
index 0000000..aa399b8
--- /dev/null
+++ b/bindings/glib/.gitignore
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+*.gir
+*.typelib
+Gpiodglib-1.0
diff --git a/bindings/glib/Makefile.am b/bindings/glib/Makefile.am
new file mode 100644
index 0000000..6ecef94
--- /dev/null
+++ b/bindings/glib/Makefile.am
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+SUBDIRS = .
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
+otherincludedir = $(includedir)/gpiod-glib
+otherinclude_HEADERS = \
+	gpiod-glib/chip.h \
+	gpiod-glib/chip-info.h \
+	gpiod-glib/edge-event.h \
+	gpiod-glib/error.h \
+	gpiod-glib/generated-enums.h \
+	gpiod-glib/info-event.h \
+	gpiod-glib/line.h \
+	gpiod-glib/line-config.h \
+	gpiod-glib/line-info.h \
+	gpiod-glib/line-request.h \
+	gpiod-glib/line-settings.h \
+	gpiod-glib/misc.h \
+	gpiod-glib/request-config.h
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
+		--template=$(srcdir)/generated-enums.c.template \
+		--output=$(builddir)/$@ \
+		$(project_headers)
+
+gpiod-glib/generated-enums.h: $(project_headers) generated-enums.h.template
+	$(AM_V_GEN)$(GLIB_MKENUMS) \
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
+
+if HAVE_INTROSPECTION
+
+INTROSPECTION_GIRS = Gpiodglib-1.0.gir
+
+girdir = $(INTROSPECTION_GIRDIR)
+gir_DATA = Gpiodglib-1.0.gir
+
+typelibsdir = $(INTROSPECTION_TYPELIBDIR)
+typelibs_DATA = Gpiodglib-1.0.typelib
+
+Gpiodglib_1_0_gir_SCANNERFLAGS = \
+	--c-include="gpiod-glib.h" \
+	--warn-all \
+	--namespace Gpiodglib \
+	--identifier-prefix Gpiodglib \
+	--symbol-prefix gpiodglib
+
+Gpiodglib_1_0_gir_CFLAGS = \
+	$(libgpiod_glib_la_CFLAGS) \
+	-DGPIODGLIB_COMPILATION
+
+Gpiodglib-1.0.gir: libgpiod-glib.la
+Gpiodglib_1_0_gir_INCLUDES = Gio-2.0
+Gpiodglib_1_0_gir_LIBS = libgpiod-glib.la
+Gpiodglib_1_0_gir_FILES = $(otherinclude_HEADERS) $(libgpiod_glib_la_SOURCES)
+Gpiodglib_1_0_gir_EXPORT_PACKAGES = gpiod-glib
+
+include $(INTROSPECTION_MAKEFILE)
+
+endif
+
+if HAS_GI_DOCGEN
+
+doc: Gpiodglib-1.0.gir
+	$(AM_V_GEN)gi-docgen generate Gpiodglib-1.0.gir
+.PHONY: doc
+
+endif
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
index 0000000..15d2b3f
--- /dev/null
+++ b/bindings/glib/gpiod-glib.pc.in
@@ -0,0 +1,15 @@
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
+Requires.private: libgpiod >= 2.1
+Libs: -L${libdir} -lgpiod-glib
+Cflags: -I${includedir}
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
index 93d9d75..31cb8d1 100644
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
@@ -248,6 +250,36 @@ then
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
+
+	AC_CHECK_PROG([has_gi_docgen], [gi-docgen], [true], [false])
+	AM_CONDITIONAL([HAS_GI_DOCGEN], [test "x$has_gi_docgen" = xtrue])
+	if test "x$has_gi_docgen" = xfalse
+	then
+		AC_MSG_NOTICE([gi-docgen not found - GLib documentation cannot be generated])
+	fi
+fi
+
+# GObject-introspection
+found_introspection=no
+m4_ifdef([GOBJECT_INTROSPECTION_CHECK],
+	[GOBJECT_INTROSPECTION_CHECK([0.6.2])],
+	[AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" = "xyes")])
+
 AC_CHECK_PROG([has_doxygen], [doxygen], [true], [false])
 AM_CONDITIONAL([HAS_DOXYGEN], [test "x$has_doxygen" = xtrue])
 if test "x$has_doxygen" = xfalse
@@ -284,6 +316,10 @@ AC_CONFIG_FILES([Makefile
 		 bindings/cxx/gpiodcxx/Makefile
 		 bindings/cxx/examples/Makefile
 		 bindings/cxx/tests/Makefile
+		 bindings/glib/gpiod-glib.pc
+		 bindings/glib/Makefile
+		 bindings/glib/examples/Makefile
+		 bindings/glib/tests/Makefile
 		 bindings/python/Makefile
 		 bindings/python/gpiod/Makefile
 		 bindings/python/gpiod/ext/Makefile

-- 
2.43.0


