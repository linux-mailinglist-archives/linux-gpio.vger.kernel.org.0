Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C91733271D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 14:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhCIN0r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 08:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbhCIN0o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 08:26:44 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0006AC06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 05:26:43 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id l11so12155613wrp.7
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 05:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6R4ghm7tGz7EGoUHwQaNcH3TJrYiYArcaAyQ45p8lfY=;
        b=yUm0p89NZPS0F/pY2jy/iTe1pb1MFF8/4DRHVAJ84E5ri+b8GQDk8nF4jn9r6PNPwm
         4SV9cxgu2kOcfnj1oSkjIIMHJbNyLjiwOZQQk98vNlHUCI2E2jYnKbeoR1GOOcLH3RG2
         Ku1HUIOb6IdrrJj5vv8YMHZhVPelwhhUTIwLvrrIR7J2Liiq2h88zZ/akowmJCCOWeEB
         LXuCy25kZ/4m0VP583RTM7XTLuUCdnnhmfngcWhv/YFCHOETSZCLIFFf/lHQOEckukFD
         yWqLYOslL7OBHcOI4K0cJ27Tpg9QqmC4zPZeO9yykK6IZ/gel/H1H1u9IZHyA+lbitKZ
         AQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6R4ghm7tGz7EGoUHwQaNcH3TJrYiYArcaAyQ45p8lfY=;
        b=pmDJL9tp8reiJz4QBmnurSoepzsZUU+GVdTT2pH77tigc9FNOyo2X6QxhVtglOJWPm
         2jgI4Y0RGTNisw9MahJndr5ub6Jv5nTOKnkptfrFe2IBAWYu5qDg/Ww6WhIE0xc6/lwy
         KF08h9TVTG3APw+GwDltpksrx8eUmFk4sZxE7ReXnpVqhYoSovYoag3gjEYxS0tKBKXL
         Qemdf5HqYQYtBU2vPLD8Zs4TEunrmytYB3Bha71ioGjsbw+MBwQoHeFN1gRDOKv+pLBW
         gzwKi/yY4EAx53hj4i9gNX3nBYWq119/SbnAd45drE1DTAzDp4RQfwsJ4Zb2ml0maH8n
         sBGQ==
X-Gm-Message-State: AOAM533I0MrkFrxsnjFo2Uz9wGhJmtYczst8izCHYfb7csiPe+Yu5hgt
        EjPrbqWDFF5zTkEZezzgzQ2Fsg==
X-Google-Smtp-Source: ABdhPJw9DuYtGUFa2Rf9IHf6B+a3lgfIsC24zCjCeaul9aoKw+tWazfdFGPQt4b/yIZ0jBO6qhuJEw==
X-Received: by 2002:adf:c64a:: with SMTP id u10mr28176251wrg.412.1615296402613;
        Tue, 09 Mar 2021 05:26:42 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id u23sm4123366wmn.26.2021.03.09.05.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 05:26:42 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 2/6] tests: remove line bulk test cases
Date:   Tue,  9 Mar 2021 14:26:35 +0100
Message-Id: <20210309132639.29069-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309132639.29069-1-brgl@bgdev.pl>
References: <20210309132639.29069-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Together with the removal of line objects, we'll entirely drop the
line bulk concept. In order to avoid having to update tests that will
soon be unneeded when introducing further changes, let's remove line
bulk test cases already.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/tests/tests-line.cpp      |  43 --------
 bindings/python/tests/gpiod_py_test.py |  15 ---
 tests/Makefile.am                      |   1 -
 tests/tests-bulk.c                     | 145 -------------------------
 4 files changed, 204 deletions(-)
 delete mode 100644 tests/tests-bulk.c

diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index c1ad8d2..648012a 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -153,49 +153,6 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 	}
 }
 
