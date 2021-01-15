Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB182F76B5
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 11:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbhAOKbE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 05:31:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbhAOKbD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 05:31:03 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 518E7C0613D3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 02:30:23 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id w5so8709921wrm.11
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 02:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+cpl//NuFhs/uVUAxR4/Os00y3qJElTryn8l0QuTmJ8=;
        b=zpo60oTfc7qu9WdTQ7arfiaM9sVGescThKsI8PzPqiVMHGKEC1pWA7OQcpIjJurvCW
         XWPrUKDkDHzo0NPnJEInSrNukp/WBOeCTgS0rN6usjJQoKsqVowWXmWWZzd5S/+/PtYt
         EE7luh/Dj9bY3wTMh73PH0RjyAS799SDDgYcT/fNlAG4AeoL0bnhQ+p3CHryPhF+0DMm
         x6hpwGC3SorBKvjK/t40EIu1f/+jWEbXSkLEeTBP/LNuYXPCTRBE/B9ZrQay+nMHo19D
         c9NCdHt9LmirTkZERf0iE+/H0g71OZ0G9Uf6m7AjMxql6UcBPwUg8kbOPU9MeKW8Z7pS
         Q3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+cpl//NuFhs/uVUAxR4/Os00y3qJElTryn8l0QuTmJ8=;
        b=cwGzDyTx57hgFkkVRudcHW06N/yXKH00pgKyAWkPz3FAefwd0LB5L5+opDytVvtUDO
         3GE2rofFtKa19CSgKHtuf9zEWpjsFliF1625Rs+BARyEmpwcYuSZ3ubAzKerjyyG0ig6
         +ud22MwKSqy8WQ4j/nRi2UtEfiEioKWzE6x3vRNdcEan9n6GlXZHkcpCV55tFjaJ+uJi
         wpLWj5EHPzWbnFE93YsmhkLD47sykue8yPpmUtfu4qaVWM+pcKDypoaK9Qd/L7I/jOCX
         3bcDAYYEh/j6MWKJEYWZ0X/9GG4qJZzhOD9l1CbmubEckFqcnV6owDAmPKV2I/h9TBa7
         pcwQ==
X-Gm-Message-State: AOAM5302H1t1wKZCN/vpRFNkldM90s3nn2EB3lofkXS/2sW4+jQdJmyE
        JkVxikTXZdPPhh8CvCFwmzWNhKPbnt8yiQ==
X-Google-Smtp-Source: ABdhPJzG7YrC5flCIySjWVbrMqnGn+OsTFnkKf2basj7aBLAbaXIl48LvCcHTPlbCevMDI2tTVuomQ==
X-Received: by 2002:a5d:43ce:: with SMTP id v14mr12392344wrr.342.1610706621761;
        Fri, 15 Jan 2021 02:30:21 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id m14sm13815288wrh.94.2021.01.15.02.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 02:30:21 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH v2 1/7] treewide: remove helpers for opening chips by name & number
Date:   Fri, 15 Jan 2021 11:30:12 +0100
Message-Id: <20210115103018.27704-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210115103018.27704-1-brgl@bgdev.pl>
References: <20210115103018.27704-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Helper wrappers around gpiod_chip_open() shouldn't really be part of
the core, low-level library. They assume that devtmpfs is mounted at
/dev and that GPIO chips follow the gpiochipX naming convention.

This changeset removes all variants of gpiod_chip_open() other than
the one taking the path as argument. We're doing this treewide so
C++ and Python bindings lose the 'how' argument that currently allows
to change the way the chips are opened by the chip's constructors or
the open() method in C++.

The gpio-tools programs still support opening chips by number, name
and path but they implement this functionality locally rather than
using the library code.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/chip.cpp                  |  41 +-------
 bindings/cxx/gpiod.hpp                 |  25 +----
 bindings/cxx/tests/tests-chip.cpp      |  97 +++---------------
 bindings/cxx/tests/tests-event.cpp     |  14 +--
 bindings/cxx/tests/tests-iter.cpp      |   2 +-
 bindings/cxx/tests/tests-line.cpp      |  16 +--
 bindings/python/gpiodmodule.c          |  57 ++---------
 bindings/python/tests/gpiod_py_test.py | 133 +++++++++++--------------
 include/gpiod.h                        |  29 ------
 lib/helpers.c                          |  57 -----------
 tests/tests-chip.c                     |  41 --------
 tools/gpiodetect.c                     |   2 +-
 tools/gpiofind.c                       |   2 +-
 tools/gpioget.c                        |   2 +-
 tools/gpioinfo.c                       |   4 +-
 tools/gpiomon.c                        |   2 +-
 tools/gpioset.c                        |   2 +-
 tools/tools-common.c                   |  57 +++++++++++
 tools/tools-common.h                   |   3 +
 19 files changed, 167 insertions(+), 419 deletions(-)

diff --git a/bindings/cxx/chip.cpp b/bindings/cxx/chip.cpp
index 107088e..59351dd 100644
--- a/bindings/cxx/chip.cpp
+++ b/bindings/cxx/chip.cpp
@@ -15,35 +15,6 @@ namespace gpiod {
 
 namespace {
 
-::gpiod_chip* open_lookup(const ::std::string& device)
-{
-	return ::gpiod_chip_open_lookup(device.c_str());
-}
-
-::gpiod_chip* open_by_path(const ::std::string& device)
-{
-	return ::gpiod_chip_open(device.c_str());
-}
-
-::gpiod_chip* open_by_name(const ::std::string& device)
-{
-	return ::gpiod_chip_open_by_name(device.c_str());
-}
-
-::gpiod_chip* open_by_number(const ::std::string& device)
-{
-	return ::gpiod_chip_open_by_number(::std::stoul(device));
-}
-
-using open_func = ::std::function<::gpiod_chip* (const ::std::string&)>;
-
-const ::std::map<int, open_func> open_funcs = {
-	{ chip::OPEN_LOOKUP,	open_lookup,	},
-	{ chip::OPEN_BY_PATH,	open_by_path,	},
-	{ chip::OPEN_BY_NAME,	open_by_name,	},
-	{ chip::OPEN_BY_NUMBER,	open_by_number,	},
-};
-
 void chip_deleter(::gpiod_chip* chip)
 {
 	::gpiod_chip_close(chip);
@@ -56,10 +27,10 @@ bool is_gpiochip_device(const ::std::string& path)
 	return ::gpiod_is_gpiochip_device(path.c_str());
 }
 
-chip::chip(const ::std::string& device, int how)
+chip::chip(const ::std::string& path)
 	: _m_chip()
 {
-	this->open(device, how);
+	this->open(path);
 }
 
 chip::chip(::gpiod_chip* chip)
@@ -74,14 +45,12 @@ chip::chip(const ::std::weak_ptr<::gpiod_chip>& chip_ptr)
 
 }
 
-void chip::open(const ::std::string& device, int how)
+void chip::open(const ::std::string& path)
 {
-	auto func = open_funcs.at(how);
-
-	::gpiod_chip *chip = func(device);
+	::gpiod_chip *chip = ::gpiod_chip_open(path.c_str());
 	if (!chip)
 		throw ::std::system_error(errno, ::std::system_category(),
-					  "cannot open GPIO device " + device);
+					  "cannot open GPIO device " + path);
 
 	this->_m_chip.reset(chip, chip_deleter);
 }
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index d81ee30..6c9ccd6 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -58,10 +58,9 @@ public:
 
 	/**
 	 * @brief Constructor. Opens the chip using chip::open.
-	 * @param device String describing the GPIO chip.
-	 * @param how Indicates how the chip should be opened.
+	 * @param path Path to the GPIO chip device.
 	 */
