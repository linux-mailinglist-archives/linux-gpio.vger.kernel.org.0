Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 908705E7579
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Sep 2022 10:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbiIWIM3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Sep 2022 04:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbiIWIM2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2022 04:12:28 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA9E12C1C2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2022 01:12:27 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id t7so19134909wrm.10
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2022 01:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=3RoHR4n5AbOPPC7kQ9+7um8b8UaGK08iCvreREIWChE=;
        b=MQLhcYaNksQMLa7Z1oVuJi/jz/2z0jeWjTo/zNmgOmPjtU3OahjxIGy3tSUORAdNnd
         gc1WAuin/5Xw1bw4q6S+IWoVuyx1DWkEi/sP+YNDGj9zjQnRbp9G7u0PlmWwHEZqRLfr
         oridBPZp8LGSFMM2K0KbbeTI1tXhIXO0yWG6ui0VzW1BUIllwd6mTlSSGdaQLwOSxHlo
         SIYHs2wr/6Oqdfuc/PEgQREmx6y6nNve+4TBXUx2W1CifQCYPLrSAHa/ANb3KfdNhSzS
         q00yOykp/pjhbsd1m2vUiFHjnMepR6ZE/Wmnva6zs3yjpZeP3xqn5RmoVyDTqV2O/IHC
         XuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=3RoHR4n5AbOPPC7kQ9+7um8b8UaGK08iCvreREIWChE=;
        b=aOsp576yk3VG2PLD1ZOxzlsKjUlUKow/vID1XixwxjSZi7gBuFxONM82EN9MG42aIx
         ILSw/fTm93GULlj3dBaOMHb+OrrAoWUHbgzUlX4LcXi6I/LhckTJICP/bJoY+DEAHauW
         R7Ns44sJB+JsYbcuc4Pa1+QVCJ7qDw29RDq642QaD32f7VSpPrk4N1PWAKYbiOJytjoK
         z8PAYKv3+x4QoUS+6QMgUWmQjbccY4jR7rBWty21oxu32//oQ+/CTnnWAprPacUKO4M8
         G6IMOKhGrKX5jXiRn9rXXpeVo5eR37h4HNAec4MMf42/i+lFKgluRyqy0hwUyzXYqbFb
         GqYg==
X-Gm-Message-State: ACrzQf3QQ0kBIFSWZ10fyu0qUe6FOvTgnmpbBP2pHuskRbSzcai6Z1zI
        koYVxQMUpRiveAaYbxFmbMsg3A==
X-Google-Smtp-Source: AMsMyM6sKrvVlggoIhoKuCfSKwGJRb047bu0FFEnX5M4fYo4Th/Tot9dFvhPsyiiawbT27FpG7GKqg==
X-Received: by 2002:a05:6000:144a:b0:229:b76f:86f9 with SMTP id v10-20020a056000144a00b00229b76f86f9mr4421607wrx.613.1663920745604;
        Fri, 23 Sep 2022 01:12:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:69cb:30cc:633b:ab69])
        by smtp.gmail.com with ESMTPSA id e2-20020a5d5302000000b00225239d9265sm6832835wrv.74.2022.09.23.01.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 01:12:25 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH] treewide: add support for hardware timestamp engine
Date:   Fri, 23 Sep 2022 10:12:23 +0200
Message-Id: <20220923081223.25851-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
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

Since v5.19 the linux GPIO uAPI exposes a new request flag for making
the hardware timestamp engine be the source of edge event timestamps.
Add support for it to libgpiod.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 bindings/cxx/gpiodcxx/line-info.hpp        |  2 +-
 bindings/cxx/gpiodcxx/line.hpp             |  4 +++-
 bindings/cxx/line-info.cpp                 |  3 ++-
 bindings/cxx/line-settings.cpp             |  3 ++-
 bindings/cxx/line.cpp                      |  3 ++-
 bindings/cxx/tests/check-kernel.cpp        |  2 +-
 bindings/cxx/tests/tests-line-settings.cpp |  2 ++
 bindings/cxx/tests/tests-line.cpp          |  2 ++
 include/gpiod.h                            |  2 ++
 lib/line-config.c                          |  3 +++
 lib/line-info.c                            |  2 ++
 lib/line-settings.c                        |  1 +
 lib/uapi/gpio.h                            |  3 +++
 tests/gpiod-test.c                         |  4 ++--
 tests/tests-line-info.c                    | 10 ++++++++++
 tests/tests-line-settings.c                |  6 ++++++
 16 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/bindings/cxx/gpiodcxx/line-info.hpp b/bindings/cxx/gpiodcxx/line-info.hpp
