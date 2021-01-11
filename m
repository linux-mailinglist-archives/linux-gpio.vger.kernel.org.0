Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 490242F1516
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 14:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732205AbhAKNfR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 08:35:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732322AbhAKNfP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 08:35:15 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED91EC061795
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 05:34:33 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id c133so13841079wme.4
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 05:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=32Uw3thlzOueQc1TCXdLqB7hUCyagYO8i7LjznvXNXI=;
        b=MIf4eKT0bmyuiFQWylgwwNA4DFsHNPyUGOhBj1AMTPdloTgoOPD5z1XI4D/ynhu02A
         P0m1eWug/v6OCNCu8waORhaRiKQp9sTq/Emj0mF/8o4twQ/GAtmwCtp3saQqxyVnmB6u
         Ff1+w9AVDyPvwmssXUHlzLCX6IBMhzUHLFXwwMHAsAmmILWdyXEI6kl9POmCiARAPUgj
         7xsnms2SEVsfvxg6pV4QHOvWhTVYIRImlQnRwmB+ycKmn3ZFLqRrR2Ry1ypokUVXNl8G
         9GUFtEYguF8APmugHMQmHZvuk/RA5Ti+w3wimdQOFq7SiUAg2QzlRvyxSz25TzLzatsS
         yqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=32Uw3thlzOueQc1TCXdLqB7hUCyagYO8i7LjznvXNXI=;
        b=hMiiHg0XdJrowkbCUz4d2pmDsj7MKJL8NRPQZQ3uIT7NHDQlkOSVrMzL92fXHDHCs0
         BDk/2gb912jZmpzTEVP9OKRpaHkzYQYpMHGUS2w2U/uBcFozBuUthomzAqS2FrIv2JcI
         lS/cNAgCifCAz0R4NbLdk0rOM0QgZElqE+LBbVYXsftpO0w0f3pmloFSVELmqJnwbEDc
         A7LVfOp+yI8a0Ldw/MoYfDg5gMaoHyQBg3iIxt3w0G9CApVNIYYSwLWEFGgBkgfGbiMQ
         G1x7Bxqaqlw4uVYFbOX2mj0nLzxbCINlFJcuHeIafU3FAnIawo37JKvW3grvgZ2ESmbC
         Zo4w==
X-Gm-Message-State: AOAM531D33Ta/Gdu8Lm55+8XxyHELzhrUcHre7FZlD6OiIS19ZXCg5Js
        NbxpbtJn4H9pOA7FkRIWfQTzgQ==
X-Google-Smtp-Source: ABdhPJwyocFgMCZSdcF+anqH+i0CTzF7p8XlFovyGMPA19urdGvwPNV6A6X1xUWwm/D6AeYk+cm9RA==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr14125595wmi.20.1610372072471;
        Mon, 11 Jan 2021 05:34:32 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id m11sm21456741wmi.16.2021.01.11.05.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 05:34:31 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 2/6] treewide: simplify the active-low line property
Date:   Mon, 11 Jan 2021 14:34:22 +0100
Message-Id: <20210111133426.22040-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210111133426.22040-1-brgl@bgdev.pl>
References: <20210111133426.22040-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Unlike line direction - where input and output modes are equal, no signal
inversion (active-high) is the natural state of the line while active-low
is less likely. Let's drop the ACTIVE_STATE enum treewide and provide a
boolean property for lines - is_active_low() - to reflect that fact. This
function returning false means the line is "active-high".

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/examples/gpioinfocxx.cpp  |  3 +-
 bindings/cxx/gpiod.hpp                 | 16 ++------
 bindings/cxx/line.cpp                  |  6 +--
 bindings/cxx/tests/tests-line.cpp      | 24 ++++++------
 bindings/python/examples/gpioinfo.py   |  4 +-
 bindings/python/gpiodmodule.c          | 45 ++++++----------------
 bindings/python/tests/gpiod_py_test.py | 16 ++++----
 include/gpiod.h                        | 16 ++------
 lib/core.c                             | 12 +++---
 tests/tests-line.c                     | 52 +++++++++-----------------
 tools/gpioinfo.c                       | 10 ++---
 11 files changed, 69 insertions(+), 135 deletions(-)

