Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0DE646BC4
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Dec 2022 10:22:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiLHJWc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Dec 2022 04:22:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbiLHJW2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Dec 2022 04:22:28 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BBCF3A6
        for <linux-gpio@vger.kernel.org>; Thu,  8 Dec 2022 01:22:25 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id h12so865036wrv.10
        for <linux-gpio@vger.kernel.org>; Thu, 08 Dec 2022 01:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qNwjS3qcu5QQokaoGL3/p9K3/5kr22k3JfFhKryCmaY=;
        b=iry3Z9dsu7HXtq/i0EfwPXCK01SxedrQsYvmb6Ibq/tUrYqUdUS7rREIlAKtpVkWbO
         4HdDeWIFSFSd8ppE50eq7Lqa8iKXpYA+NBgiRjwqpA6+UjMufLLdwAd8k/QB8t/AdJVy
         m2SxTdDzo5Yh3XuVKTGZvx/d0m6ad3dkyzE0OpWuuIkqWjGZtB4B5VYbPbI/VOU0x1/Y
         GzFQkZ4VAyke/AieYc2JtJjSJu/qlrioXReCkIf/8s8qTVtBQCk1CXEl0t3arHFKuqRa
         5dGVp/8GVKsReGtsf1Zw/VIdwlLRpj/r+pQ/qRSdjKQO0iVAYfYmQs9kNl6qEFHAqdEe
         aeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNwjS3qcu5QQokaoGL3/p9K3/5kr22k3JfFhKryCmaY=;
        b=7sFyoU0XKmdk/FI2pqST2bOpJlHT1DkXd4eLpr1apyqu8P8t2P7AEuauJ2NHreagi2
         Ps0bzWXvsHmo+7LsV5pe9YNN75GmjxNWCqbO3ePBLtpzhRdhrNGAVequar/voTC9N3K9
         lCoO34TzlJ5Lc7a5LI9qnyUI7n8+MLbBSLVkIchxSz5d++T56ZuzVvk/TNg3ZefhQ49O
         bzLOf186HHFI2FaUVYVNDe7vS7uDb7ZUY8YNfYUcIOpT35UEslZ3SW/D7ORzOf8PiYMS
         tU/KdZutbWLxeYDrqxOYCBtzJkT9vHie4CQDPXVf0JNRTiXUTByZSQllaeJpY9YYmpYE
         dhwQ==
X-Gm-Message-State: ANoB5pnyjk3EDW4Hymsfx979+foe/yL1tURV4qYX+yRWvarMvDjaVTi4
        9ByZdKvo8FeL89R9bEoPfINwng==
X-Google-Smtp-Source: AA0mqf67S6QH+xs5kCaXtmhuJONg8Pi/o/+uiay7Rci+j+zcbBi5oSbBjQcV7/i7NL36gMK6UlV69Q==
X-Received: by 2002:a05:6000:38d:b0:232:be5b:9cae with SMTP id u13-20020a056000038d00b00232be5b9caemr1261672wrf.13.1670491343859;
        Thu, 08 Dec 2022 01:22:23 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1fd:11b0:f877:1d6c])
        by smtp.gmail.com with ESMTPSA id m14-20020a5d624e000000b00241dd5de644sm21295395wrv.97.2022.12.08.01.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 01:22:23 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] treewide: add missing commas to enums and struct definitions
Date:   Thu,  8 Dec 2022 10:22:20 +0100
Message-Id: <20221208092220.67060-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The code is not consistent with regard to following the last element in
enums and struct definitions with a comma. Unless the last element is
guaranteed not to change (e.g. '{ }', or NULL), follow it with a comma
treewide to avoid churn in git when adding new values.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/edge-event.cpp          |  4 ++--
 bindings/cxx/gpiodcxx/edge-event.hpp |  2 +-
 bindings/cxx/gpiodcxx/info-event.hpp |  2 +-
 bindings/cxx/gpiodcxx/line.hpp       |  8 ++++----
 bindings/cxx/info-event.cpp          |  4 ++--
 bindings/cxx/line-info.cpp           | 10 +++++-----
 bindings/cxx/line-settings.cpp       | 12 ++++++------
 bindings/cxx/line.cpp                | 12 ++++++------
 bindings/cxx/tests/gpiosim.cpp       |  6 +++---
 bindings/cxx/tests/gpiosim.hpp       |  6 +++---
 include/gpiod.h                      | 12 ++++++------
 11 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/bindings/cxx/edge-event.cpp b/bindings/cxx/edge-event.cpp
