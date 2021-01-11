Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B672F1517
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 14:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732322AbhAKNfR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 08:35:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732336AbhAKNfP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 08:35:15 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9514AC06179F
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 05:34:34 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id y17so16423383wrr.10
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 05:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XoF0/MvdOgxi1bpezX0nEQo+7jz9HVrhGliuxhhSz7s=;
        b=2KF1T1T99AeR9jS5CabfOGYw6ttvtw63unnDtTwZu+mFTEOYrZfbxfqJtG7Oc30qd8
         9t0W0QAtTLqz1rnXzQZ89d6EjeOkCs9AeeHXGH9c+l274ZKI3IpRRrCvA+fQw/rIYjyK
         lQ3Yedlo7W7LbpQukLMAl5sFPwHSgQSACMHYmV+35BRz5Eir/PjtvHDnEZWPXQLKv83A
         +Fxtp9o0rOHJog0b7OEb+SqO4SXOWNCQ2ckw/2bMgtxK8jsY1y4vhZQCsbZEf89mEU6N
         RhPAtVQ0FgziG3Uph8dwqy2bVdJP5UWkx/9m+k0lf0O73jFR2Mcf/cNxD2nhkBmGOagn
         LDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XoF0/MvdOgxi1bpezX0nEQo+7jz9HVrhGliuxhhSz7s=;
        b=HgmfzmNpdxq2o+8QW1O/qhefTIJj/w5wtK7qbhsgoqEftVKaAYuVbNv3kUVpGfL0dp
         MqRLCbxgW5pAOaTANgLza/nMwwORIcIIouEM3B3re8Mat0x4cXh13ue6810bBhrQboYe
         0y/KKV2LiPuqCQSWX9w4S4gueVpbLYivrvTpe56lLL9b7LnVq8sFpLy3j3PPq3M5+czJ
         iPnOGkO5B5xs9fv4mWHATVEzKKVSFj93sb8V6/LcksNd4k3ZUDGAXIMdw4n6nX3aunjI
         EJY/DPPE77ExgmGj27UvHQNSuwYmmf2nU/LrprItFhgvPsyXmLxt6wR+ofEy9ZLCnwLe
         ee+Q==
X-Gm-Message-State: AOAM532cBIyW0V/eFmuZQSjtF85iOD8cAfKD7yZnJDBkiB0BmZFYERP9
        JdqM1uflEt4rQ/FbYPYGxWJB6A==
X-Google-Smtp-Source: ABdhPJz3mDlwqhtQgBYo17p6FvFQVTN1yFloTz8dxt3EIevzXnmv4nW6YpkFd+p39qsX4npjJMnBcw==
X-Received: by 2002:a5d:60ca:: with SMTP id x10mr16800669wrt.242.1610372073388;
        Mon, 11 Jan 2021 05:34:33 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id m11sm21456741wmi.16.2021.01.11.05.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 05:34:32 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 3/6] treewide: rename BIAS_AS_IS to BIAS_NONE
Date:   Mon, 11 Jan 2021 14:34:23 +0100
Message-Id: <20210111133426.22040-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210111133426.22040-1-brgl@bgdev.pl>
References: <20210111133426.22040-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

When inspecting the current bias setting of a GPIO line, the AS_IS name
of one of the possible values really means that there's no bias so it
should be renamed to NONE for clarity.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/gpiod.hpp                 |  2 +-
 bindings/cxx/line.cpp                  |  2 +-
 bindings/cxx/tests/tests-line.cpp      |  8 ++++----
 bindings/python/gpiodmodule.c          | 10 +++++-----
 bindings/python/tests/gpiod_py_test.py |  6 +++---
 include/gpiod.h                        |  4 ++--
 lib/core.c                             |  2 +-
 tests/tests-line.c                     | 12 ++++++------
 8 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 8b4a8f9..fb675fc 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -486,7 +486,7 @@ public:
 	 * @brief Possible bias settings.
 	 */
 	enum : int {
-		BIAS_AS_IS = 1,
+		BIAS_NONE = 1,
 		/**< Line's bias state is unknown. */
 		BIAS_DISABLE,
 		/**< Line's internal bias is disabled. */
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index 5a907db..19c974d 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -17,7 +17,7 @@ const ::std::map<int, int> bias_mapping = {
 	{ GPIOD_LINE_BIAS_PULL_UP,	line::BIAS_PULL_UP, },
 	{ GPIOD_LINE_BIAS_PULL_DOWN,	line::BIAS_PULL_DOWN, },
 	{ GPIOD_LINE_BIAS_DISABLE,	line::BIAS_DISABLE, },
-	{ GPIOD_LINE_BIAS_AS_IS,	line::BIAS_AS_IS, },
+	{ GPIOD_LINE_BIAS_NONE,		line::BIAS_NONE, },
 };
 
 } /* namespace */
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index 3c7ea39..2a6cdf8 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -35,7 +35,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE_FALSE(line.is_used());
 		REQUIRE_FALSE(line.is_open_drain());
 		REQUIRE_FALSE(line.is_open_source());