-TEST_CASE("Line bulk object works correctly", "[line][bulk]")
-{
-	mockup::probe_guard mockup_chips({ 8 }, mockup::FLAG_NAMED_LINES);
-	::gpiod::chip chip(mockup::instance().chip_path(0));
-
-	SECTION("lines can be added, accessed and cleared")
-	{
-		::gpiod::line_bulk lines;
-
-		REQUIRE(lines.empty());
-
-		lines.append(chip.get_line(0));
-		lines.append(chip.get_line(1));
-		lines.append(chip.get_line(2));
-
-		REQUIRE(lines.size() == 3);
-		REQUIRE(lines.get(1).name() == "gpio-mockup-A-1");
-		REQUIRE(lines[2].name() == "gpio-mockup-A-2");
-
-		lines.clear();
-
-		REQUIRE(lines.empty());
-	}
-
-	SECTION("bulk iterator works")
-	{
-		auto lines = chip.get_all_lines();
-		unsigned int count = 0;
-
-		for (auto& it: lines)
-			REQUIRE(it.offset() == count++);
-
-		REQUIRE(count == chip.num_lines());
-	}
-
-	SECTION("accessing lines out of range throws exception")
-	{
-		auto lines = chip.get_all_lines();
-
-		REQUIRE_THROWS_AS(lines.get(11), ::std::out_of_range);
-	}
-}
-
 TEST_CASE("Line values can be set and read", "[line]")
 {
 	mockup::probe_guard mockup_chips({ 8 });
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index c8ee85b..b7c30de 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -670,21 +670,6 @@ class LineIterator(MockupTestCase):
 
             self.assertEqual(count, chip.num_lines())
 
-class LineBulkIter(MockupTestCase):
-
-    chip_sizes = ( 4, )
-
-    def test_line_bulk_iterator(self):
-        with gpiod.Chip(mockup.chip_path(0)) as chip:
-            lines = chip.get_all_lines()
-            count = 0
-
-            for line in lines:
-                self.assertEqual(line.offset(), count)
-                count += 1
-
-            self.assertEqual(count, chip.num_lines())
-
 #
 # Event test cases
 #
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 49aa215..43b215e 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -17,7 +17,6 @@ bin_PROGRAMS = gpiod-test
 gpiod_test_SOURCES =			\
 		gpiod-test.c		\
 		gpiod-test.h		\
-		tests-bulk.c		\
 		tests-chip.c		\
 		tests-event.c		\
 		tests-line.c		\
diff --git a/tests/tests-bulk.c b/tests/tests-bulk.c
deleted file mode 100644
index ad08f2d..0000000
--- a/tests/tests-bulk.c
+++ /dev/null
@@ -1,145 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-#include <errno.h>
-
-#include "gpiod-test.h"
-
-#define GPIOD_TEST_GROUP "bulk"
-
-GPIOD_TEST_CASE(alloc_zero_lines, 0, { 1 })
-{
-	struct gpiod_line_bulk *bulk;
-
-	bulk = gpiod_line_bulk_new(0);
-	g_assert_null(bulk);
-	g_assert_cmpint(errno, ==, EINVAL);
-}
-
-GPIOD_TEST_CASE(add_too_many_lines, 0, { 8 })
-{
-	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *lineA, *lineB, *lineC;
-	gint ret;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	bulk = gpiod_line_bulk_new(2);
-	g_assert_nonnull(bulk);
-	gpiod_test_return_if_failed();
-
-	lineA = gpiod_chip_get_line(chip, 0);
-	lineB = gpiod_chip_get_line(chip, 1);
-	lineC = gpiod_chip_get_line(chip, 2);
-	g_assert_nonnull(lineA);
-	g_assert_nonnull(lineB);
-	g_assert_nonnull(lineC);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_bulk_add_line(bulk, lineA);
-	g_assert_cmpint(ret, ==, 0);
-	ret = gpiod_line_bulk_add_line(bulk, lineB);
-	g_assert_cmpint(ret, ==, 0);
-	ret = gpiod_line_bulk_add_line(bulk, lineC);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, EINVAL);
-}
-
-GPIOD_TEST_CASE(add_lines_from_different_chips, 0, { 8, 8 })
-{
-	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
-	g_autoptr(gpiod_chip_struct) chipA = NULL;
-	g_autoptr(gpiod_chip_struct) chipB = NULL;
-	struct gpiod_line *lineA, *lineB;
-	gint ret;
-
-	chipA = gpiod_chip_open(gpiod_test_chip_path(0));
-	chipB = gpiod_chip_open(gpiod_test_chip_path(1));
-	g_assert_nonnull(chipA);
-	g_assert_nonnull(chipB);
-	gpiod_test_return_if_failed();
-
-	bulk = gpiod_line_bulk_new(4);
-	g_assert_nonnull(bulk);
-	gpiod_test_return_if_failed();
-
-	lineA = gpiod_chip_get_line(chipA, 0);
-	lineB = gpiod_chip_get_line(chipB, 0);
-	g_assert_nonnull(lineA);
-	g_assert_nonnull(lineB);
-	gpiod_test_return_if_failed();
-
-	ret = gpiod_line_bulk_add_line(bulk, lineA);
-	g_assert_cmpint(ret, ==, 0);
-	ret = gpiod_line_bulk_add_line(bulk, lineB);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, EINVAL);
-}
-
-static const gchar *const bulk_foreach_line_names[] = {
-	"gpio-mockup-A-0",
-	"gpio-mockup-A-1",
-	"gpio-mockup-A-2",
-	"gpio-mockup-A-3"
-};
-
-static int bulk_foreach_callback_all(struct gpiod_line *line, void *data)
-{
-	gint *i = data;
-
-	g_assert_cmpstr(gpiod_line_name(line), ==,
-			bulk_foreach_line_names[(*i)++]);
-
-	return GPIOD_LINE_BULK_CB_NEXT;
-}
-
-static int bulk_foreach_callback_stop(struct gpiod_line *line, void *data)
-{
-	gint *i = data;
-
-	g_assert_cmpstr(gpiod_line_name(line), ==,
-			bulk_foreach_line_names[(*i)++]);
-	if (*i == 2)
-		return GPIOD_LINE_BULK_CB_STOP;
-
-	return GPIOD_LINE_BULK_CB_NEXT;
-}
-
-GPIOD_TEST_CASE(foreach_all_lines, GPIOD_TEST_FLAG_NAMED_LINES, { 4 })
-{
-	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	gint i = 0;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	bulk = gpiod_chip_get_all_lines(chip);
-	g_assert_nonnull(bulk);
-	gpiod_test_return_if_failed();
-
-	gpiod_line_bulk_foreach_line(bulk, bulk_foreach_callback_all, &i);
-	gpiod_test_return_if_failed();
-}
-
-GPIOD_TEST_CASE(foreach_two_lines, GPIOD_TEST_FLAG_NAMED_LINES, { 8 })
-{
-	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	gint i = 0;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	bulk = gpiod_chip_get_all_lines(chip);
-	g_assert_nonnull(bulk);
-	gpiod_test_return_if_failed();
-
-	gpiod_line_bulk_foreach_line(bulk, bulk_foreach_callback_stop, &i);
-	g_assert_cmpint(i, ==, 2);
-}
-- 
2.30.1

