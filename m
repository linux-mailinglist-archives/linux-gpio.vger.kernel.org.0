Return-Path: <linux-gpio+bounces-8714-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C3A94E868
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 10:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34814B20978
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 08:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABC416726E;
	Mon, 12 Aug 2024 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1IDWJJsd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0971509BF
	for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2024 08:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723450961; cv=none; b=VCSMGqjZBjMStwQfdTXyoi18Dy0nTUr2U1X6vtQftSNAMNXmjdCvd8SLodTTKYG24lLefJcWQOrZHTygVykjF1QuUIvIHQjMKwsv4eynnKj8Bh7Wo6nisTl6HZXzlBuvN4GdCd1zoCuCF4PGBYM04ZDewRUn0WM1xpoYM6HnWUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723450961; c=relaxed/simple;
	bh=MSozu9z5WN0+sALAmnVaDjERWL6k0HXNzEEoXj0vn2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Taq1CVpftPsm3f/iYZokFQw2jCG66aS/bOY3bE+sB4VeTGF4q5BQJPHdGKKg+nd/495V/qG/yHmiqCk03NbQlu5336AIvRP9wwfyB8XE/wr+ApPTuBPqAaVrc/cZcxgCVGBwMXogIunkZ8xCM4y5T/X3MLXaR49KOqPdWWPo5uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1IDWJJsd; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f1798eaee6so38549421fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2024 01:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723450956; x=1724055756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BirZvIipRdEW7YR8FNm+vf9VSBri/u/DJc7N5uiCqcs=;
        b=1IDWJJsdfujAIWe6qKtV4XLW4Ro8k9aUE5TAtBigZReWYmVzha/7xv4U7qpx6XnD1K
         lNcFhRt3fNxWMPcOMxd0WYoXi++nio20wUBV79jYtPE8dMxGi+Gt4Uo2CaGrngLthjtd
         6D9U+0hLBOfJfRqg3Nu2dqx3EkCRNCSuMuSrRrvb8rNP4R+VXwaxGIbaoldkBcTT3xHC
         HGmGZbmkgoDfUFBDSfGjSoxO0+L0MHr5vZRRSv2xvE3sY85kMAmYxvMUGIFugfALyH2P
         XjUeHrZlTnuztmiEJZDG5Bg8jdFnMRCMvrkTVSTFbIXbvBk+xzcWIOY98ptFP7FoNmRz
         QIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723450956; x=1724055756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BirZvIipRdEW7YR8FNm+vf9VSBri/u/DJc7N5uiCqcs=;
        b=uiU5VfS1FGfGuhlhSanngPgIfKNgLnWW9Yrr5ZYj7tkuuPwNQw3vQoWnzf0VxCjRIC
         SpHc3hHnqgNTIcgZHuWh4Sq6CsAmkYKVGv9T8v5jJEMnpDNHzCemLJCrXkia3Xf11avL
         XyHwbTgENAiSVUNKQZnLDszo82K5vZY9HZQOOw185XvgeR0cM3iwQXXYWiYAEMbO+vzv
         Ay5wU92bs31zuhjP/FhE1psvh7+I2vt/dXZFEsRpW+hxenhQucJtkgHgxogqYgQ6xGDi
         g7quPcBKclQG/bOQp4LubLUJ0biyXWLhNicaly3zsUjz0Ijybq56SaCBYL+3eGro7ojO
         rjxg==
X-Gm-Message-State: AOJu0YxrrDuHJ6Z0QxlifHp1uL1VINdaE9Atw5eW3cKT2NTfEgSwfUFM
	upYWE5ry+j5e3tGlK5H63+TDwElW8STr1LaligRq+GQMmQKm4KeptCG7kVu9/AI=
X-Google-Smtp-Source: AGHT+IH83CNxZI5p+yVa8mT0eWoEmAVSfQdIYo+rV9+XncynFAe3XUG8Rd5fV05HGNlxTZDei/olcw==
X-Received: by 2002:a2e:4612:0:b0:2f1:6821:d163 with SMTP id 38308e7fff4ca-2f1a6cfc91amr53261021fa.21.1723450955176;
        Mon, 12 Aug 2024 01:22:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d7d3:597b:b219:7ba5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c74ff9fsm179059555e9.28.2024.08.12.01.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 01:22:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 12 Aug 2024 10:22:22 +0200