index cbc8156..189d305 100644
--- a/bindings/cxx/gpiodcxx/line-info.hpp
+++ b/bindings/cxx/gpiodcxx/line-info.hpp
@@ -143,7 +143,7 @@ public:
 	/**
 	 * @brief Read the current event clock setting used for edge event
 	 *        timestamps.
-	 * @return Returns MONOTONIC or REALTIME.
+	 * @return Returns MONOTONIC, REALTIME or HTE.
 	 */
 	line::clock event_clock() const;
 
diff --git a/bindings/cxx/gpiodcxx/line.hpp b/bindings/cxx/gpiodcxx/line.hpp
index 32c4136..a8aae57 100644
--- a/bindings/cxx/gpiodcxx/line.hpp
+++ b/bindings/cxx/gpiodcxx/line.hpp
@@ -156,8 +156,10 @@ enum class clock
 {
 	MONOTONIC = 1,
 	/**< Line uses the monotonic clock for edge event timestamps. */
-	REALTIME
+	REALTIME,
 	/**< Line uses the realtime clock for edge event timestamps. */
+	HTE,
+	/*<< Line uses the hardware timestamp engine for event timestamps. */
 };
 
 /**
diff --git a/bindings/cxx/line-info.cpp b/bindings/cxx/line-info.cpp
index 2ad0baf..a6b6dfa 100644
--- a/bindings/cxx/line-info.cpp
+++ b/bindings/cxx/line-info.cpp
@@ -38,7 +38,8 @@ const ::std::map<int, line::edge> edge_mapping = {
 
 const ::std::map<int, line::clock> clock_mapping = {
 	{ GPIOD_LINE_EVENT_CLOCK_MONOTONIC,	line::clock::MONOTONIC },
-	{ GPIOD_LINE_EVENT_CLOCK_REALTIME,	line::clock::REALTIME }
+	{ GPIOD_LINE_EVENT_CLOCK_REALTIME,	line::clock::REALTIME },
+	{ GPIOD_LINE_EVENT_CLOCK_HTE,		line::clock::HTE }
 };
 
 } /* namespace */
diff --git a/bindings/cxx/line-settings.cpp b/bindings/cxx/line-settings.cpp
index dbbe30e..22655e2 100644
--- a/bindings/cxx/line-settings.cpp
+++ b/bindings/cxx/line-settings.cpp
@@ -57,7 +57,8 @@ const ::std::map<int, line::drive> reverse_drive_mapping = make_reverse_maping(d
 
 const ::std::map<line::clock, int> clock_mapping = {
 	{ line::clock::MONOTONIC,	GPIOD_LINE_EVENT_CLOCK_MONOTONIC },
-	{ line::clock::REALTIME,	GPIOD_LINE_EVENT_CLOCK_REALTIME }
+	{ line::clock::REALTIME,	GPIOD_LINE_EVENT_CLOCK_REALTIME },
+	{ line::clock::HTE,		GPIOD_LINE_EVENT_CLOCK_HTE }
 };
 
 const ::std::map<int, line::clock> reverse_clock_mapping = make_reverse_maping(clock_mapping);
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index a9caedd..c2750a8 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -45,7 +45,8 @@ const ::std::map<line::edge, ::std::string> edge_names = {
 
 const ::std::map<line::clock, ::std::string> clock_names = {
 	{ line::clock::MONOTONIC,	"MONOTONIC" },
-	{ line::clock::REALTIME,	"REALTIME" }
+	{ line::clock::REALTIME,	"REALTIME" },
+	{ line::clock::HTE,		"HTE" }
 };
 
 } /* namespace */
diff --git a/bindings/cxx/tests/check-kernel.cpp b/bindings/cxx/tests/check-kernel.cpp
index 5d128a0..e10fb5d 100644
--- a/bindings/cxx/tests/check-kernel.cpp
+++ b/bindings/cxx/tests/check-kernel.cpp
@@ -43,6 +43,6 @@ public:
 	}
 };
 