index 9d12273..4de57a5 100644
--- a/bindings/cxx/edge-event.cpp
+++ b/bindings/cxx/edge-event.cpp
@@ -13,12 +13,12 @@ namespace {
 
 const ::std::map<int, edge_event::event_type> event_type_mapping = {
 	{ GPIOD_EDGE_EVENT_RISING_EDGE,		edge_event::event_type::RISING_EDGE },
-	{ GPIOD_EDGE_EVENT_FALLING_EDGE,	edge_event::event_type::FALLING_EDGE }
+	{ GPIOD_EDGE_EVENT_FALLING_EDGE,	edge_event::event_type::FALLING_EDGE },
 };
 
 const ::std::map<edge_event::event_type, ::std::string> event_type_names = {
 	{ edge_event::event_type::RISING_EDGE,		"RISING_EDGE" },
-	{ edge_event::event_type::FALLING_EDGE,		"FALLING_EDGE" }
+	{ edge_event::event_type::FALLING_EDGE,		"FALLING_EDGE" },
 };
 
 } /* namespace */
diff --git a/bindings/cxx/gpiodcxx/edge-event.hpp b/bindings/cxx/gpiodcxx/edge-event.hpp
index 9a50629..648165c 100644
--- a/bindings/cxx/gpiodcxx/edge-event.hpp
+++ b/bindings/cxx/gpiodcxx/edge-event.hpp
@@ -41,7 +41,7 @@ public:
 	{
 		RISING_EDGE = 1,
 		/**< This is a rising edge event. */
-		FALLING_EDGE
+		FALLING_EDGE,
 		/**< This is falling edge event. */
 	};
 
diff --git a/bindings/cxx/gpiodcxx/info-event.hpp b/bindings/cxx/gpiodcxx/info-event.hpp
index 1e99896..6f3c0b9 100644
--- a/bindings/cxx/gpiodcxx/info-event.hpp
+++ b/bindings/cxx/gpiodcxx/info-event.hpp
@@ -44,7 +44,7 @@ public:
 		/**< Line has been requested. */
 		LINE_RELEASED,
 		/**< Previously requested line has been released. */
-		LINE_CONFIG_CHANGED
+		LINE_CONFIG_CHANGED,
 		/**< Line configuration has changed. */
 	};
 
diff --git a/bindings/cxx/gpiodcxx/line.hpp b/bindings/cxx/gpiodcxx/line.hpp
index a8aae57..5d0752a 100644
--- a/bindings/cxx/gpiodcxx/line.hpp
+++ b/bindings/cxx/gpiodcxx/line.hpp
@@ -100,7 +100,7 @@ enum class direction
 	/**< Request the line(s), but don't change current direction. */
 	INPUT,
 	/**< Direction is input - we're reading the state of a GPIO line. */
-	OUTPUT
+	OUTPUT,
 	/**< Direction is output - we're driving the GPIO line. */
 };
 
@@ -115,7 +115,7 @@ enum class edge
 	/**< Line detects rising edge events. */
 	FALLING,
 	/**< Line detect falling edge events. */
-	BOTH
+	BOTH,
 	/**< Line detects both rising and falling edge events. */
 };
 
@@ -132,7 +132,7 @@ enum class bias
 	/**< The internal bias is disabled. */
 	PULL_UP,
 	/**< The internal pull-up bias is enabled. */
-	PULL_DOWN
+	PULL_DOWN,
 	/**< The internal pull-down bias is enabled. */
 };
 
@@ -145,7 +145,7 @@ enum class drive
 	/**< Drive setting is push-pull. */
 	OPEN_DRAIN,
 	/**< Line output is open-drain. */
-	OPEN_SOURCE
+	OPEN_SOURCE,
 	/**< Line output is open-source. */
 };
 