diff --git a/bindings/cxx/examples/gpioinfocxx.cpp b/bindings/cxx/examples/gpioinfocxx.cpp
index 2490abd..384286e 100644
--- a/bindings/cxx/examples/gpioinfocxx.cpp
+++ b/bindings/cxx/examples/gpioinfocxx.cpp
@@ -44,8 +44,7 @@ int main(int argc, char **argv)
 				::std::cout << " ";
 
 				::std::cout.width(10);
-				::std::cout << (lit.active_state() == ::gpiod::line::ACTIVE_LOW
-									? "active-low" : "active-high");
+				::std::cout << (lit.is_active_low() ? "active-low" : "active-high");
 
 				::std::cout << ::std::endl;
 			}
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 6c9ccd6..8b4a8f9 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -313,10 +313,10 @@ public:
 	GPIOD_API int direction(void) const;
 
 	/**
-	 * @brief Get current active state of this line.
-	 * @return Current active state setting.
+	 * @brief Check if this line's signal is inverted.
+	 * @return True if this line is "active-low", false otherwise.
 	 */
-	GPIOD_API int active_state(void) const;
+	GPIOD_API bool is_active_low(void) const;
 
 	/**
 	 * @brief Get current bias of this line.
@@ -482,16 +482,6 @@ public:
 		/**< Line's direction setting is output. */
 	};
 
-	/**
-	 * @brief Possible active state settings.
-	 */
-	enum : int {
-		ACTIVE_LOW = 1,
-		/**< Line's active state is low. */
-		ACTIVE_HIGH,
-		/**< Line's active state is high. */
-	};
-
 	/**
 	 * @brief Possible bias settings.
 	 */
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index 54382e2..5a907db 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -74,14 +74,12 @@ int line::direction(void) const
 	return dir == GPIOD_LINE_DIRECTION_INPUT ? DIRECTION_INPUT : DIRECTION_OUTPUT;
 }
 
-int line::active_state(void) const
+bool line::is_active_low(void) const
 {
 	this->throw_if_null();
 	line::chip_guard lock_chip(*this);
 
-	int active = ::gpiod_line_active_state(this->_m_line);
-
-	return active == GPIOD_LINE_ACTIVE_STATE_HIGH ? ACTIVE_HIGH : ACTIVE_LOW;
+	return ::gpiod_line_is_active_low(this->_m_line);
 }
 
 int line::bias(void) const
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index 53b1d03..3c7ea39 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -29,7 +29,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.offset() == 4);
 		REQUIRE(line.name() == "gpio-mockup-A-4");
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_INPUT);
-		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE_FALSE(line.is_active_low());
 		REQUIRE(line.consumer().empty());
 		REQUIRE_FALSE(line.is_requested());
 		REQUIRE_FALSE(line.is_used());
@@ -49,7 +49,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.offset() == 4);
 		REQUIRE(line.name() == "gpio-mockup-A-4");
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE_FALSE(line.is_active_low());
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
 		REQUIRE_FALSE(line.is_open_drain());
@@ -70,7 +70,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.offset() == 4);
 		REQUIRE(line.name() == "gpio-mockup-A-4");
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_LOW);
+		REQUIRE(line.is_active_low());
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
 		REQUIRE(line.is_open_drain());
@@ -90,7 +90,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.offset() == 4);
 		REQUIRE(line.name() == "gpio-mockup-A-4");
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE_FALSE(line.is_active_low());
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
 		REQUIRE_FALSE(line.is_open_drain());
@@ -110,7 +110,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.offset() == 4);
 		REQUIRE(line.name() == "gpio-mockup-A-4");
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE_FALSE(line.is_active_low());
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
 		REQUIRE_FALSE(line.is_open_drain());
@@ -130,7 +130,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.offset() == 4);
 		REQUIRE(line.name() == "gpio-mockup-A-4");
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE_FALSE(line.is_active_low());;
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
 		REQUIRE_FALSE(line.is_open_drain());
@@ -150,7 +150,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.offset() == 4);
 		REQUIRE(line.name() == "gpio-mockup-A-4");
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE_FALSE(line.is_active_low());
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
 		REQUIRE_FALSE(line.is_open_drain());
