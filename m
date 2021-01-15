Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4132F76B8
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 11:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbhAOKbH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 05:31:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbhAOKbG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 05:31:06 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B01C061795
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 02:30:25 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id c5so8727479wrp.6
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 02:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aphsTU9HtqHr+MTnNEXHu0BvdDEGZPpWbSySuJKBduU=;
        b=uiRyA/NEQ75+A2WC5vNaU/HykGI3gP91/V5gTy9ScIMGgSrVfPbr0HidnurJGcW9p8
         m2ePu14TE9PntOTLr3XST3n4Y6Ao3+Hth9zZstEYcNJ5IgJQdH2q1yXfHHEA2EXN33g/
         NmmQmnIf5okMIqlY9xmDWSRdPg6cCjL18lpyxiLNMx186mSKfev/LC9BOuwoFE7GNx28
         T3YRYxSTx9h2UBeWH2njWJeJOWaC6Sm3ZrGBna3pN1XXmRrjfs9nV/+AJNAfk3yv9STW
         3TJR3N6iN2RitvD2ac9nFonBTTBSseLkWCt7Gt/fqIodWVjGM3/1Aa4UVbXYnLEnINsg
         T/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aphsTU9HtqHr+MTnNEXHu0BvdDEGZPpWbSySuJKBduU=;
        b=Fv8p0oK0T62zdfzpu0u5OZqGjpmMVsRFlCjccGAsKxv3oay0aarKC6CzMI7Y7A0w/G
         2B4CLh70CqXueUzdJcE7I9C57hHeKSLoqweIvyj4zAS2S/xOOwZF0AD32tXXUMOXdruT
         eKzkat1NdVOVjeSCPHfrZ+1nPlc0gDNwGHovq7keE6ICc4Qf6asx4WwDYZrjB1fRGZZQ
         PXQGdPI9o2j5sQuF2e2w1m79DVDH5C11bNJ+rhtEZwmLb+Io4HyF3JOfMfCfd2XBxgtL
         sDH0m4vaXzcqKYY7hM1isY5Kp46V/XdVQcLpU3/iAlabnsWDuI1GEVx+2byapfaxEuaL
         kOXg==
X-Gm-Message-State: AOAM532W0/n5NZVXljgvnAuXm2ePebVQvViGF9Zwe8Ys7BZdMDljMUXp
        /GiJUND57gc04iKO4HiwP0JyWA==
X-Google-Smtp-Source: ABdhPJwiyREeghjZO6sfa1K3q1zE4WfyEz5bTpcuR4aeNvpZQlWs47lziy+SqmtJErvhLhOdB5p1CA==
X-Received: by 2002:a5d:6045:: with SMTP id j5mr11983014wrt.223.1610706624021;
        Fri, 15 Jan 2021 02:30:24 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id m14sm13815288wrh.94.2021.01.15.02.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 02:30:23 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH v2 4/7] treewide: rename BIAS_DISABLE to BIAS_DISABLED
Date:   Fri, 15 Jan 2021 11:30:15 +0100
Message-Id: <20210115103018.27704-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210115103018.27704-1-brgl@bgdev.pl>
References: <20210115103018.27704-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

When we're reading the current bias setting of a line, it is already
disabled so the flag should be named as such. While BIAS_DISABLE would
technically be fine when modifying the setting, let's rename it to
BIAS_DISABLED too for consistency.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/gpiod.hpp                 |  4 ++--
 bindings/cxx/line.cpp                  |  2 +-
 bindings/cxx/line_bulk.cpp             |  4 ++--
 bindings/cxx/tests/tests-line.cpp      |  4 ++--
 bindings/python/gpiodmodule.c          | 20 ++++++++++----------
 bindings/python/tests/gpiod_py_test.py |  4 ++--
 include/gpiod.h                        |  4 ++--
 lib/core.c                             |  6 +++---
 tests/tests-event.c                    |  2 +-
 tests/tests-line.c                     | 10 +++++-----
 tools/gpioinfo.c                       |  2 +-
 tools/tools-common.c                   |  2 +-
 12 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index fb7f1fa..dbcae6c 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -225,7 +225,7 @@ struct line_request
 	/**< The line is an open-source port. */
 	GPIOD_API static const ::std::bitset<32> FLAG_OPEN_DRAIN;
 	/**< The line is an open-drain port. */
-	GPIOD_API static const ::std::bitset<32> FLAG_BIAS_DISABLE;
+	GPIOD_API static const ::std::bitset<32> FLAG_BIAS_DISABLED;
 	/**< The line has neither pull-up nor pull-down resistor enabled. */
 	GPIOD_API static const ::std::bitset<32> FLAG_BIAS_PULL_DOWN;
 	/**< The line has a configurable pull-down resistor enabled. */