diff --git a/bindings/cxx/info-event.cpp b/bindings/cxx/info-event.cpp
index f709408..37a3fed 100644
--- a/bindings/cxx/info-event.cpp
+++ b/bindings/cxx/info-event.cpp
@@ -13,13 +13,13 @@ namespace {
 const ::std::map<int, info_event::event_type> event_type_mapping = {
 	{ GPIOD_INFO_EVENT_LINE_REQUESTED,	info_event::event_type::LINE_REQUESTED },
 	{ GPIOD_INFO_EVENT_LINE_RELEASED,	info_event::event_type::LINE_RELEASED },
-	{ GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED,	info_event::event_type::LINE_CONFIG_CHANGED }
+	{ GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED,	info_event::event_type::LINE_CONFIG_CHANGED },
 };
 
 const ::std::map<info_event::event_type, ::std::string> event_type_names = {
 	{ info_event::event_type::LINE_REQUESTED,	"LINE_REQUESTED" },
 	{ info_event::event_type::LINE_RELEASED,	"LINE_RELEASED" },
-	{ info_event::event_type::LINE_CONFIG_CHANGED,	"LINE_CONFIG_CHANGED" }
+	{ info_event::event_type::LINE_CONFIG_CHANGED,	"LINE_CONFIG_CHANGED" },
 };
 
 } /* namespace */
diff --git a/bindings/cxx/line-info.cpp b/bindings/cxx/line-info.cpp
index 5eb2a3f..4e70b29 100644
--- a/bindings/cxx/line-info.cpp
+++ b/bindings/cxx/line-info.cpp
@@ -13,33 +13,33 @@ namespace {
 
 const ::std::map<int, line::direction> direction_mapping = {
 	{ GPIOD_LINE_DIRECTION_INPUT,		line::direction::INPUT },
-	{ GPIOD_LINE_DIRECTION_OUTPUT,		line::direction::OUTPUT }
+	{ GPIOD_LINE_DIRECTION_OUTPUT,		line::direction::OUTPUT },
 };
 
 const ::std::map<int, line::bias> bias_mapping = {
 	{ GPIOD_LINE_BIAS_UNKNOWN,		line::bias::UNKNOWN },
 	{ GPIOD_LINE_BIAS_DISABLED,		line::bias::DISABLED },
 	{ GPIOD_LINE_BIAS_PULL_UP,		line::bias::PULL_UP },
-	{ GPIOD_LINE_BIAS_PULL_DOWN,		line::bias::PULL_DOWN }
+	{ GPIOD_LINE_BIAS_PULL_DOWN,		line::bias::PULL_DOWN },
 };
 
 const ::std::map<int, line::drive> drive_mapping = {
 	{ GPIOD_LINE_DRIVE_PUSH_PULL,		line::drive::PUSH_PULL },
 	{ GPIOD_LINE_DRIVE_OPEN_DRAIN,		line::drive::OPEN_DRAIN },
-	{ GPIOD_LINE_DRIVE_OPEN_SOURCE,		line::drive::OPEN_SOURCE }
+	{ GPIOD_LINE_DRIVE_OPEN_SOURCE,		line::drive::OPEN_SOURCE },
 };
 
 const ::std::map<int, line::edge> edge_mapping = {
 	{ GPIOD_LINE_EDGE_NONE,			line::edge::NONE },
 	{ GPIOD_LINE_EDGE_RISING,		line::edge::RISING },
 	{ GPIOD_LINE_EDGE_FALLING,		line::edge::FALLING },
-	{ GPIOD_LINE_EDGE_BOTH,			line::edge::BOTH }
+	{ GPIOD_LINE_EDGE_BOTH,			line::edge::BOTH },
 };
 
 const ::std::map<int, line::clock> clock_mapping = {
 	{ GPIOD_LINE_CLOCK_MONOTONIC,		line::clock::MONOTONIC },
 	{ GPIOD_LINE_CLOCK_REALTIME,		line::clock::REALTIME },
-	{ GPIOD_LINE_CLOCK_HTE,			line::clock::HTE }
+	{ GPIOD_LINE_CLOCK_HTE,			line::clock::HTE },
 };
 
 } /* namespace */
