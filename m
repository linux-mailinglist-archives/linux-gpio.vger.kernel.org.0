Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA6544B0FBE
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Feb 2022 15:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242623AbiBJOIF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 09:08:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240931AbiBJOIE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 09:08:04 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7413CF9
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 06:08:02 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id e3so9894819wra.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 06:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5maz/3O3qQMIr8ioOr+qxmJuT5dWTyoYkvdUIA65cMA=;
        b=ayYS8TmRTL/6p70gNRnEUjzZ/aPeidYeIPZ6DpvpXwbrlI2lvC+CxwS8m7a1GWKFO/
         i8PUIR0hSiPy1b9OGMwJ2b+x0t+wDwS3iOBUYSP0Gd8P5N8/1d5dx0UbLozF3jH2oA+T
         CRwDynjkQbI30QQ+AUuJcUE9Uo+VQ7gMrTV9cETScpabLEQNjeipU3eD6VST+mJSqh3q
         B4sPUJ11m4/hmMMuhZo2545zV8089Lin/Pmswte/r39ayGW23IYL2VX1XnwaLowdiWRm
         amiY3rIAo/P+NLUTpNS9iYg+5R28R5XYC+1DBeiLEY96e1+71bPN2f6cKcs4adjlcJXf
         CXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5maz/3O3qQMIr8ioOr+qxmJuT5dWTyoYkvdUIA65cMA=;
        b=RtL9oKpNLpPhpTYnZmdAB9wZcK5U5RgJGXnIOtvNqO6MbvyE6tErn0Q+Lwt+VmoZXA
         JB1rKfj6L/1f50V3GavuzBjkx7uC80rYG9PxXbTkEk9o5QigMF/ooAi8hvyPJ8wgrxBz
         z3qCIVCpTLFETCytxcl9ed0W4oxMz4pR/ukr36ncwl1R/DmiVMCxZlhgZme13kFL7vcS
         vhOGhs9Yto2Erxgv3jSzAYh/U7BRdTrC27ZmR0sv4kTU96nr8TkoypG6iv+3rNhR1FYT
         LZDsA8rXXPSJrGiEujizbcdyHRZH7aszbvAR/eKEELIv552M/Z1VVcDjyPaanlwbWmG6
         zH4Q==
X-Gm-Message-State: AOAM532GyujPhFQW7mrckYwK3bd/I/FkFmBuMARecM5Np8SV/GK75Wr+
        Ut4DaUpcGO9R0gLOlwT2o/pCOQ==
X-Google-Smtp-Source: ABdhPJwF8v1a0EZHjFxFhOgO67D174svGTJqXl0Asba1pyW6VAVb0IEzujx14+CzC7klhlTKECasxg==
X-Received: by 2002:adf:a4c8:: with SMTP id h8mr6403661wrb.169.1644502079920;
        Thu, 10 Feb 2022 06:07:59 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id i3sm18322879wrq.72.2022.02.10.06.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 06:07:59 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH 4/4] tests: rewrite core C tests using libgpiosim
Date:   Thu, 10 Feb 2022 15:07:45 +0100
Message-Id: <20220210140745.1059087-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20220210140745.1059087-1-brgl@bgdev.pl>
References: <20220210140745.1059087-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This replaces the old tests for the C API v1 based on gpio-mockup with
a test suite based on gpio-sim that covers around 95% of the libgpiod v2
codebase.

The test harness has been rebuilt and shrank significantly as well. The
libgpiosim API has been wrapped in a gobject interface.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 configure.ac                 |    8 +-
 tests/Makefile.am            |   20 +-
 tests/gpiod-test-helpers.c   |   49 ++
 tests/gpiod-test-helpers.h   |  131 ++++
 tests/gpiod-test-sim.c       |  303 ++++++++++
 tests/gpiod-test-sim.h       |   42 ++
 tests/gpiod-test.c           |  233 +-------
 tests/gpiod-test.h           |   81 +--
 tests/gpiosim/gpiosim.c      |    1 +
 tests/mockup/Makefile.am     |   11 -
 tests/mockup/gpio-mockup.c   |  496 ----------------
 tests/mockup/gpio-mockup.h   |   36 --
 tests/tests-chip.c           |  282 ++++-----
 tests/tests-edge-event.c     |  420 +++++++++++++
 tests/tests-event.c          |  908 ----------------------------
 tests/tests-info-event.c     |  301 ++++++++++
 tests/tests-line-config.c    |  408 +++++++++++++
 tests/tests-line-info.c      |  316 ++++++++++
 tests/tests-line-request.c   |  421 +++++++++++++
 tests/tests-line.c           | 1091 ----------------------------------
 tests/tests-misc.c           |   86 ++-
 tests/tests-request-config.c |   90 +++
 22 files changed, 2714 insertions(+), 3020 deletions(-)
 create mode 100644 tests/gpiod-test-helpers.c
 create mode 100644 tests/gpiod-test-helpers.h
 create mode 100644 tests/gpiod-test-sim.c
 create mode 100644 tests/gpiod-test-sim.h
 delete mode 100644 tests/mockup/Makefile.am
 delete mode 100644 tests/mockup/gpio-mockup.c
 delete mode 100644 tests/mockup/gpio-mockup.h
 create mode 100644 tests/tests-edge-event.c
 delete mode 100644 tests/tests-event.c
 create mode 100644 tests/tests-info-event.c
 create mode 100644 tests/tests-line-config.c
 create mode 100644 tests/tests-line-info.c
 create mode 100644 tests/tests-line-request.c
 delete mode 100644 tests/tests-line.c
 create mode 100644 tests/tests-request-config.c

diff --git a/configure.ac b/configure.ac
index dc09d70..b4f5db0 100644
--- a/configure.ac
+++ b/configure.ac
@@ -28,9 +28,8 @@ AC_SUBST(VERSION_STR, [$PACKAGE_VERSION$EXTRA_VERSION])
 AC_SUBST(ABI_VERSION, [4.1.2])
 # Have a separate ABI version for C++ bindings:
 AC_SUBST(ABI_CXX_VERSION, [2.1.1])
-# ABI version for libgpiomockup (we need this since it can be installed if we
+# ABI version for libgpiosim (we need this since it can be installed if we
 # enable install-tests).
-AC_SUBST(ABI_MOCKUP_VERSION, [0.1.0])
 AC_SUBST(ABI_GPIOSIM_VERSION, [0.1.0])
 
 AC_CONFIG_AUX_DIR([autostuff])
@@ -137,14 +136,14 @@ AC_DEFUN([FUNC_NOT_FOUND_TESTS],
 
 if test "x$with_tests" = xtrue
 then
-	# For libgpiomockup & libgpiosim
+	# For libgpiosim
 	AC_CHECK_FUNC([qsort], [], [FUNC_NOT_FOUND_TESTS([qsort])])
 	PKG_CHECK_MODULES([KMOD], [libkmod >= 18])
-	PKG_CHECK_MODULES([UDEV], [libudev >= 215])
 	PKG_CHECK_MODULES([MOUNT], [mount >= 2.33.1])
 
 	# For core library tests
 	PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.50])
+	PKG_CHECK_MODULES([GOBJECT], [gobject-2.0 >= 2.50])
 
 	if test "x$with_tools" = xtrue
 	then
@@ -235,7 +234,6 @@ AC_CONFIG_FILES([Makefile
 		 lib/libgpiod.pc
 		 tools/Makefile
 		 tests/Makefile
-		 tests/mockup/Makefile
 		 tests/gpiosim/Makefile
 		 bindings/cxx/libgpiodcxx.pc
 		 bindings/Makefile
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 8ec51e9..df8c87b 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -1,24 +1,32 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-SUBDIRS = mockup gpiosim
+SUBDIRS = gpiosim
 
 AM_CFLAGS = -I$(top_srcdir)/include/ -I$(top_srcdir)/tests/gpiosim/
 AM_CFLAGS += -include $(top_builddir)/config.h
-AM_CFLAGS += -Wall -Wextra -g -std=gnu89 $(GLIB_CFLAGS)
+AM_CFLAGS += -Wall -Wextra -g -std=gnu89 $(GLIB_CFLAGS) $(GOBJECT_CFLAGS)
 AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiod-test\"
 AM_CFLAGS += $(PROFILING_FLAGS)
 AM_LDFLAGS = -pthread
 LDADD = $(top_builddir)/lib/libgpiod.la
 LDADD += $(top_builddir)/tests/gpiosim/libgpiosim.la
-LDADD += $(GLIB_LIBS)
+LDADD += $(GLIB_LIBS) $(GOBJECT_LIBS)
 
 bin_PROGRAMS = gpiod-test
 
 gpiod_test_SOURCES =			\
 		gpiod-test.c		\
 		gpiod-test.h		\
+		gpiod-test-helpers.c	\
+		gpiod-test-helpers.h	\
+		gpiod-test-sim.c	\
+		gpiod-test-sim.h	\
 		tests-chip.c		\
-		tests-event.c		\
-		tests-line.c		\
-		tests-misc.c
+		tests-edge-event.c	\
+		tests-info-event.c	\
+		tests-line-config.c	\
+		tests-line-info.c	\
+		tests-line-request.c	\
+		tests-misc.c		\
+		tests-request-config.c
diff --git a/tests/gpiod-test-helpers.c b/tests/gpiod-test-helpers.c
new file mode 100644
index 0000000..24a6ee4
--- /dev/null
+++ b/tests/gpiod-test-helpers.c
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/*
+ * Testing framework for the core library.
+ *
+ * This file contains functions and definitions extending the GLib unit testing
+ * framework with functionalities necessary to test the libgpiod core C API as
+ * well as the kernel-to-user-space interface.
+ */
+
+#include "gpiod-test-helpers.h"
+
+GVariant *
+gpiod_test_package_line_names(const struct gpiod_test_line_name *names)
+{
+	const struct gpiod_test_line_name *name;
+	GVariantBuilder *builder;
+	GVariant *ret;
+
+	builder = g_variant_builder_new(G_VARIANT_TYPE("a(us)"));
+
+	for (name = &names[0]; name->name; name++)
+		g_variant_builder_add(builder, "(us)",
+				      name->offset, name->name);
+
+	ret = g_variant_new("a(us)", builder);
+	g_variant_builder_unref(builder);
+
+	return ret;
+}
+
+GVariant *gpiod_test_package_hogs(const struct gpiod_test_hog *hogs)
+{
+	const struct gpiod_test_hog *hog;
+	GVariantBuilder *builder;
+	GVariant *ret;
+
+	builder = g_variant_builder_new(G_VARIANT_TYPE("a(usi)"));
+
+	for (hog = &hogs[0]; hog->name; hog++)
+		g_variant_builder_add(builder, "(usi)",
+				      hog->offset, hog->name, hog->direction);
+
+	ret = g_variant_new("a(usi)", builder);
+	g_variant_builder_unref(builder);
+
+	return ret;
+}
diff --git a/tests/gpiod-test-helpers.h b/tests/gpiod-test-helpers.h
new file mode 100644
index 0000000..1ca84f4
--- /dev/null
+++ b/tests/gpiod-test-helpers.h
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+#ifndef __GPIOD_TEST_HELPERS_H__
+#define __GPIOD_TEST_HELPERS_H__
+
+#include <errno.h>
+#include <glib.h>
+#include <gpiod.h>
+
+#include "gpiod-test-sim.h"
+
+/*
+ * These typedefs are needed to make g_autoptr work - it doesn't accept
+ * regular 'struct typename' syntax.
+ */
+
+typedef struct gpiod_chip struct_gpiod_chip;
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_chip, gpiod_chip_close);
+
+typedef struct gpiod_line_info struct_gpiod_line_info;
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_line_info, gpiod_line_info_free);
+
+typedef struct gpiod_info_event struct_gpiod_info_event;
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_info_event, gpiod_info_event_free);
+
+typedef struct gpiod_line_config struct_gpiod_line_config;
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_line_config, gpiod_line_config_free);
+
+typedef struct gpiod_request_config struct_gpiod_request_config;
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_request_config,
+			      gpiod_request_config_free);
+
+typedef struct gpiod_line_request struct_gpiod_line_request;
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_line_request,
+			      gpiod_line_request_release);
+
+typedef struct gpiod_edge_event struct_gpiod_edge_event;
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_edge_event, gpiod_edge_event_free);
+
+typedef struct gpiod_edge_event_buffer struct_gpiod_edge_event_buffer;
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_edge_event_buffer,
+			      gpiod_edge_event_buffer_free);
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
+#define gpiod_test_open_chip_or_fail(_path) \
+	({ \
+		struct gpiod_chip *_chip = gpiod_chip_open((_path)); \
+		g_assert_nonnull(_chip); \
+		gpiod_test_return_if_failed(); \
+		_chip; \
+	})
+
+#define gpiod_test_get_line_info_or_fail(_chip, _offset) \
+	({ \
+		struct gpiod_line_info *_info = \
+				gpiod_chip_get_line_info((_chip), (_offset)); \
+		g_assert_nonnull(_info); \
+		gpiod_test_return_if_failed(); \
+		_info; \
+	})
+
+#define gpiod_test_create_line_config_or_fail() \
+	({ \
+		struct gpiod_line_config *_config = \
+				gpiod_line_config_new(); \
+		g_assert_nonnull(_config); \
+		gpiod_test_return_if_failed(); \
+		_config; \
+	})
+
+#define gpiod_test_create_edge_event_buffer_or_fail(_capacity) \
+	({ \
+		struct gpiod_edge_event_buffer *_buffer = \
+				gpiod_edge_event_buffer_new(_capacity); \
+		g_assert_nonnull(_buffer); \
+		gpiod_test_return_if_failed(); \
+		_buffer; \
+	})
+
+#define gpiod_test_create_request_config_or_fail() \
+	({ \
+		struct gpiod_request_config *_config = \
+				gpiod_request_config_new(); \
+		g_assert_nonnull(_config); \
+		gpiod_test_return_if_failed(); \
+		_config; \
+	})
+
+#define gpiod_test_request_lines_or_fail(_chip, _req_cfg, _line_cfg) \
+	({ \
+		struct gpiod_line_request *_request = \
+			gpiod_chip_request_lines((_chip), \
+						 (_req_cfg), (_line_cfg)); \
+		g_assert_nonnull(_request); \
+		gpiod_test_return_if_failed(); \
+		_request; \
+	})
+
+#define gpiod_test_expect_errno(_expected) \
+	g_assert_cmpint((_expected), ==, errno)
+
+struct gpiod_test_line_name {
+	guint offset;
+	const gchar *name;
+};
+
+struct gpiod_test_hog {
+	guint offset;
+	const gchar *name;
+	GPIOSimHogDir direction;
+};
+
+GVariant *
+gpiod_test_package_line_names(const struct gpiod_test_line_name *names);
+GVariant *gpiod_test_package_hogs(const struct gpiod_test_hog *hogs);
+
+#endif /* __GPIOD_TEST_HELPERS_H__ */
diff --git a/tests/gpiod-test-sim.c b/tests/gpiod-test-sim.c
new file mode 100644
index 0000000..9dd6f69
--- /dev/null
+++ b/tests/gpiod-test-sim.c
@@ -0,0 +1,303 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+#include <errno.h>
+#include <gpiosim.h>
+#include <stdlib.h>
+
+#include "gpiod-test-sim.h"
+
+struct _GPIOSimChip {
+	GObject parent_instance;
+	struct gpiosim_bank *bank;
+};
+
+enum {
+	G_GPIOSIM_CHIP_PROP_DEV_PATH = 1,
+	G_GPIOSIM_CHIP_PROP_NAME,
+	G_GPIOSIM_CHIP_PROP_NUM_LINES,
+	G_GPIOSIM_CHIP_PROP_LABEL,
+	G_GPIOSIM_CHIP_PROP_LINE_NAMES,
+	G_GPIOSIM_CHIP_PROP_HOGS,
+};
+
+static GOnce gpiosim_ctx_once = G_ONCE_INIT;
+static struct gpiosim_ctx *sim_ctx;
+
+G_DEFINE_TYPE(GPIOSimChip, g_gpiosim_chip, G_TYPE_OBJECT);
+
+static void g_gpiosim_ctx_unref(void)
+{
+	gpiosim_ctx_unref(sim_ctx);
+}
+
+static void *g_gpiosim_ctx_init(void *data G_GNUC_UNUSED)
+{
+	sim_ctx = gpiosim_ctx_new();
+	if (!sim_ctx)
+		g_error("Unable to initialize libgpiosim: %s",
+			g_strerror(errno));
+
+	atexit(g_gpiosim_ctx_unref);
+
+	return NULL;
+}
+
+static void g_gpiosim_chip_constructed(GObject *obj)
+{
+	GPIOSimChip *self = G_GPIOSIM_CHIP(obj);
+	struct gpiosim_dev *dev;
+	gint ret;
+
+	dev = gpiosim_bank_get_dev(self->bank);
+	ret = gpiosim_dev_enable(dev);
+	gpiosim_dev_unref(dev);
+	if (ret)
+		g_error("Error while trying to enable the simulated GPIO device: %s",
+			g_strerror(errno));
+}
+
+static void g_gpiosim_chip_get_property(GObject *obj, guint prop_id,
+					GValue *val, GParamSpec *pspec)
+{
+	GPIOSimChip *self = G_GPIOSIM_CHIP(obj);
+
+	switch (prop_id) {
+	case G_GPIOSIM_CHIP_PROP_DEV_PATH:
+		g_value_set_static_string(val,
+				gpiosim_bank_get_dev_path(self->bank));
+		break;
+	case G_GPIOSIM_CHIP_PROP_NAME:
+		g_value_set_static_string(val,
+				gpiosim_bank_get_chip_name(self->bank));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+		break;
+	}
+}
+
+static void g_gpiosim_chip_set_property(GObject *obj, guint prop_id,
+					const GValue *val, GParamSpec *pspec)
+{
+	GPIOSimChip *self = G_GPIOSIM_CHIP(obj);
+	gint ret, vdir, dir;
+	GVariantIter *iter;
+	GVariant *variant;
+	guint offset;
+	gchar *name;
+
+	switch (prop_id) {
+	case G_GPIOSIM_CHIP_PROP_NUM_LINES:
+		ret = gpiosim_bank_set_num_lines(self->bank,
+						 g_value_get_uint(val));
+		if (ret)
+			g_error("Unable to set the number of lines exposed by the simulated chip: %s",
+				g_strerror(errno));
+		break;
+	case G_GPIOSIM_CHIP_PROP_LABEL:
+		ret = gpiosim_bank_set_label(self->bank,
+					     g_value_get_string(val));
+		if (ret)
+			g_error("Unable to set the label of the simulated chip: %s",
+				g_strerror(errno));
+		break;
+	case G_GPIOSIM_CHIP_PROP_LINE_NAMES:
+		variant = g_value_get_variant(val);
+		if (!variant)
+			break;
+
+		iter = g_variant_iter_new(variant);
+
+		while (g_variant_iter_loop(iter, "(us)", &offset, &name)) {
+			ret = gpiosim_bank_set_line_name(self->bank,
+							 offset, name);
+			if (ret)
+				g_error("Unable to set the name of the simulated GPIO line: %s",
+					g_strerror(errno));
+		}
+
+		g_variant_iter_free(iter);
+		break;
+	case G_GPIOSIM_CHIP_PROP_HOGS:
+		variant = g_value_get_variant(val);
+		if (!variant)
+			break;
+
+		iter = g_variant_iter_new(variant);
+
+		while (g_variant_iter_loop(iter, "(usi)",
+					   &offset, &name, &vdir)) {
+			switch (vdir) {
+			case G_GPIOSIM_HOG_DIR_INPUT:
+				dir = GPIOSIM_HOG_DIR_INPUT;
+				break;
+			case G_GPIOSIM_HOG_DIR_OUTPUT_HIGH:
+				dir = GPIOSIM_HOG_DIR_OUTPUT_HIGH;
+				break;
+			case G_GPIOSIM_HOG_DIR_OUTPUT_LOW:
+				dir = GPIOSIM_HOG_DIR_OUTPUT_LOW;
+				break;
+			default:
+				g_error("Invalid hog direction value: %d",
+					vdir);
+			}
+
+			ret = gpiosim_bank_hog_line(self->bank,
+						    offset, name, dir);
+			if (ret)
+				g_error("Unable to hog the simulated GPIO line: %s",
+					g_strerror(errno));
+		}
+
+		g_variant_iter_free(iter);
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+		break;
+	}
+}
+
+static void g_gpiosim_chip_dispose(GObject *obj)
+{
+	GPIOSimChip *self = G_GPIOSIM_CHIP(obj);
+	struct gpiosim_dev *dev;
+	gint ret;
+
+	dev = gpiosim_bank_get_dev(self->bank);
+
+	if (gpiosim_dev_is_live(dev)) {
+		ret = gpiosim_dev_disable(dev);
+		if (ret)
+			g_error("Error while trying to disable the simulated GPIO device: %s",
+				g_strerror(errno));
+	}
+
+	gpiosim_dev_unref(dev);
+}
+
+static void g_gpiosim_chip_finalize(GObject *obj)
+{
+	GPIOSimChip *self = G_GPIOSIM_CHIP(obj);
+
+	gpiosim_bank_unref(self->bank);
+
+	G_OBJECT_CLASS(g_gpiosim_chip_parent_class)->finalize(obj);
+}
+
+static void g_gpiosim_chip_class_init(GPIOSimChipClass *chip_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(chip_class);
+
+	class->constructed = g_gpiosim_chip_constructed;
+	class->get_property = g_gpiosim_chip_get_property;
+	class->set_property = g_gpiosim_chip_set_property;
+	class->dispose = g_gpiosim_chip_dispose;
+	class->finalize = g_gpiosim_chip_finalize;
+
+	g_object_class_install_property(class, G_GPIOSIM_CHIP_PROP_DEV_PATH,
+		g_param_spec_string("dev-path", "Device path",
+			"Character device filesystem path.", NULL,
+			G_PARAM_READABLE));
+
+	g_object_class_install_property(class, G_GPIOSIM_CHIP_PROP_NAME,
+		g_param_spec_string("name", "Chip name",
+			"Name of this chip device as set by the kernel.", NULL,
+			G_PARAM_READABLE));
+
+	g_object_class_install_property(class, G_GPIOSIM_CHIP_PROP_NUM_LINES,
+		g_param_spec_uint("num-lines", "Number of lines",
+			"Number of lines this simulated chip exposes.",
+			1, G_MAXUINT, 1,
+			G_PARAM_WRITABLE | G_PARAM_CONSTRUCT_ONLY));
+
+	g_object_class_install_property(class, G_GPIOSIM_CHIP_PROP_LABEL,
+		g_param_spec_string("label", "Chip label",
+			"Label of this simulated chip.", NULL,
+			G_PARAM_WRITABLE | G_PARAM_CONSTRUCT_ONLY));
+
+	g_object_class_install_property(class, G_GPIOSIM_CHIP_PROP_LINE_NAMES,
+		g_param_spec_variant("line-names", "Line names",
+			"List of names of the lines exposed by this chip",
+			(GVariantType *)"a(us)", NULL,
+			G_PARAM_WRITABLE | G_PARAM_CONSTRUCT_ONLY));
+
+	g_object_class_install_property(class, G_GPIOSIM_CHIP_PROP_HOGS,
+		g_param_spec_variant("hogs", "Line hogs",
+			"List of hogged lines and their directions.",
+			(GVariantType *)"a(usi)", NULL,
+			G_PARAM_WRITABLE | G_PARAM_CONSTRUCT_ONLY));
+}
+
+static void g_gpiosim_chip_init(GPIOSimChip *self)
+{
+	struct gpiosim_dev *dev;
+
+	g_once(&gpiosim_ctx_once, g_gpiosim_ctx_init, NULL);
+
+	dev = gpiosim_dev_new(sim_ctx, NULL);
+	if (!dev)
+		g_error("Unable to instantiate new GPIO device: %s",
+			g_strerror(errno));
+
+	self->bank = gpiosim_bank_new(dev, NULL);
+	gpiosim_dev_unref(dev);
+	if (!self->bank)
+		g_error("Unable to instantiate new GPIO bank: %s",
+			g_strerror(errno));
+}
+
+static const gchar *
+g_gpiosim_chip_get_string_prop(GPIOSimChip *self, const gchar *prop)
+{
+	GValue val = G_VALUE_INIT;
+	const gchar *str;
+
+	g_object_get_property(G_OBJECT(self), prop, &val);
+	str = g_value_get_string(&val);
+	g_value_unset(&val);
+
+	return str;
+}
+
+const gchar *g_gpiosim_chip_get_dev_path(GPIOSimChip *self)
+{
+	return g_gpiosim_chip_get_string_prop(self, "dev-path");
+}
+
+const gchar *g_gpiosim_chip_get_name(GPIOSimChip *self)
+{
+	return g_gpiosim_chip_get_string_prop(self, "name");
+}
+
+gint g_gpiosim_chip_get_value(GPIOSimChip *chip, guint offset)
+{
+	gint val;
+
+	val = gpiosim_bank_get_value(chip->bank, offset);
+	if (val < 0)
+		g_error("Unable to read the line value: %s", g_strerror(errno));
+
+	return val;
+}
+
+void g_gpiosim_chip_set_pull(GPIOSimChip *chip, guint offset, GPIOSimPull pull)
+{
+	gint ret, sim_pull;
+
+	switch (pull) {
+	case G_GPIOSIM_PULL_DOWN:
+		sim_pull = GPIOSIM_PULL_DOWN;
+		break;
+	case G_GPIOSIM_PULL_UP:
+		sim_pull = GPIOSIM_PULL_UP;
+		break;
+	default:
+		g_error("invalid pull value");
+	}
+
+	ret = gpiosim_bank_set_pull(chip->bank, offset, sim_pull);
+	if (ret)
+		g_error("Unable to set the pull setting for simulated line: %s",
+			g_strerror(errno));
+}
diff --git a/tests/gpiod-test-sim.h b/tests/gpiod-test-sim.h
new file mode 100644
index 0000000..0cc2a0b
--- /dev/null
+++ b/tests/gpiod-test-sim.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+#ifndef __GPIOD_TEST_SIM_H__
+#define __GPIOD_TEST_SIM_H__
+
+#include <glib.h>
+#include <glib-object.h>
+
+G_BEGIN_DECLS
+
+typedef enum {
+	G_GPIOSIM_PULL_UP = 1,
+	G_GPIOSIM_PULL_DOWN,
+} GPIOSimPull;
+
+typedef enum {
+	G_GPIOSIM_HOG_DIR_INPUT = 1,
+	G_GPIOSIM_HOG_DIR_OUTPUT_HIGH,
+	G_GPIOSIM_HOG_DIR_OUTPUT_LOW,
+} GPIOSimHogDir;
+
+typedef struct _GPIOSimChip GPIOSimChip;
+
+G_DECLARE_FINAL_TYPE(GPIOSimChip, g_gpiosim_chip, G_GPIOSIM, CHIP, GObject);
+
+#define G_GPIOSIM_TYPE_CHIP (g_gpiosim_chip_get_type())
+#define G_GPIOSIM_CHIP(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), G_GPIOSIM_TYPE_CHIP, GPIOSimChip))
+
+#define g_gpiosim_chip_new(...) \
+	G_GPIOSIM_CHIP(g_object_new(G_GPIOSIM_TYPE_CHIP, __VA_ARGS__))
+
+const gchar *g_gpiosim_chip_get_dev_path(GPIOSimChip *self);
+const gchar *g_gpiosim_chip_get_name(GPIOSimChip *self);
+
+gint g_gpiosim_chip_get_value(GPIOSimChip *self, guint offset);
+void g_gpiosim_chip_set_pull(GPIOSimChip *self, guint offset, GPIOSimPull pull);
+
+G_END_DECLS
+
+#endif /* __GPIOD_TEST_SIM_H__ */
diff --git a/tests/gpiod-test.c b/tests/gpiod-test.c
index aa9eaa4..df546a1 100644
--- a/tests/gpiod-test.c
+++ b/tests/gpiod-test.c
@@ -2,8 +2,6 @@
 // SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <errno.h>