@@ -320,19 +320,19 @@ TEST_CASE("Line can be reconfigured", "[line]")
 		config.flags = 0;
 		line.request(config);
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_INPUT);
-		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE_FALSE(line.is_active_low());
 
 		line.set_config(::gpiod::line_request::DIRECTION_OUTPUT,
 			::gpiod::line_request::FLAG_ACTIVE_LOW,1);
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_LOW);
+		REQUIRE(line.is_active_low());
 		REQUIRE(mockup::instance().chip_get_value(0, 3) == 0);
 		line.set_value(0);
 		REQUIRE(mockup::instance().chip_get_value(0, 3) == 1);
 
 		line.set_config(::gpiod::line_request::DIRECTION_OUTPUT, 0);
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE_FALSE(line.is_active_low());
 		REQUIRE(mockup::instance().chip_get_value(0, 3) == 0);
 		line.set_value(1);
 		REQUIRE(mockup::instance().chip_get_value(0, 3) == 1);
@@ -348,12 +348,12 @@ TEST_CASE("Line can be reconfigured", "[line]")
 
 		line.set_flags(::gpiod::line_request::FLAG_ACTIVE_LOW);
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_LOW);
+		REQUIRE(line.is_active_low());
 		REQUIRE(mockup::instance().chip_get_value(0, 3) == 0);
 
 		line.set_flags(0);
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE_FALSE(line.is_active_low());
 		REQUIRE(mockup::instance().chip_get_value(0, 3) == 1);
 	}
 
diff --git a/bindings/python/examples/gpioinfo.py b/bindings/python/examples/gpioinfo.py
index 6a47b66..1593337 100755
--- a/bindings/python/examples/gpioinfo.py
+++ b/bindings/python/examples/gpioinfo.py
@@ -23,11 +23,11 @@ if __name__ == '__main__':
                     name = line.name()
                     consumer = line.consumer()
                     direction = line.direction()
-                    active_state = line.active_state()
+                    active_low = line.is_active_low()
 
                     print('\tline {:>3}: {:>18} {:>12} {:>8} {:>10}'.format(
                           offset,
                           'unnamed' if name is None else name,
                           'unused' if consumer is None else consumer,
                           'input' if direction == gpiod.Line.DIRECTION_INPUT else 'output',
-                          'active-low' if active_state == gpiod.Line.ACTIVE_LOW else 'active-high'))
+                          'active-low' if active_low else 'active-high'))
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index e8641f1..b48a83a 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -67,11 +67,6 @@ enum {
 	gpiod_DIRECTION_OUTPUT,
 };
 
-enum {
-	gpiod_ACTIVE_HIGH = 1,
-	gpiod_ACTIVE_LOW,
-};
-
 enum {
 	gpiod_BIAS_AS_IS = 1,
 	gpiod_BIAS_DISABLE,
@@ -341,28 +336,20 @@ static PyObject *gpiod_Line_direction(gpiod_LineObject *self,
 	return ret;
 }
 
-PyDoc_STRVAR(gpiod_Line_active_state_doc,
-"active_state() -> integer\n"
+PyDoc_STRVAR(gpiod_Line_is_active_low_doc,
+"is_active_low() -> boolean\n"
 "\n"
-"Get the active state setting of this GPIO line.");
+"Check if this line's signal is inverted");
 
-static PyObject *gpiod_Line_active_state(gpiod_LineObject *self,
-					 PyObject *Py_UNUSED(ignored))
+static PyObject *gpiod_Line_is_active_low(gpiod_LineObject *self,
+					  PyObject *Py_UNUSED(ignored))
 {
-	PyObject *ret;
-	int active;
-
 	if (gpiod_ChipIsClosed(self->owner))
 		return NULL;
 
-	active = gpiod_line_active_state(self->line);
-
-	if (active == GPIOD_LINE_ACTIVE_STATE_HIGH)
-		ret = Py_BuildValue("I", gpiod_ACTIVE_HIGH);
-	else
-		ret = Py_BuildValue("I", gpiod_ACTIVE_LOW);
-
-	return ret;
+	if (gpiod_line_is_active_low(self->line))
+		Py_RETURN_TRUE;
+	Py_RETURN_FALSE;
 }
 
 PyDoc_STRVAR(gpiod_Line_bias_doc,
@@ -973,10 +960,10 @@ static PyMethodDef gpiod_Line_methods[] = {
 		.ml_doc = gpiod_Line_direction_doc,
 	},
 	{
-		.ml_name = "active_state",
-		.ml_meth = (PyCFunction)gpiod_Line_active_state,
+		.ml_name = "is_active_low",
+		.ml_meth = (PyCFunction)gpiod_Line_is_active_low,
 		.ml_flags = METH_NOARGS,
-		.ml_doc = gpiod_Line_active_state_doc,
+		.ml_doc = gpiod_Line_is_active_low_doc,
 	},
 	{
 		.ml_name = "bias",
@@ -2538,16 +2525,6 @@ static gpiod_ConstDescr gpiod_ConstList[] = {
 		.name = "DIRECTION_OUTPUT",
 		.val = gpiod_DIRECTION_OUTPUT,
 	},
-	{
-		.typeobj = &gpiod_LineType,
-		.name = "ACTIVE_HIGH",
-		.val = gpiod_ACTIVE_HIGH,
-	},
-	{
-		.typeobj = &gpiod_LineType,
-		.name = "ACTIVE_LOW",
-		.val = gpiod_ACTIVE_LOW,
-	},
 	{
 		.typeobj = &gpiod_LineType,
 		.name = "BIAS_AS_IS",
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index 79294bc..3093a1c 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -205,7 +205,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.offset(), 4)
             self.assertEqual(line.name(), 'gpio-mockup-A-4')
             self.assertEqual(line.direction(), gpiod.Line.DIRECTION_INPUT)
-            self.assertEqual(line.active_state(), gpiod.Line.ACTIVE_HIGH)
+            self.assertFalse(line.is_active_low())
             self.assertEqual(line.consumer(), None)
             self.assertFalse(line.is_used())
             self.assertFalse(line.is_requested())
@@ -219,7 +219,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.offset(), 4)
             self.assertEqual(line.name(), 'gpio-mockup-A-4')
             self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
-            self.assertEqual(line.active_state(), gpiod.Line.ACTIVE_LOW)
+            self.assertTrue(line.is_active_low())
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
@@ -235,7 +235,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.offset(), 4)
             self.assertEqual(line.name(), 'gpio-mockup-A-4')
             self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
-            self.assertEqual(line.active_state(), gpiod.Line.ACTIVE_LOW)
+            self.assertTrue(line.is_active_low())
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
@@ -253,7 +253,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.offset(), 4)
             self.assertEqual(line.name(), 'gpio-mockup-A-4')
             self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
