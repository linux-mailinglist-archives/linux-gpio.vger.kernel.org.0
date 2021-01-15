Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F282F76B9
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 11:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbhAOKbH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 05:31:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbhAOKbH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 05:31:07 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71261C0613C1
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 02:30:26 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id l12so3513207wry.2
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 02:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Osag0wjM+41CbHF3osNIe4rv+V5vcyeSMoOLqvpRm0Y=;
        b=vP6Z9CnnWuuv9z9HkzuanSHQ52gT/DsHP0S6/fzmnrl/bHCSHqa2PE3AufXDn/Aw1C
         3jPhU8aLod3M0SUXUNkuYB7AJPP6bOUIvLY5EOXHUweAEsjK6EYRCDsZ3shBfPFcGR1a
         iQiDldx/Q5XGgXUw8YMv6mAjbX6gJOfOzwRuJAEEOCHgGvRi6si1iXGVDIMYUU1Hr2F6
         4GU3x6q1LewsLv188xHdVx4rkNg8dmuc7TPIz0hdn5NqaSKEKYT3PTYOskAugoQF1qoY
         jJ0L8LQCWkX76lPnmsymgXfeseccwCh35W/dkvD5Ie1IvEB0D+8VnBCOQmkrLLFePuug
         n48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Osag0wjM+41CbHF3osNIe4rv+V5vcyeSMoOLqvpRm0Y=;
        b=PHf55v3sbp2UCPZmkpEULcHCZ5KH+6StJnq+8mWAB6ejfhLYhLw/5pA8shJq2cQYEZ
         IdJWdH1aqKc7OAYQUgwPD6efF6hEI3Cr8TRzoiFuDcBYxZyURnMHkpm9hbWlpdg/an29
         43zndMSLum+8VuMd6sHUYtdt7MknLxIS+kb3rsmMpAWo7igedckKi0ARbZHefJmcgETw
         T0mn2IX0LIwlPE36DD0BJixuKProDK1yhVY6eSnJNZkxZNVSbRMHUPNxF8P2bbR5ZM5S
         fDHlJm3yZmvvI1zqYynaqa87eXqZC4JQ04lZv0Z6v/O+JF6sxux2DOEf1fv/FEx5U+GV
         vMTw==
X-Gm-Message-State: AOAM533/MioYfPXyf752Be0ouf0/6lpZbkYLkSyxV1fq7MmbDgbKpl7a
        CfHJPMFYIkST1CAhZfX+0WBlEw==
X-Google-Smtp-Source: ABdhPJx0P1yfdBaOPv8BFJ9+BS0AHPHHMzfYYdRiWN9e1j/iONBLg8o5UHJjuInCcghka44PiKWP1g==
X-Received: by 2002:a5d:6888:: with SMTP id h8mr12578540wru.268.1610706625095;
        Fri, 15 Jan 2021 02:30:25 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id m14sm13815288wrh.94.2021.01.15.02.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 02:30:24 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH v2 5/7] treewide: make drive settings an enum
Date:   Fri, 15 Jan 2021 11:30:16 +0100
Message-Id: <20210115103018.27704-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210115103018.27704-1-brgl@bgdev.pl>
References: <20210115103018.27704-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Open-source and open-drain drive settings are mutually exclusive just like
the bias settings. Make them into an enum so that becomes clear.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/gpiod.hpp                 | 24 +++++----
 bindings/cxx/line.cpp                  | 18 +++----
 bindings/cxx/tests/tests-line.cpp      | 45 ++++++----------
 bindings/python/gpiodmodule.c          | 73 ++++++++++++++------------
 bindings/python/tests/gpiod_py_test.py | 18 +++----
 include/gpiod.h                        | 26 +++++----
 lib/core.c                             | 12 ++---
 tests/tests-line.c                     | 36 ++++++-------
 tools/gpioinfo.c                       | 14 ++++-
 9 files changed, 134 insertions(+), 132 deletions(-)

diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index dbcae6c..9028822 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -332,16 +332,10 @@ public:
 	GPIOD_API bool is_used(void) const;
 
 	/**
-	 * @brief Check if this line represents an open-drain GPIO.
-	 * @return True if the line is an open-drain GPIO, false otherwise.
+	 * @brief Get current drive setting of this line.
+	 * @return Current drive setting.
 	 */
-	GPIOD_API bool is_open_drain(void) const;
-
-	/**
-	 * @brief Check if this line represents an open-source GPIO.
-	 * @return True if the line is an open-source GPIO, false otherwise.
-	 */
-	GPIOD_API bool is_open_source(void) const;
+	GPIOD_API int drive(void) const;
 
 	/**
 	 * @brief Request this line.
@@ -482,6 +476,18 @@ public:
 		/**< Line's direction setting is output. */
 	};
 
+	/**
+	 * @brief Possible drive settings.
+	 */
+	enum : int {
+		DRIVE_PUSH_PULL = 1,
+		/**< Drive setting is unknown. */
+		DRIVE_OPEN_DRAIN,
+		/**< Line output is open-drain. */
+		DRIVE_OPEN_SOURCE,
+		/**< Line output is open-source. */
+	};
+
 	/**
 	 * @brief Possible bias settings.
 	 */
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index 99eb246..df75c8c 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -13,6 +13,12 @@ namespace gpiod {
 
 namespace {
 
+const ::std::map<int, int> drive_mapping = {
+	{ GPIOD_LINE_DRIVE_PUSH_PULL,	line::DRIVE_PUSH_PULL, },
+	{ GPIOD_LINE_DRIVE_OPEN_DRAIN,	line::DRIVE_OPEN_DRAIN, },
+	{ GPIOD_LINE_DRIVE_OPEN_SOURCE,	line::DRIVE_OPEN_SOURCE, },
+};
+
 const ::std::map<int, int> bias_mapping = {
 	{ GPIOD_LINE_BIAS_PULL_UP,	line::BIAS_PULL_UP, },
 	{ GPIOD_LINE_BIAS_PULL_DOWN,	line::BIAS_PULL_DOWN, },
@@ -98,20 +104,12 @@ bool line::is_used(void) const
 	return ::gpiod_line_is_used(this->_m_line);
 }
 
-bool line::is_open_drain(void) const
-{
-	this->throw_if_null();
-	line::chip_guard lock_chip(*this);
-
-	return ::gpiod_line_is_open_drain(this->_m_line);
-}
-
-bool line::is_open_source(void) const
+int line::drive(void) const
 {
 	this->throw_if_null();
 	line::chip_guard lock_chip(*this);
 
-	return ::gpiod_line_is_open_source(this->_m_line);
+	return drive_mapping.at(::gpiod_line_drive(this->_m_line));
 }
 
 void line::request(const line_request& config, int default_val) const
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index 97d12be..e201b99 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -33,8 +33,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.consumer().empty());
 		REQUIRE_FALSE(line.is_requested());
 		REQUIRE_FALSE(line.is_used());
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_UNKNOWN);
 	}
 
@@ -52,8 +51,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE_FALSE(line.is_active_low());
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_UNKNOWN);
 	}
 
@@ -73,8 +71,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.is_active_low());
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
-		REQUIRE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_OPEN_DRAIN);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_UNKNOWN);
 	}
 
@@ -93,8 +90,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE_FALSE(line.is_active_low());
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_OPEN_SOURCE);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_UNKNOWN);
 	}
 
@@ -113,8 +109,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE_FALSE(line.is_active_low());
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_DISABLED);
 	}
 
@@ -133,8 +128,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE_FALSE(line.is_active_low());;
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_PULL_DOWN);
 	}
 
@@ -153,8 +147,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE_FALSE(line.is_active_low());
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_PULL_UP);
 	}
 