-#include <glib/gstdio.h>
-#include <gpiosim.h>
 #include <linux/version.h>
 #include <stdio.h>
 #include <sys/utsname.h>
@@ -12,28 +10,13 @@
 #include "gpiod-test.h"
 
 #define MIN_KERNEL_MAJOR	5
-#define MIN_KERNEL_MINOR	10
+#define MIN_KERNEL_MINOR	16
 #define MIN_KERNEL_RELEASE	0
 #define MIN_KERNEL_VERSION	KERNEL_VERSION(MIN_KERNEL_MAJOR, \
 					       MIN_KERNEL_MINOR, \
 					       MIN_KERNEL_RELEASE)
 
-struct gpiod_test_event_thread {
-	GThread *id;
-	GMutex lock;
-	GCond cond;
-	gboolean should_stop;
-	guint chip_index;
-	guint line_offset;
-	guint period_ms;
-};
-
-static struct {
-	GList *tests;
-	struct gpiosim_ctx *gpiosim;
-	GPtrArray *sim_chips;
-	GPtrArray *sim_banks;
-} globals;
+static GList *tests;
 
 static void check_kernel(void)
 {
@@ -63,103 +46,16 @@ static void check_kernel(void)
 	return;
 }
 
-static void remove_gpiosim_chip(gpointer data)
-{
-	struct gpiosim_dev *dev = data;
-	gint ret;
-
-	ret = gpiosim_dev_disable(dev);
-	if (ret)
-		g_error("unable to uncommit a simulated GPIO device: %s",
-			g_strerror(errno));
-
-	gpiosim_dev_unref(dev);
-}
-
-static void remove_gpiosim_bank(gpointer data)
-{
-	struct gpiosim_bank *bank = data;
-
-	gpiosim_bank_unref(bank);
-}
-
 static void test_func_wrapper(gconstpointer data)
 {
-	const _GpiodTestCase *test = data;
-	struct gpiosim_bank *sim_bank;
-	struct gpiosim_dev *sim_dev;
-	gchar *line_name, *label;
-	gchar chip_idx;
-	guint i, j;
-	gint ret;
-
-	globals.sim_chips = g_ptr_array_new_full(test->num_chips,
-						 remove_gpiosim_chip);
-	globals.sim_banks = g_ptr_array_new_full(test->num_chips,
-						 remove_gpiosim_bank);
-
-	for (i = 0; i < test->num_chips; i++) {
-		chip_idx = i + 65;
-
-		sim_dev = gpiosim_dev_new(globals.gpiosim, NULL);
-		if (!sim_dev)
-			g_error("unable to create a simulated GPIO chip: %s",
-				g_strerror(errno));
-
-		sim_bank = gpiosim_bank_new(sim_dev, NULL);
-		if (!sim_bank)
-			g_error("unable to create a simulated GPIO bank: %s",
-				g_strerror(errno));
-
-		label = g_strdup_printf("gpio-mockup-%c", chip_idx);
-		ret = gpiosim_bank_set_label(sim_bank, label);
-		g_free(label);
-		if (ret)
-			g_error("unable to set simulated chip label: %s",
-				g_strerror(errno));
-
-		ret = gpiosim_bank_set_num_lines(sim_bank, test->chip_sizes[i]);
-		if (ret)
-			g_error("unable to set the number of lines for a simulated chip: %s",
-				g_strerror(errno));
-
-		if (test->flags & GPIOD_TEST_FLAG_NAMED_LINES) {
-			for (j = 0; j < test->chip_sizes[i]; j++) {
-				line_name = g_strdup_printf("gpio-mockup-%c-%u",
-							    chip_idx, j);
-
-				ret = gpiosim_bank_set_line_name(sim_bank, j,
-								 line_name);
-				g_free(line_name);
-				if (ret)
-					g_error("unable to set the line names for a simulated bank: %s",
-						g_strerror(errno));
-			}
-		}
-
-		ret = gpiosim_dev_enable(sim_dev);
-		if (ret)
-			g_error("unable to commit the simulated GPIO device: %s",
-				g_strerror(errno));
-
-		g_ptr_array_add(globals.sim_chips, sim_dev);
-		g_ptr_array_add(globals.sim_banks, sim_bank);
-	}
+	const struct _gpiod_test_case *test = data;
 
 	test->func();
-
-	g_ptr_array_unref(globals.sim_banks);
-	g_ptr_array_unref(globals.sim_chips);
-}
-
-static void unref_gpiosim(void)
-{
-	gpiosim_ctx_unref(globals.gpiosim);
 }
 
 static void add_test_from_list(gpointer element, gpointer data G_GNUC_UNUSED)
 {
-	_GpiodTestCase *test = element;
+	struct _gpiod_test_case *test = element;
 
 	g_test_add_data_func(test->path, test, test_func_wrapper);
 }
@@ -170,128 +66,17 @@ int main(gint argc, gchar **argv)
 	g_test_set_nonfatal_assertions();
 
 	g_debug("running libgpiod test suite");
-	g_debug("%u tests registered", g_list_length(globals.tests));
-
-	/*
-	 * Setup libpiosim first so that it runs its own kernel version
-	 * check before we tell the user our local requirements are met as
-	 * well.
-	 */
-	globals.gpiosim = gpiosim_ctx_new();
-	if (!globals.gpiosim)
-		g_error("unable to initialize gpiosim library: %s",
-			g_strerror(errno));
-	atexit(unref_gpiosim);
+	g_debug("%u tests registered", g_list_length(tests));
 
 	check_kernel();
 
-	g_list_foreach(globals.tests, add_test_from_list, NULL);
-	g_list_free(globals.tests);
+	g_list_foreach(tests, add_test_from_list, NULL);
+	g_list_free(tests);
 
 	return g_test_run();
 }
 
-void _gpiod_test_register(_GpiodTestCase *test)
-{
-	globals.tests = g_list_append(globals.tests, test);
-}
-
-const gchar *gpiod_test_chip_path(guint idx)
-{
-	struct gpiosim_bank *bank = g_ptr_array_index(globals.sim_banks, idx);
-
-	return gpiosim_bank_get_dev_path(bank);
-}
-
-const gchar *gpiod_test_chip_name(guint idx)
-{
-	struct gpiosim_bank *bank = g_ptr_array_index(globals.sim_banks, idx);
-
-	return gpiosim_bank_get_chip_name(bank);
-}
-
-gint gpiod_test_chip_get_value(guint chip_index, guint line_offset)
-{
-	struct gpiosim_bank *bank = g_ptr_array_index(globals.sim_banks,
-						      chip_index);
-	gint ret;
-
-	ret = gpiosim_bank_get_value(bank, line_offset);
-	if (ret < 0)
-		g_error("unable to read line value from gpiosim: %s",
-			g_strerror(errno));
-
-	return ret;
-}
-
-void gpiod_test_chip_set_pull(guint chip_index, guint line_offset, gint pull)
-{
-	struct gpiosim_bank *bank = g_ptr_array_index(globals.sim_banks,
-						      chip_index);
-	gint ret;
-
-	ret = gpiosim_bank_set_pull(bank, line_offset,
-				    pull ? GPIOSIM_PULL_UP : GPIOSIM_PULL_DOWN);
-	if (ret)
-		g_error("unable to set line pull in gpiosim: %s",
-			g_strerror(errno));
-}
-
-static gpointer event_worker_func(gpointer data)
-{
-	GpiodTestEventThread *thread = data;
-	gboolean signalled;
-	gint64 end_time;
-	gint i;
-
-	for (i = 0;; i++) {
-		g_mutex_lock(&thread->lock);
-		if (thread->should_stop) {
-			g_mutex_unlock(&thread->lock);
-			break;
-		}
-
-		end_time = g_get_monotonic_time() + thread->period_ms * 1000;
-
-		signalled = g_cond_wait_until(&thread->cond,
-					      &thread->lock, end_time);
-		if (!signalled)
-			gpiod_test_chip_set_pull(thread->chip_index,
-						 thread->line_offset, i % 2);
-
-		g_mutex_unlock(&thread->lock);
-	}
-
-	return NULL;
-}
-
-GpiodTestEventThread *
-gpiod_test_start_event_thread(guint chip_index, guint line_offset, guint period_ms)
+void _gpiod_test_register(struct _gpiod_test_case *test)
 {
-	GpiodTestEventThread *thread = g_malloc0(sizeof(*thread));
-
-	g_mutex_init(&thread->lock);
-	g_cond_init(&thread->cond);
-
-	thread->chip_index = chip_index;
-	thread->line_offset = line_offset;
-	thread->period_ms = period_ms;
-
-	thread->id = g_thread_new("event-worker", event_worker_func, thread);
-
-	return thread;
-}
-
-void gpiod_test_stop_event_thread(GpiodTestEventThread *thread)
-{
-	g_mutex_lock(&thread->lock);
-	thread->should_stop = TRUE;
-	g_cond_broadcast(&thread->cond);
-	g_mutex_unlock(&thread->lock);
-
-	(void)g_thread_join(thread->id);
-
-	g_mutex_clear(&thread->lock);
-	g_cond_clear(&thread->cond);
-	g_free(thread);
+	tests = g_list_append(tests, test);
 }
diff --git a/tests/gpiod-test.h b/tests/gpiod-test.h
index 1f2a677..16c331a 100644
--- a/tests/gpiod-test.h
+++ b/tests/gpiod-test.h
@@ -13,86 +13,35 @@
 #define __GPIOD_TEST_H__
 
 #include <glib.h>
-#include <gpiod.h>
-
-/*
- * These typedefs are needed to make g_autoptr work - it doesn't accept
- * regular 'struct typename' syntax.
- */
-typedef struct gpiod_chip gpiod_chip_struct;
-typedef struct gpiod_line_bulk gpiod_line_bulk_struct;
-
-G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_chip_struct, gpiod_chip_unref);
-G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_line_bulk_struct, gpiod_line_bulk_free);
 
 /* These are private definitions and should not be used directly. */
+
 typedef void (*_gpiod_test_func)(void);
 
-typedef struct _gpiod_test_case _GpiodTestCase;
 struct _gpiod_test_case {
 	const gchar *path;
 	_gpiod_test_func func;
-
-	guint num_chips;
-	guint *chip_sizes;
-	gint flags;
 };
 
-void _gpiod_test_register(_GpiodTestCase *test);
+void _gpiod_test_register(struct _gpiod_test_case *test);
 
 #define _GPIOD_TEST_PATH(_name) \
 		"/gpiod/" GPIOD_TEST_GROUP "/" G_STRINGIFY(_name)
 
-enum {
-	/* Dummy lines for this test case should have names assigned. */
-	GPIOD_TEST_FLAG_NAMED_LINES = (1 << 0),
-};
-
 /*
- * Register a test case function. The last argument is the array of numbers
- * of lines per simulated chip.
+ * Register a test case function.
  */
