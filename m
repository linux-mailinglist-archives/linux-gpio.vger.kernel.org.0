Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 036B22F76B7
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 11:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbhAOKbG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 05:31:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbhAOKbE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 05:31:04 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96655C061794
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 02:30:24 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id c5so8727452wrp.6
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 02:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U2E+pacjL0TMdUdEQ6LEe+0yPB2elw2oqWl1anQ0uAg=;
        b=iwlbxOILH6PNcWT9V8ZzWAYMcIEw+8x+atIKLdJKRukarmBOaCvUUd+OgnH+CBJvVi
         +e+6VFI7J7nlJ/xpywWfvK8m28DVs6tTwdDdJJC8+TGKGGtGB/lVVFsYOFfSmIFfKK2V
         GRXID2Ugpp5PdnA9zN6KsQJyVrpxPtNrkrpygFqMsdDudAN51Xv6jOUhlJeE+4AHL8pl
         FJ0h/EFz6qRxjOuQKTn+cnVaWlQEF1SevCWCtVeZbrrvVKiKm74g4wlRm+AYUMKHAiN2
         Pvs7wH4690ZYQlCur59v0l79UeerN1DmYOJwpQVHAYaAkXhWF3OpA3vFNKWTVMGKjDqr
         tITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U2E+pacjL0TMdUdEQ6LEe+0yPB2elw2oqWl1anQ0uAg=;
        b=exYksCcDYeruLt67t1PPmGbq90jq6qyuG9iwIL1FEmfhcv6/ov7s/2lFYtj30p4OTG
         RuXEMaJBil3f0sVW71o92gsMAnlQ7RZjV4pMoGLJuNFMLnV/VJ8JOCFsZx+zZgDfo3Ue
         ZWi9Fxw8Ggo2/pgWWBpNFh+EWabZZgjw+pNSfXwtA9OxpJEv8xO38b1gf4fLzgNzyf4P
         eiLPCIp/lmpETXScz9rTs7d99g4I/OfFZp8maEBAL6AAWclSZcki7WjCDeRXJPhDS6rg
         XPNq6GVrhkS7ALzdeA7x8ic9e08EQPdmdhkfvdLNGfRl1KJ5AE9aPSO0z3wGOqDwV1r6
         ISnA==
X-Gm-Message-State: AOAM531S8JI37w2sumjZQHTB/64lGxnGXb7PQOsy8znafkfxg4gAbXY1
        /6V+4Ht48kkZ+++QatnswZ9GQA==
X-Google-Smtp-Source: ABdhPJwzjnWFlFnHgoYI4Jiz0qYpB1889kcaJ+kf7+a6HcNeokQNcGD0trwqZ2Lbct+tkcpAFrCvRA==
X-Received: by 2002:a5d:4d86:: with SMTP id b6mr12400514wru.152.1610706623278;
        Fri, 15 Jan 2021 02:30:23 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id m14sm13815288wrh.94.2021.01.15.02.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 02:30:22 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH v2 3/7] treewide: rename BIAS_AS_IS to BIAS_UNKNOWN
Date:   Fri, 15 Jan 2021 11:30:14 +0100
Message-Id: <20210115103018.27704-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210115103018.27704-1-brgl@bgdev.pl>
References: <20210115103018.27704-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

When inspecting the current bias setting of a GPIO line, the AS_IS name
of one of the possible values really means that the kernel uAPI can't
determine the bias setting because it didn't set it itself. In this case
it's better to change the name to BIAS_UNKNOWN to reflect that.

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
index 8b4a8f9..fb7f1fa 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -486,7 +486,7 @@ public:
 	 * @brief Possible bias settings.
 	 */
 	enum : int {
-		BIAS_AS_IS = 1,
+		BIAS_UNKNOWN = 1,
 		/**< Line's bias state is unknown. */
 		BIAS_DISABLE,
 		/**< Line's internal bias is disabled. */
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index 5a907db..c605790 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -17,7 +17,7 @@ const ::std::map<int, int> bias_mapping = {
 	{ GPIOD_LINE_BIAS_PULL_UP,	line::BIAS_PULL_UP, },
 	{ GPIOD_LINE_BIAS_PULL_DOWN,	line::BIAS_PULL_DOWN, },
 	{ GPIOD_LINE_BIAS_DISABLE,	line::BIAS_DISABLE, },
-	{ GPIOD_LINE_BIAS_AS_IS,	line::BIAS_AS_IS, },
+	{ GPIOD_LINE_BIAS_UNKNOWN,	line::BIAS_UNKNOWN, },
 };
 
 } /* namespace */
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index 3c7ea39..7ea9b3a 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -35,7 +35,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE_FALSE(line.is_used());
 		REQUIRE_FALSE(line.is_open_drain());
 		REQUIRE_FALSE(line.is_open_source());
