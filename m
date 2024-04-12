Return-Path: <linux-gpio+bounces-5413-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 322498A2E2D
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 14:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8901428770D
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 12:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD7156753;
	Fri, 12 Apr 2024 12:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cGNQa2pE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEAE56448
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 12:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712924899; cv=none; b=Zaj/wJbzMYOQTB+ukjU4GdrNmeIbzYVb2zCugjphX6LBF4Onr3Ggv74hO/XOLgjVH8fAZxNfHWKz2mEIpGTS1u0H5uar/km573ASnYpYFd9wbdeNciYZJtdjEoFCILqGZuBuRCocQ5JuSNdUmmWn+yZYu3jP5iz7aqNpSUw3Plo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712924899; c=relaxed/simple;
	bh=jSuBil7ZcL9edCzVXY4apsQf9D6Kwn+Jtn+lRgpQmms=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DzSsCq8DSmk0hRtrInFtZBExNwH5VyGPNkL6JTyCVOnXVLwi02SOVg4tknUAQwOzZxCVil2fU0/Ocm8rRTh88ZNJI+5ievQAm+P4rGSqEQeChe4fh9hkoSCf5otzaWwC3mf0tyx4gOAJVQZUsRHKn+Gs3G+PY9lyWA61QJbUW8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cGNQa2pE; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d6ff0422a2so9229381fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 05:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712924895; x=1713529695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjVP9m/q8y1kmQNqUxQCUkXpOrEfwo/fwOOR23/9AiA=;
        b=cGNQa2pEjhSV9Fv+VNaE7drrgfQ00li+eVj+EJ8mt8LEs4pmVxlGIt9kvpwIt0OY1i
         R6FIPkZnsM0g2byeQiUSwHOLS8owWZm3M/tTkN3WWksTiSi9r49BgKpUhIZZgTwFEJZE
         2cakSJJCf470m1+YymSLGoVkebfDp44f7olhNeRgY8C7LsC2VKUXhJEvIxaXfvLxdUAv
         P47Dh5i6Wq6TT7bu5VlOyqlyUF+aFN2WERm19teMaMRWYehjc0nQW8gVhmj8ggR1NbY4
         5FOk8IiYeel3bWwbHCGIvYpFpcb+D9dFcY/y3fgO/fQRGb2v3wgBM0jF8tLP7pMpuktW
         9agA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712924895; x=1713529695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UjVP9m/q8y1kmQNqUxQCUkXpOrEfwo/fwOOR23/9AiA=;
        b=XIrMNNrevNO1FqpwX2kWCOc60hcejOHE1j5KbDv6ZwX0/AdEV1MPuC0WlOmvm1H4g8
         ddplX5BB4LELzhR4Lfw1rCyJOJsejVax61zBQ6dBLgw5CjDZKZMEXpqaN1iBoN5xFFY8
         LT+dGGYYblAXXMvYYZCviupA3BdVMYbHGgWB7kbUPTHAT5VSMeMGrQL4EeQ5n4LYc5iP
         bUuW7oMoLDyb/9Zjh8yqjz4VvVvrVPhIfcoy70A9fSphJPfmpUlpYfCG4K58hQ1FC8lB
         ljCvLDA4ZBocJVF3ww7zb6L24ivzxg5wIOp4J50koxdB4A4DASPiVKVD5sY5HCH6eYIB
         tLVw==
X-Gm-Message-State: AOJu0Ywk1oLJW/GYeQ5BILTzTIr+LsX8Ysat/0oJxK27tQxIBLBslvOa
	Ehl8wvjgYZSNQynaYtsWPcYmzA9WTV96Bff0sQDmiO9n6Mq1CTYqVDgfwb5Kfl8=
X-Google-Smtp-Source: AGHT+IHUC12U54iDjAiinlss2jn7McPMcb5sR3wlNM+mJgwDSGUHG+9vuccb/0jfA50t3fnEJKp3WA==
X-Received: by 2002:a2e:9b1a:0:b0:2d8:b2e:7bf3 with SMTP id u26-20020a2e9b1a000000b002d80b2e7bf3mr1430013lji.0.1712924895010;
        Fri, 12 Apr 2024 05:28:15 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:3e87:b228:de9:1398])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm8752211wms.26.2024.04.12.05.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 05:28:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][RFC/RFT 01/18] tests: split out reusable test code into a local static library
Date: Fri, 12 Apr 2024 14:27:47 +0200
Message-Id: <20240412122804.109323-2-brgl@bgdev.pl>
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

In order to allow the upcoming GLib and DBus bindings to reuse the test
code, let's put all common elements into reusable libtool objects and
export the relevant symbols in internal headers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac                                  |  2 +
 tests/Makefile.am                             | 14 +++----
 tests/gpiod-test-helpers.c                    | 41 -------------------
 tests/gpiosim-glib/Makefile.am                | 13 ++++++
 .../gpiosim-glib.c}                           | 30 +++++++++++++-
 .../gpiosim-glib.h}                           | 14 +++++++
 tests/harness/Makefile.am                     | 12 ++++++
 tests/harness/gpiod-test-common.h             | 23 +++++++++++
 tests/{ => harness}/gpiod-test.c              |  0
 tests/{ => harness}/gpiod-test.h              |  0
 tests/{gpiod-test-helpers.h => helpers.h}     | 36 ++--------------
 tests/tests-chip-info.c                       |  7 ++--
 tests/tests-chip.c                            | 15 +++----
 tests/tests-edge-event.c                      |  7 ++--
 tests/tests-info-event.c                      |  7 ++--
 tests/tests-line-config.c                     |  7 ++--
 tests/tests-line-info.c                       | 11 ++---
 tests/tests-line-request.c                    |  7 ++--
 tests/tests-line-settings.c                   |  5 ++-
 tests/tests-misc.c                            |  7 ++--
 tests/tests-request-config.c                  |  5 ++-
 21 files changed, 146 insertions(+), 117 deletions(-)
 delete mode 100644 tests/gpiod-test-helpers.c
 create mode 100644 tests/gpiosim-glib/Makefile.am
 rename tests/{gpiod-test-sim.c => gpiosim-glib/gpiosim-glib.c} (93%)
 rename tests/{gpiod-test-sim.h => gpiosim-glib/gpiosim-glib.h} (86%)
 create mode 100644 tests/harness/Makefile.am
 create mode 100644 tests/harness/gpiod-test-common.h
 rename tests/{ => harness}/gpiod-test.c (100%)
 rename tests/{ => harness}/gpiod-test.h (100%)
 rename tests/{gpiod-test-helpers.h => helpers.h} (87%)

diff --git a/configure.ac b/configure.ac
index 3b5bbf2..b711501 100644
--- a/configure.ac
+++ b/configure.ac
@@ -272,6 +272,8 @@ AC_CONFIG_FILES([Makefile
 		 tools/Makefile
 		 tests/Makefile
 		 tests/gpiosim/Makefile
+		 tests/gpiosim-glib/Makefile
+		 tests/harness/Makefile
 		 bindings/cxx/libgpiodcxx.pc
 		 bindings/Makefile
 		 bindings/cxx/Makefile
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 0680d5e..13d7c5d 100644
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
2.40.1


