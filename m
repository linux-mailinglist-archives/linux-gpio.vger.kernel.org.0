Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E51C333271C
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 14:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhCIN0r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 08:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231464AbhCIN0p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 08:26:45 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009F7C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 05:26:45 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id l12so15543460wry.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 05:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qEWobHGIY7KquDfwJRWAwRxBYgGjcQ9monRMXSr9aiE=;
        b=2F6xVDgvUOIb6h/NHrC5zlUd6IixC0XxrtL6uObO7QyNC9Sg7EcYeA2wcaCTN7NZ8C
         o6hVTa3HJ6odQjLI8Ovf3g6vb5yL8wCFLllP5hQLzaSDNrjynSSSEiClNR8Dvy0KzWGM
         JVjzMkfeCpx6d/cWhpDJZ6G6KwNgfbrrhs2OZmdnRCs/pkaxQXWQ8HTN4PdOjKYfs0Sv
         y3kDsm9Lign5cPKiHW4jWeWJwBr0Uyj87Yr8aNxCdFvYlwNR7c1W2OnWv+0rg2k+Ho/B
         4ZeZmzW+zEkhYq/7Qnktf6HqjzZduN3qVXgRoDU+HkrU7zXkXRCgBi/JBTqpQoTJI8m4
         XSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qEWobHGIY7KquDfwJRWAwRxBYgGjcQ9monRMXSr9aiE=;
        b=DmscZbnVdwhT7nfOxy89sQOZaKHd4QLEWW/1jaa5j5cGgZqgXt93WJCgxzAqNagWcS
         TZBhl5C/Mxr3q4BVVuMQeU+Iu9NBaVUmAMmDRlllnsbxwM9kUZJYVJQRjqQVX2cnw2m7
         9+Q1cIFVejisjMlbc4eNOLeZjmBPGw5pr/qRxOzg269u6UDcAlYiCqBQcyDWNjJYznrI
         d8c6kUKvcICfS3jeS5572GEAsXaIorRbcx+m+q/V04tixaDZhvOswQm5d7qyaEmKna2s
         kFR7NMI1h+KtR37HpRIL3tOKOe5pwMDrrDOL4YmO2GHAiDE9VI4sgEZbD2MwN4CV9BLQ
         Szwg==
X-Gm-Message-State: AOAM532tCpQ/20VoR4T4MsGf9ek57OV0E93yoWQJqBm0HRmiK2qNY7+0
        RQLymB3jKedos/9YRcm/CiVSZw==
X-Google-Smtp-Source: ABdhPJyRmWvt/Bk8lWQWiAnP7XTXUK6V5eOYWyD6pYB1J3EHROv05lMLKClEnDf90y+dJdq3S2HgAg==
X-Received: by 2002:a5d:534b:: with SMTP id t11mr27666768wrv.186.1615296403744;
        Tue, 09 Mar 2021 05:26:43 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id u23sm4123366wmn.26.2021.03.09.05.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 05:26:43 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 4/6] treewide: remove is_requested() and is_free()
Date:   Tue,  9 Mar 2021 14:26:37 +0100
Message-Id: <20210309132639.29069-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309132639.29069-1-brgl@bgdev.pl>
References: <20210309132639.29069-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This removes another two functions from the C API as well as their
bindings that don't make much sense (since the user should know if
they have requested the line or not).

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/gpiod.hpp                 |  6 -----
 bindings/cxx/line.cpp                  |  8 ------
 bindings/cxx/tests/tests-line.cpp      |  9 -------
 bindings/python/gpiodmodule.c          | 23 ----------------
 bindings/python/tests/gpiod_py_test.py | 20 --------------
 include/gpiod.h                        | 15 -----------
 lib/core.c                             | 37 +++++---------------------
 7 files changed, 7 insertions(+), 111 deletions(-)

diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 3a043a1..189a133 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -342,12 +342,6 @@ public:
 	 */
 	GPIOD_API void release(void) const;
 
