Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30DD92F1518
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 14:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732336AbhAKNfS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 08:35:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732377AbhAKNfQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 08:35:16 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B043BC0617A2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 05:34:35 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id r7so16441492wrc.5
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 05:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pA+DRfoIjhbgWWyFql2eSbKA9L9zSyYnArOiSjcfJRw=;
        b=CLdvSZ023gXb9u5bx1T3sFFmAcrKqVPpvZ6xP4BVA1iWeq0cDZqmlQLw1sNFDCJwo5
         CTs5dRmutPEdM9Nfv5WDORPXOsvfPkMRAWgeGymENr9VOxO1H5YUiyjblzpPeZQJVugv
         5yE7/4nPnGHytMhTt77bG3bISs8jmmYhCmWO7uKg6KxatyJL5dzNs8hlC30cCm71nrca
         s/4RQNgwPlBXr2cxNK7KeTg/rkDD156YJ1uXj58Gc5BADKnc6r5wt0iZ2y+uOJMIvbo5
         54awIjXx2uiw67rvRA+m7d8ckyrZgyG+tzMVNRxsYm4leHyvwwDnt9n7zX1tKDjsP+Pa
         Y/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pA+DRfoIjhbgWWyFql2eSbKA9L9zSyYnArOiSjcfJRw=;
        b=mMN3e/CseS02ubrwJ3PfnWPf1sblGSobYac3sZTbO2G5ZqmkGxmzcuKqAut+VEWFSK
         U1b2F2IkbzzKZzDMD9rxsnR7x9PtbwbXPmNAsW9D8IBptIl9z2VFkFaClVXcs8cc0TZG
         eeTlALKg3SN0ROVCljOo+v8S72P1+CrkjHr4295jN09Y6xRBbNzcVjuN/7yZ9pBix+gG
         qciNR1Q1VEDYNuvrATPZiA3Ro9/65fZpm+TIzTD3XX4kJg3p0VUXmCEezF8LeCP2fZFL
         xVurP3ofFYEqXRaV8EtS0BFvMWeJViCoWN8bMsAN8sWUrj5yZ9ignF7XLCHI1brVssae
         uPEA==
X-Gm-Message-State: AOAM530bbsMRj0JtARigplGPs/XmDZxWzgRjFBbUZUdh5Te24nCCti8E
        GZlEcH6rtuad0gS4On/d1Si/HA==
X-Google-Smtp-Source: ABdhPJzg6IaeDytgUq0t7I1RzJqeR460RHocNPF2lUDxjr0BZuGoPv7wOjpHjN0elf5KUK+w5AIq7A==
X-Received: by 2002:a5d:6209:: with SMTP id y9mr16298091wru.197.1610372074364;
        Mon, 11 Jan 2021 05:34:34 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id m11sm21456741wmi.16.2021.01.11.05.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 05:34:33 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 4/6] treewide: make drive settings an enum
Date:   Mon, 11 Jan 2021 14:34:24 +0100
Message-Id: <20210111133426.22040-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210111133426.22040-1-brgl@bgdev.pl>
References: <20210111133426.22040-1-brgl@bgdev.pl>
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
index fb675fc..f9c341d 100644
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
+		DRIVE_NONE = 1,
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
index 19c974d..04b15f7 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -13,6 +13,12 @@ namespace gpiod {
 
 namespace {
 
+const ::std::map<int, int> drive_mapping = {
+	{ GPIOD_LINE_DRIVE_NONE,	line::DRIVE_NONE, },
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
index 2a6cdf8..852b8a0 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -33,8 +33,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.consumer().empty());
 		REQUIRE_FALSE(line.is_requested());
 		REQUIRE_FALSE(line.is_used());
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_NONE);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_NONE);
 	}
 
@@ -52,8 +51,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE_FALSE(line.is_active_low());
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_NONE);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_NONE);
 	}
 
@@ -73,8 +71,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.is_active_low());
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
-		REQUIRE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_OPEN_DRAIN);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_NONE);
 	}
 
@@ -93,8 +90,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE_FALSE(line.is_active_low());
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_OPEN_SOURCE);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_NONE);
 	}
 