-		REQUIRE(line.bias() == ::gpiod::line::BIAS_AS_IS);
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_UNKNOWN);
 	}
 
 	SECTION("exported line")
@@ -54,7 +54,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.is_used());
 		REQUIRE_FALSE(line.is_open_drain());
 		REQUIRE_FALSE(line.is_open_source());
-		REQUIRE(line.bias() == ::gpiod::line::BIAS_AS_IS);
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_UNKNOWN);
 	}
 
 	SECTION("exported line with flags")
@@ -75,7 +75,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.is_used());
 		REQUIRE(line.is_open_drain());
 		REQUIRE_FALSE(line.is_open_source());
-		REQUIRE(line.bias() == ::gpiod::line::BIAS_AS_IS);
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_UNKNOWN);
 	}
 
 	SECTION("exported open source line")
@@ -95,7 +95,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.is_used());
 		REQUIRE_FALSE(line.is_open_drain());
 		REQUIRE(line.is_open_source());
-		REQUIRE(line.bias() == ::gpiod::line::BIAS_AS_IS);
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_UNKNOWN);
 	}
 
 	SECTION("exported bias disable line")
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index b48a83a..e0cfab3 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -68,7 +68,7 @@ enum {
 };
 
 enum {
-	gpiod_BIAS_AS_IS = 1,
+	gpiod_BIAS_UNKNOWN = 1,
 	gpiod_BIAS_DISABLE,
 	gpiod_BIAS_PULL_UP,
 	gpiod_BIAS_PULL_DOWN,
@@ -374,9 +374,9 @@ static PyObject *gpiod_Line_bias(gpiod_LineObject *self,
 		return Py_BuildValue("I", gpiod_BIAS_PULL_DOWN);
 	case GPIOD_LINE_BIAS_DISABLE:
 		return Py_BuildValue("I", gpiod_BIAS_DISABLE);
-	case GPIOD_LINE_BIAS_AS_IS:
+	case GPIOD_LINE_BIAS_UNKNOWN:
 	default:
-		return Py_BuildValue("I", gpiod_BIAS_AS_IS);
+		return Py_BuildValue("I", gpiod_BIAS_UNKNOWN);
 	}
 }
 
@@ -2527,8 +2527,8 @@ static gpiod_ConstDescr gpiod_ConstList[] = {
 	},
 	{
 		.typeobj = &gpiod_LineType,
-		.name = "BIAS_AS_IS",
-		.val = gpiod_BIAS_AS_IS,
+		.name = "BIAS_UNKNOWN",
+		.val = gpiod_BIAS_UNKNOWN,
 	},
 	{
 		.typeobj = &gpiod_LineType,
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index 3093a1c..7d790f3 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -241,7 +241,7 @@ class LineInfo(MockupTestCase):
             self.assertTrue(line.is_requested())
             self.assertTrue(line.is_open_drain())
             self.assertFalse(line.is_open_source())
-            self.assertEqual(line.bias(), gpiod.Line.BIAS_AS_IS)
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_UNKNOWN)
 
     def test_exported_open_drain_line(self):
         with gpiod.Chip(mockup.chip_path(0)) as chip:
@@ -259,7 +259,7 @@ class LineInfo(MockupTestCase):
             self.assertTrue(line.is_requested())
             self.assertTrue(line.is_open_drain())
             self.assertFalse(line.is_open_source())
-            self.assertEqual(line.bias(), gpiod.Line.BIAS_AS_IS)
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_UNKNOWN)
 
     def test_exported_open_source_line(self):
         with gpiod.Chip(mockup.chip_path(0)) as chip:
