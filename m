Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D96D048AE8A
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 14:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240572AbiAKNhb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 08:37:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240616AbiAKNha (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jan 2022 08:37:30 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36786C061748
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 05:37:30 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id t28so26265165wrb.4
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 05:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cKEGAJWlZ/+D6rrcVGMa3Uh3GatF0zCfTfZNUuvmf7w=;
        b=WzR0AcHRcPptJAD/9Ogg9+eXm4Ev8dkuvEXWiFv3FO04oxPfS9gI0juhWilluaYag/
         H6M+yaawRxIc94yp+O+TjWEzubGoE+4l3JrCF4MdwT2L8LYV/uwAjKcMhXesDTfmWZLm
         Qr7lQfzV13OK2VJGvL5i/0lMOKmnWohZLdKKuB9Qzq1iwrdiy295yt2P1B8QbTxgRTEM
         Vjjp6xbS9f6BsKT7GV8M8zVg8hM8xr0Iw0YO/EqHXceuWY3+6SCrqxOC1q9tIyPuy9XF
         pZWgJNGYMfvTvqYIBIZqyg9A47Fs4zWve9z6VzNPtd+Q/XudNo25f4iext8CmRcVAGnz
         lq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cKEGAJWlZ/+D6rrcVGMa3Uh3GatF0zCfTfZNUuvmf7w=;
        b=jLcys+yilvFW0DIrK+hUh03dIxshkBEuxsVcTmeW4TAHYPnybGu0DTsQeqrWBZAU1d
         kSYsexPwukFIaDANCEUUi1oQlHkRHaWP3wLuaW0zTwQso3YA1mMvNkc+ftLQoAAncvqN
         Io54IhsEtTmR+Bz/aig57RgLV29rH8ibpxR+uMoTvXZJxS+Ic2SA1ug0gWwmUWxUOw5O
         TIsCjTOABDab7SqKpcSjuPYXdZkjgk1qnun0F4maobmqOc9Jz8p0kB2/k+JqPACTmXX/
         KxKQ6ZxeobwcCWGaUtaXdYbeFpKBqpjdMCg9XJdEkn8XcnaYGQELSMJHIgG6BqnJws+M
         a3Cw==
X-Gm-Message-State: AOAM530FRzu6F0S+u0eH2RalYaMrF5vhM7+LglxA2jW7s5MMIvUfK+5d
        tBHlWzoUurq8BK6b1RuEvUBmKg==
X-Google-Smtp-Source: ABdhPJyWreJTw9Ajgm3mJNxEcao2ramPMmntaqwVkE48NOrlixBRiMmUcIUSkOALor+HFOXAfaAaQg==
X-Received: by 2002:a05:6000:1687:: with SMTP id y7mr3805849wrd.636.1641908248770;
        Tue, 11 Jan 2022 05:37:28 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id f9sm1976186wry.115.2022.01.11.05.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 05:37:28 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 2/2] tests: port C tests to libgpiosim
Date:   Tue, 11 Jan 2022 14:37:20 +0100
Message-Id: <20220111133720.713541-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20220111133720.713541-1-brgl@bgdev.pl>
References: <20220111133720.713541-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This converts the core library tests to using libgpiosim instead of
libgpiod-mockup while keeping the same interface for tests.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 tests/Makefile.am  |   4 +-
 tests/gpiod-test.c | 143 ++++++++++++++++++++++++++++++++-------------
 tests/gpiod-test.h |   4 +-
 3 files changed, 108 insertions(+), 43 deletions(-)

diff --git a/tests/Makefile.am b/tests/Makefile.am
index 8a3d7c9..7bf5e3f 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -3,13 +3,13 @@
 
 SUBDIRS = mockup gpiosim
 
-AM_CFLAGS = -I$(top_srcdir)/include/ -I$(top_srcdir)/tests/mockup/
+AM_CFLAGS = -I$(top_srcdir)/include/ -I$(top_srcdir)/tests/gpiosim/
 AM_CFLAGS += -include $(top_builddir)/config.h
 AM_CFLAGS += -Wall -Wextra -g -std=gnu89 $(GLIB_CFLAGS)
 AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiod-test\"
 AM_LDFLAGS = -pthread
 LDADD = $(top_builddir)/lib/libgpiod.la
-LDADD += $(top_builddir)/tests/mockup/libgpiomockup.la
+LDADD += $(top_builddir)/tests/gpiosim/libgpiosim.la
 LDADD += $(GLIB_LIBS)
 
 bin_PROGRAMS = gpiod-test
