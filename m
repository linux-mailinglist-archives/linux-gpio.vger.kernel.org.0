Return-Path: <linux-gpio+bounces-7810-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A946C91C62F
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 20:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F46728652C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 18:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368AD5674E;
	Fri, 28 Jun 2024 18:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xgQtP+cI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFA555884
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 18:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601141; cv=none; b=S4hqZ/zChn9MF77ryrZcxOhNiHF8HhmN0YwEQrLWfgRPIRLmoHJQg40F7jB2HkPEmTU1kwZ8ilzo4nblVTtLJz8+uWWfjmszkrXaxCEA2fqrb2TunQDx1isRDhlEv7EJlLH7qa1tNXuo5iVkHLQbiGbPdoFzA4z+1PgMxC9s9+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601141; c=relaxed/simple;
	bh=4PGbVRotP5756TPi5zGgCzLioTg3uvuxJTeoiAOcsLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Otmm7EPVpLSl3qVnAt/+rnPnLjnK6BS5dDkjVWN1Dyg1DgG/hikvHOoC4St3MxClkqrVuElWzI6DCuUeA8QlPDKnWTvWC0cFzfNMGXLZD3PrXCxkcRvvsy/PAGuL81jIexELMCKWb2iqD39Wx6mmDDkQMUtiDy/XWwI12sX43ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xgQtP+cI; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-36279cf6414so568496f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 11:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719601138; x=1720205938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmqPpwF2aE1B3oXsxyYtSza9my0vs08e8yNUGNiifL4=;
        b=xgQtP+cI8H+PX8TtnKCPJ5SGOHfbtCrNEvIuMRAJfdB/4zACBm4uA6dAdh/ZN4MQ07
         /EF7To+R81rh6UKL6gJtfqKajZ7Uf701CKfuZxqcBbtuk1xsYuibIDlEc5akJr8WTJCz
         +XVp0wwKaRSbmgzKJOAE3Fka7Gqpj/wHg4JZySfRcN37w+0hCMy8XMhlAJVRm/9Fvube
         WkkoWTFgIuN2xVO0cU402NQfSckwufSF79GLi5E/6BA8Wf43HdNwND+mWvkDxU9+1Yc2
         Ud21BovBXu4yjK/+1on1frgQsj+aP2KcmEbTpDMtHVIZ6EAmJwx3kE6XsMMZN7KgWWkn
         oPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719601138; x=1720205938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmqPpwF2aE1B3oXsxyYtSza9my0vs08e8yNUGNiifL4=;
        b=FNhCnljwVcaSoAF/VjZ8E+dpmsmFcyguFj8VQJzDaNcJpCpG30Y7ou9E4NppAHKprp
         vW+6CoRVULqiP7FqAXQ/TGrkm448tRUeURne2pE72lIrYXNP01rQu82T1uGVbRGDBh/z
         h3X/JbXwGK6LPduAVGYQN+Y8zGconXHpKK1MbML8Ac2MID5i8tdd6qYcrElGY+aHT2X6
         HMgF2GAd7wCBgH9IA7k1q7kVU7g4nvGRAoRSXk8nK/JaU2SHYQOAMzdfi6frXiRyvvPt
         t0vREAwUjyooqWrGQlod6WCa2a/z+iCfb9OcZtVrX/mzefwNcH+AxsPKh3rzh/WVXeK+
         acSw==
X-Forwarded-Encrypted: i=1; AJvYcCXa6rV0ruAjjpC0xVzcN7N7+wYf0c9p6ZG4Tx6jdjJT3YXECUfexMDDbjw6dn8X+XzThT+kG2SQu6jrJSRl+7Cyy/IZqMGvdzSyoA==
X-Gm-Message-State: AOJu0YzFZH57u/SWvJ9YOUE/nPTeG+HIq1yAZEq50v4dLHCavpdkVC8B
	P/Yq6dP1LDsJEwZPrqvWlDKLr/NncHiynbnU6tEl7n0YiKra9gzdEtWD4OpBiVM=
X-Google-Smtp-Source: AGHT+IE796x9ccnLd6y1Wbv4u4xDL1n0EqHiwDg6EiIstpxv7NWTkeCC15DeYuKX3P2PIO/AvBduew==
X-Received: by 2002:a5d:49ca:0:b0:362:42eb:6f21 with SMTP id ffacd0b85a97d-366e9465163mr10011931f8f.10.1719601137550;
        Fri, 28 Jun 2024 11:58:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103d00sm3097336f8f.99.2024.06.28.11.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:58:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 20:58:20 +0200
Subject: [PATCH RESEND libgpiod v2 01/18] tests: split out reusable test
 code into a local static library
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-1-c1331ac17cb8@linaro.org>
References: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18592;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZUXsIVxOn3owvEPkyfSvn82+dbVYuH0IKyss5JuL8Ek=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfwfpJMfERmNdPbhL4OzhEztRx96fu94X6n0jH
 2CXouRTkyeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn8H6QAKCRARpy6gFHHX
 ckoRD/wOafZv0kYcU5VcqKz2edGH//VbGI98Y7tILccrmVmdko6Zb5IkekxBLy0YVI7Q7zok0xp
 92TQRu/LRLrfDZauFQZiqbKIS3tpW76jPukyNL+FYIx7j2DkXrChQ0hAfpg77Upz5CmSuK7LhZv
 qZOTV273/1sZPHHRmvfMguaA2GWT46PwTq8afDnopOnAzJB1Q9/PvCKnEQUdcngxMiKuYcS4fZY
 li3QTbyorh8XNrMnQhEbzrEVTW4f9LKWZmbVWdKBSo7CGGmzu3lWD244yjIuioT1O9WjsYdqtNB
 n0gMveLyVBchja2DYVEHSV4mEFOZwgIZ9aetisOzK8cu8y4kjUu9PLBxt9qxPAWKyfZBFNw2lYU
 opjxzCYw0bqP0yfta0BS3QBWjc3ZlVuHmwO/DaMORhFkSq6pnX1LLJOsk9nsvZRzcSO++MCI2d9
 sKq/reis3GaHivzAQwMazfy5ArRwIRVsQL6U8Kswm+jXjBahAATp+X+PD1Hv5rFfSeSLmdkAneP
 y60dFVogp8KIesYmg7X2TgcOqLuWkAIHthoTFRMtHGGuW4Xg2wji7vChTYVog/1X7jR1UoB6Ip0
 CKwk1bZTc1GuRoBDK2tOO4Gv8dv2NtMFmkenptifNFf+L2j1BQ9Vr5omxOFK7SLsTBLsjqahDlB
 fU9GK39RXmVWARA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to allow the upcoming GLib and DBus bindings to reuse the test
code, let's put all common elements into reusable libtool objects and
export the relevant symbols in internal headers.

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