@@ -277,7 +277,7 @@ class LineInfo(MockupTestCase):
             self.assertTrue(line.is_requested())
             self.assertFalse(line.is_open_drain())
             self.assertTrue(line.is_open_source())
-            self.assertEqual(line.bias(), gpiod.Line.BIAS_AS_IS)
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_UNKNOWN)
 
     def test_exported_bias_disable_line(self):
         with gpiod.Chip(mockup.chip_path(0)) as chip:
diff --git a/include/gpiod.h b/include/gpiod.h
index 75da84c..1aaa6cd 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -284,7 +284,7 @@ enum {
  * @brief Possible internal bias settings.
  */
 enum {
-	GPIOD_LINE_BIAS_AS_IS = 1,
+	GPIOD_LINE_BIAS_UNKNOWN = 1,
 	/**< The internal bias state is unknown. */
 	GPIOD_LINE_BIAS_DISABLE,
 	/**< The internal bias is disabled. */
@@ -337,7 +337,7 @@ bool gpiod_line_is_active_low(struct gpiod_line *line) GPIOD_API;
  * @brief Read the GPIO line bias setting.
  * @param line GPIO line object.
  * @return Returns GPIOD_LINE_BIAS_PULL_UP, GPIOD_LINE_BIAS_PULL_DOWN,
- *         GPIOD_LINE_BIAS_DISABLE or GPIOD_LINE_BIAS_AS_IS.
+ *         GPIOD_LINE_BIAS_DISABLE or GPIOD_LINE_BIAS_UNKNOWN.
  */
 int gpiod_line_bias(struct gpiod_line *line) GPIOD_API;
 
diff --git a/lib/core.c b/lib/core.c
index c6fb474..9ee84cf 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -485,7 +485,7 @@ int gpiod_line_bias(struct gpiod_line *line)
 	if (line->info_flags & GPIOLINE_FLAG_BIAS_PULL_DOWN)
 		return GPIOD_LINE_BIAS_PULL_DOWN;
 
-	return GPIOD_LINE_BIAS_AS_IS;
+	return GPIOD_LINE_BIAS_UNKNOWN;
 }
 
 bool gpiod_line_is_used(struct gpiod_line *line)
diff --git a/tests/tests-line.c b/tests/tests-line.c
index d6264af..88857a0 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -418,7 +418,7 @@ GPIOD_TEST_CASE(set_flags_bias, 0, { 8 })
 	ret = gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
 
 	ret = gpiod_line_set_flags(line,
 		GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE);
@@ -762,7 +762,7 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	g_assert_false(gpiod_line_is_used(line));
 	g_assert_false(gpiod_line_is_open_drain(line));
 	g_assert_false(gpiod_line_is_open_source(line));
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
 
 	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
 	config.consumer = GPIOD_TEST_CONSUMER;
@@ -775,7 +775,7 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	g_assert_true(gpiod_line_is_used(line));
 	g_assert_true(gpiod_line_is_open_drain(line));
 	g_assert_false(gpiod_line_is_open_source(line));
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
 
@@ -790,7 +790,7 @@ GPIOD_TEST_CASE(misc_flags, 0, { 8 })
 	g_assert_true(gpiod_line_is_used(line));
 	g_assert_false(gpiod_line_is_open_drain(line));
 	g_assert_true(gpiod_line_is_open_source(line));
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
 
@@ -829,7 +829,7 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	g_assert_true(gpiod_line_is_used(line));
 	g_assert_true(gpiod_line_is_open_drain(line));
 	g_assert_false(gpiod_line_is_open_source(line));
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
 	g_assert_true(gpiod_line_is_active_low(line));
 	g_assert_cmpint(gpiod_line_direction(line), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
@@ -846,7 +846,7 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 	g_assert_true(gpiod_line_is_used(line));
 	g_assert_false(gpiod_line_is_open_drain(line));
 	g_assert_true(gpiod_line_is_open_source(line));
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
 	g_assert_true(gpiod_line_is_active_low(line));
 
 	gpiod_line_release(line);
-- 
2.29.1