-            self.assertEqual(line.active_state(), gpiod.Line.ACTIVE_HIGH)
+            self.assertFalse(line.is_active_low())
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
@@ -271,7 +271,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.offset(), 4)
             self.assertEqual(line.name(), 'gpio-mockup-A-4')
             self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
-            self.assertEqual(line.active_state(), gpiod.Line.ACTIVE_HIGH)
+            self.assertFalse(line.is_active_low())
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
@@ -289,7 +289,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.offset(), 4)
             self.assertEqual(line.name(), 'gpio-mockup-A-4')
             self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
-            self.assertEqual(line.active_state(), gpiod.Line.ACTIVE_HIGH)
+            self.assertFalse(line.is_active_low())
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
@@ -307,7 +307,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.offset(), 4)
             self.assertEqual(line.name(), 'gpio-mockup-A-4')
             self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
-            self.assertEqual(line.active_state(), gpiod.Line.ACTIVE_HIGH)
+            self.assertFalse(line.is_active_low())
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
@@ -325,7 +325,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.offset(), 4)
             self.assertEqual(line.name(), 'gpio-mockup-A-4')
             self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
-            self.assertEqual(line.active_state(), gpiod.Line.ACTIVE_HIGH)
+            self.assertFalse(line.is_active_low())
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
diff --git a/include/gpiod.h b/include/gpiod.h
index b073b3b..75da84c 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -280,16 +280,6 @@ enum {
 	/**< Direction is output - we're driving the GPIO line. */
 };
 
-/**
- * @brief Possible active state settings.
- */
-enum {
-	GPIOD_LINE_ACTIVE_STATE_HIGH = 1,
-	/**< The active state of a GPIO is active-high. */
-	GPIOD_LINE_ACTIVE_STATE_LOW,
-	/**< The active state of a GPIO is active-low. */
-};
-
 /**
  * @brief Possible internal bias settings.
  */
@@ -337,11 +327,11 @@ const char *gpiod_line_consumer(struct gpiod_line *line) GPIOD_API;
 int gpiod_line_direction(struct gpiod_line *line) GPIOD_API;
 
 /**
- * @brief Read the GPIO line active state setting.
+ * @brief Check if the signal of this line is inverted.
  * @param line GPIO line object.
- * @return Returns GPIOD_LINE_ACTIVE_STATE_HIGH or GPIOD_LINE_ACTIVE_STATE_LOW.
+ * @return True if this line is "active-low", false otherwise.
  */