diff --git a/bindings/cxx/line-settings.cpp b/bindings/cxx/line-settings.cpp
index 58860db..7d3d6a5 100644
--- a/bindings/cxx/line-settings.cpp
+++ b/bindings/cxx/line-settings.cpp
@@ -25,7 +25,7 @@ make_reverse_maping(const ::std::map<cxx_enum_type, c_enum_type>& mapping)
 const ::std::map<line::direction, gpiod_line_direction> direction_mapping = {
 	{ line::direction::AS_IS,	GPIOD_LINE_DIRECTION_AS_IS },
 	{ line::direction::INPUT,	GPIOD_LINE_DIRECTION_INPUT },
-	{ line::direction::OUTPUT,	GPIOD_LINE_DIRECTION_OUTPUT }
+	{ line::direction::OUTPUT,	GPIOD_LINE_DIRECTION_OUTPUT },
 };
 
 const ::std::map<gpiod_line_direction, line::direction>
@@ -35,7 +35,7 @@ const ::std::map<line::edge, gpiod_line_edge> edge_mapping = {
 	{ line::edge::NONE,		GPIOD_LINE_EDGE_NONE },
 	{ line::edge::FALLING,		GPIOD_LINE_EDGE_FALLING },
 	{ line::edge::RISING,		GPIOD_LINE_EDGE_RISING },
-	{ line::edge::BOTH,		GPIOD_LINE_EDGE_BOTH }
+	{ line::edge::BOTH,		GPIOD_LINE_EDGE_BOTH },
 };
 
 const ::std::map<gpiod_line_edge, line::edge> reverse_edge_mapping = make_reverse_maping(edge_mapping);
@@ -44,7 +44,7 @@ const ::std::map<line::bias, gpiod_line_bias> bias_mapping = {
 	{ line::bias::AS_IS,		GPIOD_LINE_BIAS_AS_IS },
 	{ line::bias::DISABLED,		GPIOD_LINE_BIAS_DISABLED },
 	{ line::bias::PULL_UP,		GPIOD_LINE_BIAS_PULL_UP },
-	{ line::bias::PULL_DOWN,	GPIOD_LINE_BIAS_PULL_DOWN }
+	{ line::bias::PULL_DOWN,	GPIOD_LINE_BIAS_PULL_DOWN },
 };
 
 const ::std::map<gpiod_line_bias, line::bias> reverse_bias_mapping = make_reverse_maping(bias_mapping);
@@ -52,7 +52,7 @@ const ::std::map<gpiod_line_bias, line::bias> reverse_bias_mapping = make_revers
 const ::std::map<line::drive, gpiod_line_drive> drive_mapping = {
 	{ line::drive::PUSH_PULL,	GPIOD_LINE_DRIVE_PUSH_PULL },
 	{ line::drive::OPEN_DRAIN,	GPIOD_LINE_DRIVE_OPEN_DRAIN },
-	{ line::drive::OPEN_SOURCE,	GPIOD_LINE_DRIVE_OPEN_SOURCE }
+	{ line::drive::OPEN_SOURCE,	GPIOD_LINE_DRIVE_OPEN_SOURCE },
 };
 
 const ::std::map<gpiod_line_drive, line::drive> reverse_drive_mapping = make_reverse_maping(drive_mapping);
@@ -60,7 +60,7 @@ const ::std::map<gpiod_line_drive, line::drive> reverse_drive_mapping = make_rev
 const ::std::map<line::clock, gpiod_line_clock> clock_mapping = {
 	{ line::clock::MONOTONIC,	GPIOD_LINE_CLOCK_MONOTONIC },
 	{ line::clock::REALTIME,	GPIOD_LINE_CLOCK_REALTIME },
-	{ line::clock::HTE,		GPIOD_LINE_CLOCK_HTE }
+	{ line::clock::HTE,		GPIOD_LINE_CLOCK_HTE },
 };
 
 const ::std::map<gpiod_line_clock, line::clock>