@@ -364,23 +357,19 @@ TEST_CASE("Line can be reconfigured", "[line]")
 		config.flags = 0;
 		line.request(config);
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
 
 		line.set_flags(::gpiod::line_request::FLAG_OPEN_DRAIN);
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_OPEN_DRAIN);
 
 		line.set_flags(::gpiod::line_request::FLAG_OPEN_SOURCE);
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_OPEN_SOURCE);
 
 		line.set_flags(0);
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
 	}
 
 	SECTION("set flags (single line, bias)")
@@ -390,23 +379,19 @@ TEST_CASE("Line can be reconfigured", "[line]")
 		config.flags = 0;
 		line.request(config);
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
 
 		line.set_flags(::gpiod::line_request::FLAG_OPEN_DRAIN);
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_OPEN_DRAIN);
 
 		line.set_flags(::gpiod::line_request::FLAG_OPEN_SOURCE);
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_OPEN_SOURCE);
 
 		line.set_flags(0);
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
 	}
 
 	SECTION("set direction input (single line)")
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index b1d8f35..a6a336e 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -67,6 +67,12 @@ enum {
 	gpiod_DIRECTION_OUTPUT,
 };
 
+enum {
+	gpiod_DRIVE_PUSH_PULL,
+	gpiod_DRIVE_OPEN_DRAIN,
+	gpiod_DRIVE_OPEN_SOURCE,
+};
+
 enum {
 	gpiod_BIAS_UNKNOWN = 1,
 	gpiod_BIAS_DISABLED,
@@ -397,38 +403,30 @@ static PyObject *gpiod_Line_is_used(gpiod_LineObject *self,
 	Py_RETURN_FALSE;
 }
 
-PyDoc_STRVAR(gpiod_Line_is_open_drain_doc,
-"is_open_drain() -> boolean\n"
+PyDoc_STRVAR(gpiod_Line_drive_doc,
+"drive() -> integer\n"
 "\n"
-"Check if this line represents an open-drain GPIO.");
+"Get the current drive setting of this GPIO line.");
 
-static PyObject *gpiod_Line_is_open_drain(gpiod_LineObject *self,
-					  PyObject *Py_UNUSED(ignored))
+static PyObject *gpiod_Line_drive(gpiod_LineObject *self,
+				  PyObject *Py_UNUSED(ignored))
 {
-	if (gpiod_ChipIsClosed(self->owner))
-		return NULL;
-
-	if (gpiod_line_is_open_drain(self->line))
-		Py_RETURN_TRUE;
-
-	Py_RETURN_FALSE;
-}
+	int drive;
 
-PyDoc_STRVAR(gpiod_Line_is_open_source_doc,
-"is_open_source() -> boolean\n"
-"\n"
-"Check if this line represents an open-source GPIO.");
-
-static PyObject *gpiod_Line_is_open_source(gpiod_LineObject *self,
-					   PyObject *Py_UNUSED(ignored))
-{
 	if (gpiod_ChipIsClosed(self->owner))
 		return NULL;
 
-	if (gpiod_line_is_open_source(self->line))
-		Py_RETURN_TRUE;
+	drive = gpiod_line_drive(self->line);
 
-	Py_RETURN_FALSE;
+	switch (drive) {
+	case GPIOD_LINE_DRIVE_OPEN_DRAIN:
+		return Py_BuildValue("I", gpiod_DRIVE_OPEN_DRAIN);
+	case GPIOD_LINE_DRIVE_OPEN_SOURCE:
+		return Py_BuildValue("I", gpiod_DRIVE_OPEN_SOURCE);
+	case GPIOD_LINE_DRIVE_PUSH_PULL:
+	default:
+		return Py_BuildValue("I", gpiod_DRIVE_PUSH_PULL);
+	}
 }
 
 PyDoc_STRVAR(gpiod_Line_request_doc,
@@ -978,16 +976,10 @@ static PyMethodDef gpiod_Line_methods[] = {
 		.ml_doc = gpiod_Line_is_used_doc,
 	},
 	{
-		.ml_name = "is_open_drain",
-		.ml_meth = (PyCFunction)gpiod_Line_is_open_drain,
+		.ml_name = "drive",
+		.ml_meth = (PyCFunction)gpiod_Line_drive,
 		.ml_flags = METH_NOARGS,
-		.ml_doc = gpiod_Line_is_open_drain_doc,
-	},
-	{
-		.ml_name = "is_open_source",
-		.ml_meth = (PyCFunction)gpiod_Line_is_open_source,
-		.ml_flags = METH_NOARGS,
-		.ml_doc = gpiod_Line_is_open_source_doc,
+		.ml_doc = gpiod_Line_drive_doc,
 	},
 	{
 		.ml_name = "request",
@@ -2525,6 +2517,21 @@ static gpiod_ConstDescr gpiod_ConstList[] = {
 		.name = "DIRECTION_OUTPUT",
 		.val = gpiod_DIRECTION_OUTPUT,
 	},
+	{
+		.typeobj = &gpiod_LineType,
+		.name = "DRIVE_PUSH_PULL",
+		.val = gpiod_DRIVE_PUSH_PULL,
+	},
+	{
+		.typeobj = &gpiod_LineType,
+		.name = "DRIVE_OPEN_DRAIN",
+		.val = gpiod_DRIVE_OPEN_DRAIN,
+	},
+	{
+		.typeobj = &gpiod_LineType,
+		.name = "DRIVE_OPEN_SOURCE",
+		.val = gpiod_DRIVE_OPEN_SOURCE,
+	},
 	{
 		.typeobj = &gpiod_LineType,
 		.name = "BIAS_UNKNOWN",
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index 3c6e24b..324f5e3 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -239,8 +239,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
-            self.assertTrue(line.is_open_drain())
-            self.assertFalse(line.is_open_source())
+            self.assertEqual(line.drive(), gpiod.Line.DRIVE_OPEN_DRAIN)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_UNKNOWN)
 
     def test_exported_open_drain_line(self):
@@ -257,8 +256,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
-            self.assertTrue(line.is_open_drain())
-            self.assertFalse(line.is_open_source())
+            self.assertEqual(line.drive(), gpiod.Line.DRIVE_OPEN_DRAIN)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_UNKNOWN)
 
     def test_exported_open_source_line(self):
@@ -275,8 +273,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
-            self.assertFalse(line.is_open_drain())
-            self.assertTrue(line.is_open_source())
+            self.assertEqual(line.drive(), gpiod.Line.DRIVE_OPEN_SOURCE)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_UNKNOWN)
 
     def test_exported_bias_disable_line(self):
@@ -293,8 +290,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
-            self.assertFalse(line.is_open_drain())
-            self.assertFalse(line.is_open_source())
+            self.assertEqual(line.drive(), gpiod.Line.DRIVE_PUSH_PULL)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_DISABLED)
 
     def test_exported_bias_pull_down_line(self):