-		REQUIRE(line.bias() == ::gpiod::line::BIAS_AS_IS);
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_NONE);
 	}
 
 	SECTION("exported line")
@@ -54,7 +54,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.is_used());
 		REQUIRE_FALSE(line.is_open_drain());
 		REQUIRE_FALSE(line.is_open_source());
-		REQUIRE(line.bias() == ::gpiod::line::BIAS_AS_IS);
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_NONE);
 	}
 
 	SECTION("exported line with flags")
@@ -75,7 +75,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.is_used());
 		REQUIRE(line.is_open_drain());
 		REQUIRE_FALSE(line.is_open_source());
-		REQUIRE(line.bias() == ::gpiod::line::BIAS_AS_IS);
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_NONE);
 	}
 
 	SECTION("exported open source line")
@@ -95,7 +95,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.is_used());
 		REQUIRE_FALSE(line.is_open_drain());
 		REQUIRE(line.is_open_source());
-		REQUIRE(line.bias() == ::gpiod::line::BIAS_AS_IS);
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_NONE);
 	}
 
 	SECTION("exported bias disable line")
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index b48a83a..228ac73 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -68,7 +68,7 @@ enum {
 };
 
 enum {
-	gpiod_BIAS_AS_IS = 1,
+	gpiod_BIAS_NONE = 1,
 	gpiod_BIAS_DISABLE,
 	gpiod_BIAS_PULL_UP,
 	gpiod_BIAS_PULL_DOWN,
@@ -374,9 +374,9 @@ static PyObject *gpiod_Line_bias(gpiod_LineObject *self,
 		return Py_BuildValue("I", gpiod_BIAS_PULL_DOWN);
 	case GPIOD_LINE_BIAS_DISABLE:
 		return Py_BuildValue("I", gpiod_BIAS_DISABLE);
-	case GPIOD_LINE_BIAS_AS_IS:
+	case GPIOD_LINE_BIAS_NONE:
 	default:
-		return Py_BuildValue("I", gpiod_BIAS_AS_IS);
+		return Py_BuildValue("I", gpiod_BIAS_NONE);
 	}
 }
 
@@ -2527,8 +2527,8 @@ static gpiod_ConstDescr gpiod_ConstList[] = {
 	},
 	{
 		.typeobj = &gpiod_LineType,
-		.name = "BIAS_AS_IS",
-		.val = gpiod_BIAS_AS_IS,
+		.name = "BIAS_NONE",
+		.val = gpiod_BIAS_NONE,
 	},
 	{
 		.typeobj = &gpiod_LineType,
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index 3093a1c..d9521de 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -241,7 +241,7 @@ class LineInfo(MockupTestCase):
             self.assertTrue(line.is_requested())
             self.assertTrue(line.is_open_drain())
             self.assertFalse(line.is_open_source())
-            self.assertEqual(line.bias(), gpiod.Line.BIAS_AS_IS)
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_NONE)
 
     def test_exported_open_drain_line(self):
         with gpiod.Chip(mockup.chip_path(0)) as chip:
@@ -259,7 +259,7 @@ class LineInfo(MockupTestCase):
             self.assertTrue(line.is_requested())
             self.assertTrue(line.is_open_drain())
             self.assertFalse(line.is_open_source())
