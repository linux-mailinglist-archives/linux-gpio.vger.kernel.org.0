Return-Path: <linux-gpio+bounces-8717-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E584B94E86C
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 10:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BE7328282B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 08:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84022167DA4;
	Mon, 12 Aug 2024 08:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dSPf+MQE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21B91876
	for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2024 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723450971; cv=none; b=UN98Z3rvOwjqEga1Cy6o3ifZ4lmaCqbmaWCV5+FmYvfBNmtUkau/JE0IeEGUOZQPd1HnqhdLrx+0LR8R6sbBw0DmsU6gdJgadgn/D0cCUNL4Jik764rU106YATJBtkb3kZC1AMA2L4uG5+l4YY5VrinobZ+C8gUYQNUWjVxGsOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723450971; c=relaxed/simple;
	bh=fK5fr5Mjux3l9AtI4sBgo36BsCK3FbTIw15b802+VN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BjeqGsvadvSNUoLXletrQOjWoh19ds0Zznizov9aL07pxTB+yBPHX1y+geEJqVXQTqbZKk4lZOsRUQt9nDOMlJdfuXzZGhgoOPr69EEMnp9tqT6+IiXRLHKJDfVS5UwvUDLwq9O0Okrjv+OrrD75eFYdz1wg3Z9EHNasBb9Amnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dSPf+MQE; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52efd08e6d9so5090575e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2024 01:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723450959; x=1724055759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8p53qbmAoY2pO9MO01SIRMMMp+oAQBszCpGrgSeELj0=;
        b=dSPf+MQElecg2MOkyy4ty1DF9qR4nlxyJfhRRllwzqHzfzl9JVtQ/62w4PLXwxmL84
         3Kt7X7pzdLBxECyWQaVsF2Zp9z2YQJ6tBV5rFzx30T/pABW/VTulgbOq4Y870oO69KBU
         1UTZZinnGmwTaZFrysA8VGUO2CRps20PLrasuQtA0LX4dH9M2+qL1Qv8kufFwCilfq/J
         iAX9EZW8mw4LarGV6gddJGI9okTbtf4HUY5tq3sBfr3AJvRy7dS/8s5+aLyvjz1sGIwK
         x41oqJsg7tL493zauDePxVKBW5UcaAHeH18X99YTK24jcjSDdmiThsHWFpgKXwRggVJX
         JWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723450959; x=1724055759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8p53qbmAoY2pO9MO01SIRMMMp+oAQBszCpGrgSeELj0=;
        b=Ihj9o52PFuffREemMsquQHIaTfcIH1s/7Y+/are6nuOJhA139hS3T27/fKUn4Zleqf
         gdrjjFv+ysUQkw+j6qfii91g4mO4O1yHprv0DyWcxYL8nWd8y/UiY80qlQjKCrwS0Tob
         YCl/e/LdFHu17f/IhOZcd7/Lyxc+nCJrJ861HMhYrchzh+3FVCzhk+I7PdMosdkFzlbI
         OolMd70Oeq4EMcxc4+nn/IPGaJfOGBscYebreBl8MXq0pzlcPnBsBvs3svDNLv0WAXvY
         UtdPAXfihXJbKUr2heB6pli6oRQA2O7cqJzUYSiTM0juJq/vDhQTHRku23rwlvZFtF4J
         C4Og==
X-Gm-Message-State: AOJu0YyO+vPj/t03cle3wVy7+Oid1mFivX/5jHaQmmnUMKyyA/yHgfGB
	pvIYHQXjJE0NQShByyRzVCD6/t7l54p1vXx/uAcDkJbQfaPNK8RyetN3vfx4o6I=
X-Google-Smtp-Source: AGHT+IFwMIzxHaevV+vXfSyUdMxJ9qSZHa2BKWPWngolze320NzDuO023cCp71cv7YSuq4EV70Xw8Q==
X-Received: by 2002:a05:6512:104c:b0:530:e1f6:6ed6 with SMTP id 2adb3069b0e04-530ee96c04fmr6528666e87.10.1723450957287;
        Mon, 12 Aug 2024 01:22:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d7d3:597b:b219:7ba5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c74ff9fsm179059555e9.28.2024.08.12.01.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 01:22:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 12 Aug 2024 10:22:24 +0200
Subject: [PATCH libgpiod v5 3/4] bindings: add GLib bindings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240812-dbus-v5-3-ead288509217@linaro.org>
References: <20240812-dbus-v5-0-ead288509217@linaro.org>
In-Reply-To: <20240812-dbus-v5-0-ead288509217@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=261357;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=r7MS07p202whR6OSqQhGtxHoFG8xV1zWXnsEC9a0sRM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmucZJ0sT9GYuZ9oo3JjgtXmjSN6ME5rOElLbSc
 VtBVrXRiuaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrnGSQAKCRARpy6gFHHX
 clmOEACkizavuyEho6AtyU5Z2uBFQ78/bnTgRvV8mvW71XtOA2hOeF6Em+tEv8Q0ZLoNoveQLnB
 eq4dEqm9A2gUgU8Sc3kOSi5A/EXQ1HiHyHlR8+sczjNgNy6bQRFTzt2vk9chHf64bXJFBU2QcZH
 zbltVzcvIItknLe8V7gqjzKI19u8CsMAYHhAV5xz165Iniwk0BN3WP3f5TnUs6f7N2zfnmS0oor
 FA0vP3XSdo9+zDzuNrj6PDbFquTGmnlcY3R/WZoL2kW/nNgldc9b4puJ/+qeFRpZGHBCjkSeJOe
 o3PuCiynSgqBS8RcuNQmJj3EsHJcOzEg7O0ofquiDKctpH0tlIO8fiTTDeGFGW8RbswfZycZUnV
 8W44D3qjGJt55nsWuNRd/+WdkKGZQQx1MLNCwDmVNHy4D5PUQIa1lhZEcdziZiCFt6v2vKjDbUV
 om9v8afCLoKBe0qqsj/hchV3sK14Iteil/fWqd4cDzp05SRR6q/8nLygBJohZ/3MKYGhCoJhnKb
 LSgA+E5lGNASEBPnl/NL8zSS4omGeGrVmJUwbOzw087k0rqI1eSbvvIMxMxUOTsCMQJYHKAIQ1R
 g87NpQugL+NGU1hkH72eKRMh6cvZjqQ2PuqTe7xf7PsNHRdfmbSS3W3qxPEHyTF+02K59T0cJtC
 d+NKw5S2RmtcE/Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Implement GObject-based GLib bindings for libgpiod. Include generating
GObject introspection data, tests and examples.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .gitignore                                         |   2 +
 README                                             |   9 +-
 bindings/Makefile.am                               |   7 +
 bindings/glib/.gitignore                           |   6 +
 bindings/glib/Makefile.am                          | 131 ++++
 bindings/glib/chip-info.c                          | 129 ++++
 bindings/glib/chip.c                               | 397 ++++++++++++
 bindings/glib/edge-event.c                         | 186 ++++++
 bindings/glib/error.c                              |  67 ++
 bindings/glib/examples/.gitignore                  |  14 +
 bindings/glib/examples/Makefile.am                 |  22 +
 bindings/glib/examples/find_line_by_name_glib.c    |  71 +++
 bindings/glib/examples/get_chip_info_glib.c        |  42 ++
 bindings/glib/examples/get_line_info_glib.c        |  80 +++
 bindings/glib/examples/get_line_value_glib.c       |  68 ++
 .../glib/examples/get_multiple_line_values_glib.c  |  73 +++
 .../examples/reconfigure_input_to_output_glib.c    | 104 +++
 bindings/glib/examples/toggle_line_value_glib.c    |  99 +++
 .../examples/toggle_multiple_line_values_glib.c    | 132 ++++
 bindings/glib/examples/watch_line_info_glib.c      |  63 ++
 bindings/glib/examples/watch_line_value_glib.c     |  91 +++
 .../examples/watch_multiple_edge_rising_glib.c     |  95 +++
 bindings/glib/generated-enums.c.template           |  43 ++
 bindings/glib/generated-enums.h.template           |  30 +
 bindings/glib/gpiod-glib.h                         |  22 +
 bindings/glib/gpiod-glib.pc.in                     |  15 +
 bindings/glib/gpiod-glib/chip-info.h               |  62 ++
 bindings/glib/gpiod-glib/chip.h                    | 157 +++++
 bindings/glib/gpiod-glib/edge-event.h              |  97 +++
 bindings/glib/gpiod-glib/error.h                   |  45 ++
 bindings/glib/gpiod-glib/info-event.h              |  76 +++
 bindings/glib/gpiod-glib/line-config.h             | 101 +++
 bindings/glib/gpiod-glib/line-info.h               | 171 +++++
 bindings/glib/gpiod-glib/line-request.h            | 186 ++++++
 bindings/glib/gpiod-glib/line-settings.h           | 220 +++++++
 bindings/glib/gpiod-glib/line.h                    | 113 ++++
 bindings/glib/gpiod-glib/misc.h                    |  39 ++
 bindings/glib/gpiod-glib/request-config.h          |  93 +++
 bindings/glib/info-event.c                         | 163 +++++
 bindings/glib/internal.c                           | 327 ++++++++++
 bindings/glib/internal.h                           |  79 +++
 bindings/glib/line-config.c                        | 193 ++++++
 bindings/glib/line-info.c                          | 342 ++++++++++
 bindings/glib/line-request.c                       | 452 +++++++++++++
 bindings/glib/line-settings.c                      | 408 ++++++++++++
 bindings/glib/misc.c                               |  17 +
 bindings/glib/request-config.c                     | 170 +++++
 bindings/glib/tests/.gitignore                     |   4 +
 bindings/glib/tests/Makefile.am                    |  29 +
 bindings/glib/tests/helpers.c                      |  12 +
 bindings/glib/tests/helpers.h                      | 140 ++++
 bindings/glib/tests/tests-chip-info.c              |  58 ++
 bindings/glib/tests/tests-chip.c                   | 187 ++++++
 bindings/glib/tests/tests-edge-event.c             | 225 +++++++
 bindings/glib/tests/tests-info-event.c             | 322 ++++++++++
 bindings/glib/tests/tests-line-config.c            | 187 ++++++
 bindings/glib/tests/tests-line-info.c              | 102 +++
 bindings/glib/tests/tests-line-request.c           | 710 +++++++++++++++++++++
 bindings/glib/tests/tests-line-settings.c          | 256 ++++++++
 bindings/glib/tests/tests-misc.c                   |  88 +++
 bindings/glib/tests/tests-request-config.c         |  64 ++
 configure.ac                                       |  36 ++
 62 files changed, 7926 insertions(+), 3 deletions(-)

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
diff --git a/README b/README
index a01cfc5..658a77e 100644
--- a/README
+++ b/README
@@ -211,13 +211,16 @@ Examples:
 BINDINGS
 --------
 
-High-level, object-oriented bindings for C++, python3 and Rust are provided.
-They can be enabled by passing --enable-bindings-cxx, --enable-bindings-python
-and --enable-bindings-rust arguments respectively to configure.
+High-level, object-oriented bindings for C++, GLib, python3 and Rust are
+provided. They can be enabled by passing --enable-bindings-cxx,
+--enable-bindings-glib, --enable-bindings-python and --enable-bindings-rust
+arguments respectively to configure.
 
 C++ bindings require C++11 support and autoconf-archive collection if building
 from git.
 