Subject: [PATCH libgpiod v5 1/4] tests: split out reusable test code into a
 local static library
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240812-dbus-v5-1-ead288509217@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18656;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=szXE5TlFuxBsWS+vMeZOwJRtXfQ9fBEF96xW6pIVXxo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmucZINhx+kr/sVNK8gX+LMfFJ1rEGLrgVAr4ih
 hwp8zY8OSWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrnGSAAKCRARpy6gFHHX
 cgvDEADErXRiE/9Ad8xuAkw0tpbve2xGzwk5LQS9Dh32Py1Ig8Hbds1gp4S98xD3s0vGmhQA9Kx
 k0teXp31uUSd1qdTwqP5+Tvtfmsiq3Q5gOIj7VbX5T04Ej2ITo7Yy4tERB7/1sD0b52MAOwQjLj
 /6RSNA07xvgIPD/UPUOhEQVsbnVKbY4T5LUoFhhQeFTYyzu/rZA90kv177ngKCPLG81OT8KOZ6f
 ZqddolzsA/PBKTk31X2wqB6q7C5h4x2M9Ys1WagqySFU7QkfmqTXU2I43+6FyFNyUfANZXjCWdp
 hJtY+Nf1b8E0ly+7XLw9y2LBXv6+MSICDadhuC9wA6wV/p4h1UsYP1w1UD2TS3K6Pk68k8Fx2Uf
 0agmPl8n+WtkH3/gxerTlaUL41TJoQV+znyOxrul7pmiLpeHMrE6HphhbnRUFX4T9VnW4uCBe8A
 gl0k847dbG2wA0rTS4Ft7MoHAVclBSxuy4AlsMmlMr/lt5QNoKnqa4unVrG2DE/SAEBRp4l/H5f
 4KYnzrH1M8fTOVNeDXldjGjRv2gewK0Qa0orUh/Pet9qQVMXCIEBFP8Rfgs1AvyrxqU6jCGo0NV
 iVVTZB/aMG4BbYW/h8FGmOSdiozxaLPKsNFIx0+YjXI1Ldb7DP94+G8+kbCwl41BERwjOQEoLmz
 5BIZU3wJVpI299g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to allow the upcoming GLib and DBus bindings to reuse the test
code, let's put all common elements into reusable libtool objects and
export the relevant symbols in internal headers.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac                                       |  2 ++
 tests/Makefile.am                                  | 14 ++++----
 tests/gpiod-test-helpers.c                         | 41 ----------------------
 tests/gpiosim-glib/Makefile.am                     | 13 +++++++
 .../gpiosim-glib.c}                                | 30 +++++++++++++++-
 .../gpiosim-glib.h}                                | 14 ++++++++
 tests/harness/Makefile.am                          | 12 +++++++
 tests/harness/gpiod-test-common.h                  | 23 ++++++++++++
 tests/{ => harness}/gpiod-test.c                   |  0
 tests/{ => harness}/gpiod-test.h                   |  0
 tests/{gpiod-test-helpers.h => helpers.h}          | 36 ++-----------------
 tests/tests-chip-info.c                            |  7 ++--
 tests/tests-chip.c                                 | 15 ++++----
 tests/tests-edge-event.c                           |  7 ++--
 tests/tests-info-event.c                           |  7 ++--
 tests/tests-kernel-uapi.c                          |  7 ++--
 tests/tests-line-config.c                          |  7 ++--
 tests/tests-line-info.c                            | 11 +++---
 tests/tests-line-request.c                         |  7 ++--
 tests/tests-line-settings.c                        |  5 +--
 tests/tests-misc.c                                 |  7 ++--
 tests/tests-request-config.c                       |  5 +--
 22 files changed, 150 insertions(+), 120 deletions(-)