diff --git a/tests/gpiod-test.c b/tests/gpiod-test.c
index ca5cdb3..aa9eaa4 100644
--- a/tests/gpiod-test.c
+++ b/tests/gpiod-test.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+// SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <errno.h>
 #include <glib/gstdio.h>
-#include <gpio-mockup.h>
+#include <gpiosim.h>
 #include <linux/version.h>
 #include <stdio.h>
 #include <sys/utsname.h>
@@ -30,7 +30,9 @@ struct gpiod_test_event_thread {
 
 static struct {
 	GList *tests;
-	struct gpio_mockup *mockup;
+	struct gpiosim_ctx *gpiosim;
+	GPtrArray *sim_chips;
+	GPtrArray *sim_banks;
 } globals;
 
 static void check_kernel(void)
@@ -61,29 +63,98 @@ static void check_kernel(void)
 	return;
 }
 
+static void remove_gpiosim_chip(gpointer data)
+{
+	struct gpiosim_dev *dev = data;
+	gint ret;
+
+	ret = gpiosim_dev_disable(dev);
+	if (ret)
+		g_error("unable to uncommit a simulated GPIO device: %s",
+			g_strerror(errno));
+
+	gpiosim_dev_unref(dev);
+}
+
+static void remove_gpiosim_bank(gpointer data)
+{
+	struct gpiosim_bank *bank = data;
+
+	gpiosim_bank_unref(bank);
+}
+
 static void test_func_wrapper(gconstpointer data)
 {
 	const _GpiodTestCase *test = data;
-	gint ret, flags = 0;
+	struct gpiosim_bank *sim_bank;
+	struct gpiosim_dev *sim_dev;
+	gchar *line_name, *label;
+	gchar chip_idx;
+	guint i, j;
+	gint ret;
+
+	globals.sim_chips = g_ptr_array_new_full(test->num_chips,
+						 remove_gpiosim_chip);
+	globals.sim_banks = g_ptr_array_new_full(test->num_chips,
+						 remove_gpiosim_bank);
+
+	for (i = 0; i < test->num_chips; i++) {
+		chip_idx = i + 65;
+
+		sim_dev = gpiosim_dev_new(globals.gpiosim, NULL);
+		if (!sim_dev)
+			g_error("unable to create a simulated GPIO chip: %s",
+				g_strerror(errno));
+
+		sim_bank = gpiosim_bank_new(sim_dev, NULL);
+		if (!sim_bank)
+			g_error("unable to create a simulated GPIO bank: %s",
+				g_strerror(errno));
+
+		label = g_strdup_printf("gpio-mockup-%c", chip_idx);
+		ret = gpiosim_bank_set_label(sim_bank, label);
+		g_free(label);
+		if (ret)
+			g_error("unable to set simulated chip label: %s",
+				g_strerror(errno));
+
+		ret = gpiosim_bank_set_num_lines(sim_bank, test->chip_sizes[i]);
+		if (ret)
+			g_error("unable to set the number of lines for a simulated chip: %s",
+				g_strerror(errno));
+
+		if (test->flags & GPIOD_TEST_FLAG_NAMED_LINES) {
+			for (j = 0; j < test->chip_sizes[i]; j++) {
+				line_name = g_strdup_printf("gpio-mockup-%c-%u",
+							    chip_idx, j);
+
+				ret = gpiosim_bank_set_line_name(sim_bank, j,
+								 line_name);
+				g_free(line_name);
+				if (ret)
+					g_error("unable to set the line names for a simulated bank: %s",
+						g_strerror(errno));
+			}
+		}
 
-	if (test->flags & GPIOD_TEST_FLAG_NAMED_LINES)
-		flags |= GPIO_MOCKUP_FLAG_NAMED_LINES;
+		ret = gpiosim_dev_enable(sim_dev);
+		if (ret)
+			g_error("unable to commit the simulated GPIO device: %s",
+				g_strerror(errno));
 
-	ret = gpio_mockup_probe(globals.mockup, test->num_chips,
-				test->chip_sizes, flags);
-	if (ret)
-		g_error("unable to probe gpio-mockup: %s", g_strerror(errno));
+		g_ptr_array_add(globals.sim_chips, sim_dev);
+		g_ptr_array_add(globals.sim_banks, sim_bank);
+	}
 
 	test->func();
 
-	ret = gpio_mockup_remove(globals.mockup);
-	if (ret)
-		g_error("unable to remove gpio_mockup: %s", g_strerror(errno));
+	g_ptr_array_unref(globals.sim_banks);
+	g_ptr_array_unref(globals.sim_chips);
 }
 