@@ -68,7 +68,7 @@ reverse_clock_mapping = make_reverse_maping(clock_mapping);
 
 const ::std::map<line::value, gpiod_line_value> value_mapping = {
 	{ line::value::INACTIVE,	GPIOD_LINE_VALUE_INACTIVE },
-	{ line::value::ACTIVE,		GPIOD_LINE_VALUE_ACTIVE }
+	{ line::value::ACTIVE,		GPIOD_LINE_VALUE_ACTIVE },
 };
 
 const ::std::map<gpiod_line_value, line::value> reverse_value_mapping = make_reverse_maping(value_mapping);
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index c2750a8..d99e8fa 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -13,13 +13,13 @@ namespace {
 
 const ::std::map<line::value, ::std::string> value_names = {
 	{ line::value::INACTIVE,	"INACTIVE" },
-	{ line::value::ACTIVE,		"ACTIVE" }
+	{ line::value::ACTIVE,		"ACTIVE" },
 };
 
 const ::std::map<line::direction, ::std::string> direction_names = {
 	{ line::direction::AS_IS,	"AS_IS" },
 	{ line::direction::INPUT,	"INPUT" },
-	{ line::direction::OUTPUT,	"OUTPUT" }
+	{ line::direction::OUTPUT,	"OUTPUT" },
 };
 
 const ::std::map<line::bias, ::std::string> bias_names = {
@@ -27,26 +27,26 @@ const ::std::map<line::bias, ::std::string> bias_names = {
 	{ line::bias::UNKNOWN,		"UNKNOWN" },
 	{ line::bias::DISABLED,		"DISABLED" },
 	{ line::bias::PULL_UP,		"PULL_UP" },
-	{ line::bias::PULL_DOWN,	"PULL_DOWN" }
+	{ line::bias::PULL_DOWN,	"PULL_DOWN" },
 };
 
 const ::std::map<line::drive, ::std::string> drive_names = {
 	{ line::drive::PUSH_PULL,	"PUSH_PULL" },
 	{ line::drive::OPEN_DRAIN,	"OPEN_DRAIN" },
-	{ line::drive::OPEN_SOURCE,	"OPEN_SOURCE" }
+	{ line::drive::OPEN_SOURCE,	"OPEN_SOURCE" },
 };
 
 const ::std::map<line::edge, ::std::string> edge_names = {
 	{ line::edge::NONE,		"NONE" },
 	{ line::edge::RISING,		"RISING_EDGE" },
 	{ line::edge::FALLING,		"FALLING_EDGE" },
-	{ line::edge::BOTH,		"BOTH_EDGES" }
+	{ line::edge::BOTH,		"BOTH_EDGES" },
 };
 
 const ::std::map<line::clock, ::std::string> clock_names = {
 	{ line::clock::MONOTONIC,	"MONOTONIC" },
 	{ line::clock::REALTIME,	"REALTIME" },
-	{ line::clock::HTE,		"HTE" }
+	{ line::clock::HTE,		"HTE" },
 };
 
 } /* namespace */
diff --git a/bindings/cxx/tests/gpiosim.cpp b/bindings/cxx/tests/gpiosim.cpp
index a36c59e..7267e6d 100644
--- a/bindings/cxx/tests/gpiosim.cpp
+++ b/bindings/cxx/tests/gpiosim.cpp
@@ -14,18 +14,18 @@ namespace {
 
 const ::std::map<chip::pull, gpiosim_pull> pull_mapping = {
 	{ chip::pull::PULL_UP,		GPIOSIM_PULL_UP },
-	{ chip::pull::PULL_DOWN,	GPIOSIM_PULL_DOWN }
+	{ chip::pull::PULL_DOWN,	GPIOSIM_PULL_DOWN },
 };
 
 const ::std::map<chip_builder::direction, gpiosim_direction> hog_dir_mapping = {
 	{ chip_builder::direction::INPUT,	GPIOSIM_DIRECTION_INPUT },
 	{ chip_builder::direction::OUTPUT_HIGH,	GPIOSIM_DIRECTION_OUTPUT_HIGH },
-	{ chip_builder::direction::OUTPUT_LOW,	GPIOSIM_DIRECTION_OUTPUT_LOW }
+	{ chip_builder::direction::OUTPUT_LOW,	GPIOSIM_DIRECTION_OUTPUT_LOW },
 };
 
 const ::std::map<gpiosim_value, chip::value> value_mapping = {
 	{ GPIOSIM_VALUE_INACTIVE,	chip::value::INACTIVE },
-	{ GPIOSIM_VALUE_ACTIVE,		chip::value::ACTIVE }
+	{ GPIOSIM_VALUE_ACTIVE,		chip::value::ACTIVE },
 };
 
 template<class gpiosim_type, void free_func(gpiosim_type*)> struct deleter
diff --git a/bindings/cxx/tests/gpiosim.hpp b/bindings/cxx/tests/gpiosim.hpp
index 1dab191..320ae96 100644
--- a/bindings/cxx/tests/gpiosim.hpp
+++ b/bindings/cxx/tests/gpiosim.hpp
@@ -16,12 +16,12 @@ class chip
 public:
 	enum class pull {
 		PULL_UP = 1,
-		PULL_DOWN
+		PULL_DOWN,
 	};
 
 	enum class value {
 		INACTIVE = 0,
-		ACTIVE = 1
+		ACTIVE = 1,
 	};
 
 	chip(const chip& other) = delete;
@@ -54,7 +54,7 @@ public:
 	enum class direction {
 		INPUT = 1,
 		OUTPUT_HIGH,
-		OUTPUT_LOW
+		OUTPUT_LOW,
 	};
 
 	chip_builder();
diff --git a/include/gpiod.h b/include/gpiod.h
index 2ad028d..a76c311 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -261,7 +261,7 @@ enum gpiod_line_direction {
 	/**< Request the line(s), but don't change direction. */
 	GPIOD_LINE_DIRECTION_INPUT,
 	/**< Direction is input - for reading the value of an externally driven GPIO line. */
-	GPIOD_LINE_DIRECTION_OUTPUT
+	GPIOD_LINE_DIRECTION_OUTPUT,
 	/**< Direction is output - for driving the GPIO line. */
 };
 
@@ -275,7 +275,7 @@ enum gpiod_line_edge {
 	/**< Line detects rising edge events. */
 	GPIOD_LINE_EDGE_FALLING,
 	/**< Line detects falling edge events. */
-	GPIOD_LINE_EDGE_BOTH
+	GPIOD_LINE_EDGE_BOTH,
 	/**< Line detects both rising and falling edge events. */
 };
 
@@ -291,7 +291,7 @@ enum gpiod_line_bias {
 	/**< The internal bias is disabled. */
 	GPIOD_LINE_BIAS_PULL_UP,
 	/**< The internal pull-up bias is enabled. */
-	GPIOD_LINE_BIAS_PULL_DOWN
+	GPIOD_LINE_BIAS_PULL_DOWN,
 	/**< The internal pull-down bias is enabled. */
 };
 
@@ -303,7 +303,7 @@ enum gpiod_line_drive {
 	/**< Drive setting is push-pull. */
 	GPIOD_LINE_DRIVE_OPEN_DRAIN,
 	/**< Line output is open-drain. */
-	GPIOD_LINE_DRIVE_OPEN_SOURCE
+	GPIOD_LINE_DRIVE_OPEN_SOURCE,
 	/**< Line output is open-source. */
 };
 
@@ -494,7 +494,7 @@ enum gpiod_info_event_type {
 	/**< Line has been requested. */
 	GPIOD_INFO_EVENT_LINE_RELEASED,
 	/**< Previously requested line has been released. */
-	GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED
+	GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED,
 	/**< Line configuration has changed. */
 };
 
@@ -1050,7 +1050,7 @@ int gpiod_line_request_read_edge_events(struct gpiod_line_request *request,
 enum gpiod_edge_event_type {
 	GPIOD_EDGE_EVENT_RISING_EDGE = 1,
 	/**< Rising edge event. */
-	GPIOD_EDGE_EVENT_FALLING_EDGE
+	GPIOD_EDGE_EVENT_FALLING_EDGE,
 	/**< Falling edge event. */
 };
 
-- 
2.37.2

