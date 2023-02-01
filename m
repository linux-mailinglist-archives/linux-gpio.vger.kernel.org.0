Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC83686B72
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Feb 2023 17:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbjBAQW4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Feb 2023 11:22:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjBAQWz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2023 11:22:55 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94BF666EF3
        for <linux-gpio@vger.kernel.org>; Wed,  1 Feb 2023 08:22:51 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id k16so13102136wms.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2023 08:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I4Pz/aV4MaxZ7XW0z6EI6qHaEIfZ2oop6n2w7cADaiU=;
        b=G3EYCoc4cTRY+PV1RVssQQYWLUVM/WnKC9W4TJ4QHVtPxB2RC5ic1fdQ3BvwWyZreS
         bmJrAVn/QmNzWQhpH2fjrqekNDpc82IBkA39v9Ce/TCxdJ+ph/SHDTt5ELYgfR0/DP+q
         OR3HoA02ua3ZHflvPk5SMBn4Ffm2uFQ6SVj+X8jEzXzkhaTSpSBaCBJQ+JPhE/f60JvV
         Jqk5l66gaJGKSmg7zAJrpylFvGQV7TTGd/51Ri0e96N5xL7lacjCnagvGm/Wfns+7zrY
         L5lhOjb89WQbT64Xn7VdYg7VYXNhuo0va1XLs8AneQgbS+u5uVnyYtfU4gbxOKWY1uL6
         nCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I4Pz/aV4MaxZ7XW0z6EI6qHaEIfZ2oop6n2w7cADaiU=;
        b=lFK8htBtTidhMfb/7m0MVSFvxxct5mDG0rb1DO4q4mw6eMFH3BC9hSj9MW6iwiXaaS
         v8E0sm/tYbBTLB++pH6GRpqxcmje8JXTNp57vzcxiVxYWu3VPfGWCoY0CS62CmNQkGJj
         /W9V6KtM4pkhUXIGdRLqOYnKepOIdZLBKlvYuvZ9RUjTnzDDJRCum5scn0MIxbLmMjYI
         //vMPRKHaIHqksjr0wiFVIS9ItkZ8gnoeuTvwP/M5DitB/RYp3GSwK8poe5cr5QY5sQW
         cvY/naoI16nVE/EAcdQ0hmcV6xGe2bu2inZ9TnBHxo3d6iV4V8rZEBzY6Z7kMo9Hkv49
         DGIQ==
X-Gm-Message-State: AO0yUKWkQIG6ml7xqgIetGYSCsSiswEyibdMRd7a0xHvY6E6V5S0BPTG
        BQQRQqfwEFBq7B8bj214tH5zWg==
X-Google-Smtp-Source: AK7set+znHxbi1aI9A/gY0F46gRxTLzXF1kyIslY0NessbppFpDelVYY0XQWY/xIDtzDwhJgaQv6LQ==
X-Received: by 2002:a05:600c:1d04:b0:3dc:5dd4:7d3f with SMTP id l4-20020a05600c1d0400b003dc5dd47d3fmr2529985wms.24.1675268569945;
        Wed, 01 Feb 2023 08:22:49 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d64:a4e6:40a8:8e69])
        by smtp.gmail.com with ESMTPSA id hg15-20020a05600c538f00b003df7b40f99fsm258649wmb.11.2023.02.01.08.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 08:22:49 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] tests: rework error handling and stop overusing g_error()
Date:   Wed,  1 Feb 2023 17:22:47 +0100
Message-Id: <20230201162247.218716-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GLib recommends using g_error() only for programming errors and
unrecoverable situations. It calls abort() and triggers a core dump. This
means that if we encounter an error when running a test case, we'll
exit immediately and leave a "leaked" GPIO simulator in configfs.

Rework the error handling: use g_error() only when a programming bug is
encountered (e.g. invalid enum value) while everywhere else use the
regular GError-based error handling. This way, in case of an error in
libgpiosim, we'll simply fail the current test case and release all
resources as usual.

