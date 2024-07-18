Return-Path: <linux-gpio+bounces-8264-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C2C934AE5
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 11:28:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A997B222CE
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 09:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92318823CE;
	Thu, 18 Jul 2024 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xaYshmCD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166B681AC7
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721294922; cv=none; b=qZm242nRl63FTh3DIpVWeO/SrGvuOpsSsYbUD2YilZqIrZsawJWY0qc0onuw4Nv4nV5zQkBAeRZ5oJHnO05Yt56rFZlm1gU+al+gV9RM/GFQYMwBG/8leumv89GiUbW5eBqNl3aUCOathMIMxLJdiqX+NKeKHDER/sXKrwYfVrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721294922; c=relaxed/simple;
	bh=9IJF7u3k9VjBMNdJxw6+myAapa94V8je+wHgs1LGYw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJONZO13hs5F/iGEph3TVvuywO2L8jp4cOB+T1WOwH2ErwEtZexlKMRvrkfWjdX+00NRbpp6gNPOkc7yVeObwx0ZW3pkwH5+DQTBe1CktEy6JLYS2WkrpXKOK4dOab5IWoP1dzUrVDpBp1G2bYXQuFHWJUredXfjBn93yUmOGrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xaYshmCD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so842335e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 02:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721294918; x=1721899718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhd6l0SPbiOnmh49slS/vdQ0qXadf5oHmz0JSOPf4Lg=;
        b=xaYshmCDPC1vg5fiu0vCzfCdYoREc7slu5G+AxhFCndaNIxq/A98UA8UkR5xrAFPOT
         D1+/70s+A2NHjA8uwp4qkbkHQKKK4VPyueiTSLtLCysWSf9/+ZKzMadySptFInSooVet
         gSbxQlZUq+HVVWiiHnazHerKmetNuH6TOHAGoZuarYsQBTIeoebEbvRxAIupkACAXXar
         rsLcjCfryicYREPpcpF9XW/oFY3ACNzEVXGc8rW/Wj3kine+wbqltbwkOhZCL8cUJwvm
         rHJpRKaOjDCQHaVwalLmzy5ZgnrKTVd18VhbRNYUAjS6ZUO5DEt3VtJsf3IBmqEiur1R
         MGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721294918; x=1721899718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhd6l0SPbiOnmh49slS/vdQ0qXadf5oHmz0JSOPf4Lg=;
        b=WWWzyrt54J5GxcmJ4Rkl1MxZ2AMzPAQ3fW3eXd2fFKwU+1TK8vEjg9XZIMJU0P92JA
         XOyQxlBIyoogy+NtcTjUx8ESX9PTUVm1C3hTxT8/jMNuQO/syK2mszT7F3k9j6RpTJ8x
         LyYcRyw03DhO6UUf9ZmBSG0inkDAlZUL/Ftr+IUPsnkvJe7IFKbp0TTFyY1phoI3I5ty
         n8Z/mlvyrtqs74jhjJ1q6o/2i9nr+KzNHvNWRzSkDmTaUp/t52iZva9kGcetip6XTRZA
         xFKxXGtmOWEGr7llH77DmDPXd0v9zx/ycDhzW8TwcDL2T1mD7ThQjqJU+K8XYZyDI1py
         9b0w==
X-Gm-Message-State: AOJu0YyAhL4i+GIOKC298bRk7aqxbTwTQpJomC4QiZZrTea3m/E5+VF1
	cvEGjjQNEjQYJUd8BDFq7+Nn9VoGTOPgpjyTaCvl3YsN0E8rogtHG7v7c50yLnk=
X-Google-Smtp-Source: AGHT+IGinjGytdI+FEpwi2qSf74wR+zZyapUGR1+9jJ1i4B9ErL0EV4nx2pGVEDYojhEC6Zj0e9vKw==
X-Received: by 2002:a05:600c:4455:b0:426:5d4d:d759 with SMTP id 5b1f17b1804b1-427c2d01fa0mr36874195e9.24.1721294918193;
        Thu, 18 Jul 2024 02:28:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:58d4:2f84:5fcd:8259])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0489csm13792849f8f.104.2024.07.18.02.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:28:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Jul 2024 11:27:57 +0200