-static void unref_mockup(void)
+static void unref_gpiosim(void)
 {
-	gpio_mockup_unref(globals.mockup);
+	gpiosim_ctx_unref(globals.gpiosim);
 }
 
 static void add_test_from_list(gpointer element, gpointer data G_GNUC_UNUSED)
@@ -102,15 +173,15 @@ int main(gint argc, gchar **argv)
 	g_debug("%u tests registered", g_list_length(globals.tests));
 
 	/*
-	 * Setup libgpiomockup first so that it runs its own kernel version
+	 * Setup libpiosim first so that it runs its own kernel version
 	 * check before we tell the user our local requirements are met as
 	 * well.
 	 */
-	globals.mockup = gpio_mockup_new();
-	if (!globals.mockup)
-		g_error("unable to initialize gpio-mockup library: %s",
+	globals.gpiosim = gpiosim_ctx_new();
+	if (!globals.gpiosim)
+		g_error("unable to initialize gpiosim library: %s",
 			g_strerror(errno));
-	atexit(unref_mockup);
+	atexit(unref_gpiosim);
 
 	check_kernel();
 
@@ -127,35 +198,27 @@ void _gpiod_test_register(_GpiodTestCase *test)
 
 const gchar *gpiod_test_chip_path(guint idx)
 {
-	const gchar *path;
-
-	path = gpio_mockup_chip_path(globals.mockup, idx);
-	if (!path)
-		g_error("unable to retrieve the chip path: %s",
-			g_strerror(errno));
+	struct gpiosim_bank *bank = g_ptr_array_index(globals.sim_banks, idx);
 
-	return path;
+	return gpiosim_bank_get_dev_path(bank);
 }
 
 const gchar *gpiod_test_chip_name(guint idx)
 {
-	const gchar *name;
-
-	name = gpio_mockup_chip_name(globals.mockup, idx);
-	if (!name)
-		g_error("unable to retrieve the chip name: %s",
-			g_strerror(errno));
+	struct gpiosim_bank *bank = g_ptr_array_index(globals.sim_banks, idx);
 
-	return name;
+	return gpiosim_bank_get_chip_name(bank);
 }
 
 gint gpiod_test_chip_get_value(guint chip_index, guint line_offset)
 {
+	struct gpiosim_bank *bank = g_ptr_array_index(globals.sim_banks,
+						      chip_index);
 	gint ret;
 
-	ret = gpio_mockup_get_value(globals.mockup, chip_index, line_offset);
+	ret = gpiosim_bank_get_value(bank, line_offset);
 	if (ret < 0)
-		g_error("unable to read line value from gpio-mockup: %s",
+		g_error("unable to read line value from gpiosim: %s",
 			g_strerror(errno));
 
 	return ret;
@@ -163,12 +226,14 @@ gint gpiod_test_chip_get_value(guint chip_index, guint line_offset)
 
 void gpiod_test_chip_set_pull(guint chip_index, guint line_offset, gint pull)
 {
+	struct gpiosim_bank *bank = g_ptr_array_index(globals.sim_banks,
+						      chip_index);
 	gint ret;
 
-	ret = gpio_mockup_set_pull(globals.mockup, chip_index,
-				   line_offset, pull);
+	ret = gpiosim_bank_set_pull(bank, line_offset,
+				    pull ? GPIOSIM_PULL_UP : GPIOSIM_PULL_DOWN);
 	if (ret)
-		g_error("unable to set line pull in gpio-mockup: %s",
+		g_error("unable to set line pull in gpiosim: %s",
 			g_strerror(errno));
 }
 
diff --git a/tests/gpiod-test.h b/tests/gpiod-test.h
index 61735d9..1f2a677 100644
--- a/tests/gpiod-test.h
+++ b/tests/gpiod-test.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-/* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
+/* SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /*
  * Testing framework for the core library.
@@ -50,7 +50,7 @@ enum {
 
 /*
  * Register a test case function. The last argument is the array of numbers
- * of lines per mockup chip.
+ * of lines per simulated chip.
  */
 #define GPIOD_TEST_CASE(_name, _flags, ...)				\
 	static void _name(void);					\
-- 
2.30.1