@@ -488,7 +488,7 @@ public:
 	enum : int {
 		BIAS_UNKNOWN = 1,
 		/**< Line's bias state is unknown. */
-		BIAS_DISABLE,
+		BIAS_DISABLED,
 		/**< Line's internal bias is disabled. */
 		BIAS_PULL_UP,
 		/**< Line's internal pull-up bias is enabled. */
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index c605790..99eb246 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -16,7 +16,7 @@ namespace {
 const ::std::map<int, int> bias_mapping = {
 	{ GPIOD_LINE_BIAS_PULL_UP,	line::BIAS_PULL_UP, },
 	{ GPIOD_LINE_BIAS_PULL_DOWN,	line::BIAS_PULL_DOWN, },
-	{ GPIOD_LINE_BIAS_DISABLE,	line::BIAS_DISABLE, },
+	{ GPIOD_LINE_BIAS_DISABLED,	line::BIAS_DISABLED, },
 	{ GPIOD_LINE_BIAS_UNKNOWN,	line::BIAS_UNKNOWN, },
 };
 
diff --git a/bindings/cxx/line_bulk.cpp b/bindings/cxx/line_bulk.cpp
index 6e88d21..17b7208 100644
--- a/bindings/cxx/line_bulk.cpp
+++ b/bindings/cxx/line_bulk.cpp
@@ -14,7 +14,7 @@ namespace gpiod {
 const ::std::bitset<32> line_request::FLAG_ACTIVE_LOW(GPIOD_BIT(0));
 const ::std::bitset<32> line_request::FLAG_OPEN_SOURCE(GPIOD_BIT(1));
 const ::std::bitset<32> line_request::FLAG_OPEN_DRAIN(GPIOD_BIT(2));
-const ::std::bitset<32> line_request::FLAG_BIAS_DISABLE(GPIOD_BIT(3));
+const ::std::bitset<32> line_request::FLAG_BIAS_DISABLED(GPIOD_BIT(3));
 const ::std::bitset<32> line_request::FLAG_BIAS_PULL_DOWN(GPIOD_BIT(4));
 const ::std::bitset<32> line_request::FLAG_BIAS_PULL_UP(GPIOD_BIT(5));
 
@@ -41,7 +41,7 @@ const ::std::map<::std::bitset<32>, int, bitset_cmp> reqflag_mapping = {
 	{ line_request::FLAG_ACTIVE_LOW,	GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW, },
 	{ line_request::FLAG_OPEN_DRAIN,	GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN, },
 	{ line_request::FLAG_OPEN_SOURCE,	GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE, },
-	{ line_request::FLAG_BIAS_DISABLE,	GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE, },
+	{ line_request::FLAG_BIAS_DISABLED,	GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED, },
 	{ line_request::FLAG_BIAS_PULL_DOWN,	GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN, },
 	{ line_request::FLAG_BIAS_PULL_UP,	GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP, },
 };
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index 7ea9b3a..97d12be 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -104,7 +104,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 
 		config.consumer = consumer.c_str();
 		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
-		config.flags = ::gpiod::line_request::FLAG_BIAS_DISABLE;
+		config.flags = ::gpiod::line_request::FLAG_BIAS_DISABLED;
 		line.request(config);
 
 		REQUIRE(line.offset() == 4);
@@ -115,7 +115,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.is_used());
 		REQUIRE_FALSE(line.is_open_drain());
 		REQUIRE_FALSE(line.is_open_source());
-		REQUIRE(line.bias() == ::gpiod::line::BIAS_DISABLE);
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_DISABLED);
 	}
 
 	SECTION("exported pull-down line")
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index e0cfab3..b1d8f35 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -57,7 +57,7 @@ enum {
 	gpiod_LINE_REQ_FLAG_OPEN_DRAIN		= GPIOD_BIT(0),
 	gpiod_LINE_REQ_FLAG_OPEN_SOURCE		= GPIOD_BIT(1),
 	gpiod_LINE_REQ_FLAG_ACTIVE_LOW		= GPIOD_BIT(2),
-	gpiod_LINE_REQ_FLAG_BIAS_DISABLE	= GPIOD_BIT(3),
+	gpiod_LINE_REQ_FLAG_BIAS_DISABLED	= GPIOD_BIT(3),
 	gpiod_LINE_REQ_FLAG_BIAS_PULL_DOWN	= GPIOD_BIT(4),
 	gpiod_LINE_REQ_FLAG_BIAS_PULL_UP	= GPIOD_BIT(5),
 };