-kernel_checker require_kernel(5, 17, 4);
+kernel_checker require_kernel(5, 19, 0);
 
 } /* namespace */
diff --git a/bindings/cxx/tests/tests-line-settings.cpp b/bindings/cxx/tests/tests-line-settings.cpp
index a7801a4..a3f4bc5 100644
--- a/bindings/cxx/tests/tests-line-settings.cpp
+++ b/bindings/cxx/tests/tests-line-settings.cpp
@@ -107,6 +107,8 @@ TEST_CASE("line_settings mutators work", "[line-settings]")
 		REQUIRE(settings.event_clock() == clock_type::REALTIME);
 		settings.set_event_clock(clock_type::MONOTONIC);
 		REQUIRE(settings.event_clock() == clock_type::MONOTONIC);
+		settings.set_event_clock(clock_type::HTE);
+		REQUIRE(settings.event_clock() == clock_type::HTE);
 		REQUIRE_THROWS_AS(settings.set_event_clock(static_cast<clock_type>(999)),
 				  ::std::invalid_argument);
 	}
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index c17122c..319012a 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -92,9 +92,11 @@ TEST_CASE("stream insertion operators for types in gpiod::line work", "[line]")
 	{
 		auto monotonic = clock_type::MONOTONIC;
 		auto realtime = clock_type::REALTIME;
+		auto hte = clock_type::HTE;
 
 		REQUIRE_THAT(monotonic, stringify_matcher<clock_type>("MONOTONIC"));
 		REQUIRE_THAT(realtime, stringify_matcher<clock_type>("REALTIME"));
+		REQUIRE_THAT(hte, stringify_matcher<clock_type>("HTE"));
 	}
 
 	SECTION("offsets")