-	GPIOD_API chip(const ::std::string& device, int how = OPEN_LOOKUP);
+	GPIOD_API chip(const ::std::string& path);
 
 	/**
 	 * @brief Copy constructor. References the object held by other.
@@ -96,13 +95,12 @@ public:
 
 	/**
 	 * @brief Open a GPIO chip.
-	 * @param device String describing the GPIO chip.
-	 * @param how Indicates how the chip should be opened.
+	 * @param path Path to the GPIO chip device.
 	 *
 	 * If the object already holds a reference to an open chip, it will be
 	 * closed and the reference reset.
 	 */
-	GPIOD_API void open(const ::std::string &device, int how = OPEN_LOOKUP);
+	GPIOD_API void open(const ::std::string &path);
 
 	/**
 	 * @brief Reset the internal smart pointer owned by this object.
@@ -184,21 +182,6 @@ public:
 	 */
 	GPIOD_API bool operator!(void) const noexcept;
 
-	/**
-	 * @brief Affect the way in which chip::chip and chip::open will try
-	 *        to open a GPIO chip character device.
-	 */
-	enum : int {
-		OPEN_LOOKUP = 1,
-		/**< Open based on the best guess what the supplied string is. */
-		OPEN_BY_PATH,
-		/**< Assume the string is a path to the GPIO chardev. */
-		OPEN_BY_NAME,
-		/**< Assume the string is the name of the chip */
-		OPEN_BY_NUMBER,
-		/**< Assume the string is the number of the GPIO chip. */
-	};
-
 private:
 
 	chip(::gpiod_chip* chip);
diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tests-chip.cpp
index 2492b42..1b16b65 100644
--- a/bindings/cxx/tests/tests-chip.cpp
+++ b/bindings/cxx/tests/tests-chip.cpp
@@ -32,72 +32,22 @@ TEST_CASE("GPIO chip device can be verified with is_gpiochip_device()", "[chip]"
 	}
 }
 
-TEST_CASE("GPIO chip device can be opened in different modes", "[chip]")
+TEST_CASE("GPIO chip device can be opened", "[chip]")
 {
 	mockup::probe_guard mockup_chips({ 8, 8, 8 });
 
-	SECTION("open by name")
-	{
-		REQUIRE_NOTHROW(::gpiod::chip(mockup::instance().chip_name(1),
-				::gpiod::chip::OPEN_BY_NAME));
-	}
-
-	SECTION("open by path")
-	{
-		REQUIRE_NOTHROW(::gpiod::chip(mockup::instance().chip_path(1),
-				::gpiod::chip::OPEN_BY_PATH));
-	}
-
-	SECTION("open by number")
-	{
-		REQUIRE_NOTHROW(::gpiod::chip(::std::to_string(mockup::instance().chip_num(1)),
-				::gpiod::chip::OPEN_BY_NUMBER));
-	}
-}
-
-TEST_CASE("GPIO chip device can be opened with implicit lookup", "[chip]")
-{
-	mockup::probe_guard mockup_chips({ 8, 8, 8 });
-
-	SECTION("lookup by name")
-	{
-		REQUIRE_NOTHROW(::gpiod::chip(mockup::instance().chip_name(1)));
-	}
-
-	SECTION("lookup by path")
+	SECTION("open from constructor")
 	{
 		REQUIRE_NOTHROW(::gpiod::chip(mockup::instance().chip_path(1)));
 	}
 
-	SECTION("lookup by number")
+	SECTION("open from open() method")
 	{
-		REQUIRE_NOTHROW(::gpiod::chip(::std::to_string(mockup::instance().chip_num(1))));
-	}
-}
-
-TEST_CASE("GPIO chip can be opened with the open() method in different modes", "[chip]")
-{
-	mockup::probe_guard mockup_chips({ 8, 8, 8 });
-	::gpiod::chip chip;
-
-	REQUIRE_FALSE(!!chip);
+		::gpiod::chip chip;
 
-	SECTION("open by name")
-	{
-		REQUIRE_NOTHROW(chip.open(mockup::instance().chip_name(1),
-					  ::gpiod::chip::OPEN_BY_NAME));
-	}
-
-	SECTION("open by path")
-	{
-		REQUIRE_NOTHROW(chip.open(mockup::instance().chip_path(1),
-					  ::gpiod::chip::OPEN_BY_PATH));
-	}
+		REQUIRE_FALSE(!!chip);
 
-	SECTION("open by number")
-	{
-		REQUIRE_NOTHROW(chip.open(::std::to_string(mockup::instance().chip_num(1)),
-					  ::gpiod::chip::OPEN_BY_NUMBER));
+		REQUIRE_NOTHROW(chip.open(mockup::instance().chip_path(1)));
 	}
 }
 
@@ -116,27 +66,6 @@ TEST_CASE("Uninitialized GPIO chip behaves correctly", "[chip]")
 	}
 }
 