diff --git a/configure.ac b/configure.ac
index b86eee0..d1f49ac 100644
--- a/configure.ac
+++ b/configure.ac
@@ -275,6 +275,8 @@ AC_CONFIG_FILES([Makefile
 		 tools/Makefile
 		 tests/Makefile
 		 tests/gpiosim/Makefile
+		 tests/gpiosim-glib/Makefile
+		 tests/harness/Makefile
 		 bindings/cxx/libgpiodcxx.pc
 		 bindings/Makefile
 		 bindings/cxx/Makefile
diff --git a/tests/Makefile.am b/tests/Makefile.am
index a5e1fe0..c89fd8d 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -1,25 +1,23 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-SUBDIRS = gpiosim
+SUBDIRS = gpiosim gpiosim-glib harness
 
-AM_CFLAGS = -I$(top_srcdir)/include/ -I$(top_srcdir)/tests/gpiosim/
+AM_CFLAGS = -I$(top_srcdir)/include/ -I$(top_srcdir)/tests/gpiosim-glib/
+AM_CFLAGS += -I$(top_srcdir)/tests/harness/
 AM_CFLAGS += -include $(top_builddir)/config.h
 AM_CFLAGS += -Wall -Wextra -g -std=gnu89 $(GLIB_CFLAGS) $(GIO_CFLAGS)
 AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiod-test\"
 LDADD = $(top_builddir)/lib/libgpiod.la
 LDADD += $(top_builddir)/tests/gpiosim/libgpiosim.la
+LDADD += $(top_builddir)/tests/gpiosim-glib/libgpiosim-glib.la
+LDADD += $(top_builddir)/tests/harness/libgpiod-test-harness.la
 LDADD += $(GLIB_LIBS) $(GIO_LIBS)
 
 noinst_PROGRAMS = gpiod-test
 
 gpiod_test_SOURCES = \
-	gpiod-test.c \
-	gpiod-test.h \
-	gpiod-test-helpers.c \
-	gpiod-test-helpers.h \
-	gpiod-test-sim.c \
-	gpiod-test-sim.h \
+	helpers.h \
 	tests-chip.c \
 	tests-chip-info.c \
 	tests-edge-event.c \
diff --git a/tests/gpiod-test-helpers.c b/tests/gpiod-test-helpers.c
deleted file mode 100644
index 7e5b396..0000000
--- a/tests/gpiod-test-helpers.c
+++ /dev/null
@@ -1,41 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/* SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
-
-/*
- * Testing framework for the core library.
- *
- * This file contains functions and definitions extending the GLib unit testing
- * framework with functionalities necessary to test the libgpiod core C API as
- * well as the kernel-to-user-space interface.
- */
-
-#include "gpiod-test-helpers.h"
-
-GVariant *
-gpiod_test_package_line_names(const GPIOSimLineName *names)
-{
-	g_autoptr(GVariantBuilder) builder = NULL;
-	const GPIOSimLineName *name;
-
-	builder = g_variant_builder_new(G_VARIANT_TYPE("a(us)"));
-
-	for (name = &names[0]; name->name; name++)
-		g_variant_builder_add(builder, "(us)",
-				      name->offset, name->name);
-
-	return g_variant_ref_sink(g_variant_new("a(us)", builder));
-}
-
-GVariant *gpiod_test_package_hogs(const GPIOSimHog *hogs)
-{
-	g_autoptr(GVariantBuilder) builder = NULL;
-	const GPIOSimHog *hog;
-
-	builder = g_variant_builder_new(G_VARIANT_TYPE("a(usi)"));
-
-	for (hog = &hogs[0]; hog->name; hog++)
-		g_variant_builder_add(builder, "(usi)",
-				      hog->offset, hog->name, hog->direction);
-
-	return g_variant_ref_sink(g_variant_new("a(usi)", builder));
-}
diff --git a/tests/gpiosim-glib/Makefile.am b/tests/gpiosim-glib/Makefile.am
new file mode 100644
index 0000000..1c01629
--- /dev/null
+++ b/tests/gpiosim-glib/Makefile.am
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+noinst_LTLIBRARIES = libgpiosim-glib.la
+libgpiosim_glib_la_SOURCES = \
+	gpiosim-glib.c \
+	gpiosim-glib.h
+
+AM_CFLAGS = -I$(top_srcdir)/tests/gpiosim/
+AM_CFLAGS += -include $(top_builddir)/config.h
+AM_CFLAGS += -Wall -Wextra -g -std=gnu89 $(GLIB_CFLAGS) $(GIO_CFLAGS)
+AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiosim-glib\"
+libgpiosim_glib_la_LDFLAGS = -lgpiosim
diff --git a/tests/gpiod-test-sim.c b/tests/gpiosim-glib/gpiosim-glib.c
similarity index 93%
rename from tests/gpiod-test-sim.c
rename to tests/gpiosim-glib/gpiosim-glib.c
index ac6c71a..4eaeace 100644
--- a/tests/gpiod-test-sim.c
+++ b/tests/gpiosim-glib/gpiosim-glib.c
@@ -6,7 +6,7 @@
 #include <stdlib.h>
 #include <unistd.h>
 
-#include "gpiod-test-sim.h"
+#include "gpiosim-glib.h"
 
 G_DEFINE_QUARK(g-gpiosim-error, g_gpiosim_error);
 
@@ -462,3 +462,31 @@ void g_gpiosim_chip_set_pull(GPIOSimChip *chip, guint offset, GPIOSimPull pull)
 		g_critical("Unable to set the pull setting for simulated line: %s",
 			    g_strerror(errno));
 }
+
+GVariant *g_gpiosim_package_line_names(const GPIOSimLineName *names)
+{
+	g_autoptr(GVariantBuilder) builder = NULL;
+	const GPIOSimLineName *name;
+
+	builder = g_variant_builder_new(G_VARIANT_TYPE("a(us)"));
+
+	for (name = &names[0]; name->name; name++)
+		g_variant_builder_add(builder, "(us)",
+				      name->offset, name->name);
+
+	return g_variant_ref_sink(g_variant_new("a(us)", builder));
+}
+
+GVariant *g_gpiosim_package_hogs(const GPIOSimHog *hogs)
+{
+	g_autoptr(GVariantBuilder) builder = NULL;
+	const GPIOSimHog *hog;
+
+	builder = g_variant_builder_new(G_VARIANT_TYPE("a(usi)"));
+
+	for (hog = &hogs[0]; hog->name; hog++)
+		g_variant_builder_add(builder, "(usi)",
+				      hog->offset, hog->name, hog->direction);
+
+	return g_variant_ref_sink(g_variant_new("a(usi)", builder));
+}
diff --git a/tests/gpiod-test-sim.h b/tests/gpiosim-glib/gpiosim-glib.h
similarity index 86%
rename from tests/gpiod-test-sim.h
rename to tests/gpiosim-glib/gpiosim-glib.h
index f6a4bf0..fa76736 100644
--- a/tests/gpiod-test-sim.h
+++ b/tests/gpiosim-glib/gpiosim-glib.h
@@ -74,6 +74,20 @@ void g_gpiosim_chip_set_pull(GPIOSimChip *self, guint offset, GPIOSimPull pull);
 		_val; \
 	})
 