diff --git a/include/gpiod.h b/include/gpiod.h
index b60a177..a8e002b 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -306,6 +306,8 @@ enum {
 	/**< Line uses the monotonic clock for edge event timestamps. */
 	GPIOD_LINE_EVENT_CLOCK_REALTIME,
 	/**< Line uses the realtime clock for edge event timestamps. */
+	GPIOD_LINE_EVENT_CLOCK_HTE,
+	/**< Line uses the hardware timestamp engine for event timestamps. */
 };
 
 /**
diff --git a/lib/line-config.c b/lib/line-config.c
index 114d40c..5ee7390 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -341,6 +341,9 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
 	case GPIOD_LINE_EVENT_CLOCK_REALTIME:
 		flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
 		break;
+	case GPIOD_LINE_EVENT_CLOCK_HTE:
+		flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE;
+		break;
 	}
 
 	return flags;
diff --git a/lib/line-info.c b/lib/line-info.c
index 65eca48..9809c43 100644
--- a/lib/line-info.c
+++ b/lib/line-info.c
@@ -160,6 +160,8 @@ gpiod_line_info_from_uapi(struct gpio_v2_line_info *uapi_info)
 
 	if (uapi_info->flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME)
 		info->event_clock = GPIOD_LINE_EVENT_CLOCK_REALTIME;
+	else if (uapi_info->flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE)
+		info->event_clock = GPIOD_LINE_EVENT_CLOCK_HTE;
 	else
 		info->event_clock = GPIOD_LINE_EVENT_CLOCK_MONOTONIC;
 
diff --git a/lib/line-settings.c b/lib/line-settings.c
index 7125124..f97a90e 100644
--- a/lib/line-settings.c
+++ b/lib/line-settings.c
@@ -195,6 +195,7 @@ gpiod_line_settings_set_event_clock(struct gpiod_line_settings *settings,
 	switch (event_clock) {
 	case GPIOD_LINE_EVENT_CLOCK_MONOTONIC:
 	case GPIOD_LINE_EVENT_CLOCK_REALTIME:
+	case GPIOD_LINE_EVENT_CLOCK_HTE:
 		settings->event_clock = event_clock;
 		break;
 	default:
diff --git a/lib/uapi/gpio.h b/lib/uapi/gpio.h
index eaaea3d..cb9966d 100644
--- a/lib/uapi/gpio.h
+++ b/lib/uapi/gpio.h
@@ -66,6 +66,8 @@ struct gpiochip_info {
  * @GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN: line has pull-down bias enabled
  * @GPIO_V2_LINE_FLAG_BIAS_DISABLED: line has bias disabled
  * @GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME: line events contain REALTIME timestamps
+ * @GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE: line events contain timestamps from
+ * hardware timestamp engine
  */
 enum gpio_v2_line_flag {
 	GPIO_V2_LINE_FLAG_USED			= _BITULL(0),
@@ -80,6 +82,7 @@ enum gpio_v2_line_flag {
 	GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN	= _BITULL(9),
 	GPIO_V2_LINE_FLAG_BIAS_DISABLED		= _BITULL(10),
 	GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME	= _BITULL(11),
+	GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE	= _BITULL(12),
 };
 
 /**
diff --git a/tests/gpiod-test.c b/tests/gpiod-test.c
index 38d80a4..39a1f40 100644
--- a/tests/gpiod-test.c
+++ b/tests/gpiod-test.c
@@ -10,8 +10,8 @@
 #include "gpiod-test.h"
 
 #define MIN_KERNEL_MAJOR	5
-#define MIN_KERNEL_MINOR	17
-#define MIN_KERNEL_RELEASE	4
+#define MIN_KERNEL_MINOR	19
+#define MIN_KERNEL_RELEASE	0
 #define MIN_KERNEL_VERSION	KERNEL_VERSION(MIN_KERNEL_MAJOR, \
 					       MIN_KERNEL_MINOR, \
 					       MIN_KERNEL_RELEASE)
diff --git a/tests/tests-line-info.c b/tests/tests-line-info.c
index ffc4586..45b14ff 100644
--- a/tests/tests-line-info.c
+++ b/tests/tests-line-info.c
@@ -362,6 +362,7 @@ GPIOD_TEST_CASE(event_clock)
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	g_autoptr(struct_gpiod_line_info) info0 = NULL;
 	g_autoptr(struct_gpiod_line_info) info1 = NULL;
+	g_autoptr(struct_gpiod_line_info) info2 = NULL;
 	guint offset;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
@@ -377,13 +378,22 @@ GPIOD_TEST_CASE(event_clock)
 	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
 							 settings);
 
+	gpiod_line_settings_set_event_clock(settings,
+					    GPIOD_LINE_EVENT_CLOCK_HTE);
+	offset = 2;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
 	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	info0 = gpiod_test_get_line_info_or_fail(chip, 0);
 	info1 = gpiod_test_get_line_info_or_fail(chip, 1);
+	info2 = gpiod_test_get_line_info_or_fail(chip, 2);
 
 	g_assert_cmpint(gpiod_line_info_get_event_clock(info0), ==,
 			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
 	g_assert_cmpint(gpiod_line_info_get_event_clock(info1), ==,
 			GPIOD_LINE_EVENT_CLOCK_REALTIME);
+	g_assert_cmpint(gpiod_line_info_get_event_clock(info2), ==,
+			GPIOD_LINE_EVENT_CLOCK_HTE);
 }
diff --git a/tests/tests-line-settings.c b/tests/tests-line-settings.c
index d074063..bdf932d 100644
--- a/tests/tests-line-settings.c
+++ b/tests/tests-line-settings.c
@@ -222,6 +222,12 @@ GPIOD_TEST_CASE(set_event_clock)
 	g_assert_cmpint(gpiod_line_settings_get_event_clock(settings), ==,
 			GPIOD_LINE_EVENT_CLOCK_REALTIME);
 
+	ret = gpiod_line_settings_set_event_clock(settings,
+					GPIOD_LINE_EVENT_CLOCK_HTE);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_event_clock(settings), ==,
+			GPIOD_LINE_EVENT_CLOCK_HTE);
+
 	ret = gpiod_line_settings_set_event_clock(settings, 999);
 	g_assert_cmpint(ret, <, 0);
 	g_assert_cmpint(errno, ==, EINVAL);
-- 
2.34.1