@@ -113,8 +109,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE_FALSE(line.is_active_low());
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_NONE);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_DISABLE);
 	}
 
@@ -133,8 +128,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE_FALSE(line.is_active_low());;
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_NONE);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_PULL_DOWN);
 	}
 
@@ -153,8 +147,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE_FALSE(line.is_active_low());
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_NONE);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_PULL_UP);
 	}
 
@@ -364,23 +357,19 @@ TEST_CASE("Line can be reconfigured", "[line]")
 		config.flags = 0;
 		line.request(config);
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_NONE);
 
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
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_NONE);
 	}
 
 	SECTION("set flags (single line, bias)")
@@ -390,23 +379,19 @@ TEST_CASE("Line can be reconfigured", "[line]")
 		config.flags = 0;
 		line.request(config);
 		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE_FALSE(line.is_open_drain());
-		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_NONE);
 
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
+		REQUIRE(line.drive() == ::gpiod::line::DRIVE_NONE);
 	}
 
 	SECTION("set direction input (single line)")
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index 228ac73..a1a7f98 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -67,6 +67,12 @@ enum {
 	gpiod_DIRECTION_OUTPUT,
 };
 
+enum {
+	gpiod_DRIVE_NONE = 1,
+	gpiod_DRIVE_OPEN_DRAIN,
+	gpiod_DRIVE_OPEN_SOURCE,
+};
+
 enum {
 	gpiod_BIAS_NONE = 1,
 	gpiod_BIAS_DISABLE,
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
+	case GPIOD_LINE_DRIVE_NONE:
+	default:
+		return Py_BuildValue("I", gpiod_DRIVE_NONE);
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
+		.name = "DRIVE_NONE",
+		.val = gpiod_DRIVE_NONE,
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
 		.name = "BIAS_NONE",
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index d9521de..4b05f01 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -239,8 +239,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
-            self.assertTrue(line.is_open_drain())
-            self.assertFalse(line.is_open_source())
+            self.assertEqual(line.drive(), gpiod.Line.DRIVE_OPEN_DRAIN)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_NONE)
 
     def test_exported_open_drain_line(self):
@@ -257,8 +256,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
-            self.assertTrue(line.is_open_drain())
-            self.assertFalse(line.is_open_source())
+            self.assertEqual(line.drive(), gpiod.Line.DRIVE_OPEN_DRAIN)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_NONE)
 
     def test_exported_open_source_line(self):
@@ -275,8 +273,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
-            self.assertFalse(line.is_open_drain())
-            self.assertTrue(line.is_open_source())
+            self.assertEqual(line.drive(), gpiod.Line.DRIVE_OPEN_SOURCE)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_NONE)
 
     def test_exported_bias_disable_line(self):
@@ -293,8 +290,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
-            self.assertFalse(line.is_open_drain())
-            self.assertFalse(line.is_open_source())
+            self.assertEqual(line.drive(), gpiod.Line.DRIVE_NONE)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_DISABLE)
 
     def test_exported_bias_pull_down_line(self):
@@ -311,8 +307,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
-            self.assertFalse(line.is_open_drain())
-            self.assertFalse(line.is_open_source())
+            self.assertEqual(line.drive(), gpiod.Line.DRIVE_NONE)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_PULL_DOWN)
 
     def test_exported_bias_pull_up_line(self):
@@ -329,8 +324,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.consumer(), default_consumer)
             self.assertTrue(line.is_used())
             self.assertTrue(line.is_requested())
-            self.assertFalse(line.is_open_drain())
-            self.assertFalse(line.is_open_source())
+            self.assertEqual(line.drive(), gpiod.Line.DRIVE_NONE)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_PULL_UP)
 
     def test_update_line_info(self):
diff --git a/include/gpiod.h b/include/gpiod.h
index 18017d5..4e8e47f 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -280,6 +280,18 @@ enum {
 	/**< Direction is output - we're driving the GPIO line. */
 };
 