+GLib bindings requires GLib (as well as GObject, GIO and GIO-Unix) v2.54.
+
 Python bindings require python3 support and libpython development files. Please
 refer to bindings/python/README.md for more information.
 
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
diff --git a/bindings/glib/chip-info.c b/bindings/glib/chip-info.c
new file mode 100644
index 0000000..5c67018
--- /dev/null
+++ b/bindings/glib/chip-info.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+
+#include "internal.h"
+
+/**
+ * GpiodglibChipInfo:
+ *
+ * Represents an immutable snapshot of GPIO chip information.
+ */
+struct _GpiodglibChipInfo {
+	GObject parent_instance;
+	struct gpiod_chip_info *handle;
+};
+
+typedef enum {
+	GPIODGLIB_CHIP_INFO_PROP_NAME = 1,
+	GPIODGLIB_CHIP_INFO_PROP_LABEL,
+	GPIODGLIB_CHIP_INFO_PROP_NUM_LINES,
+} GpiodglibChipInfoProp;
+
+G_DEFINE_TYPE(GpiodglibChipInfo, gpiodglib_chip_info, G_TYPE_OBJECT);
+
+static void gpiodglib_chip_info_get_property(GObject *obj, guint prop_id,
+					     GValue *val, GParamSpec *pspec)
+{
+	GpiodglibChipInfo *self = GPIODGLIB_CHIP_INFO_OBJ(obj);
+
+	g_assert(self->handle);
+
+	switch ((GpiodglibChipInfoProp)prop_id) {
+	case GPIODGLIB_CHIP_INFO_PROP_NAME:
+		g_value_set_string(val,
+				   gpiod_chip_info_get_name(self->handle));
+		break;
+	case GPIODGLIB_CHIP_INFO_PROP_LABEL:
+		g_value_set_string(val,
+				   gpiod_chip_info_get_label(self->handle));
+		break;
+	case GPIODGLIB_CHIP_INFO_PROP_NUM_LINES:
+		g_value_set_uint(val,
+			gpiod_chip_info_get_num_lines(self->handle));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_chip_info_finalize(GObject *obj)
+{
+	GpiodglibChipInfo *self = GPIODGLIB_CHIP_INFO_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_chip_info_free);
+
+	G_OBJECT_CLASS(gpiodglib_chip_info_parent_class)->finalize(obj);
+}
+
+static void
+gpiodglib_chip_info_class_init(GpiodglibChipInfoClass *chip_info_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(chip_info_class);
+
+	class->get_property = gpiodglib_chip_info_get_property;
+	class->finalize = gpiodglib_chip_info_finalize;
+
+	/**
+	 * GpiodglibChipInfo:name:
+	 *
+	 * Name of this GPIO chip device.
+	 */
+	g_object_class_install_property(class, GPIODGLIB_CHIP_INFO_PROP_NAME,
+		g_param_spec_string("name", "Name",
+			"Name of this GPIO chip device.", NULL,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibChipInfo:label:
+	 *
+	 * Label of this GPIO chip device.
+	 */
+	g_object_class_install_property(class, GPIODGLIB_CHIP_INFO_PROP_LABEL,
+		g_param_spec_string("label", "Label",
+			"Label of this GPIO chip device.", NULL,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibChipInfo:num-lines:
+	 *
+	 * Number of GPIO lines exposed by this chip.
+	 */
+	g_object_class_install_property(class, GPIODGLIB_CHIP_INFO_PROP_NUM_LINES,
+		g_param_spec_uint("num-lines", "NumLines",
+			"Number of GPIO lines exposed by this chip.",
+			1, G_MAXUINT, 1,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+}
+
+static void gpiodglib_chip_info_init(GpiodglibChipInfo *self)
+{
+	self->handle = NULL;
+}
+
+gchar *gpiodglib_chip_info_dup_name(GpiodglibChipInfo *self)
+{
+	return _gpiodglib_dup_prop_string(G_OBJECT(self), "name");
+}
+
+gchar *gpiodglib_chip_info_dup_label(GpiodglibChipInfo *self)
+{
+	return _gpiodglib_dup_prop_string(G_OBJECT(self), "label");
+}
+
+guint gpiodglib_chip_info_get_num_lines(GpiodglibChipInfo *self)
+{
+	return _gpiodglib_get_prop_uint(G_OBJECT(self), "num-lines");
+}
+
+GpiodglibChipInfo *_gpiodglib_chip_info_new(struct gpiod_chip_info *handle)
+{
+	GpiodglibChipInfo *info;
+
+	info = GPIODGLIB_CHIP_INFO_OBJ(g_object_new(GPIODGLIB_CHIP_INFO_TYPE,
+						    NULL));
+	info->handle = handle;
+
+	return info;
+}
diff --git a/bindings/glib/chip.c b/bindings/glib/chip.c
new file mode 100644
index 0000000..d4c0e15
--- /dev/null
+++ b/bindings/glib/chip.c
@@ -0,0 +1,397 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+
+#include "internal.h"
+
+/**
+ * GpiodglibChip:
+ *
+ * Represents a single GPIO chip.
+ */
+struct _GpiodglibChip {
+	GObject parent_instance;
+	GString *path;
+	GError *construct_err;
+	struct gpiod_chip *handle;
+	GSource *info_event_src;
+	guint info_event_src_id;
+};
+
+typedef enum {
+	GPIODGLIB_CHIP_PROP_PATH = 1,
+} GpiodglibChipProp;
+
+enum {
+	GPIODGLIB_CHIP_SIGNAL_INFO_EVENT,
+	GPIODGLIB_CHIP_SIGNAL_LAST,
+};
+
+static guint signals[GPIODGLIB_CHIP_SIGNAL_LAST];
+
+static void g_string_free_complete(GString *str)
+{
+	g_string_free(str, TRUE);
+}
+
+static gboolean
+gpiodglib_chip_on_info_event(GIOChannel *source G_GNUC_UNUSED,
+			     GIOCondition condition G_GNUC_UNUSED,
+			     gpointer data)
+{
+	g_autoptr(GpiodglibInfoEvent) event = NULL;
+	struct gpiod_info_event *event_handle;
+	GpiodglibChip *self = data;
+
+	event_handle = gpiod_chip_read_info_event(self->handle);
+	if (!event_handle)
+		return TRUE;
+
+	event = _gpiodglib_info_event_new(event_handle);
+
+	g_signal_emit(self, signals[GPIODGLIB_CHIP_SIGNAL_INFO_EVENT], 0,
+		      event);
+
+	return TRUE;
+}
+
+static gboolean
+gpiodglib_chip_initable_init(GInitable *initable,
+			     GCancellable *cancellable G_GNUC_UNUSED,
+			     GError **err)
+{
+	GpiodglibChip *self = GPIODGLIB_CHIP_OBJ(initable);
+
+	if (self->construct_err) {
+		g_propagate_error(err, g_steal_pointer(&self->construct_err));
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+static void gpiodglib_chip_initable_iface_init(GInitableIface *iface)
+{
+	iface->init = gpiodglib_chip_initable_init;
+}
+
+G_DEFINE_TYPE_WITH_CODE(GpiodglibChip, gpiodglib_chip, G_TYPE_OBJECT,
+			G_IMPLEMENT_INTERFACE(
+				G_TYPE_INITABLE,
+				gpiodglib_chip_initable_iface_init));
+
+static void gpiodglib_chip_constructed(GObject *obj)
+{
+	GpiodglibChip *self = GPIODGLIB_CHIP_OBJ(obj);
+	g_autoptr(GIOChannel) channel = NULL;
+
+	g_assert(!self->handle);
+	g_assert(self->path);
+
+	self->handle = gpiod_chip_open(self->path->str);
+	if (!self->handle) {
+		_gpiodglib_set_error_from_errno(&self->construct_err,
+					       "unable to open GPIO chip '%s'",
+					       self->path->str);
+		return;
+	}
+
+	channel = g_io_channel_unix_new(gpiod_chip_get_fd(self->handle));
+	self->info_event_src = g_io_create_watch(channel, G_IO_IN);
+	g_source_set_callback(self->info_event_src,
+			      G_SOURCE_FUNC(gpiodglib_chip_on_info_event),
+			      self, NULL);
+	self->info_event_src_id = g_source_attach(self->info_event_src, NULL);
+
+	G_OBJECT_CLASS(gpiodglib_chip_parent_class)->constructed(obj);
+}
+
+static void gpiodglib_chip_get_property(GObject *obj, guint prop_id,
+					GValue *val, GParamSpec *pspec)
+{
+	GpiodglibChip *self = GPIODGLIB_CHIP_OBJ(obj);
+
+	switch ((GpiodglibChipProp)prop_id) {
+	case GPIODGLIB_CHIP_PROP_PATH:
+		g_value_set_string(val, self->path->str);
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_chip_set_property(GObject *obj, guint prop_id,
+					const GValue *val, GParamSpec *pspec)
+{
+	GpiodglibChip *self = GPIODGLIB_CHIP_OBJ(obj);
+
+	switch ((GpiodglibChipProp)prop_id) {
+	case GPIODGLIB_CHIP_PROP_PATH:
+		self->path = g_string_new(g_value_get_string(val));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+void gpiodglib_chip_close(GpiodglibChip *self)
+{
+	g_clear_pointer(&self->info_event_src, g_source_unref);
+	g_clear_pointer(&self->handle, gpiod_chip_close);
+}
+
+static void gpiodglib_chip_dispose(GObject *obj)
+{
+	GpiodglibChip *self = GPIODGLIB_CHIP_OBJ(obj);
+
+	if (self->info_event_src_id)
+		g_source_remove(self->info_event_src_id);
+
+	gpiodglib_chip_close(self);
+
+	G_OBJECT_CLASS(gpiodglib_chip_parent_class)->dispose(obj);
+}
+
+static void gpiodglib_chip_finalize(GObject *obj)
+{
+	GpiodglibChip *self = GPIODGLIB_CHIP_OBJ(obj);
+
+	g_clear_error(&self->construct_err);
+	g_clear_pointer(&self->path, g_string_free_complete);
+
+	G_OBJECT_CLASS(gpiodglib_chip_parent_class)->finalize(obj);
+}
+
+static void gpiodglib_chip_class_init(GpiodglibChipClass *chip_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(chip_class);
+
+	class->constructed = gpiodglib_chip_constructed;
+	class->get_property = gpiodglib_chip_get_property;
+	class->set_property = gpiodglib_chip_set_property;
+	class->dispose = gpiodglib_chip_dispose;
+	class->finalize = gpiodglib_chip_finalize;
+
+	/**
+	 * GpiodglibChip:path:
+	 *
+	 * Path that was used to open this GPIO chip.
+	 */
+	g_object_class_install_property(class, GPIODGLIB_CHIP_PROP_PATH,
+		g_param_spec_string("path", "Path",
+			"Path to the GPIO chip device used to create this chip.",
+			NULL,
+			G_PARAM_CONSTRUCT_ONLY |
+			G_PARAM_READWRITE |
+			G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibChip::info-event:
+	 * @chip: #GpiodglibChip receiving the event
+	 * @event: The #GpiodglibInfoEvent
+	 *
+	 * Emitted when the state of a watched GPIO line changes.
+	 */
+	signals[GPIODGLIB_CHIP_SIGNAL_INFO_EVENT] =
+				g_signal_new("info-event",
+					     G_TYPE_FROM_CLASS(chip_class),
+					     G_SIGNAL_RUN_LAST,
+					     0,
+					     NULL,
+					     NULL,
+					     g_cclosure_marshal_generic,
+					     G_TYPE_NONE,
+					     1,
+					     GPIODGLIB_INFO_EVENT_TYPE);
+}
+
+static void gpiodglib_chip_init(GpiodglibChip *self)
+{
+	self->path = NULL;
+	self->construct_err = NULL;
+	self->handle = NULL;
+	self->info_event_src = NULL;
+	self->info_event_src_id = 0;
+}
+
+GpiodglibChip *gpiodglib_chip_new(const gchar *path, GError **err)
+{
+	return GPIODGLIB_CHIP_OBJ(g_initable_new(GPIODGLIB_CHIP_TYPE, NULL, err,
+						 "path", path, NULL));
+}
+
+gboolean gpiodglib_chip_is_closed(GpiodglibChip *self)
+{
+	return !self->handle;
+}
+
+gchar *gpiodglib_chip_dup_path(GpiodglibChip *self)
+{
+	return _gpiodglib_dup_prop_string(G_OBJECT(self), "path");
+}
+
+static void set_err_chip_closed(GError **err)
+{
+	g_set_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_CHIP_CLOSED,
+		    "Chip was closed and cannot be used");
+}
+
+GpiodglibChipInfo *gpiodglib_chip_get_info(GpiodglibChip *self, GError **err)
+{
+	struct gpiod_chip_info *info;
+
+	g_assert(self);
+
+	if (gpiodglib_chip_is_closed(self)) {
+		set_err_chip_closed(err);
+		return NULL;
+	}
+
+	info = gpiod_chip_get_info(self->handle);
+	if (!info) {
+		_gpiodglib_set_error_from_errno(err,
+			"unable to retrieve GPIO chip information");
+		return NULL;
+	}
+
+	return _gpiodglib_chip_info_new(info);
+}
+
+static GpiodglibLineInfo *
+gpiodglib_chip_do_get_line_info(GpiodglibChip *self, guint offset, GError **err,
+			struct gpiod_line_info *(*func)(struct gpiod_chip *,
+							unsigned int),
+			const gchar *err_action)
+{
+	struct gpiod_line_info *info;
+
+	g_assert(self);
+
+	if (gpiodglib_chip_is_closed(self)) {
+		set_err_chip_closed(err);
+		return NULL;
+	}
+
+	info = func(self->handle, offset);
+	if (!info) {
+		_gpiodglib_set_error_from_errno(err, "unable to %s for offset %u",
+						err_action, offset);
+		return NULL;
+	}
+
+	return _gpiodglib_line_info_new(info);
+}
+
+GpiodglibLineInfo *
+gpiodglib_chip_get_line_info(GpiodglibChip *self, guint offset, GError **err)
+{
+	return gpiodglib_chip_do_get_line_info(self, offset, err,
+					       gpiod_chip_get_line_info,
+					       "retrieve GPIO line-info");
+}
+
+GpiodglibLineInfo *
+gpiodglib_chip_watch_line_info(GpiodglibChip *self, guint offset, GError **err)
+{
+	return gpiodglib_chip_do_get_line_info(self, offset, err,
+					       gpiod_chip_watch_line_info,
+					       "setup a line-info watch");
+}
+
+gboolean
+gpiodglib_chip_unwatch_line_info(GpiodglibChip *self, guint offset,
+				 GError **err)
+{
+	int ret;
+
+	g_assert(self);
+
+	if (gpiodglib_chip_is_closed(self)) {
+		set_err_chip_closed(err);
+		return FALSE;
+	}
+
+	ret = gpiod_chip_unwatch_line_info(self->handle, offset);
+	if (ret) {
+		_gpiodglib_set_error_from_errno(err,
+			    "unable to unwatch line-info events for offset %u",
+			    offset);
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+gboolean
+gpiodglib_chip_get_line_offset_from_name(GpiodglibChip *self, const gchar *name,
+					 guint *offset, GError **err)
+{
+	gint ret;
+
+	g_assert(self);
+
+	if (gpiodglib_chip_is_closed(self)) {
+		set_err_chip_closed(err);
+		return FALSE;
+	}
+
+	if (!name) {
+		g_set_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL,
+			    "name must not be NULL");
+		return FALSE;
+	}
+
+	ret = gpiod_chip_get_line_offset_from_name(self->handle, name);
+	if (ret < 0) {
+		if (errno != ENOENT)
+			_gpiodglib_set_error_from_errno(err,
+				    "failed to map line name to offset");
+		else
+			errno = 0;
+
+		return FALSE;
+	}
+
+	if (offset)
+		*offset = ret;
+
+	return TRUE;
+}
+
+GpiodglibLineRequest *
+gpiodglib_chip_request_lines(GpiodglibChip *self,
+			     GpiodglibRequestConfig *req_cfg,
+			     GpiodglibLineConfig *line_cfg, GError **err)
+{
+	struct gpiod_request_config *req_cfg_handle;
+	struct gpiod_line_config *line_cfg_handle;
+	struct gpiod_line_request *req;
+
+	g_assert(self);
+
+	if (gpiodglib_chip_is_closed(self)) {
+		set_err_chip_closed(err);
+		return NULL;
+	}
+
+	if (!line_cfg) {
+		g_set_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL,
+			    "line-config is required for request");
+		return NULL;
+	}
+
+	req_cfg_handle = req_cfg ?
+		_gpiodglib_request_config_get_handle(req_cfg) : NULL;
+	line_cfg_handle = _gpiodglib_line_config_get_handle(line_cfg);
+
+	req = gpiod_chip_request_lines(self->handle,
+				       req_cfg_handle, line_cfg_handle);
+	if (!req) {
+		_gpiodglib_set_error_from_errno(err,
+				"failed to request GPIO lines");
+		return NULL;
+	}
+
+	return _gpiodglib_line_request_new(req);
+}
diff --git a/bindings/glib/edge-event.c b/bindings/glib/edge-event.c
new file mode 100644
index 0000000..a7791c7
--- /dev/null
+++ b/bindings/glib/edge-event.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+
+#include "internal.h"
+
+/**
+ * GpiodglibEdgeEvent:
+ *
+ * #GpiodglibEdgeEvent stores information about a single line edge event.
+ * It contains the event type, timestamp and the offset of the line on which
+ * the event occurred as well as two sequence numbers (global for all lines
+ * in the associated request and local for this line only).
+ */
+struct _GpiodglibEdgeEvent {
+	GObject parent_instance;
+	struct gpiod_edge_event *handle;
+};
+
+typedef enum {
+	GPIODGLIB_EDGE_EVENT_PROP_EVENT_TYPE = 1,
+	GPIODGLIB_EDGE_EVENT_PROP_TIMESTAMP_NS,
+	GPIODGLIB_EDGE_EVENT_PROP_LINE_OFFSET,
+	GPIODGLIB_EDGE_EVENT_PROP_GLOBAL_SEQNO,
+	GPIODGLIB_EDGE_EVENT_PROP_LINE_SEQNO,
+} GpiodglibEdgeEventProp;
+
+G_DEFINE_TYPE(GpiodglibEdgeEvent, gpiodglib_edge_event, G_TYPE_OBJECT);
+
+static void gpiodglib_edge_event_get_property(GObject *obj, guint prop_id,
+					      GValue *val, GParamSpec *pspec)
+{
+	GpiodglibEdgeEvent *self = GPIODGLIB_EDGE_EVENT_OBJ(obj);
+	GpiodglibEdgeEventType type;
+
+	g_assert(self->handle);
+
+	switch ((GpiodglibEdgeEventProp)prop_id) {
+	case GPIODGLIB_EDGE_EVENT_PROP_EVENT_TYPE:
+		type = _gpiodglib_edge_event_type_from_library(
+				gpiod_edge_event_get_event_type(self->handle));
+		g_value_set_enum(val, type);
+		break;
+	case GPIODGLIB_EDGE_EVENT_PROP_TIMESTAMP_NS:
+		g_value_set_uint64(val,
+			gpiod_edge_event_get_timestamp_ns(self->handle));
+		break;
+	case GPIODGLIB_EDGE_EVENT_PROP_LINE_OFFSET:
+		g_value_set_uint(val,
+			gpiod_edge_event_get_line_offset(self->handle));
+		break;
+	case GPIODGLIB_EDGE_EVENT_PROP_GLOBAL_SEQNO:
+		g_value_set_ulong(val,
+			gpiod_edge_event_get_global_seqno(self->handle));
+		break;
+	case GPIODGLIB_EDGE_EVENT_PROP_LINE_SEQNO:
+		g_value_set_ulong(val,
+			gpiod_edge_event_get_line_seqno(self->handle));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_edge_event_finalize(GObject *obj)
+{
+	GpiodglibEdgeEvent *self = GPIODGLIB_EDGE_EVENT_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_edge_event_free);
+
+	G_OBJECT_CLASS(gpiodglib_edge_event_parent_class)->finalize(obj);
+}
+
+static void
+gpiodglib_edge_event_class_init(GpiodglibEdgeEventClass *edge_event_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(edge_event_class);
+
+	class->get_property = gpiodglib_edge_event_get_property;
+	class->finalize = gpiodglib_edge_event_finalize;
+
+	/**
+	 * GpiodglibEdgeEvent:event-type:
+	 *
+	 * Type of the edge event.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_EDGE_EVENT_PROP_EVENT_TYPE,
+		g_param_spec_enum("event-type", "Event Type",
+			"Type of the edge event.",
+			GPIODGLIB_EDGE_EVENT_TYPE_TYPE,
+			GPIODGLIB_EDGE_EVENT_RISING_EDGE,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibEdgeEvent:timestamp-ns:
+	 *
+	 * Timestamp of the edge event expressed in nanoseconds.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_EDGE_EVENT_PROP_TIMESTAMP_NS,
+		g_param_spec_uint64("timestamp-ns",
+			"Timestamp (in nanoseconds)",
+			"Timestamp of the edge event expressed in nanoseconds.",
+			0, G_MAXUINT64, 0,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibEdgeEvent:line-offset:
+	 *
+	 * Offset of the line on which this event was registered.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_EDGE_EVENT_PROP_LINE_OFFSET,
+		g_param_spec_uint("line-offset", "Line Offset",
+			"Offset of the line on which this event was registered.",
+			0, G_MAXUINT, 0,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibEdgeEvent:global-seqno:
+	 *
+	 * Global sequence number of this event.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_EDGE_EVENT_PROP_GLOBAL_SEQNO,
+		g_param_spec_ulong("global-seqno", "Global Sequence Number",
+			"Global sequence number of this event.",
+			0, G_MAXULONG, 0,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibEdgeEvent:line-seqno:
+	 *
+	 * Event sequence number specific to the line.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_EDGE_EVENT_PROP_LINE_SEQNO,
+		g_param_spec_ulong("line-seqno", "Line Sequence Number",
+			"Event sequence number specific to the line.",
+			0, G_MAXULONG, 0,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+}
+
+static void gpiodglib_edge_event_init(GpiodglibEdgeEvent *self)
+{
+	self->handle = NULL;
+}
+
+GpiodglibEdgeEventType
+gpiodglib_edge_event_get_event_type(GpiodglibEdgeEvent *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "event-type");
+}
+
+guint64 gpiodglib_edge_event_get_timestamp_ns(GpiodglibEdgeEvent *self)
+{
+	return _gpiodglib_get_prop_uint64(G_OBJECT(self), "timestamp-ns");
+}
+
+guint gpiodglib_edge_event_get_line_offset(GpiodglibEdgeEvent *self)
+{
+	return _gpiodglib_get_prop_uint(G_OBJECT(self), "line-offset");
+}
+
+gulong gpiodglib_edge_event_get_global_seqno(GpiodglibEdgeEvent *self)
+{
+	return _gpiodglib_get_prop_ulong(G_OBJECT(self), "global-seqno");
+}
+
+gulong gpiodglib_edge_event_get_line_seqno(GpiodglibEdgeEvent *self)
+{
+	return _gpiodglib_get_prop_ulong(G_OBJECT(self), "line-seqno");
+}
+
+GpiodglibEdgeEvent *_gpiodglib_edge_event_new(struct gpiod_edge_event *handle)
+{
+	GpiodglibEdgeEvent *event;
+
+	event = GPIODGLIB_EDGE_EVENT_OBJ(
+			g_object_new(GPIODGLIB_EDGE_EVENT_TYPE, NULL));
+	event->handle = handle;
+
+	return event;
+}
diff --git a/bindings/glib/error.c b/bindings/glib/error.c
new file mode 100644
index 0000000..cc0250a
--- /dev/null
+++ b/bindings/glib/error.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <errno.h>
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdarg.h>
+
+G_DEFINE_QUARK(g-gpiod-error, gpiodglib_error)
+
+static GpiodglibError error_from_errno(void)
+{
+	switch (errno) {
+	case EPERM:
+		return GPIODGLIB_ERR_PERM;
+	case ENOENT:
+		return GPIODGLIB_ERR_NOENT;
+	case EINTR:
+		return GPIODGLIB_ERR_INTR;
+	case EIO:
+		return GPIODGLIB_ERR_IO;
+	case ENXIO:
+		return GPIODGLIB_ERR_NXIO;
+	case E2BIG:
+		return GPIODGLIB_ERR_E2BIG;
+	case EBADFD:
+		return GPIODGLIB_ERR_BADFD;
+	case ECHILD:
+		return GPIODGLIB_ERR_CHILD;
+	case EAGAIN:
+		return GPIODGLIB_ERR_AGAIN;
+	case ENOMEM:
+		/* Special case - as a convention GLib just aborts on ENOMEM. */
+		g_error("out of memory");
+	case EACCES:
+		return GPIODGLIB_ERR_ACCES;
+	case EFAULT:
+		return GPIODGLIB_ERR_FAULT;
+	case EBUSY:
+		return GPIODGLIB_ERR_BUSY;
+	case EEXIST:
+		return GPIODGLIB_ERR_EXIST;
+	case ENODEV:
+		return GPIODGLIB_ERR_NODEV;
+	case EINVAL:
+		return GPIODGLIB_ERR_INVAL;
+	case ENOTTY:
+		return GPIODGLIB_ERR_NOTTY;
+	case EPIPE:
+		return GPIODGLIB_ERR_PIPE;
+	default:
+		return GPIODGLIB_ERR_FAILED;
+	}
+}
+
+void _gpiodglib_set_error_from_errno(GError **err, const gchar *fmt, ...)
+{
+	g_autofree gchar *msg = NULL;
+	va_list va;
+
+	va_start(va, fmt);
+	msg = g_strdup_vprintf(fmt, va);
+	va_end(va);
+
+	g_set_error(err, GPIODGLIB_ERROR, error_from_errno(),
+		    "%s: %s", msg, g_strerror(errno));
+}
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
diff --git a/bindings/glib/examples/find_line_by_name_glib.c b/bindings/glib/examples/find_line_by_name_glib.c
new file mode 100644
index 0000000..ee8766e
--- /dev/null
+++ b/bindings/glib/examples/find_line_by_name_glib.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of finding a line with the given name. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const gchar *const line_name = "GPIO0";
+
+	g_autoptr(GpiodglibChipInfo) info = NULL;
+	g_autoptr(GError) err = NULL;
+	g_autoptr(GDir) dir = NULL;
+	const gchar *filename;
+	gboolean ret;
+	guint offset;
+
+	dir = g_dir_open("/dev", 0, &err);
+	if (err) {
+		g_printerr("Unable to open /dev: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	/*
+	 * Names are not guaranteed unique, so this finds the first line with
+	 * the given name.
+	 */
+	while ((filename = g_dir_read_name(dir))) {
+		g_autoptr(GpiodglibChip) chip = NULL;
+		g_autofree gchar *path = NULL;
+		g_autofree gchar *name = NULL;
+
+		path = g_build_filename("/dev", filename, NULL);
+		if (!gpiodglib_is_gpiochip_device(path))
+			continue;
+
+		chip = gpiodglib_chip_new(path, &err);
+		if (err) {
+			g_printerr("Failed to open the GPIO chip at '%s': %s\n",
+				   path, err->message);
+			return EXIT_FAILURE;
+		}
+
+		ret = gpiodglib_chip_get_line_offset_from_name(chip, line_name,
+							       &offset, &err);
+		if (!ret) {
+			g_printerr("Failed to map the line name '%s' to offset: %s\n",
+				   line_name, err->message);
+			return EXIT_FAILURE;
+		}
+
+		info = gpiodglib_chip_get_info(chip, &err);
+		if (!info) {
+			g_printerr("Failed to get chip info: %s\n",
+				   err->message);
+			return EXIT_FAILURE;
+		}
+
+		name = gpiodglib_chip_info_dup_name(info);
+
+		g_print("%s %u\n", name, offset);
+	}
+
+	g_print("line '%s' not found\n", line_name);
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/get_chip_info_glib.c b/bindings/glib/examples/get_chip_info_glib.c
new file mode 100644
index 0000000..ccdf437
--- /dev/null
+++ b/bindings/glib/examples/get_chip_info_glib.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of reading the info for a chip. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const gchar *const chip_path = "/dev/gpiochip0";
+
+	g_autoptr(GpiodglibChipInfo) info = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autofree gchar *label = NULL;
+	g_autofree gchar *name = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (err) {
+		g_printerr("Failed to open the GPIO chip at '%s': %s\n",
+			   chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	info = gpiodglib_chip_get_info(chip, &err);
+	if (err) {
+		g_printerr("Failed to retrieve GPIO chip info: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	name = gpiodglib_chip_info_dup_name(info);
+	label = gpiodglib_chip_info_dup_label(info);
+
+	g_print("%s [%s] (%u lines)\n",
+		name, label, gpiodglib_chip_info_get_num_lines(info));
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/get_line_info_glib.c b/bindings/glib/examples/get_line_info_glib.c
new file mode 100644
index 0000000..bd49332
--- /dev/null
+++ b/bindings/glib/examples/get_line_info_glib.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of reading the info for a line. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+static GString *make_flags(GpiodglibLineInfo *info)
+{
+	g_autofree gchar *drive_str = NULL;
+	g_autofree gchar *edge_str = NULL;
+	g_autofree gchar *bias_str = NULL;
+	GpiodglibLineDrive drive;
+	GpiodglibLineEdge edge;
+	GpiodglibLineBias bias;
+	GString *ret;
+
+	edge = gpiodglib_line_info_get_edge_detection(info);
+	bias = gpiodglib_line_info_get_bias(info);
+	drive = gpiodglib_line_info_get_drive(info);
+
+	edge_str = g_enum_to_string(GPIODGLIB_LINE_EDGE_TYPE, edge);
+	bias_str = g_enum_to_string(GPIODGLIB_LINE_BIAS_TYPE, bias);
+	drive_str = g_enum_to_string(GPIODGLIB_LINE_DRIVE_TYPE, drive);
+
+	ret = g_string_new(NULL);
+	g_string_printf(ret, "%s, %s, %s", edge_str, bias_str, drive_str);
+	g_string_replace(ret, "GPIODGLIB_LINE_", "", 0);
+
+	return ret;
+}
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const gchar *const chip_path = "/dev/gpiochip0";
+	static const guint line_offset = 4;
+
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autofree gchar *consumer = NULL;
+	GpiodglibLineDirection direction;
+	g_autoptr(GString) flags = NULL;
+	g_autofree gchar *name = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean active_low;
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (err) {
+		g_printerr("Failed to open the GPIO chip at '%s': %s\n",
+			   chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	info = gpiodglib_chip_get_line_info(chip, line_offset, &err);
+	if (err) {
+		g_printerr("Failed to retrieve GPIO line info: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	name = gpiodglib_line_info_dup_name(info);
+	consumer = gpiodglib_line_info_dup_consumer(info);
+	direction = gpiodglib_line_info_get_direction(info);
+	active_low = gpiodglib_line_info_is_active_low(info);
+	flags = make_flags(info);
+
+	g_print("\tline: %u %s %s %s %s [%s]\n",
+		line_offset,
+		name ?: "unnamed",
+		consumer ?: "unused",
+		direction == GPIODGLIB_LINE_DIRECTION_INPUT ?
+					"input" : "output",
+		active_low ? "active-low" : "active-high",
+		flags->str);
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/get_line_value_glib.c b/bindings/glib/examples/get_line_value_glib.c
new file mode 100644
index 0000000..660ba7d
--- /dev/null
+++ b/bindings/glib/examples/get_line_value_glib.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of reading a single line. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const gchar *const chip_path = "/dev/gpiochip1";
+	static const guint line_offset = 5;
+
+	g_autoptr(GpiodglibRequestConfig) req_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	guint offset;
+	gboolean ret;
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	g_array_append_val(offsets, line_offset);
+
+	settings = gpiodglib_line_settings_new("direction",
+					       GPIODGLIB_LINE_DIRECTION_INPUT,
+					       NULL);
+
+	line_cfg = gpiodglib_line_config_new();
+	ret = gpiodglib_line_config_add_line_settings(line_cfg, offsets,
+						      settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = gpiodglib_request_config_new("consumer",
+					       "get-line-value-glib",
+					       NULL);
+
+	request = gpiodglib_chip_request_lines(chip, req_cfg, line_cfg, &err);
+	if (!request) {
+		g_printerr("failed to request lines: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	ret = gpiodglib_line_request_get_value(request, line_offset,
+					       &offset, &err);
+	if (!ret) {
+		g_printerr("failed to read line values: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	g_print("%u\n", offset);
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/get_multiple_line_values_glib.c b/bindings/glib/examples/get_multiple_line_values_glib.c
new file mode 100644
index 0000000..2b2e547
--- /dev/null
+++ b/bindings/glib/examples/get_multiple_line_values_glib.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of reading multiple lines. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const gchar *const chip_path = "/dev/gpiochip1";
+	static const guint line_offsets[] = { 5, 3, 7 };
+	static const gsize num_lines = 3;
+
+	g_autoptr(GpiodglibRequestConfig) req_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+	guint i, j;
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	for (i = 0; i < num_lines; i++)
+		g_array_append_val(offsets, line_offsets[i]);
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	settings = gpiodglib_line_settings_new("direction",
+					       GPIODGLIB_LINE_DIRECTION_INPUT,
+					       NULL);
+
+	line_cfg = gpiodglib_line_config_new();
+	ret = gpiodglib_line_config_add_line_settings(line_cfg, offsets,
+						      settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = gpiodglib_request_config_new("consumer",
+					       "get-multiple-line-values",
+					       NULL);
+
+	request = gpiodglib_chip_request_lines(chip, req_cfg, line_cfg, &err);
+	if (!request) {
+		g_printerr("failed to request lines: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	ret = gpiodglib_line_request_get_values_subset(request, offsets,
+						       &values, &err);
+	if (!ret) {
+		g_printerr("failed to read line values: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	for (j = 0; j < values->len; j++)
+		g_print("%d ", g_array_index(values, GpiodglibLineValue, j));
+	g_print("\n");
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/reconfigure_input_to_output_glib.c b/bindings/glib/examples/reconfigure_input_to_output_glib.c
new file mode 100644
index 0000000..9254cfb
--- /dev/null
+++ b/bindings/glib/examples/reconfigure_input_to_output_glib.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/*
+ * Example of a bi-directional line requested as input and then switched
+ * to output.
+ */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation */
+	static const gchar *const chip_path = "/dev/gpiochip1";
+	static const guint line_offset = 5;
+
+	g_autoptr(GpiodglibRequestConfig) req_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	GpiodglibLineValue value;
+	gboolean ret;
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	g_array_append_val(offsets, line_offset);
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	settings = gpiodglib_line_settings_new("direction",
+					       GPIODGLIB_LINE_DIRECTION_INPUT,
+					       NULL);
+
+	line_cfg = gpiodglib_line_config_new();
+	ret = gpiodglib_line_config_add_line_settings(line_cfg, offsets,
+						      settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = gpiodglib_request_config_new("consumer",
+					       "reconfigure-input-to-output",
+					       NULL);
+
+	request = gpiodglib_chip_request_lines(chip, req_cfg, line_cfg, &err);
+	if (!request) {
+		g_printerr("failed to request lines: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	/* Read the current line value. */
+	ret = gpiodglib_line_request_get_value(request, line_offset,
+					       &value, &err);
+	if (!ret) {
+		g_printerr("failed to read line value: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	g_print("%s (input)\n",
+		value == GPIODGLIB_LINE_VALUE_ACTIVE ? "Active" : "Inactive");
+
+	/* Switch the line to an output and drive it high. */
+	gpiodglib_line_settings_set_direction(settings,
+					      GPIODGLIB_LINE_DIRECTION_OUTPUT);
+	gpiodglib_line_settings_set_output_value(settings,
+						 GPIODGLIB_LINE_VALUE_ACTIVE);
+	ret = gpiodglib_line_config_add_line_settings(line_cfg, offsets,
+						      settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	/* Reconfigure lines. */
+	ret = gpiodglib_line_request_reconfigure_lines(request, line_cfg, &err);
+	if (!ret) {
+		g_printerr("failed to reconfigure lines: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	/* Report the current driven value. */
+	ret = gpiodglib_line_request_get_value(request, line_offset,
+					       &value, &err);
+	if (!ret) {
+		g_printerr("failed to read line value: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	g_print("%s (output)\n",
+		value == GPIODGLIB_LINE_VALUE_ACTIVE ? "Active" : "Inactive");
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/toggle_line_value_glib.c b/bindings/glib/examples/toggle_line_value_glib.c
new file mode 100644
index 0000000..e9e0e41
--- /dev/null
+++ b/bindings/glib/examples/toggle_line_value_glib.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of periodically toggling a single line. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+typedef struct {
+	GpiodglibLineRequest *request;
+	guint line_offset;
+	GpiodglibLineValue value;
+} ToggleData;
+
+static gboolean toggle_line(gpointer user_data)
+{
+	ToggleData *data = user_data;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	data->value = data->value == GPIODGLIB_LINE_VALUE_ACTIVE ?
+					GPIODGLIB_LINE_VALUE_INACTIVE :
+					GPIODGLIB_LINE_VALUE_ACTIVE;
+
+	ret = gpiodglib_line_request_set_value(data->request, data->line_offset,
+					       data->value, &err);
+	if (!ret) {
+		g_printerr("failed to set line value: %s\n", err->message);
+		exit(EXIT_FAILURE);
+	}
+
+	g_print("%u=%s\n",
+		data->line_offset,
+		data->value == GPIODGLIB_LINE_VALUE_ACTIVE ?
+					"active" : "inactive");
+
+	return G_SOURCE_CONTINUE;
+}
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const gchar *const chip_path = "/dev/gpiochip1";
+	static const guint line_offset = 5;
+
+	g_autoptr(GpiodglibRequestConfig) req_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GMainLoop) loop = NULL;
+	g_autoptr(GError) err = NULL;
+	ToggleData data;
+	gboolean ret;
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	g_array_append_val(offsets, line_offset);
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	settings = gpiodglib_line_settings_new("direction",
+					       GPIODGLIB_LINE_DIRECTION_OUTPUT,
+					       NULL);
+	line_cfg = gpiodglib_line_config_new();
+	ret = gpiodglib_line_config_add_line_settings(line_cfg, offsets,
+						      settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = gpiodglib_request_config_new("consumer", "toggle-line-value",
+					       NULL);
+
+	request = gpiodglib_chip_request_lines(chip, req_cfg, line_cfg, &err);
+	if (!request) {
+		g_printerr("failed to request lines: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	data.request = request;
+	data.line_offset = line_offset;
+	data.value = GPIODGLIB_LINE_VALUE_INACTIVE;
+
+	loop = g_main_loop_new(NULL, FALSE);
+	/* Do the GLib way: add a callback to be invoked from the main loop. */
+	g_timeout_add_seconds(1, toggle_line, &data);
+
+	g_main_loop_run(loop);
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/toggle_multiple_line_values_glib.c b/bindings/glib/examples/toggle_multiple_line_values_glib.c
new file mode 100644
index 0000000..d1b37b3
--- /dev/null
+++ b/bindings/glib/examples/toggle_multiple_line_values_glib.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of periodically toggling multiple lines. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+typedef struct {
+	GpiodglibLineRequest *request;
+	GArray *offsets;
+	GArray *values;
+} ToggleData;
+
+static void toggle_values(GArray *values)
+{
+	GpiodglibLineValue *value;
+	guint i;
+
+	for (i = 0; i < values->len; i++) {
+		value = &g_array_index(values, GpiodglibLineValue, i);
+		*value = *value == GPIODGLIB_LINE_VALUE_ACTIVE ?
+					GPIODGLIB_LINE_VALUE_INACTIVE :
+					GPIODGLIB_LINE_VALUE_ACTIVE;
+	}
+}
+
+static gboolean toggle_lines(gpointer user_data)
+{
+	ToggleData *data = user_data;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+	guint i;
+
+	toggle_values(data->values);
+
+	ret = gpiodglib_line_request_set_values_subset(data->request,
+						       data->offsets,
+						       data->values, &err);
+	if (!ret) {
+		g_printerr("failed to set line values: %s\n", err->message);
+		exit(EXIT_FAILURE);
+	}
+
+	for (i = 0; i < data->offsets->len; i++)
+		g_print("%u=%s ",
+			g_array_index(data->offsets, guint, i),
+			g_array_index(data->values,
+				      GpiodglibLineValue,
+				      i) == GPIODGLIB_LINE_VALUE_ACTIVE ?
+						"active" : "inactive");
+	g_print("\n");
+
+	return G_SOURCE_CONTINUE;
+}
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const gchar *const chip_path = "/dev/gpiochip1";
+	static const guint line_offsets[] = { 5, 3, 7 };
+	static const GpiodglibLineValue line_values[] = {
+		GPIODGLIB_LINE_VALUE_ACTIVE,
+		GPIODGLIB_LINE_VALUE_ACTIVE,
+		GPIODGLIB_LINE_VALUE_INACTIVE
+	};
+	static const gsize num_lines = 3;
+
+	g_autoptr(GpiodglibRequestConfig) req_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GMainLoop) loop = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	ToggleData data;
+	gboolean ret;
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	g_array_append_vals(offsets, line_offsets, num_lines);
+
+	values = g_array_new(FALSE, TRUE, sizeof(GpiodglibLineValue));
+	g_array_append_vals(values, line_values, num_lines);
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	settings = gpiodglib_line_settings_new("direction",
+					       GPIODGLIB_LINE_DIRECTION_OUTPUT,
+					       NULL);
+	line_cfg = gpiodglib_line_config_new();
+	ret = gpiodglib_line_config_add_line_settings(line_cfg, offsets,
+						      settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	ret = gpiodglib_line_config_set_output_values(line_cfg, values, &err);
+	if (!ret) {
+		g_printerr("failed to set output values: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = gpiodglib_request_config_new("consumer", "toggle-line-value",
+					       NULL);
+
+	request = gpiodglib_chip_request_lines(chip, req_cfg, line_cfg, &err);
+	if (!request) {
+		g_printerr("failed to request lines: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	data.request = request;
+	data.offsets = offsets;
+	data.values = values;
+
+	loop = g_main_loop_new(NULL, FALSE);
+	/* Do the GLib way: add a callback to be invoked from the main loop. */
+	g_timeout_add_seconds(1, toggle_lines, &data);
+
+	g_main_loop_run(loop);
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/watch_line_info_glib.c b/bindings/glib/examples/watch_line_info_glib.c
new file mode 100644
index 0000000..e3b3ae4
--- /dev/null
+++ b/bindings/glib/examples/watch_line_info_glib.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of watching for requests on particular lines. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+static void on_info_event(GpiodglibChip *chip G_GNUC_UNUSED,
+			  GpiodglibInfoEvent *event,
+			  gpointer data G_GNUC_UNUSED)
+{
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	g_autoptr(GString) event_name = NULL;
+	guint offset;
+
+	event_name = g_string_new(
+			g_enum_to_string(GPIODGLIB_INFO_EVENT_TYPE_TYPE,
+				gpiodglib_info_event_get_event_type(event)));
+	g_string_replace(event_name, "GPIODGLIB_INFO_EVENT_LINE_", "", 0);
+	info = gpiodglib_info_event_get_line_info(event);
+	offset = gpiodglib_line_info_get_offset(info);
+
+	g_print("%s %u\n", event_name->str, offset);
+}
+
+int main(void)
+{
+	static const gchar *const chip_path = "/dev/gpiochip1";
+	static const guint line_offsets[] = { 5, 3, 7 };
+	static const gsize num_lines = 3;
+
+	g_autoptr(GMainLoop) loop = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	guint i;
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	for (i = 0; i < num_lines; i++) {
+		g_autoptr(GpiodglibLineInfo) info =
+			gpiodglib_chip_watch_line_info(chip, line_offsets[i],
+						       &err);
+		if (!info) {
+			g_printerr("unable to watch line info for offset %u: %s",
+				   line_offsets[1], err->message);
+			return EXIT_FAILURE;
+		}
+	}
+
+	loop = g_main_loop_new(NULL, FALSE);
+
+	g_signal_connect(chip, "info-event", G_CALLBACK(on_info_event), NULL);
+
+	g_main_loop_run(loop);
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/watch_line_value_glib.c b/bindings/glib/examples/watch_line_value_glib.c
new file mode 100644
index 0000000..2292f16
--- /dev/null
+++ b/bindings/glib/examples/watch_line_value_glib.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of asynchronously watching for edges on a single line. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+static void on_edge_event(GpiodglibLineRequest *request G_GNUC_UNUSED,
+			  GpiodglibEdgeEvent *event,
+			  gpointer data G_GNUC_UNUSED)
+{
+	g_autoptr(GString) event_name = NULL;
+	guint64 timestamp;
+	guint offset;
+
+	event_name = g_string_new(
+			g_enum_to_string(GPIODGLIB_EDGE_EVENT_TYPE_TYPE,
+				gpiodglib_edge_event_get_event_type(event)));
+	g_string_replace(event_name, "GPIODGLIB_EDGE_EVENT_", "", 0);
+	timestamp = gpiodglib_edge_event_get_timestamp_ns(event);
+	offset = gpiodglib_edge_event_get_line_offset(event);
+
+	g_print("%s %lu %u\n", event_name->str, timestamp, offset);
+}
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const gchar *const chip_path = "/dev/gpiochip1";
+	static const guint line_offset = 5;
+
+	g_autoptr(GpiodglibRequestConfig) req_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GMainLoop) loop = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	g_array_append_val(offsets, line_offset);
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	/*
+	 * Assume a button connecting the pin to ground, so pull it up and
+	 * provide some debounce.
+	 */
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT,
+			"edge-detection", GPIODGLIB_LINE_EDGE_BOTH,
+			"bias", GPIODGLIB_LINE_BIAS_PULL_UP,
+			"debounce-period-us", 1000,
+			NULL);
+
+	line_cfg = gpiodglib_line_config_new();
+	ret = gpiodglib_line_config_add_line_settings(line_cfg, offsets,
+						      settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = gpiodglib_request_config_new("consumer", "watch-line-value",
+					       NULL);
+
+	request = gpiodglib_chip_request_lines(chip, req_cfg, line_cfg, &err);
+	if (!request) {
+		g_printerr("failed to request lines: %s", err->message);
+		return EXIT_FAILURE;
+	}
+
+	loop = g_main_loop_new(NULL, FALSE);
+
+	/* Connect to the edge-event signal on the line-request. */
+	g_signal_connect(request, "edge-event",
+			 G_CALLBACK(on_edge_event), NULL);
+
+	g_main_loop_run(loop);
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/watch_multiple_edge_rising_glib.c b/bindings/glib/examples/watch_multiple_edge_rising_glib.c
new file mode 100644
index 0000000..aa47713
--- /dev/null
+++ b/bindings/glib/examples/watch_multiple_edge_rising_glib.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/*
+ * Minimal example of asynchronously watching for rising edges on multiple
+ * lines.
+ */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+static void on_edge_event(GpiodglibLineRequest *request G_GNUC_UNUSED,
+			  GpiodglibEdgeEvent *event,
+			  gpointer data G_GNUC_UNUSED)
+{
+	g_autoptr(GString) event_name = NULL;
+	guint64 timestamp;
+	guint offset;
+
+	event_name = g_string_new(
+			g_enum_to_string(GPIODGLIB_EDGE_EVENT_TYPE_TYPE,
+				gpiodglib_edge_event_get_event_type(event)));
+	g_string_replace(event_name, "GPIODGLIB_EDGE_EVENT_", "", 0);
+	timestamp = gpiodglib_edge_event_get_timestamp_ns(event);
+	offset = gpiodglib_edge_event_get_line_offset(event);
+
+	g_print("%s %lu %u\n", event_name->str, timestamp, offset);
+}
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const gchar *const chip_path = "/dev/gpiochip1";
+	static const guint line_offsets[] = { 5, 3, 7 };
+	static const gsize num_lines = 3;
+
+	g_autoptr(GpiodglibRequestConfig) req_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GMainLoop) loop = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	g_array_append_vals(offsets, line_offsets, num_lines);
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	/*
+	 * Assume a button connecting the pin to ground, so pull it up and
+	 * provide some debounce.
+	 */
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT,
+			"edge-detection", GPIODGLIB_LINE_EDGE_RISING,
+			"bias", GPIODGLIB_LINE_BIAS_PULL_UP,
+			"debounce-period-us", 1000,
+			NULL);
+
+	line_cfg = gpiodglib_line_config_new();
+	ret = gpiodglib_line_config_add_line_settings(line_cfg, offsets,
+						      settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = gpiodglib_request_config_new(NULL);
+	gpiodglib_request_config_set_consumer(req_cfg, "watch-multiline-value");
+
+	request = gpiodglib_chip_request_lines(chip, req_cfg, line_cfg, &err);
+	if (!request) {
+		g_printerr("failed to request lines: %s", err->message);
+		return EXIT_FAILURE;
+	}
+
+	loop = g_main_loop_new(NULL, FALSE);
+
+	/* Connect to the edge-event signal on the line-request. */
+	g_signal_connect(request, "edge-event",
+			 G_CALLBACK(on_edge_event), NULL);
+
+	g_main_loop_run(loop);
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/generated-enums.c.template b/bindings/glib/generated-enums.c.template
new file mode 100644
index 0000000..c124eb7
--- /dev/null
+++ b/bindings/glib/generated-enums.c.template
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/*** BEGIN file-header ***/
+
+#include <gpiod-glib.h>
+
+/*** END file-header ***/
+
+/*** BEGIN file-production ***/
+
+/* enumerations from "@basename@" */
+
+/*** END file-production ***/
+
+/*** BEGIN value-header ***/
+
+GType @enum_name@_get_type(void)
+{
+	static gsize static_g_@type@_type_id;
+
+	if (g_once_init_enter(&static_g_@type@_type_id)) {
+		static const G@Type@Value values[] = {
+/*** END value-header ***/
+
+/*** BEGIN value-production ***/
+			{@VALUENAME@, "@VALUENAME@", "@valuenick@"},
+/*** END value-production ***/
+
+/*** BEGIN value-tail ***/
+			{ 0, NULL, NULL }
+		};
+
+		GType g_@type@_type_id = g_@type@_register_static(
+				g_intern_static_string("@EnumName@"), values);
+
+		g_once_init_leave (&static_g_@type@_type_id, g_@type@_type_id);
+	}
+
+	return static_g_@type@_type_id;
+}
+
+/*** END value-tail ***/
diff --git a/bindings/glib/generated-enums.h.template b/bindings/glib/generated-enums.h.template
new file mode 100644
index 0000000..d69d809
--- /dev/null
+++ b/bindings/glib/generated-enums.h.template
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/*** BEGIN file-header ***/
+
+#ifndef __GPIODGLIB_GENERATED_ENUMS_H__
+#define __GPIODGLIB_GENERATED_ENUMS_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+G_BEGIN_DECLS
+/*** END file-header ***/
+
+/*** BEGIN file-production ***/
+
+/*** END file-production ***/
+
+/*** BEGIN value-header ***/
+GType @enum_name@_get_type(void) G_GNUC_CONST;
+#define @ENUMPREFIX@_@ENUMSHORT@_TYPE (@enum_name@_get_type())
+/*** END value-header ***/
+
+/*** BEGIN file-tail ***/
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_GENERATED_ENUMS_H__ */
+/*** END file-tail ***/
diff --git a/bindings/glib/gpiod-glib.h b/bindings/glib/gpiod-glib.h
new file mode 100644
index 0000000..8f30452
--- /dev/null
+++ b/bindings/glib/gpiod-glib.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_H__
+#define __GPIODGLIB_H__
+
+#define __INSIDE_GPIOD_GLIB_H__
+#include "gpiod-glib/chip.h"
+#include "gpiod-glib/chip-info.h"
+#include "gpiod-glib/edge-event.h"
+#include "gpiod-glib/error.h"
+#include "gpiod-glib/generated-enums.h"
+#include "gpiod-glib/info-event.h"
+#include "gpiod-glib/line-config.h"
+#include "gpiod-glib/line-info.h"
+#include "gpiod-glib/line-request.h"
+#include "gpiod-glib/line-settings.h"
+#include "gpiod-glib/misc.h"
+#include "gpiod-glib/request-config.h"
+#undef __INSIDE_GPIOD_GLIB_H__
+
+#endif /* __GPIODGLIB_H__ */
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
diff --git a/bindings/glib/gpiod-glib/chip-info.h b/bindings/glib/gpiod-glib/chip-info.h
new file mode 100644
index 0000000..9b3b87a
--- /dev/null
+++ b/bindings/glib/gpiod-glib/chip-info.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_CHIP_INFO_H__
+#define __GPIODGLIB_CHIP_INFO_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+G_BEGIN_DECLS
+
+G_DECLARE_FINAL_TYPE(GpiodglibChipInfo, gpiodglib_chip_info,
+		     GPIODGLIB, CHIP_INFO, GObject);
+
+#define GPIODGLIB_CHIP_INFO_TYPE (gpiodglib_chip_info_get_type())
+#define GPIODGLIB_CHIP_INFO_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_CHIP_INFO_TYPE, \
+				    GpiodglibChipInfo))
+
+/**
+ * gpiodglib_chip_info_dup_name:
+ * @self: #GpiodglibChipInfo to manipulate.
+ *
+ * Get the name of the chip as represented in the kernel.
+ *
+ * Returns: (transfer full): Valid pointer to a human-readable string
+ * containing the chip name. The returned string is a copy and must be freed by
+ * the caller using g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_chip_info_dup_name(GpiodglibChipInfo *self);
+
+/**
+ * gpiodglib_chip_info_dup_label:
+ * @self: #GpiodglibChipInfo to manipulate.
+ *
+ * Get the label of the chip as represented in the kernel.
+ *
+ * Returns: (transfer full): Valid pointer to a human-readable string
+ * containing the chip label. The returned string is a copy and must be freed
+ * by the caller using g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_chip_info_dup_label(GpiodglibChipInfo *self);
+
+/**
+ * gpiodglib_chip_info_get_num_lines:
+ * @self: #GpiodglibChipInfo to manipulate.
+ *
+ * Get the number of lines exposed by the chip.
+ *
+ * Returns: Number of GPIO lines.
+ */
+guint gpiodglib_chip_info_get_num_lines(GpiodglibChipInfo *self);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_CHIP_INFO_H__ */
diff --git a/bindings/glib/gpiod-glib/chip.h b/bindings/glib/gpiod-glib/chip.h
new file mode 100644
index 0000000..d15d798
--- /dev/null
+++ b/bindings/glib/gpiod-glib/chip.h
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_CHIP_H__
+#define __GPIODGLIB_CHIP_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+#include "chip-info.h"
+#include "line-config.h"
+#include "line-info.h"
+#include "line-request.h"
+#include "request-config.h"
+
+G_BEGIN_DECLS
+
+G_DECLARE_FINAL_TYPE(GpiodglibChip, gpiodglib_chip, GPIODGLIB, CHIP, GObject);
+
+#define GPIODGLIB_CHIP_TYPE (gpiodglib_chip_get_type())
+#define GPIODGLIB_CHIP_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_CHIP_TYPE, GpiodglibChip))
+
+/**
+ * gpiodglib_chip_new:
+ * @path: Path to the device file to open.
+ * @err: Return location for error or %NULL.
+ *
+ * Instantiates a new chip object by opening the device file indicated by path.
+ *
+ * Returns: (transfer full): New GPIO chip object.
+ */
+GpiodglibChip *gpiodglib_chip_new(const gchar *path, GError **err);
+
+/**
+ * gpiodglib_chip_close:
+ * @self: #GpiodglibChip to close.
+ *
+ * Close the GPIO chip device file and free associated resources.
+ *
+ * The chip object can live after calling this method but any of the chip's
+ * methods will result in an error being set.
+ */
+void gpiodglib_chip_close(GpiodglibChip *self);
+
+/**
+ * gpiodglib_chip_is_closed:
+ * @self: #GpiodglibChip to manipulate.
+ *
+ * @brief Check if this object is valid.
+ *
+ * Returns: TRUE if this object's methods can be used, FALSE otherwise.
+ */
+gboolean gpiodglib_chip_is_closed(GpiodglibChip *self);
+
+/**
+ * gpiodglib_chip_dup_path:
+ * @self: #GpiodglibChip to manipulate.
+ *
+ * Get the filesystem path that was used to open this GPIO chip.
+ *
+ * Returns: Path to the underlying character device file. The string is a copy
+ * and must be freed by the caller with g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_chip_dup_path(GpiodglibChip *self);
+
+/**
+ * gpiodglib_chip_get_info:
+ * @self: #GpiodglibChip to manipulate.
+ * @err: Return location for error or %NULL.
+ *
+ * Get information about the chip.
+ *
+ * Returns: (transfer full): New #GpiodglibChipInfo.
+ */
+GpiodglibChipInfo *gpiodglib_chip_get_info(GpiodglibChip *self, GError **err);
+
+/**
+ * gpiodglib_chip_get_line_info:
+ * @self: #GpiodglibChip to manipulate.
+ * @offset: Offset of the line to get the info for.
+ * @err: Return location for error or %NULL.
+ *
+ * Retrieve the current snapshot of line information for a single line.
+ *
+ * Returns: (transfer full): New #GpiodglibLineInfo.
+ */
+GpiodglibLineInfo *
+gpiodglib_chip_get_line_info(GpiodglibChip *self, guint offset, GError **err);
+
+/**
+ * gpiodglib_chip_watch_line_info:
+ * @self: #GpiodglibChip to manipulate.
+ * @offset: Offset of the line to get the info for and to watch.
+ * @err: Return location for error or %NULL.
+ *
+ * Retrieve the current snapshot of line information for a single line and
+ * start watching this line for future changes.
+ *
+ * Returns: (transfer full): New #GpiodglibLineInfo.
+ */
+GpiodglibLineInfo *
+gpiodglib_chip_watch_line_info(GpiodglibChip *self, guint offset, GError **err);
+
+/**
+ * gpiodglib_chip_unwatch_line_info:
+ * @self: #GpiodglibChip to manipulate.
+ * @offset: Offset of the line to get the info for.
+ * @err: Return location for error or %NULL.
+ *
+ * Stop watching the line at given offset for info events.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean
+gpiodglib_chip_unwatch_line_info(GpiodglibChip *self, guint offset,
+				 GError **err);
+
+/**
+ * gpiodglib_chip_get_line_offset_from_name:
+ * @self: #GpiodglibChip to manipulate.
+ * @name: Name of the GPIO line to map.
+ * @offset: Return location for the mapped offset.
+ * @err: Return location for error or %NULL.
+ *
+ * Map a GPIO line's name to its offset within the chip.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean
+gpiodglib_chip_get_line_offset_from_name(GpiodglibChip *self, const gchar *name,
+					 guint *offset, GError **err);
+
+/**
+ * gpiodglib_chip_request_lines:
+ * @self: #GpiodglibChip to manipulate.
+ * @req_cfg: Request config object. Can be NULL for default settings.
+ * @line_cfg: Line config object.
+ * @err: Return location for error or %NULL.
+ *
+ * Request a set of lines for exclusive usage.
+ *
+ * Returns: (transfer full): New #GpiodglibLineRequest.
+ */
+GpiodglibLineRequest *
+gpiodglib_chip_request_lines(GpiodglibChip *self,
+			     GpiodglibRequestConfig *req_cfg,
+			     GpiodglibLineConfig *line_cfg, GError **err);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_CHIP_H__ */
diff --git a/bindings/glib/gpiod-glib/edge-event.h b/bindings/glib/gpiod-glib/edge-event.h
new file mode 100644
index 0000000..2fa8339
--- /dev/null
+++ b/bindings/glib/gpiod-glib/edge-event.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_EDGE_EVENT_H__
+#define __GPIODGLIB_EDGE_EVENT_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+#include "line-info.h"
+
+G_BEGIN_DECLS
+
+G_DECLARE_FINAL_TYPE(GpiodglibEdgeEvent, gpiodglib_edge_event,
+		     GPIODGLIB, EDGE_EVENT, GObject);
+
+#define GPIODGLIB_EDGE_EVENT_TYPE (gpiodglib_edge_event_get_type())
+#define GPIODGLIB_EDGE_EVENT_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_EDGE_EVENT_TYPE, \
+				    GpiodglibEdgeEvent))
+
+/**
+ * GpiodglibEdgeEventType:
+ * @GPIODGLIB_EDGE_EVENT_RISING_EDGE: Rising edge event.
+ * @GPIODGLIB_EDGE_EVENT_FALLING_EDGE: Falling edge event.
+ *
+ * Edge event types.
+ */
+typedef enum {
+	GPIODGLIB_EDGE_EVENT_RISING_EDGE = 1,
+	GPIODGLIB_EDGE_EVENT_FALLING_EDGE,
+} GpiodglibEdgeEventType;
+
+/**
+ * gpiodglib_edge_event_get_event_type:
+ * @self: #GpiodglibEdgeEvent to manipulate.
+ *
+ * Get the event type.
+ *
+ * Returns: The event type (@GPIODGLIB_EDGE_EVENT_RISING_EDGE or
+ * @GPIODGLIB_EDGE_EVENT_FALLING_EDGE).
+ */
+GpiodglibEdgeEventType
+gpiodglib_edge_event_get_event_type(GpiodglibEdgeEvent *self);
+
+/**
+ * gpiodglib_edge_event_get_timestamp_ns:
+ * @self: #GpiodglibEdgeEvent to manipulate.
+ *
+ * Get the timestamp of the event.
+ *
+ * The source clock for the timestamp depends on the event_clock setting for
+ * the line.
+ *
+ * Returns: Timestamp in nanoseconds.
+ */
+guint64 gpiodglib_edge_event_get_timestamp_ns(GpiodglibEdgeEvent *self);
+
+/**
+ * gpiodglib_edge_event_get_line_offset:
+ * @self: #GpiodglibEdgeEvent to manipulate.
+ *
+ * Get the offset of the line which triggered the event.
+ *
+ * Returns: Line offset.
+ */
+guint gpiodglib_edge_event_get_line_offset(GpiodglibEdgeEvent *self);
+
+/**
+ * gpiodglib_edge_event_get_global_seqno:
+ * @self: #GpiodglibEdgeEvent to manipulate.
+ *
+ * Get the global sequence number of the event.
+ *
+ * Returns: Sequence number of the event in the series of events for all lines
+ * in the associated line request.
+ */
+gulong gpiodglib_edge_event_get_global_seqno(GpiodglibEdgeEvent *self);
+
+/**
+ * gpiodglib_edge_event_get_line_seqno:
+ * @self: #GpiodglibEdgeEvent to manipulate.
+ *
+ * Get the event sequence number specific to the line.
+ *
+ * Returns: Sequence number of the event in the series of events only for this
+ * line within the lifetime of the associated line request.
+ */
+gulong gpiodglib_edge_event_get_line_seqno(GpiodglibEdgeEvent *self);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_EDGE_EVENT_H__ */
diff --git a/bindings/glib/gpiod-glib/error.h b/bindings/glib/gpiod-glib/error.h
new file mode 100644
index 0000000..e23f07e
--- /dev/null
+++ b/bindings/glib/gpiod-glib/error.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_ERROR_H__
+#define __GPIODGLIB_ERROR_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+
+G_BEGIN_DECLS
+
+#define GPIODGLIB_ERROR gpiodglib_error_quark()
+
+typedef enum {
+	GPIODGLIB_ERR_FAILED = 1,
+	GPIODGLIB_ERR_CHIP_CLOSED,
+	GPIODGLIB_ERR_REQUEST_RELEASED,
+	GPIODGLIB_ERR_PERM,
+	GPIODGLIB_ERR_NOENT,
+	GPIODGLIB_ERR_INTR,
+	GPIODGLIB_ERR_IO,
+	GPIODGLIB_ERR_NXIO,
+	GPIODGLIB_ERR_E2BIG,
+	GPIODGLIB_ERR_BADFD,
+	GPIODGLIB_ERR_CHILD,
+	GPIODGLIB_ERR_AGAIN,
+	GPIODGLIB_ERR_NOMEM,
+	GPIODGLIB_ERR_ACCES,
+	GPIODGLIB_ERR_FAULT,
+	GPIODGLIB_ERR_BUSY,
+	GPIODGLIB_ERR_EXIST,
+	GPIODGLIB_ERR_NODEV,
+	GPIODGLIB_ERR_INVAL,
+	GPIODGLIB_ERR_NOTTY,
+	GPIODGLIB_ERR_PIPE,
+} GpiodglibError;
+
+GQuark gpiodglib_error_quark(void);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_ERROR_H__ */
diff --git a/bindings/glib/gpiod-glib/info-event.h b/bindings/glib/gpiod-glib/info-event.h
new file mode 100644
index 0000000..ba8ad54
--- /dev/null
+++ b/bindings/glib/gpiod-glib/info-event.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_INFO_EVENT_H__
+#define __GPIODGLIB_INFO_EVENT_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+#include "line-info.h"
+
+G_BEGIN_DECLS
+
+G_DECLARE_FINAL_TYPE(GpiodglibInfoEvent, gpiodglib_info_event,
+		     GPIODGLIB, INFO_EVENT, GObject);
+
+#define GPIODGLIB_INFO_EVENT_TYPE (gpiodglib_info_event_get_type())
+#define GPIODGLIB_INFO_EVENT_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_INFO_EVENT_TYPE, \
+				    GpiodglibInfoEvent))
+
+/**
+ * GpiodglibInfoEventType:
+ * @GPIODGLIB_INFO_EVENT_LINE_REQUESTED: Line has been requested.
+ * @GPIODGLIB_INFO_EVENT_LINE_RELEASED: Previously requested line has been
+ * released.
+ * @GPIODGLIB_INFO_EVENT_LINE_CONFIG_CHANGED: Line configuration has changed.
+ *
+ * Line status change event types.
+ */
+typedef enum {
+	GPIODGLIB_INFO_EVENT_LINE_REQUESTED = 1,
+	GPIODGLIB_INFO_EVENT_LINE_RELEASED,
+	GPIODGLIB_INFO_EVENT_LINE_CONFIG_CHANGED,
+} GpiodglibInfoEventType;
+
+/**
+ * gpiodglib_info_event_get_event_type:
+ * @self: #GpiodglibInfoEvent to manipulate.
+ *
+ * Get the event type of the status change event.
+ *
+ * Returns: One of @GPIODGLIB_INFO_EVENT_LINE_REQUESTED,
+ * @GPIODGLIB_INFO_EVENT_LINE_RELEASED or
+ * @GPIODGLIB_INFO_EVENT_LINE_CONFIG_CHANGED.
+ */
+GpiodglibInfoEventType
+gpiodglib_info_event_get_event_type(GpiodglibInfoEvent *self);
+
+/**
+ * gpiodglib_info_event_get_timestamp_ns:
+ * @self: #GpiodglibInfoEvent to manipulate.
+ *
+ * Get the timestamp of the event.
+ *
+ * Returns: Timestamp in nanoseconds, read from the monotonic clock.
+ */
+guint64 gpiodglib_info_event_get_timestamp_ns(GpiodglibInfoEvent *self);
+
+/**
+ * gpiodglib_info_event_get_line_info:
+ * @self #GpiodglibInfoEvent to manipulate.
+ *
+ * Get the snapshot of line-info associated with the event.
+ *
+ * Returns: (transfer full): New reference to the associated line-info object.
+ */
+GpiodglibLineInfo *gpiodglib_info_event_get_line_info(GpiodglibInfoEvent *self);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_INFO_EVENT_H__ */
diff --git a/bindings/glib/gpiod-glib/line-config.h b/bindings/glib/gpiod-glib/line-config.h
new file mode 100644
index 0000000..20ce33d
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line-config.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_LINE_CONFIG_H__
+#define __GPIODGLIB_LINE_CONFIG_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+#include "line-settings.h"
+
+G_BEGIN_DECLS
+
+G_DECLARE_FINAL_TYPE(GpiodglibLineConfig, gpiodglib_line_config,
+		     GPIODGLIB, LINE_CONFIG, GObject);
+
+#define GPIODGLIB_LINE_CONFIG_TYPE (gpiodglib_line_config_get_type())
+#define GPIODGLIB_LINE_CONFIG_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_LINE_CONFIG_TYPE, \
+				    GpiodglibLineConfig))
+
+/**
+ * gpiodglib_line_config_new:
+ *
+ * Create a new #GpiodglibLineConfig.
+ *
+ * Returns: (transfer full): Empty #GpiodglibLineConfig.
+ */
+GpiodglibLineConfig *gpiodglib_line_config_new(void);
+
+/**
+ * gpiodglib_line_config_reset:
+ * @self: #GpiodglibLineConfig to manipulate.
+ *
+ * Reset the line config object.
+ */
+void gpiodglib_line_config_reset(GpiodglibLineConfig *self);
+
+/**
+ * gpiodglib_line_config_add_line_settings:
+ * @self: #GpiodglibLineConfig to manipulate.
+ * @offsets: (element-type GArray): GArray of offsets for which to apply the
+ * settings.
+ * @settings: #GpiodglibLineSettings to apply.
+ * @err: Return location for error or NULL.
+ *
+ * Add line settings for a set of offsets.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean
+gpiodglib_line_config_add_line_settings(GpiodglibLineConfig *self,
+					const GArray *offsets,
+					GpiodglibLineSettings *settings,
+					GError **err);
+
+/**
+ * gpiodglib_line_config_get_line_settings:
+ * @self: #GpiodglibLineConfig to manipulate.
+ * @offset: Offset for which to get line settings.
+ *
+ * Get line settings for offset.
+ *
+ * Returns: (transfer full): New reference to a #GpiodglibLineSettings.
+ */
+GpiodglibLineSettings *
+gpiodglib_line_config_get_line_settings(GpiodglibLineConfig *self,
+					guint offset);
+
+/**
+ * gpiodglib_line_config_set_output_values:
+ * @self: #GpiodglibLineConfig to manipulate.
+ * @values: (element-type GArray): GArray containing the output values.
+ * @err: Return location for error or NULL.
+ *
+ * @brief Set output values for a number of lines.
+ *
+ * Returns: TRUE on success, FALSE on error.
+ */
+gboolean gpiodglib_line_config_set_output_values(GpiodglibLineConfig *self,
+						 const GArray *values,
+						 GError **err);
+
+/**
+ * gpiodglib_line_config_get_configured_offsets:
+ * @self: #GpiodglibLineConfig to manipulate.
+ *
+ * Get configured offsets.
+ *
+ * Returns: (transfer full) (element-type GArray): GArray containing the
+ * offsets for which configuration has been set.
+ */
+GArray *gpiodglib_line_config_get_configured_offsets(GpiodglibLineConfig *self);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_LINE_CONFIG_H__ */
diff --git a/bindings/glib/gpiod-glib/line-info.h b/bindings/glib/gpiod-glib/line-info.h
new file mode 100644
index 0000000..60fcad7
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line-info.h
@@ -0,0 +1,171 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_LINE_INFO_H__
+#define __GPIODGLIB_LINE_INFO_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+#include "line.h"
+
+G_BEGIN_DECLS
+
+G_DECLARE_FINAL_TYPE(GpiodglibLineInfo, gpiodglib_line_info,
+		     GPIODGLIB, LINE_INFO, GObject);
+
+#define GPIODGLIB_LINE_INFO_TYPE (gpiodglib_line_info_get_type())
+#define GPIODGLIB_LINE_INFO_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_LINE_INFO_TYPE, \
+				    GpiodglibLineInfo))
+
+/**
+ * gpiodglib_line_info_get_offset:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Get the offset of the line.
+ *
+ * The offset uniquely identifies the line on the chip. The combination of the
+ * chip and offset uniquely identifies the line within the system.
+ *
+ * Returns: Offset of the line within the parent chip.
+ */
+guint gpiodglib_line_info_get_offset(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_dup_name:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Get the name of the line.
+ *
+ * Returns: Name of the GPIO line as it is represented in the kernel. This
+ * function returns a valid pointer to a null-terminated string or NULL if the
+ * line is unnamed. The string is a copy of the line name and must be freed by
+ * the caller with g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_line_info_dup_name(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_is_used:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Check if the line is in use.
+ *
+ * The exact reason a line is busy cannot be determined from user space.
+ * It may have been requested by another process or hogged by the kernel.
+ * It only matters that the line is used and can't be requested until
+ * released by the existing consumer.
+ *
+ * Returns: TRUE if the line is in use, FALSE otherwise.
+ */
+gboolean gpiodglib_line_info_is_used(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_dup_consumer:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Get the name of the consumer of the line.
+ *
+ * Returns: Name of the GPIO consumer as it is represented in the kernel. This
+ * function returns a valid pointer to a null-terminated string or NULL if the
+ * consumer name is not set. The string is a copy of the consumer label and
+ * must be freed by the caller with g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_line_info_dup_consumer(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_get_direction:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Get the direction setting of the line.
+ *
+ * Returns: @GPIODGLIB_LINE_DIRECTION_INPUT or @GPIODGLIB_LINE_DIRECTION_OUTPUT.
+ */
+GpiodglibLineDirection
+gpiodglib_line_info_get_direction(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_get_edge_detection:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Get the edge detection setting of the line.
+ *
+ * Returns: @GPIODGLIB_LINE_EDGE_NONE, @GPIODGLIB_LINE_EDGE_RISING,
+ * @GPIODGLIB_LINE_EDGE_FALLING or @GPIODGLIB_LINE_EDGE_BOTH.
+ */
+GpiodglibLineEdge
+gpiodglib_line_info_get_edge_detection(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_get_bias:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Get the bias setting of the line.
+ *
+ * Returns: @GPIODGLIB_LINE_BIAS_PULL_UP, @GPIODGLIB_LINE_BIAS_PULL_DOWN,
+ * @GPIODGLIB_LINE_BIAS_DISABLED or @GPIODGLIB_LINE_BIAS_UNKNOWN.
+ */
+GpiodglibLineBias gpiodglib_line_info_get_bias(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_get_drive:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Get the drive setting of the line.
+ *
+ * Returns: @GPIODGLIB_LINE_DRIVE_PUSH_PULL, @GPIODGLIB_LINE_DRIVE_OPEN_DRAIN
+ * or @GPIODGLIB_LINE_DRIVE_OPEN_SOURCE.
+ */
+GpiodglibLineDrive gpiodglib_line_info_get_drive(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_is_active_low:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Check if the logical value of the line is inverted compared to the physical.
+ *
+ * Returns: TRUE if the line is "active-low", FALSE otherwise.
+ */
+gboolean gpiodglib_line_info_is_active_low(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_is_debounced:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Check if the line is debounced (either by hardware or by the kernel
+ * software debouncer).
+ *
+ * Returns: TRUE if the line is debounced, FALSE otherwise.
+ */
+gboolean gpiodglib_line_info_is_debounced(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_get_debounce_period_us:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Get the debounce period of the line, in microseconds.
+ *
+ * Returns: Debounce period in microseconds. 0 if the line is not debounced.
+ */
+GTimeSpan gpiodglib_line_info_get_debounce_period_us(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_get_event_clock:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Get the event clock setting used for edge event timestamps for the line.
+ *
+ * Returns: @GPIODGLIB_LINE_CLOCK_MONOTONIC, @GPIODGLIB_LINE_CLOCK_HTE or
+ * @GPIODGLIB_LINE_CLOCK_REALTIME.
+ */
+GpiodglibLineClock gpiodglib_line_info_get_event_clock(GpiodglibLineInfo *self);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_LINE_INFO_H__ */
diff --git a/bindings/glib/gpiod-glib/line-request.h b/bindings/glib/gpiod-glib/line-request.h
new file mode 100644
index 0000000..98393ec
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line-request.h
@@ -0,0 +1,186 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_LINE_REQUEST_H__
+#define __GPIODGLIB_LINE_REQUEST_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+G_BEGIN_DECLS
+
+G_DECLARE_FINAL_TYPE(GpiodglibLineRequest, gpiodglib_line_request,
+		     GPIODGLIB, LINE_REQUEST, GObject);
+
+#define GPIODGLIB_LINE_REQUEST_TYPE (gpiodglib_line_request_get_type())
+#define GPIODGLIB_LINE_REQUEST_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_LINE_REQUEST_TYPE, \
+				    GpiodglibLineRequest))
+
+/**
+ * gpiodglib_line_request_release:
+ * @self: #GpiodglibLineRequest to manipulate.
+ *
+ * Release the requested lines and free all associated resources.
+ */
+void gpiodglib_line_request_release(GpiodglibLineRequest *self);
+
+/**
+ * gpiodglib_line_request_is_released:
+ * @self: #GpiodglibLineRequest to manipulate.
+ *
+ * Check if this request was released.
+ *
+ * Returns: TRUE if this request was released and is no longer valid, FALSE
+ * otherwise.
+ */
+gboolean gpiodglib_line_request_is_released(GpiodglibLineRequest *self);
+
+/**
+ * gpiodglib_line_request_dup_chip_name:
+ * @self: #GpiodglibLineRequest to manipulate.
+ *
+ * Get the name of the chip this request was made on.
+ *
+ * Returns: Name the GPIO chip device. The string is a copy and must be freed
+ * by the caller using g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_line_request_dup_chip_name(GpiodglibLineRequest *self);
+
+/**
+ * gpiodglib_line_request_get_requested_offsets:
+ * @self: #GpiodglibLineRequest to manipulate.
+ *
+ * Get the offsets of the lines in the request.
+ *
+ * Returns: (transfer full) (element-type GArray): Array containing the
+ * requested offsets.
+ */
+GArray *
+gpiodglib_line_request_get_requested_offsets(GpiodglibLineRequest *self);
+
+/**
+ * gpiodglib_line_request_reconfigure_lines:
+ * @self: #GpiodglibLineRequest to manipulate.
+ * @config: New line config to apply.
+ * @err: Return location for error or NULL.
+ *
+ * Update the configuration of lines associated with a line request.
+ *
+ * The new line configuration completely replaces the old. Any requested lines
+ * without overrides are configured to the requested defaults. Any configured
+ * overrides for lines that have not been requested are silently ignored.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean gpiodglib_line_request_reconfigure_lines(GpiodglibLineRequest *self,
+						  GpiodglibLineConfig *config,
+						  GError **err);
+
+/**
+ * gpiodglib_line_request_get_value:
+ * @self: #GpiodglibLineRequest to manipulate.
+ * @offset: The offset of the line of which the value should be read.
+ * @value: Return location for the value.
+ * @err: Return location for error or NULL.
+ *
+ * Get the value of a single requested line.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean
+gpiodglib_line_request_get_value(GpiodglibLineRequest *self, guint offset,
+				 GpiodglibLineValue *value, GError **err);
+
+/**
+ * gpiodglib_line_request_get_values_subset:
+ * @self: #GpiodglibLineRequest to manipulate.
+ * @offsets: (element-type GArray): Array of offsets identifying the subset of
+ * requested lines from which to read values.
+ * @values: (element-type GArray): Array in which the values will be stored.
+ * Can be NULL in which case a new array will be created and its location
+ * stored here.
+ * @err: Return location for error or NULL.
+ *
+ * Get the values of a subset of requested lines.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean gpiodglib_line_request_get_values_subset(GpiodglibLineRequest *self,
+						  const GArray *offsets,
+						  GArray **values,
+						  GError **err);
+
+/**
+ * gpiodglib_line_request_get_values:
+ * @self: #GpiodglibLineRequest to manipulate.
+ * @values: (element-type GArray): Array in which the values will be stored.
+ * Can be NULL in which case a new array will be created and its location
+ * stored here.
+ * @err: Return location for error or NULL.
+ *
+ * Get the values of all requested lines.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean gpiodglib_line_request_get_values(GpiodglibLineRequest *self,
+					   GArray **values, GError **err);
+
+/**
+ * gpiodglib_line_request_set_value:
+ * @self: #GpiodglibLineRequest to manipulate.
+ * @offset: The offset of the line for which the value should be set.
+ * @value: Value to set.
+ * @err: Return location for error or NULL.
+ *
+ * Set the value of a single requested line.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean
+gpiodglib_line_request_set_value(GpiodglibLineRequest *self, guint offset,
+				 GpiodglibLineValue value, GError **err);
+
+/**
+ * gpiodglib_line_request_set_values_subset:
+ * @self: #GpiodglibLineRequest to manipulate.
+ * @offsets: (element-type GArray): Array of offsets identifying the requested
+ * lines for which to set values.
+ * @values: (element-type GArray): Array in which the values will be stored.
+ * Can be NULL in which case a new array will be created and its location
+ * stored here.
+ * @err: Return location for error or NULL.
+ *
+ * Set the values of a subset of requested lines.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean gpiodglib_line_request_set_values_subset(GpiodglibLineRequest *self,
+						  const GArray *offsets,
+						  const GArray *values,
+						  GError **err);
+
+/**
+ * gpiodglib_line_request_set_values:
+ * @self: #GpiodglibLineRequest to manipulate.
+ * @values: (element-type GArray): Array containing the values to set. Must be
+ * sized to contain the number of values equal to the number of requested lines.
+ * Each value is associated with the line identified by the corresponding entry
+ * in the offset array filled by @gpiodglib_line_request_get_requested_offsets.
+ * @err: Return location for error or NULL.
+ *
+ * Set the values of all lines associated with a request.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean gpiodglib_line_request_set_values(GpiodglibLineRequest *self,
+					   GArray *values, GError **err);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_LINE_REQUEST_H__ */
diff --git a/bindings/glib/gpiod-glib/line-settings.h b/bindings/glib/gpiod-glib/line-settings.h
new file mode 100644
index 0000000..3f14b91
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line-settings.h
@@ -0,0 +1,220 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_LINE_SETTINGS_H__
+#define __GPIODGLIB_LINE_SETTINGS_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+#include "line.h"
+
+G_BEGIN_DECLS
+
+G_DECLARE_FINAL_TYPE(GpiodglibLineSettings, gpiodglib_line_settings,
+		     GPIODGLIB, LINE_SETTINGS, GObject);
+
+#define GPIODGLIB_LINE_SETTINGS_TYPE (gpiodglib_line_settings_get_type())
+#define GPIODGLIB_LINE_SETTINGS_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_LINE_SETTINGS_TYPE, \
+				    GpiodglibLineSettings))
+
+/**
+ * gpiodglib_line_settings_new:
+ * @first_prop: Name of the first property to set.
+ *
+ * Create a new line settings object.
+ *
+ * The constructor allows to set object's properties when it's first created
+ * instead of having to build an empty object and then call mutators separately.
+ *
+ * Currently supported properties are: `direction`, `edge-detection`, `bias`,
+ * `drive`, `debounce-period-us`, `active-low`, 'event-clock` and
+ * `output-value`.
+ *
+ * Returns: New #GpiodglibLineSettings.
+ */
+GpiodglibLineSettings *
+gpiodglib_line_settings_new(const gchar *first_prop, ...);
+
+/**
+ * gpiodglib_line_settings_reset:
+ * @self: #GpiodglibLineSettings to manipulate.
+ *
+ * Reset the line settings object to its default values.
+ */
+void gpiodglib_line_settings_reset(GpiodglibLineSettings *self);
+
+/**
+ * gpiodglib_line_settings_set_direction:
+ * @self: #GpiodglibLineSettings to manipulate.
+ * @direction: New direction.
+ *
+ * Set direction.
+ */
+void gpiodglib_line_settings_set_direction(GpiodglibLineSettings *self,
+					   GpiodglibLineDirection direction);
+
+/**
+ * gpiodglib_line_settings_get_direction:
+ * @self: #GpiodglibLineSettings to manipulate.
+ *
+ * Get direction.
+ *
+ * Returns: Current direction.
+ */
+GpiodglibLineDirection
+gpiodglib_line_settings_get_direction(GpiodglibLineSettings *self);
+
+/**
+ * gpiodglib_line_settings_set_edge_detection:
+ * @self: #GpiodglibLineSettings to manipulate.
+ * @edge: New edge detection setting.
+ *
+ * Set edge detection.
+ */
+void gpiodglib_line_settings_set_edge_detection(GpiodglibLineSettings *self,
+						GpiodglibLineEdge edge);
+
+/**
+ * gpiodglib_line_settings_get_edge_detection:
+ * @self: #GpiodglibLineSettings to manipulate.
+ *
+ * Get edge detection.
+ *
+ * Returns: Current edge detection setting.
+ */
+GpiodglibLineEdge
+gpiodglib_line_settings_get_edge_detection(GpiodglibLineSettings *self);
+
+/**
+ * gpiodglib_line_settings_set_bias:
+ * @self: #GpiodglibLineSettings to manipulate.
+ * @bias: New bias.
+ *
+ * Set bias.
+ */
+void gpiodglib_line_settings_set_bias(GpiodglibLineSettings *self,
+				      GpiodglibLineBias bias);
+
+/**
+ * gpiodglib_line_settings_get_bias:
+ * @self: #GpiodglibLineSettings to manipulate.
+ *
+ * Get bias.
+ *
+ * Returns: Current bias setting.
+ */
+GpiodglibLineBias gpiodglib_line_settings_get_bias(GpiodglibLineSettings *self);
+
+/**
+ * gpiodglib_line_settings_set_drive:
+ * @self: #GpiodglibLineSettings to manipulate.
+ * @drive: New drive setting.
+ *
+ * Set drive.
+ */
+void gpiodglib_line_settings_set_drive(GpiodglibLineSettings *self,
+				       GpiodglibLineDrive drive);
+
+/**
+ * gpiodglib_line_settings_get_drive:
+ * @self: #GpiodglibLineSettings to manipulate.
+ *
+ * Get drive.
+ *
+ * Returns: Current drive setting.
+ */
+GpiodglibLineDrive
+gpiodglib_line_settings_get_drive(GpiodglibLineSettings *self);
+
+/**
+ * gpiodglib_line_settings_set_active_low:
+ * @self: #GpiodglibLineSettings to manipulate.
+ * @active_low: New active-low setting.
+ *
+ * Set active-low setting.
+ */
+void gpiodglib_line_settings_set_active_low(GpiodglibLineSettings *self,
+					    gboolean active_low);
+
+/**
+ * gpiodglib_line_settings_get_active_low:
+ * @self: #GpiodglibLineSettings to manipulate.
+ *
+ * Get active-low setting.
+ *
+ * Returns: TRUE if active-low is enabled, FALSE otherwise.
+ */
+gboolean gpiodglib_line_settings_get_active_low(GpiodglibLineSettings *self);
+
+/**
+ * gpiodglib_line_settings_set_debounce_period_us:
+ * @self: #GpiodglibLineSettings to manipulate.
+ * @period: New debounce period in microseconds.
+ *
+ * Set debounce period.
+ */
+void gpiodglib_line_settings_set_debounce_period_us(GpiodglibLineSettings *self,
+						    GTimeSpan period);
+
+/**
+ * gpiodglib_line_settings_get_debounce_period_us:
+ * @self: #GpiodglibLineSettings to manipulate.
+ *
+ * Get debounce period.
+ *
+ * Returns: Current debounce period in microseconds.
+ */
+GTimeSpan
+gpiodglib_line_settings_get_debounce_period_us(GpiodglibLineSettings *self);
+
+/**
+ * gpiodglib_line_settings_set_event_clock:
+ * @self: #GpiodglibLineSettings to manipulate.
+ * @event_clock: New event clock.
+ *
+ * Set event clock.
+ */
+void gpiodglib_line_settings_set_event_clock(GpiodglibLineSettings *self,
+					     GpiodglibLineClock event_clock);
+
+/**
+ * gpiodglib_line_settings_get_event_clock:
+ * @self: #GpiodglibLineSettings to manipulate.
+ *
+ * Get event clock setting.
+ *
+ * Returns: Current event clock setting.
+ */
+GpiodglibLineClock
+gpiodglib_line_settings_get_event_clock(GpiodglibLineSettings *self);
+
+/**
+ * gpiodglib_line_settings_set_output_value:
+ * @self: #GpiodglibLineSettings to manipulate.
+ * @value: New output value.
+ *
+ * Set the output value.
+ */
+void gpiodglib_line_settings_set_output_value(GpiodglibLineSettings *self,
+					      GpiodglibLineValue value);
+
+/**
+ * gpiodglib_line_settings_get_output_value:
+ * @self: #GpiodglibLineSettings to manipulate.
+ *
+ * Get the output value.
+ *
+ * Returns: Current output value.
+ */
+GpiodglibLineValue
+gpiodglib_line_settings_get_output_value(GpiodglibLineSettings *self);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_LINE_SETTINGS_H__ */
diff --git a/bindings/glib/gpiod-glib/line.h b/bindings/glib/gpiod-glib/line.h
new file mode 100644
index 0000000..16bcd9c
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_LINE_H__
+#define __GPIODGLIB_LINE_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+
+G_BEGIN_DECLS
+
+
+/**
+ * GpiodglibLineValue:
+ * @GPIODGLIB_LINE_VALUE_INACTIVE: Line is logically inactive.
+ * @GPIODGLIB_LINE_VALUE_ACTIVE: Line is logically active.
+ *
+ * Logical line state.
+ */
+typedef enum {
+	GPIODGLIB_LINE_VALUE_INACTIVE = 0,
+	GPIODGLIB_LINE_VALUE_ACTIVE = 1,
+} GpiodglibLineValue;
+
+/**
+ * GpiodglibLineDirection:
+ * @GPIODGLIB_LINE_DIRECTION_AS_IS: Request the line(s), but don't change
+ * direction.
+ * @GPIODGLIB_LINE_DIRECTION_INPUT: Direction is input - for reading the value
+ * of an externally driven GPIO line.
+ * @GPIODGLIB_LINE_DIRECTION_OUTPUT: Direction is output - for driving the GPIO
+ * line.
+ *
+ * Direction settings.
+ */
+typedef enum {
+	GPIODGLIB_LINE_DIRECTION_AS_IS = 1,
+	GPIODGLIB_LINE_DIRECTION_INPUT,
+	GPIODGLIB_LINE_DIRECTION_OUTPUT,
+} GpiodglibLineDirection;
+
+/**
+ * GpiodglibLineEdge
+ * @GPIODGLIB_LINE_EDGE_NONE: Line edge detection is disabled.
+ * @GPIODGLIB_LINE_EDGE_RISING: Line detects rising edge events.
+ * @GPIODGLIB_LINE_EDGE_FALLING: Line detects falling edge events.
+ * @GPIODGLIB_LINE_EDGE_BOTH: Line detects both rising and falling edge events.
+ *
+ * Edge detection settings.
+ */
+typedef enum {
+	GPIODGLIB_LINE_EDGE_NONE = 1,
+	GPIODGLIB_LINE_EDGE_RISING,
+	GPIODGLIB_LINE_EDGE_FALLING,
+	GPIODGLIB_LINE_EDGE_BOTH,
+} GpiodglibLineEdge;
+
+/**
+ * GpiodglibLineBias:
+ * @GPIODGLIB_LINE_BIAS_AS_IS: Don't change the bias setting when applying line
+ * config.
+ * @GPIODGLIB_LINE_BIAS_UNKNOWN: The internal bias state is unknown.
+ * @GPIODGLIB_LINE_BIAS_DISABLED: The internal bias is disabled.
+ * @GPIODGLIB_LINE_BIAS_PULL_UP: The internal pull-up bias is enabled.
+ * @GPIODGLIB_LINE_BIAS_PULL_DOWN: The internal pull-down bias is enabled.
+ *
+ * Internal bias settings.
+ */
+typedef enum {
+	GPIODGLIB_LINE_BIAS_AS_IS = 1,
+	GPIODGLIB_LINE_BIAS_UNKNOWN,
+	GPIODGLIB_LINE_BIAS_DISABLED,
+	GPIODGLIB_LINE_BIAS_PULL_UP,
+	GPIODGLIB_LINE_BIAS_PULL_DOWN,
+} GpiodglibLineBias;
+
+/**
+ * GpiodglibLineDrive:
+ * @GPIODGLIB_LINE_DRIVE_PUSH_PULL: Drive setting is push-pull.
+ * @GPIODGLIB_LINE_DRIVE_OPEN_DRAIN: Line output is open-drain.
+ * @GPIODGLIB_LINE_DRIVE_OPEN_SOURCE: Line output is open-source.
+ *
+ * Drive settings.
+ */
+typedef enum {
+	GPIODGLIB_LINE_DRIVE_PUSH_PULL = 1,
+	GPIODGLIB_LINE_DRIVE_OPEN_DRAIN,
+	GPIODGLIB_LINE_DRIVE_OPEN_SOURCE,
+} GpiodglibLineDrive;
+
+/**
+ * GpiodglibLineClock:
+ * @GPIODGLIB_LINE_CLOCK_MONOTONIC: Line uses the monotonic clock for edge
+ * event timestamps.
+ * @GPIODGLIB_LINE_CLOCK_REALTIME: Line uses the realtime clock for edge event
+ * timestamps.
+ * @GPIODGLIB_LINE_CLOCK_HTE: Line uses the hardware timestamp engine for event
+ * timestamps.
+ *
+ * Clock settings.
+ */
+typedef enum {
+	GPIODGLIB_LINE_CLOCK_MONOTONIC = 1,
+	GPIODGLIB_LINE_CLOCK_REALTIME,
+	GPIODGLIB_LINE_CLOCK_HTE,
+} GpiodglibLineClock;
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_LINE_H__ */
diff --git a/bindings/glib/gpiod-glib/misc.h b/bindings/glib/gpiod-glib/misc.h
new file mode 100644
index 0000000..2d30dbc
--- /dev/null
+++ b/bindings/glib/gpiod-glib/misc.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_MISC_H__
+#define __GPIODGLIB_MISC_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+
+G_BEGIN_DECLS
+
+/**
+ * gpiodglib_is_gpiochip_device:
+ * @path: Path to check.
+ *
+ * Check if the file pointed to by path is a GPIO chip character device.
+ *
+ * Returns: TRUE if the file exists and is either a GPIO chip character device
+ * or a symbolic link to one, FALSE otherwise.
+ */
+gboolean gpiodglib_is_gpiochip_device(const gchar *path);
+
+/**
+ * gpiodglib_api_version:
+ *
+ * Get the API version of the library as a human-readable string.
+ *
+ * Returns: A valid pointer to a human-readable string containing the library
+ * version. The pointer is valid for the lifetime of the program and must not
+ * be freed by the caller.
+ */
+const gchar *gpiodglib_api_version(void);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_MISC_H__ */
diff --git a/bindings/glib/gpiod-glib/request-config.h b/bindings/glib/gpiod-glib/request-config.h
new file mode 100644
index 0000000..76e884b
--- /dev/null
+++ b/bindings/glib/gpiod-glib/request-config.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_REQUEST_CONFIG_H__
+#define __GPIODGLIB_REQUEST_CONFIG_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+G_BEGIN_DECLS
+
+G_DECLARE_FINAL_TYPE(GpiodglibRequestConfig, gpiodglib_request_config,
+		     GPIODGLIB, REQUEST_CONFIG, GObject);
+
+#define GPIODGLIB_REQUEST_CONFIG_TYPE (gpiodglib_request_config_get_type())
+#define GPIODGLIB_REQUEST_CONFIG_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_REQUEST_CONFIG_TYPE, \
+				    GpiodglibRequestConfig))
+
+/**
+ * gpiodglib_request_config_new:
+ * @first_prop: Name of the first property to set.
+ *
+ * Create a new request config object.
+ *
+ * Returns: New #GpiodglibRequestConfig.
+ *
+ * The constructor allows to set object's properties when it's first created
+ * instead of having to build an empty object and then call mutators separately.
+ *
+ * Currently supported properties are: `consumer` and `event-buffer-size`.
+ */
+GpiodglibRequestConfig *
+gpiodglib_request_config_new(const gchar *first_prop, ...);
+
+/**
+ * gpiodglib_request_config_set_consumer:
+ * @self: #GpiodglibRequestConfig object to manipulate.
+ * @consumer: Consumer name.
+ *
+ * Set the consumer name for the request.
+ *
+ * If the consumer string is too long, it will be truncated to the max
+ * accepted length.
+ */
+void gpiodglib_request_config_set_consumer(GpiodglibRequestConfig *self,
+					   const gchar *consumer);
+
+/**
+ * gpiodglib_request_config_dup_consumer:
+ * @self: #GpiodglibRequestConfig object to manipulate.
+ *
+ * Get the consumer name configured in the request config.
+ *
+ * Returns: Consumer name stored in the request config. The returned string is
+ * a copy and must be freed by the caller using g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_request_config_dup_consumer(GpiodglibRequestConfig *self);
+
+/**
+ * gpiodglib_request_config_set_event_buffer_size:
+ * @self: #GpiodglibRequestConfig object to manipulate.
+ * @event_buffer_size: New event buffer size.
+ *
+ * Set the size of the kernel event buffer for the request.
+ *
+ * The kernel may adjust the value if it's too high. If set to 0, the default
+ * value will be used.
+ */
+void
+gpiodglib_request_config_set_event_buffer_size(GpiodglibRequestConfig *self,
+					       guint event_buffer_size);
+
+
+/**
+ * gpiodglib_request_config_get_event_buffer_size:
+ * @self: #GpiodglibRequestConfig object to manipulate.
+ *
+ * Get the edge event buffer size for the request config.
+ *
+ * Returns: Edge event buffer size setting from the request config.
+ */
+guint
+gpiodglib_request_config_get_event_buffer_size(GpiodglibRequestConfig *self);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_REQUEST_CONFIG_H__ */
diff --git a/bindings/glib/info-event.c b/bindings/glib/info-event.c
new file mode 100644
index 0000000..1c339db
--- /dev/null
+++ b/bindings/glib/info-event.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+
+#include "internal.h"
+
+/**
+ * GpiodglibInfoEvent:
+ *
+ * #GpiodglibInfoEvent contains information about the event itself (timestamp,
+ * type) as well as a snapshot of line's status in the form of a line-info
+ * object.
+ */
+struct _GpiodglibInfoEvent {
+	GObject parent_instance;
+	struct gpiod_info_event *handle;
+	GpiodglibLineInfo *info;
+};
+
+typedef enum {
+	GPIODGLIB_INFO_EVENT_PROP_EVENT_TYPE = 1,
+	GPIODGLIB_INFO_EVENT_PROP_TIMESTAMP,
+	GPIODGLIB_INFO_EVENT_PROP_LINE_INFO,
+} GpiodglibInfoEventProp;
+
+G_DEFINE_TYPE(GpiodglibInfoEvent, gpiodglib_info_event, G_TYPE_OBJECT);
+
+static void gpiodglib_info_event_get_property(GObject *obj, guint prop_id,
+					      GValue *val, GParamSpec *pspec)
+{
+	GpiodglibInfoEvent *self = GPIODGLIB_INFO_EVENT_OBJ(obj);
+	struct gpiod_line_info *info, *cpy;
+	GpiodglibInfoEventType type;
+
+	g_assert(self->handle);
+
+	switch ((GpiodglibInfoEventProp)prop_id) {
+	case GPIODGLIB_INFO_EVENT_PROP_EVENT_TYPE:
+		type = _gpiodglib_info_event_type_from_library(
+				gpiod_info_event_get_event_type(self->handle));
+		g_value_set_enum(val, type);
+		break;
+	case GPIODGLIB_INFO_EVENT_PROP_TIMESTAMP:
+		g_value_set_uint64(val,
+			gpiod_info_event_get_timestamp_ns(self->handle));
+		break;
+	case GPIODGLIB_INFO_EVENT_PROP_LINE_INFO:
+		if (!self->info) {
+			info = gpiod_info_event_get_line_info(self->handle);
+			cpy = gpiod_line_info_copy(info);
+			if (!cpy)
+				g_error("Failed to allocate memory for line-info object");
+
+			self->info = _gpiodglib_line_info_new(cpy);
+		}
+
+		g_value_set_object(val, self->info);
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_info_event_dispose(GObject *obj)
+{
+	GpiodglibInfoEvent *self = GPIODGLIB_INFO_EVENT_OBJ(obj);
+
+	g_clear_object(&self->info);
+
+	G_OBJECT_CLASS(gpiodglib_info_event_parent_class)->dispose(obj);
+}
+
+static void gpiodglib_info_event_finalize(GObject *obj)
+{
+	GpiodglibInfoEvent *self = GPIODGLIB_INFO_EVENT_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_info_event_free);
+
+	G_OBJECT_CLASS(gpiodglib_info_event_parent_class)->finalize(obj);
+}
+
+static void gpiodglib_info_event_class_init(GpiodglibInfoEventClass *info_event_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(info_event_class);
+
+	class->get_property = gpiodglib_info_event_get_property;
+	class->dispose = gpiodglib_info_event_dispose;
+	class->finalize = gpiodglib_info_event_finalize;
+
+	/**
+	 * GpiodglibInfoEvent:event-type
+	 *
+	 * Type of the info event. One of @GPIODGLIB_INFO_EVENT_LINE_REQUESTED,
+	 * @GPIODGLIB_INFO_EVENT_LINE_RELEASED or
+	 * @GPIODGLIB_INFO_EVENT_LINE_CONFIG_CHANGED.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_INFO_EVENT_PROP_EVENT_TYPE,
+		g_param_spec_enum("event-type", "Event Type",
+			"Type of the info event.",
+			GPIODGLIB_INFO_EVENT_TYPE_TYPE,
+			GPIODGLIB_INFO_EVENT_LINE_REQUESTED,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibInfoEvent:timestamp-ns
+	 *
+	 * Timestamp (in nanoseconds).
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_INFO_EVENT_PROP_TIMESTAMP,
+		g_param_spec_uint64("timestamp-ns",
+			"Timestamp (in nanoseconds).",
+			"Timestamp of the info event expressed in nanoseconds.",
+			0, G_MAXUINT64, 0,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibInfoEvent:line-info
+	 *
+	 * New line-info snapshot associated with this info event.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_INFO_EVENT_PROP_LINE_INFO,
+		g_param_spec_object("line-info", "Line Info",
+			"New line-info snapshot associated with this info event.",
+			GPIODGLIB_LINE_INFO_TYPE,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+}
+
+static void gpiodglib_info_event_init(GpiodglibInfoEvent *self)
+{
+	self->handle = NULL;
+	self->info = NULL;
+}
+
+GpiodglibInfoEventType gpiodglib_info_event_get_event_type(GpiodglibInfoEvent *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "event-type");
+}
+
+guint64 gpiodglib_info_event_get_timestamp_ns(GpiodglibInfoEvent *self)
+{
+	return _gpiodglib_get_prop_uint64(G_OBJECT(self), "timestamp-ns");
+}
+
+GpiodglibLineInfo *gpiodglib_info_event_get_line_info(GpiodglibInfoEvent *self)
+{
+	return GPIODGLIB_LINE_INFO_OBJ(
+			_gpiodglib_get_prop_object(G_OBJECT(self), "line-info"));
+}
+
+GpiodglibInfoEvent *_gpiodglib_info_event_new(struct gpiod_info_event *handle)
+{
+	GpiodglibInfoEvent *event;
+
+	event = GPIODGLIB_INFO_EVENT_OBJ(
+			g_object_new(GPIODGLIB_INFO_EVENT_TYPE, NULL));
+	event->handle = handle;
+
+	return event;
+}
diff --git a/bindings/glib/internal.c b/bindings/glib/internal.c
new file mode 100644
index 0000000..6898637
--- /dev/null
+++ b/bindings/glib/internal.c
@@ -0,0 +1,327 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include "internal.h"
+
+#define get_prop(_obj, _prop, _type) \
+	({ \
+		_type _ret; \
+		g_object_get(_obj, _prop, &_ret, NULL); \
+		_ret; \
+	})
+
+G_GNUC_INTERNAL gchar *
+_gpiodglib_dup_prop_string(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, gchar *);
+}
+
+G_GNUC_INTERNAL gboolean
+_gpiodglib_get_prop_bool(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, gboolean);
+}
+
+G_GNUC_INTERNAL gint _gpiodglib_get_prop_enum(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, gint);
+}
+
+G_GNUC_INTERNAL guint _gpiodglib_get_prop_uint(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, guint);
+}
+
+G_GNUC_INTERNAL guint64
+_gpiodglib_get_prop_uint64(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, guint64);
+}
+
+G_GNUC_INTERNAL gulong _gpiodglib_get_prop_ulong(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, gulong);
+}
+
+G_GNUC_INTERNAL GTimeSpan
+_gpiodglib_get_prop_timespan(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, GTimeSpan);
+}
+
+G_GNUC_INTERNAL GObject *
+_gpiodglib_get_prop_object(GObject *obj, const gchar *prop)
+{
+	return G_OBJECT(get_prop(obj, prop, gpointer));
+}
+
+G_GNUC_INTERNAL gpointer
+_gpiodglib_get_prop_pointer(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, gpointer);
+}
+
+G_GNUC_INTERNAL gpointer
+_gpiodglib_get_prop_boxed_array(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, gpointer);
+}
+
+#define set_prop(_obj, _prop, _val) \
+	do { \
+		g_object_set(_obj, _prop, _val, NULL); \
+	} while (0)
+
+G_GNUC_INTERNAL void
+_gpiodglib_set_prop_uint(GObject *obj, const gchar *prop, guint val)
+{
+	set_prop(obj, prop, val);
+}
+
+G_GNUC_INTERNAL void
+_gpiodglib_set_prop_string(GObject *obj, const gchar *prop, const gchar *val)
+{
+	set_prop(obj, prop, val);
+}
+
+G_GNUC_INTERNAL void
+_gpiodglib_set_prop_enum(GObject *obj, const gchar *prop, gint val)
+{
+	set_prop(obj, prop, val);
+}
+
+G_GNUC_INTERNAL void
+_gpiodglib_set_prop_bool(GObject *obj, const gchar *prop, gboolean val)
+{
+	set_prop(obj, prop, val);
+}
+
+G_GNUC_INTERNAL void
+_gpiodglib_set_prop_timespan(GObject *obj, const gchar *prop, GTimeSpan val)
+{
+	set_prop(obj, prop, val);
+}
+
+G_GNUC_INTERNAL GpiodglibLineDirection
+_gpiodglib_line_direction_from_library(enum gpiod_line_direction direction,
+				       gboolean allow_as_is)
+{
+	switch (direction) {
+	case GPIOD_LINE_DIRECTION_AS_IS:
+		if (allow_as_is)
+			return GPIODGLIB_LINE_DIRECTION_AS_IS;
+		break;
+	case GPIOD_LINE_DIRECTION_INPUT:
+		return GPIODGLIB_LINE_DIRECTION_INPUT;
+	case GPIOD_LINE_DIRECTION_OUTPUT:
+		return GPIODGLIB_LINE_DIRECTION_OUTPUT;
+	}
+
+	g_error("invalid line direction value returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GpiodglibLineEdge
+_gpiodglib_line_edge_from_library(enum gpiod_line_edge edge)
+{
+	switch (edge) {
+	case GPIOD_LINE_EDGE_NONE:
+		return GPIODGLIB_LINE_EDGE_NONE;
+	case GPIOD_LINE_EDGE_RISING:
+		return GPIODGLIB_LINE_EDGE_RISING;
+	case GPIOD_LINE_EDGE_FALLING:
+		return GPIODGLIB_LINE_EDGE_FALLING;
+	case GPIOD_LINE_EDGE_BOTH:
+		return GPIODGLIB_LINE_EDGE_BOTH;
+	}
+
+	g_error("invalid line edge value returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GpiodglibLineBias
+_gpiodglib_line_bias_from_library(enum gpiod_line_bias bias,
+				  gboolean allow_as_is)
+{
+	switch (bias) {
+	case GPIOD_LINE_BIAS_AS_IS:
+		if (allow_as_is)
+			return GPIODGLIB_LINE_BIAS_AS_IS;
+		break;
+	case GPIOD_LINE_BIAS_UNKNOWN:
+		return GPIODGLIB_LINE_BIAS_UNKNOWN;
+	case GPIOD_LINE_BIAS_DISABLED:
+		return GPIODGLIB_LINE_BIAS_DISABLED;
+	case GPIOD_LINE_BIAS_PULL_UP:
+		return GPIODGLIB_LINE_BIAS_PULL_UP;
+	case GPIOD_LINE_BIAS_PULL_DOWN:
+		return GPIODGLIB_LINE_BIAS_PULL_DOWN;
+	}
+
+	g_error("invalid line bias value returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GpiodglibLineDrive
+_gpiodglib_line_drive_from_library(enum gpiod_line_drive drive)
+{
+	switch (drive) {
+	case GPIOD_LINE_DRIVE_PUSH_PULL:
+		return GPIODGLIB_LINE_DRIVE_PUSH_PULL;
+	case GPIOD_LINE_DRIVE_OPEN_DRAIN:
+		return GPIODGLIB_LINE_DRIVE_OPEN_DRAIN;
+	case GPIOD_LINE_DRIVE_OPEN_SOURCE:
+		return GPIODGLIB_LINE_DRIVE_OPEN_SOURCE;
+	}
+
+	g_error("invalid line drive value returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GpiodglibLineClock
+_gpiodglib_line_clock_from_library(enum gpiod_line_clock event_clock)
+{
+	switch (event_clock) {
+	case GPIOD_LINE_CLOCK_MONOTONIC:
+		return GPIODGLIB_LINE_CLOCK_MONOTONIC;
+	case GPIOD_LINE_CLOCK_REALTIME:
+		return GPIODGLIB_LINE_CLOCK_REALTIME;
+	case GPIOD_LINE_CLOCK_HTE:
+		return GPIODGLIB_LINE_CLOCK_HTE;
+	}
+
+	g_error("invalid line event clock value returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GpiodglibLineValue
+_gpiodglib_line_value_from_library(enum gpiod_line_value value)
+{
+	switch (value) {
+	case GPIOD_LINE_VALUE_INACTIVE:
+		return GPIODGLIB_LINE_VALUE_INACTIVE;
+	case GPIOD_LINE_VALUE_ACTIVE:
+		return GPIODGLIB_LINE_VALUE_ACTIVE;
+	default:
+		break;
+	}
+
+	g_error("invalid line value returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GpiodglibInfoEventType
+_gpiodglib_info_event_type_from_library(enum gpiod_info_event_type type)
+{
+	switch (type) {
+	case GPIOD_INFO_EVENT_LINE_REQUESTED:
+		return GPIODGLIB_INFO_EVENT_LINE_REQUESTED;
+	case GPIOD_INFO_EVENT_LINE_RELEASED:
+		return GPIODGLIB_INFO_EVENT_LINE_RELEASED;
+	case GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED:
+		return GPIODGLIB_INFO_EVENT_LINE_CONFIG_CHANGED;
+	}
+	
+	g_error("invalid info-event type returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GpiodglibEdgeEventType
+_gpiodglib_edge_event_type_from_library(enum gpiod_edge_event_type type)
+{
+	switch (type) {
+	case GPIOD_EDGE_EVENT_RISING_EDGE:
+		return GPIODGLIB_EDGE_EVENT_RISING_EDGE;
+	case GPIOD_EDGE_EVENT_FALLING_EDGE:
+		return GPIODGLIB_EDGE_EVENT_FALLING_EDGE;
+	}
+
+	g_error("invalid edge-event type returned by libgpiod");
+}
+
+G_GNUC_INTERNAL enum gpiod_line_direction
+_gpiodglib_line_direction_to_library(GpiodglibLineDirection direction)
+{
+	switch (direction) {
+	case GPIODGLIB_LINE_DIRECTION_AS_IS:
+		return GPIOD_LINE_DIRECTION_AS_IS;
+	case GPIODGLIB_LINE_DIRECTION_INPUT:
+		return GPIOD_LINE_DIRECTION_INPUT;
+	case GPIODGLIB_LINE_DIRECTION_OUTPUT:
+		return GPIOD_LINE_DIRECTION_OUTPUT;
+	}
+
+	g_error("invalid line direction value");
+}
+
+G_GNUC_INTERNAL enum gpiod_line_edge
+_gpiodglib_line_edge_to_library(GpiodglibLineEdge edge)
+{
+	switch (edge) {
+	case GPIODGLIB_LINE_EDGE_NONE:
+		return GPIOD_LINE_EDGE_NONE;
+	case GPIODGLIB_LINE_EDGE_RISING:
+		return GPIOD_LINE_EDGE_RISING;
+	case GPIODGLIB_LINE_EDGE_FALLING:
+		return GPIOD_LINE_EDGE_FALLING;
+	case GPIODGLIB_LINE_EDGE_BOTH:
+		return GPIOD_LINE_EDGE_BOTH;
+	}
+
+	g_error("invalid line edge value");
+}
+
+G_GNUC_INTERNAL enum gpiod_line_bias
+_gpiodglib_line_bias_to_library(GpiodglibLineBias bias)
+{
+	switch (bias) {
+	case GPIODGLIB_LINE_BIAS_AS_IS:
+		return GPIOD_LINE_BIAS_AS_IS;
+	case GPIODGLIB_LINE_BIAS_DISABLED:
+		return GPIOD_LINE_BIAS_DISABLED;
+	case GPIODGLIB_LINE_BIAS_PULL_UP:
+		return GPIOD_LINE_BIAS_PULL_UP;
+	case GPIODGLIB_LINE_BIAS_PULL_DOWN:
+		return GPIOD_LINE_BIAS_PULL_DOWN;
+	default:
+		break;
+	}
+
+	g_error("invalid line bias value");
+}
+
+G_GNUC_INTERNAL enum gpiod_line_drive
+_gpiodglib_line_drive_to_library(GpiodglibLineDrive drive)
+{
+	switch (drive) {
+	case GPIODGLIB_LINE_DRIVE_PUSH_PULL:
+		return GPIOD_LINE_DRIVE_PUSH_PULL;
+	case GPIODGLIB_LINE_DRIVE_OPEN_SOURCE:
+		return GPIOD_LINE_DRIVE_OPEN_SOURCE;
+	case GPIODGLIB_LINE_DRIVE_OPEN_DRAIN:
+		return GPIOD_LINE_DRIVE_OPEN_DRAIN;
+	}
+
+	g_error("invalid line drive value");
+}
+
+G_GNUC_INTERNAL enum gpiod_line_clock
+_gpiodglib_line_clock_to_library(GpiodglibLineClock event_clock)
+{
+	switch (event_clock) {
+	case GPIODGLIB_LINE_CLOCK_MONOTONIC:
+		return GPIOD_LINE_CLOCK_MONOTONIC;
+	case GPIODGLIB_LINE_CLOCK_REALTIME:
+		return GPIOD_LINE_CLOCK_REALTIME;
+	case GPIODGLIB_LINE_CLOCK_HTE:
+		return GPIOD_LINE_CLOCK_HTE;
+	}
+
+	g_error("invalid line clock value");
+}
+
+G_GNUC_INTERNAL enum gpiod_line_value
+_gpiodglib_line_value_to_library(GpiodglibLineValue value)
+{
+	switch (value) {
+	case GPIODGLIB_LINE_VALUE_INACTIVE:
+		return GPIOD_LINE_VALUE_INACTIVE;
+	case GPIODGLIB_LINE_VALUE_ACTIVE:
+		return GPIOD_LINE_VALUE_ACTIVE;
+	}
+
+	g_error("invalid line value");
+}
diff --git a/bindings/glib/internal.h b/bindings/glib/internal.h
new file mode 100644
index 0000000..b6f8f42
--- /dev/null
+++ b/bindings/glib/internal.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_INTERNAL_H__
+#define __GPIODGLIB_INTERNAL_H__
+
+#include <glib.h>
+#include <glib-object.h>
+#include <gpiod.h>
+
+#include "gpiod-glib.h"
+
+GpiodglibLineSettings *
+_gpiodglib_line_settings_new(struct gpiod_line_settings *handle);
+GpiodglibChipInfo *_gpiodglib_chip_info_new(struct gpiod_chip_info *handle);
+GpiodglibLineInfo *_gpiodglib_line_info_new(struct gpiod_line_info *handle);
+GpiodglibEdgeEvent *_gpiodglib_edge_event_new(struct gpiod_edge_event *handle);
+GpiodglibInfoEvent *_gpiodglib_info_event_new(struct gpiod_info_event *handle);
+GpiodglibLineRequest *
+_gpiodglib_line_request_new(struct gpiod_line_request *handle);
+
+struct gpiod_request_config *
+_gpiodglib_request_config_get_handle(GpiodglibRequestConfig *req_cfg);
+struct gpiod_line_config *
+_gpiodglib_line_config_get_handle(GpiodglibLineConfig *line_cfg);
+struct gpiod_line_settings *
+_gpiodglib_line_settings_get_handle(GpiodglibLineSettings *settings);
+
+void _gpiodglib_set_error_from_errno(GError **err,
+				     const gchar *fmt, ...) G_GNUC_PRINTF(2, 3);
+
+gchar *_gpiodglib_dup_prop_string(GObject *obj, const gchar *prop);
+gboolean _gpiodglib_get_prop_bool(GObject *obj, const gchar *prop);
+gint _gpiodglib_get_prop_enum(GObject *obj, const gchar *prop);
+guint _gpiodglib_get_prop_uint(GObject *obj, const gchar *prop);
+guint64 _gpiodglib_get_prop_uint64(GObject *obj, const gchar *prop);
+gulong _gpiodglib_get_prop_ulong(GObject *obj, const gchar *prop);
+GTimeSpan _gpiodglib_get_prop_timespan(GObject *obj, const gchar *prop);
+GObject *_gpiodglib_get_prop_object(GObject *obj, const gchar *prop);
+gpointer _gpiodglib_get_prop_pointer(GObject *obj, const gchar *prop);
+gpointer _gpiodglib_get_prop_boxed_array(GObject *obj, const gchar *prop);
+
+void _gpiodglib_set_prop_uint(GObject *obj, const gchar *prop, guint val);
+void _gpiodglib_set_prop_string(GObject *obj, const gchar *prop,
+				const gchar *val);
+void _gpiodglib_set_prop_enum(GObject *obj, const gchar *prop, gint val);
+void _gpiodglib_set_prop_bool(GObject *obj, const gchar *prop, gboolean val);
+void _gpiodglib_set_prop_timespan(GObject *obj, const gchar *prop,
+				  GTimeSpan val);
+
+GpiodglibLineDirection
+_gpiodglib_line_direction_from_library(enum gpiod_line_direction direction,
+				       gboolean allow_as_is);
+GpiodglibLineEdge _gpiodglib_line_edge_from_library(enum gpiod_line_edge edge);
+GpiodglibLineBias _gpiodglib_line_bias_from_library(enum gpiod_line_bias bias,
+						    gboolean allow_as_is);
+GpiodglibLineDrive
+_gpiodglib_line_drive_from_library(enum gpiod_line_drive drive);
+GpiodglibLineClock
+_gpiodglib_line_clock_from_library(enum gpiod_line_clock event_clock);
+GpiodglibLineValue
+_gpiodglib_line_value_from_library(enum gpiod_line_value value);
+GpiodglibInfoEventType
+_gpiodglib_info_event_type_from_library(enum gpiod_info_event_type type);
+GpiodglibEdgeEventType
+_gpiodglib_edge_event_type_from_library(enum gpiod_edge_event_type type);
+
+enum gpiod_line_direction
+_gpiodglib_line_direction_to_library(GpiodglibLineDirection direction);
+enum gpiod_line_edge _gpiodglib_line_edge_to_library(GpiodglibLineEdge edge);
+enum gpiod_line_bias _gpiodglib_line_bias_to_library(GpiodglibLineBias bias);
+enum gpiod_line_drive
+_gpiodglib_line_drive_to_library(GpiodglibLineDrive drive);
+enum gpiod_line_clock
+_gpiodglib_line_clock_to_library(GpiodglibLineClock event_clock);
+enum gpiod_line_value
+_gpiodglib_line_value_to_library(GpiodglibLineValue value);
+
+#endif /* __GPIODGLIB_INTERNAL_H__ */
diff --git a/bindings/glib/line-config.c b/bindings/glib/line-config.c
new file mode 100644
index 0000000..37d3c21
--- /dev/null
+++ b/bindings/glib/line-config.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+
+#include "internal.h"
+
+/**
+ * GpiodglibLineConfig:
+ *
+ * The line-config object contains the configuration for lines that can be
+ * used in two cases:
+ *  - when making a line request
+ *  - when reconfiguring a set of already requested lines.
+ */
+struct _GpiodglibLineConfig {
+	GObject parent_instance;
+	struct gpiod_line_config *handle;
+};
+
+typedef enum {
+	GPIODGLIB_LINE_CONFIG_PROP_CONFIGURED_OFFSETS = 1,
+} GpiodglibLineConfigProp;
+
+G_DEFINE_TYPE(GpiodglibLineConfig, gpiodglib_line_config, G_TYPE_OBJECT);
+
+static void gpiodglib_line_config_get_property(GObject *obj, guint prop_id,
+					       GValue *val, GParamSpec *pspec)
+{
+	GpiodglibLineConfig *self = GPIODGLIB_LINE_CONFIG_OBJ(obj);
+	g_autofree guint *offsets = NULL;
+	g_autoptr(GArray) boxed = NULL;
+	gsize num_offsets, i;
+
+	switch ((GpiodglibLineConfigProp)prop_id) {
+	case GPIODGLIB_LINE_CONFIG_PROP_CONFIGURED_OFFSETS:
+		num_offsets = gpiod_line_config_get_num_configured_offsets(
+								self->handle);
+		offsets = g_malloc0(num_offsets * sizeof(guint));
+		gpiod_line_config_get_configured_offsets(self->handle, offsets,
+							 num_offsets);
+
+		boxed = g_array_new(FALSE, TRUE, sizeof(guint));
+		for (i = 0; i < num_offsets; i++)
+			g_array_append_val(boxed, offsets[i]);
+
+		g_value_set_boxed(val, boxed);
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_line_config_finalize(GObject *obj)
+{
+	GpiodglibLineConfig *self = GPIODGLIB_LINE_CONFIG_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_line_config_free);
+
+	G_OBJECT_CLASS(gpiodglib_line_config_parent_class)->finalize(obj);
+}
+
+static void
+gpiodglib_line_config_class_init(GpiodglibLineConfigClass *line_config_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(line_config_class);
+
+	class->get_property = gpiodglib_line_config_get_property;
+	class->finalize = gpiodglib_line_config_finalize;
+
+	/**
+	 * GpiodglibLineConfig:configured-offsets:
+	 *
+	 * Array of offsets for which line settings have been set.
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_CONFIG_PROP_CONFIGURED_OFFSETS,
+		g_param_spec_boxed("configured-offsets", "Configured Offsets",
+			"Array of offsets for which line settings have been set.",
+			G_TYPE_ARRAY,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+}
+
+static void gpiodglib_line_config_init(GpiodglibLineConfig *self)
+{
+	self->handle = gpiod_line_config_new();
+	if (!self->handle)
+		/* The only possible error is ENOMEM. */
+		g_error("Failed to allocate memory for the request-config object.");
+}
+
+GpiodglibLineConfig *gpiodglib_line_config_new(void)
+{
+	return GPIODGLIB_LINE_CONFIG_OBJ(
+			g_object_new(GPIODGLIB_LINE_CONFIG_TYPE, NULL));
+}
+
+void gpiodglib_line_config_reset(GpiodglibLineConfig *self)
+{
+	g_assert(self);
+
+	gpiod_line_config_reset(self->handle);
+}
+
+gboolean
+gpiodglib_line_config_add_line_settings(GpiodglibLineConfig *self,
+					const GArray *offsets,
+					GpiodglibLineSettings *settings,
+					GError **err)
+{
+	struct gpiod_line_settings *settings_handle;
+	int ret;
+
+	g_assert(self);
+
+	if (!offsets || !offsets->len) {
+		g_set_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL,
+			    "at least one offset must be specified when adding line settings");
+		return FALSE;
+	}
+
+	settings_handle = settings ?
+		_gpiodglib_line_settings_get_handle(settings) : NULL;
+	ret = gpiod_line_config_add_line_settings(self->handle,
+						  (unsigned int *)offsets->data,
+						  offsets->len,
+						  settings_handle);
+	if (ret) {
+		_gpiodglib_set_error_from_errno(err,
+			"failed to add line settings to line config");
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+GpiodglibLineSettings *
+gpiodglib_line_config_get_line_settings(GpiodglibLineConfig *self, guint offset)
+{
+	struct gpiod_line_settings *settings;
+
+	g_assert(self);
+
+	settings = gpiod_line_config_get_line_settings(self->handle, offset);
+	if (!settings) {
+		if (errno == ENOENT)
+			return NULL;
+
+		/* Let's bail-out on ENOMEM/ */
+		g_error("failed to retrieve line settings for offset %u: %s",
+			offset, g_strerror(errno));
+	}
+
+	return _gpiodglib_line_settings_new(settings);
+}
+
+gboolean gpiodglib_line_config_set_output_values(GpiodglibLineConfig *self,
+						 const GArray *values,
+						 GError **err)
+{
+	g_autofree enum gpiod_line_value *vals = NULL;
+	gint ret;
+	guint i;
+
+	g_assert(self);
+
+	vals = g_malloc0(sizeof(*vals) * values->len);
+	for (i = 0; i < values->len; i++)
+		vals[i] = _gpiodglib_line_value_to_library(
+				g_array_index(values, GpiodglibLineValue, i));
+
+	ret = gpiod_line_config_set_output_values(self->handle, vals,
+						  values->len);
+	if (ret) {
+		_gpiodglib_set_error_from_errno(err,
+				"unable to set output values");
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+GArray *gpiodglib_line_config_get_configured_offsets(GpiodglibLineConfig *self)
+{
+	return _gpiodglib_get_prop_boxed_array(G_OBJECT(self),
+					       "configured-offsets");
+}
+
+struct gpiod_line_config *
+_gpiodglib_line_config_get_handle(GpiodglibLineConfig *line_cfg)
+{
+	return line_cfg->handle;
+}
diff --git a/bindings/glib/line-info.c b/bindings/glib/line-info.c
new file mode 100644
index 0000000..37cca37
--- /dev/null
+++ b/bindings/glib/line-info.c
@@ -0,0 +1,342 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+
+#include "internal.h"
+
+/**
+ *  GpiodglibLineInfo:
+ *
+ * Line info object contains an immutable snapshot of a line's status.
+ *
+ * The line info contains all the publicly available information about a
+ * line, which does not include the line value. The line must be requested
+ * to access the line value.
+ */
+struct _GpiodglibLineInfo {
+	GObject parent_instance;
+	struct gpiod_line_info *handle;
+};
+
+typedef enum {
+	GPIODGLIB_LINE_INFO_PROP_OFFSET = 1,
+	GPIODGLIB_LINE_INFO_PROP_NAME,
+	GPIODGLIB_LINE_INFO_PROP_USED,
+	GPIODGLIB_LINE_INFO_PROP_CONSUMER,
+	GPIODGLIB_LINE_INFO_PROP_DIRECTION,
+	GPIODGLIB_LINE_INFO_PROP_EDGE_DETECTION,
+	GPIODGLIB_LINE_INFO_PROP_BIAS,
+	GPIODGLIB_LINE_INFO_PROP_DRIVE,
+	GPIODGLIB_LINE_INFO_PROP_ACTIVE_LOW,
+	GPIODGLIB_LINE_INFO_PROP_DEBOUNCED,
+	GPIODGLIB_LINE_INFO_PROP_DEBOUNCE_PERIOD,
+	GPIODGLIB_LINE_INFO_PROP_EVENT_CLOCK,
+} GpiodglibLineInfoProp;
+
+G_DEFINE_TYPE(GpiodglibLineInfo, gpiodglib_line_info, G_TYPE_OBJECT);
+
+static void gpiodglib_line_info_get_property(GObject *obj, guint prop_id,
+					     GValue *val, GParamSpec *pspec)
+{
+	GpiodglibLineInfo *self = GPIODGLIB_LINE_INFO_OBJ(obj);
+
+	g_assert(self->handle);
+
+	switch ((GpiodglibLineInfoProp)prop_id) {
+	case GPIODGLIB_LINE_INFO_PROP_OFFSET:
+		g_value_set_uint(val, gpiod_line_info_get_offset(self->handle));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_NAME:
+		g_value_set_string(val,
+				   gpiod_line_info_get_name(self->handle));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_USED:
+		g_value_set_boolean(val, gpiod_line_info_is_used(self->handle));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_CONSUMER:
+		g_value_set_string(val,
+				   gpiod_line_info_get_consumer(self->handle));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_DIRECTION:
+		g_value_set_enum(val,
+			_gpiodglib_line_direction_from_library(
+				gpiod_line_info_get_direction(self->handle),
+				FALSE));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_EDGE_DETECTION:
+		g_value_set_enum(val,
+			_gpiodglib_line_edge_from_library(
+				gpiod_line_info_get_edge_detection(
+					self->handle)));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_BIAS:
+		g_value_set_enum(val,
+			_gpiodglib_line_bias_from_library(
+				gpiod_line_info_get_bias(self->handle),
+				FALSE));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_DRIVE:
+		g_value_set_enum(val,
+			_gpiodglib_line_drive_from_library(
+				gpiod_line_info_get_drive(self->handle)));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_ACTIVE_LOW:
+		g_value_set_boolean(val,
+			gpiod_line_info_is_active_low(self->handle));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_DEBOUNCED:
+		g_value_set_boolean(val,
+			gpiod_line_info_is_debounced(self->handle));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_DEBOUNCE_PERIOD:
+		g_value_set_int64(val,
+			gpiod_line_info_get_debounce_period_us(self->handle));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_EVENT_CLOCK:
+		g_value_set_enum(val,
+			_gpiodglib_line_clock_from_library(
+				gpiod_line_info_get_event_clock(self->handle)));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_line_info_finalize(GObject *obj)
+{
+	GpiodglibLineInfo *self = GPIODGLIB_LINE_INFO_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_line_info_free);
+
+	G_OBJECT_CLASS(gpiodglib_line_info_parent_class)->finalize(obj);
+}
+
+static void
+gpiodglib_line_info_class_init(GpiodglibLineInfoClass *line_info_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(line_info_class);
+
+	class->get_property = gpiodglib_line_info_get_property;
+	class->finalize = gpiodglib_line_info_finalize;
+
+	/**
+	 * GpiodglibLineInfo:offset:
+	 *
+	 * Offset of the GPIO line.
+	 */
+	g_object_class_install_property(class, GPIODGLIB_LINE_INFO_PROP_OFFSET,
+		g_param_spec_uint("offset", "Offset",
+			"Offset of the GPIO line.",
+			0, G_MAXUINT, 0,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:name:
+	 *
+	 * Name of the GPIO line, if named.
+	 */
+	g_object_class_install_property(class, GPIODGLIB_LINE_INFO_PROP_NAME,
+		g_param_spec_string("name", "Name",
+			"Name of the GPIO line, if named.",
+			NULL, G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:used:
+	 *
+	 * Indicates whether the GPIO line is requested for exclusive usage.
+	 */
+	g_object_class_install_property(class, GPIODGLIB_LINE_INFO_PROP_USED,
+		g_param_spec_boolean("used", "Is Used",
+			"Indicates whether the GPIO line is requested for exclusive usage.",
+			FALSE, G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:consumer:
+	 *
+	 * Name of the consumer of the GPIO line, if requested.
+	 */
+	g_object_class_install_property(class,
+			GPIODGLIB_LINE_INFO_PROP_CONSUMER,
+		g_param_spec_string("consumer", "Consumer",
+			"Name of the consumer of the GPIO line, if requested.",
+			NULL, G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:direction:
+	 *
+	 * Direction of the GPIO line.
+	 */
+	g_object_class_install_property(class,
+			GPIODGLIB_LINE_INFO_PROP_DIRECTION,
+		g_param_spec_enum("direction", "Direction",
+			"Direction of the GPIO line.",
+			GPIODGLIB_LINE_DIRECTION_TYPE,
+			GPIODGLIB_LINE_DIRECTION_INPUT,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:edge-detection:
+	 *
+	 * Edge detection setting of the GPIO line.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_LINE_INFO_PROP_EDGE_DETECTION,
+		g_param_spec_enum("edge-detection", "Edge Detection",
+			"Edge detection setting of the GPIO line.",
+			GPIODGLIB_LINE_EDGE_TYPE,
+			GPIODGLIB_LINE_EDGE_NONE,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:bias:
+	 *
+	 * Bias setting of the GPIO line.
+	 */
+	g_object_class_install_property(class, GPIODGLIB_LINE_INFO_PROP_BIAS,
+		g_param_spec_enum("bias", "Bias",
+			"Bias setting of the GPIO line.",
+			GPIODGLIB_LINE_BIAS_TYPE,
+			GPIODGLIB_LINE_BIAS_UNKNOWN,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:drive:
+	 *
+	 * Drive setting of the GPIO line.
+	 */
+	g_object_class_install_property(class, GPIODGLIB_LINE_INFO_PROP_DRIVE,
+		g_param_spec_enum("drive", "Drive",
+			"Drive setting of the GPIO line.",
+			GPIODGLIB_LINE_DRIVE_TYPE,
+			GPIODGLIB_LINE_DRIVE_PUSH_PULL,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:active-low:
+	 *
+	 * Indicates whether the signal of the line is inverted.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_LINE_INFO_PROP_ACTIVE_LOW,
+		g_param_spec_boolean("active-low", "Is Active-Low",
+			"Indicates whether the signal of the line is inverted.",
+			FALSE, G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:debounced:
+	 *
+	 * Indicates whether the line is debounced (by hardware or by the
+	 * kernel software debouncer).
+	 */
+	g_object_class_install_property(class,
+			GPIODGLIB_LINE_INFO_PROP_DEBOUNCED,
+		g_param_spec_boolean("debounced", "Is Debounced",
+			"Indicates whether the line is debounced (by hardware or by the kernel software debouncer).",
+			FALSE, G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:debounce-period-us:
+	 *
+	 * Debounce period of the line (expressed in microseconds).
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_INFO_PROP_DEBOUNCE_PERIOD,
+		g_param_spec_int64("debounce-period-us",
+			"Debounce Period (in microseconds)",
+			"Debounce period of the line (expressed in microseconds).",
+			0, G_MAXINT64, 0,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:event-clock:
+	 *
+	 * Event clock used to timestamp the edge events of the line.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_LINE_INFO_PROP_EVENT_CLOCK,
+		g_param_spec_enum("event-clock", "Event Clock",
+			"Event clock used to timestamp the edge events of the line.",
+			GPIODGLIB_LINE_CLOCK_TYPE,
+			GPIODGLIB_LINE_CLOCK_MONOTONIC,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+}
+
+static void gpiodglib_line_info_init(GpiodglibLineInfo *self)
+{
+	self->handle = NULL;
+}
+
+guint gpiodglib_line_info_get_offset(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_uint(G_OBJECT(self), "offset");
+}
+
+gchar *gpiodglib_line_info_dup_name(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_dup_prop_string(G_OBJECT(self), "name");
+}
+
+gboolean gpiodglib_line_info_is_used(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_bool(G_OBJECT(self), "used");
+}
+
+gchar *gpiodglib_line_info_dup_consumer(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_dup_prop_string(G_OBJECT(self), "consumer");
+}
+
+GpiodglibLineDirection
+gpiodglib_line_info_get_direction(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "direction");
+}
+
+GpiodglibLineEdge
+gpiodglib_line_info_get_edge_detection(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "edge-detection");
+}
+
+GpiodglibLineBias gpiodglib_line_info_get_bias(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "bias");
+}
+
+GpiodglibLineDrive gpiodglib_line_info_get_drive(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "drive");
+}
+
+gboolean gpiodglib_line_info_is_active_low(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_bool(G_OBJECT(self), "active-low");
+}
+
+gboolean gpiodglib_line_info_is_debounced(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_bool(G_OBJECT(self), "debounced");
+}
+
+GTimeSpan gpiodglib_line_info_get_debounce_period_us(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_timespan(G_OBJECT(self),
+					   "debounce-period-us");
+}
+
+GpiodglibLineClock gpiodglib_line_info_get_event_clock(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "event-clock");
+}
+
+GpiodglibLineInfo *_gpiodglib_line_info_new(struct gpiod_line_info *handle)
+{
+	GpiodglibLineInfo *info;
+
+	info = GPIODGLIB_LINE_INFO_OBJ(g_object_new(GPIODGLIB_LINE_INFO_TYPE,
+						    NULL));
+	info->handle = handle;
+
+	return info;
+}
diff --git a/bindings/glib/line-request.c b/bindings/glib/line-request.c
new file mode 100644
index 0000000..1720c75
--- /dev/null
+++ b/bindings/glib/line-request.c
@@ -0,0 +1,452 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+
+#include "internal.h"
+
+static const gsize event_buf_size = 64;
+
+/**
+ * GpiodglibLineRequest:
+ *
+ * Line request object allows interacting with a set of requested GPIO lines.
+ */
+struct _GpiodglibLineRequest {
+	GObject parent_instance;
+	struct gpiod_line_request *handle;
+	struct gpiod_edge_event_buffer *event_buf;
+	GSource *edge_event_src;
+	guint edge_event_src_id;
+	enum gpiod_line_value *val_buf;
+	gboolean released;
+};
+
+typedef enum {
+	GPIODGLIB_LINE_REQUEST_PROP_CHIP_NAME = 1,
+	GPIODGLIB_LINE_REQUEST_PROP_REQUESTED_OFFSETS,
+} GpiodglibLineRequestProp;
+
+enum {
+	GPIODGLIB_LINE_REQUEST_SIGNAL_EDGE_EVENT,
+	GPIODGLIB_LINE_REQUEST_SIGNAL_LAST,
+};
+
+static guint signals[GPIODGLIB_LINE_REQUEST_SIGNAL_LAST];
+
+G_DEFINE_TYPE(GpiodglibLineRequest, gpiodglib_line_request, G_TYPE_OBJECT);
+
+static gboolean
+gpiodglib_line_request_on_edge_event(GIOChannel *source G_GNUC_UNUSED,
+				     GIOCondition condition G_GNUC_UNUSED,
+				     gpointer data)
+{
+	struct gpiod_edge_event *event_handle, *event_copy;
+	GpiodglibLineRequest *self = data;
+	gint ret, i;
+
+	ret = gpiod_line_request_read_edge_events(self->handle,
+						  self->event_buf,
+						  event_buf_size);
+	if (ret < 0)
+		return TRUE;
+
+	for (i = 0; i < ret; i++) {
+		g_autoptr(GpiodglibEdgeEvent) event = NULL;
+
+		event_handle = gpiod_edge_event_buffer_get_event(
+						self->event_buf, i);
+		event_copy = gpiod_edge_event_copy(event_handle);
+		if (!event_copy)
+			g_error("failed to copy the edge event");
+
+		event = _gpiodglib_edge_event_new(event_copy);
+
+		g_signal_emit(self,
+			      signals[GPIODGLIB_LINE_REQUEST_SIGNAL_EDGE_EVENT],
+			      0,
+			      event);
+	}
+
+	return TRUE;
+}
+
+static void gpiodglib_line_request_get_property(GObject *obj, guint prop_id,
+						GValue *val, GParamSpec *pspec)
+{
+	GpiodglibLineRequest *self = GPIODGLIB_LINE_REQUEST_OBJ(obj);
+	g_autofree guint *offsets = NULL;
+	g_autoptr(GArray) boxed = NULL;
+	gsize num_offsets;
+
+	g_assert(self->handle);
+
+	switch ((GpiodglibLineRequestProp)prop_id) {
+	case GPIODGLIB_LINE_REQUEST_PROP_CHIP_NAME:
+		if (gpiodglib_line_request_is_released(self))
+			g_value_set_static_string(val, NULL);
+		else
+			g_value_set_string(val,
+				gpiod_line_request_get_chip_name(self->handle));
+		break;
+	case GPIODGLIB_LINE_REQUEST_PROP_REQUESTED_OFFSETS:
+		boxed = g_array_new(FALSE, TRUE, sizeof(guint));
+
+		if (!gpiodglib_line_request_is_released(self)) {
+			num_offsets =
+				gpiod_line_request_get_num_requested_lines(
+								self->handle);
+			offsets = g_malloc0(num_offsets * sizeof(guint));
+			gpiod_line_request_get_requested_offsets(self->handle,
+								 offsets,
+								 num_offsets);
+			g_array_append_vals(boxed, offsets, num_offsets);
+		}
+
+		g_value_set_boxed(val, boxed);
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_line_request_dispose(GObject *obj)
+{
+	GpiodglibLineRequest *self = GPIODGLIB_LINE_REQUEST_OBJ(obj);
+
+	if (self->edge_event_src_id)
+		g_source_remove(self->edge_event_src_id);
+
+	G_OBJECT_CLASS(gpiodglib_line_request_parent_class)->dispose(obj);
+}
+
+static void gpiodglib_line_request_finalize(GObject *obj)
+{
+	GpiodglibLineRequest *self = GPIODGLIB_LINE_REQUEST_OBJ(obj);
+
+	if (!self->released)
+		gpiodglib_line_request_release(self);
+
+	g_clear_pointer(&self->event_buf, gpiod_edge_event_buffer_free);
+	g_clear_pointer(&self->val_buf, g_free);
+
+	G_OBJECT_CLASS(gpiodglib_line_request_parent_class)->finalize(obj);
+}
+
+static void
+gpiodglib_line_request_class_init(GpiodglibLineRequestClass *line_request_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(line_request_class);
+
+	class->get_property = gpiodglib_line_request_get_property;
+	class->dispose = gpiodglib_line_request_dispose;
+	class->finalize = gpiodglib_line_request_finalize;
+
+	/**
+	 * GpiodglibLineRequest:chip-name
+	 *
+	 * Name of the GPIO chip this request was made on.
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_REQUEST_PROP_CHIP_NAME,
+		g_param_spec_string("chip-name", "Chip Name",
+			"Name of the GPIO chip this request was made on.",
+			NULL, G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineRequest:requested-offsets
+	 *
+	 * Array of requested offsets.
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_REQUEST_PROP_REQUESTED_OFFSETS,
+		g_param_spec_boxed("requested-offsets", "Requested offsets",
+			"Array of requested offsets.",
+			G_TYPE_ARRAY,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineRequest::edge-event:
+	 * @chip: #GpiodglibLineRequest receiving the event
+	 * @event: The #GpiodglibEdgeEvent
+	 *
+	 * Emitted when an edge event is detected on one of the requested GPIO
+	 * line.
+	 */
+	signals[GPIODGLIB_LINE_REQUEST_SIGNAL_EDGE_EVENT] =
+			g_signal_new("edge-event",
+				     G_TYPE_FROM_CLASS(line_request_class),
+				     G_SIGNAL_RUN_LAST,
+				     0,
+				     NULL,
+				     NULL,
+				     g_cclosure_marshal_generic,
+				     G_TYPE_NONE,
+				     1,
+				     GPIODGLIB_EDGE_EVENT_TYPE);
+}
+
+static void gpiodglib_line_request_init(GpiodglibLineRequest *self)
+{
+	self->handle = NULL;
+	self->event_buf = NULL;
+	self->edge_event_src = NULL;
+	self->released = FALSE;
+}
+
+void gpiodglib_line_request_release(GpiodglibLineRequest *self)
+{
+	g_assert(self);
+
+	g_clear_pointer(&self->edge_event_src, g_source_unref);
+	gpiod_line_request_release(self->handle);
+	self->released = TRUE;
+}
+
+gboolean gpiodglib_line_request_is_released(GpiodglibLineRequest *self)
+{
+	g_assert(self);
+
+	return self->released;
+}
+
+static void set_err_request_released(GError **err)
+{
+	g_set_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_REQUEST_RELEASED,
+		    "line request was released and cannot be used");
+}
+
+gchar *gpiodglib_line_request_dup_chip_name(GpiodglibLineRequest *self)
+{
+	return _gpiodglib_dup_prop_string(G_OBJECT(self), "chip-name");
+}
+
+GArray *gpiodglib_line_request_get_requested_offsets(GpiodglibLineRequest *self)
+{
+	return _gpiodglib_get_prop_boxed_array(G_OBJECT(self),
+					      "requested-offsets");
+}
+
+gboolean gpiodglib_line_request_reconfigure_lines(GpiodglibLineRequest *self,
+						  GpiodglibLineConfig *config,
+						  GError **err)
+{
+	struct gpiod_line_config *config_handle;
+	gint ret;
+
+	g_assert(self && self->handle);
+
+	if (gpiodglib_line_request_is_released(self)) {
+		set_err_request_released(err);
+		return FALSE;
+	}
+
+	if (!config) {
+		g_set_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL,
+			    "line-config is required to reconfigure lines");
+		return FALSE;
+	}
+
+	config_handle = _gpiodglib_line_config_get_handle(config);
+
+	ret = gpiod_line_request_reconfigure_lines(self->handle, config_handle);
+	if (ret) {
+		_gpiodglib_set_error_from_errno(err,
+						"failed to reconfigure lines");
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+gboolean
+gpiodglib_line_request_get_value(GpiodglibLineRequest *self, guint offset,
+				 GpiodglibLineValue *value, GError **err)
+{
+	enum gpiod_line_value val;
+
+	g_assert(self && self->handle);
+
+	if (gpiodglib_line_request_is_released(self)) {
+		set_err_request_released(err);
+		return FALSE;
+	}
+
+	val = gpiod_line_request_get_value(self->handle, offset);
+	if (val == GPIOD_LINE_VALUE_ERROR) {
+		_gpiodglib_set_error_from_errno(err,
+			    "failed to get line value for offset %u", offset);
+		return FALSE;
+	}
+
+	*value = _gpiodglib_line_value_from_library(val);
+	return TRUE;
+}
+
+gboolean gpiodglib_line_request_get_values_subset(GpiodglibLineRequest *self,
+						  const GArray *offsets,
+						  GArray **values, GError **err)
+{
+	guint i;
+	int ret;
+
+	g_assert(self && self->handle);
+
+	if (gpiodglib_line_request_is_released(self)) {
+		set_err_request_released(err);
+		return FALSE;
+	}
+
+	if (!offsets || !values) {
+		g_set_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL,
+			    "offsets and values must not be NULL");
+		return FALSE;
+	}
+
+	ret = gpiod_line_request_get_values_subset(self->handle, offsets->len,
+					(const unsigned int *)offsets->data,
+					self->val_buf);
+	if (ret) {
+		_gpiodglib_set_error_from_errno(err, "failed to read line values");
+		return FALSE;
+	}
+
+	if (!(*values)) {
+		*values = g_array_sized_new(FALSE, TRUE,
+					    sizeof(GpiodglibLineValue),
+					    offsets->len);
+	}
+
+	g_array_set_size(*values, offsets->len);
+
+	for (i = 0; i < offsets->len; i++) {
+		GpiodglibLineValue *val = &g_array_index(*values,
+							 GpiodglibLineValue, i);
+		*val = _gpiodglib_line_value_from_library(self->val_buf[i]);
+	}
+
+	return TRUE;
+}
+
+gboolean gpiodglib_line_request_get_values(GpiodglibLineRequest *self,
+					 GArray **values, GError **err)
+{
+	g_autoptr(GArray) offsets = NULL;
+
+	offsets = gpiodglib_line_request_get_requested_offsets(self);
+
+	return gpiodglib_line_request_get_values_subset(self, offsets,
+							values, err);
+}
+
+gboolean gpiodglib_line_request_set_value(GpiodglibLineRequest *self,
+					  guint offset,
+					  GpiodglibLineValue value,
+					  GError **err)
+{
+	int ret;
+
+	g_assert(self && self->handle);
+
+	if (gpiodglib_line_request_is_released(self)) {
+		set_err_request_released(err);
+		return FALSE;
+	}
+
+	ret = gpiod_line_request_set_value(self->handle, offset,
+				_gpiodglib_line_value_to_library(value));
+	if (ret) {
+		_gpiodglib_set_error_from_errno(err,
+			"failed to set line value for offset: %u", offset);
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+gboolean gpiodglib_line_request_set_values_subset(GpiodglibLineRequest *self,
+						  const GArray *offsets,
+						  const GArray *values,
+						  GError **err)
+{
+	guint i;
+	int ret;
+
+	g_assert(self && self->handle);
+
+	if (gpiodglib_line_request_is_released(self)) {
+		set_err_request_released(err);
+		return FALSE;
+	}
+
+	if (!offsets || !values) {
+		g_set_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL,
+			    "offsets and values must not be NULL");
+		return FALSE;
+	}
+
+	if (offsets->len != values->len) {
+		g_set_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL,
+			    "offsets and values must have the sme size");
+		return FALSE;
+	}
+
+	for (i = 0; i < values->len; i++)
+		self->val_buf[i] = _gpiodglib_line_value_to_library(
+					g_array_index(values,
+						      GpiodglibLineValue, i));
+
+	ret = gpiod_line_request_set_values_subset(self->handle,
+						  offsets->len,
+						  (unsigned int *)offsets->data,
+						  self->val_buf);
+	if (ret) {
+		_gpiodglib_set_error_from_errno(err,
+					       "failed to set line values");
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+gboolean gpiodglib_line_request_set_values(GpiodglibLineRequest *self,
+					   GArray *values, GError **err)
+{
+	g_autoptr(GArray) offsets = NULL;
+
+	offsets = gpiodglib_line_request_get_requested_offsets(self);
+
+	return gpiodglib_line_request_set_values_subset(self, offsets,
+							values, err);
+}
+
+GpiodglibLineRequest *
+_gpiodglib_line_request_new(struct gpiod_line_request *handle)
+{
+	g_autoptr(GIOChannel) channel = NULL;
+	GpiodglibLineRequest *req;
+	gsize num_lines;
+
+	req = GPIODGLIB_LINE_REQUEST_OBJ(
+		g_object_new(GPIODGLIB_LINE_REQUEST_TYPE, NULL));
+	req->handle = handle;
+
+	req->event_buf = gpiod_edge_event_buffer_new(event_buf_size);
+	if (!req->event_buf)
+		g_error("failed to allocate the edge event buffer");
+
+	channel = g_io_channel_unix_new(
+			gpiod_line_request_get_fd(req->handle));
+	req->edge_event_src = g_io_create_watch(channel, G_IO_IN);
+	g_source_set_callback(
+			req->edge_event_src,
+			G_SOURCE_FUNC(gpiodglib_line_request_on_edge_event),
+			req, NULL);
+	req->edge_event_src_id = g_source_attach(req->edge_event_src, NULL);
+
+	num_lines = gpiod_line_request_get_num_requested_lines(req->handle);
+	req->val_buf = g_malloc0(sizeof(enum gpiod_line_value) * num_lines);
+
+
+	return req;
+}
diff --git a/bindings/glib/line-settings.c b/bindings/glib/line-settings.c
new file mode 100644
index 0000000..2d7d52a
--- /dev/null
+++ b/bindings/glib/line-settings.c
@@ -0,0 +1,408 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <stdarg.h>
+
+#include "internal.h"
+
+/**
+ * GpiodglibLineSettings:
+ *
+ * Line settings object contains a set of line properties that can be used
+ * when requesting lines or reconfiguring an existing request.
+ */
+struct _GpiodglibLineSettings {
+	GObject parent_instance;
+	struct gpiod_line_settings *handle;
+};
+
+typedef enum {
+	GPIODGLIB_LINE_SETTINGS_PROP_DIRECTION = 1,
+	GPIODGLIB_LINE_SETTINGS_PROP_EDGE_DETECTION,
+	GPIODGLIB_LINE_SETTINGS_PROP_BIAS,
+	GPIODGLIB_LINE_SETTINGS_PROP_DRIVE,
+	GPIODGLIB_LINE_SETTINGS_PROP_ACTIVE_LOW,
+	GPIODGLIB_LINE_SETTINGS_PROP_DEBOUNCE_PERIOD_US,
+	GPIODGLIB_LINE_SETTINGS_PROP_EVENT_CLOCK,
+	GPIODGLIB_LINE_SETTINGS_PROP_OUTPUT_VALUE,
+} GpiodglibLineSettingsProp;
+
+G_DEFINE_TYPE(GpiodglibLineSettings, gpiodglib_line_settings, G_TYPE_OBJECT);
+
+static void gpiodglib_line_settings_init_handle(GpiodglibLineSettings *self)
+{
+	if (!self->handle) {
+		self->handle = gpiod_line_settings_new();
+		if (!self->handle)
+			/* The only possible error is ENOMEM. */
+			g_error("Failed to allocate memory for the line-settings object.");
+	}
+}
+
+static void gpiodglib_line_settings_get_property(GObject *obj, guint prop_id,
+						 GValue *val, GParamSpec *pspec)
+{
+	GpiodglibLineSettings *self = GPIODGLIB_LINE_SETTINGS_OBJ(obj);
+
+	gpiodglib_line_settings_init_handle(self);
+
+	switch ((GpiodglibLineSettingsProp)prop_id) {
+	case GPIODGLIB_LINE_SETTINGS_PROP_DIRECTION:
+		g_value_set_enum(val,
+			_gpiodglib_line_direction_from_library(
+				gpiod_line_settings_get_direction(
+							self->handle), TRUE));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_EDGE_DETECTION:
+		g_value_set_enum(val,
+			_gpiodglib_line_edge_from_library(
+				gpiod_line_settings_get_edge_detection(
+							self->handle)));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_BIAS:
+		g_value_set_enum(val,
+			_gpiodglib_line_bias_from_library(
+				gpiod_line_settings_get_bias(self->handle),
+				TRUE));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_DRIVE:
+		g_value_set_enum(val,
+			_gpiodglib_line_drive_from_library(
+				gpiod_line_settings_get_drive(self->handle)));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_ACTIVE_LOW:
+		g_value_set_boolean(val,
+			gpiod_line_settings_get_active_low(self->handle));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_DEBOUNCE_PERIOD_US:
+		g_value_set_int64(val,
+			gpiod_line_settings_get_debounce_period_us(
+							self->handle));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_EVENT_CLOCK:
+		g_value_set_enum(val,
+			_gpiodglib_line_clock_from_library(
+				gpiod_line_settings_get_event_clock(
+							self->handle)));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_OUTPUT_VALUE:
+		g_value_set_enum(val,
+			_gpiodglib_line_value_from_library(
+				gpiod_line_settings_get_output_value(
+							self->handle)));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_line_settings_set_property(GObject *obj, guint prop_id,
+						 const GValue *val,
+						 GParamSpec *pspec)
+{
+	GpiodglibLineSettings *self = GPIODGLIB_LINE_SETTINGS_OBJ(obj);
+
+	gpiodglib_line_settings_init_handle(self);
+
+	switch ((GpiodglibLineSettingsProp)prop_id) {
+	case GPIODGLIB_LINE_SETTINGS_PROP_DIRECTION:
+		gpiod_line_settings_set_direction(self->handle,
+			_gpiodglib_line_direction_to_library(
+				g_value_get_enum(val)));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_EDGE_DETECTION:
+		gpiod_line_settings_set_edge_detection(self->handle,
+			_gpiodglib_line_edge_to_library(g_value_get_enum(val)));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_BIAS:
+		gpiod_line_settings_set_bias(self->handle,
+			_gpiodglib_line_bias_to_library(g_value_get_enum(val)));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_DRIVE:
+		gpiod_line_settings_set_drive(self->handle,
+			_gpiodglib_line_drive_to_library(g_value_get_enum(val)));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_ACTIVE_LOW:
+		gpiod_line_settings_set_active_low(self->handle,
+						   g_value_get_boolean(val));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_DEBOUNCE_PERIOD_US:
+		gpiod_line_settings_set_debounce_period_us(self->handle,
+						g_value_get_int64(val));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_EVENT_CLOCK:
+		gpiod_line_settings_set_event_clock(self->handle,
+			_gpiodglib_line_clock_to_library(g_value_get_enum(val)));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_OUTPUT_VALUE:
+		gpiod_line_settings_set_output_value(self->handle,
+			_gpiodglib_line_value_to_library(g_value_get_enum(val)));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_line_settings_finalize(GObject *obj)
+{
+	GpiodglibLineSettings *self = GPIODGLIB_LINE_SETTINGS_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_line_settings_free);
+
+	G_OBJECT_CLASS(gpiodglib_line_settings_parent_class)->finalize(obj);
+}
+
+static void gpiodglib_line_settings_class_init(
+			GpiodglibLineSettingsClass *line_settings_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(line_settings_class);
+
+	class->set_property = gpiodglib_line_settings_set_property;
+	class->get_property = gpiodglib_line_settings_get_property;
+	class->finalize = gpiodglib_line_settings_finalize;
+
+	/**
+	 * GpiodglibLineSettings:direction
+	 *
+	 * Line direction setting.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_LINE_SETTINGS_PROP_DIRECTION,
+		g_param_spec_enum("direction", "Direction",
+			"Line direction setting.",
+			GPIODGLIB_LINE_DIRECTION_TYPE,
+			GPIODGLIB_LINE_DIRECTION_AS_IS,
+			G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineSettings:edge-detection
+	 *
+	 * Line edge detection setting.
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_SETTINGS_PROP_EDGE_DETECTION,
+		g_param_spec_enum("edge-detection", "Edge Detection",
+			"Line edge detection setting.",
+			GPIODGLIB_LINE_EDGE_TYPE,
+			GPIODGLIB_LINE_EDGE_NONE,
+			G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineSettings:bias
+	 *
+	 * Line bias setting.
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_SETTINGS_PROP_BIAS,
+		g_param_spec_enum("bias", "Bias",
+			"Line bias setting.",
+			GPIODGLIB_LINE_BIAS_TYPE,
+			GPIODGLIB_LINE_BIAS_AS_IS,
+			G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineSettings:drive
+	 *
+	 * Line drive setting.
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_SETTINGS_PROP_DRIVE,
+		g_param_spec_enum("drive", "Drive",
+			"Line drive setting.",
+			GPIODGLIB_LINE_DRIVE_TYPE,
+			GPIODGLIB_LINE_DRIVE_PUSH_PULL,
+			G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineSettings:active-low
+	 *
+	 * Line active-low settings.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_LINE_SETTINGS_PROP_ACTIVE_LOW,
+		g_param_spec_boolean("active-low", "Active-Low",
+			"Line active-low settings.",
+			FALSE, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineSettings:debounce-period-us
+	 *
+	 * Line debounce period (expressed in microseconds).
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_SETTINGS_PROP_DEBOUNCE_PERIOD_US,
+		g_param_spec_int64("debounce-period-us",
+			"Debounce Period (in microseconds)",
+			"Line debounce period (expressed in microseconds).",
+			0, G_MAXINT64, 0,
+			G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineSettings:event-clock
+	 *
+	 * Clock used to timestamp edge events.
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_SETTINGS_PROP_EVENT_CLOCK,
+		g_param_spec_enum("event-clock", "Event Clock",
+			"Clock used to timestamp edge events.",
+			GPIODGLIB_LINE_CLOCK_TYPE,
+			GPIODGLIB_LINE_CLOCK_MONOTONIC,
+			G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineSettings:output-value
+	 *
+	 * Line output value.
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_SETTINGS_PROP_OUTPUT_VALUE,
+		g_param_spec_enum("output-value", "Output Value",
+			"Line output value.",
+			GPIODGLIB_LINE_VALUE_TYPE,
+			GPIODGLIB_LINE_VALUE_INACTIVE,
+			G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+}
+
+static void gpiodglib_line_settings_init(GpiodglibLineSettings *self)
+{
+	self->handle = NULL;
+}
+
+GpiodglibLineSettings *gpiodglib_line_settings_new(const gchar *first_prop, ...)
+{
+	GpiodglibLineSettings *settings;
+	va_list va;
+
+	va_start(va, first_prop);
+	settings = GPIODGLIB_LINE_SETTINGS_OBJ(
+			g_object_new_valist(GPIODGLIB_LINE_SETTINGS_TYPE,
+					    first_prop, va));
+	va_end(va);
+
+	return settings;
+}
+
+void gpiodglib_line_settings_reset(GpiodglibLineSettings *self)
+{
+	g_assert(self);
+
+	if (self->handle)
+		gpiod_line_settings_reset(self->handle);
+}
+
+void gpiodglib_line_settings_set_direction(GpiodglibLineSettings *self,
+					   GpiodglibLineDirection direction)
+{
+	_gpiodglib_set_prop_enum(G_OBJECT(self), "direction", direction);
+}
+
+GpiodglibLineDirection
+gpiodglib_line_settings_get_direction(GpiodglibLineSettings *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "direction");
+}
+
+void gpiodglib_line_settings_set_edge_detection(GpiodglibLineSettings *self,
+						GpiodglibLineEdge edge)
+{
+	_gpiodglib_set_prop_enum(G_OBJECT(self), "edge-detection", edge);
+}
+
+GpiodglibLineEdge
+gpiodglib_line_settings_get_edge_detection(GpiodglibLineSettings *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "edge-detection");
+}
+
+void gpiodglib_line_settings_set_bias(GpiodglibLineSettings *self,
+				      GpiodglibLineBias bias)
+{
+	_gpiodglib_set_prop_enum(G_OBJECT(self), "bias", bias);
+}
+
+GpiodglibLineBias gpiodglib_line_settings_get_bias(GpiodglibLineSettings *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "bias");
+}
+
+void gpiodglib_line_settings_set_drive(GpiodglibLineSettings *self,
+				       GpiodglibLineDrive drive)
+{
+	_gpiodglib_set_prop_enum(G_OBJECT(self), "drive", drive);
+}
+
+GpiodglibLineDrive
+gpiodglib_line_settings_get_drive(GpiodglibLineSettings *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "drive");
+}
+
+void gpiodglib_line_settings_set_active_low(GpiodglibLineSettings *self,
+					    gboolean active_low)
+{
+	_gpiodglib_set_prop_bool(G_OBJECT(self), "active-low", active_low);
+}
+
+gboolean gpiodglib_line_settings_get_active_low(GpiodglibLineSettings *self)
+{
+	return _gpiodglib_get_prop_bool(G_OBJECT(self), "active-low");
+}
+
+void gpiodglib_line_settings_set_debounce_period_us(GpiodglibLineSettings *self,
+						    GTimeSpan period)
+{
+	_gpiodglib_set_prop_timespan(G_OBJECT(self),
+				     "debounce-period-us", period);
+}
+
+GTimeSpan
+gpiodglib_line_settings_get_debounce_period_us(GpiodglibLineSettings *self)
+{
+	return _gpiodglib_get_prop_timespan(G_OBJECT(self),
+					   "debounce-period-us");
+}
+
+void gpiodglib_line_settings_set_event_clock(GpiodglibLineSettings *self,
+					     GpiodglibLineClock event_clock)
+{
+	_gpiodglib_set_prop_enum(G_OBJECT(self), "event-clock", event_clock);
+}
+
+GpiodglibLineClock
+gpiodglib_line_settings_get_event_clock(GpiodglibLineSettings *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "event-clock");
+}
+
+void gpiodglib_line_settings_set_output_value(GpiodglibLineSettings *self,
+					      GpiodglibLineValue value)
+{
+	_gpiodglib_set_prop_enum(G_OBJECT(self), "output-value", value);
+}
+
+GpiodglibLineValue
+gpiodglib_line_settings_get_output_value(GpiodglibLineSettings *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "output-value");
+}
+
+struct gpiod_line_settings *
+_gpiodglib_line_settings_get_handle(GpiodglibLineSettings *settings)
+{
+	return settings->handle;
+}
+
+GpiodglibLineSettings *
+_gpiodglib_line_settings_new(struct gpiod_line_settings *handle)
+{
+	GpiodglibLineSettings *settings;
+
+	settings = GPIODGLIB_LINE_SETTINGS_OBJ(
+			g_object_new(GPIODGLIB_LINE_SETTINGS_TYPE, NULL));
+	gpiod_line_settings_free(settings->handle);
+	settings->handle = handle;
+
+	return settings;
+}
diff --git a/bindings/glib/misc.c b/bindings/glib/misc.c
new file mode 100644
index 0000000..d0563bd
--- /dev/null
+++ b/bindings/glib/misc.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gpiod.h>
+#include <gpiod-glib.h>
+
+gboolean gpiodglib_is_gpiochip_device(const gchar *path)
+{
+	g_assert(path);
+
+	return gpiod_is_gpiochip_device(path);
+}
+
+const gchar *gpiodglib_api_version(void)
+{
+	return gpiod_api_version();
+}
diff --git a/bindings/glib/request-config.c b/bindings/glib/request-config.c
new file mode 100644
index 0000000..65ce4c3
--- /dev/null
+++ b/bindings/glib/request-config.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <stdarg.h>
+
+#include "internal.h"
+
+/**
+ * GpiodglibRequestConfig:
+ *
+ * Request config objects are used to pass a set of options to the kernel at
+ * the time of the line request.
+ */
+struct _GpiodglibRequestConfig {
+	GObject parent_instance;
+	struct gpiod_request_config *handle;
+};
+
+typedef enum {
+	GPIODGLIB_REQUEST_CONFIG_PROP_CONSUMER = 1,
+	GPIODGLIB_REQUEST_CONFIG_PROP_EVENT_BUFFER_SIZE,
+} GpiodglibRequestConfigProp;
+
+G_DEFINE_TYPE(GpiodglibRequestConfig, gpiodglib_request_config, G_TYPE_OBJECT);
+
+static void gpiodglib_request_config_get_property(GObject *obj, guint prop_id,
+						  GValue *val,
+						  GParamSpec *pspec)
+{
+	GpiodglibRequestConfig *self = GPIODGLIB_REQUEST_CONFIG_OBJ(obj);
+
+	switch ((GpiodglibRequestConfigProp)prop_id) {
+	case GPIODGLIB_REQUEST_CONFIG_PROP_CONSUMER:
+		g_value_set_string(val,
+			gpiod_request_config_get_consumer(self->handle));
+		break;
+	case GPIODGLIB_REQUEST_CONFIG_PROP_EVENT_BUFFER_SIZE:
+		g_value_set_uint(val,
+			gpiod_request_config_get_event_buffer_size(
+				self->handle));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_request_config_set_property(GObject *obj, guint prop_id,
+						  const GValue *val,
+						  GParamSpec *pspec)
+{
+	GpiodglibRequestConfig *self = GPIODGLIB_REQUEST_CONFIG_OBJ(obj);
+
+	switch ((GpiodglibRequestConfigProp)prop_id) {
+	case GPIODGLIB_REQUEST_CONFIG_PROP_CONSUMER:
+		gpiod_request_config_set_consumer(self->handle,
+						  g_value_get_string(val));
+		break;
+	case GPIODGLIB_REQUEST_CONFIG_PROP_EVENT_BUFFER_SIZE:
+		gpiod_request_config_set_event_buffer_size(self->handle,
+							g_value_get_uint(val));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_request_config_finalize(GObject *obj)
+{
+	GpiodglibRequestConfig *self = GPIODGLIB_REQUEST_CONFIG_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_request_config_free);
+
+	G_OBJECT_CLASS(gpiodglib_request_config_parent_class)->finalize(obj);
+}
+
+static void gpiodglib_request_config_class_init(
+			GpiodglibRequestConfigClass *request_config_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(request_config_class);
+
+	class->set_property = gpiodglib_request_config_set_property;
+	class->get_property = gpiodglib_request_config_get_property;
+	class->finalize = gpiodglib_request_config_finalize;
+
+	/**
+	 * GpiodglibRequestConfig:consumer:
+	 *
+	 * Name of the request consumer.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_REQUEST_CONFIG_PROP_CONSUMER,
+		g_param_spec_string("consumer", "Consumer",
+			"Name of the request consumer.",
+			NULL, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibRequestConfig:event-buffer-size:
+	 *
+	 * Size of the kernel event buffer size of the request.
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_REQUEST_CONFIG_PROP_EVENT_BUFFER_SIZE,
+		g_param_spec_uint("event-buffer-size", "Event Buffer Size",
+			"Size of the kernel event buffer size of the request.",
+			0, G_MAXUINT, 64,
+			G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+}
+
+static void gpiodglib_request_config_init(GpiodglibRequestConfig *self)
+{
+	self->handle = gpiod_request_config_new();
+	if (!self->handle)
+		/* The only possible error is ENOMEM. */
+		g_error("Failed to allocate memory for the request-config object.");
+}
+
+GpiodglibRequestConfig *
+gpiodglib_request_config_new(const gchar *first_prop, ...)
+{
+	GpiodglibRequestConfig *settings;
+	va_list va;
+
+	va_start(va, first_prop);
+	settings = GPIODGLIB_REQUEST_CONFIG_OBJ(
+			g_object_new_valist(GPIODGLIB_REQUEST_CONFIG_TYPE,
+					    first_prop, va));
+	va_end(va);
+
+	return settings;
+}
+
+void gpiodglib_request_config_set_consumer(GpiodglibRequestConfig *self,
+					   const gchar *consumer)
+{
+	g_assert(self);
+
+	_gpiodglib_set_prop_string(G_OBJECT(self), "consumer", consumer);
+}
+
+gchar *gpiodglib_request_config_dup_consumer(GpiodglibRequestConfig *self)
+{
+	g_assert(self);
+
+	return _gpiodglib_dup_prop_string(G_OBJECT(self), "consumer");
+}
+
+void
+gpiodglib_request_config_set_event_buffer_size(GpiodglibRequestConfig *self,
+					       guint event_buffer_size)
+{
+	g_assert(self);
+
+	_gpiodglib_set_prop_uint(G_OBJECT(self), "event-buffer-size",
+				 event_buffer_size);
+}
+
+guint
+gpiodglib_request_config_get_event_buffer_size(GpiodglibRequestConfig *self)
+{
+	g_assert(self);
+
+	return _gpiodglib_get_prop_uint(G_OBJECT(self), "event-buffer-size");
+}
+
+struct gpiod_request_config *
+_gpiodglib_request_config_get_handle(GpiodglibRequestConfig *req_cfg)
+{
+	return req_cfg->handle;
+}
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
diff --git a/bindings/glib/tests/helpers.c b/bindings/glib/tests/helpers.c
new file mode 100644
index 0000000..202c2d5
--- /dev/null
+++ b/bindings/glib/tests/helpers.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include "helpers.h"
+
+GArray *gpiodglib_test_array_from_const(gconstpointer data, gsize len,
+					gsize elem_size)
+{
+	GArray *arr = g_array_new(FALSE, TRUE, elem_size);
+
+	return g_array_append_vals(arr, data, len);
+}
diff --git a/bindings/glib/tests/helpers.h b/bindings/glib/tests/helpers.h
new file mode 100644
index 0000000..ad0a938
--- /dev/null
+++ b/bindings/glib/tests/helpers.h
@@ -0,0 +1,140 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_TEST_HELPERS_H__
+#define __GPIODGLIB_TEST_HELPERS_H__
+
+#include <glib.h>
+#include <gpiod-test-common.h>
+
+#define gpiodglib_test_new_chip_or_fail(_path) \
+	({ \
+		g_autoptr(GError) _err = NULL; \
+		GpiodglibChip *_chip = gpiodglib_chip_new(_path, &_err); \
+		g_assert_nonnull(_chip); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+		_chip; \
+	})
+
+#define gpiodglib_test_chip_get_info_or_fail(_chip) \
+	({ \
+		g_autoptr(GError) _err = NULL; \
+		GpiodglibChipInfo *_info = gpiodglib_chip_get_info(_chip, \
+								   &_err); \
+		g_assert_nonnull(_info); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+		_info; \
+	})
+
+#define gpiodglib_test_chip_get_line_info_or_fail(_chip, _offset) \
+	({ \
+		g_autoptr(GError) _err = NULL; \
+		GpiodglibLineInfo *_info = \
+			gpiodglib_chip_get_line_info(_chip, _offset, &_err); \
+		g_assert_nonnull(_info); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+		_info; \
+	})
+
+#define gpiodglib_test_chip_watch_line_info_or_fail(_chip, _offset) \
+	({ \
+		g_autoptr(GError) _err = NULL; \
+		GpiodglibLineInfo *_info = \
+			gpiodglib_chip_watch_line_info(_chip, _offset, \
+						       &_err); \
+		g_assert_nonnull(_info); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+		_info; \
+	})
+
+#define gpiodglib_test_chip_unwatch_line_info_or_fail(_chip, _offset) \
+	do { \
+		g_autoptr(GError) _err = NULL; \
+		gboolean ret = gpiodglib_chip_unwatch_line_info(_chip, \
+								_offset, \
+								&_err); \
+		g_assert_true(ret); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+	} while (0)
+
+#define gpiodglib_test_line_config_add_line_settings_or_fail(_config, \
+							     _offsets, \
+							     _settings) \
+	do { \
+		g_autoptr(GError) _err = NULL; \
+		gboolean _ret = \
+			gpiodglib_line_config_add_line_settings(_config, \
+								_offsets,\
+								_settings, \
+								&_err); \
+		g_assert_true(_ret); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+	} while (0)
+
+#define gpiodglib_test_line_config_get_line_settings_or_fail(_config, \
+							     _offset) \
+	({ \
+		GpiodglibLineSettings *_settings = \
+			gpiodglib_line_config_get_line_settings(_config, \
+								_offset); \
+		g_assert_nonnull(_settings); \
+		gpiod_test_return_if_failed(); \
+		_settings; \
+	})
+
+#define gpiodglib_test_line_config_set_output_values_or_fail(_config, \
+							     _values) \
+	do { \
+		g_autoptr(GError) _err = NULL; \
+		gboolean _ret = \
+			gpiodglib_line_config_set_output_values(_config, \
+								_values, \
+								&_err); \
+		g_assert_true(_ret); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+	} while (0)
+
+#define gpiodglib_test_chip_request_lines_or_fail(_chip, _req_cfg, _line_cfg) \
+	({ \
+		g_autoptr(GError) _err = NULL; \
+		GpiodglibLineRequest *_req = \
+			gpiodglib_chip_request_lines(_chip, _req_cfg, \
+						     _line_cfg, &_err); \
+		g_assert_nonnull(_req); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+		_req; \
+	})
+
+#define gpiodglib_test_request_lines_or_fail(_path, _req_cfg, _line_cfg) \
+	({ \
+		g_autoptr(GpiodglibChip) _chip = \
+			gpiodglib_test_new_chip_or_fail(_path); \
+		GpiodglibLineRequest *_req = \
+			gpiodglib_test_chip_request_lines_or_fail(_chip, \
+								  _req_cfg, \
+								  _line_cfg); \
+		_req; \
+	})
+
+#define gpiodglib_test_check_error_or_fail(_err, _domain, _code) \
+	do { \
+		g_assert_nonnull(_err); \
+		gpiod_test_return_if_failed(); \
+		g_assert_cmpint(_domain, ==, (_err)->domain); \
+		g_assert_cmpint(_code, ==, (_err)->code); \
+		gpiod_test_return_if_failed(); \
+	} while (0)
+
+GArray *gpiodglib_test_array_from_const(const gconstpointer data, gsize len,
+					 gsize elem_size);
+
+#endif /* __GPIODGLIB_TEST_HELPERS_H__ */
+
diff --git a/bindings/glib/tests/tests-chip-info.c b/bindings/glib/tests/tests-chip-info.c
new file mode 100644
index 0000000..22b83c2
--- /dev/null
+++ b/bindings/glib/tests/tests-chip-info.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
+
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "glib/chip-info"
+
+GPIOD_TEST_CASE(get_name)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibChipInfo) info = NULL;
+	g_autofree gchar *name = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiodglib_test_chip_get_info_or_fail(chip);
+	name = gpiodglib_chip_info_dup_name(info);
+
+	g_assert_cmpstr(name, ==, g_gpiosim_chip_get_name(sim));
+}
+
+GPIOD_TEST_CASE(get_label)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("label", "foobar",
+							NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibChipInfo) info = NULL;
+	g_autofree gchar *label = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiodglib_test_chip_get_info_or_fail(chip);
+	label = gpiodglib_chip_info_dup_label(info);
+
+	g_assert_cmpstr(label, ==, "foobar");
+}
+
+GPIOD_TEST_CASE(get_num_lines)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 16, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibChipInfo) info = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiodglib_test_chip_get_info_or_fail(chip);
+
+	g_assert_cmpuint(gpiodglib_chip_info_get_num_lines(info), ==, 16);
+}
diff --git a/bindings/glib/tests/tests-chip.c b/bindings/glib/tests/tests-chip.c
new file mode 100644
index 0000000..9888b38
--- /dev/null
+++ b/bindings/glib/tests/tests-chip.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
+
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "glib/chip"
+
+GPIOD_TEST_CASE(open_chip_good)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiodglib_chip_new(g_gpiosim_chip_get_dev_path(sim), &err);
+	g_assert_nonnull(chip);
+	g_assert_null(err);
+}
+
+GPIOD_TEST_CASE(open_chip_nonexistent)
+{
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiodglib_chip_new("/dev/nonexistent", &err);
+	g_assert_null(chip);
+	gpiodglib_test_check_error_or_fail(err, GPIODGLIB_ERROR,
+					   GPIODGLIB_ERR_NOENT);
+}
+
+GPIOD_TEST_CASE(open_chip_not_a_character_device)
+{
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiodglib_chip_new("/tmp", &err);
+	g_assert_null(chip);
+	gpiodglib_test_check_error_or_fail(err, GPIODGLIB_ERROR,
+					   GPIODGLIB_ERR_NOTTY);
+}
+
+GPIOD_TEST_CASE(open_chip_not_a_gpio_device)
+{
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiodglib_chip_new("/dev/null", &err);
+	g_assert_null(chip);
+	gpiodglib_test_check_error_or_fail(err, GPIODGLIB_ERROR,
+					   GPIODGLIB_ERR_NODEV);
+}
+
+GPIOD_TEST_CASE(get_chip_path)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	const gchar *path = g_gpiosim_chip_get_dev_path(sim);
+	g_autofree gchar *chip_path = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(path);
+
+	chip_path = gpiodglib_chip_dup_path(chip);
+	g_assert_cmpstr(chip_path, ==, path);
+}
+
+GPIOD_TEST_CASE(closed_chip)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	g_autoptr(GpiodglibChipInfo) info = NULL;
+	const gchar *path = g_gpiosim_chip_get_dev_path(sim);
+	g_autofree gchar *chip_path = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(path);
+
+	gpiodglib_chip_close(chip);
+
+	info = gpiodglib_chip_get_info(chip, &err);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_CHIP_CLOSED);
+
+	/* Properties still work. */
+	chip_path = gpiodglib_chip_dup_path(chip);
+	g_assert_cmpstr(chip_path, ==, path);
+}
+
+GPIOD_TEST_CASE(find_line_bad)
+{
+	static const GPIOSimLineName names[] = {
+		{ .offset = 1, .name = "foo", },
+		{ .offset = 2, .name = "bar", },
+		{ .offset = 4, .name = "baz", },
+		{ .offset = 5, .name = "xyz", },
+		{ }
+	};
+
+	g_autoptr(GVariant) vnames = g_gpiosim_package_line_names(names);
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8,
+							"line-names", vnames,
+							NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	guint offset;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	g_assert_false(gpiodglib_chip_get_line_offset_from_name(chip,
+								"nonexistent",
+								&offset, &err));
+	g_assert_no_error(err);
+}
+
+GPIOD_TEST_CASE(find_line_good)
+{
+	static const GPIOSimLineName names[] = {
+		{ .offset = 1, .name = "foo", },
+		{ .offset = 2, .name = "bar", },
+		{ .offset = 4, .name = "baz", },
+		{ .offset = 5, .name = "xyz", },
+		{ }
+	};
+
+	g_autoptr(GVariant) vnames = g_gpiosim_package_line_names(names);
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8,
+							"line-names", vnames,
+							NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	guint offset;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	g_assert_true(gpiodglib_chip_get_line_offset_from_name(chip, "baz",
+							       &offset, &err));
+	g_assert_no_error(err);
+	g_assert_cmpuint(offset, ==, 4);
+}
+
+/* Verify that for duplicated line names, the first one is returned. */
+GPIOD_TEST_CASE(find_line_duplicate)
+{
+	static const GPIOSimLineName names[] = {
+		{ .offset = 1, .name = "foo", },
+		{ .offset = 2, .name = "baz", },
+		{ .offset = 4, .name = "baz", },
+		{ .offset = 5, .name = "xyz", },
+		{ }
+	};
+
+	g_autoptr(GVariant) vnames = g_gpiosim_package_line_names(names);
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8,
+							"line-names", vnames,
+							NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	guint offset;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	g_assert_true(gpiodglib_chip_get_line_offset_from_name(chip, "baz",
+							       &offset, &err));
+	g_assert_no_error(err);
+	g_assert_cmpuint(offset, ==, 2);
+}
+
+GPIOD_TEST_CASE(find_line_null_name)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	guint offset;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	g_assert_false(gpiodglib_chip_get_line_offset_from_name(chip, NULL,
+								&offset, &err));
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
diff --git a/bindings/glib/tests/tests-edge-event.c b/bindings/glib/tests/tests-edge-event.c
new file mode 100644
index 0000000..4368e0f
--- /dev/null
+++ b/bindings/glib/tests/tests-edge-event.c
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
+
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "glib/edge-event"
+
+static gpointer falling_and_rising_edge_events(gpointer data)
+{
+	GPIOSimChip *sim = data;
+
+	g_usleep(1000);
+
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
+
+	g_usleep(1000);
+
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_DOWN);
+
+	return NULL;
+}
+
+typedef struct {
+	gboolean rising;
+	gboolean falling;
+	gboolean failed;
+	guint64 falling_ts;
+	guint64 rising_ts;
+	guint falling_offset;
+	guint rising_offset;
+} EdgeEventCallbackData;
+
+static void on_edge_event(GpiodglibLineRequest *request G_GNUC_UNUSED,
+			  GpiodglibEdgeEvent *event, gpointer data)
+{
+	EdgeEventCallbackData *cb_data = data;
+
+	if (gpiodglib_edge_event_get_event_type(event) ==
+	    GPIODGLIB_EDGE_EVENT_FALLING_EDGE) {
+		cb_data->falling = TRUE;
+		cb_data->falling_ts =
+			gpiodglib_edge_event_get_timestamp_ns(event);
+		cb_data->falling_offset =
+			gpiodglib_edge_event_get_line_offset(event);
+	} else {
+		cb_data->rising = TRUE;
+		cb_data->rising_ts =
+			gpiodglib_edge_event_get_timestamp_ns(event);
+		cb_data->rising_offset =
+			gpiodglib_edge_event_get_line_offset(event);
+	}
+}
+
+static gboolean on_timeout(gpointer data)
+{
+	EdgeEventCallbackData *cb_data = data;
+
+	g_test_fail_printf("timeout while waiting for edge events");
+	cb_data->failed = TRUE;
+
+	return G_SOURCE_CONTINUE;
+}
+
+GPIOD_TEST_CASE(read_both_events)
+{
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GThread) thread = NULL;
+	EdgeEventCallbackData cb_data = { };
+	guint timeout_id;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT,
+			"edge-detection", GPIODGLIB_LINE_EDGE_BOTH, NULL);
+	config = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(config, offsets,
+							     settings);
+
+	request = gpiodglib_test_chip_request_lines_or_fail(chip, NULL, config);
+
+	g_signal_connect(request, "edge-event",
+			 G_CALLBACK(on_edge_event), &cb_data);
+	timeout_id = g_timeout_add_seconds(5, on_timeout, &cb_data);
+
+	thread = g_thread_new("rising-falling-edge-events",
+			      falling_and_rising_edge_events, sim);
+	g_thread_ref(thread);
+
+	while (!cb_data.failed && (!cb_data.falling || !cb_data.rising))
+		g_main_context_iteration(NULL, TRUE);
+
+	g_source_remove(timeout_id);
+	g_thread_join(thread);
+
+	g_assert_cmpuint(cb_data.falling_ts, >, cb_data.rising_ts);
+	g_assert_cmpuint(cb_data.falling_offset, ==, offset);
+	g_assert_cmpuint(cb_data.rising_offset, ==, offset);
+}
+
+typedef struct {
+	gboolean failed;
+	gboolean first;
+	gboolean second;
+	guint first_offset;
+	guint second_offset;
+	gulong first_line_seqno;
+	gulong second_line_seqno;
+	gulong first_global_seqno;
+	gulong second_global_seqno;
+} SeqnoCallbackData;
+
+static void on_seqno_edge_event(GpiodglibLineRequest *request G_GNUC_UNUSED,
+				GpiodglibEdgeEvent *event, gpointer data)
+{
+	SeqnoCallbackData *cb_data = data;
+
+	if (!cb_data->first) {
+		cb_data->first_offset =
+			gpiodglib_edge_event_get_line_offset(event);
+		cb_data->first_line_seqno =
+			gpiodglib_edge_event_get_line_seqno(event);
+		cb_data->first_global_seqno =
+			gpiodglib_edge_event_get_global_seqno(event);
+		cb_data->first = TRUE;
+	} else {
+		cb_data->second_offset =
+			gpiodglib_edge_event_get_line_offset(event);
+		cb_data->second_line_seqno =
+			gpiodglib_edge_event_get_line_seqno(event);
+		cb_data->second_global_seqno =
+			gpiodglib_edge_event_get_global_seqno(event);
+		cb_data->second = TRUE;
+	}
+}
+
+static gpointer rising_edge_events_on_two_offsets(gpointer data)
+{
+	GPIOSimChip *sim = data;
+
+	g_usleep(1000);
+
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
+
+	g_usleep(1000);
+
+	g_gpiosim_chip_set_pull(sim, 3, G_GPIOSIM_PULL_UP);
+
+	return NULL;
+}
+
+static gboolean on_seqno_timeout(gpointer data)
+{
+	SeqnoCallbackData *cb_data = data;
+
+	g_test_fail_printf("timeout while waiting for edge events");
+	cb_data->failed = TRUE;
+
+	return G_SOURCE_CONTINUE;
+}
+
+GPIOD_TEST_CASE(seqno)
+{
+	static const guint offset_vals[] = { 2, 3 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GThread) thread = NULL;
+	SeqnoCallbackData cb_data = { };
+	guint timeout_id;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+		g_gpiosim_chip_get_dev_path(sim));
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT,
+			"edge-detection", GPIODGLIB_LINE_EDGE_BOTH, NULL);
+	config = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(offset_vals, 2,
+						  sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(config, offsets,
+							     settings);
+
+	request = gpiodglib_test_chip_request_lines_or_fail(chip, NULL,
+							    config);
+	g_signal_connect(request, "edge-event",
+			 G_CALLBACK(on_seqno_edge_event), &cb_data);
+
+	timeout_id = g_timeout_add_seconds(5, on_seqno_timeout, &cb_data);
+
+	thread = g_thread_new("two-rising-edge-events",
+			      rising_edge_events_on_two_offsets, sim);
+	g_thread_ref(thread);
+
+	while (!cb_data.failed && (!cb_data.first || !cb_data.second))
+		g_main_context_iteration(NULL, TRUE);
+
+	g_source_remove(timeout_id);
+	g_thread_join(thread);
+
+	g_assert_cmpuint(cb_data.first_offset, ==, 2);
+	g_assert_cmpuint(cb_data.second_offset, ==, 3);
+	g_assert_cmpuint(cb_data.first_line_seqno, ==, 1);
+	g_assert_cmpuint(cb_data.second_line_seqno, ==, 1);
+	g_assert_cmpuint(cb_data.first_global_seqno, ==, 1);
+	g_assert_cmpuint(cb_data.second_global_seqno, ==, 2);
+}
diff --git a/bindings/glib/tests/tests-info-event.c b/bindings/glib/tests/tests-info-event.c
new file mode 100644
index 0000000..0234905
--- /dev/null
+++ b/bindings/glib/tests/tests-info-event.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
+
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "glib/info-event"
+
+GPIOD_TEST_CASE(watching_info_events_returns_line_info)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+	info = gpiodglib_test_chip_watch_line_info_or_fail(chip, 3);
+	g_assert_cmpuint(gpiodglib_line_info_get_offset(info), ==, 3);
+}
+
+GPIOD_TEST_CASE(try_offset_of_out_range)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+	info = gpiodglib_chip_watch_line_info(chip, 11, &err);
+	g_assert_null(info);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+static void on_bad_info_event(GpiodglibChip *chip G_GNUC_UNUSED,
+			      GpiodglibInfoEvent *event G_GNUC_UNUSED,
+			      gpointer data G_GNUC_UNUSED)
+{
+	g_test_fail_printf("unexpected info event received");
+}
+
+static gboolean on_expected_timeout(gpointer data)
+{
+	gboolean *done = data;
+
+	*done = TRUE;
+
+	return G_SOURCE_REMOVE;
+}
+
+GPIOD_TEST_CASE(event_timeout)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	gboolean done = FALSE;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	g_signal_connect(chip, "info-event",
+			 G_CALLBACK(on_bad_info_event), NULL);
+	g_timeout_add(100, on_expected_timeout, &done);
+
+	info = gpiodglib_test_chip_watch_line_info_or_fail(chip, 3);
+
+	while (!done && !g_test_failed())
+		g_main_context_iteration(NULL, TRUE);
+}
+
+typedef struct {
+	const gchar *chip_path;
+	guint offset;
+} RequestContext;
+
+typedef struct {
+	GPtrArray *events;
+	guint done;
+	gboolean failed;
+} EventContext;
+
+static gpointer request_reconfigure_release_line(gpointer data)
+{
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	RequestContext *ctx = data;
+	gboolean ret;
+
+	chip = gpiodglib_chip_new(ctx->chip_path, &err);
+	g_assert_no_error(err);
+	if (g_test_failed())
+		return NULL;
+
+	offsets = gpiodglib_test_array_from_const(&ctx->offset, 1,
+						   sizeof(guint));
+	config = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(NULL);
+
+	ret = gpiodglib_line_config_add_line_settings(config, offsets,
+						      settings, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	if (g_test_failed())
+		return NULL;
+
+	g_usleep(1000);
+
+	request = gpiodglib_chip_request_lines(chip, NULL, config, &err);
+	g_assert_nonnull(request);
+	g_assert_no_error(err);
+
+	g_usleep(1000);
+
+	gpiodglib_line_config_reset(config);
+	gpiodglib_line_settings_set_direction(settings,
+					      GPIODGLIB_LINE_DIRECTION_OUTPUT);
+	ret = gpiodglib_line_config_add_line_settings(config, offsets,
+						      settings, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	if (g_test_failed())
+		return NULL;
+
+	ret = gpiodglib_line_request_reconfigure_lines(request, config, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	if (g_test_failed())
+		return NULL;
+
+	g_usleep(1000);
+
+	gpiodglib_line_request_release(request);
+
+	return NULL;
+}
+
+static void basic_on_info_event(GpiodglibChip *chip G_GNUC_UNUSED,
+			  GpiodglibInfoEvent *event, gpointer data)
+{
+	EventContext *ctx = data;
+
+	g_ptr_array_add(ctx->events, g_object_ref(event));
+	ctx->done++;
+}
+
+static gboolean on_timeout(gpointer data)
+{
+	gboolean *failed = data;
+
+	g_test_fail_printf("wait for info event timed out");
+	*failed = TRUE;
+
+	return G_SOURCE_CONTINUE;
+}
+
+GPIOD_TEST_CASE(request_reconfigure_release_events)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	g_autoptr(GPtrArray) events = NULL;
+	g_autoptr(GThread) thread = NULL;
+	const gchar *chip_path = g_gpiosim_chip_get_dev_path(sim);
+	GpiodglibInfoEvent *req_ev, *reconf_ev, *rel_ev;
+	guint64 req_ts, reconf_ts, rel_ts;
+	EventContext ev_ctx;
+	RequestContext req_ctx;
+	guint timeout_id;
+
+	events = g_ptr_array_new_full(3, g_object_unref);
+
+	chip = gpiodglib_test_new_chip_or_fail(chip_path);
+	g_signal_connect(chip, "info-event", G_CALLBACK(basic_on_info_event),
+			 &ev_ctx);
+	timeout_id = g_timeout_add_seconds(5, on_timeout, &ev_ctx.failed);
+
+	info = gpiodglib_test_chip_watch_line_info_or_fail(chip, 3);
+
+	g_assert_false(gpiodglib_line_info_is_used(info));
+
+	req_ctx.chip_path = chip_path;
+	req_ctx.offset = 3;
+
+	thread = g_thread_new("request-reconfigure-release",
+			      request_reconfigure_release_line, &req_ctx);
+	g_thread_ref(thread);
+
+	ev_ctx.done = 0;
+	ev_ctx.failed = FALSE;
+	ev_ctx.events = events;
+
+	while (ev_ctx.done != 3 && !ev_ctx.failed)
+		g_main_context_iteration(NULL, TRUE);
+
+	g_source_remove(timeout_id);
+	g_thread_join(thread);
+
+	req_ev = g_ptr_array_index(events, 0);
+	reconf_ev = g_ptr_array_index(events, 1);
+	rel_ev = g_ptr_array_index(events, 2);
+
+	g_assert_cmpint(gpiodglib_info_event_get_event_type(req_ev), ==,
+			GPIODGLIB_INFO_EVENT_LINE_REQUESTED);
+	g_assert_cmpint(gpiodglib_info_event_get_event_type(reconf_ev), ==,
+			GPIODGLIB_INFO_EVENT_LINE_CONFIG_CHANGED);
+	g_assert_cmpint(gpiodglib_info_event_get_event_type(rel_ev), ==,
+			GPIODGLIB_INFO_EVENT_LINE_RELEASED);
+
+	req_ts = gpiodglib_info_event_get_timestamp_ns(req_ev);
+	reconf_ts = gpiodglib_info_event_get_timestamp_ns(reconf_ev);
+	rel_ts = gpiodglib_info_event_get_timestamp_ns(rel_ev);
+
+	g_assert_cmpuint(req_ts, <, reconf_ts);
+	g_assert_cmpuint(reconf_ts, <, rel_ts);
+}
+
+static void unwatch_on_info_event(GpiodglibChip *chip G_GNUC_UNUSED,
+				  GpiodglibInfoEvent *event G_GNUC_UNUSED,
+				  gpointer data)
+{
+	gboolean *got_event = data;
+
+	*got_event = TRUE;
+}
+
+GPIOD_TEST_CASE(unwatch_and_check_that_no_events_are_generated)
+{
+	static const guint offset = 3;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	gboolean got_event = FALSE;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+	g_signal_connect(chip, "info-event", G_CALLBACK(unwatch_on_info_event),
+			 &got_event);
+
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+	config = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(config, offsets,
+							     settings);
+
+	info = gpiodglib_test_chip_watch_line_info_or_fail(chip, offset);
+
+	request = gpiodglib_test_chip_request_lines_or_fail(chip, NULL,
+							    config);
+
+	g_main_context_iteration(NULL, TRUE);
+
+	g_assert_true(got_event);
+
+	gpiodglib_test_chip_unwatch_line_info_or_fail(chip, offset);
+
+	got_event = FALSE;
+	gpiodglib_line_request_release(request);
+
+	g_main_context_iteration(NULL, TRUE);
+
+	g_assert_false(got_event);
+}
+
+static void check_line_info_on_info_event(GpiodglibChip *chip G_GNUC_UNUSED,
+					  GpiodglibInfoEvent *event,
+					  gpointer data)
+{
+	GpiodglibLineInfo **info = data;
+
+	*info = gpiodglib_info_event_get_line_info(event);
+}
+
+GPIOD_TEST_CASE(info_event_contains_new_line_info)
+{
+	static const guint offset = 3;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineInfo) initial_info = NULL;
+	g_autoptr(GpiodglibLineInfo) event_info = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GArray) offsets = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+	g_signal_connect(chip, "info-event",
+			 G_CALLBACK(check_line_info_on_info_event),
+			 &event_info);
+
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+	config = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(config, offsets,
+							     settings);
+
+	initial_info = gpiodglib_test_chip_watch_line_info_or_fail(chip,
+								   offset);
+
+	request = gpiodglib_test_chip_request_lines_or_fail(chip, NULL,
+							    config);
+
+	g_main_context_iteration(NULL, TRUE);
+
+	g_assert_nonnull(event_info);
+}
diff --git a/bindings/glib/tests/tests-line-config.c b/bindings/glib/tests/tests-line-config.c
new file mode 100644
index 0000000..74cd440
--- /dev/null
+++ b/bindings/glib/tests/tests-line-config.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
+
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "glib/line-config"
+
+GPIOD_TEST_CASE(too_many_lines)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+	guint i;
+
+	settings = gpiodglib_line_settings_new(NULL);
+	config = gpiodglib_line_config_new();
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+
+	for (i = 0; i < 65; i++)
+		g_array_append_val(offsets, i);
+
+	ret = gpiodglib_line_config_add_line_settings(config, offsets,
+						      settings, &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_E2BIG);
+}
+
+GPIOD_TEST_CASE(get_line_settings)
+{
+	static const guint offset_vals[] = { 0, 1, 2, 3 };
+
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineSettings) retrieved = NULL;
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GArray) offsets = NULL;
+
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT,
+			"bias", GPIODGLIB_LINE_BIAS_PULL_DOWN,
+			NULL);
+	config = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(offset_vals, 4,
+						  sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(config, offsets,
+							     settings);
+
+	retrieved = gpiodglib_test_line_config_get_line_settings_or_fail(
+								config, 2);
+	g_assert_cmpint(gpiodglib_line_settings_get_direction(retrieved), ==,
+			GPIODGLIB_LINE_DIRECTION_INPUT);
+	g_assert_cmpint(gpiodglib_line_settings_get_bias(retrieved), ==,
+			GPIODGLIB_LINE_BIAS_PULL_DOWN);
+}
+
+GPIOD_TEST_CASE(null_settings)
+{
+	static const guint offset_vals[] = { 0, 1, 2, 3 };
+
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GArray) offsets = NULL;
+
+	config = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(offset_vals, 4,
+						  sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(config, offsets,
+							     NULL);
+
+	settings = gpiodglib_test_line_config_get_line_settings_or_fail(config,
+									2);
+
+	g_assert_cmpint(gpiodglib_line_settings_get_drive(settings), ==,
+			GPIODGLIB_LINE_DIRECTION_AS_IS);
+}
+
+GPIOD_TEST_CASE(null_offsets)
+{
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	settings = gpiodglib_line_settings_new(NULL);
+	config = gpiodglib_line_config_new();
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+
+	ret = gpiodglib_line_config_add_line_settings(config, NULL, settings,
+						      &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(zero_offsets)
+{
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	settings = gpiodglib_line_settings_new(NULL);
+	config = gpiodglib_line_config_new();
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+
+	ret = gpiodglib_line_config_add_line_settings(config, offsets, settings,
+						      &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(set_global_output_values)
+{
+	static const guint offset_vals[] = { 0, 1, 2, 3 };
+	static const GpiodglibLineValue output_values[] = {
+		GPIODGLIB_LINE_VALUE_ACTIVE,
+		GPIODGLIB_LINE_VALUE_INACTIVE,
+		GPIODGLIB_LINE_VALUE_ACTIVE,
+		GPIODGLIB_LINE_VALUE_INACTIVE,
+	};
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+	settings = gpiodglib_line_settings_new("direction",
+					       GPIODGLIB_LINE_DIRECTION_OUTPUT,
+					       NULL);
+	config = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(offset_vals, 4,
+						  sizeof(guint));
+	values = gpiodglib_test_array_from_const(output_values, 4,
+						 sizeof(GpiodglibLineValue));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(config, offsets,
+							     settings);
+	gpiodglib_test_line_config_set_output_values_or_fail(config, values);
+
+	request = gpiodglib_test_chip_request_lines_or_fail(chip, NULL,
+							    config);
+
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 0), ==,
+			G_GPIOSIM_VALUE_ACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 1), ==,
+			G_GPIOSIM_VALUE_INACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 2), ==,
+			G_GPIOSIM_VALUE_ACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 3), ==,
+			G_GPIOSIM_VALUE_INACTIVE);
+}
+
+GPIOD_TEST_CASE(handle_duplicate_offsets)
+{
+	static const guint offset_vals[] = { 0, 2, 2, 3 };
+
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) retrieved = NULL;
+
+	config = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(offset_vals, 4,
+						  sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(config, offsets,
+							     NULL);
+
+	retrieved = gpiodglib_line_config_get_configured_offsets(config);
+	g_assert_cmpuint(retrieved->len, ==, 3);
+	g_assert_cmpuint(g_array_index(retrieved, guint, 0), ==, 0);
+	g_assert_cmpuint(g_array_index(retrieved, guint, 1), ==, 2);
+	g_assert_cmpuint(g_array_index(retrieved, guint, 2), ==, 3);
+}
diff --git a/bindings/glib/tests/tests-line-info.c b/bindings/glib/tests/tests-line-info.c
new file mode 100644
index 0000000..6ab3ab4
--- /dev/null
+++ b/bindings/glib/tests/tests-line-info.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
+
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "glib/line-info"
+
+GPIOD_TEST_CASE(get_line_info_good)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiodglib_test_chip_get_line_info_or_fail(chip, 3);
+
+	g_assert_cmpuint(gpiodglib_line_info_get_offset(info), ==, 3);
+}
+
+GPIOD_TEST_CASE(get_line_info_offset_out_of_range)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiodglib_chip_get_line_info(chip, 8, &err);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(line_info_basic_properties)
+{
+	static const GPIOSimLineName names[] = {
+		{ .offset = 1, .name = "foo", },
+		{ .offset = 2, .name = "bar", },
+		{ .offset = 4, .name = "baz", },
+		{ .offset = 5, .name = "xyz", },
+		{ }
+	};
+
+	static const GPIOSimHog hogs[] = {
+		{
+			.offset = 3,
+			.name = "hog3",
+			.direction = G_GPIOSIM_DIRECTION_OUTPUT_HIGH,
+		},
+		{
+			.offset = 4,
+			.name = "hog4",
+			.direction = G_GPIOSIM_DIRECTION_OUTPUT_LOW,
+		},
+		{ }
+	};
+
+	g_autoptr(GVariant) vnames = g_gpiosim_package_line_names(names);
+	g_autoptr(GVariant) vhogs = g_gpiosim_package_hogs(hogs);
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8,
+							"line-names", vnames,
+							"hogs", vhogs,
+							NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineInfo) info4 = NULL;
+	g_autoptr(GpiodglibLineInfo) info6 = NULL;
+	g_autofree gchar *consumer = NULL;
+	g_autofree gchar *name = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+				g_gpiosim_chip_get_dev_path(sim));
+	info4 = gpiodglib_test_chip_get_line_info_or_fail(chip, 4);
+	info6 = gpiodglib_test_chip_get_line_info_or_fail(chip, 6);
+
+	g_assert_cmpuint(gpiodglib_line_info_get_offset(info4), ==, 4);
+	name = gpiodglib_line_info_dup_name(info4);
+	g_assert_cmpstr(name, ==, "baz");
+	consumer = gpiodglib_line_info_dup_consumer(info4);
+	g_assert_cmpstr(consumer, ==, "hog4");
+	g_assert_true(gpiodglib_line_info_is_used(info4));
+	g_assert_cmpint(gpiodglib_line_info_get_direction(info4), ==,
+			GPIODGLIB_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiodglib_line_info_get_edge_detection(info4), ==,
+			GPIODGLIB_LINE_EDGE_NONE);
+	g_assert_false(gpiodglib_line_info_is_active_low(info4));
+	g_assert_cmpint(gpiodglib_line_info_get_bias(info4), ==,
+			GPIODGLIB_LINE_BIAS_UNKNOWN);
+	g_assert_cmpint(gpiodglib_line_info_get_drive(info4), ==,
+			GPIODGLIB_LINE_DRIVE_PUSH_PULL);
+	g_assert_cmpint(gpiodglib_line_info_get_event_clock(info4), ==,
+			GPIODGLIB_LINE_CLOCK_MONOTONIC);
+	g_assert_false(gpiodglib_line_info_is_debounced(info4));
+	g_assert_cmpuint(gpiodglib_line_info_get_debounce_period_us(info4), ==,
+			 0);
+}
diff --git a/bindings/glib/tests/tests-line-request.c b/bindings/glib/tests/tests-line-request.c
new file mode 100644
index 0000000..5866282
--- /dev/null
+++ b/bindings/glib/tests/tests-line-request.c
@@ -0,0 +1,710 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+#include <gpiosim-glib.h>
+
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "glib/line-request"
+
+GPIOD_TEST_CASE(request_fails_with_no_offsets)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GError) err = NULL;
+
+	line_cfg = gpiodglib_line_config_new();
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	request = gpiodglib_chip_request_lines(chip, NULL, line_cfg, &err);
+	g_assert_null(request);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(request_fails_with_no_line_config)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	request = gpiodglib_chip_request_lines(chip, NULL, NULL, &err);
+	g_assert_null(request);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(set_consumer)
+{
+	static const gchar *const consumer = "foobar";
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibRequestConfig) req_cfg = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	g_autofree gchar *cpy = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	req_cfg = gpiodglib_request_config_new("consumer", consumer, NULL);
+	line_cfg = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+
+	request = gpiodglib_test_chip_request_lines_or_fail(chip, req_cfg,
+							    line_cfg);
+
+	info = gpiodglib_test_chip_get_line_info_or_fail(chip, offset);
+	cpy = gpiodglib_line_info_dup_consumer(info);
+	g_assert_cmpstr(cpy, ==, consumer);
+}
+
+GPIOD_TEST_CASE(empty_consumer)
+{
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	g_autofree gchar *consumer = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	line_cfg = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+
+	request = gpiodglib_test_chip_request_lines_or_fail(chip, NULL,
+							    line_cfg);
+
+	info = gpiodglib_test_chip_get_line_info_or_fail(chip, offset);
+	consumer = gpiodglib_line_info_dup_consumer(info);
+	g_assert_cmpstr(consumer, ==, "?");
+}
+
+GPIOD_TEST_CASE(get_requested_offsets)
+{
+	static const guint offset_vals[] = { 2, 1, 6, 4 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) retrieved = NULL;
+
+	line_cfg = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(offset_vals, 4,
+						  sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	retrieved = gpiodglib_line_request_get_requested_offsets(request);
+	g_assert_cmpuint(retrieved->len, ==, 4);
+	g_assert_cmpuint(g_array_index(retrieved, guint, 0), ==, 2);
+	g_assert_cmpuint(g_array_index(retrieved, guint, 1), ==, 1);
+	g_assert_cmpuint(g_array_index(retrieved, guint, 2), ==, 6);
+	g_assert_cmpuint(g_array_index(retrieved, guint, 3), ==, 4);
+}
+
+GPIOD_TEST_CASE(released_request_cannot_be_used_reconfigure)
+{
+	static const guint offset = 3;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	gpiodglib_line_request_release(request);
+
+	ret = gpiodglib_line_request_reconfigure_lines(request, line_cfg, &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_REQUEST_RELEASED);
+}
+
+GPIOD_TEST_CASE(released_request_cannot_be_used_get_value)
+{
+	static const guint offset = 3;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	GpiodglibLineValue value;
+	gboolean ret;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT, NULL);
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	gpiodglib_line_request_release(request);
+
+	ret = gpiodglib_line_request_get_value(request, offset, &value, &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_REQUEST_RELEASED);
+
+	g_clear_pointer(&err, g_error_free);
+
+	ret = gpiodglib_line_request_get_values(request, &values, &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_REQUEST_RELEASED);
+}
+
+GPIOD_TEST_CASE(released_request_cannot_be_used_set_value)
+{
+	static const guint offset = 3;
+	static const GpiodglibLineValue value = GPIODGLIB_LINE_VALUE_ACTIVE;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_OUTPUT, NULL);
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	gpiodglib_line_request_release(request);
+
+	ret = gpiodglib_line_request_set_value(request, offset, value, &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_REQUEST_RELEASED);
+
+	g_clear_pointer(&err, g_error_free);
+
+	values = gpiodglib_test_array_from_const(&value, 1, sizeof(value));
+	ret = gpiodglib_line_request_set_values(request, values, &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_REQUEST_RELEASED);
+}
+
+GPIOD_TEST_CASE(reconfigure_lines)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	guint offset_vals[2];
+	gboolean ret;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_OUTPUT,
+			"output-value", GPIODGLIB_LINE_VALUE_ACTIVE,
+			NULL);
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	offset_vals[0] = 0;
+	offset_vals[1] = 2;
+	g_array_append_vals(offsets, offset_vals, 2);
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+	g_free(g_array_steal(offsets, NULL));
+
+	gpiodglib_line_settings_set_output_value(settings,
+						 GPIODGLIB_LINE_VALUE_INACTIVE);
+	offset_vals[0] = 1;
+	offset_vals[1] = 3;
+	g_array_append_vals(offsets, offset_vals, 2);
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+	g_free(g_array_steal(offsets, NULL));
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 0), ==,
+			G_GPIOSIM_VALUE_ACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 1), ==,
+			G_GPIOSIM_VALUE_INACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 2), ==,
+			G_GPIOSIM_VALUE_ACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 3), ==,
+			G_GPIOSIM_VALUE_INACTIVE);
+
+	gpiodglib_line_config_reset(line_cfg);
+
+	gpiodglib_line_settings_set_output_value(settings,
+						 GPIODGLIB_LINE_VALUE_INACTIVE);
+	offset_vals[0] = 0;
+	offset_vals[1] = 2;
+	g_array_append_vals(offsets, offset_vals, 2);
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+	g_free(g_array_steal(offsets, NULL));
+
+	gpiodglib_line_settings_set_output_value(settings,
+						 GPIODGLIB_LINE_VALUE_ACTIVE);
+	offset_vals[0] = 1;
+	offset_vals[1] = 3;
+	g_array_append_vals(offsets, offset_vals, 2);
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+
+	ret = gpiodglib_line_request_reconfigure_lines(request, line_cfg, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 0), ==,
+			G_GPIOSIM_VALUE_INACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 1), ==,
+			G_GPIOSIM_VALUE_ACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 2), ==,
+			G_GPIOSIM_VALUE_INACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 3), ==,
+			G_GPIOSIM_VALUE_ACTIVE);
+}
+
+GPIOD_TEST_CASE(reconfigure_fails_without_config)
+{
+	static const guint offset = 3;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	ret = gpiodglib_line_request_reconfigure_lines(request, NULL, &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(reconfigure_with_different_offsets)
+{
+	static const guint offsets0[] = { 0, 1, 2, 3 };
+	static const guint offsets1[] = { 2, 4, 5 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(offsets0, 4, sizeof(guint));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+	g_free(g_array_steal(offsets, NULL));
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	gpiodglib_line_config_reset(line_cfg);
+
+	g_array_append_vals(offsets, offsets1, 3);
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+
+	ret = gpiodglib_line_request_reconfigure_lines(request, line_cfg, &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(read_one_value)
+{
+	static const guint offset_vals[] = { 0, 2, 4 };
+	static const gint pulls[] = { 0, 1, 0 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	GpiodglibLineValue value;
+	gboolean ret;
+	guint i;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT, NULL);
+	offsets = gpiodglib_test_array_from_const(offset_vals, 3,
+						  sizeof(guint));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	for (i = 0; i < 3; i++)
+		g_gpiosim_chip_set_pull(sim, offset_vals[i],
+					pulls[i] ? G_GPIOSIM_PULL_UP :
+						   G_GPIOSIM_PULL_DOWN);
+
+	ret = gpiodglib_line_request_get_value(request, 2, &value, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	gpiod_test_return_if_failed();
+	g_assert_cmpint(value, ==, GPIODGLIB_LINE_VALUE_ACTIVE);
+}
+
+GPIOD_TEST_CASE(read_all_values_null_array)
+{
+	static const guint offset_vals[] = { 0, 2, 4, 5, 7 };
+	static const gint pulls[] = { 0, 1, 0, 1, 1 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+	guint i;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT, NULL);
+	offsets = gpiodglib_test_array_from_const(offset_vals, 5,
+						  sizeof(guint));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	for (i = 0; i < 5; i++)
+		g_gpiosim_chip_set_pull(sim, offset_vals[i],
+					pulls[i] ? G_GPIOSIM_PULL_UP :
+						   G_GPIOSIM_PULL_DOWN);
+
+	ret = gpiodglib_line_request_get_values(request, &values, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpuint(values->len, ==, 5);
+
+	for (i = 0; i < 5; i++)
+		g_assert_cmpint(g_array_index(values, GpiodglibLineValue, i), ==,
+				pulls[i]);
+}
+
+GPIOD_TEST_CASE(read_all_values_preallocated_array)
+{
+	static const guint offset_vals[] = { 0, 2, 4, 5, 7 };
+	static const gint pulls[] = { 0, 1, 0, 1, 1 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+	guint i;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT, NULL);
+	offsets = gpiodglib_test_array_from_const(offset_vals, 5,
+						  sizeof(guint));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	for (i = 0; i < 5; i++)
+		g_gpiosim_chip_set_pull(sim, offset_vals[i],
+					pulls[i] ? G_GPIOSIM_PULL_UP :
+						   G_GPIOSIM_PULL_DOWN);
+
+	values = g_array_new(FALSE, TRUE, sizeof(GpiodglibLineValue));
+	g_array_set_size(values, 5);
+
+	ret = gpiodglib_line_request_get_values(request, &values, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpuint(values->len, ==, 5);
+
+	for (i = 0; i < 5; i++)
+		g_assert_cmpint(g_array_index(values, GpiodglibLineValue, i),
+				==, pulls[i]);
+}
+
+GPIOD_TEST_CASE(set_one_value)
+{
+	static const guint offset = 4;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_OUTPUT,
+			"output-value", GPIODGLIB_LINE_VALUE_INACTIVE,
+			NULL);
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	g_assert_cmpuint(g_gpiosim_chip_get_value(sim, offset), ==,
+			G_GPIOSIM_VALUE_INACTIVE);
+
+	ret = gpiodglib_line_request_set_value(request, 4,
+					       GPIODGLIB_LINE_VALUE_ACTIVE,
+					       &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+
+	g_assert_cmpuint(g_gpiosim_chip_get_value(sim, offset), ==,
+			 G_GPIOSIM_VALUE_ACTIVE);
+}
+
+GPIOD_TEST_CASE(set_all_values)
+{
+	static const guint offset_vals[] = { 0, 2, 4, 5, 6 };
+	static const GpiodglibLineValue value_vals[] = {
+		GPIODGLIB_LINE_VALUE_ACTIVE,
+		GPIODGLIB_LINE_VALUE_INACTIVE,
+		GPIODGLIB_LINE_VALUE_ACTIVE,
+		GPIODGLIB_LINE_VALUE_ACTIVE,
+		GPIODGLIB_LINE_VALUE_ACTIVE
+	};
+	static const GPIOSimValue sim_values[] = {
+		G_GPIOSIM_VALUE_ACTIVE,
+		G_GPIOSIM_VALUE_INACTIVE,
+		G_GPIOSIM_VALUE_ACTIVE,
+		G_GPIOSIM_VALUE_ACTIVE,
+		G_GPIOSIM_VALUE_ACTIVE
+	};
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+	guint i;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_OUTPUT, NULL);
+	offsets = gpiodglib_test_array_from_const(offset_vals, 5, sizeof(guint));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	values = gpiodglib_test_array_from_const(value_vals, 5,
+						 sizeof(GpiodglibLineValue));
+
+	ret = gpiodglib_line_request_set_values(request, values, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	gpiod_test_return_if_failed();
+
+	for (i = 0; i < 5; i++)
+		g_assert_cmpint(g_gpiosim_chip_get_value(sim, offset_vals[i]),
+				==, sim_values[i]);
+}
+
+GPIOD_TEST_CASE(get_values_invalid_arguments)
+{
+	static const guint offset = 3;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT, NULL);
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(offset));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	ret = gpiodglib_line_request_get_values_subset(request, offsets, NULL,
+						       &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+
+	g_clear_pointer(&err, g_error_free);
+
+	ret = gpiodglib_line_request_get_values_subset(request, NULL, &values,
+						       &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(set_values_invalid_arguments)
+{
+	static const guint offset = 3;
+	static const GpiodglibLineValue value_vals[] = {
+		GPIODGLIB_LINE_VALUE_ACTIVE,
+		GPIODGLIB_LINE_VALUE_INACTIVE,
+	};
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GArray) vals_inval = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_OUTPUT, NULL);
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(offset));
+	values = gpiodglib_test_array_from_const(value_vals, 1,
+						 sizeof(GpiodglibLineValue));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	ret = gpiodglib_line_request_set_values_subset(request, offsets, NULL,
+						       &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+
+	g_clear_pointer(&err, g_error_free);
+
+	ret = gpiodglib_line_request_set_values_subset(request, NULL, values,
+						       &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+
+	g_clear_pointer(&err, g_error_free);
+
+	vals_inval = gpiodglib_test_array_from_const(value_vals, 2,
+						sizeof(GpiodglibLineValue));
+
+	ret = gpiodglib_line_request_set_values_subset(request, offsets,
+						       vals_inval, &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(get_chip_name)
+{
+	static const guint offset = 4;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autofree gchar *name = NULL;
+
+	line_cfg = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	name = gpiodglib_line_request_dup_chip_name(request);
+	g_assert_cmpstr(g_gpiosim_chip_get_name(sim), ==, name);
+}
diff --git a/bindings/glib/tests/tests-line-settings.c b/bindings/glib/tests/tests-line-settings.c
new file mode 100644
index 0000000..35d2a8d
--- /dev/null
+++ b/bindings/glib/tests/tests-line-settings.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "glib/line-settings"
+
+GPIOD_TEST_CASE(default_config)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	g_assert_cmpint(gpiodglib_line_settings_get_direction(settings), ==,
+			GPIODGLIB_LINE_DIRECTION_AS_IS);
+	g_assert_cmpint(gpiodglib_line_settings_get_edge_detection(settings),
+			==, GPIODGLIB_LINE_EDGE_NONE);
+	g_assert_cmpint(gpiodglib_line_settings_get_bias(settings), ==,
+			GPIODGLIB_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiodglib_line_settings_get_drive(settings), ==,
+			GPIODGLIB_LINE_DRIVE_PUSH_PULL);
+	g_assert_false(gpiodglib_line_settings_get_active_low(settings));
+	g_assert_cmpint(
+		gpiodglib_line_settings_get_debounce_period_us(settings),
+		==, 0);
+	g_assert_cmpint(gpiodglib_line_settings_get_event_clock(settings), ==,
+			GPIODGLIB_LINE_CLOCK_MONOTONIC);
+	g_assert_cmpint(gpiodglib_line_settings_get_output_value(settings), ==,
+			GPIODGLIB_LINE_VALUE_INACTIVE);
+}
+
+GPIOD_TEST_CASE(set_direction)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_line_settings_set_direction(settings,
+					      GPIODGLIB_LINE_DIRECTION_INPUT);
+	g_assert_cmpint(gpiodglib_line_settings_get_direction(settings), ==,
+			GPIODGLIB_LINE_DIRECTION_INPUT);
+
+	gpiodglib_line_settings_set_direction(settings,
+					      GPIODGLIB_LINE_DIRECTION_AS_IS);
+	g_assert_cmpint(gpiodglib_line_settings_get_direction(settings), ==,
+			GPIODGLIB_LINE_DIRECTION_AS_IS);
+
+	gpiodglib_line_settings_set_direction(settings,
+					      GPIODGLIB_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiodglib_line_settings_get_direction(settings), ==,
+			GPIODGLIB_LINE_DIRECTION_OUTPUT);
+}
+
+GPIOD_TEST_CASE(set_edge_detection)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_line_settings_set_edge_detection(settings,
+						   GPIODGLIB_LINE_EDGE_BOTH);
+	g_assert_cmpint(gpiodglib_line_settings_get_edge_detection(settings),
+			==, GPIODGLIB_LINE_EDGE_BOTH);
+
+	gpiodglib_line_settings_set_edge_detection(settings,
+						   GPIODGLIB_LINE_EDGE_NONE);
+	g_assert_cmpint(gpiodglib_line_settings_get_edge_detection(settings),
+			==, GPIODGLIB_LINE_EDGE_NONE);
+
+	gpiodglib_line_settings_set_edge_detection(settings,
+						   GPIODGLIB_LINE_EDGE_FALLING);
+	g_assert_cmpint(gpiodglib_line_settings_get_edge_detection(settings),
+			==, GPIODGLIB_LINE_EDGE_FALLING);
+
+	gpiodglib_line_settings_set_edge_detection(settings,
+						   GPIODGLIB_LINE_EDGE_RISING);
+	g_assert_cmpint(gpiodglib_line_settings_get_edge_detection(settings),
+			==, GPIODGLIB_LINE_EDGE_RISING);
+}
+
+GPIOD_TEST_CASE(set_bias)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_line_settings_set_bias(settings,
+					 GPIODGLIB_LINE_BIAS_DISABLED);
+	g_assert_cmpint(gpiodglib_line_settings_get_bias(settings), ==,
+			GPIODGLIB_LINE_BIAS_DISABLED);
+
+	gpiodglib_line_settings_set_bias(settings, GPIODGLIB_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiodglib_line_settings_get_bias(settings), ==,
+			GPIODGLIB_LINE_BIAS_AS_IS);
+
+	gpiodglib_line_settings_set_bias(settings,
+					 GPIODGLIB_LINE_BIAS_PULL_DOWN);
+	g_assert_cmpint(gpiodglib_line_settings_get_bias(settings), ==,
+			GPIODGLIB_LINE_BIAS_PULL_DOWN);
+
+	gpiodglib_line_settings_set_bias(settings, GPIODGLIB_LINE_BIAS_PULL_UP);
+	g_assert_cmpint(gpiodglib_line_settings_get_bias(settings), ==,
+			GPIODGLIB_LINE_BIAS_PULL_UP);
+}
+
+GPIOD_TEST_CASE(set_drive)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_line_settings_set_drive(settings,
+					  GPIODGLIB_LINE_DRIVE_OPEN_DRAIN);
+	g_assert_cmpint(gpiodglib_line_settings_get_drive(settings), ==,
+			GPIODGLIB_LINE_DRIVE_OPEN_DRAIN);
+
+	gpiodglib_line_settings_set_drive(settings,
+					  GPIODGLIB_LINE_DRIVE_PUSH_PULL);
+	g_assert_cmpint(gpiodglib_line_settings_get_drive(settings), ==,
+			GPIODGLIB_LINE_DRIVE_PUSH_PULL);
+
+	gpiodglib_line_settings_set_drive(settings,
+					  GPIODGLIB_LINE_DRIVE_OPEN_SOURCE);
+	g_assert_cmpint(gpiodglib_line_settings_get_drive(settings), ==,
+			GPIODGLIB_LINE_DRIVE_OPEN_SOURCE);
+}
+
+GPIOD_TEST_CASE(set_active_low)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_line_settings_set_active_low(settings, TRUE);
+	g_assert_true(gpiodglib_line_settings_get_active_low(settings));
+
+	gpiodglib_line_settings_set_active_low(settings, FALSE);
+	g_assert_false(gpiodglib_line_settings_get_active_low(settings));
+}
+
+GPIOD_TEST_CASE(set_debounce_period)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_line_settings_set_debounce_period_us(settings, 4000);
+	g_assert_cmpint(gpiodglib_line_settings_get_debounce_period_us(settings),
+			==, 4000);
+}
+
+GPIOD_TEST_CASE(set_event_clock)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_line_settings_set_event_clock(settings,
+						GPIODGLIB_LINE_CLOCK_MONOTONIC);
+	g_assert_cmpint(gpiodglib_line_settings_get_event_clock(settings), ==,
+			GPIODGLIB_LINE_CLOCK_MONOTONIC);
+
+	gpiodglib_line_settings_set_event_clock(settings,
+						GPIODGLIB_LINE_CLOCK_REALTIME);
+	g_assert_cmpint(gpiodglib_line_settings_get_event_clock(settings), ==,
+			GPIODGLIB_LINE_CLOCK_REALTIME);
+
+	gpiodglib_line_settings_set_event_clock(settings,
+						GPIODGLIB_LINE_CLOCK_HTE);
+	g_assert_cmpint(gpiodglib_line_settings_get_event_clock(settings), ==,
+			GPIODGLIB_LINE_CLOCK_HTE);
+}
+
+GPIOD_TEST_CASE(set_output_value)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_line_settings_set_output_value(settings,
+						 GPIODGLIB_LINE_VALUE_ACTIVE);
+	g_assert_cmpint(gpiodglib_line_settings_get_output_value(settings), ==,
+			GPIODGLIB_LINE_VALUE_ACTIVE);
+
+	gpiodglib_line_settings_set_output_value(settings,
+						 GPIODGLIB_LINE_VALUE_INACTIVE);
+	g_assert_cmpint(gpiodglib_line_settings_get_output_value(settings), ==,
+			GPIODGLIB_LINE_VALUE_INACTIVE);
+}
+
+GPIOD_TEST_CASE(reset_settings)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_line_settings_set_direction(settings,
+					      GPIODGLIB_LINE_DIRECTION_INPUT);
+	gpiodglib_line_settings_set_edge_detection(settings,
+						   GPIODGLIB_LINE_EDGE_BOTH);
+	gpiodglib_line_settings_set_debounce_period_us(settings, 2000);
+	gpiodglib_line_settings_set_event_clock(settings,
+						GPIODGLIB_LINE_CLOCK_REALTIME);
+
+	gpiodglib_line_settings_reset(settings);
+
+	g_assert_cmpint(gpiodglib_line_settings_get_direction(settings), ==,
+			GPIODGLIB_LINE_DIRECTION_AS_IS);
+	g_assert_cmpint(gpiodglib_line_settings_get_edge_detection(settings),
+			==, GPIODGLIB_LINE_EDGE_NONE);
+	g_assert_cmpint(gpiodglib_line_settings_get_bias(settings), ==,
+			GPIODGLIB_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiodglib_line_settings_get_drive(settings), ==,
+			GPIODGLIB_LINE_DRIVE_PUSH_PULL);
+	g_assert_false(gpiodglib_line_settings_get_active_low(settings));
+	g_assert_cmpint(
+		gpiodglib_line_settings_get_debounce_period_us(settings),
+		==, 0);
+	g_assert_cmpint(gpiodglib_line_settings_get_event_clock(settings), ==,
+			GPIODGLIB_LINE_CLOCK_MONOTONIC);
+	g_assert_cmpint(gpiodglib_line_settings_get_output_value(settings), ==,
+			GPIODGLIB_LINE_VALUE_INACTIVE);
+}
+
+GPIOD_TEST_CASE(set_props_in_constructor)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT,
+			"edge-detection", GPIODGLIB_LINE_EDGE_BOTH,
+			"active-low", TRUE,
+			"debounce-period-us", (GTimeSpan)3000,
+			"bias", GPIODGLIB_LINE_BIAS_PULL_UP,
+			"event-clock", GPIODGLIB_LINE_CLOCK_REALTIME,
+			NULL);
+
+	g_assert_cmpint(gpiodglib_line_settings_get_direction(settings), ==,
+			GPIODGLIB_LINE_DIRECTION_INPUT);
+	g_assert_cmpint(gpiodglib_line_settings_get_edge_detection(settings), ==,
+			GPIODGLIB_LINE_EDGE_BOTH);
+	g_assert_cmpint(gpiodglib_line_settings_get_bias(settings), ==,
+			GPIODGLIB_LINE_BIAS_PULL_UP);
+	g_assert_cmpint(gpiodglib_line_settings_get_drive(settings), ==,
+			GPIODGLIB_LINE_DRIVE_PUSH_PULL);
+	g_assert_true(gpiodglib_line_settings_get_active_low(settings));
+	g_assert_cmpint(gpiodglib_line_settings_get_debounce_period_us(settings),
+			==, 3000);
+	g_assert_cmpint(gpiodglib_line_settings_get_event_clock(settings), ==,
+			GPIODGLIB_LINE_CLOCK_REALTIME);
+	g_assert_cmpint(gpiodglib_line_settings_get_output_value(settings), ==,
+			GPIODGLIB_LINE_VALUE_INACTIVE);
+}
diff --git a/bindings/glib/tests/tests-misc.c b/bindings/glib/tests/tests-misc.c
new file mode 100644
index 0000000..a19a20e
--- /dev/null
+++ b/bindings/glib/tests/tests-misc.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
+
+#define GPIOD_TEST_GROUP "glib/misc"
+
+GPIOD_TEST_CASE(is_gpiochip_bad)
+{
+	g_assert_false(gpiodglib_is_gpiochip_device("/dev/null"));
+	g_assert_false(gpiodglib_is_gpiochip_device("/dev/nonexistent"));
+}
+
+GPIOD_TEST_CASE(is_gpiochip_good)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+
+	g_assert_true(gpiodglib_is_gpiochip_device(
+			g_gpiosim_chip_get_dev_path(sim)));
+}
+
+GPIOD_TEST_CASE(is_gpiochip_link_bad)
+{
+	g_autofree gchar *link = NULL;
+	gint ret;
+
+	link = g_strdup_printf("/tmp/gpiod-test-link.%u", getpid());
+	ret = symlink("/dev/null", link);
+	g_assert_cmpint(ret, ==, 0);
+	gpiod_test_return_if_failed();
+
+	g_assert_false(gpiodglib_is_gpiochip_device(link));
+	ret = unlink(link);
+	g_assert_cmpint(ret, ==, 0);
+}
+
+GPIOD_TEST_CASE(is_gpiochip_link_good)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autofree gchar *link = NULL;
+	gint ret;
+
+	link = g_strdup_printf("/tmp/gpiod-test-link.%u", getpid());
+	ret = symlink(g_gpiosim_chip_get_dev_path(sim), link);
+	g_assert_cmpint(ret, ==, 0);
+	gpiod_test_return_if_failed();
+
+	g_assert_true(gpiodglib_is_gpiochip_device(link));
+	ret = unlink(link);
+	g_assert_cmpint(ret, ==, 0);
+}
+
+GPIOD_TEST_CASE(version_string)
+{
+	static const gchar *const pattern = "^\\d+\\.\\d+(\\.\\d+|\\-devel|\\-rc\\d+)$";
+
+	g_autoptr(GError) err = NULL;
+	g_autoptr(GRegex) regex = NULL;
+	g_autoptr(GMatchInfo) match = NULL;
+	g_autofree gchar *res = NULL;
+	const gchar *ver;
+	gboolean ret;
+
+	ver = gpiodglib_api_version();
+	g_assert_nonnull(ver);
+	gpiod_test_return_if_failed();
+
+	regex = g_regex_new(pattern, 0, 0, &err);
+	g_assert_nonnull(regex);
+	g_assert_no_error(err);
+	gpiod_test_return_if_failed();
+
+	ret = g_regex_match(regex, ver, 0, &match);
+	g_assert_true(ret);
+	gpiod_test_return_if_failed();
+
+	g_assert_true(g_match_info_matches(match));
+	res = g_match_info_fetch(match, 0);
+	g_assert_nonnull(res);
+	g_assert_cmpstr(res, ==, ver);
+	g_match_info_next(match, &err);
+	g_assert_no_error(err);
+	g_assert_false(g_match_info_matches(match));
+}
diff --git a/bindings/glib/tests/tests-request-config.c b/bindings/glib/tests/tests-request-config.c
new file mode 100644
index 0000000..23ebea5
--- /dev/null
+++ b/bindings/glib/tests/tests-request-config.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "glib/request-config"
+
+GPIOD_TEST_CASE(default_config)
+{
+	g_autoptr(GpiodglibRequestConfig) config = NULL;
+	g_autofree gchar *consumer = NULL;
+
+	config = gpiodglib_request_config_new(NULL);
+	consumer = gpiodglib_request_config_dup_consumer(config);
+
+	g_assert_null(consumer);
+	g_assert_cmpuint(gpiodglib_request_config_get_event_buffer_size(config),
+			 ==, 0);
+}
+
+GPIOD_TEST_CASE(set_consumer)
+{
+	g_autoptr(GpiodglibRequestConfig) config = NULL;
+	g_autofree gchar *consumer = NULL;
+
+	config = gpiodglib_request_config_new(NULL);
+
+	gpiodglib_request_config_set_consumer(config, "foobar");
+	consumer = gpiodglib_request_config_dup_consumer(config);
+	g_assert_cmpstr(consumer, ==, "foobar");
+
+	gpiodglib_request_config_set_consumer(config, NULL);
+	g_free(consumer);
+	consumer = gpiodglib_request_config_dup_consumer(config);
+	g_assert_null(consumer);
+}
+
+GPIOD_TEST_CASE(set_event_buffer_size)
+{
+	g_autoptr(GpiodglibRequestConfig) config = NULL;
+
+	config = gpiodglib_request_config_new(NULL);
+
+	gpiodglib_request_config_set_event_buffer_size(config, 128);
+	g_assert_cmpuint(gpiodglib_request_config_get_event_buffer_size(config),
+			 ==, 128);
+}
+
+GPIOD_TEST_CASE(set_properties_in_constructor)
+{
+	g_autoptr(GpiodglibRequestConfig) config = NULL;
+	g_autofree gchar *consumer = NULL;
+
+	config = gpiodglib_request_config_new("consumer", "foobar",
+					    "event-buffer-size", 64, NULL);
+	consumer = gpiodglib_request_config_dup_consumer(config);
+	g_assert_cmpstr(consumer, ==, "foobar");
+	g_assert_cmpuint(gpiodglib_request_config_get_event_buffer_size(config),
+			 ==, 64);
+}
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