-#define GPIOD_TEST_CASE(_name, _flags, ...)				\
-	static void _name(void);					\
-	static guint _##_name##_chip_sizes[] = __VA_ARGS__;		\
-	static _GpiodTestCase _##_name##_test_case = {			\
-		.path = _GPIOD_TEST_PATH(_name),			\
-		.func = _name,						\
-		.num_chips = G_N_ELEMENTS(_##_name##_chip_sizes),	\
-		.chip_sizes = _##_name##_chip_sizes,			\
-		.flags = _flags,					\
-	};								\
-	static __attribute__((constructor)) void			\
-	_##_name##_test_register(void)					\
-	{								\
-		_gpiod_test_register(&_##_name##_test_case);		\
-	}								\
-	static void _name(void)
-
-#define GPIOD_TEST_CONSUMER "gpiod-test"
-
-#define gpiod_test_return_if_failed()					\
-	do {								\
-		if (g_test_failed())					\
-			return;						\
-	} while (0)
-
-/* Wrappers around libgpiomockup helpers. */
-const gchar *gpiod_test_chip_path(guint idx);
-const gchar *gpiod_test_chip_name(guint idx);
-gint gpiod_test_chip_get_value(guint chip_index, guint line_offset);
-void gpiod_test_chip_set_pull(guint chip_index, guint line_offset, gint pull);
-
-/* Helpers for triggering line events in a separate thread. */
-struct gpiod_test_event_thread;
-typedef struct gpiod_test_event_thread GpiodTestEventThread;
-
-GpiodTestEventThread *
-gpiod_test_start_event_thread(guint chip_index,
-			      guint line_offset, guint period_ms);
-void gpiod_test_stop_event_thread(GpiodTestEventThread *thread);
-
-G_DEFINE_AUTOPTR_CLEANUP_FUNC(GpiodTestEventThread,
-			      gpiod_test_stop_event_thread);
+#define GPIOD_TEST_CASE(_name) \
+	static void _gpiod_test_func_##_name(void); \
+	static struct _gpiod_test_case _##_name##_test_case = { \
+		.path = _GPIOD_TEST_PATH(_name), \
+		.func = _gpiod_test_func_##_name, \
+	}; \
+	static __attribute__((constructor)) void \
+	_##_name##_test_register(void) \
+	{ \
+		_gpiod_test_register(&_##_name##_test_case); \
+	} \
+	static void _gpiod_test_func_##_name(void)
 
 #endif /* __GPIOD_TEST_H__ */
diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
index 1429b7e..9a8aefd 100644
--- a/tests/gpiosim/gpiosim.c
+++ b/tests/gpiosim/gpiosim.c
@@ -736,6 +736,7 @@ static void bank_release(struct refcount *ref)
 	unsigned int i;
 	char buf[64];
 
+	/* FIXME should be based on dirent because num_lines can change. */
 	for (i = 0; i < bank->num_lines; i++) {
 		snprintf(buf, sizeof(buf), "line%u/hog", i);
 		unlinkat(bank->cfs_dir_fd, buf, AT_REMOVEDIR);
diff --git a/tests/mockup/Makefile.am b/tests/mockup/Makefile.am
deleted file mode 100644
index 36cd397..0000000
--- a/tests/mockup/Makefile.am
+++ /dev/null
@@ -1,11 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-lib_LTLIBRARIES = libgpiomockup.la
-
-libgpiomockup_la_SOURCES = gpio-mockup.c gpio-mockup.h
-libgpiomockup_la_CFLAGS = -Wall -Wextra -g -fvisibility=hidden -std=gnu89
-libgpiomockup_la_CFLAGS += -include $(top_builddir)/config.h
-libgpiomockup_la_CFLAGS += $(KMOD_CFLAGS) $(UDEV_CFLAGS)
-libgpiomockup_la_LDFLAGS = -version-info $(subst .,:,$(ABI_MOCKUP_VERSION))
-libgpiomockup_la_LDFLAGS += $(KMOD_LIBS) $(UDEV_LIBS)
diff --git a/tests/mockup/gpio-mockup.c b/tests/mockup/gpio-mockup.c
deleted file mode 100644
index eba26d3..0000000
--- a/tests/mockup/gpio-mockup.c
+++ /dev/null
@@ -1,496 +0,0 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-#include <errno.h>
-#include <libkmod.h>
-#include <libudev.h>
-#include <linux/version.h>
-#include <poll.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <sys/utsname.h>
-#include <unistd.h>
-
-#include "gpio-mockup.h"
-
-#define EXPORT			__attribute__((visibility("default")))
-/*
- * The gpio-mockup features (including the debugfs interface) we're using
- * in this library have first been released in the linux kernel version below.
- */
-#define MIN_KERNEL_VERSION	KERNEL_VERSION(5, 10, 0)
-
-struct gpio_mockup_chip {
-	char *name;
-	char *path;
-	unsigned int num;
-};
-
-struct gpio_mockup {
-	struct gpio_mockup_chip **chips;
-	unsigned int num_chips;
-	struct kmod_ctx *kmod;
-	struct kmod_module *module;
-	int refcount;
-};
-
-static void free_chip(struct gpio_mockup_chip *chip)
-{
-	free(chip->name);
-	free(chip->path);
-	free(chip);
-}
-
-static bool check_kernel_version(void)
-{
-	unsigned int major, minor, release;
-	struct utsname un;
-	int rv;
-
-	rv = uname(&un);
-	if (rv)
-		return false;
-
-	rv = sscanf(un.release, "%u.%u.%u", &major, &minor, &release);
-	if (rv != 3) {
-		errno = EFAULT;
-		return false;
-	}
-
-	if (KERNEL_VERSION(major, minor, release) < MIN_KERNEL_VERSION) {
-		errno = EOPNOTSUPP;
-		return false;
-	}
-
-	return true;
-}
-
-EXPORT struct gpio_mockup *gpio_mockup_new(void)
-{
-	struct gpio_mockup *ctx;
-	const char *modpath;
-	int rv;
-
-	if (!check_kernel_version())
-		goto err_out;
-
-	ctx = malloc(sizeof(*ctx));
-	if (!ctx)
-		goto err_out;
-
-	memset(ctx, 0, sizeof(*ctx));
-	ctx->refcount = 1;
-
-	ctx->kmod = kmod_new(NULL, NULL);
-	if (!ctx->kmod)
-		goto err_free_kmod;
-
-	rv = kmod_module_new_from_name(ctx->kmod, "gpio-mockup", &ctx->module);
-	if (rv)
-		goto err_unref_module;
-
-	/* First see if we can find the module. */
-	modpath = kmod_module_get_path(ctx->module);
-	if (!modpath) {
-		errno = ENOENT;
-		goto err_unref_module;
-	}
-
-	/*
-	 * Then see if we can freely load and unload it. If it's already
-	 * loaded - no problem, we'll remove it next anyway.
-	 */
-	rv = kmod_module_probe_insert_module(ctx->module,
-					     KMOD_PROBE_IGNORE_LOADED,
-					     "gpio_mockup_ranges=-1,4",
-					     NULL, NULL, NULL);
-	if (rv)
-		goto err_unref_module;
-
-	/* We need to check that the gpio-mockup debugfs directory exists. */
-	rv = access("/sys/kernel/debug/gpio-mockup", R_OK | W_OK);
-	if (rv)
-		goto err_unref_module;
-
-	rv = kmod_module_remove_module(ctx->module, 0);
-	if (rv)
-		goto err_unref_module;
-
-	return ctx;
-
-err_unref_module:
-	kmod_unref(ctx->kmod);
-err_free_kmod:
-	free(ctx);
-err_out:
-	return NULL;
-}
-
-EXPORT void gpio_mockup_ref(struct gpio_mockup *ctx)
-{
-	ctx->refcount++;
-}
-
-EXPORT void gpio_mockup_unref(struct gpio_mockup *ctx)
-{
-	ctx->refcount--;
-
-	if (ctx->refcount == 0) {
-		if (ctx->chips)
-			gpio_mockup_remove(ctx);
-
-		kmod_module_unref(ctx->module);
-		kmod_unref(ctx->kmod);
-		free(ctx);
-	}
-}
-
-static char *make_module_param_string(unsigned int num_chips,
-				      const unsigned int *num_lines, int flags)
-{
-	char *params, *new;
-	unsigned int i;
-	int rv;
-
-	params = strdup("gpio_mockup_ranges=");
-	if (!params)
-		return NULL;
-
-	for (i = 0; i < num_chips; i++) {
-		rv = asprintf(&new, "%s-1,%u,", params, num_lines[i]);
-		free(params);
-		if (rv < 0)
-			return NULL;
-
-		params = new;
-	}
-	params[strlen(params) - 1] = '\0'; /* Remove the last comma. */
-
-	if (flags & GPIO_MOCKUP_FLAG_NAMED_LINES) {
-		rv = asprintf(&new, "%s gpio_mockup_named_lines", params);
-		free(params);
-		if (rv < 0)
-			return NULL;
-
-		params = new;
-	}
-
-	return params;
-}
-
-static bool devpath_is_mockup(const char *devpath)
-{
-	static const char mockup_devpath[] = "/devices/platform/gpio-mockup";
-
-	return !strncmp(devpath, mockup_devpath, sizeof(mockup_devpath) - 1);
-}
-
-static int chipcmp(const void *c1, const void *c2)
-{
-	const struct gpio_mockup_chip *chip1, *chip2;
-
-	chip1 = *(const struct gpio_mockup_chip **)c1;
-	chip2 = *(const struct gpio_mockup_chip **)c2;
-
-	return chip1->num > chip2->num;
-}
-
-static struct gpio_mockup_chip *make_chip(const char *sysname,
-					  const char *devnode)
-{
-	struct gpio_mockup_chip *chip;
-	int rv;
-
-	chip = malloc(sizeof(*chip));
-	if (!chip)
-		return NULL;
-
-	chip->name = strdup(sysname);
-	if (!chip->name) {
-		free(chip);
-		return NULL;
-	}
-
-	chip->path = strdup(devnode);
-	if (!chip->path) {
-		free(chip->name);
-		free(chip);
-		return NULL;
-	}
-
-	rv = sscanf(sysname, "gpiochip%u", &chip->num);
-	if (rv != 1) {
-		errno = EINVAL;
-		free(chip->path);
-		free(chip->name);
-		free(chip);
-		return NULL;
-	}
-
-	return chip;
-}
-
-EXPORT int gpio_mockup_probe(struct gpio_mockup *ctx, unsigned int num_chips,
-			     const unsigned int *chip_sizes, int flags)
-{
-	const char *devpath, *devnode, *sysname, *action;
-	struct gpio_mockup_chip *chip;
-	struct udev_monitor *monitor;
-	unsigned int i, detected = 0;
-	struct udev_device *dev;
-	struct udev *udev_ctx;
-	struct pollfd pfd;
-	char *params;
-	int rv;
-
-	if (ctx->chips) {
-		errno = EBUSY;
-		goto err_out;
-	}
-
-	if (num_chips < 1) {
-		errno = EINVAL;
-		goto err_out;
-	}
-
-	udev_ctx = udev_new();
-	if (!udev_ctx)
-		goto err_out;
-
-	monitor = udev_monitor_new_from_netlink(udev_ctx, "udev");
-	if (!monitor)
-		goto err_unref_udev;
-
-	rv = udev_monitor_filter_add_match_subsystem_devtype(monitor,
-							     "gpio", NULL);
-	if (rv < 0)
-		goto err_unref_monitor;
-
-	rv = udev_monitor_enable_receiving(monitor);
-	if (rv < 0)
-		goto err_unref_monitor;
-
-	params = make_module_param_string(num_chips, chip_sizes, flags);
-	if (!params)
-		goto err_unref_monitor;
-
-	rv = kmod_module_probe_insert_module(ctx->module,
-					     KMOD_PROBE_FAIL_ON_LOADED,
-					     params, NULL, NULL, NULL);
-	free(params);
-	if (rv)
-		goto err_unref_monitor;
-
-	ctx->chips = calloc(num_chips, sizeof(struct gpio_mockup_chip *));
-	if (!ctx->chips)
-		goto err_remove_module;
-
-	ctx->num_chips = num_chips;
-
-	pfd.fd = udev_monitor_get_fd(monitor);
-	pfd.events = POLLIN | POLLPRI;
-
-	while (num_chips > detected) {
-		rv = poll(&pfd, 1, 5000);
-		if (rv < 0) {
-			goto err_free_chips;
-		} if (rv == 0) {
-			errno = EAGAIN;
-			goto err_free_chips;
-		}
-
-		dev = udev_monitor_receive_device(monitor);
-		if (!dev)
-			goto err_free_chips;
-
-		devpath = udev_device_get_devpath(dev);
-		devnode = udev_device_get_devnode(dev);
-		sysname = udev_device_get_sysname(dev);
-		action = udev_device_get_action(dev);
-
-		if (!devpath || !devnode || !sysname ||
-		    !devpath_is_mockup(devpath) || strcmp(action, "add") != 0) {
-			udev_device_unref(dev);
-			continue;
-		}
-
-		chip = make_chip(sysname, devnode);
-		if (!chip)
-			goto err_free_chips;
-
-		ctx->chips[detected++] = chip;
-		udev_device_unref(dev);
-	}
-
-	udev_monitor_unref(monitor);
-	udev_unref(udev_ctx);
-
-	/*
-	 * We can't assume that the order in which the mockup gpiochip
-	 * devices are created will be deterministic, yet we want the
-	 * index passed to the test_chip_*() functions to correspond to the
-	 * order in which the chips were defined in the TEST_DEFINE()
-	 * macro.
-	 *
-	 * Once all gpiochips are there, sort them by chip number.
-	 */
-	qsort(ctx->chips, ctx->num_chips, sizeof(*ctx->chips), chipcmp);
-
-	return 0;
-
-err_free_chips:
-	for (i = 0; i < detected; i++)
-		free_chip(ctx->chips[i]);
-	free(ctx->chips);
-err_remove_module:
-	kmod_module_remove_module(ctx->module, 0);
-err_unref_monitor:
-	udev_monitor_unref(monitor);
-err_unref_udev:
-	udev_unref(udev_ctx);
-err_out:
-	return -1;
-}
-
-EXPORT int gpio_mockup_remove(struct gpio_mockup *ctx)
-{
-	unsigned int i;
-	int rv;
-
-	if (!ctx->chips) {
-		errno = ENODEV;
-		return -1;
-	}
-
-	rv = kmod_module_remove_module(ctx->module, 0);
-	if (rv)
-		return -1;
-
-	for (i = 0; i < ctx->num_chips; i++)
-		free_chip(ctx->chips[i]);
-	free(ctx->chips);
-	ctx->chips = NULL;
-	ctx->num_chips = 0;
-
-	return 0;
-}
-
-static bool index_valid(struct gpio_mockup *ctx, unsigned int idx)
-{
-	if (!ctx->chips) {
-		errno = ENODEV;
-		return false;
-	}
-
-	if (idx >= ctx->num_chips) {
-		errno = EINVAL;
-		return false;
-	}
-
-	return true;
-}
-
-EXPORT const char *
-gpio_mockup_chip_name(struct gpio_mockup *ctx, unsigned int idx)
-{
-	if (!index_valid(ctx, idx))
-		return NULL;
-
-	return ctx->chips[idx]->name;
-}
-
-EXPORT const char *
-gpio_mockup_chip_path(struct gpio_mockup *ctx, unsigned int idx)
-{
-	if (!index_valid(ctx, idx))
-		return NULL;
-
-	return ctx->chips[idx]->path;
-}
-
-EXPORT int gpio_mockup_chip_num(struct gpio_mockup *ctx, unsigned int idx)
-{
-	if (!index_valid(ctx, idx))
-		return -1;
-
-	return ctx->chips[idx]->num;
-}
-
-static int debugfs_open(unsigned int chip_num,
-			unsigned int line_offset, int flags)
-{
-	char *path;
-	int fd, rv;
-
-	rv = asprintf(&path, "/sys/kernel/debug/gpio-mockup/gpiochip%u/%u",
-		      chip_num, line_offset);
-	if (rv < 0)
-		return -1;
-
-	fd = open(path, flags);
-	free(path);
-
-	return fd;
-}
-
-EXPORT int gpio_mockup_get_value(struct gpio_mockup *ctx,
-				 unsigned int chip_idx,
-				 unsigned int line_offset)
-{
-	ssize_t rd;
-	char buf;
-	int fd;
-
-	if (!index_valid(ctx, chip_idx))
-		return -1;
-
-	fd = debugfs_open(ctx->chips[chip_idx]->num, line_offset, O_RDONLY);
-	if (fd < 0)
-		return fd;
-
-	rd = read(fd, &buf, 1);
-	close(fd);
-	if (rd < 0)
-		return rd;
-	if (rd != 1) {
-		errno = ENOTTY;
-		return -1;
-	}
-	if (buf != '0' && buf != '1') {
-		errno = EIO;
-		return -1;
-	}
-
-	return buf == '0' ? 0 : 1;
-}
-
-EXPORT int gpio_mockup_set_pull(struct gpio_mockup *ctx,
-				unsigned int chip_idx,
-				unsigned int line_offset, int pull)
-{
-	char buf[2];
-	ssize_t wr;
-	int fd;
-
-	if (!index_valid(ctx, chip_idx))
-		return -1;
-
-	fd = debugfs_open(ctx->chips[chip_idx]->num, line_offset, O_WRONLY);
-	if (fd < 0)
-		return fd;
-
-	buf[0] = pull ? '1' : '0';
-	buf[1] = '\n';
-
-	wr = write(fd, &buf, sizeof(buf));
-	close(fd);
-	if (wr < 0)
-		return wr;
-	if (wr != sizeof(buf)) {
-		errno = EAGAIN;
-		return -1;
-	}
-
-	return 0;
-}
diff --git a/tests/mockup/gpio-mockup.h b/tests/mockup/gpio-mockup.h
deleted file mode 100644
index 4a55032..0000000
--- a/tests/mockup/gpio-mockup.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* SPDX-License-Identifier: LGPL-2.1-or-later */
-/* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
-
-#ifndef __GPIO_MOCKUP_H__
-#define __GPIO_MOCKUP_H__
-
-#ifdef __cplusplus
-extern "C" {
-#endif
-
-struct gpio_mockup;
-
-#define GPIO_MOCKUP_FLAG_NAMED_LINES	(1 << 0)
-
-struct gpio_mockup *gpio_mockup_new(void);
-void gpio_mockup_ref(struct gpio_mockup *ctx);
-void gpio_mockup_unref(struct gpio_mockup *ctx);
-
-int gpio_mockup_probe(struct gpio_mockup *ctx, unsigned int num_chips,
-		      const unsigned int *chip_sizes, int flags);
-int gpio_mockup_remove(struct gpio_mockup *ctx);
-
-const char *gpio_mockup_chip_name(struct gpio_mockup *ctx, unsigned int idx);
-const char *gpio_mockup_chip_path(struct gpio_mockup *ctx, unsigned int idx);
-int gpio_mockup_chip_num(struct gpio_mockup *ctx, unsigned int idx);
-
-int gpio_mockup_get_value(struct gpio_mockup *ctx,
-			  unsigned int chip_idx, unsigned int line_offset);
-int gpio_mockup_set_pull(struct gpio_mockup *ctx, unsigned int chip_idx,
-			 unsigned int line_offset, int pull);
-
-#ifdef __cplusplus
-} /* extern "C" */
-#endif
-
-#endif /* __GPIO_MOCKUP_H__ */
diff --git a/tests/tests-chip.c b/tests/tests-chip.c
index 46fb8d2..09906e3 100644
--- a/tests/tests-chip.c
+++ b/tests/tests-chip.c
@@ -2,229 +2,171 @@
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <errno.h>
+#include <glib.h>
+#include <gpiod.h>
 
 #include "gpiod-test.h"
+#include "gpiod-test-helpers.h"
+#include "gpiod-test-sim.h"
 
 #define GPIOD_TEST_GROUP "chip"
 
-GPIOD_TEST_CASE(is_gpiochip_good, 0, { 8 })
+GPIOD_TEST_CASE(open_chip_good)
 {
-	g_assert_true(gpiod_is_gpiochip_device(gpiod_test_chip_path(0)));
-}
-
-GPIOD_TEST_CASE(is_gpiochip_bad, 0, { 8 })
-{
-	g_assert_false(gpiod_is_gpiochip_device("/dev/null"));
-}
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
 
-GPIOD_TEST_CASE(is_gpiochip_nonexistent, 0, { 8 })
-{
-	g_assert_false(gpiod_is_gpiochip_device("/dev/nonexistent_gpiochip"));
+	chip = gpiod_chip_open(g_gpiosim_chip_get_dev_path(sim));
+	g_assert_nonnull(chip);
 }
 
-GPIOD_TEST_CASE(open_good, 0, { 8 })
+GPIOD_TEST_CASE(open_chip_nonexistent)
 {
-	g_autoptr(gpiod_chip_struct) chip = NULL;
+	g_autoptr(struct_gpiod_chip) chip = NULL;
 
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
+	chip = gpiod_chip_open("/dev/nonexistent");
+	g_assert_null(chip);
+	gpiod_test_expect_errno(ENOENT);
 }
 
-GPIOD_TEST_CASE(open_nonexistent, 0, { 8 })
+GPIOD_TEST_CASE(open_chip_not_a_character_device)
 {
-	struct gpiod_chip *chip;
+	g_autoptr(struct_gpiod_chip) chip = NULL;
 
-	chip = gpiod_chip_open("/dev/nonexistent_gpiochip");
+	chip = gpiod_chip_open("/tmp");
 	g_assert_null(chip);
-	g_assert_cmpint(errno, ==, ENOENT);
+	gpiod_test_expect_errno(ENOTTY);
 }
 
-GPIOD_TEST_CASE(open_notty, 0, { 8 })
+GPIOD_TEST_CASE(open_chip_not_a_gpio_device)
 {
-	struct gpiod_chip *chip;
+	g_autoptr(struct_gpiod_chip) chip = NULL;
 
 	chip = gpiod_chip_open("/dev/null");
 	g_assert_null(chip);
-	g_assert_cmpint(errno, ==, ENOTTY);
+	gpiod_test_expect_errno(ENODEV);
 }
 
-GPIOD_TEST_CASE(get_name, 0, { 8, 8, 8})
+GPIOD_TEST_CASE(get_chip_name)
 {
-	g_autoptr(gpiod_chip_struct) chip0 = NULL;
-	g_autoptr(gpiod_chip_struct) chip1 = NULL;
-	g_autoptr(gpiod_chip_struct) chip2 = NULL;
-
-	chip0 = gpiod_chip_open(gpiod_test_chip_path(0));
-	chip1 = gpiod_chip_open(gpiod_test_chip_path(1));
-	chip2 = gpiod_chip_open(gpiod_test_chip_path(2));
-
-	g_assert_nonnull(chip0);
-	g_assert_nonnull(chip1);
-	g_assert_nonnull(chip2);
-	gpiod_test_return_if_failed();
-
-	g_assert_cmpstr(gpiod_chip_get_name(chip0), ==,
-			gpiod_test_chip_name(0));
-	g_assert_cmpstr(gpiod_chip_get_name(chip1), ==,
-			gpiod_test_chip_name(1));
-	g_assert_cmpstr(gpiod_chip_get_name(chip2), ==,
-			gpiod_test_chip_name(2));
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+
+	g_assert_cmpstr(gpiod_chip_get_name(chip), ==,
+			g_gpiosim_chip_get_name(sim));
 }
 
-GPIOD_TEST_CASE(get_label, 0, { 8, 8, 8})
+GPIOD_TEST_CASE(get_chip_label)
 {
-	g_autoptr(gpiod_chip_struct) chip0 = NULL;
-	g_autoptr(gpiod_chip_struct) chip1 = NULL;
-	g_autoptr(gpiod_chip_struct) chip2 = NULL;
-
-	chip0 = gpiod_chip_open(gpiod_test_chip_path(0));
-	chip1 = gpiod_chip_open(gpiod_test_chip_path(1));
-	chip2 = gpiod_chip_open(gpiod_test_chip_path(2));
-
-	g_assert_nonnull(chip0);
-	g_assert_nonnull(chip1);
-	g_assert_nonnull(chip2);
-	gpiod_test_return_if_failed();
-
-	g_assert_cmpstr(gpiod_chip_get_label(chip0), ==, "gpio-mockup-A");
-	g_assert_cmpstr(gpiod_chip_get_label(chip1), ==, "gpio-mockup-B");
-	g_assert_cmpstr(gpiod_chip_get_label(chip2), ==, "gpio-mockup-C");
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("label", "foobar",
+							NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+
+	g_assert_cmpstr(gpiod_chip_get_label(chip), ==, "foobar");
 }
 
-GPIOD_TEST_CASE(num_lines, 0, { 1, 4, 8, 16, 32 })
+GPIOD_TEST_CASE(get_chip_path)
 {
-	g_autoptr(gpiod_chip_struct) chip0 = NULL;
-	g_autoptr(gpiod_chip_struct) chip1 = NULL;
-	g_autoptr(gpiod_chip_struct) chip2 = NULL;
-	g_autoptr(gpiod_chip_struct) chip3 = NULL;
-	g_autoptr(gpiod_chip_struct) chip4 = NULL;
-
-	chip0 = gpiod_chip_open(gpiod_test_chip_path(0));
-	chip1 = gpiod_chip_open(gpiod_test_chip_path(1));
-	chip2 = gpiod_chip_open(gpiod_test_chip_path(2));
-	chip3 = gpiod_chip_open(gpiod_test_chip_path(3));
-	chip4 = gpiod_chip_open(gpiod_test_chip_path(4));
-
-	g_assert_nonnull(chip0);
-	g_assert_nonnull(chip1);
-	g_assert_nonnull(chip2);
-	g_assert_nonnull(chip3);
-	g_assert_nonnull(chip4);
-	gpiod_test_return_if_failed();
-
-	g_assert_cmpuint(gpiod_chip_get_num_lines(chip0), ==, 1);
-	g_assert_cmpuint(gpiod_chip_get_num_lines(chip1), ==, 4);
-	g_assert_cmpuint(gpiod_chip_get_num_lines(chip2), ==, 8);
-	g_assert_cmpuint(gpiod_chip_get_num_lines(chip3), ==, 16);
-	g_assert_cmpuint(gpiod_chip_get_num_lines(chip4), ==, 32);
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	const gchar *path = g_gpiosim_chip_get_dev_path(sim);
+
+	chip = gpiod_test_open_chip_or_fail(path);
+
+	g_assert_cmpstr(gpiod_chip_get_path(chip), ==, path);
 }
 
-GPIOD_TEST_CASE(get_line, 0, { 16 })
+GPIOD_TEST_CASE(get_num_lines)
 {
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 16, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
 
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
 
-	line = gpiod_chip_get_line(chip, 3);
-	g_assert_nonnull(line);
-	g_assert_cmpuint(gpiod_line_offset(line), ==, 3);
+	g_assert_cmpuint(gpiod_chip_get_num_lines(chip), ==, 16);
 }
 
-GPIOD_TEST_CASE(get_lines, 0, { 16 })
+GPIOD_TEST_CASE(get_fd)
 {
-	struct gpiod_line *line0, *line1, *line2, *line3;
-	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	guint offsets[4];
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
 
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	offsets[0] = 1;
-	offsets[1] = 3;
-	offsets[2] = 4;
-	offsets[3] = 7;
-
-	bulk = gpiod_chip_get_lines(chip, offsets, 4);
-	g_assert_nonnull(bulk);
-	gpiod_test_return_if_failed();
-	g_assert_cmpuint(gpiod_line_bulk_num_lines(bulk), ==, 4);
-	gpiod_test_return_if_failed();
-
-	line0 = gpiod_line_bulk_get_line(bulk, 0);
-	line1 = gpiod_line_bulk_get_line(bulk, 1);
-	line2 = gpiod_line_bulk_get_line(bulk, 2);
-	line3 = gpiod_line_bulk_get_line(bulk, 3);
-
-	g_assert_cmpuint(gpiod_line_offset(line0), ==, 1);
-	g_assert_cmpuint(gpiod_line_offset(line1), ==, 3);
-	g_assert_cmpuint(gpiod_line_offset(line2), ==, 4);
-	g_assert_cmpuint(gpiod_line_offset(line3), ==, 7);
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+
+	g_assert_cmpint(gpiod_chip_get_fd(chip), >=, 0);
 }
 
-GPIOD_TEST_CASE(get_all_lines, 0, { 4 })
+GPIOD_TEST_CASE(find_line_bad)
 {
-	struct gpiod_line *line0, *line1, *line2, *line3;
-	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	bulk = gpiod_chip_get_all_lines(chip);
-	g_assert_nonnull(bulk);
-	gpiod_test_return_if_failed();
-	g_assert_cmpuint(gpiod_line_bulk_num_lines(bulk), ==, 4);
-	gpiod_test_return_if_failed();
-
-	line0 = gpiod_line_bulk_get_line(bulk, 0);
-	line1 = gpiod_line_bulk_get_line(bulk, 1);
-	line2 = gpiod_line_bulk_get_line(bulk, 2);
-	line3 = gpiod_line_bulk_get_line(bulk, 3);
-
-	g_assert_cmpuint(gpiod_line_offset(line0), ==, 0);
-	g_assert_cmpuint(gpiod_line_offset(line1), ==, 1);
-	g_assert_cmpuint(gpiod_line_offset(line2), ==, 2);
-	g_assert_cmpuint(gpiod_line_offset(line3), ==, 3);
+	static const struct gpiod_test_line_name names[] = {
+		{ .offset = 1, .name = "foo", },
+		{ .offset = 2, .name = "bar", },
+		{ .offset = 4, .name = "baz", },
+		{ .offset = 5, .name = "xyz", },
+		{ }
+	};
+
+	g_autoptr(GPIOSimChip) sim = NULL;
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+
+	sim = g_gpiosim_chip_new(
+			"num-lines", 8,
+			"line-names", gpiod_test_package_line_names(names),
+			 NULL);
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+
+	g_assert_cmpint(gpiod_chip_find_line(chip, "nonexistent"), ==, -1);
+	gpiod_test_expect_errno(ENOENT);
 }
 
-GPIOD_TEST_CASE(find_line_good, GPIOD_TEST_FLAG_NAMED_LINES, { 8, 8, 8 })
+GPIOD_TEST_CASE(find_line_good)
 {
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	int offset;
+	static const struct gpiod_test_line_name names[] = {
+		{ .offset = 1, .name = "foo", },
+		{ .offset = 2, .name = "bar", },
+		{ .offset = 4, .name = "baz", },
+		{ .offset = 5, .name = "xyz", },
+		{ }
+	};
 
-	chip = gpiod_chip_open(gpiod_test_chip_path(1));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
+	g_autoptr(GPIOSimChip) sim = NULL;
+	g_autoptr(struct_gpiod_chip) chip = NULL;
 
-	offset = gpiod_chip_find_line(chip, "gpio-mockup-B-4");
-	g_assert_cmpint(offset, ==, 4);
-	gpiod_test_return_if_failed();
+	sim = g_gpiosim_chip_new(
+			"num-lines", 8,
+			"line-names", gpiod_test_package_line_names(names),
+			NULL);
 
-	line = gpiod_chip_get_line(chip, 4);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
 
-	g_assert_cmpstr(gpiod_line_name(line), ==, "gpio-mockup-B-4");
+	g_assert_cmpint(gpiod_chip_find_line(chip, "baz"), ==, 4);
 }
 
-GPIOD_TEST_CASE(find_line_unique_not_found,
-		GPIOD_TEST_FLAG_NAMED_LINES, { 8, 8, 8 })
+/* Verify that for duplicated line names, the first one is returned. */
+GPIOD_TEST_CASE(find_line_duplicate)
 {
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	int offset;
+	static const struct gpiod_test_line_name names[] = {
+		{ .offset = 1, .name = "foo", },
+		{ .offset = 2, .name = "baz", },
+		{ .offset = 4, .name = "baz", },
+		{ .offset = 5, .name = "xyz", },
+		{ }
+	};
 
-	chip = gpiod_chip_open(gpiod_test_chip_path(1));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
+	g_autoptr(GPIOSimChip) sim = NULL;
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+
+	sim = g_gpiosim_chip_new(
+			"num-lines", 8,
+			"line-names", gpiod_test_package_line_names(names),
+			NULL);
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
 
-	offset = gpiod_chip_find_line(chip, "nonexistent");
-	g_assert_cmpint(offset, ==, -1);
-	g_assert_cmpint(errno, ==, ENOENT);
+	g_assert_cmpint(gpiod_chip_find_line(chip, "baz"), ==, 2);
 }
diff --git a/tests/tests-edge-event.c b/tests/tests-edge-event.c
new file mode 100644
index 0000000..8e3fb62
--- /dev/null
+++ b/tests/tests-edge-event.c
@@ -0,0 +1,420 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+#include <glib.h>
+#include <gpiod.h>
+
+#include "gpiod-test.h"
+#include "gpiod-test-helpers.h"
+#include "gpiod-test-sim.h"
+
+#define GPIOD_TEST_GROUP "edge-event"
+
+GPIOD_TEST_CASE(edge_event_buffer_capacity)
+{
+	g_autoptr(struct_gpiod_edge_event_buffer) buffer = NULL;
+
+	buffer = gpiod_test_create_edge_event_buffer_or_fail(32);
+
+	g_assert_cmpuint(gpiod_edge_event_buffer_get_capacity(buffer), ==, 32);
+}
+
+GPIOD_TEST_CASE(edge_event_buffer_max_capacity)
+{
+	g_autoptr(struct_gpiod_edge_event_buffer) buffer = NULL;
+
+	buffer = gpiod_test_create_edge_event_buffer_or_fail(16 * 64 * 2);
+
+	g_assert_cmpuint(gpiod_edge_event_buffer_get_capacity(buffer),
+			 ==, 16 * 64);
+}
+
+GPIOD_TEST_CASE(edge_event_wait_timeout)
+{
+	static const guint offset = 4;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+	gpiod_line_config_set_edge_detection_default(line_cfg,
+						     GPIOD_LINE_EDGE_BOTH);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	ret = gpiod_line_request_edge_event_wait(request, 1000000);
+	g_assert_cmpint(ret, ==, 0);
+}
+
+GPIOD_TEST_CASE(cannot_request_lines_in_output_mode_with_edge_detection)
+{
+	static const guint offset = 4;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+	gpiod_line_config_set_edge_detection_default(line_cfg,
+						     GPIOD_LINE_EDGE_BOTH);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_OUTPUT);
+
+	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	g_assert_null(request);
+	gpiod_test_expect_errno(EINVAL);
+}
+
+static gpointer falling_and_rising_edge_events(gpointer data)
+{
+	GPIOSimChip *sim = data;
+
+	g_usleep(50);
+
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
+
+	g_usleep(50);
+
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_DOWN);
+
+	return NULL;
+}
+
+GPIOD_TEST_CASE(read_both_events)
+{
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(GThread) thread = NULL;
+	g_autoptr(struct_gpiod_edge_event_buffer) buffer = NULL;
+	struct gpiod_edge_event *event;
+	guint64 ts_rising, ts_falling;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
+
+	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_config_set_edge_detection_default(line_cfg,
+						     GPIOD_LINE_EDGE_BOTH);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	thread = g_thread_new("request-release",
+			      falling_and_rising_edge_events, sim);
+	g_thread_ref(thread);
+
+	/* First event. */
+
+	ret = gpiod_line_request_edge_event_wait(request, 1000000000);
+	g_assert_cmpint(ret, >, 0);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	ret = gpiod_line_request_edge_event_read(request, buffer, 1);
+	g_assert_cmpint(ret, ==, 1);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpuint(gpiod_edge_event_buffer_get_num_events(buffer), ==, 1);
+	event = gpiod_edge_event_buffer_get_event(buffer, 0);
+	g_assert_nonnull(event);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
+			==, GPIOD_EDGE_EVENT_RISING_EDGE);
+	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
+	ts_rising = gpiod_edge_event_get_timestamp(event);
+
+	/* Second event. */
+
+	ret = gpiod_line_request_edge_event_wait(request, 1000000000);
+	g_assert_cmpint(ret, >, 0);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	ret = gpiod_line_request_edge_event_read(request, buffer, 1);
+	g_assert_cmpint(ret, ==, 1);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpuint(gpiod_edge_event_buffer_get_num_events(buffer), ==, 1);
+	event = gpiod_edge_event_buffer_get_event(buffer, 0);
+	g_assert_nonnull(event);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
+			==, GPIOD_EDGE_EVENT_FALLING_EDGE);
+	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
+	ts_falling = gpiod_edge_event_get_timestamp(event);
+
+	g_thread_join(thread);
+
+	g_assert_cmpuint(ts_falling, >, ts_rising);
+}
+
+GPIOD_TEST_CASE(read_rising_edge_event)
+{
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(GThread) thread = NULL;
+	g_autoptr(struct_gpiod_edge_event_buffer) buffer = NULL;
+	struct gpiod_edge_event *event;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
+
+	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_config_set_edge_detection_default(line_cfg,
+						     GPIOD_LINE_EDGE_RISING);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	thread = g_thread_new("request-release",
+			      falling_and_rising_edge_events, sim);
+	g_thread_ref(thread);
+
+	/* First event. */
+
+	ret = gpiod_line_request_edge_event_wait(request, 1000000000);
+	g_assert_cmpint(ret, >, 0);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	ret = gpiod_line_request_edge_event_read(request, buffer, 1);
+	g_assert_cmpint(ret, ==, 1);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpuint(gpiod_edge_event_buffer_get_num_events(buffer), ==, 1);
+	event = gpiod_edge_event_buffer_get_event(buffer, 0);
+	g_assert_nonnull(event);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
+			==, GPIOD_EDGE_EVENT_RISING_EDGE);
+	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
+
+	/* Second event. */
+
+	ret = gpiod_line_request_edge_event_wait(request, 1000000);
+	g_assert_cmpint(ret, ==, 0); /* Time-out. */
+
+	g_thread_join(thread);
+}
+
+GPIOD_TEST_CASE(read_falling_edge_event)
+{
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(GThread) thread = NULL;
+	g_autoptr(struct_gpiod_edge_event_buffer) buffer = NULL;
+	struct gpiod_edge_event *event;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
+
+	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_config_set_edge_detection_default(line_cfg,
+						     GPIOD_LINE_EDGE_FALLING);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	thread = g_thread_new("request-release",
+			      falling_and_rising_edge_events, sim);
+	g_thread_ref(thread);
+
+	/* First event is the second generated. */
+
+	ret = gpiod_line_request_edge_event_wait(request, 1000000000);
+	g_assert_cmpint(ret, >, 0);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	ret = gpiod_line_request_edge_event_read(request, buffer, 1);
+	g_assert_cmpint(ret, ==, 1);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpuint(gpiod_edge_event_buffer_get_num_events(buffer), ==, 1);
+	event = gpiod_edge_event_buffer_get_event(buffer, 0);
+	g_assert_nonnull(event);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
+			==, GPIOD_EDGE_EVENT_FALLING_EDGE);
+	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
+
+	/* No more events. */
+
+	ret = gpiod_line_request_edge_event_wait(request, 1000000);
+	g_assert_cmpint(ret, ==, 0); /* Time-out. */
+
+	g_thread_join(thread);
+}
+
+static gpointer rising_edge_events_on_two_offsets(gpointer data)
+{
+	GPIOSimChip *sim = data;
+
+	g_usleep(50);
+
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
+
+	g_usleep(50);
+
+	g_gpiosim_chip_set_pull(sim, 3, G_GPIOSIM_PULL_UP);
+
+	return NULL;
+}
+
+GPIOD_TEST_CASE(seqno)
+{
+	static const guint offsets[] = { 2, 3 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(GThread) thread = NULL;
+	g_autoptr(struct_gpiod_edge_event_buffer) buffer = NULL;
+	struct gpiod_edge_event *event;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
+
+	gpiod_request_config_set_offsets(req_cfg, 2, offsets);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_config_set_edge_detection_default(line_cfg,
+						     GPIOD_LINE_EDGE_BOTH);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	thread = g_thread_new("request-release",
+			      rising_edge_events_on_two_offsets, sim);
+	g_thread_ref(thread);
+
+	/* First event. */
+
+	ret = gpiod_line_request_edge_event_wait(request, 1000000000);
+	g_assert_cmpint(ret, >, 0);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	ret = gpiod_line_request_edge_event_read(request, buffer, 1);
+	g_assert_cmpint(ret, ==, 1);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpuint(gpiod_edge_event_buffer_get_num_events(buffer), ==, 1);
+	event = gpiod_edge_event_buffer_get_event(buffer, 0);
+	g_assert_nonnull(event);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
+	g_assert_cmpuint(gpiod_edge_event_get_global_seqno(event), ==, 1);
+	g_assert_cmpuint(gpiod_edge_event_get_line_seqno(event), ==, 1);
+
+	/* Second event. */
+
+	ret = gpiod_line_request_edge_event_wait(request, 1000000000);
+	g_assert_cmpint(ret, >, 0);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	ret = gpiod_line_request_edge_event_read(request, buffer, 1);
+	g_assert_cmpint(ret, ==, 1);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpuint(gpiod_edge_event_buffer_get_num_events(buffer), ==, 1);
+	event = gpiod_edge_event_buffer_get_event(buffer, 0);
+	g_assert_nonnull(event);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 3);
+	g_assert_cmpuint(gpiod_edge_event_get_global_seqno(event), ==, 2);
+	g_assert_cmpuint(gpiod_edge_event_get_line_seqno(event), ==, 1);
+}
+
+GPIOD_TEST_CASE(event_copy)
+{
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(GThread) thread = NULL;
+	g_autoptr(struct_gpiod_edge_event_buffer) buffer = NULL;
+	g_autoptr(struct_gpiod_edge_event) copy = NULL;
+	struct gpiod_edge_event *event;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
+
+	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_config_set_edge_detection_default(line_cfg,
+						     GPIOD_LINE_EDGE_BOTH);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
+
+	ret = gpiod_line_request_edge_event_wait(request, 1000000000);
+	g_assert_cmpint(ret, >, 0);
+	gpiod_test_return_if_failed();
+
+	ret = gpiod_line_request_edge_event_read(request, buffer, 1);
+	g_assert_cmpint(ret, ==, 1);
+	gpiod_test_return_if_failed();
+
+	event = gpiod_edge_event_buffer_get_event(buffer, 0);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	copy = gpiod_edge_event_copy(event);
+	g_assert_nonnull(copy);
+	g_assert_true(copy != event);
+}
diff --git a/tests/tests-event.c b/tests/tests-event.c
deleted file mode 100644
index 53d3e8c..0000000
--- a/tests/tests-event.c
+++ /dev/null
@@ -1,908 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-#include <errno.h>
-#include <unistd.h>
-
-#include "gpiod-test.h"
-
-#define GPIOD_TEST_GROUP "event"
-
-GPIOD_TEST_CASE(rising_edge_good, 0, { 8 })
-{
-	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 7);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_rising_edge_events(line, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
-}
-
-GPIOD_TEST_CASE(falling_edge_good, 0, { 8 })
-{
-	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 7);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_falling_edge_events(line,
-						     GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
-}
-
-GPIOD_TEST_CASE(rising_edge_ignore_falling, 0, { 8 })
-{
-	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev[3];
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 7);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_rising_edge_events(line, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-	ret = gpiod_line_event_read(line, &ev[0]);
-	g_assert_cmpint(ret, ==, 0);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-	ret = gpiod_line_event_read(line, &ev[1]);
-	g_assert_cmpint(ret, ==, 0);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-	ret = gpiod_line_event_read(line, &ev[2]);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev[0].event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
-	g_assert_cmpint(ev[1].event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
-	g_assert_cmpint(ev[2].event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
-}
-
-GPIOD_TEST_CASE(both_edges, 0, { 8 })
-{
-	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 7);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_both_edges_events(line, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
-}
-
-GPIOD_TEST_CASE(both_edges_active_low, 0, { 8 })
-{
-	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 7);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_both_edges_events_flags(line,
-		GPIOD_TEST_CONSUMER, GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
-}
-
-GPIOD_TEST_CASE(both_edges_bias_disable, 0, { 8 })
-{
-	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 7);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_both_edges_events_flags(line,
-		GPIOD_TEST_CONSUMER, GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
-}
-
-GPIOD_TEST_CASE(both_edges_bias_pull_down, 0, { 8 })
-{
-	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 7);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_both_edges_events_flags(line,
-		GPIOD_TEST_CONSUMER, GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
-}
-
-GPIOD_TEST_CASE(both_edges_bias_pull_up, 0, { 8 })
-{
-	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 7);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_both_edges_events_flags(line,
-		GPIOD_TEST_CONSUMER, GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
-}
-
-GPIOD_TEST_CASE(falling_edge_active_low, 0, { 8 })
-{
-	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 7);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_falling_edge_events_flags(line,
-		GPIOD_TEST_CONSUMER, GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
-}
-
-GPIOD_TEST_CASE(get_value, 0, { 8 })
-{
-	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 7);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	gpiod_test_chip_set_pull(0, 7, 1);
-
-	ret = gpiod_line_request_falling_edge_events(line, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_get_value(line);
-	g_assert_cmpint(ret, ==, 1);
-
-	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
-}
-
-GPIOD_TEST_CASE(get_value_active_low, 0, { 8 })
-{
-	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 7);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	gpiod_test_chip_set_pull(0, 7, 1);
-
-	ret = gpiod_line_request_falling_edge_events_flags(line,
-		GPIOD_TEST_CONSUMER, GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_get_value(line);
-	g_assert_cmpint(ret, ==, 0);
-
-	ev_thread = gpiod_test_start_event_thread(0, 7, 100);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
-}
-
-GPIOD_TEST_CASE(get_values, 0, { 8 })
-{
-	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	gint i, ret, vals[8];
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	bulk = gpiod_line_bulk_new(8);
-	g_assert_nonnull(bulk);
-	gpiod_test_return_if_failed();
-
-	for (i = 0; i < 8; i++) {
-		line = gpiod_chip_get_line(chip, i);
-		g_assert_nonnull(line);
-		gpiod_test_return_if_failed();
-
-		gpiod_line_bulk_add_line(bulk, line);
-		gpiod_test_chip_set_pull(0, i, 1);
-	}
-
-	ret = gpiod_line_request_bulk_rising_edge_events(bulk,
-							 GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	memset(vals, 0, sizeof(vals));
-	ret = gpiod_line_get_value_bulk(bulk, vals);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(vals[0], ==, 1);
-	g_assert_cmpint(vals[1], ==, 1);
-	g_assert_cmpint(vals[2], ==, 1);
-	g_assert_cmpint(vals[3], ==, 1);
-	g_assert_cmpint(vals[4], ==, 1);
-	g_assert_cmpint(vals[5], ==, 1);
-	g_assert_cmpint(vals[6], ==, 1);
-	g_assert_cmpint(vals[7], ==, 1);
-
-	gpiod_test_chip_set_pull(0, 1, 0);
-	gpiod_test_chip_set_pull(0, 3, 0);
-	gpiod_test_chip_set_pull(0, 4, 0);
-	gpiod_test_chip_set_pull(0, 7, 0);
-
-	memset(vals, 0, sizeof(vals));
-	ret = gpiod_line_get_value_bulk(bulk, vals);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(vals[0], ==, 1);
-	g_assert_cmpint(vals[1], ==, 0);
-	g_assert_cmpint(vals[2], ==, 1);
-	g_assert_cmpint(vals[3], ==, 0);
-	g_assert_cmpint(vals[4], ==, 0);
-	g_assert_cmpint(vals[5], ==, 1);
-	g_assert_cmpint(vals[6], ==, 1);
-	g_assert_cmpint(vals[7], ==, 0);
-}
-
-GPIOD_TEST_CASE(get_values_active_low, 0, { 8 })
-{
-	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	gint i, ret, vals[8];
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	bulk = gpiod_line_bulk_new(8);
-	g_assert_nonnull(bulk);
-	gpiod_test_return_if_failed();
-
-	for (i = 0; i < 8; i++) {
-		line = gpiod_chip_get_line(chip, i);
-		g_assert_nonnull(line);
-		gpiod_test_return_if_failed();
-
-		gpiod_line_bulk_add_line(bulk, line);
-		gpiod_test_chip_set_pull(0, i, 0);
-	}
-
-	ret = gpiod_line_request_bulk_rising_edge_events_flags(bulk,
-			GPIOD_TEST_CONSUMER, GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	memset(vals, 0, sizeof(vals));
-	ret = gpiod_line_get_value_bulk(bulk, vals);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(vals[0], ==, 1);
-	g_assert_cmpint(vals[1], ==, 1);
-	g_assert_cmpint(vals[2], ==, 1);
-	g_assert_cmpint(vals[3], ==, 1);
-	g_assert_cmpint(vals[4], ==, 1);
-	g_assert_cmpint(vals[5], ==, 1);
-	g_assert_cmpint(vals[6], ==, 1);
-	g_assert_cmpint(vals[7], ==, 1);
-
-	gpiod_test_chip_set_pull(0, 1, 1);
-	gpiod_test_chip_set_pull(0, 3, 1);
-	gpiod_test_chip_set_pull(0, 4, 1);
-	gpiod_test_chip_set_pull(0, 7, 1);
-
-	memset(vals, 0, sizeof(vals));
-	ret = gpiod_line_get_value_bulk(bulk, vals);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(vals[0], ==, 1);
-	g_assert_cmpint(vals[1], ==, 0);
-	g_assert_cmpint(vals[2], ==, 1);
-	g_assert_cmpint(vals[3], ==, 0);
-	g_assert_cmpint(vals[4], ==, 0);
-	g_assert_cmpint(vals[5], ==, 1);
-	g_assert_cmpint(vals[6], ==, 1);
-	g_assert_cmpint(vals[7], ==, 0);
-}
-
-GPIOD_TEST_CASE(wait_multiple, 0, { 8 })
-{
-	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
-	g_autoptr(gpiod_line_bulk_struct) ev_bulk = NULL;
-	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
-	struct gpiod_line *line;
-	gint ret, i;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	bulk = gpiod_line_bulk_new(8);
-	ev_bulk = gpiod_line_bulk_new(8);
-	g_assert_nonnull(bulk);
-	g_assert_nonnull(ev_bulk);
-	gpiod_test_return_if_failed();
-
-	for (i = 1; i < 8; i++) {
-		line = gpiod_chip_get_line(chip, i);
-		g_assert_nonnull(line);
-		gpiod_test_return_if_failed();
-
-		gpiod_line_bulk_add_line(bulk, line);
-	}
-
-	ret = gpiod_line_request_bulk_rising_edge_events(bulk,
-							 GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	ev_thread = gpiod_test_start_event_thread(0, 4, 100);
-
-	ret = gpiod_line_event_wait_bulk(bulk, &ts, ev_bulk);
-	g_assert_cmpint(ret, ==, 1);
-
-	g_assert_cmpuint(gpiod_line_bulk_num_lines(ev_bulk), ==, 1);
-	line = gpiod_line_bulk_get_line(ev_bulk, 0);
-	g_assert_cmpuint(gpiod_line_offset(line), ==, 4);
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
-	g_assert_cmpint(ev.offset, ==, 4);
-}
-
-GPIOD_TEST_CASE(get_fd_when_values_requested, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	gint ret, fd;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 3);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	fd = gpiod_line_event_get_fd(line);
-	g_assert_cmpint(fd, ==, -1);
-	g_assert_cmpint(errno, ==, EPERM);
-}
-
-GPIOD_TEST_CASE(request_bulk_fail, 0, { 8 })
-{
-	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	gint ret, i;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 7);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	bulk = gpiod_line_bulk_new(8);
-	g_assert_nonnull(bulk);
-	gpiod_test_return_if_failed();
-
-	for (i = 0; i < 8; i++) {
-		line = gpiod_chip_get_line(chip, i);
-		g_assert_nonnull(line);
-		gpiod_test_return_if_failed();
-		gpiod_line_bulk_add_line(bulk, line);
-	}
-
-	ret = gpiod_line_request_bulk_both_edges_events(bulk,
-							GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, EBUSY);
-}
-
-GPIOD_TEST_CASE(invalid_fd, 0, { 8 })
-{
-	g_autoptr(gpiod_line_bulk_struct) ev_bulk = NULL;
-	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line *line;
-	gint ret, fd;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 7);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_both_edges_events(line, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	fd = gpiod_line_event_get_fd(line);
-	close(fd);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, EINVAL);
-
-	bulk = gpiod_line_bulk_new(1);
-	ev_bulk = gpiod_line_bulk_new(1);
-	g_assert_nonnull(bulk);
-	g_assert_nonnull(ev_bulk);
-
-	/*
-	 * The single line variant calls gpiod_line_event_wait_bulk() with the
-	 * event_bulk argument set to NULL, so test this use case explicitly
-	 * as well.
-	 */
-	gpiod_line_bulk_add_line(bulk, line);
-	ret = gpiod_line_event_wait_bulk(bulk, &ts, ev_bulk);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, EINVAL);
-}
-
-GPIOD_TEST_CASE(read_events_individually, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line_event ev;
-	struct gpiod_line *line;
-	gint ret;
-	guint i;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 7);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_both_edges_events_flags(line,
-		GPIOD_TEST_CONSUMER, GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	/* generate multiple events */
-	for (i = 0; i < 3; i++) {
-		gpiod_test_chip_set_pull(0, 7, i & 1);
-		usleep(10000);
-	}
-
-	/* read them individually... */
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-	if (!ret)
-		return;
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-	if (!ret)
-		return;
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-	if (!ret)
-		return;
-
-	ret = gpiod_line_event_read(line, &ev);
-	g_assert_cmpint(ret, ==, 0);
-
-	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 0);
-}
-
-GPIOD_TEST_CASE(read_multiple_events, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_event events[5];
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line *line;
-	gint ret;
-	guint i;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 4);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_both_edges_events(line, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	/* generate multiple events */
-	for (i = 0; i < 7; i++) {
-		gpiod_test_chip_set_pull(0, 4, !(i & 1));
-		/*
-		 * We sleep for a short period of time here and in other
-		 * test cases for multiple events to let the kernel service
-		 * each simulated interrupt. Otherwise we'd risk triggering
-		 * an interrupt while the previous one is still being
-		 * handled.
-		 */
-		usleep(10000);
-	}
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-	if (!ret)
-		return;
-
-	/* read a chunk */
-	ret = gpiod_line_event_read_multiple(line, events, 3);
-	g_assert_cmpint(ret, ==, 3);
-
-	g_assert_cmpint(events[0].event_type, ==,
-			GPIOD_LINE_EVENT_RISING_EDGE);
-	g_assert_cmpint(events[1].event_type, ==,
-			GPIOD_LINE_EVENT_FALLING_EDGE);
-	g_assert_cmpint(events[2].event_type, ==,
-			GPIOD_LINE_EVENT_RISING_EDGE);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-	if (!ret)
-		return;
-
-	/*
-	 * read the remainder
-	 * - note the attempt to read more than are available
-	 */
-	ret = gpiod_line_event_read_multiple(line, events, 5);
-	g_assert_cmpint(ret, ==, 4);
-
-	g_assert_cmpint(events[0].event_type, ==,
-			GPIOD_LINE_EVENT_FALLING_EDGE);
-	g_assert_cmpint(events[1].event_type, ==,
-			GPIOD_LINE_EVENT_RISING_EDGE);
-	g_assert_cmpint(events[2].event_type, ==,
-			GPIOD_LINE_EVENT_FALLING_EDGE);
-	g_assert_cmpint(events[3].event_type, ==,
-			GPIOD_LINE_EVENT_RISING_EDGE);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 0);
-}
-
-GPIOD_TEST_CASE(read_multiple_events_fd, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_event events[5];
-	struct timespec ts = { 1, 0 };
-	struct gpiod_line *line;
-	gint ret, fd;
-	guint i;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 4);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_both_edges_events(line, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	/* generate multiple events */
-	for (i = 0; i < 7; i++) {
-		gpiod_test_chip_set_pull(0, 4, !(i & 1));
-		usleep(10000);
-	}
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-	if (!ret)
-		return;
-
-	fd = gpiod_line_event_get_fd(line);
-	g_assert_cmpint(fd, >=, 0);
-
-	/* read a chunk */
-	ret = gpiod_line_event_read_fd_multiple(fd, events, 3);
-	g_assert_cmpint(ret, ==, 3);
-
-	g_assert_cmpint(events[0].event_type, ==,
-			GPIOD_LINE_EVENT_RISING_EDGE);
-	g_assert_cmpint(events[1].event_type, ==,
-			GPIOD_LINE_EVENT_FALLING_EDGE);
-	g_assert_cmpint(events[2].event_type, ==,
-			GPIOD_LINE_EVENT_RISING_EDGE);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 1);
-	if (!ret)
-		return;
-
-	/*
-	 * read the remainder
-	 * - note the attempt to read more than are available
-	 */
-	ret = gpiod_line_event_read_fd_multiple(fd, events, 5);
-	g_assert_cmpint(ret, ==, 4);
-
-	g_assert_cmpint(events[0].event_type, ==,
-			GPIOD_LINE_EVENT_FALLING_EDGE);
-	g_assert_cmpint(events[1].event_type, ==,
-			GPIOD_LINE_EVENT_RISING_EDGE);
-	g_assert_cmpint(events[2].event_type, ==,
-			GPIOD_LINE_EVENT_FALLING_EDGE);
-	g_assert_cmpint(events[3].event_type, ==,
-			GPIOD_LINE_EVENT_RISING_EDGE);
-
-	ret = gpiod_line_event_wait(line, &ts);
-	g_assert_cmpint(ret, ==, 0);
-}
diff --git a/tests/tests-info-event.c b/tests/tests-info-event.c
new file mode 100644
index 0000000..8129f16
--- /dev/null
+++ b/tests/tests-info-event.c
@@ -0,0 +1,301 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+#include <glib.h>
+#include <gpiod.h>
+#include <poll.h>
+
+#include "gpiod-test.h"
+#include "gpiod-test-helpers.h"
+#include "gpiod-test-sim.h"
+
+#define GPIOD_TEST_GROUP "info-event"
+
+GPIOD_TEST_CASE(watching_info_events_returns_line_info)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_info) info = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiod_chip_watch_line_info(chip, 3);
+	g_assert_nonnull(info);
+	g_assert_cmpuint(gpiod_line_info_get_offset(info), ==, 3);
+}
+
+GPIOD_TEST_CASE(try_offset_out_of_range)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_info) info = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiod_chip_watch_line_info(chip, 10);
+	g_assert_null(info);
+	gpiod_test_expect_errno(EINVAL);
+}
+
+GPIOD_TEST_CASE(event_timeout)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_info) info = NULL;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiod_chip_watch_line_info(chip, 6);
+	g_assert_nonnull(info);
+	gpiod_test_return_if_failed();
+
+	ret = gpiod_chip_info_event_wait(chip, 100000000);
+	g_assert_cmpint(ret, ==, 0);
+}
+
+struct request_ctx {
+	struct gpiod_chip *chip;
+	struct gpiod_request_config *req_cfg;
+	struct gpiod_line_config *line_cfg;
+};
+
+static gpointer request_release_line(gpointer data)
+{
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	struct request_ctx *ctx = data;
+	gint ret;
+
+	g_usleep(50);
+
+	request = gpiod_chip_request_lines(ctx->chip,
+					   ctx->req_cfg, ctx->line_cfg);
+	g_assert_nonnull(request);
+	if (g_test_failed())
+		return NULL;
+
+	g_usleep(50);
+
+	gpiod_line_config_set_direction_default(ctx->line_cfg,
+						GPIOD_LINE_DIRECTION_OUTPUT);
+
+	ret = gpiod_line_request_reconfigure_lines(request, ctx->line_cfg);
+	g_assert_cmpint(ret, ==, 0);
+	if (g_test_failed())
+		return NULL;
+
+	g_usleep(50);
+
+	gpiod_line_request_release(request);
+	request = NULL;
+
+	return NULL;
+}
+
+GPIOD_TEST_CASE(request_reconfigure_release_events)
+{
+	static const guint offset = 3;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_info) info = NULL;
+	g_autoptr(struct_gpiod_info_event) request_event = NULL;
+	g_autoptr(struct_gpiod_info_event) reconfigure_event = NULL;
+	g_autoptr(struct_gpiod_info_event) release_event = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(GThread) thread = NULL;
+	struct gpiod_line_info *request_info, *reconfigure_info, *release_info;
+	guint64 request_ts, reconfigure_ts, release_ts;
+	struct request_ctx ctx;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+
+	info = gpiod_chip_watch_line_info(chip, 3);
+	g_assert_nonnull(info);
+	gpiod_test_return_if_failed();
+
+	g_assert_false(gpiod_line_info_is_used(info));
+
+	ctx.chip = chip;
+	ctx.req_cfg = req_cfg;
+	ctx.line_cfg = line_cfg;
+
+	thread = g_thread_new("request-release", request_release_line, &ctx);
+	g_thread_ref(thread);
+
+	ret = gpiod_chip_info_event_wait(chip, 1000000000);
+	g_assert_cmpint(ret, >, 0);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	request_event = gpiod_chip_info_event_read(chip);
+	g_assert_nonnull(request_event);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpint(gpiod_info_event_get_event_type(request_event), ==,
+			GPIOD_INFO_EVENT_LINE_REQUESTED);
+
+	request_info = gpiod_info_event_get_line_info(request_event);
+
+	g_assert_cmpuint(gpiod_line_info_get_offset(request_info), ==, 3);
+	g_assert_true(gpiod_line_info_is_used(request_info));
+	g_assert_cmpint(gpiod_line_info_get_direction(request_info), ==,
+			GPIOD_LINE_DIRECTION_INPUT);
+
+	ret = gpiod_chip_info_event_wait(chip, 1000000000);
+	g_assert_cmpint(ret, >, 0);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	reconfigure_event = gpiod_chip_info_event_read(chip);
+	g_assert_nonnull(reconfigure_event);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpint(gpiod_info_event_get_event_type(reconfigure_event), ==,
+			GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED);
+
+	reconfigure_info = gpiod_info_event_get_line_info(reconfigure_event);
+
+	g_assert_cmpuint(gpiod_line_info_get_offset(reconfigure_info), ==, 3);
+	g_assert_true(gpiod_line_info_is_used(reconfigure_info));
+	g_assert_cmpint(gpiod_line_info_get_direction(reconfigure_info), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+
+	ret = gpiod_chip_info_event_wait(chip, 1000000000);
+	g_assert_cmpint(ret, >, 0);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	release_event = gpiod_chip_info_event_read(chip);
+	g_assert_nonnull(release_event);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpint(gpiod_info_event_get_event_type(release_event), ==,
+			GPIOD_INFO_EVENT_LINE_RELEASED);
+
+	release_info = gpiod_info_event_get_line_info(release_event);
+
+	g_assert_cmpuint(gpiod_line_info_get_offset(release_info), ==, 3);
+	g_assert_false(gpiod_line_info_is_used(release_info));
+
+	g_thread_join(thread);
+
+	request_ts = gpiod_info_event_get_timestamp(request_event);
+	reconfigure_ts = gpiod_info_event_get_timestamp(reconfigure_event);
+	release_ts = gpiod_info_event_get_timestamp(release_event);
+
+	g_assert_cmpuint(request_ts, <, reconfigure_ts);
+	g_assert_cmpuint(reconfigure_ts, <, release_ts);
+}
+
+GPIOD_TEST_CASE(chip_fd_can_be_polled)
+{
+	static const guint offset = 3;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_info) info = NULL;
+	g_autoptr(struct_gpiod_info_event) event = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(GThread) thread = NULL;
+	struct gpiod_line_info *evinfo;
+	struct request_ctx ctx;
+	struct timespec ts;
+	struct pollfd pfd;
+	gint ret, fd;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+
+	info = gpiod_chip_watch_line_info(chip, 3);
+	g_assert_nonnull(info);
+	gpiod_test_return_if_failed();
+
+	g_assert_false(gpiod_line_info_is_used(info));
+
+	ctx.chip = chip;
+	ctx.req_cfg = req_cfg;
+	ctx.line_cfg = line_cfg;
+
+	thread = g_thread_new("request-release", request_release_line, &ctx);
+	g_thread_ref(thread);
+
+	fd = gpiod_chip_get_fd(chip);
+
+	memset(&pfd, 0, sizeof(pfd));
+	pfd.fd = fd;
+	pfd.events = POLLIN | POLLPRI;
+
+	ts.tv_sec = 1;
+	ts.tv_nsec = 0;
+
+	ret = ppoll(&pfd, 1, &ts, NULL);
+	g_assert_cmpint(ret, >, 0);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	event = gpiod_chip_info_event_read(chip);
+	g_assert_nonnull(event);
+	gpiod_test_join_thread_and_return_if_failed(thread);
+
+	g_assert_cmpint(gpiod_info_event_get_event_type(event), ==,
+			GPIOD_INFO_EVENT_LINE_REQUESTED);
+
+	evinfo = gpiod_info_event_get_line_info(event);
+
+	g_assert_cmpuint(gpiod_line_info_get_offset(evinfo), ==, 3);
+	g_assert_true(gpiod_line_info_is_used(evinfo));
+
+	g_thread_join(thread);
+}
+
+GPIOD_TEST_CASE(unwatch_and_check_that_no_events_are_generated)
+{
+	static const guint offset = 3;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_info) info = NULL;
+	g_autoptr(struct_gpiod_info_event) event = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+
+	info = gpiod_chip_watch_line_info(chip, 3);
+	g_assert_nonnull(info);
+	gpiod_test_return_if_failed();
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	ret = gpiod_chip_info_event_wait(chip, 100000000);
+	g_assert_cmpint(ret, >, 0);
+	gpiod_test_return_if_failed();
+
+	event = gpiod_chip_info_event_read(chip);
+	g_assert_nonnull(event);
+	gpiod_test_return_if_failed();
+
+	ret = gpiod_chip_unwatch_line_info(chip, 3);
+	g_assert_cmpint(ret, ==, 0);
+	gpiod_test_return_if_failed();
+
+	gpiod_line_request_release(request);
+	request = NULL;
+
+	ret = gpiod_chip_info_event_wait(chip, 100000000);
+	g_assert_cmpint(ret, ==, 0);
+}
diff --git a/tests/tests-line-config.c b/tests/tests-line-config.c
new file mode 100644
index 0000000..d227890
--- /dev/null
+++ b/tests/tests-line-config.c
@@ -0,0 +1,408 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+#include <errno.h>
+#include <glib.h>
+#include <gpiod.h>
+#include <stdint.h>
+
+#include "gpiod-test.h"
+#include "gpiod-test-helpers.h"
+#include "gpiod-test-sim.h"
+
+#define GPIOD_TEST_GROUP "line-config"
+
+GPIOD_TEST_CASE(default_config)
+{
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	g_assert_cmpint(gpiod_line_config_get_direction_default(config), ==,
+			GPIOD_LINE_DIRECTION_AS_IS);
+	g_assert_cmpint(gpiod_line_config_get_edge_detection_default(config),
+			==, GPIOD_LINE_EDGE_NONE);
+	g_assert_cmpint(gpiod_line_config_get_bias_default(config), ==,
+			GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiod_line_config_get_drive_default(config), ==,
+			GPIOD_LINE_DRIVE_PUSH_PULL);
+	g_assert_false(gpiod_line_config_get_active_low_default(config));
+	g_assert_cmpuint(
+		gpiod_line_config_get_debounce_period_us_default(config), ==,
+		0);
+	g_assert_cmpint(gpiod_line_config_get_event_clock_default(config), ==,
+			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+	g_assert_cmpint(gpiod_line_config_get_output_value_default(config), ==,
+			0);
+	g_assert_cmpuint(gpiod_line_config_get_num_overridden_offsets(config),
+			 ==, 0);
+}
+
+GPIOD_TEST_CASE(defaults_are_used_for_non_overridden_offsets)
+{
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	g_assert_cmpint(gpiod_line_config_get_direction_offset(config, 4), ==,
+			GPIOD_LINE_DIRECTION_AS_IS);
+	g_assert_cmpint(gpiod_line_config_get_edge_detection_offset(config, 4),
+			==, GPIOD_LINE_EDGE_NONE);
+	g_assert_cmpint(gpiod_line_config_get_bias_offset(config, 4), ==,
+			GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiod_line_config_get_drive_offset(config, 4), ==,
+			GPIOD_LINE_DRIVE_PUSH_PULL);
+	g_assert_false(gpiod_line_config_get_active_low_offset(config, 4));
+	g_assert_cmpuint(
+		gpiod_line_config_get_debounce_period_us_offset(config, 4), ==,
+		0);
+	g_assert_cmpint(gpiod_line_config_get_event_clock_offset(config, 4),
+			==, GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+	g_assert_cmpint(gpiod_line_config_get_output_value_offset(config, 4),
+			==, 0);
+	g_assert_cmpuint(gpiod_line_config_get_num_overridden_offsets(config),
+			 ==, 0);
+}
+
+GPIOD_TEST_CASE(set_and_clear_direction_override)
+{
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	g_assert_cmpint(gpiod_line_config_get_direction_default(config), ==,
+			GPIOD_LINE_DIRECTION_AS_IS);
+	gpiod_line_config_set_direction_override(config,
+						 GPIOD_LINE_DIRECTION_OUTPUT,
+						 3);
+
+	g_assert_cmpint(gpiod_line_config_get_direction_default(config), ==,
+			GPIOD_LINE_DIRECTION_AS_IS);
+	g_assert_cmpint(gpiod_line_config_get_direction_offset(config, 3), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_true(gpiod_line_config_direction_is_overridden(config, 3));
+	gpiod_line_config_clear_direction_override(config, 3);
+	g_assert_cmpint(gpiod_line_config_get_direction_offset(config, 3), ==,
+			GPIOD_LINE_DIRECTION_AS_IS);
+	g_assert_false(gpiod_line_config_direction_is_overridden(config, 3));
+}
+
+GPIOD_TEST_CASE(invalid_direction)
+{
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	gpiod_line_config_set_direction_default(config, INT32_MAX);
+	g_assert_cmpint(gpiod_line_config_get_direction_default(config),
+			==, GPIOD_LINE_DIRECTION_AS_IS);
+}
+
+GPIOD_TEST_CASE(set_and_clear_edge_override)
+{
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	g_assert_cmpint(gpiod_line_config_get_edge_detection_default(config),
+			==, GPIOD_LINE_EDGE_NONE);
+	gpiod_line_config_set_edge_detection_override(config,
+						GPIOD_LINE_EDGE_FALLING, 3);
+
+	g_assert_cmpint(gpiod_line_config_get_edge_detection_default(config),
+			==, GPIOD_LINE_EDGE_NONE);
+	g_assert_cmpint(gpiod_line_config_get_edge_detection_offset(config, 3),
+			==, GPIOD_LINE_EDGE_FALLING);
+	g_assert_true(gpiod_line_config_edge_detection_is_overridden(config,
+								     3));
+	gpiod_line_config_clear_edge_detection_override(config, 3);
+	g_assert_cmpint(gpiod_line_config_get_edge_detection_offset(config, 3),
+			==, GPIOD_LINE_EDGE_NONE);
+	g_assert_false(gpiod_line_config_edge_detection_is_overridden(config,
+								      3));
+}
+
+GPIOD_TEST_CASE(invalid_edge)
+{
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	gpiod_line_config_set_edge_detection_default(config, INT32_MAX);
+	g_assert_cmpint(gpiod_line_config_get_edge_detection_default(config),
+			==, GPIOD_LINE_EDGE_NONE);
+}
+
+GPIOD_TEST_CASE(set_and_clear_bias_override)
+{
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	g_assert_cmpint(gpiod_line_config_get_bias_default(config),
+			==, GPIOD_LINE_BIAS_AS_IS);
+	gpiod_line_config_set_bias_override(config, GPIOD_LINE_BIAS_PULL_UP, 3);
+
+	g_assert_cmpint(gpiod_line_config_get_bias_default(config),
+			==, GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiod_line_config_get_bias_offset(config, 3),
+			==, GPIOD_LINE_BIAS_PULL_UP);
+	g_assert_true(gpiod_line_config_bias_is_overridden(config, 3));
+	gpiod_line_config_clear_bias_override(config, 3);
+	g_assert_cmpint(gpiod_line_config_get_bias_offset(config, 3),
+			==, GPIOD_LINE_BIAS_AS_IS);
+	g_assert_false(gpiod_line_config_bias_is_overridden(config, 3));
+}
+
+GPIOD_TEST_CASE(invalid_bias)
+{
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	gpiod_line_config_set_bias_default(config, INT32_MAX);
+	g_assert_cmpint(gpiod_line_config_get_bias_default(config),
+			==, GPIOD_LINE_BIAS_AS_IS);
+}
+
+GPIOD_TEST_CASE(set_and_clear_drive_override)
+{
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	g_assert_cmpint(gpiod_line_config_get_drive_default(config),
+			==, GPIOD_LINE_DRIVE_PUSH_PULL);
+	gpiod_line_config_set_drive_override(config,
+					     GPIOD_LINE_DRIVE_OPEN_DRAIN, 3);
+
+	g_assert_cmpint(gpiod_line_config_get_drive_default(config),
+			==, GPIOD_LINE_DRIVE_PUSH_PULL);
+	g_assert_cmpint(gpiod_line_config_get_drive_offset(config, 3),
+			==, GPIOD_LINE_DRIVE_OPEN_DRAIN);
+	g_assert_true(gpiod_line_config_drive_is_overridden(config, 3));
+	gpiod_line_config_clear_drive_override(config, 3);
+	g_assert_cmpint(gpiod_line_config_get_drive_offset(config, 3),
+			==, GPIOD_LINE_DRIVE_PUSH_PULL);
+	g_assert_false(gpiod_line_config_drive_is_overridden(config, 3));
+}
+
+GPIOD_TEST_CASE(invalid_drive)
+{
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	gpiod_line_config_set_drive_default(config, INT32_MAX);
+	g_assert_cmpint(gpiod_line_config_get_drive_default(config),
+			==, GPIOD_LINE_BIAS_AS_IS);
+}
+
+GPIOD_TEST_CASE(set_and_clear_active_low_override)
+{
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	g_assert_false(gpiod_line_config_get_active_low_default(config));
+	gpiod_line_config_set_active_low_override(config, true, 3);
+
+	g_assert_false(gpiod_line_config_get_active_low_default(config));
+	g_assert_true(gpiod_line_config_get_active_low_offset(config, 3));
+	g_assert_true(gpiod_line_config_active_low_is_overridden(config, 3));
+	gpiod_line_config_clear_active_low_override(config, 3);
+	g_assert_false(gpiod_line_config_get_active_low_offset(config, 3));
+	g_assert_false(gpiod_line_config_active_low_is_overridden(config, 3));
+}
+
+GPIOD_TEST_CASE(set_and_clear_debounce_period_override)
+{
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	g_assert_cmpuint(
+		gpiod_line_config_get_debounce_period_us_default(config),
+		==, 0);
+	gpiod_line_config_set_debounce_period_us_override(config, 5000, 3);
+
+	g_assert_cmpuint(
+		gpiod_line_config_get_debounce_period_us_default(config),
+		==, 0);
+	g_assert_cmpuint(
+		gpiod_line_config_get_debounce_period_us_offset(config, 3),
+		==, 5000);
+	g_assert_true(
+		gpiod_line_config_debounce_period_us_is_overridden(config, 3));
+	gpiod_line_config_clear_debounce_period_us_override(config, 3);
+	g_assert_cmpuint(
+		gpiod_line_config_get_debounce_period_us_offset(config, 3),
+		==, 0);
+	g_assert_false(
+		gpiod_line_config_debounce_period_us_is_overridden(config, 3));
+}
+
+GPIOD_TEST_CASE(set_and_clear_event_clock_override)
+{
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	g_assert_cmpint(gpiod_line_config_get_event_clock_default(config),
+			==, GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+	gpiod_line_config_set_event_clock_override(config,
+					GPIOD_LINE_EVENT_CLOCK_REALTIME, 3);
+
+	g_assert_cmpint(gpiod_line_config_get_event_clock_default(config),
+			==, GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+	g_assert_cmpint(gpiod_line_config_get_event_clock_offset(config, 3),
+			==, GPIOD_LINE_EVENT_CLOCK_REALTIME);
+	g_assert_true(gpiod_line_config_event_clock_is_overridden(config, 3));
+	gpiod_line_config_clear_event_clock_override(config, 3);
+	g_assert_cmpint(gpiod_line_config_get_event_clock_offset(config, 3),
+			==, GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+	g_assert_false(gpiod_line_config_event_clock_is_overridden(config, 3));
+}
+
+GPIOD_TEST_CASE(invalid_event_clock)
+{
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	gpiod_line_config_set_event_clock_default(config, INT32_MAX);
+	g_assert_cmpint(gpiod_line_config_get_event_clock_default(config),
+			==, GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+}
+
+GPIOD_TEST_CASE(set_and_clear_output_value_override)
+{
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	g_assert_cmpint(gpiod_line_config_get_output_value_default(config),
+			==, 0);
+	gpiod_line_config_set_output_value_override(config, 3, 1);
+
+	g_assert_cmpint(gpiod_line_config_get_output_value_default(config),
+			==, 0);
+	g_assert_cmpint(gpiod_line_config_get_output_value_offset(config, 3),
+			==, 1);
+	g_assert_true(gpiod_line_config_output_value_is_overridden(config, 3));
+	gpiod_line_config_clear_output_value_override(config, 3);
+	g_assert_cmpint(gpiod_line_config_get_output_value_offset(config, 3),
+			==, 0);
+	g_assert_false(gpiod_line_config_output_value_is_overridden(config, 3));
+}
+
+GPIOD_TEST_CASE(set_multiple_output_values)
+{
+	static const guint offsets[] = { 3, 4, 5, 6 };
+	static const gint values[] = { 1, 0, 1, 0 };
+
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+	guint overridden[4];
+	guint i;
+
+	config = gpiod_test_create_line_config_or_fail();
+
+	gpiod_line_config_set_output_values(config, 4, offsets, values);
+
+	g_assert_cmpint(gpiod_line_config_get_output_value_default(config),
+			==, 0);
+
+	for (i = 0; i < 4; i++)
+		g_assert_cmpint(
+			gpiod_line_config_get_output_value_offset(config,
+								  offsets[i]),
+			==, values[i]);
+
+	g_assert_cmpuint(gpiod_line_config_get_num_overridden_offsets(config),
+			==, 4);
+	gpiod_line_config_get_overridden_offsets(config, overridden);
+
+	for (i = 0; i < 4; i++)
+		g_assert_cmpuint(overridden[i], ==, offsets[i]);
+}
+
+GPIOD_TEST_CASE(config_too_complex)
+{
+	static guint offsets[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 16, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	line_cfg = gpiod_test_create_line_config_or_fail();
+	req_cfg = gpiod_test_create_request_config_or_fail();
+
+	/*
+	 * We need to make the line_config structure exceed the kernel's
+	 * maximum of 10 attributes.
+	 */
+	gpiod_line_config_set_direction_override(line_cfg,
+					GPIOD_LINE_DIRECTION_OUTPUT, 0);
+	gpiod_line_config_set_direction_override(line_cfg,
+					GPIOD_LINE_DIRECTION_INPUT, 1);
+	gpiod_line_config_set_edge_detection_override(line_cfg,
+						      GPIOD_LINE_EDGE_BOTH, 2);
+	gpiod_line_config_set_debounce_period_us_override(line_cfg, 1000, 2);
+	gpiod_line_config_set_active_low_override(line_cfg, true, 3);
+	gpiod_line_config_set_direction_override(line_cfg,
+					GPIOD_LINE_DIRECTION_OUTPUT, 4);
+	gpiod_line_config_set_drive_override(line_cfg,
+					     GPIOD_LINE_DRIVE_OPEN_DRAIN, 4);
+	gpiod_line_config_set_direction_override(line_cfg,
+					GPIOD_LINE_DIRECTION_OUTPUT, 8);
+	gpiod_line_config_set_drive_override(line_cfg,
+					     GPIOD_LINE_DRIVE_OPEN_SOURCE, 8);
+	gpiod_line_config_set_direction_override(line_cfg,
+						 GPIOD_LINE_DIRECTION_INPUT, 5);
+	gpiod_line_config_set_bias_override(line_cfg,
+					    GPIOD_LINE_BIAS_PULL_DOWN, 5);
+	gpiod_line_config_set_event_clock_override(line_cfg,
+					GPIOD_LINE_EVENT_CLOCK_REALTIME, 6);
+	gpiod_line_config_set_output_value_override(line_cfg, 7, 1);
+
+	gpiod_request_config_set_offsets(req_cfg, 12, offsets);
+
+	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	g_assert_null(request);
+	gpiod_test_expect_errno(E2BIG);
+}
+
+/*
+ * This triggers the E2BIG error by exhausting the number of overrides in
+ * the line_config structure instead of making the kernel representation too
+ * complex.
+ */
+GPIOD_TEST_CASE(define_too_many_overrides)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 128, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	guint offsets[65], i;
+
+	for (i = 0; i < 65; i++)
+		offsets[i] = i;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	line_cfg = gpiod_test_create_line_config_or_fail();
+	req_cfg = gpiod_test_create_request_config_or_fail();
+
+	for (i = 0; i < 65; i++)
+		gpiod_line_config_set_direction_override(line_cfg,
+				GPIOD_LINE_DIRECTION_OUTPUT, offsets[i]);
+
+	gpiod_request_config_set_offsets(req_cfg, 64, offsets);
+
+	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	g_assert_null(request);
+	gpiod_test_expect_errno(E2BIG);
+}
diff --git a/tests/tests-line-info.c b/tests/tests-line-info.c
new file mode 100644
index 0000000..a2ecc13
--- /dev/null
+++ b/tests/tests-line-info.c
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+#include <errno.h>
+#include <glib.h>
+#include <gpiod.h>
+
+#include "gpiod-test.h"
+#include "gpiod-test-helpers.h"
+#include "gpiod-test-sim.h"
+
+#define GPIOD_TEST_GROUP "line-info"
+
+GPIOD_TEST_CASE(get_line_info_good)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_info) info = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiod_chip_get_line_info(chip, 3);
+	g_assert_nonnull(info);
+	g_assert_cmpuint(gpiod_line_info_get_offset(info), ==, 3);
+}
+
+GPIOD_TEST_CASE(get_line_info_offset_out_of_range)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_info) info = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiod_chip_get_line_info(chip, 8);
+	g_assert_null(info);
+	gpiod_test_expect_errno(EINVAL);
+}
+
+GPIOD_TEST_CASE(line_info_basic_properties)
+{
+	static const struct gpiod_test_line_name names[] = {
+		{ .offset = 1, .name = "foo", },
+		{ .offset = 2, .name = "bar", },
+		{ .offset = 4, .name = "baz", },
+		{ .offset = 5, .name = "xyz", },
+		{ }
+	};
+
+	static const struct gpiod_test_hog hogs[] = {
+		{
+			.offset = 3,
+			.name = "hog3",
+			.direction = G_GPIOSIM_HOG_DIR_OUTPUT_HIGH,
+		},
+		{
+			.offset = 4,
+			.name = "hog4",
+			.direction = G_GPIOSIM_HOG_DIR_OUTPUT_LOW,
+		},
+		{ }
+	};
+
+	g_autoptr(GPIOSimChip) sim = NULL;
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_info) info4 = NULL;
+	g_autoptr(struct_gpiod_line_info) info6 = NULL;
+
+	sim = g_gpiosim_chip_new(
+			"num-lines", 8,
+			"line-names", gpiod_test_package_line_names(names),
+			"hogs", gpiod_test_package_hogs(hogs),
+			NULL);
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	info4 = gpiod_test_get_line_info_or_fail(chip, 4);
+	info6 = gpiod_test_get_line_info_or_fail(chip, 6);
+
+	g_assert_cmpuint(gpiod_line_info_get_offset(info4), ==, 4);
+	g_assert_cmpstr(gpiod_line_info_get_name(info4), ==, "baz");
+	g_assert_cmpstr(gpiod_line_info_get_consumer(info4), ==, "hog4");
+	g_assert_true(gpiod_line_info_is_used(info4));
+	g_assert_cmpint(gpiod_line_info_get_direction(info4), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_line_info_get_edge_detection(info4), ==,
+			GPIOD_LINE_EDGE_NONE);
+	g_assert_false(gpiod_line_info_is_active_low(info4));
+	g_assert_cmpint(gpiod_line_info_get_bias(info4), ==,
+			GPIOD_LINE_BIAS_UNKNOWN);
+	g_assert_cmpint(gpiod_line_info_get_drive(info4), ==,
+			GPIOD_LINE_DRIVE_PUSH_PULL);
+	g_assert_cmpint(gpiod_line_info_get_event_clock(info4), ==,
+			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+	g_assert_false(gpiod_line_info_is_debounced(info4));
+	g_assert_cmpuint(gpiod_line_info_get_debounce_period_us(info4), ==, 0);
+}
+
+GPIOD_TEST_CASE(copy_line_info)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_info) info = NULL;
+	g_autoptr(struct_gpiod_line_info) copy = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	info = gpiod_test_get_line_info_or_fail(chip, 3);
+
+	copy = gpiod_line_info_copy(info);
+	g_assert_nonnull(copy);
+	g_assert_true(info != copy);
+}
+
+GPIOD_TEST_CASE(active_high)
+{
+	static const guint offset = 5;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(struct_gpiod_line_info) info = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+	gpiod_line_config_set_active_low_default(line_cfg, true);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	info = gpiod_chip_get_line_info(chip, 5);
+
+	g_assert_true(gpiod_line_info_is_active_low(info));
+}
+
+GPIOD_TEST_CASE(edge_settings)
+{
+	static const guint offsets[] = { 0, 1, 2, 3 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(struct_gpiod_line_info) info0 = NULL;
+	g_autoptr(struct_gpiod_line_info) info1 = NULL;
+	g_autoptr(struct_gpiod_line_info) info2 = NULL;
+	g_autoptr(struct_gpiod_line_info) info3 = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 4, offsets);
+	gpiod_line_config_set_edge_detection_override(line_cfg,
+						GPIOD_LINE_EDGE_RISING, 1);
+	gpiod_line_config_set_edge_detection_override(line_cfg,
+						GPIOD_LINE_EDGE_FALLING, 2);
+	gpiod_line_config_set_edge_detection_override(line_cfg,
+						GPIOD_LINE_EDGE_BOTH, 3);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	info0 = gpiod_chip_get_line_info(chip, 0);
+	info1 = gpiod_chip_get_line_info(chip, 1);
+	info2 = gpiod_chip_get_line_info(chip, 2);
+	info3 = gpiod_chip_get_line_info(chip, 3);
+
+	g_assert_cmpint(gpiod_line_info_get_edge_detection(info0), ==,
+			GPIOD_LINE_EDGE_NONE);
+	g_assert_cmpint(gpiod_line_info_get_edge_detection(info1), ==,
+			GPIOD_LINE_EDGE_RISING);
+	g_assert_cmpint(gpiod_line_info_get_edge_detection(info2), ==,
+			GPIOD_LINE_EDGE_FALLING);
+	g_assert_cmpint(gpiod_line_info_get_edge_detection(info3), ==,
+			GPIOD_LINE_EDGE_BOTH);
+}
+
+GPIOD_TEST_CASE(bias_settings)
+{
+	static const guint offsets[] = { 0, 1, 2, 3 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(struct_gpiod_line_info) info0 = NULL;
+	g_autoptr(struct_gpiod_line_info) info1 = NULL;
+	g_autoptr(struct_gpiod_line_info) info2 = NULL;
+	g_autoptr(struct_gpiod_line_info) info3 = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 4, offsets);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_config_set_bias_override(line_cfg,
+					    GPIOD_LINE_BIAS_DISABLED, 1);
+	gpiod_line_config_set_bias_override(line_cfg,
+					    GPIOD_LINE_BIAS_PULL_DOWN, 2);
+	gpiod_line_config_set_bias_override(line_cfg,
+					    GPIOD_LINE_BIAS_PULL_UP, 3);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	info0 = gpiod_chip_get_line_info(chip, 0);
+	info1 = gpiod_chip_get_line_info(chip, 1);
+	info2 = gpiod_chip_get_line_info(chip, 2);
+	info3 = gpiod_chip_get_line_info(chip, 3);
+
+	g_assert_cmpint(gpiod_line_info_get_bias(info0), ==,
+			GPIOD_LINE_BIAS_UNKNOWN);
+	g_assert_cmpint(gpiod_line_info_get_bias(info1), ==,
+			GPIOD_LINE_BIAS_DISABLED);
+	g_assert_cmpint(gpiod_line_info_get_bias(info2), ==,
+			GPIOD_LINE_BIAS_PULL_DOWN);
+	g_assert_cmpint(gpiod_line_info_get_bias(info3), ==,
+			GPIOD_LINE_BIAS_PULL_UP);
+}
+
+GPIOD_TEST_CASE(drive_settings)
+{
+	static const guint offsets[] = { 0, 1, 2 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(struct_gpiod_line_info) info0 = NULL;
+	g_autoptr(struct_gpiod_line_info) info1 = NULL;
+	g_autoptr(struct_gpiod_line_info) info2 = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 3, offsets);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_config_set_drive_override(line_cfg,
+					     GPIOD_LINE_DRIVE_OPEN_DRAIN, 1);
+	gpiod_line_config_set_drive_override(line_cfg,
+					     GPIOD_LINE_DRIVE_OPEN_SOURCE, 2);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	info0 = gpiod_chip_get_line_info(chip, 0);
+	info1 = gpiod_chip_get_line_info(chip, 1);
+	info2 = gpiod_chip_get_line_info(chip, 2);
+
+	g_assert_cmpint(gpiod_line_info_get_drive(info0), ==,
+			GPIOD_LINE_DRIVE_PUSH_PULL);
+	g_assert_cmpint(gpiod_line_info_get_drive(info1), ==,
+			GPIOD_LINE_DRIVE_OPEN_DRAIN);
+	g_assert_cmpint(gpiod_line_info_get_drive(info2), ==,
+			GPIOD_LINE_DRIVE_OPEN_SOURCE);
+}
+
+GPIOD_TEST_CASE(debounce_period)
+{
+	static const guint offset = 5;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(struct_gpiod_line_info) info = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+	gpiod_line_config_set_edge_detection_default(line_cfg,
+						     GPIOD_LINE_EDGE_BOTH);
+	gpiod_line_config_set_debounce_period_us_default(line_cfg, 1000);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	info = gpiod_chip_get_line_info(chip, 5);
+
+	g_assert_cmpuint(gpiod_line_info_get_debounce_period_us(info),
+			 ==, 1000);
+}
+
+GPIOD_TEST_CASE(event_clock)
+{
+	static const guint offsets[] = { 0, 1 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(struct_gpiod_line_info) info0 = NULL;
+	g_autoptr(struct_gpiod_line_info) info1 = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 2, offsets);
+	gpiod_line_config_set_event_clock_override(line_cfg,
+					GPIOD_LINE_EVENT_CLOCK_REALTIME, 1);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	info0 = gpiod_chip_get_line_info(chip, 0);
+	info1 = gpiod_chip_get_line_info(chip, 1);
+
+	g_assert_cmpint(gpiod_line_info_get_event_clock(info0), ==,
+			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+	g_assert_cmpint(gpiod_line_info_get_event_clock(info1), ==,
+			GPIOD_LINE_EVENT_CLOCK_REALTIME);
+}
diff --git a/tests/tests-line-request.c b/tests/tests-line-request.c
new file mode 100644
index 0000000..44f91df
--- /dev/null
+++ b/tests/tests-line-request.c
@@ -0,0 +1,421 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+#include <glib.h>
+#include <gpiod.h>
+
+#include "gpiod-test.h"
+#include "gpiod-test-helpers.h"
+#include "gpiod-test-sim.h"
+
+#define GPIOD_TEST_GROUP "line-request"
+
+GPIOD_TEST_CASE(request_fails_with_no_offsets)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	g_assert_cmpuint(gpiod_request_config_get_num_offsets(req_cfg), ==, 0);
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+
+	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	g_assert_null(request);
+	gpiod_test_expect_errno(EINVAL);
+}
+
+GPIOD_TEST_CASE(request_fails_with_duplicate_offsets)
+{
+	static const guint offsets[] = { 0, 2, 2, 3 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 4, offsets);
+
+	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	g_assert_null(request);
+	gpiod_test_expect_errno(EBUSY);
+}
+
+GPIOD_TEST_CASE(request_fails_with_offset_out_of_bounds)
+{
+	static const guint offsets[] = { 2, 6 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 2, offsets);
+
+	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	g_assert_null(request);
+	gpiod_test_expect_errno(EINVAL);
+}
+
+GPIOD_TEST_CASE(set_consumer)
+{
+	static const guint offset = 2;
+	static const gchar *const consumer = "foobar";
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(struct_gpiod_line_info) info = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+	gpiod_request_config_set_consumer(req_cfg, consumer);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	info = gpiod_test_get_line_info_or_fail(chip, offset);
+
+	g_assert_cmpstr(gpiod_line_info_get_consumer(info), ==, consumer);
+}
+
+GPIOD_TEST_CASE(empty_consumer)
+{
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(struct_gpiod_line_info) info = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	info = gpiod_test_get_line_info_or_fail(chip, offset);
+
+	g_assert_cmpstr(gpiod_line_info_get_consumer(info), ==, "?");
+}
+
+GPIOD_TEST_CASE(default_output_value)
+{
+	/*
+	 * Have a hole in offsets on purpose - make sure it's not set by
+	 * accident.
+	 */
+	static const guint offsets[] = { 0, 1, 3, 4 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	guint i;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 4, offsets);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_config_set_output_value_default(line_cfg, 1);
+
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_DOWN);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	for (i = 0; i < 4; i++)
+		g_assert_cmpint(g_gpiosim_chip_get_value(sim, offsets[i]),
+				==, 1);
+
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 2), ==, 0);
+}
+
+GPIOD_TEST_CASE(default_and_overridden_output_value)
+{
+	static const guint offsets[] = { 0, 1, 2, 3 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 4, offsets);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_config_set_output_value_default(line_cfg, 1);
+	gpiod_line_config_set_output_value_override(line_cfg, 2, 0);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, offsets[0]),
+			==, 1);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, offsets[1]),
+			==, 1);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, offsets[2]),
+			==, 0);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, offsets[3]),
+			==, 1);
+}
+
+GPIOD_TEST_CASE(read_all_values)
+{
+	static const guint offsets[] = { 0, 2, 4, 5, 7 };
+	static const gint pulls[] = { 0, 1, 0, 1, 1 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	gint ret, values[5];
+	guint i;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 5, offsets);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_INPUT);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	for (i = 0; i < 5; i++)
+		g_gpiosim_chip_set_pull(sim, offsets[i],
+			pulls[i] ? G_GPIOSIM_PULL_UP : G_GPIOSIM_PULL_DOWN);
+
+	ret = gpiod_line_request_get_values(request, values);
+	g_assert_cmpint(ret, ==, 0);
+	gpiod_test_return_if_failed();
+
+	for (i = 0; i < 5; i++)
+		g_assert_cmpint(values[i], ==, pulls[i]);
+}
+
+GPIOD_TEST_CASE(request_multiple_values_but_read_one)
+{
+	static const guint offsets[] = { 0, 2, 4, 5, 7 };
+	static const gint pulls[] = { 0, 1, 0, 1, 1 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	gint ret;
+	guint i;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 5, offsets);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_INPUT);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	for (i = 0; i < 5; i++)
+		g_gpiosim_chip_set_pull(sim, offsets[i],
+			pulls[i] ? G_GPIOSIM_PULL_UP : G_GPIOSIM_PULL_DOWN);
+
+	ret = gpiod_line_request_get_value(request, 5);
+	g_assert_cmpint(ret, ==, 1);
+}
+
+GPIOD_TEST_CASE(set_all_values)
+{
+	static const guint offsets[] = { 0, 2, 4, 5, 6 };
+	static const gint values[] = { 1, 0, 1, 1, 1 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	gint ret;
+	guint i;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 5, offsets);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_OUTPUT);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	ret = gpiod_line_request_set_values(request, values);
+	g_assert_cmpint(ret, ==, 0);
+	gpiod_test_return_if_failed();
+
+	for (i = 0; i < 5; i++)
+		g_assert_cmpint(g_gpiosim_chip_get_value(sim, offsets[i]),
+				==, values[i]);
+}
+
+GPIOD_TEST_CASE(request_survives_parent_chip)
+{
+	static const guint offset = 0;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_config_set_output_value_default(line_cfg, 1);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	g_assert_cmpint(gpiod_line_request_get_value(request, offset), ==, 1);
+
+	gpiod_chip_close(chip);
+	chip = NULL;
+
+	ret = gpiod_line_request_set_value(request, offset, 0);
+	g_assert_cmpint(ret, ==, 0);
+	gpiod_test_return_if_failed();
+
+	ret = gpiod_line_request_set_value(request, offset, 1);
+	g_assert_cmpint(ret, ==, 0);
+	gpiod_test_return_if_failed();
+}
+
+GPIOD_TEST_CASE(request_with_overridden_direction)
+{
+	static const guint offsets[] = { 0, 1, 2, 3 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(struct_gpiod_line_info) info0 = NULL;
+	g_autoptr(struct_gpiod_line_info) info1 = NULL;
+	g_autoptr(struct_gpiod_line_info) info2 = NULL;
+	g_autoptr(struct_gpiod_line_info) info3 = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 4, offsets);
+	gpiod_line_config_set_direction_default(line_cfg,
+						GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_config_set_direction_override(line_cfg,
+						 GPIOD_LINE_DIRECTION_INPUT, 3);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	info0 = gpiod_test_get_line_info_or_fail(chip, 0);
+	info1 = gpiod_test_get_line_info_or_fail(chip, 1);
+	info2 = gpiod_test_get_line_info_or_fail(chip, 2);
+	info3 = gpiod_test_get_line_info_or_fail(chip, 3);
+
+	g_assert_cmpint(gpiod_line_info_get_direction(info0), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_line_info_get_direction(info1), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_line_info_get_direction(info2), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_line_info_get_direction(info3), ==,
+			GPIOD_LINE_DIRECTION_INPUT);
+}
+
+GPIOD_TEST_CASE(num_lines)
+{
+	static const guint offsets[] = { 0, 1, 2, 3, 7, 8, 11, 14 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 16, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	guint read_back[8], i;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 8, offsets);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	g_assert_cmpuint(gpiod_line_request_get_num_lines(request), ==, 8);
+	gpiod_test_return_if_failed();
+	gpiod_line_request_get_offsets(request, read_back);
+	for (i = 0; i < 8; i++)
+		g_assert_cmpuint(read_back[i], ==, offsets[i]);
+}
+
+GPIOD_TEST_CASE(active_low_read_value)
+{
+	static const guint offsets[] = { 2, 3 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	gint value;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	req_cfg = gpiod_test_create_request_config_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_request_config_set_offsets(req_cfg, 2, offsets);
+	gpiod_line_config_set_direction_override(line_cfg,
+					GPIOD_LINE_DIRECTION_INPUT, 2);
+	gpiod_line_config_set_direction_override(line_cfg,
+					GPIOD_LINE_DIRECTION_OUTPUT, 3);
+	gpiod_line_config_set_active_low_default(line_cfg, true);
+	gpiod_line_config_set_output_value_default(line_cfg, 1);
+
+	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_DOWN);
+	value = gpiod_line_request_get_value(request, 2);
+	g_assert_cmpint(value, ==, 1);
+
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 3), ==, 0);
+}
diff --git a/tests/tests-line.c b/tests/tests-line.c
deleted file mode 100644
index 3985990..0000000
--- a/tests/tests-line.c
+++ /dev/null
@@ -1,1091 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-#include <errno.h>
-#include <string.h>
-
-#include "gpiod-test.h"
-
-#define GPIOD_TEST_GROUP "line"
-
-GPIOD_TEST_CASE(request_output, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line0;
-	struct gpiod_line *line1;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line0 = gpiod_chip_get_line(chip, 2);
-	line1 = gpiod_chip_get_line(chip, 5);
-	g_assert_nonnull(line0);
-	g_assert_nonnull(line1);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_output(line0, GPIOD_TEST_CONSUMER, 0);
-	g_assert_cmpint(ret, ==, 0);
-	ret = gpiod_line_request_output(line1, GPIOD_TEST_CONSUMER, 1);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 5), ==, 1);
-}
-
-GPIOD_TEST_CASE(request_already_requested, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 0);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, EBUSY);
-}
-
-GPIOD_TEST_CASE(consumer, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 0);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	g_assert_null(gpiod_line_consumer(line));
-
-	ret = gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpstr(gpiod_line_consumer(line), ==, GPIOD_TEST_CONSUMER);
-}
-
-GPIOD_TEST_CASE(consumer_long_string, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 0);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	g_assert_null(gpiod_line_consumer(line));
-
-	ret = gpiod_line_request_input(line,
-			"consumer string over 32 characters long");
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-	g_assert_cmpstr(gpiod_line_consumer(line), ==,
-			"consumer string over 32 charact");
-	g_assert_cmpuint(strlen(gpiod_line_consumer(line)), ==, 31);
-}
-
-GPIOD_TEST_CASE(request_bulk_output, 0, { 8, 8 })
-{
-	g_autoptr(gpiod_line_bulk_struct) bulkA = NULL;
-	g_autoptr(gpiod_line_bulk_struct) bulkB = NULL;
-	g_autoptr(gpiod_chip_struct) chipA = NULL;
-	g_autoptr(gpiod_chip_struct) chipB = NULL;
-	struct gpiod_line *lineA0, *lineA1, *lineA2, *lineA3,
-			  *lineB0, *lineB1, *lineB2, *lineB3;
-	gint valA[4], valB[4], ret;
-
-	chipA = gpiod_chip_open(gpiod_test_chip_path(0));
-	chipB = gpiod_chip_open(gpiod_test_chip_path(1));
-	g_assert_nonnull(chipA);
-	g_assert_nonnull(chipB);
-	gpiod_test_return_if_failed();
-
-	lineA0 = gpiod_chip_get_line(chipA, 0);
-	lineA1 = gpiod_chip_get_line(chipA, 1);
-	lineA2 = gpiod_chip_get_line(chipA, 2);
-	lineA3 = gpiod_chip_get_line(chipA, 3);
-	lineB0 = gpiod_chip_get_line(chipB, 0);
-	lineB1 = gpiod_chip_get_line(chipB, 1);
-	lineB2 = gpiod_chip_get_line(chipB, 2);
-	lineB3 = gpiod_chip_get_line(chipB, 3);
-
-	g_assert_nonnull(lineA0);
-	g_assert_nonnull(lineA1);
-	g_assert_nonnull(lineA2);
-	g_assert_nonnull(lineA3);
-	g_assert_nonnull(lineB0);
-	g_assert_nonnull(lineB1);
-	g_assert_nonnull(lineB2);
-	g_assert_nonnull(lineB3);
-	gpiod_test_return_if_failed();
-
-	bulkA = gpiod_line_bulk_new(4);
-	bulkB = gpiod_line_bulk_new(4);
-	g_assert_nonnull(bulkA);
-	g_assert_nonnull(bulkB);
-	gpiod_test_return_if_failed();
-
-	gpiod_line_bulk_add_line(bulkA, lineA0);
-	gpiod_line_bulk_add_line(bulkA, lineA1);
-	gpiod_line_bulk_add_line(bulkA, lineA2);
-	gpiod_line_bulk_add_line(bulkA, lineA3);
-	gpiod_line_bulk_add_line(bulkB, lineB0);
-	gpiod_line_bulk_add_line(bulkB, lineB1);
-	gpiod_line_bulk_add_line(bulkB, lineB2);
-	gpiod_line_bulk_add_line(bulkB, lineB3);
-
-	valA[0] = 1;
-	valA[1] = 0;
-	valA[2] = 0;
-	valA[3] = 1;
-	ret = gpiod_line_request_bulk_output(bulkA,
-					     GPIOD_TEST_CONSUMER, valA);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	valB[0] = 0;
-	valB[1] = 1;
-	valB[2] = 0;
-	valB[3] = 1;
-	ret = gpiod_line_request_bulk_output(bulkB,
-					     GPIOD_TEST_CONSUMER, valB);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 1);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 3), ==, 1);
-
-	g_assert_cmpint(gpiod_test_chip_get_value(1, 0), ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(1, 1), ==, 1);
-	g_assert_cmpint(gpiod_test_chip_get_value(1, 2), ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(1, 3), ==, 1);
-}
-
-GPIOD_TEST_CASE(request_null_default_vals_for_output, 0, { 8 })
-{
-	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line0, *line1, *line2;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line0 = gpiod_chip_get_line(chip, 0);
-	line1 = gpiod_chip_get_line(chip, 1);
-	line2 = gpiod_chip_get_line(chip, 2);
-
-	g_assert_nonnull(line0);
-	g_assert_nonnull(line1);
-	g_assert_nonnull(line2);
-	gpiod_test_return_if_failed();
-
-	bulk = gpiod_line_bulk_new(3);
-	g_assert_nonnull(bulk);
-	gpiod_test_return_if_failed();
-
-	gpiod_line_bulk_add_line(bulk, line0);
-	gpiod_line_bulk_add_line(bulk, line1);
-	gpiod_line_bulk_add_line(bulk, line2);
-
-	ret = gpiod_line_request_bulk_output(bulk, GPIOD_TEST_CONSUMER, NULL);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-}
-
-GPIOD_TEST_CASE(set_value, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 2);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 0);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-
-	ret = gpiod_line_set_value(line, 1);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
-	ret = gpiod_line_set_value(line, 0);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-}
-
-GPIOD_TEST_CASE(set_value_bulk, 0, { 8 })
-{
-	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line0, *line1, *line2;
-	int values[3];
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line0 = gpiod_chip_get_line(chip, 0);
-	line1 = gpiod_chip_get_line(chip, 1);
-	line2 = gpiod_chip_get_line(chip, 2);
-
-	g_assert_nonnull(line0);
-	g_assert_nonnull(line1);
-	g_assert_nonnull(line2);
-	gpiod_test_return_if_failed();
-
-	bulk = gpiod_line_bulk_new(3);
-	g_assert_nonnull(bulk);
-	gpiod_test_return_if_failed();
-
-	gpiod_line_bulk_add_line(bulk, line0);
-	gpiod_line_bulk_add_line(bulk, line1);
-	gpiod_line_bulk_add_line(bulk, line2);
-
-	values[0] = 0;
-	values[1] = 1;
-	values[2] = 2;
-
-	ret = gpiod_line_request_bulk_output(bulk,
-			GPIOD_TEST_CONSUMER, values);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 1);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
-
-	values[0] = 2;
-	values[1] = 1;
-	values[2] = 0;
-
-	ret = gpiod_line_set_value_bulk(bulk, values);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 1);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 1);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-
-	ret = gpiod_line_set_value_bulk(bulk, NULL);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-}
-
-GPIOD_TEST_CASE(set_config_bulk_null_values, 0, { 8 })
-{
-	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line0, *line1, *line2;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line0 = gpiod_chip_get_line(chip, 0);
-	line1 = gpiod_chip_get_line(chip, 1);
-	line2 = gpiod_chip_get_line(chip, 2);
-
-	g_assert_nonnull(line0);
-	g_assert_nonnull(line1);
-	g_assert_nonnull(line2);
-	gpiod_test_return_if_failed();
-
-	bulk = gpiod_line_bulk_new(3);
-	g_assert_nonnull(bulk);
-	gpiod_test_return_if_failed();
-
-	gpiod_line_bulk_add_line(bulk, line0);
-	gpiod_line_bulk_add_line(bulk, line1);
-	gpiod_line_bulk_add_line(bulk, line2);
-
-	ret = gpiod_line_request_bulk_output(bulk, GPIOD_TEST_CONSUMER, 0);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-	g_assert_false(gpiod_line_is_active_low(line0));
-	g_assert_false(gpiod_line_is_active_low(line1));
-	g_assert_false(gpiod_line_is_active_low(line2));
-
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-
-	ret = gpiod_line_set_config_bulk(bulk,
-			GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
-			GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW, NULL);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_true(gpiod_line_is_active_low(line0));
-	g_assert_true(gpiod_line_is_active_low(line1));
-	g_assert_true(gpiod_line_is_active_low(line2));
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 1);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 1);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
-
-	ret = gpiod_line_set_config_bulk(bulk,
-			GPIOD_LINE_REQUEST_DIRECTION_OUTPUT, 0, NULL);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_false(gpiod_line_is_active_low(line0));
-	g_assert_false(gpiod_line_is_active_low(line1));
-	g_assert_false(gpiod_line_is_active_low(line2));
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-}
-
-GPIOD_TEST_CASE(set_flags_active_state, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 2);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 1);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-	g_assert_false(gpiod_line_is_active_low(line));
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
-
-	ret = gpiod_line_set_flags(line, GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_true(gpiod_line_is_active_low(line));
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-
-	ret = gpiod_line_set_flags(line, 0);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_false(gpiod_line_is_active_low(line));
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
-}
-
-GPIOD_TEST_CASE(set_flags_bias, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 2);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
-
-	ret = gpiod_line_set_flags(line,
-		GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_DISABLED);
-
-	ret = gpiod_line_set_flags(line,
-		GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_PULL_UP);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
-
-	ret = gpiod_line_set_flags(line,
-		GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_PULL_DOWN);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-}
-
-GPIOD_TEST_CASE(set_flags_drive, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 2);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 0);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_line_drive(line), ==, GPIOD_LINE_DRIVE_PUSH_PULL);
-
-	ret = gpiod_line_set_flags(line,
-		GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_drive(line), ==,
-			GPIOD_LINE_DRIVE_OPEN_DRAIN);
-
-	ret = gpiod_line_set_flags(line,
-		GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_drive(line), ==,
-			GPIOD_LINE_DRIVE_OPEN_SOURCE);
-}
-
-GPIOD_TEST_CASE(set_direction, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 2);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 0);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_line_direction(line), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-
-	ret = gpiod_line_set_direction_input(line);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_direction(line), ==,
-			GPIOD_LINE_DIRECTION_INPUT);
-
-	ret = gpiod_line_set_direction_output(line, 1);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_direction(line), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
-}
-
-GPIOD_TEST_CASE(set_direction_bulk, 0, { 8 })
-{
-	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line0, *line1, *line2;
-	int values[3];
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line0 = gpiod_chip_get_line(chip, 0);
-	line1 = gpiod_chip_get_line(chip, 1);
-	line2 = gpiod_chip_get_line(chip, 2);
-
-	g_assert_nonnull(line0);
-	g_assert_nonnull(line1);
-	g_assert_nonnull(line2);
-	gpiod_test_return_if_failed();
-
-	bulk = gpiod_line_bulk_new(3);
-	g_assert_nonnull(bulk);
-	gpiod_test_return_if_failed();
-
-	gpiod_line_bulk_add_line(bulk, line0);
-	gpiod_line_bulk_add_line(bulk, line1);
-	gpiod_line_bulk_add_line(bulk, line2);
-
-	values[0] = 0;
-	values[1] = 1;
-	values[2] = 2;
-
-	ret = gpiod_line_request_bulk_output(bulk,
-			GPIOD_TEST_CONSUMER, values);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_line_direction(line0), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_line_direction(line1), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_line_direction(line2), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 1);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
-
-	ret = gpiod_line_set_direction_input_bulk(bulk);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_direction(line0), ==,
-			GPIOD_LINE_DIRECTION_INPUT);
-	g_assert_cmpint(gpiod_line_direction(line1), ==,
-			GPIOD_LINE_DIRECTION_INPUT);
-	g_assert_cmpint(gpiod_line_direction(line2), ==,
-			GPIOD_LINE_DIRECTION_INPUT);
-
-	values[0] = 2;
-	values[1] = 1;
-	values[2] = 0;
-
-	ret = gpiod_line_set_direction_output_bulk(bulk, values);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_direction(line0), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_line_direction(line1), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_line_direction(line2), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 1);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 1);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-
-	ret = gpiod_line_set_direction_output_bulk(bulk, NULL);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_direction(line0), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_line_direction(line1), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_line_direction(line2), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-}
-
-GPIOD_TEST_CASE(output_value_caching, 0, { 8 })
-{
-	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 2);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	/* check cached by request... */
-	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 1);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
-
-	/* ...by checking cached value applied by set_flags */
-	ret = gpiod_line_set_flags(line, 0);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
-
-	/* check cached by set_value */
-	ret = gpiod_line_set_value(line, 0);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-
-	ret = gpiod_line_set_flags(line, 0);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-
-	ret = gpiod_line_set_value(line, 1);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
-
-	ret = gpiod_line_set_flags(line, 0);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
-
-	/* check cached by set_config */
-	ret = gpiod_line_set_config(line, GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
-				    0, 0);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-
-	ret = gpiod_line_set_flags(line, 0);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-
-	/* check cached by set_value_bulk default */
-	ret = gpiod_line_set_value(line, 1);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
-
-	bulk = gpiod_line_bulk_new(1);
-	g_assert_nonnull(bulk);
-	gpiod_test_return_if_failed();
-
-	gpiod_line_bulk_add_line(bulk, line);
-	ret = gpiod_line_set_value_bulk(bulk, NULL);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-
-	ret = gpiod_line_set_flags(line, 0);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
-}
-
-GPIOD_TEST_CASE(direction, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 5);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 1);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_line_direction(line), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 5), ==, 1);
-
-	gpiod_line_release(line);
-
-	ret = gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_direction(line), ==,
-			GPIOD_LINE_DIRECTION_INPUT);
-}
-
-GPIOD_TEST_CASE(active_state, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 5);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	g_assert_false(gpiod_line_is_active_low(line));
-
-	gpiod_line_release(line);
-
-	ret = gpiod_line_request_input_flags(line, GPIOD_TEST_CONSUMER,
-					GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	g_assert_cmpint(gpiod_line_direction(line), ==,
-			GPIOD_LINE_DIRECTION_INPUT);
-
-	gpiod_line_release(line);
-
-	ret = gpiod_line_request_output_flags(line, GPIOD_TEST_CONSUMER,
-			GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW, 0);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	g_assert_cmpint(gpiod_line_direction(line), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 5), ==, 1);
-
-	gpiod_line_release(line);
-
-	ret = gpiod_line_request_output_flags(line,
-			GPIOD_TEST_CONSUMER, 0, 0);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	g_assert_cmpint(gpiod_line_direction(line), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_test_chip_get_value(0, 5), ==, 0);
-
-}
-
-GPIOD_TEST_CASE(misc_flags, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_request_config config;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 2);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	g_assert_false(gpiod_line_is_used(line));
-	g_assert_cmpint(gpiod_line_drive(line), ==, GPIOD_LINE_DRIVE_PUSH_PULL);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
-
-	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
-	config.consumer = GPIOD_TEST_CONSUMER;
-	config.flags = GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN;
-
-	ret = gpiod_line_request(line, &config, 0);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	g_assert_true(gpiod_line_is_used(line));
-	g_assert_cmpint(gpiod_line_drive(line), ==,
-			GPIOD_LINE_DRIVE_OPEN_DRAIN);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
-	g_assert_cmpint(gpiod_line_direction(line), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-
-	gpiod_line_release(line);
-
-	config.flags = GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE;
-
-	ret = gpiod_line_request(line, &config, 0);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	g_assert_true(gpiod_line_is_used(line));
-	g_assert_cmpint(gpiod_line_drive(line), ==,
-			GPIOD_LINE_DRIVE_OPEN_SOURCE);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
-	g_assert_cmpint(gpiod_line_direction(line), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-
-	gpiod_line_release(line);
-}
-
-GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_request_config config;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 2);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	/*
-	 * Verify that open drain/source flags work together
-	 * with active_low.
-	 */
-
-	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
-	config.consumer = GPIOD_TEST_CONSUMER;
-	config.flags = GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN |
-		       GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
-
-	ret = gpiod_line_request(line, &config, 0);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	g_assert_true(gpiod_line_is_used(line));
-	g_assert_cmpint(gpiod_line_drive(line), ==,
-			GPIOD_LINE_DRIVE_OPEN_DRAIN);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
-	g_assert_true(gpiod_line_is_active_low(line));
-	g_assert_cmpint(gpiod_line_direction(line), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-
-	gpiod_line_release(line);
-
-	config.flags = GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE |
-		       GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
-
-	ret = gpiod_line_request(line, &config, 0);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	g_assert_true(gpiod_line_is_used(line));
-	g_assert_cmpint(gpiod_line_drive(line), ==,
-			GPIOD_LINE_DRIVE_OPEN_SOURCE);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
-	g_assert_true(gpiod_line_is_active_low(line));
-
-	gpiod_line_release(line);
-
-	/*
-	 * Verify that pull-up/down flags work together
-	 * with active_low.
-	 */
-
-	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_INPUT;
-	config.flags = GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN |
-		       GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
-
-	ret = gpiod_line_request(line, &config, 0);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	g_assert_true(gpiod_line_is_used(line));
-	g_assert_cmpint(gpiod_line_drive(line), ==, GPIOD_LINE_DRIVE_PUSH_PULL);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_PULL_DOWN);
-	g_assert_true(gpiod_line_is_active_low(line));
-	g_assert_cmpint(gpiod_line_direction(line), ==,
-			GPIOD_LINE_DIRECTION_INPUT);
-
-	ret = gpiod_line_get_value(line);
-	g_assert_cmpint(ret, ==, 1);
-
-	gpiod_line_release(line);
-
-	config.flags = GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP |
-		       GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
-
-	ret = gpiod_line_request(line, &config, 0);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	g_assert_true(gpiod_line_is_used(line));
-	g_assert_cmpint(gpiod_line_drive(line), ==, GPIOD_LINE_DRIVE_PUSH_PULL);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_PULL_UP);
-	g_assert_true(gpiod_line_is_active_low(line));
-	g_assert_cmpint(gpiod_line_direction(line), ==,
-			GPIOD_LINE_DIRECTION_INPUT);
-
-	ret = gpiod_line_get_value(line);
-	g_assert_cmpint(ret, ==, 0);
-
-	gpiod_line_release(line);
-}
-
-GPIOD_TEST_CASE(open_source_open_drain_input_mode, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 2);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_input_flags(line, GPIOD_TEST_CONSUMER,
-					GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, EINVAL);
-
-	ret = gpiod_line_request_input_flags(line, GPIOD_TEST_CONSUMER,
-					GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, EINVAL);
-}
-
-GPIOD_TEST_CASE(open_source_open_drain_simultaneously, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 2);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_output_flags(line, GPIOD_TEST_CONSUMER,
-					GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE |
-					GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN, 1);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, EINVAL);
-}
-
-GPIOD_TEST_CASE(multiple_bias_flags, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 2);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_request_input_flags(line, GPIOD_TEST_CONSUMER,
-					GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED |
-					GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, EINVAL);
-
-	ret = gpiod_line_request_input_flags(line, GPIOD_TEST_CONSUMER,
-					GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED |
-					GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, EINVAL);
-
-	ret = gpiod_line_request_input_flags(line, GPIOD_TEST_CONSUMER,
-					GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN |
-					GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, EINVAL);
-
-	ret = gpiod_line_request_input_flags(line, GPIOD_TEST_CONSUMER,
-					GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED |
-					GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN |
-					GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, EINVAL);
-}
-
-
-/* Verify that the reference counting of the line fd handle works correctly. */
-GPIOD_TEST_CASE(release_one_use_another, 0, { 8 })
-{
-	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line0;
-	struct gpiod_line *line1;
-	gint ret, vals[2];
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line0 = gpiod_chip_get_line(chip, 2);
-	line1 = gpiod_chip_get_line(chip, 3);
-	g_assert_nonnull(line0);
-	g_assert_nonnull(line1);
-	gpiod_test_return_if_failed();
-
-	bulk = gpiod_line_bulk_new(2);
-	g_assert_nonnull(bulk);
-	gpiod_test_return_if_failed();
-
-	gpiod_line_bulk_add_line(bulk, line0);
-	gpiod_line_bulk_add_line(bulk, line1);
-
-	vals[0] = vals[1] = 1;
-
-	ret = gpiod_line_request_bulk_output(bulk, GPIOD_TEST_CONSUMER, vals);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-
-	gpiod_line_release(line0);
-
-	ret = gpiod_line_get_value(line0);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, EPERM);
-}
-
-GPIOD_TEST_CASE(null_consumer, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_request_config config;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 2);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_INPUT;
-	config.consumer = NULL;
-	config.flags = 0;
-
-	ret = gpiod_line_request(line, &config, 0);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-	g_assert_cmpstr(gpiod_line_consumer(line), ==, "?");
-
-	gpiod_line_release(line);
-
-	/*
-	 * Internally we use different structures for event requests, so we
-	 * need to test that explicitly too.
-	 */
-	config.request_type = GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES;
-
-	ret = gpiod_line_request(line, &config, 0);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpstr(gpiod_line_consumer(line), ==, "?");
-}
-
-GPIOD_TEST_CASE(empty_consumer, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_request_config config;
-	struct gpiod_line *line;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	line = gpiod_chip_get_line(chip, 2);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-
-	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_INPUT;
-	config.consumer = "";
-	config.flags = 0;
-
-	ret = gpiod_line_request(line, &config, 0);
-	g_assert_cmpint(ret, ==, 0);
-	gpiod_test_return_if_failed();
-	g_assert_cmpstr(gpiod_line_consumer(line), ==, "?");
-
-	gpiod_line_release(line);
-
-	/*
-	 * Internally we use different structures for event requests, so we
-	 * need to test that explicitly too.
-	 */
-	config.request_type = GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES;
-
-	ret = gpiod_line_request(line, &config, 0);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpstr(gpiod_line_consumer(line), ==, "?");
-}
diff --git a/tests/tests-misc.c b/tests/tests-misc.c
index 051ab81..3f7b33e 100644
--- a/tests/tests-misc.c
+++ b/tests/tests-misc.c
@@ -1,25 +1,97 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
-#include <string.h>
+#include <errno.h>
+#include <glib.h>
+#include <gpiod.h>
+#include <unistd.h>
 
 #include "gpiod-test.h"