-int gpiod_line_active_state(struct gpiod_line *line) GPIOD_API;
+bool gpiod_line_is_active_low(struct gpiod_line *line) GPIOD_API;
 
 /**
  * @brief Read the GPIO line bias setting.
diff --git a/lib/core.c b/lib/core.c
index d96e6cf..c6fb474 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -41,8 +41,8 @@ struct gpiod_line {
 	/* The direction of the GPIO line. */
 	int direction;
 
-	/* The active-state configuration. */
-	int active_state;
+	/* Is this line active-low?. */
+	bool active_low;
 
 	/* The logical value last written to the line. */
 	int output_value;
@@ -471,9 +471,9 @@ int gpiod_line_direction(struct gpiod_line *line)
 	return line->direction;
 }
 
-int gpiod_line_active_state(struct gpiod_line *line)
+bool gpiod_line_is_active_low(struct gpiod_line *line)
 {
-	return line->active_state;
+	return line->active_low;
 }
 
 int gpiod_line_bias(struct gpiod_line *line)
@@ -541,9 +541,7 @@ int gpiod_line_update(struct gpiod_line *line)
 						? GPIOD_LINE_DIRECTION_OUTPUT
 						: GPIOD_LINE_DIRECTION_INPUT;
 
-	line->active_state = info.flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW
-						? GPIOD_LINE_ACTIVE_STATE_LOW
-						: GPIOD_LINE_ACTIVE_STATE_HIGH;
+	line->active_low = !!(info.flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
 
 	line->info_flags = line_info_v2_to_info_flags(&info);
 
diff --git a/tests/tests-line.c b/tests/tests-line.c
index cc66fcc..d6264af 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -340,12 +340,10 @@ GPIOD_TEST_CASE(set_config_bulk_null_values, 0, { 8 })
 	ret = gpiod_line_request_bulk_output(bulk, GPIOD_TEST_CONSUMER, 0);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_line_active_state(line0), ==,
-			GPIOD_LINE_ACTIVE_STATE_HIGH);
-	g_assert_cmpint(gpiod_line_active_state(line1), ==,
-			GPIOD_LINE_ACTIVE_STATE_HIGH);
-	g_assert_cmpint(gpiod_line_active_state(line2), ==,
-			GPIOD_LINE_ACTIVE_STATE_HIGH);
+	g_assert_false(gpiod_line_is_active_low(line0));
+	g_assert_false(gpiod_line_is_active_low(line1));
+	g_assert_false(gpiod_line_is_active_low(line2));
+
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 0);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
@@ -354,12 +352,9 @@ GPIOD_TEST_CASE(set_config_bulk_null_values, 0, { 8 })
 			GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
 			GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW, NULL);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_active_state(line0), ==,
-			GPIOD_LINE_ACTIVE_STATE_LOW);
-	g_assert_cmpint(gpiod_line_active_state(line1), ==,
-			GPIOD_LINE_ACTIVE_STATE_LOW);
-	g_assert_cmpint(gpiod_line_active_state(line2), ==,
-			GPIOD_LINE_ACTIVE_STATE_LOW);
+	g_assert_true(gpiod_line_is_active_low(line0));
+	g_assert_true(gpiod_line_is_active_low(line1));
+	g_assert_true(gpiod_line_is_active_low(line2));
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 1);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 1);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
@@ -367,12 +362,9 @@ GPIOD_TEST_CASE(set_config_bulk_null_values, 0, { 8 })
 	ret = gpiod_line_set_config_bulk(bulk,
 			GPIOD_LINE_REQUEST_DIRECTION_OUTPUT, 0, NULL);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_active_state(line0), ==,
-			GPIOD_LINE_ACTIVE_STATE_HIGH);
-	g_assert_cmpint(gpiod_line_active_state(line1), ==,
-			GPIOD_LINE_ACTIVE_STATE_HIGH);
-	g_assert_cmpint(gpiod_line_active_state(line2), ==,
-			GPIOD_LINE_ACTIVE_STATE_HIGH);
+	g_assert_false(gpiod_line_is_active_low(line0));
+	g_assert_false(gpiod_line_is_active_low(line1));
+	g_assert_false(gpiod_line_is_active_low(line2));
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 0);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
@@ -395,20 +387,17 @@ GPIOD_TEST_CASE(set_flags_active_state, 0, { 8 })
 	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 1);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_line_active_state(line), ==,