Subject: [PATCH libgpiod v3 03/18] bindings: glib: add build files
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-dbus-v3-3-c9ea2604f082@linaro.org>
References: <20240718-dbus-v3-0-c9ea2604f082@linaro.org>
In-Reply-To: <20240718-dbus-v3-0-c9ea2604f082@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12214;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zATcDbJoxluULhCGOEgspkEZFBkz6WCs6uEOVR463Gc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmmOA+HkUA0Zs88R+H4YE4v/9puobYEIAsAc5sQ
 O6+0ynjTjiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZpjgPgAKCRARpy6gFHHX
 cmfKD/9WWKTUyy0g7QRb6Ohic779SmR0oFnpbq2wTOmFZNpKvDWZ9D48wwMuOEWTJGq3cb2Yyu+
 70SqYqmwKvsP4PJT4EWcW/dPzptUB7xstLGbxnXgMoCnOnWOw9H21BYQybwOehuILKmxeacl6fa
 er6naor+KZvd1HZ/It14lCoYPwYhpk2Yh0xomRifWh/tvFZpHM6y1ch2kdbMJFfVkiwbZqpAa+o
 71NReXP1pFEyh8K5f1QWmXZBs5FXGP2PYAjnZKyognKiPx8H833d8Oca6RAHv8PSlSVnH9wRhiX
 YioCZ/6WHdEOWrQdWHq6fmV6HYDqdkerQfEZnkrlw7XH8BJBPCTAQRTh/ETRMj0bg4nwQXUFng9
 mcXEEe6BTVCzYst0VZPZKoHvWySbvqsJCcqH5XUaY4Rxeyrqfcz+I4e78CpuXWdAabD9AM4fIor
 dNPCyVCBLKtp3q3fFqI6MyXRdE699WEbsow91QWF8gEfrsaDv8ZxkcS8WimXYUfiSiW4MXlc7LZ
 /T/s5Mtry1knx8RXqk4qWao3aJjjzsjai3+X/9sysdEDkn+7zu3JuesrzhN56z2oznn7NCG0Rj4
 4Pv6G2RlT3khvZpAtdAU2SbpaKtwYxSvW97cVjV/cSI6XYn080JJbo/3oge4MI+fl8DF3fkAY5g
 z8ebeVp6H3ZQHIA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the directory structure and build files as well as changes to
.gitignore and Doxygen.in for GLib bindings.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .gitignore                           |   2 +
 Doxyfile.in                          |   4 +-
 bindings/Makefile.am                 |   7 +++
 bindings/glib/.gitignore             |   5 ++
 bindings/glib/Makefile.am            | 105 +++++++++++++++++++++++++++++++++++
 bindings/glib/examples/.gitignore    |  14 +++++
 bindings/glib/examples/Makefile.am   |  22 ++++++++
 bindings/glib/gpiod-glib.pc.in       |  15 +++++
 bindings/glib/gpiod-glib/Makefile.am |  18 ++++++
 bindings/glib/tests/.gitignore       |   4 ++
 bindings/glib/tests/Makefile.am      |  29 ++++++++++
 configure.ac                         |  30 ++++++++++
 12 files changed, 254 insertions(+), 1 deletion(-)

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
diff --git a/bindings/glib/.gitignore b/bindings/glib/.gitignore
new file mode 100644
index 0000000..9a7d424
--- /dev/null
+++ b/bindings/glib/.gitignore
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+*.gir
+*.typelib
diff --git a/bindings/glib/Makefile.am b/bindings/glib/Makefile.am
new file mode 100644
index 0000000..0f571c1
--- /dev/null
+++ b/bindings/glib/Makefile.am
@@ -0,0 +1,105 @@
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
+INTROSPECTION_GIRS = gpiod-glib.gir
+
+girdir = $(INTROSPECTION_GIRDIR)
+gir_DATA = gpiod-glib.gir
+
+typelibsdir = $(INTROSPECTION_TYPELIBDIR)
+typelibs_DATA = gpiod-glib.typelib
+
+gpiod_gir_SCANNERFLAGS = \
+	--c-include="gpiod-glib.h" \
+	--warn-all \
+	--namespace Gpiodglib \
+	--identifier-prefix Gpiodglib \
+	--symbol-prefix gpiod
+
+gpiod_glib_gir_CFLAGS = $(libgpiod_glib_la_CFLAGS)
+
+gpiod-glib.gir: libgpiod-glib.la
+gpiod_glib_gir_INCLUDES = Gio-2.0
+gpiod_glib_gir_LIBS = libgpiod-glib.la
+gpiod_glib_gir_FILES = $(libgpiod_glib_la_SOURCES)
+gpiod_glib_gir_EXPORT_PACKAGES = gpiod-glib
+
+include $(INTROSPECTION_MAKEFILE)
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
index 93d9d75..85d6984 100644
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
@@ -248,6 +250,29 @@ then
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
+# GObject-introspection
+found_introspection=no
+m4_ifdef([GOBJECT_INTROSPECTION_CHECK],
+	[GOBJECT_INTROSPECTION_CHECK([0.6.2])],
+	[AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" = "xyes")])
+
 AC_CHECK_PROG([has_doxygen], [doxygen], [true], [false])
 AM_CONDITIONAL([HAS_DOXYGEN], [test "x$has_doxygen" = xtrue])
 if test "x$has_doxygen" = xfalse
@@ -284,6 +309,11 @@ AC_CONFIG_FILES([Makefile
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


