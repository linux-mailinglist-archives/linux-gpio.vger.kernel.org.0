Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F8A36E82D
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Apr 2021 11:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237774AbhD2Jsa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Apr 2021 05:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbhD2Js3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Apr 2021 05:48:29 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E4FC06138C
        for <linux-gpio@vger.kernel.org>; Thu, 29 Apr 2021 02:47:43 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id n127so23629367wmb.5
        for <linux-gpio@vger.kernel.org>; Thu, 29 Apr 2021 02:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jb+UMbU0qw47lnMtR/pIbI05X1SQoANciUKyOGZ4oKc=;
        b=GSURITssduxp/EOS7xNhzQJkaFQu/PKZxMy1ycltAcjwyHWUsPPbheU6KBZcZp/zWC
         pl9Mk5vvMxtDq8+YS9eQKpyvrMnhU601EkfMlVjeRgicBPovik8PcAdsxSDhY7b//CnZ
         tpZrCxNRp5sXnkES1E+apwxHYZmjrG9eMXrYFqFVwjHpfrzzLGmgo5q7Ty8ngZzG7h+8
         QFlN65Auja1MeBEojPfHMQdbM2dLfCz8slbB0OOBhjpSfOpbjF8is4UT4saT4zvwWJbX
         ay/MCEi+qoig4TLuwHui4HPqIEfsdi+fkl8WcdThSUK0wvV20w8zdauUKTEirNkQMxtp
         ctvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jb+UMbU0qw47lnMtR/pIbI05X1SQoANciUKyOGZ4oKc=;
        b=ZvTZoxr+xhejFTJzybVDQYqkJsVeFWtxlSCKDDlCLwmnW9k2oIX8j5I2ubeLHcF1G1
         BEP/UPGA3qLx2iDyhwOQJh8I4uO+OH2/3yjCRIONZw2QA8e4HQHmsOyWkoJdCKWR89E4
         HJBp1cerGBADewIPxZEjaA7KxwSs+6kurqHVqidhUDaXVKihgTDBy7PP0XgJw8THqafJ
         pNP+5RKw2F7fn/SfBl11a3nf3Ar0F+0DBrDwExVSgAf8JEP24WgLDKXAtc1bSaW5W4ng
         oiNFZCiaa+Pj7sp11EI8c1kGB/GQ69vgW9+S+qR+SVxayPMejPak3Wi0xighWrvNez+J
         Xfaw==
X-Gm-Message-State: AOAM5339ThhPlC7KowSEmU19YP/el537LTzpPqBhpOzEZHjtQtXjXkQD
        fobQeNY9lQAxbn/5D0HWf2HLwQ==
X-Google-Smtp-Source: ABdhPJwpilzEVbLICOC6qKxNINTGrDF5e54v7XF8iCiVkME/iDAaOcsnU3ZiXayzWgKiyRTSvCvBrQ==
X-Received: by 2002:a1c:2786:: with SMTP id n128mr9657836wmn.82.1619689662067;
        Thu, 29 Apr 2021 02:47:42 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id j22sm4101247wra.46.2021.04.29.02.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 02:47:41 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH 3/3] tests: port C tests to libgpiosim
Date:   Thu, 29 Apr 2021 11:47:34 +0200
Message-Id: <20210429094734.9585-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210429094734.9585-1-brgl@bgdev.pl>
References: <20210429094734.9585-1-brgl@bgdev.pl>
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
 tests/gpiod-test.c | 122 +++++++++++++++++++++++++++++++++++----------
 tests/gpiod-test.h |   2 +-
 3 files changed, 99 insertions(+), 29 deletions(-)

diff --git a/tests/Makefile.am b/tests/Makefile.am
index 760aefa..c8754ea 100644
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
index ca5cdb3..b279989 100644
--- a/tests/gpiod-test.c
+++ b/tests/gpiod-test.c
@@ -3,7 +3,7 @@
 
 #include <errno.h>
 #include <glib/gstdio.h>
-#include <gpio-mockup.h>
+#include <gpiosim.h>
 #include <linux/version.h>
 #include <stdio.h>
 #include <sys/utsname.h>
@@ -30,7 +30,8 @@ struct gpiod_test_event_thread {
 
 static struct {
 	GList *tests;
-	struct gpio_mockup *mockup;
+	struct gpiosim_ctx *gpiosim;
+	GPtrArray *sim_chips;
 } globals;
 
 static void check_kernel(void)
@@ -61,29 +62,93 @@ static void check_kernel(void)
 	return;
 }
 