@@ -69,7 +69,7 @@ enum {
 
 enum {
 	gpiod_BIAS_UNKNOWN = 1,
-	gpiod_BIAS_DISABLE,
+	gpiod_BIAS_DISABLED,
 	gpiod_BIAS_PULL_UP,
 	gpiod_BIAS_PULL_DOWN,
 };
@@ -372,8 +372,8 @@ static PyObject *gpiod_Line_bias(gpiod_LineObject *self,
 		return Py_BuildValue("I", gpiod_BIAS_PULL_UP);
 	case GPIOD_LINE_BIAS_PULL_DOWN:
 		return Py_BuildValue("I", gpiod_BIAS_PULL_DOWN);
-	case GPIOD_LINE_BIAS_DISABLE:
-		return Py_BuildValue("I", gpiod_BIAS_DISABLE);
+	case GPIOD_LINE_BIAS_DISABLED:
+		return Py_BuildValue("I", gpiod_BIAS_DISABLED);
 	case GPIOD_LINE_BIAS_UNKNOWN:
 	default:
 		return Py_BuildValue("I", gpiod_BIAS_UNKNOWN);
@@ -1286,8 +1286,8 @@ static void gpiod_MakeRequestConfig(struct gpiod_line_request_config *conf,
 		conf->flags |= GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE;
 	if (flags & gpiod_LINE_REQ_FLAG_ACTIVE_LOW)
 		conf->flags |= GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
-	if (flags & gpiod_LINE_REQ_FLAG_BIAS_DISABLE)
-		conf->flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE;
+	if (flags & gpiod_LINE_REQ_FLAG_BIAS_DISABLED)
+		conf->flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED;
 	if (flags & gpiod_LINE_REQ_FLAG_BIAS_PULL_DOWN)
 		conf->flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN;
 	if (flags & gpiod_LINE_REQ_FLAG_BIAS_PULL_UP)
@@ -2532,8 +2532,8 @@ static gpiod_ConstDescr gpiod_ConstList[] = {
 	},
 	{
 		.typeobj = &gpiod_LineType,
-		.name = "BIAS_DISABLE",
-		.val = gpiod_BIAS_DISABLE,
+		.name = "BIAS_DISABLED",
+		.val = gpiod_BIAS_DISABLED,
 	},
 	{
 		.typeobj = &gpiod_LineType,
@@ -2649,8 +2649,8 @@ static gpiod_ModuleConst gpiod_ModuleConsts[] = {
 		.value = gpiod_LINE_REQ_FLAG_ACTIVE_LOW,
 	},
 	{
-		.name = "LINE_REQ_FLAG_BIAS_DISABLE",
-		.value = gpiod_LINE_REQ_FLAG_BIAS_DISABLE,
+		.name = "LINE_REQ_FLAG_BIAS_DISABLED",
+		.value = gpiod_LINE_REQ_FLAG_BIAS_DISABLED,
 	},
 	{
 		.name = "LINE_REQ_FLAG_BIAS_PULL_DOWN",
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index 7d790f3..3c6e24b 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -282,7 +282,7 @@ class LineInfo(MockupTestCase):
     def test_exported_bias_disable_line(self):
         with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(4)
-            flags = gpiod.LINE_REQ_FLAG_BIAS_DISABLE
+            flags = gpiod.LINE_REQ_FLAG_BIAS_DISABLED
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_DIR_OUT,
                          flags=flags)
@@ -295,7 +295,7 @@ class LineInfo(MockupTestCase):
             self.assertTrue(line.is_requested())
             self.assertFalse(line.is_open_drain())
             self.assertFalse(line.is_open_source())
-            self.assertEqual(line.bias(), gpiod.Line.BIAS_DISABLE)
+            self.assertEqual(line.bias(), gpiod.Line.BIAS_DISABLED)
 
     def test_exported_bias_pull_down_line(self):
         with gpiod.Chip(mockup.chip_path(0)) as chip:
diff --git a/include/gpiod.h b/include/gpiod.h
index 1aaa6cd..919128f 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -286,7 +286,7 @@ enum {
 enum {
 	GPIOD_LINE_BIAS_UNKNOWN = 1,
 	/**< The internal bias state is unknown. */
-	GPIOD_LINE_BIAS_DISABLE,
+	GPIOD_LINE_BIAS_DISABLED,
 	/**< The internal bias is disabled. */
 	GPIOD_LINE_BIAS_PULL_UP,
 	/**< The internal pull-up bias is enabled. */
@@ -433,7 +433,7 @@ enum {
 	/**< The line is an open-source port. */
 	GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW	= GPIOD_BIT(2),
 	/**< The active state of the line is low (high is the default). */
-	GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE	= GPIOD_BIT(3),
+	GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED	= GPIOD_BIT(3),
 	/**< The line has neither either pull-up nor pull-down resistor. */
 	GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN	= GPIOD_BIT(4),
 	/**< The line has pull-down resistor enabled. */
diff --git a/lib/core.c b/lib/core.c
index 9ee84cf..55766ec 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -479,7 +479,7 @@ bool gpiod_line_is_active_low(struct gpiod_line *line)
 int gpiod_line_bias(struct gpiod_line *line)
 {
 	if (line->info_flags & GPIOLINE_FLAG_BIAS_DISABLE)
-		return GPIOD_LINE_BIAS_DISABLE;
+		return GPIOD_LINE_BIAS_DISABLED;
 	if (line->info_flags & GPIOLINE_FLAG_BIAS_PULL_UP)
 		return GPIOD_LINE_BIAS_PULL_UP;
 	if (line->info_flags & GPIOLINE_FLAG_BIAS_PULL_DOWN)
@@ -639,7 +639,7 @@ static void line_request_flag_to_gpio_v2_line_config(int flags,
 	else if (flags & GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE)
 		config->flags |= GPIO_V2_LINE_FLAG_OPEN_SOURCE;
 
-	if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE)
+	if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED)
 		config->flags |= GPIO_V2_LINE_FLAG_BIAS_DISABLED;
 	else if (flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN)
 		config->flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN;
@@ -671,7 +671,7 @@ static bool line_request_config_validate(
 		return false;
 	}
 
-	if (config->flags & GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE)
+	if (config->flags & GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED)
 		bias_flags++;
 	if (config->flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP)
 		bias_flags++;
diff --git a/tests/tests-event.c b/tests/tests-event.c
index aed2395..5fa4459 100644
--- a/tests/tests-event.c
+++ b/tests/tests-event.c
@@ -219,7 +219,7 @@ GPIOD_TEST_CASE(both_edges_bias_disable, 0, { 8 })
 	gpiod_test_return_if_failed();
 
 	ret = gpiod_line_request_both_edges_events_flags(line,
-		GPIOD_TEST_CONSUMER, GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE);
+		GPIOD_TEST_CONSUMER, GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
 
diff --git a/tests/tests-line.c b/tests/tests-line.c
index 88857a0..0f8e20e 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -421,9 +421,9 @@ GPIOD_TEST_CASE(set_flags_bias, 0, { 8 })
 	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_UNKNOWN);
 
 	ret = gpiod_line_set_flags(line,
-		GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE);
+		GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_DISABLE);
+	g_assert_cmpint(gpiod_line_bias(line), ==, GPIOD_LINE_BIAS_DISABLED);
 
 	ret = gpiod_line_set_flags(line,
 		GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP);
@@ -959,13 +959,13 @@ GPIOD_TEST_CASE(multiple_bias_flags, 0, { 8 })
 	gpiod_test_return_if_failed();
 
 	ret = gpiod_line_request_input_flags(line, GPIOD_TEST_CONSUMER,
-					GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE |
+					GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED |
 					GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN);
 	g_assert_cmpint(ret, ==, -1);
 	g_assert_cmpint(errno, ==, EINVAL);
 
 	ret = gpiod_line_request_input_flags(line, GPIOD_TEST_CONSUMER,
-					GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE |
+					GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED |
 					GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP);
 	g_assert_cmpint(ret, ==, -1);
 	g_assert_cmpint(errno, ==, EINVAL);
@@ -977,7 +977,7 @@ GPIOD_TEST_CASE(multiple_bias_flags, 0, { 8 })
 	g_assert_cmpint(errno, ==, EINVAL);
 
 	ret = gpiod_line_request_input_flags(line, GPIOD_TEST_CONSUMER,
-					GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE |
+					GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED |
 					GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN |
 					GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP);
 	g_assert_cmpint(ret, ==, -1);
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 8d228ab..845113a 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -34,7 +34,7 @@ static bool line_bias_is_pulldown(struct gpiod_line *line)
 
 static bool line_bias_is_disabled(struct gpiod_line *line)
 {
-	return gpiod_line_bias(line) == GPIOD_LINE_BIAS_DISABLE;
+	return gpiod_line_bias(line) == GPIOD_LINE_BIAS_DISABLED;
 }
 
 static const struct flag flags[] = {
diff --git a/tools/tools-common.c b/tools/tools-common.c
index bb6cde6..9d4612a 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -68,7 +68,7 @@ int bias_flags(const char *option)
 	if (strcmp(option, "pull-up") == 0)
 		return GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP;
 	if (strcmp(option, "disable") == 0)
-		return GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE;
+		return GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED;
 	if (strcmp(option, "as-is") != 0)
 		die("invalid bias: %s", option);
 	return 0;
-- 
2.29.1