In order not to pollute the test cases with error handling, let's hide the
actual error checking behind macros for g_gpiosim_chip_new() and
g_gpiosim_chip_get_value(). For g_gpiosim_chip_set_pull() let's just emit
a log and do nothing as the test case in question will inevitably fail if
the expected value is not correctly read back.

In order for the chip to get a failing constructor, we need to link the
test-suite against the entire libgio, not only libgobject (for the
GInitable interface).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac           |   2 +-
 tests/Makefile.am      |   4 +-
 tests/gpiod-test-sim.c | 329 +++++++++++++++++++++++++++++------------
 tests/gpiod-test-sim.h |  42 +++++-
 tests/gpiod-test.c     |  33 +++--
 5 files changed, 298 insertions(+), 112 deletions(-)

diff --git a/configure.ac b/configure.ac
index ab1a9fd..f16f29a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -153,7 +153,7 @@ then
 
 	# For core library tests
 	PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.50])
-	PKG_CHECK_MODULES([GOBJECT], [gobject-2.0 >= 2.50])
+	PKG_CHECK_MODULES([GIO], [gio-2.0 >= 2.50])
 
 	AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_LIB([asprintf])])
 	AC_CHECK_FUNC([prctl], [], [FUNC_NOT_FOUND_LIB([prctl])])
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 0fdbe5b..9171a58 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -5,12 +5,12 @@ SUBDIRS = gpiosim
 
 AM_CFLAGS = -I$(top_srcdir)/include/ -I$(top_srcdir)/tests/gpiosim/
 AM_CFLAGS += -include $(top_builddir)/config.h
-AM_CFLAGS += -Wall -Wextra -g -std=gnu89 $(GLIB_CFLAGS) $(GOBJECT_CFLAGS)
+AM_CFLAGS += -Wall -Wextra -g -std=gnu89 $(GLIB_CFLAGS) $(GIO_CFLAGS)
 AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiod-test\"
 AM_CFLAGS += $(PROFILING_CFLAGS)
 LDADD = $(top_builddir)/lib/libgpiod.la
 LDADD += $(top_builddir)/tests/gpiosim/libgpiosim.la
-LDADD += $(GLIB_LIBS) $(GOBJECT_LIBS)
+LDADD += $(GLIB_LIBS) $(GIO_LIBS)
 
 bin_PROGRAMS = gpiod-test
 
diff --git a/tests/gpiod-test-sim.c b/tests/gpiod-test-sim.c
index b934a16..3939825 100644
--- a/tests/gpiod-test-sim.c
+++ b/tests/gpiod-test-sim.c
@@ -8,9 +8,16 @@
 
 #include "gpiod-test-sim.h"
 