-            self.assertEqual(line.bias(), gpiod.Line.BIAS_AS_IS)
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_NONE)
 
     def test_exported_open_source_line(self):
         with gpiod.Chip(mockup.chip_path(0)) as chip:
@@ -277,7 +277,7 @@ class LineInfo(MockupTestCase):
             self.assertTrue(line.is_requested())
             self.assertFalse(line.is_open_drain())
             self.assertTrue(line.is_open_source())
-            self.assertEqual(line.bias(), gpiod.Line.BIAS_AS_IS)
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_NONE)
 
     def test_exported_bias_disable_line(self):
         with gpiod.Chip(mockup.chip_path(0)) as chip:
diff --git a/include/gpiod.h b/include/gpiod.h
index 75da84c..18017d5 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -284,7 +284,7 @@ enum {
  * @brief Possible internal bias settings.
  */
 enum {
-	GPIOD_LINE_BIAS_AS_IS = 1,
+	GPIOD_LINE_BIAS_NONE = 1,
 	/**< The internal bias state is unknown. */
 	GPIOD_LINE_BIAS_DISABLE,
 	/**< The internal bias is disabled. */
@@ -337,7 +337,7 @@ bool gpiod_line_is_active_low(struct gpiod_line *line) GPIOD_API;
  * @brief Read the GPIO line bias setting.
  * @param line GPIO line object.
  * @return Returns GPIOD_LINE_BIAS_PULL_UP, GPIOD_LINE_BIAS_PULL_DOWN,
- *         GPIOD_LINE_BIAS_DISABLE or GPIOD_LINE_BIAS_AS_IS.
+ *         GPIOD_LINE_BIAS_DISABLE or GPIOD_LINE_BIAS_NONE.
  */
 int gpiod_line_bias(struct gpiod_line *line) GPIOD_API;
 
diff --git a/lib/core.c b/lib/core.c
index c6fb474..60b39c6 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -485,7 +485,7 @@ int gpiod_line_bias(struct gpiod_line *line)
 	if (line->info_flags & GPIOLINE_FLAG_BIAS_PULL_DOWN)
 		return GPIOD_LINE_BIAS_PULL_DOWN;
 
-	return GPIOD_LINE_BIAS_AS_IS;
+	return GPIOD_LINE_BIAS_NONE;
 }
 
 bool gpiod_line_is_used(struct gpiod_line *line)
diff --git a/tests/tests-line.c b/tests/tests-line.c
index d6264af..07d5601 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -418,7 +418,7 @@ GPIOD_TEST_CASE(set_flags_bias, 0, { 8 })
 	ret = gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_NONE);
 
 	ret = gpiod_line_set_flags(line,
 		GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE);
@@ -762,7 +762,7 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	g_assert_false(gpiod_line_is_used(line));
 	g_assert_false(gpiod_line_is_open_drain(line));
 	g_assert_false(gpiod_line_is_open_source(line));
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_NONE);
 
 	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
 	config.consumer = GPIOD_TEST_CONSUMER;
@@ -775,7 +775,7 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	g_assert_true(gpiod_line_is_used(line));
 	g_assert_true(gpiod_line_is_open_drain(line));
 	g_assert_false(gpiod_line_is_open_source(line));
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_NONE);
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
 
@@ -790,7 +790,7 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	g_assert_true(gpiod_line_is_used(line));
 	g_assert_false(gpiod_line_is_open_drain(line));
 	g_assert_true(gpiod_line_is_open_source(line));
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_NONE);
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
 
@@ -829,7 +829,7 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	g_assert_true(gpiod_line_is_used(line));
 	g_assert_true(gpiod_line_is_open_drain(line));
 	g_assert_false(gpiod_line_is_open_source(line));
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_NONE);
 	g_assert_true(gpiod_line_is_active_low(line));
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
@@ -846,7 +846,7 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	g_assert_true(gpiod_line_is_used(line));
 	g_assert_false(gpiod_line_is_open_drain(line));
 	g_assert_true(gpiod_line_is_open_source(line));
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_NONE);
 	g_assert_true(gpiod_line_is_active_low(line));
 
 	gpiod_line_release(line);
-- 
2.29.1