@@ -311,8 +307,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
-            self.assertFalse(line.is_open_drain())
-            self.assertFalse(line.is_open_source())
+            self.assertEqual(line.drive(), gpiod.Line.DRIVE_PUSH_PULL)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_PULL_DOWN)
 
     def test_exported_bias_pull_up_line(self):
@@ -329,8 +324,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
-            self.assertFalse(line.is_open_drain())
-            self.assertFalse(line.is_open_source())
+            self.assertEqual(line.drive(), gpiod.Line.DRIVE_PUSH_PULL)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_PULL_UP)
 
     def test_update_line_info(self):
diff --git a/include/gpiod.h b/include/gpiod.h
index 919128f..532f70a 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -280,6 +280,18 @@ enum {
 	/**< Direction is output - we're driving the GPIO line. */
 };
 
+/**
+ * @brief Possible drive settings.
+ */
+enum {
+	GPIOD_LINE_DRIVE_PUSH_PULL = 1,
+	/**< Drive setting is push-pull. */
+	GPIOD_LINE_DRIVE_OPEN_DRAIN,
+	/**< Line output is open-drain. */
+	GPIOD_LINE_DRIVE_OPEN_SOURCE,
+	/**< Line output is open-source. */
+};
+
 /**
  * @brief Possible internal bias settings.
  */