-	/**
-	 * @brief Check if this user has ownership of this line.
-	 * @return True if the user has ownership of this line, false otherwise.
-	 */
-	GPIOD_API bool is_requested(void) const;
-
 	/**
 	 * @brief Read the line value.
 	 * @return Current value (0 or 1).
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index 1d114ac..058f7ce 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -127,14 +127,6 @@ void line::release(void) const
 	bulk.release();
 }
 
-bool line::is_requested(void) const
-{
-	this->throw_if_null();
-	line::chip_guard lock_chip(*this);
-
-	return ::gpiod_line_is_requested(this->_m_line);
-}
-
 /*
  * REVISIT: Check the performance of get/set_value & event_wait compared to
  * the C API. Creating a line_bulk object involves a memory allocation every
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index 648012a..17fdd89 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -27,7 +27,6 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_INPUT);
 		REQUIRE_FALSE(line.is_active_low());
 		REQUIRE(line.consumer().empty());
-		REQUIRE_FALSE(line.is_requested());
 		REQUIRE_FALSE(line.is_used());
 		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_UNKNOWN);
@@ -45,7 +44,6 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.name() == "gpio-mockup-A-4");
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
 		REQUIRE_FALSE(line.is_active_low());
-		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
 		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_UNKNOWN);
@@ -65,7 +63,6 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.name() == "gpio-mockup-A-4");
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
 		REQUIRE(line.is_active_low());
-		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
 		REQUIRE(line.drive() == ::gpiod::line::DRIVE_OPEN_DRAIN);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_UNKNOWN);
@@ -84,7 +81,6 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.name() == "gpio-mockup-A-4");
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
 		REQUIRE_FALSE(line.is_active_low());
-		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
 		REQUIRE(line.drive() == ::gpiod::line::DRIVE_OPEN_SOURCE);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_UNKNOWN);
@@ -103,7 +99,6 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.name() == "gpio-mockup-A-4");
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
 		REQUIRE_FALSE(line.is_active_low());
-		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
 		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_DISABLED);
@@ -122,7 +117,6 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.name() == "gpio-mockup-A-4");
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
 		REQUIRE_FALSE(line.is_active_low());;
-		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
 		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_PULL_DOWN);
@@ -141,7 +135,6 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.name() == "gpio-mockup-A-4");
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
 		REQUIRE_FALSE(line.is_active_low());
-		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
 		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_PULL_UP);
@@ -383,12 +376,10 @@ TEST_CASE("Exported line can be released", "[line]")
 
 	line.request(config);
 
-	REQUIRE(line.is_requested());
 	REQUIRE(line.get_value() == 0);
 
 	line.release();
 
-	REQUIRE_FALSE(line.is_requested());
 	REQUIRE_THROWS_AS(line.get_value(), ::std::system_error);
 }
 
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index e54c3ad..12a6867 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -501,23 +501,6 @@ static PyObject *gpiod_Line_request(gpiod_LineObject *self,
 	return ret;
 }
 
-PyDoc_STRVAR(gpiod_Line_is_requested_doc,
-"is_requested() -> boolean\n"
-"\n"
-"Check if this user has ownership of this line.");
-
-static PyObject *gpiod_Line_is_requested(gpiod_LineObject *self,
-					 PyObject *Py_UNUSED(ignored))
-{
-	if (gpiod_ChipIsClosed(self->owner))
-		return NULL;
-
-	if (gpiod_line_is_requested(self->line))
-		Py_RETURN_TRUE;
-
-	Py_RETURN_FALSE;
-}
-
 PyDoc_STRVAR(gpiod_Line_get_value_doc,
 "get_value() -> integer\n"
 "\n"
@@ -983,12 +966,6 @@ static PyMethodDef gpiod_Line_methods[] = {
 		.ml_flags = METH_VARARGS | METH_KEYWORDS,
 		.ml_doc = gpiod_Line_request_doc,
 	},
-	{
-		.ml_name = "is_requested",
-		.ml_meth = (PyCFunction)gpiod_Line_is_requested,
-		.ml_flags = METH_NOARGS,
-		.ml_doc = gpiod_Line_is_requested_doc,
-	},
 	{
 		.ml_name = "get_value",
 		.ml_meth = (PyCFunction)gpiod_Line_get_value,
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index b7c30de..d448776 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -204,7 +204,6 @@ class LineInfo(MockupTestCase):
             self.assertFalse(line.is_active_low())
             self.assertEqual(line.consumer(), None)
             self.assertFalse(line.is_used())
-            self.assertFalse(line.is_requested())
 
     def test_exported_line(self):
         with gpiod.Chip(mockup.chip_path(0)) as chip:
@@ -218,7 +217,6 @@ class LineInfo(MockupTestCase):
             self.assertTrue(line.is_active_low())
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
-            self.assertTrue(line.is_requested())
 
     def test_exported_line_with_flags(self):
         with gpiod.Chip(mockup.chip_path(0)) as chip:
@@ -234,7 +232,6 @@ class LineInfo(MockupTestCase):
             self.assertTrue(line.is_active_low())
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
-            self.assertTrue(line.is_requested())
             self.assertEqual(line.drive(), gpiod.Line.DRIVE_OPEN_DRAIN)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_UNKNOWN)
 
@@ -251,7 +248,6 @@ class LineInfo(MockupTestCase):
             self.assertFalse(line.is_active_low())
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
-            self.assertTrue(line.is_requested())
             self.assertEqual(line.drive(), gpiod.Line.DRIVE_OPEN_DRAIN)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_UNKNOWN)
 
@@ -268,7 +264,6 @@ class LineInfo(MockupTestCase):
             self.assertFalse(line.is_active_low())
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
-            self.assertTrue(line.is_requested())
             self.assertEqual(line.drive(), gpiod.Line.DRIVE_OPEN_SOURCE)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_UNKNOWN)
 
@@ -285,7 +280,6 @@ class LineInfo(MockupTestCase):
             self.assertFalse(line.is_active_low())
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
-            self.assertTrue(line.is_requested())
             self.assertEqual(line.drive(), gpiod.Line.DRIVE_PUSH_PULL)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_DISABLED)
 
@@ -302,7 +296,6 @@ class LineInfo(MockupTestCase):
             self.assertFalse(line.is_active_low())
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
-            self.assertTrue(line.is_requested())
             self.assertEqual(line.drive(), gpiod.Line.DRIVE_PUSH_PULL)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_PULL_DOWN)
 
@@ -319,7 +312,6 @@ class LineInfo(MockupTestCase):
             self.assertFalse(line.is_active_low())
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
-            self.assertTrue(line.is_requested())
             self.assertEqual(line.drive(), gpiod.Line.DRIVE_PUSH_PULL)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_PULL_UP)
 
@@ -605,16 +597,6 @@ class LineRequestBehavior(MockupTestCase):
 
     chip_sizes = ( 8, )
 
-    def test_line_export_release(self):
-        with gpiod.Chip(mockup.chip_path(0)) as chip:
-            line = chip.get_line(3)
-            line.request(consumer=default_consumer,
-                         type=gpiod.LINE_REQ_DIR_IN)
-            self.assertTrue(line.is_requested())
-            self.assertEqual(line.get_value(), 0)
-            line.release()
-            self.assertFalse(line.is_requested())
-
     def test_line_request_twice_two_calls(self):
         with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
@@ -647,10 +629,8 @@ class LineRequestBehavior(MockupTestCase):
         with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(2)
             line.request(default_consumer)
-            self.assertTrue(line.is_requested())
             self.assertEqual(line.direction(), gpiod.Line.DIRECTION_INPUT)
             line.release()
-            self.assertFalse(line.is_requested())
 
 #
 # Iterator test cases
diff --git a/include/gpiod.h b/include/gpiod.h
index 71abb2a..a5e09e2 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -700,21 +700,6 @@ void gpiod_line_release(struct gpiod_line *line) GPIOD_API;
  */
 void gpiod_line_release_bulk(struct gpiod_line_bulk *bulk) GPIOD_API;
 