-TEST_CASE("GPIO chip can be opened with the open() method with implicit lookup", "[chip]")
-{
-	mockup::probe_guard mockup_chips({ 8, 8, 8 });
-	::gpiod::chip chip;
-
-	SECTION("lookup by name")
-	{
-		REQUIRE_NOTHROW(chip.open(mockup::instance().chip_name(1)));
-	}
-
-	SECTION("lookup by path")
-	{
-		REQUIRE_NOTHROW(chip.open(mockup::instance().chip_path(1)));
-	}
-
-	SECTION("lookup by number")
-	{
-		REQUIRE_NOTHROW(chip.open(::std::to_string(mockup::instance().chip_num(1))));
-	}
-}
-
 TEST_CASE("Trying to open a nonexistent chip throws system_error", "[chip]")
 {
 	REQUIRE_THROWS_AS(::gpiod::chip("nonexistent-chip"), ::std::system_error);
@@ -146,7 +75,7 @@ TEST_CASE("Chip object can be reset", "[chip]")
 {
 	mockup::probe_guard mockup_chips({ 8 });
 
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 	REQUIRE(chip);
 	chip.reset();
 	REQUIRE_FALSE(!!chip);
@@ -156,7 +85,7 @@ TEST_CASE("Chip info can be correctly retrieved", "[chip]")
 {
 	mockup::probe_guard mockup_chips({ 8, 16, 8 });
 
-	::gpiod::chip chip(mockup::instance().chip_name(1));
+	::gpiod::chip chip(mockup::instance().chip_path(1));
 	REQUIRE(chip.name() == mockup::instance().chip_name(1));
 	REQUIRE(chip.label() == "gpio-mockup-B");
 	REQUIRE(chip.num_lines() == 16);
@@ -166,11 +95,11 @@ TEST_CASE("Chip object can be copied and compared", "[chip]")
 {
 	mockup::probe_guard mockup_chips({ 8, 8 });
 
-	::gpiod::chip chip1(mockup::instance().chip_name(0));
+	::gpiod::chip chip1(mockup::instance().chip_path(0));
 	auto chip2 = chip1;
 	REQUIRE(chip1 == chip2);
 	REQUIRE_FALSE(chip1 != chip2);
-	::gpiod::chip chip3(mockup::instance().chip_name(1));
+	::gpiod::chip chip3(mockup::instance().chip_path(1));
 	REQUIRE(chip1 != chip3);
 	REQUIRE_FALSE(chip2 == chip3);
 }
@@ -178,7 +107,7 @@ TEST_CASE("Chip object can be copied and compared", "[chip]")
 TEST_CASE("Lines can be retrieved from chip objects", "[chip]")
 {
 	mockup::probe_guard mockup_chips({ 8, 8, 8 }, mockup::FLAG_NAMED_LINES);
-	::gpiod::chip chip(mockup::instance().chip_name(1));
+	::gpiod::chip chip(mockup::instance().chip_path(1));
 
 	SECTION("get single line by offset")
 	{
@@ -216,7 +145,7 @@ TEST_CASE("Lines can be retrieved from chip objects", "[chip]")
 TEST_CASE("All lines can be retrieved from a chip at once", "[chip]")
 {
 	mockup::probe_guard mockup_chips({ 4 });
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 
 	auto lines = chip.get_all_lines();
 	REQUIRE(lines.size() == 4);
@@ -229,7 +158,7 @@ TEST_CASE("All lines can be retrieved from a chip at once", "[chip]")
 TEST_CASE("Errors occurring when retrieving lines are correctly reported", "[chip]")
 {
 	mockup::probe_guard mockup_chips({ 8 }, mockup::FLAG_NAMED_LINES);
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 
 	SECTION("invalid offset (single line)")
 	{
diff --git a/bindings/cxx/tests/tests-event.cpp b/bindings/cxx/tests/tests-event.cpp
index 6d1c069..97ea670 100644
--- a/bindings/cxx/tests/tests-event.cpp
+++ b/bindings/cxx/tests/tests-event.cpp
@@ -24,7 +24,7 @@ TEST_CASE("Line events can be detected", "[event][line]")
 {
 	mockup::probe_guard mockup_chips({ 8 });
 	mockup::event_thread events(0, 4, 200);
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 	auto line = chip.get_line(4);
 	::gpiod::line_request config;
 
@@ -105,7 +105,7 @@ TEST_CASE("Watching line_bulk objects for events works", "[event][bulk]")
 {
 	mockup::probe_guard mockup_chips({ 8 });
 	mockup::event_thread events(0, 2, 200);
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 	auto lines = chip.get_lines({ 0, 1, 2, 3 });
 	::gpiod::line_request config;
 
@@ -133,7 +133,7 @@ TEST_CASE("Watching line_bulk objects for events works", "[event][bulk]")
 TEST_CASE("It's possible to retrieve the event file descriptor", "[event][line]")
 {
 	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 	auto line = chip.get_line(4);
 	::gpiod::line_request config;
 
@@ -165,7 +165,7 @@ TEST_CASE("Event file descriptors can be used for polling", "[event]")
 {
 	mockup::probe_guard mockup_chips({ 8 });
 	mockup::event_thread events(0, 3, 200);
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 	auto lines = chip.get_lines({ 0, 1, 2, 3, 4, 5 });
 
 	::gpiod::line_request config;
@@ -196,7 +196,7 @@ TEST_CASE("Event file descriptors can be used for polling", "[event]")
 TEST_CASE("It's possible to read a value from a line requested for events", "[event][line]")
 {
 	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 	auto line = chip.get_line(4);
 	::gpiod::line_request config;
 
@@ -222,7 +222,7 @@ TEST_CASE("It's possible to read a value from a line requested for events", "[ev
 TEST_CASE("It's possible to read values from lines requested for events", "[event][bulk]")
 {
 	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 	auto lines = chip.get_lines({ 0, 1, 2, 3, 4 });
 	::gpiod::line_request config;
 
@@ -256,7 +256,7 @@ TEST_CASE("It's possible to read values from lines requested for events", "[even
 TEST_CASE("It's possible to read more than one line event", "[event][line]")
 {
 	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 	auto line = chip.get_line(4);
 	::gpiod::line_request config;
 
diff --git a/bindings/cxx/tests/tests-iter.cpp b/bindings/cxx/tests/tests-iter.cpp
index 708709c..0dee754 100644
--- a/bindings/cxx/tests/tests-iter.cpp
+++ b/bindings/cxx/tests/tests-iter.cpp
@@ -15,7 +15,7 @@ using ::gpiod::test::mockup;
 TEST_CASE("Line iterator works", "[iter][line]")
 {
 	mockup::probe_guard mockup_chips({ 4 });
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 	unsigned int count = 0;
 
 	for (auto& it: ::gpiod::line_iter(chip))
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index a5499ac..53b1d03 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -21,7 +21,7 @@ const ::std::string consumer = "line-test";
 TEST_CASE("Line information can be correctly retrieved", "[line]")
 {
 	mockup::probe_guard mockup_chips({ 8 }, mockup::FLAG_NAMED_LINES);
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 	auto line = chip.get_line(4);
 
 	SECTION("unexported line")
@@ -167,7 +167,7 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 TEST_CASE("Line bulk object works correctly", "[line][bulk]")
 {
 	mockup::probe_guard mockup_chips({ 8 }, mockup::FLAG_NAMED_LINES);
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 
 	SECTION("lines can be added, accessed and cleared")
 	{
@@ -210,7 +210,7 @@ TEST_CASE("Line bulk object works correctly", "[line][bulk]")
 TEST_CASE("Line values can be set and read", "[line]")
 {
 	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 	::gpiod::line_request config;
 
 	config.consumer = consumer.c_str();
@@ -308,7 +308,7 @@ TEST_CASE("Line values can be set and read", "[line]")
 TEST_CASE("Line can be reconfigured", "[line]")
 {
 	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 	::gpiod::line_request config;
 
 	config.consumer = consumer.c_str();
@@ -436,7 +436,7 @@ TEST_CASE("Line can be reconfigured", "[line]")
 TEST_CASE("Exported line can be released", "[line]")
 {
 	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 	auto line = chip.get_line(4);
 	::gpiod::line_request config;
 
@@ -487,7 +487,7 @@ TEST_CASE("Uninitialized GPIO line_bulk behaves correctly", "[line][bulk]")
 TEST_CASE("Cannot request the same line twice", "[line]")
 {
 	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 	::gpiod::line_request config;
 
 	config.consumer = consumer.c_str();
@@ -516,7 +516,7 @@ TEST_CASE("Cannot request the same line twice", "[line]")
 TEST_CASE("Cannot get/set values of unrequested lines", "[line]")
 {
 	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 	auto line = chip.get_line(3);
 
 	SECTION("get value")
@@ -533,7 +533,7 @@ TEST_CASE("Cannot get/set values of unrequested lines", "[line]")
 TEST_CASE("Line objects can be compared")
 {
 	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::chip chip(mockup::instance().chip_path(0));
 	auto line1 = chip.get_line(3);
 	auto line2 = chip.get_line(3);
 	auto line3 = chip.get_line(4);
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index af37df2..e8641f1 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -1952,44 +1952,19 @@ static gpiod_LineBulkObject *gpiod_LineToLineBulk(gpiod_LineObject *line)
 	return ret;
 }
 
-enum {
-	gpiod_OPEN_LOOKUP = 1,
-	gpiod_OPEN_BY_NAME,
-	gpiod_OPEN_BY_PATH,
-	gpiod_OPEN_BY_NUMBER,
-};
-
 static int gpiod_Chip_init(gpiod_ChipObject *self,
 			   PyObject *args, PyObject *Py_UNUSED(ignored))
 {
-	int rv, how = gpiod_OPEN_LOOKUP;
-	PyThreadState *thread;
-	char *descr;
+	char *path;
+	int rv;
 
-	rv = PyArg_ParseTuple(args, "s|i", &descr, &how);
+	rv = PyArg_ParseTuple(args, "s", &path);
 	if (!rv)
 		return -1;
 
-	thread = PyEval_SaveThread();
-	switch (how) {
-	case gpiod_OPEN_LOOKUP:
-		self->chip = gpiod_chip_open_lookup(descr);
-		break;
-	case gpiod_OPEN_BY_NAME:
-		self->chip = gpiod_chip_open_by_name(descr);
-		break;
-	case gpiod_OPEN_BY_PATH:
-		self->chip = gpiod_chip_open(descr);
-		break;
-	case gpiod_OPEN_BY_NUMBER:
-		self->chip = gpiod_chip_open_by_number(atoi(descr));
-		break;
-	default:
-		PyEval_RestoreThread(thread);
-		PyErr_BadArgument();
-		return -1;
-	}
-	PyEval_RestoreThread(thread);
+	Py_BEGIN_ALLOW_THREADS;
+	self->chip = gpiod_chip_open(path);
+	Py_END_ALLOW_THREADS;
 	if (!self->chip) {
 		PyErr_SetFromErrno(PyExc_OSError);
 		return -1;
@@ -2553,26 +2528,6 @@ typedef struct {
 } gpiod_ConstDescr;
 
 static gpiod_ConstDescr gpiod_ConstList[] = {
-	{
-		.typeobj = &gpiod_ChipType,
-		.name = "OPEN_LOOKUP",
-		.val = gpiod_OPEN_LOOKUP,
-	},
-	{
-		.typeobj = &gpiod_ChipType,
-		.name = "OPEN_BY_PATH",
-		.val = gpiod_OPEN_BY_PATH,
-	},
-	{
-		.typeobj = &gpiod_ChipType,
-		.name = "OPEN_BY_NAME",
-		.val = gpiod_OPEN_BY_NAME,
-	},
-	{
-		.typeobj = &gpiod_ChipType,
-		.name = "OPEN_BY_NUMBER",
-		.val = gpiod_OPEN_BY_NUMBER,
-	},
 	{
 		.typeobj = &gpiod_LineType,
 		.name = "DIRECTION_INPUT",
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index f116657..79294bc 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -96,31 +96,10 @@ class ChipOpen(MockupTestCase):
 
     chip_sizes = ( 8, 8, 8 )
 
-    def test_open_chip_by_name(self):
-        with gpiod.Chip(mockup.chip_name(1), gpiod.Chip.OPEN_BY_NAME) as chip:
-            self.assertEqual(chip.name(), mockup.chip_name(1))
-
-    def test_open_chip_by_path(self):
-        with gpiod.Chip(mockup.chip_path(1), gpiod.Chip.OPEN_BY_PATH) as chip:
-            self.assertEqual(chip.name(), mockup.chip_name(1))
-
-    def test_open_chip_by_num(self):
-        with gpiod.Chip('{}'.format(mockup.chip_num(1)),
-                        gpiod.Chip.OPEN_BY_NUMBER) as chip:
-            self.assertEqual(chip.name(), mockup.chip_name(1))
-
-    def test_lookup_chip_by_name(self):
-        with gpiod.Chip(mockup.chip_name(1)) as chip:
-            self.assertEqual(chip.name(), mockup.chip_name(1))
-
-    def test_lookup_chip_by_path(self):
+    def test_open_good(self):
         with gpiod.Chip(mockup.chip_path(1)) as chip:
             self.assertEqual(chip.name(), mockup.chip_name(1))
 
-    def test_lookup_chip_by_num(self):
-        with gpiod.Chip('{}'.format(mockup.chip_num(1))) as chip:
-            self.assertEqual(chip.name(), mockup.chip_name(1))
-
     def test_nonexistent_chip(self):
         with self.assertRaises(FileNotFoundError):
             chip = gpiod.Chip('nonexistent-chip')
@@ -134,7 +113,7 @@ class ChipClose(MockupTestCase):
     chip_sizes = ( 8, )
 
     def test_use_chip_after_close(self):
-        chip = gpiod.Chip(mockup.chip_name(0))
+        chip = gpiod.Chip(mockup.chip_path(0))
         self.assertEqual(chip.name(), mockup.chip_name(0))
         chip.close()
         with self.assertRaises(ValueError):
@@ -145,7 +124,7 @@ class ChipInfo(MockupTestCase):
     chip_sizes = ( 16, )
 
     def test_chip_get_info(self):
-        chip = gpiod.Chip(mockup.chip_name(0))
+        chip = gpiod.Chip(mockup.chip_path(0))
         self.assertEqual(chip.name(), mockup.chip_name(0))
         self.assertEqual(chip.label(), 'gpio-mockup-A')
         self.assertEqual(chip.num_lines(), 16)
@@ -156,29 +135,29 @@ class ChipGetLines(MockupTestCase):
     flags = gpiomockup.Mockup.FLAG_NAMED_LINES
 
     def test_get_single_line_by_offset(self):
-        with gpiod.Chip(mockup.chip_name(1)) as chip:
+        with gpiod.Chip(mockup.chip_path(1)) as chip:
             line = chip.get_line(4)
             self.assertEqual(line.name(), 'gpio-mockup-B-4')
 
     def test_find_single_line_by_name(self):
-        with gpiod.Chip(mockup.chip_name(1)) as chip:
+        with gpiod.Chip(mockup.chip_path(1)) as chip:
             lines = chip.find_line('gpio-mockup-B-4', unique=True).to_list()
             self.assertEqual(lines[0].offset(), 4)
 
     def test_get_single_line_invalid_offset(self):
-        with gpiod.Chip(mockup.chip_name(1)) as chip:
+        with gpiod.Chip(mockup.chip_path(1)) as chip:
             with self.assertRaises(OSError) as err_ctx:
                 line = chip.get_line(11)
 
             self.assertEqual(err_ctx.exception.errno, errno.EINVAL)
 
     def test_find_single_line_nonexistent(self):
-        with gpiod.Chip(mockup.chip_name(1)) as chip:
+        with gpiod.Chip(mockup.chip_path(1)) as chip:
             lines = chip.find_line('nonexistent-line', unique=True)
             self.assertEqual(lines, None)
 
     def test_get_multiple_lines_by_offsets_in_tuple(self):
-        with gpiod.Chip(mockup.chip_name(1)) as chip:
+        with gpiod.Chip(mockup.chip_path(1)) as chip:
             lines = chip.get_lines(( 1, 3, 6, 7 )).to_list()
             self.assertEqual(len(lines), 4)
             self.assertEqual(lines[0].name(), 'gpio-mockup-B-1')
@@ -187,7 +166,7 @@ class ChipGetLines(MockupTestCase):
             self.assertEqual(lines[3].name(), 'gpio-mockup-B-7')
 
     def test_get_multiple_lines_by_offsets_in_list(self):
-        with gpiod.Chip(mockup.chip_name(1)) as chip:
+        with gpiod.Chip(mockup.chip_path(1)) as chip:
             lines = chip.get_lines([ 1, 3, 6, 7 ]).to_list()
             self.assertEqual(len(lines), 4)
             self.assertEqual(lines[0].name(), 'gpio-mockup-B-1')
@@ -196,14 +175,14 @@ class ChipGetLines(MockupTestCase):
             self.assertEqual(lines[3].name(), 'gpio-mockup-B-7')
 
     def test_get_multiple_lines_invalid_offset(self):
-        with gpiod.Chip(mockup.chip_name(1)) as chip:
+        with gpiod.Chip(mockup.chip_path(1)) as chip:
             with self.assertRaises(OSError) as err_ctx:
                 line = chip.get_lines(( 1, 3, 11, 7 ))
 
             self.assertEqual(err_ctx.exception.errno, errno.EINVAL)
 
     def test_get_all_lines(self):
-        with gpiod.Chip(mockup.chip_name(2)) as chip:
+        with gpiod.Chip(mockup.chip_path(2)) as chip:
             lines = chip.get_all_lines().to_list()
             self.assertEqual(len(lines), 4)
             self.assertEqual(lines[0].name(), 'gpio-mockup-C-0')
@@ -221,7 +200,7 @@ class LineInfo(MockupTestCase):
     flags = gpiomockup.Mockup.FLAG_NAMED_LINES
 
     def test_unexported_line(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(4)
             self.assertEqual(line.offset(), 4)
             self.assertEqual(line.name(), 'gpio-mockup-A-4')
@@ -232,7 +211,7 @@ class LineInfo(MockupTestCase):
             self.assertFalse(line.is_requested())
 
     def test_exported_line(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(4)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_DIR_OUT,
@@ -246,7 +225,7 @@ class LineInfo(MockupTestCase):
             self.assertTrue(line.is_requested())
 
     def test_exported_line_with_flags(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(4)
             flags = (gpiod.LINE_REQ_FLAG_ACTIVE_LOW |
                      gpiod.LINE_REQ_FLAG_OPEN_DRAIN)
@@ -265,7 +244,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.bias(), gpiod.Line.BIAS_AS_IS)
 
     def test_exported_open_drain_line(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(4)
             flags = gpiod.LINE_REQ_FLAG_OPEN_DRAIN
             line.request(consumer=default_consumer,
@@ -283,7 +262,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.bias(), gpiod.Line.BIAS_AS_IS)
 
     def test_exported_open_source_line(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(4)
             flags = gpiod.LINE_REQ_FLAG_OPEN_SOURCE
             line.request(consumer=default_consumer,
@@ -301,7 +280,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.bias(), gpiod.Line.BIAS_AS_IS)
 
     def test_exported_bias_disable_line(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(4)
             flags = gpiod.LINE_REQ_FLAG_BIAS_DISABLE
             line.request(consumer=default_consumer,
@@ -319,7 +298,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.bias(), gpiod.Line.BIAS_DISABLE)
 
     def test_exported_bias_pull_down_line(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(4)
             flags = gpiod.LINE_REQ_FLAG_BIAS_PULL_DOWN
             line.request(consumer=default_consumer,
@@ -337,7 +316,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.bias(), gpiod.Line.BIAS_PULL_DOWN)
 
     def test_exported_bias_pull_up_line(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(4)
             flags = gpiod.LINE_REQ_FLAG_BIAS_PULL_UP
             line.request(consumer=default_consumer,
@@ -355,7 +334,7 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.bias(), gpiod.Line.BIAS_PULL_UP)
 
     def test_update_line_info(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             line.update()
 
@@ -364,7 +343,7 @@ class LineValues(MockupTestCase):
     chip_sizes = ( 8, )
 
     def test_get_value_single_line(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_DIR_IN)
@@ -373,7 +352,7 @@ class LineValues(MockupTestCase):
             self.assertEqual(line.get_value(), 1)
 
     def test_set_value_single_line(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_DIR_OUT)
@@ -383,7 +362,7 @@ class LineValues(MockupTestCase):
             self.assertEqual(mockup.chip_get_value(0, 3), 0)
 
     def test_set_value_with_default_value_argument(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_DIR_OUT,
@@ -391,7 +370,7 @@ class LineValues(MockupTestCase):
             self.assertEqual(mockup.chip_get_value(0, 3), 1)
 
     def test_get_value_multiple_lines(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             lines = chip.get_lines(( 0, 3, 4, 6 ))
             lines.request(consumer=default_consumer,
                           type=gpiod.LINE_REQ_DIR_IN)
@@ -402,7 +381,7 @@ class LineValues(MockupTestCase):
             self.assertEqual(lines.get_values(), [ 1, 0, 1, 1 ])
 
     def test_set_value_multiple_lines(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             lines = chip.get_lines(( 0, 3, 4, 6 ))
             lines.request(consumer=default_consumer,
                           type=gpiod.LINE_REQ_DIR_OUT)
@@ -418,7 +397,7 @@ class LineValues(MockupTestCase):
             self.assertEqual(mockup.chip_get_value(0, 6), 0)
 
     def test_set_multiple_values_with_default_vals_argument(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             lines = chip.get_lines(( 0, 3, 4, 6 ))
             lines.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_DIR_OUT,
@@ -429,7 +408,7 @@ class LineValues(MockupTestCase):
             self.assertEqual(mockup.chip_get_value(0, 6), 1)
 
     def test_get_value_active_low(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_DIR_IN,
@@ -439,7 +418,7 @@ class LineValues(MockupTestCase):
             self.assertEqual(line.get_value(), 0)
 
     def test_set_value_active_low(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_DIR_OUT,
@@ -454,7 +433,7 @@ class LineConfig(MockupTestCase):
     chip_sizes = ( 8, )
 
     def test_set_config_direction(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_DIR_IN)
@@ -465,7 +444,7 @@ class LineConfig(MockupTestCase):
             self.assertEqual(line.direction(), gpiod.Line.DIRECTION_OUTPUT)
 
     def test_set_config_flags(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_DIR_OUT)
@@ -476,7 +455,7 @@ class LineConfig(MockupTestCase):
             self.assertEqual(mockup.chip_get_value(0, 3), 0)
 
     def test_set_config_output_value(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_DIR_IN)
@@ -486,7 +465,7 @@ class LineConfig(MockupTestCase):
             self.assertEqual(mockup.chip_get_value(0, 3), 0)
 
     def test_set_config_output_no_value(self):
-         with gpiod.Chip(mockup.chip_name(0)) as chip:
+         with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_DIR_OUT,
@@ -496,7 +475,7 @@ class LineConfig(MockupTestCase):
             self.assertEqual(mockup.chip_get_value(0, 3), 0)
 
     def test_set_config_bulk_output_no_values(self):
-         with gpiod.Chip(mockup.chip_name(0)) as chip:
+         with gpiod.Chip(mockup.chip_path(0)) as chip:
             lines = chip.get_lines(( 0, 3, 4, 6 ))
             lines.request(consumer=default_consumer,
                           type=gpiod.LINE_REQ_DIR_OUT,
@@ -516,7 +495,7 @@ class LineFlags(MockupTestCase):
     chip_sizes = ( 8, )
 
     def test_set_flags(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_DIR_OUT,
@@ -528,7 +507,7 @@ class LineFlags(MockupTestCase):
             self.assertEqual(mockup.chip_get_value(0, 3), 1)
 
     def test_set_flags_bulk(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             lines = chip.get_lines(( 0, 3, 4, 6 ))
             lines.request(consumer=default_consumer,
                           type=gpiod.LINE_REQ_DIR_OUT,
@@ -553,7 +532,7 @@ class LineDirection(MockupTestCase):
     chip_sizes = ( 8, )
 
     def test_set_direction(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_DIR_OUT)
@@ -571,7 +550,7 @@ class LineDirection(MockupTestCase):
             self.assertEqual(mockup.chip_get_value(0, 3), 0)
 
     def test_set_direction_bulk(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             lines = chip.get_lines(( 0, 3, 4, 6 ))
             lines.request(consumer=default_consumer,
                           type=gpiod.LINE_REQ_DIR_OUT)
@@ -637,7 +616,7 @@ class LineRequestBehavior(MockupTestCase):
     chip_sizes = ( 8, )
 
     def test_line_export_release(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_DIR_IN)
@@ -647,7 +626,7 @@ class LineRequestBehavior(MockupTestCase):
             self.assertFalse(line.is_requested())
 
     def test_line_request_twice_two_calls(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_DIR_IN)
@@ -658,7 +637,7 @@ class LineRequestBehavior(MockupTestCase):
             self.assertEqual(err_ctx.exception.errno, errno.EBUSY)
 
     def test_line_request_twice_in_bulk(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             lines = chip.get_lines(( 2, 3, 6, 6 ))
             with self.assertRaises(OSError) as err_ctx:
                 lines.request(consumer=default_consumer,
@@ -667,7 +646,7 @@ class LineRequestBehavior(MockupTestCase):
             self.assertEqual(err_ctx.exception.errno, errno.EBUSY)
 
     def test_use_value_unrequested(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             with self.assertRaises(OSError) as err_ctx:
                 line.get_value()
@@ -675,7 +654,7 @@ class LineRequestBehavior(MockupTestCase):
             self.assertEqual(err_ctx.exception.errno, errno.EPERM)
 
     def test_request_with_no_kwds(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(2)
             line.request(default_consumer)
             self.assertTrue(line.is_requested())
@@ -692,7 +671,7 @@ class LineIterator(MockupTestCase):
     chip_sizes = ( 4, )
 
     def test_iterate_over_lines(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             count = 0
 
             for line in gpiod.LineIter(chip):
@@ -706,7 +685,7 @@ class LineBulkIter(MockupTestCase):
     chip_sizes = ( 4, )
 
     def test_line_bulk_iterator(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             lines = chip.get_all_lines()
             count = 0
 
@@ -726,7 +705,7 @@ class EventSingleLine(MockupTestCase):
 
     def test_single_line_rising_edge_event(self):
         with EventThread(0, 4, 200):
-            with gpiod.Chip(mockup.chip_name(0)) as chip:
+            with gpiod.Chip(mockup.chip_path(0)) as chip:
                 line = chip.get_line(4)
                 line.request(consumer=default_consumer,
                              type=gpiod.LINE_REQ_EV_RISING_EDGE)
@@ -737,7 +716,7 @@ class EventSingleLine(MockupTestCase):
 
     def test_single_line_falling_edge_event(self):
         with EventThread(0, 4, 200):
-            with gpiod.Chip(mockup.chip_name(0)) as chip:
+            with gpiod.Chip(mockup.chip_path(0)) as chip:
                 line = chip.get_line(4)
                 line.request(consumer=default_consumer,
                              type=gpiod.LINE_REQ_EV_FALLING_EDGE)
@@ -748,7 +727,7 @@ class EventSingleLine(MockupTestCase):
 
     def test_single_line_both_edges_events(self):
         with EventThread(0, 4, 200):
-            with gpiod.Chip(mockup.chip_name(0)) as chip:
+            with gpiod.Chip(mockup.chip_path(0)) as chip:
                 line = chip.get_line(4)
                 line.request(consumer=default_consumer,
                              type=gpiod.LINE_REQ_EV_BOTH_EDGES)
@@ -763,7 +742,7 @@ class EventSingleLine(MockupTestCase):
 
     def test_single_line_both_edges_events_active_low(self):
         with EventThread(0, 4, 200):
-            with gpiod.Chip(mockup.chip_name(0)) as chip:
+            with gpiod.Chip(mockup.chip_path(0)) as chip:
                 line = chip.get_line(4)
                 line.request(consumer=default_consumer,
                              type=gpiod.LINE_REQ_EV_BOTH_EDGES,
@@ -778,7 +757,7 @@ class EventSingleLine(MockupTestCase):
                 self.assertEqual(event.source.offset(), 4)
 
     def test_single_line_read_multiple_events(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(4)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_EV_BOTH_EDGES)
@@ -804,7 +783,7 @@ class EventBulk(MockupTestCase):
 
     def test_watch_multiple_lines_for_events(self):
         with EventThread(0, 2, 200):
-            with gpiod.Chip(mockup.chip_name(0)) as chip:
+            with gpiod.Chip(mockup.chip_path(0)) as chip:
                 lines = chip.get_lines(( 0, 1, 2, 3, 4 ))
                 lines.request(consumer=default_consumer,
                               type=gpiod.LINE_REQ_EV_BOTH_EDGES)
@@ -826,7 +805,7 @@ class EventValues(MockupTestCase):
     chip_sizes = ( 8, )
 
     def test_request_for_events_get_value(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_EV_BOTH_EDGES)
@@ -835,7 +814,7 @@ class EventValues(MockupTestCase):
             self.assertEqual(line.get_value(), 1)
 
     def test_request_for_events_get_value_active_low(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_EV_BOTH_EDGES,
@@ -849,7 +828,7 @@ class EventFileDescriptor(MockupTestCase):
     chip_sizes = ( 8, )
 
     def test_event_get_fd(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_EV_BOTH_EDGES)
@@ -857,7 +836,7 @@ class EventFileDescriptor(MockupTestCase):
             self.assertGreaterEqual(fd, 0)
 
     def test_event_get_fd_not_requested(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             with self.assertRaises(OSError) as err_ctx:
                 fd = line.event_get_fd();
@@ -865,7 +844,7 @@ class EventFileDescriptor(MockupTestCase):
             self.assertEqual(err_ctx.exception.errno, errno.EPERM)
 
     def test_event_get_fd_requested_for_values(self):
-        with gpiod.Chip(mockup.chip_name(0)) as chip:
+        with gpiod.Chip(mockup.chip_path(0)) as chip:
             line = chip.get_line(3)
             line.request(consumer=default_consumer,
                          type=gpiod.LINE_REQ_DIR_IN)
@@ -876,7 +855,7 @@ class EventFileDescriptor(MockupTestCase):
 
     def test_event_fd_polling(self):
         with EventThread(0, 2, 200):
-            with gpiod.Chip(mockup.chip_name(0)) as chip:
+            with gpiod.Chip(mockup.chip_path(0)) as chip:
                 lines = chip.get_lines(( 0, 1, 2, 3, 4, 5, 6 ))
                 lines.request(consumer=default_consumer,
                               type=gpiod.LINE_REQ_EV_BOTH_EDGES)
diff --git a/include/gpiod.h b/include/gpiod.h
index b82d507..b073b3b 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -84,35 +84,6 @@ bool gpiod_is_gpiochip_device(const char *path) GPIOD_API;
  */
 struct gpiod_chip *gpiod_chip_open(const char *path) GPIOD_API;
 
-/**
- * @brief Open a gpiochip by name.
- * @param name Name of the gpiochip to open.
- * @return GPIO chip handle or NULL if an error occurred.
- *
- * This routine appends name to '/dev/' to create the path.
- */
-struct gpiod_chip *gpiod_chip_open_by_name(const char *name) GPIOD_API;
-
-/**
- * @brief Open a gpiochip by number.
- * @param num Number of the gpiochip.
- * @return GPIO chip handle or NULL if an error occurred.
- *
- * This routine appends num to '/dev/gpiochip' to create the path.
- */
-struct gpiod_chip *gpiod_chip_open_by_number(unsigned int num) GPIOD_API;
-
-/**
- * @brief Open a gpiochip based on the best guess what the path is.
- * @param descr String describing the gpiochip.
- * @return GPIO chip handle or NULL if an error occurred.
- *
- * This routine tries to figure out whether the user passed it the path to the
- * GPIO chip, its name or number as a string. Then it tries to open it using
- * one of the gpiod_chip_open** variants.
- */
-struct gpiod_chip *gpiod_chip_open_lookup(const char *descr) GPIOD_API;
-
 /**
  * @brief Close a GPIO chip handle and release all allocated resources.
  * @param chip The GPIO chip object.
diff --git a/lib/helpers.c b/lib/helpers.c
index ec2575d..ac6325d 100644
--- a/lib/helpers.c
+++ b/lib/helpers.c
@@ -10,68 +10,11 @@
  * access to neither the internal library data structures nor the kernel UAPI.
  */
 
-#include <ctype.h>
 #include <errno.h>
 #include <gpiod.h>
 #include <stdio.h>
 #include <string.h>
 
-static bool isuint(const char *str)
-{
-	for (; *str && isdigit(*str); str++)
-		;
-
-	return *str == '\0';
-}
-
-struct gpiod_chip *gpiod_chip_open_by_name(const char *name)
-{
-	struct gpiod_chip *chip;
-	char *path;
-	int rv;
-
-	rv = asprintf(&path, "/dev/%s", name);
-	if (rv < 0)
-		return NULL;
-
-	chip = gpiod_chip_open(path);
-	free(path);
-
-	return chip;
-}
-
-struct gpiod_chip *gpiod_chip_open_by_number(unsigned int num)
-{
-	struct gpiod_chip *chip;
-	char *path;
-	int rv;
-
-	rv = asprintf(&path, "/dev/gpiochip%u", num);
-	if (!rv)
-		return NULL;
-
-	chip = gpiod_chip_open(path);
-	free(path);
-
-	return chip;
-}
-
-struct gpiod_chip *gpiod_chip_open_lookup(const char *descr)
-{
-	struct gpiod_chip *chip;
-
-	if (isuint(descr)) {
-		chip = gpiod_chip_open_by_number(strtoul(descr, NULL, 10));
-	} else {
-		if (strncmp(descr, "/dev/", 5))
-			chip = gpiod_chip_open_by_name(descr);
-		else
-			chip = gpiod_chip_open(descr);
-	}
-
-	return chip;
-}
-
 struct gpiod_line_bulk *
 gpiod_chip_get_lines(struct gpiod_chip *chip,
 		     unsigned int *offsets, unsigned int num_offsets)
diff --git a/tests/tests-chip.c b/tests/tests-chip.c
index 1c365b9..c18bd5d 100644
--- a/tests/tests-chip.c
+++ b/tests/tests-chip.c
@@ -52,47 +52,6 @@ GPIOD_TEST_CASE(open_notty, 0, { 8 })
 	g_assert_cmpint(errno, ==, ENOTTY);
 }
 
-GPIOD_TEST_CASE(open_by_name_good, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-
-	chip = gpiod_chip_open_by_name(gpiod_test_chip_name(0));
-	g_assert_nonnull(chip);
-}
-
-GPIOD_TEST_CASE(open_by_number_good, 0, { 8 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-
-	chip = gpiod_chip_open_by_number(gpiod_test_chip_num(0));
-	g_assert_nonnull(chip);
-}
-
-GPIOD_TEST_CASE(open_lookup_good, 0, { 8, 8, 8})
-{
-	g_autoptr(gpiod_chip_struct) chip_by_name = NULL;
-	g_autoptr(gpiod_chip_struct) chip_by_path = NULL;
-	g_autoptr(gpiod_chip_struct) chip_by_num = NULL;
-	g_autofree gchar *chip_num_str = g_strdup_printf(
-						"%u", gpiod_test_chip_num(1));
-
-	chip_by_name = gpiod_chip_open_lookup(gpiod_test_chip_name(1));
-	chip_by_path = gpiod_chip_open_lookup(gpiod_test_chip_path(1));
-	chip_by_num = gpiod_chip_open_lookup(chip_num_str);
-
-	g_assert_nonnull(chip_by_name);
-	g_assert_nonnull(chip_by_path);
-	g_assert_nonnull(chip_by_num);
-	gpiod_test_return_if_failed();
-
-	g_assert_cmpstr(gpiod_chip_name(chip_by_name),
-			==, gpiod_test_chip_name(1));
-	g_assert_cmpstr(gpiod_chip_name(chip_by_path),
-			==, gpiod_test_chip_name(1));
-	g_assert_cmpstr(gpiod_chip_name(chip_by_num),
-			==, gpiod_test_chip_name(1));
-}
-
 GPIOD_TEST_CASE(get_name, 0, { 8, 8, 8})
 {
 	g_autoptr(gpiod_chip_struct) chip0 = NULL;
diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
index 8e067f7..6f94f91 100644
--- a/tools/gpiodetect.c
+++ b/tools/gpiodetect.c
@@ -69,7 +69,7 @@ int main(int argc, char **argv)
 		die_perror("unable to scan /dev");
 
 	for (i = 0; i < num_chips; i++) {
-		chip = gpiod_chip_open_by_name(entries[i]->d_name);
+		chip = chip_open_by_name(entries[i]->d_name);
 		if (!chip) {
 			if (errno == EACCES)
 				printf("%s Permission denied\n",
diff --git a/tools/gpiofind.c b/tools/gpiofind.c
index 4acf621..3760ada 100644
--- a/tools/gpiofind.c
+++ b/tools/gpiofind.c
@@ -70,7 +70,7 @@ int main(int argc, char **argv)
 		die_perror("unable to scan /dev");
 
 	for (i = 0; i < num_chips; i++) {
-		chip = gpiod_chip_open_by_name(entries[i]->d_name);
+		chip = chip_open_by_name(entries[i]->d_name);
 		if (!chip) {
 			if (errno == EACCES)
 				continue;
diff --git a/tools/gpioget.c b/tools/gpioget.c
index 11a9c9f..efbacce 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -97,7 +97,7 @@ int main(int argc, char **argv)
 			die("invalid GPIO offset: %s", argv[i + 1]);
 	}
 
-	chip = gpiod_chip_open_lookup(device);
+	chip = chip_open_lookup(device);
 	if (!chip)
 		die_perror("unable to open %s", device);
 
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index e3dbde7..057a19f 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -214,7 +214,7 @@ int main(int argc, char **argv)
 			die_perror("unable to scan /dev");
 
 		for (i = 0; i < num_chips; i++) {
-			chip = gpiod_chip_open_by_name(entries[i]->d_name);
+			chip = chip_open_by_name(entries[i]->d_name);
 			if (!chip) {
 				if (errno == EACCES)
 					printf("%s Permission denied\n",
@@ -230,7 +230,7 @@ int main(int argc, char **argv)
 		}
 	} else {
 		for (i = 0; i < argc; i++) {
-			chip = gpiod_chip_open_lookup(argv[i]);
+			chip = chip_open_lookup(argv[i]);
 			if (!chip)
 				die_perror("looking up chip %s", argv[i]);
 
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index c271913..3586cb4 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -253,7 +253,7 @@ int main(int argc, char **argv)
 		num_lines++;
 	}
 
-	chip = gpiod_chip_open_lookup(argv[0]);
+	chip = chip_open_lookup(argv[0]);
 	if (!chip)
 		die_perror("unable to open %s", argv[0]);
 
diff --git a/tools/gpioset.c b/tools/gpioset.c
index 7f4615a..20a7d3b 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -288,7 +288,7 @@ int main(int argc, char **argv)
 			die("invalid offset: %s", argv[i + 1]);
 	}
 
-	chip = gpiod_chip_open_lookup(device);
+	chip = chip_open_lookup(device);
 	if (!chip)
 		die_perror("unable to open %s", device);
 
diff --git a/tools/tools-common.c b/tools/tools-common.c
index b64ef93..bb6cde6 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -7,6 +7,7 @@
 
 /* Common code for GPIO tools. */
 
+#include <ctype.h>
 #include <errno.h>
 #include <gpiod.h>
 #include <libgen.h>
@@ -116,3 +117,59 @@ int chip_dir_filter(const struct dirent *entry)
 	free(path);
 	return !!is_chip;
 }
+
+struct gpiod_chip *chip_open_by_name(const char *name)
+{
+	struct gpiod_chip *chip;
+	char *path;
+	int ret;
+
+	ret = asprintf(&path, "/dev/%s", name);
+	if (ret < 0)
+		return NULL;
+
+	chip = gpiod_chip_open(path);
+	free(path);
+
+	return chip;
+}
+
+static struct gpiod_chip *chip_open_by_number(unsigned int num)
+{
+	struct gpiod_chip *chip;
+	char *path;
+	int ret;
+
+	ret = asprintf(&path, "/dev/gpiochip%u", num);
+	if (!ret)
+		return NULL;
+
+	chip = gpiod_chip_open(path);
+	free(path);
+
+	return chip;
+}
+
+static bool isuint(const char *str)
+{
+	for (; *str && isdigit(*str); str++)
+		;
+
+	return *str == '\0';
+}
+
+struct gpiod_chip *chip_open_lookup(const char *device)
+{
+	struct gpiod_chip *chip;
+
+	if (isuint(device)) {
+		chip = chip_open_by_number(strtoul(device, NULL, 10));
+	} else {
+		if (strncmp(device, "/dev/", 5))
+			chip = chip_open_by_name(device);
+		else
+			chip = gpiod_chip_open(device);
+	}
+
+	return chip;
+}
diff --git a/tools/tools-common.h b/tools/tools-common.h
index 4148dd8..866f809 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -9,6 +9,7 @@
 #define __GPIOD_TOOLS_COMMON_H__
 
 #include <dirent.h>
+#include <gpiod.h>
 
 /*
  * Various helpers for the GPIO tools.
@@ -32,5 +33,7 @@ int bias_flags(const char *option);
 void print_bias_help(void);
 int make_signalfd(void);
 int chip_dir_filter(const struct dirent *entry);
+struct gpiod_chip *chip_open_by_name(const char *name);
+struct gpiod_chip *chip_open_lookup(const char *device);
 
 #endif /* __GPIOD_TOOLS_COMMON_H__ */
-- 
2.29.1