+G_DEFINE_QUARK(g-gpiosim-error, g_gpiosim_error);
+
 struct _GPIOSimChip {
 	GObject parent_instance;
 	struct gpiosim_bank *bank;
+	GError *construct_err;
+	guint num_lines;
+	gchar *label;
+	GVariant *line_names;
+	GVariant *hogs;
 };
 
 enum {
@@ -24,35 +31,167 @@ enum {
 
 static struct gpiosim_ctx *sim_ctx;
 
-G_DEFINE_TYPE(GPIOSimChip, g_gpiosim_chip, G_TYPE_OBJECT);
+static gboolean
+g_gpiosim_chip_initable_init(GInitable *initable,
+			     GCancellable *cancellable G_GNUC_UNUSED,
+			     GError **err)
+{
+	GPIOSimChip *self = G_GPIOSIM_CHIP_OBJ(initable);
+
+	if (self->construct_err) {
+		g_propagate_error(err, self->construct_err);
+		self->construct_err = NULL;
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+static void g_gpiosim_chip_initable_iface_init(GInitableIface *iface)
+{
+	iface->init = g_gpiosim_chip_initable_init;
+}
+
+G_DEFINE_TYPE_WITH_CODE(GPIOSimChip, g_gpiosim_chip, G_TYPE_OBJECT,
+			G_IMPLEMENT_INTERFACE(
+				G_TYPE_INITABLE,
+				g_gpiosim_chip_initable_iface_init));
 
 static void g_gpiosim_ctx_unref(void)
 {
 	gpiosim_ctx_unref(sim_ctx);
 }
 
-static void g_gpiosim_ctx_init(void)
+static gboolean g_gpiosim_chip_apply_line_names(GPIOSimChip *self)
 {
-	sim_ctx = gpiosim_ctx_new();
-	if (!sim_ctx)
-		g_error("Unable to initialize libgpiosim: %s",
-			g_strerror(errno));
+	g_autoptr(GVariantIter) iter = NULL;
+	guint offset;
+	gchar *name;
+	int ret;
 
-	atexit(g_gpiosim_ctx_unref);
+	if (!self->line_names)
+		return TRUE;
+
+	iter = g_variant_iter_new(self->line_names);
+
+	while (g_variant_iter_loop(iter, "(us)", &offset, &name)) {
+		ret = gpiosim_bank_set_line_name(self->bank, offset, name);
+		if (ret) {
+			g_set_error(&self->construct_err, G_GPIOSIM_ERROR,
+				    G_GPIOSIM_ERR_CHIP_INIT_FAILED,
+				    "Unable to set the name of the simulated GPIO line: %s",
+				    g_strerror(errno));
+			return FALSE;
+		}
+	}
+
+	return TRUE;
 }
 
-static void g_gpiosim_chip_constructed(GObject *obj)
+static gboolean g_gpiosim_chip_apply_hogs(GPIOSimChip *self)
+{
+	g_autoptr(GVariantIter) iter = NULL;
+	enum gpiosim_direction dir;
+	guint offset;
+	gchar *name;
+	gint vdir;
+	int ret;
+
+	if (!self->hogs)
+		return TRUE;
+
+	iter = g_variant_iter_new(self->hogs);
+
+	while (g_variant_iter_loop(iter, "(usi)", &offset, &name, &vdir)) {
+		switch (vdir) {
+		case G_GPIOSIM_DIRECTION_INPUT:
+			dir = GPIOSIM_DIRECTION_INPUT;
+			break;
+		case G_GPIOSIM_DIRECTION_OUTPUT_HIGH:
+			dir = GPIOSIM_DIRECTION_OUTPUT_HIGH;
+			break;
+		case G_GPIOSIM_DIRECTION_OUTPUT_LOW:
+			dir = GPIOSIM_DIRECTION_OUTPUT_LOW;
+			break;
+		default:
+			g_error("Invalid hog direction value: %d", vdir);
+		}
+
+		ret = gpiosim_bank_hog_line(self->bank, offset, name, dir);
+		if (ret) {
+			g_set_error(&self->construct_err, G_GPIOSIM_ERROR,
+				    G_GPIOSIM_ERR_CHIP_INIT_FAILED,
+				    "Unable to hog the simulated GPIO line: %s",
+				    g_strerror(errno));
+			return FALSE;
+		}
+	}
+
+	return TRUE;
+}
+
+static gboolean g_gpiosim_chip_apply_properties(GPIOSimChip *self)
+{
+	int ret;
+
+	ret = gpiosim_bank_set_num_lines(self->bank, self->num_lines);
+	if (ret) {
+		g_set_error(&self->construct_err, G_GPIOSIM_ERROR,
+			    G_GPIOSIM_ERR_CHIP_INIT_FAILED,
+			    "Unable to set the number of lines exposed by the simulated chip: %s",
+			    g_strerror(errno));
+		return FALSE;
+	}
+
+	if (self->label) {
+		ret = gpiosim_bank_set_label(self->bank, self->label);
+		if (ret) {
+			g_set_error(&self->construct_err, G_GPIOSIM_ERROR,
+				    G_GPIOSIM_ERR_CHIP_INIT_FAILED,
+				    "Unable to set the label of the simulated chip: %s",
+				    g_strerror(errno));
+			return FALSE;
+		}
+	}
+
+	ret = g_gpiosim_chip_apply_line_names(self);
+	if (!ret)
+		return FALSE;
+
+	return g_gpiosim_chip_apply_hogs(self);
+}
+
+static gboolean g_gpiosim_chip_enable(GPIOSimChip *self)
 {
-	GPIOSimChip *self = G_GPIOSIM_CHIP(obj);
 	struct gpiosim_dev *dev;
-	gint ret;
+	int ret;
 
 	dev = gpiosim_bank_get_dev(self->bank);
 	ret = gpiosim_dev_enable(dev);
 	gpiosim_dev_unref(dev);
-	if (ret)
-		g_error("Error while trying to enable the simulated GPIO device: %s",
-			g_strerror(errno));
+	if (ret) {
+		g_set_error(&self->construct_err, G_GPIOSIM_ERROR,
+			    G_GPIOSIM_ERR_CHIP_ENABLE_FAILED,
+			    "Error while trying to enable the simulated GPIO device: %s",
+			    g_strerror(errno));
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+static void g_gpiosim_chip_constructed(GObject *obj)
+{
+	GPIOSimChip *self = G_GPIOSIM_CHIP(obj);
+	gboolean ret;
+
+	ret = g_gpiosim_chip_apply_properties(self);
+	if (!ret)
+		return;
+
+	ret = g_gpiosim_chip_enable(self);
+	if (!ret)
+		return;
 
 	G_OBJECT_CLASS(g_gpiosim_chip_parent_class)->constructed(obj);
 }
@@ -77,80 +216,36 @@ static void g_gpiosim_chip_get_property(GObject *obj, guint prop_id,
 	}
 }
 
+static void set_variant_prop(GVariant **prop, const GValue *val)
+{
+	GVariant *variant = g_value_get_variant(val);
+
+	g_clear_pointer(prop, g_variant_unref);
+	if (variant)
+		*prop = g_variant_ref(variant);
+}
+
 static void g_gpiosim_chip_set_property(GObject *obj, guint prop_id,
 					const GValue *val, GParamSpec *pspec)
 {
 	GPIOSimChip *self = G_GPIOSIM_CHIP(obj);
-	gint ret, vdir, dir;
-	GVariantIter *iter;
-	GVariant *variant;
-	guint offset;
-	gchar *name;
+	const gchar *label;
 
 	switch (prop_id) {
 	case G_GPIOSIM_CHIP_PROP_NUM_LINES:
-		ret = gpiosim_bank_set_num_lines(self->bank,
-						 g_value_get_uint(val));
-		if (ret)
-			g_error("Unable to set the number of lines exposed by the simulated chip: %s",
-				g_strerror(errno));
+		self->num_lines = g_value_get_uint(val);
 		break;
 	case G_GPIOSIM_CHIP_PROP_LABEL:
-		ret = gpiosim_bank_set_label(self->bank,
-					     g_value_get_string(val));
-		if (ret)
-			g_error("Unable to set the label of the simulated chip: %s",
-				g_strerror(errno));
+		g_clear_pointer(&self->label, g_free);
+		label = g_value_get_string(val);
+		if (label)
+			self->label = g_strdup(label);
 		break;
 	case G_GPIOSIM_CHIP_PROP_LINE_NAMES:
-		variant = g_value_get_variant(val);
-		if (!variant)
-			break;
-
-		iter = g_variant_iter_new(variant);
-
-		while (g_variant_iter_loop(iter, "(us)", &offset, &name)) {
-			ret = gpiosim_bank_set_line_name(self->bank,
-							 offset, name);
-			if (ret)
-				g_error("Unable to set the name of the simulated GPIO line: %s",
-					g_strerror(errno));
-		}
-
-		g_variant_iter_free(iter);
+		set_variant_prop(&self->line_names, val);
 		break;
 	case G_GPIOSIM_CHIP_PROP_HOGS:
-		variant = g_value_get_variant(val);
-		if (!variant)
-			break;
-
-		iter = g_variant_iter_new(variant);
-
-		while (g_variant_iter_loop(iter, "(usi)",
-					   &offset, &name, &vdir)) {
-			switch (vdir) {
-			case G_GPIOSIM_DIRECTION_INPUT:
-				dir = GPIOSIM_DIRECTION_INPUT;
-				break;
-			case G_GPIOSIM_DIRECTION_OUTPUT_HIGH:
-				dir = GPIOSIM_DIRECTION_OUTPUT_HIGH;
-				break;
-			case G_GPIOSIM_DIRECTION_OUTPUT_LOW:
-				dir = GPIOSIM_DIRECTION_OUTPUT_LOW;
-				break;
-			default:
-				g_error("Invalid hog direction value: %d",
-					vdir);
-			}
-
-			ret = gpiosim_bank_hog_line(self->bank,
-						    offset, name, dir);
-			if (ret)
-				g_error("Unable to hog the simulated GPIO line: %s",
-					g_strerror(errno));
-		}
-
-		g_variant_iter_free(iter);
+		set_variant_prop(&self->hogs, val);
 		break;
 	default:
 		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
@@ -158,19 +253,32 @@ static void g_gpiosim_chip_set_property(GObject *obj, guint prop_id,
 	}
 }
 
+static void g_gpiosim_chip_dispose(GObject *obj)
+{
+	GPIOSimChip *self = G_GPIOSIM_CHIP(obj);
+
+	g_clear_pointer(&self->line_names, g_variant_unref);
+	g_clear_pointer(&self->hogs, g_variant_unref);
+
+	G_OBJECT_CLASS(g_gpiosim_chip_parent_class)->dispose(obj);
+}
+
 static void g_gpiosim_chip_finalize(GObject *obj)
 {
 	GPIOSimChip *self = G_GPIOSIM_CHIP(obj);
 	struct gpiosim_dev *dev;
 	gint ret;
 
+	g_clear_error(&self->construct_err);
+	g_clear_pointer(&self->label, g_free);
+
 	dev = gpiosim_bank_get_dev(self->bank);
 
 	if (gpiosim_dev_is_live(dev)) {
 		ret = gpiosim_dev_disable(dev);
 		if (ret)
-			g_error("Error while trying to disable the simulated GPIO device: %s",
-				g_strerror(errno));
+			g_warning("Error while trying to disable the simulated GPIO device: %s",
+				  g_strerror(errno));
 	}
 
 	gpiosim_dev_unref(dev);
@@ -186,6 +294,7 @@ static void g_gpiosim_chip_class_init(GPIOSimChipClass *chip_class)
 	class->constructed = g_gpiosim_chip_constructed;
 	class->get_property = g_gpiosim_chip_get_property;
 	class->set_property = g_gpiosim_chip_set_property;
+	class->dispose = g_gpiosim_chip_dispose;
 	class->finalize = g_gpiosim_chip_finalize;
 
 	g_object_class_install_property(
@@ -231,24 +340,57 @@ static void g_gpiosim_chip_class_init(GPIOSimChipClass *chip_class)
 			G_PARAM_WRITABLE | G_PARAM_CONSTRUCT_ONLY));
 }
 
+static gboolean g_gpiosim_ctx_init(GError **err)
+{
+	sim_ctx = gpiosim_ctx_new();
+	if (!sim_ctx) {
+		g_set_error(err, G_GPIOSIM_ERROR,
+			    G_GPIOSIM_ERR_CTX_INIT_FAILED,
+			    "Unable to initialize libgpiosim: %s",
+			    g_strerror(errno));
+		return FALSE;
+	}
+
+	atexit(g_gpiosim_ctx_unref);
+
+	return TRUE;
+}
+
 static void g_gpiosim_chip_init(GPIOSimChip *self)
 {
-	g_autofree gchar *dev_name = NULL;
 	struct gpiosim_dev *dev;
-
-	if (!sim_ctx)
-		g_gpiosim_ctx_init();
+	int ret;
+
+	self->construct_err = NULL;
+	self->num_lines = 1;
+	self->label = NULL;
+	self->line_names = NULL;
+	self->hogs = NULL;
+
+	if (!sim_ctx) {
+		ret = g_gpiosim_ctx_init(&self->construct_err);
+		if (!ret)
+			return;
+	}
 
 	dev = gpiosim_dev_new(sim_ctx);
-	if (!dev)
-		g_error("Unable to instantiate new GPIO device: %s",
-			g_strerror(errno));
+	if (!dev) {
+		g_set_error(&self->construct_err, G_GPIOSIM_ERROR,
+			    G_GPIOSIM_ERR_CHIP_INIT_FAILED,
+			    "Unable to instantiate new GPIO device: %s",
+			    g_strerror(errno));
+		return;
+	}
 
 	self->bank = gpiosim_bank_new(dev);
 	gpiosim_dev_unref(dev);
-	if (!self->bank)
-		g_error("Unable to instantiate new GPIO bank: %s",
-			g_strerror(errno));
+	if (!self->bank) {
+		g_set_error(&self->construct_err, G_GPIOSIM_ERROR,
+			    G_GPIOSIM_ERR_CHIP_INIT_FAILED,
+			    "Unable to instantiate new GPIO bank: %s",
+			    g_strerror(errno));
+		return;
+	}
 }
 
 static const gchar *
@@ -274,13 +416,18 @@ const gchar *g_gpiosim_chip_get_name(GPIOSimChip *self)
 	return g_gpiosim_chip_get_string_prop(self, "name");
 }
 
-gint g_gpiosim_chip_get_value(GPIOSimChip *chip, guint offset)
+gint _g_gpiosim_chip_get_value(GPIOSimChip *chip, guint offset, GError **err)
 {
 	gint val;
 
 	val = gpiosim_bank_get_value(chip->bank, offset);
-	if (val < 0)
-		g_error("Unable to read the line value: %s", g_strerror(errno));
+	if (val < 0) {
+		g_set_error(err, G_GPIOSIM_ERROR,
+			    G_GPIOSIM_ERR_GET_VALUE_FAILED,
+			    "Unable to read the line value: %s",
+			    g_strerror(errno));
+		return -1;
+	}
 
 	return val;
 }
@@ -302,6 +449,6 @@ void g_gpiosim_chip_set_pull(GPIOSimChip *chip, guint offset, GPIOSimPull pull)
 
 	ret = gpiosim_bank_set_pull(chip->bank, offset, sim_pull);
 	if (ret)
-		g_error("Unable to set the pull setting for simulated line: %s",
-			g_strerror(errno));
+		g_critical("Unable to set the pull setting for simulated line: %s",
+			    g_strerror(errno));
 }
diff --git a/tests/gpiod-test-sim.h b/tests/gpiod-test-sim.h
index db864e6..1293ea7 100644
--- a/tests/gpiod-test-sim.h
+++ b/tests/gpiod-test-sim.h
@@ -4,6 +4,7 @@
 #ifndef __GPIOD_TEST_SIM_H__
 #define __GPIOD_TEST_SIM_H__
 
+#include <gio/gio.h>
 #include <glib.h>
 #include <glib-object.h>
 
@@ -20,21 +21,52 @@ typedef enum {
 	G_GPIOSIM_DIRECTION_OUTPUT_LOW,
 } GPIOSimDirection;
 
+#define G_GPIOSIM_ERROR g_gpiosim_error_quark()
+
+typedef enum {
+	G_GPIOSIM_ERR_CTX_INIT_FAILED = 1,
+	G_GPIOSIM_ERR_CHIP_INIT_FAILED,
+	G_GPIOSIM_ERR_CHIP_ENABLE_FAILED,
+	G_GPIOSIM_ERR_GET_VALUE_FAILED,
+} GPIOSimError;
+
+GQuark g_gpiosim_error_quark(void);
+
 G_DECLARE_FINAL_TYPE(GPIOSimChip, g_gpiosim_chip, G_GPIOSIM, CHIP, GObject);
 
-#define G_GPIOSIM_TYPE_CHIP (g_gpiosim_chip_get_type())
-#define G_GPIOSIM_CHIP(obj) \
-	(G_TYPE_CHECK_INSTANCE_CAST((obj), G_GPIOSIM_TYPE_CHIP, GPIOSimChip))
+#define G_GPIOSIM_CHIP_TYPE (g_gpiosim_chip_get_type())
+#define G_GPIOSIM_CHIP_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), G_GPIOSIM_CHIP_TYPE, GPIOSimChip))
 
 #define g_gpiosim_chip_new(...) \
-	G_GPIOSIM_CHIP(g_object_new(G_GPIOSIM_TYPE_CHIP, __VA_ARGS__))
+	({ \
+		g_autoptr(GError) _err = NULL; \
+		GPIOSimChip *_chip = G_GPIOSIM_CHIP_OBJ( \
+					g_initable_new(G_GPIOSIM_CHIP_TYPE, \
+						       NULL, &_err, \
+						       __VA_ARGS__)); \
+		g_assert_no_error(_err); \
+		if (g_test_failed()) \
+			return; \
+		_chip; \
+	})
 
 const gchar *g_gpiosim_chip_get_dev_path(GPIOSimChip *self);
 const gchar *g_gpiosim_chip_get_name(GPIOSimChip *self);
 
-gint g_gpiosim_chip_get_value(GPIOSimChip *self, guint offset);
+gint _g_gpiosim_chip_get_value(GPIOSimChip *self, guint offset, GError **err);
 void g_gpiosim_chip_set_pull(GPIOSimChip *self, guint offset, GPIOSimPull pull);
 
+#define g_gpiosim_chip_get_value(self, offset) \
+	({ \
+		g_autoptr(GError) _err = NULL; \
+		gint _val = _g_gpiosim_chip_get_value(self, offset, &_err); \
+		g_assert_no_error(_err); \
+		if (g_test_failed()) \
+			return; \
+		_val; \
+	})
+
 G_END_DECLS
 
 #endif /* __GPIOD_TEST_SIM_H__ */
diff --git a/tests/gpiod-test.c b/tests/gpiod-test.c
index 39a1f40..05ec24a 100644
--- a/tests/gpiod-test.c
+++ b/tests/gpiod-test.c
@@ -18,7 +18,7 @@
 
 static GList *tests;
 
-static void check_kernel(void)
+static gboolean check_kernel(void)
 {
 	guint major, minor, release;
 	struct utsname un;
@@ -27,23 +27,29 @@ static void check_kernel(void)
 	g_debug("checking linux kernel version");
 
 	ret = uname(&un);
-	if (ret)
-		g_error("unable to read the kernel release version: %s",
-			g_strerror(errno));
+	if (ret) {
+		g_critical("unable to read the kernel release version: %s",
+			   g_strerror(errno));
+		return FALSE;
+	}
 
 	ret = sscanf(un.release, "%u.%u.%u", &major, &minor, &release);
-	if (ret != 3)
-		g_error("error reading kernel release version");
-
-	if (KERNEL_VERSION(major, minor, release) < MIN_KERNEL_VERSION)
-		g_error("linux kernel version must be at least v%u.%u.%u - got v%u.%u.%u",
-			MIN_KERNEL_MAJOR, MIN_KERNEL_MINOR, MIN_KERNEL_RELEASE,
-			major, minor, release);
+	if (ret != 3) {
+		g_critical("error reading kernel release version");
+		return FALSE;
+	}
+
+	if (KERNEL_VERSION(major, minor, release) < MIN_KERNEL_VERSION) {
+		g_critical("linux kernel version must be at least v%u.%u.%u - got v%u.%u.%u",
+			   MIN_KERNEL_MAJOR, MIN_KERNEL_MINOR, MIN_KERNEL_RELEASE,
+			   major, minor, release);
+		return FALSE;
+	}
 
 	g_debug("kernel release is v%u.%u.%u - ok to run tests",
 		major, minor, release);
 
-	return;
+	return TRUE;
 }
 
 static void test_func_wrapper(gconstpointer data)
@@ -68,7 +74,8 @@ int main(gint argc, gchar **argv)
 	g_debug("running libgpiod test suite");
 	g_debug("%u tests registered", g_list_length(tests));
 
-	check_kernel();
+	if (!check_kernel())
+		return 1;
 
 	g_list_foreach(tests, add_test_from_list, NULL);
 	g_list_free(tests);
-- 
2.37.2