-			GPIOD_LINE_ACTIVE_STATE_HIGH);
+	g_assert_false(gpiod_line_is_active_low(line));
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
 
 	ret = gpiod_line_set_flags(line, GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_active_state(line), ==,
-			GPIOD_LINE_ACTIVE_STATE_LOW);
+	g_assert_true(gpiod_line_is_active_low(line));
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
 
 	ret = gpiod_line_set_flags(line, 0);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_active_state(line), ==,
-			GPIOD_LINE_ACTIVE_STATE_HIGH);
+	g_assert_false(gpiod_line_is_active_low(line));
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
 }
 
@@ -719,8 +708,7 @@ GPIOD_TEST_CASE(active_state, 0, { 8 })
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
 
-	g_assert_cmpint(gpiod_line_active_state(line), ==,
-			GPIOD_LINE_ACTIVE_STATE_HIGH);
+	g_assert_false(gpiod_line_is_active_low(line));
 
 	gpiod_line_release(line);
 
@@ -842,8 +830,7 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	g_assert_true(gpiod_line_is_open_drain(line));
 	g_assert_false(gpiod_line_is_open_source(line));
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
-	g_assert_cmpint(gpiod_line_active_state(line), ==,
-			GPIOD_LINE_ACTIVE_STATE_LOW);
+	g_assert_true(gpiod_line_is_active_low(line));
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
 
@@ -860,8 +847,7 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	g_assert_false(gpiod_line_is_open_drain(line));
 	g_assert_true(gpiod_line_is_open_source(line));
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
-	g_assert_cmpint(gpiod_line_active_state(line), ==,
-			GPIOD_LINE_ACTIVE_STATE_LOW);
+	g_assert_true(gpiod_line_is_active_low(line));
 
 	gpiod_line_release(line);
 
@@ -882,8 +868,7 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	g_assert_false(gpiod_line_is_open_drain(line));
 	g_assert_false(gpiod_line_is_open_source(line));
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_PULL_DOWN);
-	g_assert_cmpint(gpiod_line_active_state(line), ==,
-			GPIOD_LINE_ACTIVE_STATE_LOW);
+	g_assert_true(gpiod_line_is_active_low(line));
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_INPUT);
 
@@ -903,8 +888,7 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	g_assert_false(gpiod_line_is_open_drain(line));
 	g_assert_false(gpiod_line_is_open_source(line));
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_PULL_UP);
-	g_assert_cmpint(gpiod_line_active_state(line), ==,
-			GPIOD_LINE_ACTIVE_STATE_LOW);
+	g_assert_true(gpiod_line_is_active_low(line));
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_INPUT);
 
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 057a19f..8d228ab 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -117,11 +117,11 @@ static PRINTF(3, 4) void prinfo(bool *of,
 
 static void list_lines(struct gpiod_chip *chip)
 {
-	int direction, active_state;
+	bool flag_printed, of, active_low;
 	const char *name, *consumer;
 	struct gpiod_line *line;
 	unsigned int i, offset;
-	bool flag_printed, of;
+	int direction;
 
 	printf("%s - %u lines:\n",
 	       gpiod_chip_name(chip), gpiod_chip_num_lines(chip));
@@ -134,7 +134,7 @@ static void list_lines(struct gpiod_chip *chip)
 		name = gpiod_line_name(line);
 		consumer = gpiod_line_consumer(line);
 		direction = gpiod_line_direction(line);
-		active_state = gpiod_line_active_state(line);
+		active_low = gpiod_line_is_active_low(line);
 
 		of = false;
 
@@ -157,9 +157,7 @@ static void list_lines(struct gpiod_chip *chip)
 		prinfo(&of, 8, "%s ", direction == GPIOD_LINE_DIRECTION_INPUT
 							? "input" : "output");
 		prinfo(&of, 13, "%s ",
-		       active_state == GPIOD_LINE_ACTIVE_STATE_LOW
-							? "active-low"
-							: "active-high");
+		       active_low ? "active-low" : "active-high");
 
 		flag_printed = false;
 		for (i = 0; i < ARRAY_SIZE(flags); i++) {
-- 
2.29.1