@@ -353,18 +365,12 @@ int gpiod_line_bias(struct gpiod_line *line) GPIOD_API;
 bool gpiod_line_is_used(struct gpiod_line *line) GPIOD_API;
 
 /**
- * @brief Check if the line is an open-drain GPIO.
- * @param line GPIO line object.
- * @return True if the line is an open-drain GPIO, false otherwise.
- */
-bool gpiod_line_is_open_drain(struct gpiod_line *line) GPIOD_API;
-
-/**
- * @brief Check if the line is an open-source GPIO.
+ * @brief Read the GPIO line drive setting.
  * @param line GPIO line object.
- * @return True if the line is an open-source GPIO, false otherwise.
+ * @return Returns GPIOD_LINE_DRIVE_PUSH_PULL, GPIOD_LINE_DRIVE_OPEN_DRAIN or
+ *         GPIOD_LINE_DRIVE_OPEN_SOURCE.
  */
-bool gpiod_line_is_open_source(struct gpiod_line *line) GPIOD_API;
+int gpiod_line_drive(struct gpiod_line *line) GPIOD_API;
 
 /**
  * @brief Re-read the line info.
diff --git a/lib/core.c b/lib/core.c
index 55766ec..d560335 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -493,14 +493,14 @@ bool gpiod_line_is_used(struct gpiod_line *line)
 	return line->info_flags & GPIOLINE_FLAG_KERNEL;
 }
 
-bool gpiod_line_is_open_drain(struct gpiod_line *line)
+int gpiod_line_drive(struct gpiod_line *line)
 {
-	return line->info_flags & GPIOLINE_FLAG_OPEN_DRAIN;
-}
+	if (line->info_flags & GPIOLINE_FLAG_OPEN_DRAIN)
+		return GPIOD_LINE_DRIVE_OPEN_DRAIN;
+	if (line->info_flags & GPIOLINE_FLAG_OPEN_SOURCE)
+		return GPIOD_LINE_DRIVE_OPEN_SOURCE;
 
-bool gpiod_line_is_open_source(struct gpiod_line *line)
-{
-	return line->info_flags & GPIOLINE_FLAG_OPEN_SOURCE;
+	return GPIOD_LINE_DRIVE_PUSH_PULL;
 }
 
 static int line_info_v2_to_info_flags(struct gpio_v2_line_info *info)
diff --git a/tests/tests-line.c b/tests/tests-line.c
index 0f8e20e..2bfb8b4 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -455,20 +455,19 @@ GPIOD_TEST_CASE(set_flags_drive, 0, { 8 })
 	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 0);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_line_is_open_drain(line), ==, false);
-	g_assert_cmpint(gpiod_line_is_open_source(line), ==, false);
+	g_assert_cmpint(gpiod_line_drive(line), ==, GPIOD_LINE_DRIVE_PUSH_PULL);
 
 	ret = gpiod_line_set_flags(line,
 		GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_is_open_drain(line), ==, true);
-	g_assert_cmpint(gpiod_line_is_open_source(line), ==, false);
+	g_assert_cmpint(gpiod_line_drive(line), ==,
+			GPIOD_LINE_DRIVE_OPEN_DRAIN);
 
 	ret = gpiod_line_set_flags(line,
 		GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_is_open_drain(line), ==, false);
-	g_assert_cmpint(gpiod_line_is_open_source(line), ==, true);
+	g_assert_cmpint(gpiod_line_drive(line), ==,
+			GPIOD_LINE_DRIVE_OPEN_SOURCE);
 }
 
 GPIOD_TEST_CASE(set_direction, 0, { 8 })
@@ -760,8 +759,7 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	gpiod_test_return_if_failed();
 
 	g_assert_false(gpiod_line_is_used(line));
-	g_assert_false(gpiod_line_is_open_drain(line));
-	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_drive(line), ==, GPIOD_LINE_DRIVE_PUSH_PULL);
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
 
 	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
@@ -773,8 +771,8 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	gpiod_test_return_if_failed();
 
 	g_assert_true(gpiod_line_is_used(line));
-	g_assert_true(gpiod_line_is_open_drain(line));
-	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_drive(line), ==,
+			GPIOD_LINE_DRIVE_OPEN_DRAIN);
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
@@ -788,8 +786,8 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	gpiod_test_return_if_failed();
 
 	g_assert_true(gpiod_line_is_used(line));
-	g_assert_false(gpiod_line_is_open_drain(line));
-	g_assert_true(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_drive(line), ==,
+			GPIOD_LINE_DRIVE_OPEN_SOURCE);
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
@@ -827,8 +825,8 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	gpiod_test_return_if_failed();
 
 	g_assert_true(gpiod_line_is_used(line));
-	g_assert_true(gpiod_line_is_open_drain(line));
-	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_drive(line), ==,
+			GPIOD_LINE_DRIVE_OPEN_DRAIN);
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
 	g_assert_true(gpiod_line_is_active_low(line));
 	g_assert_cmpint(gpiod_line_direction(line), ==,
@@ -844,8 +842,8 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	gpiod_test_return_if_failed();
 
 	g_assert_true(gpiod_line_is_used(line));
-	g_assert_false(gpiod_line_is_open_drain(line));
-	g_assert_true(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_drive(line), ==,
+			GPIOD_LINE_DRIVE_OPEN_SOURCE);
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
 	g_assert_true(gpiod_line_is_active_low(line));
 
@@ -865,8 +863,7 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	gpiod_test_return_if_failed();
 
 	g_assert_true(gpiod_line_is_used(line));
-	g_assert_false(gpiod_line_is_open_drain(line));
-	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_drive(line), ==, GPIOD_LINE_DRIVE_PUSH_PULL);
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_PULL_DOWN);
 	g_assert_true(gpiod_line_is_active_low(line));
 	g_assert_cmpint(gpiod_line_direction(line), ==,
@@ -885,8 +882,7 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	gpiod_test_return_if_failed();
 
 	g_assert_true(gpiod_line_is_used(line));
-	g_assert_false(gpiod_line_is_open_drain(line));
-	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_drive(line), ==, GPIOD_LINE_DRIVE_PUSH_PULL);
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_PULL_UP);
 	g_assert_true(gpiod_line_is_active_low(line));
 	g_assert_cmpint(gpiod_line_direction(line), ==,
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 845113a..729b179 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -37,6 +37,16 @@ static bool line_bias_is_disabled(struct gpiod_line *line)
 	return gpiod_line_bias(line) == GPIOD_LINE_BIAS_DISABLED;
 }
 
+static bool line_drive_is_open_drain(struct gpiod_line *line)
+{
+	return gpiod_line_drive(line) == GPIOD_LINE_DRIVE_OPEN_DRAIN;
+}
+
+static bool line_drive_is_open_source(struct gpiod_line *line)
+{
+	return gpiod_line_drive(line) == GPIOD_LINE_DRIVE_OPEN_SOURCE;
+}
+
 static const struct flag flags[] = {
 	{
 		.name = "used",
@@ -44,11 +54,11 @@ static const struct flag flags[] = {
 	},
 	{
 		.name = "open-drain",
-		.is_set = gpiod_line_is_open_drain,
+		.is_set = line_drive_is_open_drain,
 	},
 	{
 		.name = "open-source",
-		.is_set = gpiod_line_is_open_source,
+		.is_set = line_drive_is_open_source,
 	},
 	{
 		.name = "pull-up",
-- 
2.29.1