+/**
+ * @brief Possible drive settings.
+ */
+enum {
+	GPIOD_LINE_DRIVE_NONE = 1,
+	/**< Drive setting is unknown. */
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
+ * @return Returns GPIOD_LINE_DRIVE_NONE, GPIOD_LINE_DRIVE_OPEN_DRAIN or
+ *         GPIOD_LINE_DRIVE_OPEN_SOURCE.
  */
-bool gpiod_line_is_open_source(struct gpiod_line *line) GPIOD_API;
+int gpiod_line_drive(struct gpiod_line *line) GPIOD_API;
 
 /**
  * @brief Re-read the line info.
diff --git a/lib/core.c b/lib/core.c
index 60b39c6..9629a4f 100644
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
+	return GPIOD_LINE_DRIVE_NONE;
 }
 
 static int line_info_v2_to_info_flags(struct gpio_v2_line_info *info)
diff --git a/tests/tests-line.c b/tests/tests-line.c
index 07d5601..e6f0b69 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -455,20 +455,19 @@ GPIOD_TEST_CASE(set_flags_drive, 0, { 8 })
 	ret = gpiod_line_request_output(line, GPIOD_TEST_CONSUMER, 0);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_line_is_open_drain(line), ==, false);
-	g_assert_cmpint(gpiod_line_is_open_source(line), ==, false);
+	g_assert_cmpint(gpiod_line_drive(line), ==, GPIOD_LINE_DRIVE_NONE);
 
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
+	g_assert_cmpint(gpiod_line_drive(line), ==, GPIOD_LINE_DRIVE_NONE);
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_NONE);
 
 	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
@@ -773,8 +771,8 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	gpiod_test_return_if_failed();
 
 	g_assert_true(gpiod_line_is_used(line));
-	g_assert_true(gpiod_line_is_open_drain(line));
-	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_drive(line), ==,
+			GPIOD_LINE_DRIVE_OPEN_DRAIN);
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_NONE);
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
@@ -788,8 +786,8 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	gpiod_test_return_if_failed();
 
 	g_assert_true(gpiod_line_is_used(line));
-	g_assert_false(gpiod_line_is_open_drain(line));
-	g_assert_true(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_drive(line), ==,
+			GPIOD_LINE_DRIVE_OPEN_SOURCE);
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_NONE);
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
@@ -827,8 +825,8 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	gpiod_test_return_if_failed();
 
 	g_assert_true(gpiod_line_is_used(line));
-	g_assert_true(gpiod_line_is_open_drain(line));
-	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_drive(line), ==,
+			GPIOD_LINE_DRIVE_OPEN_DRAIN);
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_NONE);
 	g_assert_true(gpiod_line_is_active_low(line));
 	g_assert_cmpint(gpiod_line_direction(line), ==,
@@ -844,8 +842,8 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	gpiod_test_return_if_failed();
 
 	g_assert_true(gpiod_line_is_used(line));
-	g_assert_false(gpiod_line_is_open_drain(line));
-	g_assert_true(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_drive(line), ==,
+			GPIOD_LINE_DRIVE_OPEN_SOURCE);
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_NONE);
 	g_assert_true(gpiod_line_is_active_low(line));
 
@@ -865,8 +863,7 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	gpiod_test_return_if_failed();
 
 	g_assert_true(gpiod_line_is_used(line));
-	g_assert_false(gpiod_line_is_open_drain(line));
-	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_drive(line), ==, GPIOD_LINE_DRIVE_NONE);
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_PULL_DOWN);
 	g_assert_true(gpiod_line_is_active_low(line));
 	g_assert_cmpint(gpiod_line_direction(line), ==,
@@ -885,8 +882,7 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	gpiod_test_return_if_failed();
 
 	g_assert_true(gpiod_line_is_used(line));
-	g_assert_false(gpiod_line_is_open_drain(line));
-	g_assert_false(gpiod_line_is_open_source(line));
+	g_assert_cmpint(gpiod_line_drive(line), ==, GPIOD_LINE_DRIVE_NONE);
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_PULL_UP);
 	g_assert_true(gpiod_line_is_active_low(line));
 	g_assert_cmpint(gpiod_line_direction(line), ==,
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 8d228ab..7da9b03 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -37,6 +37,16 @@ static bool line_bias_is_disabled(struct gpiod_line *line)
 	return gpiod_line_bias(line) == GPIOD_LINE_BIAS_DISABLE;
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