+typedef struct {
+	guint offset;
+	const gchar *name;
+} GPIOSimLineName;
+
+typedef struct {
+	guint offset;
+	const gchar *name;
+	GPIOSimDirection direction;
+} GPIOSimHog;
+
+GVariant *g_gpiosim_package_line_names(const GPIOSimLineName *names);
+GVariant *g_gpiosim_package_hogs(const GPIOSimHog *hogs);
+
 G_END_DECLS
 
 #endif /* __GPIOD_TEST_SIM_H__ */
diff --git a/tests/harness/Makefile.am b/tests/harness/Makefile.am
new file mode 100644
index 0000000..185c00f
--- /dev/null
+++ b/tests/harness/Makefile.am
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+noinst_LTLIBRARIES = libgpiod-test-harness.la
+libgpiod_test_harness_la_SOURCES = \
+	gpiod-test.c \
+	gpiod-test.h \
+	gpiod-test-common.h
+
+AM_CFLAGS = -include $(top_builddir)/config.h
+AM_CFLAGS += -Wall -Wextra -g -std=gnu89 $(GLIB_CFLAGS)
+AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiod-test\"
diff --git a/tests/harness/gpiod-test-common.h b/tests/harness/gpiod-test-common.h
new file mode 100644
index 0000000..7aaec05
--- /dev/null
+++ b/tests/harness/gpiod-test-common.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+#ifndef __GPIOD_TEST_COMMON_H__
+#define __GPIOD_TEST_COMMON_H__
+
+#include <glib.h>
+
+#define gpiod_test_return_if_failed() \
+	do { \
+		if (g_test_failed()) \
+			return; \
+	} while (0)
+
+#define gpiod_test_join_thread_and_return_if_failed(_thread) \
+	do { \
+		if (g_test_failed()) { \
+			g_thread_join(_thread); \
+			return; \
+		} \
+	} while (0)
+
+#endif /* __GPIOD_TEST_COMMON_H__ */
diff --git a/tests/gpiod-test.c b/tests/harness/gpiod-test.c
similarity index 100%
rename from tests/gpiod-test.c
rename to tests/harness/gpiod-test.c
diff --git a/tests/gpiod-test.h b/tests/harness/gpiod-test.h
similarity index 100%
rename from tests/gpiod-test.h
rename to tests/harness/gpiod-test.h
diff --git a/tests/gpiod-test-helpers.h b/tests/helpers.h
similarity index 87%
rename from tests/gpiod-test-helpers.h
rename to tests/helpers.h
index 41791a3..ecb7baf 100644
--- a/tests/gpiod-test-helpers.h
+++ b/tests/helpers.h
@@ -1,14 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
 
 #ifndef __GPIOD_TEST_HELPERS_H__
 #define __GPIOD_TEST_HELPERS_H__
 