+#include "gpiod-test-helpers.h"
+#include "gpiod-test-sim.h"
 
 #define GPIOD_TEST_GROUP "misc"
 
-GPIOD_TEST_CASE(version_string, 0, { 1 })
+GPIOD_TEST_CASE(is_gpiochip_bad)
 {
+	g_assert_false(gpiod_is_gpiochip_device("/dev/null"));
+	g_assert_false(gpiod_is_gpiochip_device("/dev/nonexistent"));
+}
+
+GPIOD_TEST_CASE(is_gpiochip_good)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+
+	g_assert_true(gpiod_is_gpiochip_device(
+			g_gpiosim_chip_get_dev_path(sim)));
+}
+
+GPIOD_TEST_CASE(is_gpiochip_link_bad)
+{
+	g_autofree gchar *uuid;
+	g_autofree gchar *link;
+	gint ret;
+
+	uuid = g_uuid_string_random();
+	link = g_strdup_printf("/tmp/%s", uuid);
+
+	ret = symlink("/dev/null", link);
+	g_assert_cmpint(ret, ==, 0);
+	gpiod_test_return_if_failed();
+
+	g_assert_false(gpiod_is_gpiochip_device(link));
+	ret = unlink(link);
+	g_assert_cmpint(ret, ==, 0);
+}
+
+GPIOD_TEST_CASE(is_gpiochip_link_good)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autofree gchar *uuid;
+	g_autofree gchar *link;
+	gint ret;
+
+	uuid = g_uuid_string_random();
+	link = g_strdup_printf("/tmp/%s", uuid);
+
+	ret = symlink(g_gpiosim_chip_get_dev_path(sim), link);
+	g_assert_cmpint(ret, ==, 0);
+	gpiod_test_return_if_failed();
+
+	g_assert_true(gpiod_is_gpiochip_device(link));
+	ret = unlink(link);
+	g_assert_cmpint(ret, ==, 0);
+}
+
+GPIOD_TEST_CASE(version_string)
+{
+	static const gchar *const pattern = "^[0-9][1-9]?\\.[0-9][1-9]?([\\.0-9]?|\\-devel)$";
+
+	g_autoptr(GError) err = NULL;
 	g_autoptr(GRegex) regex = NULL;
-	GError *err = NULL;
+	g_autoptr(GMatchInfo) match = NULL;
+	g_autofree gchar *res = NULL;
 	const gchar *ver;
+	gboolean ret;
 
 	ver = gpiod_version_string();
 	g_assert_nonnull(ver);
 	gpiod_test_return_if_failed();
-	g_assert_cmpuint(strlen(ver), >, 0);
 
-	regex = g_regex_new("^[0-9]+\\.[0-9]+[0-9a-zA-Z\\.-]*$", 0, 0, &err);
-	g_assert_null(err);
+	regex = g_regex_new(pattern, 0, 0, &err);
+	g_assert_nonnull(regex);
+	g_assert_no_error(err);
 	gpiod_test_return_if_failed();
-	g_assert_true(g_regex_match(regex, ver, 0, NULL));
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
 }