-/**
- * @brief Check if the calling user has ownership of this line.
- * @param line GPIO line object.
- * @return True if given line was requested, false otherwise.
- */
-bool gpiod_line_is_requested(struct gpiod_line *line) GPIOD_API;
-
-/**
- * @brief Check if the calling user has neither requested ownership of this
- *        line nor configured any event notifications.
- * @param line GPIO line object.
- * @return True if given line is free, false otherwise.
- */
-bool gpiod_line_is_free(struct gpiod_line *line) GPIOD_API;
-
 /**
  * @}
  *
diff --git a/lib/core.c b/lib/core.c
index bab438f..8e3d8a7 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -561,13 +561,19 @@ int gpiod_line_update(struct gpiod_line *line)
 	return 0;
 }
 
+static bool line_is_requested(struct gpiod_line *line)
+{
+	return (line->state == LINE_REQUESTED_VALUES ||
+		line->state == LINE_REQUESTED_EVENTS);
+}
+
 static bool line_bulk_all_requested(struct gpiod_line_bulk *bulk)
 {
 	struct gpiod_line *line;
 	unsigned int idx;
 
 	line_bulk_foreach_line(bulk, line, idx) {
-		if (!gpiod_line_is_requested(line)) {
+		if (!line_is_requested(line)) {
 			errno = EPERM;
 			return false;
 		}
@@ -591,21 +597,6 @@ static bool line_bulk_all_requested_values(struct gpiod_line_bulk *bulk)
 	return true;
 }
 
-static bool line_bulk_all_free(struct gpiod_line_bulk *bulk)
-{
-	struct gpiod_line *line;
-	unsigned int idx;
-
-	line_bulk_foreach_line(bulk, line, idx) {
-		if (!gpiod_line_is_free(line)) {
-			errno = EBUSY;
-			return false;
-		}
-	}
-
-	return true;
-}
-
 static bool line_request_direction_is_valid(int direction)
 {
 	if ((direction == GPIOD_LINE_REQUEST_DIRECTION_AS_IS) ||
@@ -872,9 +863,6 @@ int gpiod_line_request_bulk(struct gpiod_line_bulk *bulk,
 			    const struct gpiod_line_request_config *config,
 			    const int *vals)
 {
-	if (!line_bulk_all_free(bulk))
-		return -1;
-
 	if (line_request_is_direction(config->request_type))
 		return line_request_values(bulk, config, vals);
 	else if (line_request_is_events(config->request_type))
@@ -904,17 +892,6 @@ void gpiod_line_release_bulk(struct gpiod_line_bulk *bulk)
 	}
 }
 
-bool gpiod_line_is_requested(struct gpiod_line *line)
-{
-	return (line->state == LINE_REQUESTED_VALUES ||
-		line->state == LINE_REQUESTED_EVENTS);
-}
-
-bool gpiod_line_is_free(struct gpiod_line *line)
-{
-	return line->state == LINE_FREE;
-}
-
 int gpiod_line_get_value(struct gpiod_line *line)
 {
 	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
-- 
2.30.1