-#include <errno.h>
 #include <glib.h>
 #include <gpiod.h>
-
-#include "gpiod-test-sim.h"
+#include <gpiod-test-common.h>
 
 /*
  * These typedefs are needed to make g_autoptr work - it doesn't accept
@@ -49,20 +47,6 @@ typedef struct gpiod_edge_event_buffer struct_gpiod_edge_event_buffer;
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_edge_event_buffer,
 			      gpiod_edge_event_buffer_free);
 
-#define gpiod_test_return_if_failed() \
-	do { \
-		if (g_test_failed()) \
-			return; \
-	} while (0)
-
-#define gpiod_test_join_thread_and_return_if_failed(_thread) \
-	do { \
-		if (g_test_failed()) { \
-			g_thread_join(_thread); \
-			return; \
-		} \
-	} while (0)
-
 #define gpiod_test_open_chip_or_fail(_path) \
 	({ \
 		struct gpiod_chip *_chip = gpiod_chip_open(_path); \
@@ -184,20 +168,6 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_edge_event_buffer,
 	} while (0)
 
 #define gpiod_test_expect_errno(_expected) \
-	g_assert_cmpint(_expected, ==, errno)
-
-typedef struct {
-	guint offset;
-	const gchar *name;
-} GPIOSimLineName;
-
-typedef struct {
-	guint offset;
-	const gchar *name;
-	GPIOSimDirection direction;
-} GPIOSimHog;
-
-GVariant *gpiod_test_package_line_names(const GPIOSimLineName *names);
-GVariant *gpiod_test_package_hogs(const GPIOSimHog *hogs);
+	g_assert_cmpint((_expected), ==, errno)
 
 #endif /* __GPIOD_TEST_HELPERS_H__ */
diff --git a/tests/tests-chip-info.c b/tests/tests-chip-info.c
index db76385..7b2e857 100644
--- a/tests/tests-chip-info.c
+++ b/tests/tests-chip-info.c
@@ -4,10 +4,11 @@
 #include <errno.h>
 #include <glib.h>
 #include <gpiod.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
 