diff --git a/tests/tests-request-config.c b/tests/tests-request-config.c
new file mode 100644
index 0000000..becb414
--- /dev/null
+++ b/tests/tests-request-config.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+#include <glib.h>
+#include <gpiod.h>
+
+#include "gpiod-test.h"
+#include "gpiod-test-helpers.h"
+
+#define GPIOD_TEST_GROUP "request-config"
+
+GPIOD_TEST_CASE(default_config)
+{
+	g_autoptr(struct_gpiod_request_config) config = NULL;
+
+	config = gpiod_test_create_request_config_or_fail();
+
+	g_assert_null(gpiod_request_config_get_consumer(config));
+	g_assert_cmpuint(gpiod_request_config_get_num_offsets(config), ==, 0);
+	g_assert_cmpuint(gpiod_request_config_get_event_buffer_size(config),
+			 ==, 0);
+}
+
+GPIOD_TEST_CASE(consumer)
+{
+	g_autoptr(struct_gpiod_request_config) config = NULL;
+
+	config = gpiod_test_create_request_config_or_fail();
+
+	gpiod_request_config_set_consumer(config, "foobar");
+	g_assert_cmpstr(gpiod_request_config_get_consumer(config),
+			==, "foobar");
+}
+
+GPIOD_TEST_CASE(offsets)
+{
+	static const guint offsets[] = { 0, 3, 4, 7 };
+
+	g_autoptr(struct_gpiod_request_config) config = NULL;
+	guint read_back[4], i;
+
+	config = gpiod_test_create_request_config_or_fail();
+
+	gpiod_request_config_set_offsets(config, 4, offsets);
+	g_assert_cmpuint(gpiod_request_config_get_num_offsets(config), ==, 4);
+	memset(read_back, 0, sizeof(read_back));
+	gpiod_request_config_get_offsets(config, read_back);
+	for (i = 0; i < 4; i++)
+		g_assert_cmpuint(read_back[i], ==, offsets[i]);
+}
+
+GPIOD_TEST_CASE(max_offsets)
+{
+	static const guint offsets_good[] = {
+		 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15,
+		16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
+		32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
+		48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63
+	};
+
+	static const guint offsets_bad[] = {
+		 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15,
+		16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
+		32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
+		48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
+		64
+	};
+
+	g_autoptr(struct_gpiod_request_config) config = NULL;
+
+	config = gpiod_test_create_request_config_or_fail();
+
+	gpiod_request_config_set_offsets(config, 64, offsets_good);
+	g_assert_cmpuint(gpiod_request_config_get_num_offsets(config), ==, 64);
+
+	gpiod_request_config_set_offsets(config, 65, offsets_bad);
+	/* Should get truncated. */
+	g_assert_cmpuint(gpiod_request_config_get_num_offsets(config), ==, 64);
+}
+
+GPIOD_TEST_CASE(event_buffer_size)
+{
+	g_autoptr(struct_gpiod_request_config) config = NULL;
+
+	config = gpiod_test_create_request_config_or_fail();
+
+	gpiod_request_config_set_event_buffer_size(config, 128);
+	g_assert_cmpuint(gpiod_request_config_get_event_buffer_size(config),
+			 ==, 128);
+}
-- 
2.30.1