+static gchar **make_line_names(guint num_lines, char chip_idx)
+{
+	gchar **line_names;
+	guint i;
+
+	line_names = g_malloc0_n(num_lines + 1, sizeof(gchar *));
+
+	for (i = 0; i < num_lines; i++)
+		line_names[i] = g_strdup_printf("gpio-mockup-%c-%u",
+						chip_idx, i);
+
+	return line_names;
+}
+
+static void remove_gpiosim_chip(gpointer data)
+{
+	struct gpiosim_chip *chip = data;
+	gint ret;
+
+	ret = gpiosim_chip_uncommit(chip);
+	if (ret)
+		g_error("unable to uncommit a simulated chip: %s",
+			g_strerror(errno));
+
+	gpiosim_chip_unref(chip);
+}
+
 static void test_func_wrapper(gconstpointer data)
 {
 	const _GpiodTestCase *test = data;
-	gint ret, flags = 0;
+	struct gpiosim_chip *sim_chip;
+	gchar **line_names, *label;
+	gchar chip_idx;
+	gint ret;
+	guint i;
+
+	globals.sim_chips = g_ptr_array_new_full(test->num_chips,
+						 remove_gpiosim_chip);
+
+	for (i = 0; i < test->num_chips; i++) {
+		chip_idx = i + 65;
+
+		sim_chip = gpiosim_chip_new(globals.gpiosim, NULL);
+		if (!sim_chip)
+			g_error("unable to create a simulated GPIO chip: %s",
+				g_strerror(errno));
+
+		label = g_strdup_printf("gpio-mockup-%c", chip_idx);
+		ret = gpiosim_chip_set_label(sim_chip, label);
+		g_free(label);
+		if (ret)
+			g_error("unable to set simulated chip label: %s",
+				g_strerror(errno));
+
+		ret = gpiosim_chip_set_num_lines(sim_chip, test->chip_sizes[i]);
+		if (ret)
+			g_error("unable to set the number of lines for a simulated chip: %s",
+				g_strerror(errno));
+
+		if (test->flags & GPIOD_TEST_FLAG_NAMED_LINES) {
+			line_names = make_line_names(test->chip_sizes[i],
+						     chip_idx);
+			ret = gpiosim_chip_set_line_names(sim_chip,
+							  test->chip_sizes[i],
+							  line_names);
+			g_strfreev(line_names);
+			if (ret)
+				g_error("unable to set the line names for a simulated chip: %s",
+					g_strerror(errno));
+		}
 
-	if (test->flags & GPIOD_TEST_FLAG_NAMED_LINES)
-		flags |= GPIO_MOCKUP_FLAG_NAMED_LINES;
+		ret = gpiosim_chip_commit_sync(sim_chip);
+		if (ret)
+			g_error("unable to commit the simulated chip: %s",
+				g_strerror(errno));
 
-	ret = gpio_mockup_probe(globals.mockup, test->num_chips,
-				test->chip_sizes, flags);
-	if (ret)
-		g_error("unable to probe gpio-mockup: %s", g_strerror(errno));
+		g_ptr_array_add(globals.sim_chips, sim_chip);
+	}
 
 	test->func();
 
-	ret = gpio_mockup_remove(globals.mockup);
-	if (ret)
-		g_error("unable to remove gpio_mockup: %s", g_strerror(errno));
+	g_ptr_array_unref(globals.sim_chips);
 }
 
-static void unref_mockup(void)
+static void unref_gpiosim(void)
 {
-	gpio_mockup_unref(globals.mockup);
+	gpiosim_ctx_unref(globals.gpiosim);
 }
 
 static void add_test_from_list(gpointer element, gpointer data G_GNUC_UNUSED)
@@ -102,15 +167,15 @@ int main(gint argc, gchar **argv)
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
 
@@ -127,9 +192,10 @@ void _gpiod_test_register(_GpiodTestCase *test)
 
 const gchar *gpiod_test_chip_path(guint idx)
 {
+	struct gpiosim_chip *chip = g_ptr_array_index(globals.sim_chips, idx);
 	const gchar *path;
 
-	path = gpio_mockup_chip_path(globals.mockup, idx);
+	path = gpiosim_chip_get_dev(chip);
 	if (!path)
 		g_error("unable to retrieve the chip path: %s",
 			g_strerror(errno));
@@ -139,9 +205,10 @@ const gchar *gpiod_test_chip_path(guint idx)
 
 const gchar *gpiod_test_chip_name(guint idx)
 {
+	struct gpiosim_chip *chip = g_ptr_array_index(globals.sim_chips, idx);
 	const gchar *name;
 
-	name = gpio_mockup_chip_name(globals.mockup, idx);
+	name = gpiosim_chip_get_name(chip);
 	if (!name)
 		g_error("unable to retrieve the chip name: %s",
 			g_strerror(errno));
@@ -151,11 +218,13 @@ const gchar *gpiod_test_chip_name(guint idx)
 
 gint gpiod_test_chip_get_value(guint chip_index, guint line_offset)
 {
+	struct gpiosim_chip *chip = g_ptr_array_index(globals.sim_chips,
+						      chip_index);
 	gint ret;
 
-	ret = gpio_mockup_get_value(globals.mockup, chip_index, line_offset);
+	ret = gpiosim_chip_get_value(chip, line_offset);
 	if (ret < 0)
-		g_error("unable to read line value from gpio-mockup: %s",
+		g_error("unable to read line value from gpiosim: %s",
 			g_strerror(errno));
 
 	return ret;
@@ -163,12 +232,13 @@ gint gpiod_test_chip_get_value(guint chip_index, guint line_offset)
 
 void gpiod_test_chip_set_pull(guint chip_index, guint line_offset, gint pull)
 {
+	struct gpiosim_chip *chip = g_ptr_array_index(globals.sim_chips,
+						      chip_index);
 	gint ret;
 
-	ret = gpio_mockup_set_pull(globals.mockup, chip_index,
-				   line_offset, pull);
+	ret = gpiosim_chip_set_pull(chip, line_offset, pull);
 	if (ret)
-		g_error("unable to set line pull in gpio-mockup: %s",
+		g_error("unable to set line pull in gpiosim: %s",
 			g_strerror(errno));
 }
 
diff --git a/tests/gpiod-test.h b/tests/gpiod-test.h
index 61735d9..f2e8b02 100644
--- a/tests/gpiod-test.h
+++ b/tests/gpiod-test.h
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