-#include "gpiod-test.h"
-#include "gpiod-test-helpers.h"
-#include "gpiod-test-sim.h"
+#include "helpers.h"
 
 #define GPIOD_TEST_GROUP "chip-info"
 
diff --git a/tests/tests-chip.c b/tests/tests-chip.c
index 815b4c7..13e3f61 100644
--- a/tests/tests-chip.c
+++ b/tests/tests-chip.c
@@ -4,10 +4,11 @@
 #include <errno.h>
 #include <glib.h>
 #include <gpiod.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
 
-#include "gpiod-test.h"
-#include "gpiod-test-helpers.h"
-#include "gpiod-test-sim.h"
+#include "helpers.h"
 
 #define GPIOD_TEST_GROUP "chip"
 
@@ -89,7 +90,7 @@ GPIOD_TEST_CASE(find_line_bad)
 
 	g_autoptr(GPIOSimChip) sim = NULL;
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(GVariant) vnames = gpiod_test_package_line_names(names);
+	g_autoptr(GVariant) vnames = g_gpiosim_package_line_names(names);
 
 	sim = g_gpiosim_chip_new(
 			"num-lines", 8,
@@ -116,7 +117,7 @@ GPIOD_TEST_CASE(find_line_good)
 
 	g_autoptr(GPIOSimChip) sim = NULL;
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(GVariant) vnames = gpiod_test_package_line_names(names);
+	g_autoptr(GVariant) vnames = g_gpiosim_package_line_names(names);
 
 	sim = g_gpiosim_chip_new(
 			"num-lines", 8,
@@ -142,7 +143,7 @@ GPIOD_TEST_CASE(find_line_duplicate)
 
 	g_autoptr(GPIOSimChip) sim = NULL;
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(GVariant) vnames = gpiod_test_package_line_names(names);
+	g_autoptr(GVariant) vnames = g_gpiosim_package_line_names(names);
 
 	sim = g_gpiosim_chip_new(
 			"num-lines", 8,
@@ -165,7 +166,7 @@ GPIOD_TEST_CASE(find_line_non_standard_names)
 		{ }
 	};
 
-	g_autoptr(GVariant) vnames = gpiod_test_package_line_names(names);
+	g_autoptr(GVariant) vnames = g_gpiosim_package_line_names(names);
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8,
 							"line-names", vnames,
 							NULL);
diff --git a/tests/tests-edge-event.c b/tests/tests-edge-event.c
index b744ca5..6389455 100644
--- a/tests/tests-edge-event.c
+++ b/tests/tests-edge-event.c
@@ -3,11 +3,12 @@
 
 #include <glib.h>
 #include <gpiod.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
 #include <poll.h>
 
-#include "gpiod-test.h"
-#include "gpiod-test-helpers.h"
-#include "gpiod-test-sim.h"
+#include "helpers.h"
 
 #define GPIOD_TEST_GROUP "edge-event"
 
diff --git a/tests/tests-info-event.c b/tests/tests-info-event.c
index cbd9e9e..e014500 100644
--- a/tests/tests-info-event.c
+++ b/tests/tests-info-event.c
@@ -3,11 +3,12 @@
 
 #include <glib.h>
 #include <gpiod.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
 #include <poll.h>
 
-#include "gpiod-test.h"
-#include "gpiod-test-helpers.h"
-#include "gpiod-test-sim.h"
+#include "helpers.h"
 
 #define GPIOD_TEST_GROUP "info-event"
 
diff --git a/tests/tests-kernel-uapi.c b/tests/tests-kernel-uapi.c
index e54cfcc..ff220fc 100644
--- a/tests/tests-kernel-uapi.c
+++ b/tests/tests-kernel-uapi.c
@@ -4,10 +4,11 @@
 #include <glib.h>
 #include <gpiod.h>
 #include <poll.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
 
-#include "gpiod-test.h"
-#include "gpiod-test-helpers.h"
-#include "gpiod-test-sim.h"
+#include "helpers.h"
 
 #define GPIOD_TEST_GROUP "kernel-uapi"
 
diff --git a/tests/tests-line-config.c b/tests/tests-line-config.c
index 469500b..b61a445 100644
--- a/tests/tests-line-config.c
+++ b/tests/tests-line-config.c
@@ -4,10 +4,11 @@
 #include <errno.h>
 #include <glib.h>
 #include <gpiod.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
 
-#include "gpiod-test.h"
-#include "gpiod-test-helpers.h"
-#include "gpiod-test-sim.h"
+#include "helpers.h"
 
 #define GPIOD_TEST_GROUP "line-config"
 
diff --git a/tests/tests-line-info.c b/tests/tests-line-info.c
index cf2c650..92cd7e0 100644
--- a/tests/tests-line-info.c
+++ b/tests/tests-line-info.c
@@ -4,10 +4,11 @@
 #include <errno.h>
 #include <glib.h>
 #include <gpiod.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
 
-#include "gpiod-test.h"
-#include "gpiod-test-helpers.h"
-#include "gpiod-test-sim.h"
+#include "helpers.h"
 
 #define GPIOD_TEST_GROUP "line-info"
 
@@ -64,8 +65,8 @@ GPIOD_TEST_CASE(line_info_basic_properties)
 	g_autoptr(struct_gpiod_chip) chip = NULL;
 	g_autoptr(struct_gpiod_line_info) info4 = NULL;
 	g_autoptr(struct_gpiod_line_info) info6 = NULL;
-	g_autoptr(GVariant) vnames = gpiod_test_package_line_names(names);
-	g_autoptr(GVariant) vhogs = gpiod_test_package_hogs(hogs);
+	g_autoptr(GVariant) vnames = g_gpiosim_package_line_names(names);
+	g_autoptr(GVariant) vhogs = g_gpiosim_package_hogs(hogs);
 
 	sim = g_gpiosim_chip_new(
 			"num-lines", 8,
diff --git a/tests/tests-line-request.c b/tests/tests-line-request.c
index 7bba078..dd4e9a8 100644
--- a/tests/tests-line-request.c
+++ b/tests/tests-line-request.c
@@ -3,10 +3,11 @@
 
 #include <glib.h>
 #include <gpiod.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
 
-#include "gpiod-test.h"
-#include "gpiod-test-helpers.h"
-#include "gpiod-test-sim.h"
+#include "helpers.h"
 
 #define GPIOD_TEST_GROUP "line-request"
 
diff --git a/tests/tests-line-settings.c b/tests/tests-line-settings.c
index b86fd26..18fde50 100644
--- a/tests/tests-line-settings.c
+++ b/tests/tests-line-settings.c
@@ -4,9 +4,10 @@
 #include <errno.h>
 #include <glib.h>
 #include <gpiod.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
 
-#include "gpiod-test.h"
-#include "gpiod-test-helpers.h"
+#include "helpers.h"
 
 #define GPIOD_TEST_GROUP "line-settings"
 
diff --git a/tests/tests-misc.c b/tests/tests-misc.c
index 240dd02..9d4f3de 100644
--- a/tests/tests-misc.c
+++ b/tests/tests-misc.c
@@ -4,11 +4,12 @@
 #include <errno.h>
 #include <glib.h>
 #include <gpiod.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
 #include <unistd.h>
 
-#include "gpiod-test.h"
-#include "gpiod-test-helpers.h"
-#include "gpiod-test-sim.h"
+#include "helpers.h"
 
 #define GPIOD_TEST_GROUP "misc"
 
diff --git a/tests/tests-request-config.c b/tests/tests-request-config.c
index d3c679a..a38befd 100644
--- a/tests/tests-request-config.c
+++ b/tests/tests-request-config.c
@@ -3,9 +3,10 @@
 
 #include <glib.h>
 #include <gpiod.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
 
-#include "gpiod-test.h"
-#include "gpiod-test-helpers.h"
+#include "helpers.h"
 
 #define GPIOD_TEST_GROUP "request-config"
 

-- 
2.43.0


