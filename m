Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52FD77A5DF8
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Sep 2023 11:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbjISJcA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Sep 2023 05:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbjISJb6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Sep 2023 05:31:58 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698B0F2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 02:31:52 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-532c81b9adbso318663a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 02:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695115911; x=1695720711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmEB0v4JTkGNi+OAUoN/8hbIeWkQdIE917T3oPI5Ozw=;
        b=zc5R6ONyjljXUjH/Duj5vh6BvNrDJ2QGUBFk5c19nzGRB9O39MuLqJ7j3dK7vKMpdD
         Juv2a96+tCElRGoOUU4m3yXW/BHP1csTm07LhcFDr158INEGiFkM+JdS7QOCUsuMvzU2
         4swrV6tIpHiY+WB7aKRNWCrPBx0IymS88+BobnZLE9K21U3kKhnYUbdb7Db2vm2jNDq4
         vJzc3/4fZTX3K9Dr9t4JTgdJeX2S2dOqIOjw27de/Qk2DcN/5jBsZJs42ZOU+cxtv9ty
         rh4rOdWJtIOM8MZOXpfMYa4zsKqfO1V4FQQ7FvCBnjWjsSN0VG/G6a/EshnCAHvgHymI
         Yihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695115911; x=1695720711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmEB0v4JTkGNi+OAUoN/8hbIeWkQdIE917T3oPI5Ozw=;
        b=pwlO5F4VE3jxzGs0PuwxaxMsPSZoNwdkNx2hGrZNE9QamXVVK4tVc0IFpko8dD5eLC
         5FIj0eJb7u7swdVEUsgwPseEHYjgbLKW1/M44LKEk6tS9Jnqd9TcZK02oi/BDdSWx0h7
         0jNIRVkwqxHmzEzOOY4VBbTVs0ErrH4igSmwuFX2zD+ERXrgvKVH9OErrFvyI5sO+Ve5
         5E7GJI2fgj34WrpyyW1naOCxKmRQsqS5fakW2f6bguXnSvZuBfFo+O1PZsLxBtb+XTu+
         4ZKpwaKKjhlkuwIXWaLu2n9oHkGHkh0+VWxpQzk6QMpzeItQPrbF7qS0WJr2DPpkNqSR
         OVlQ==
X-Gm-Message-State: AOJu0Yz5fJURsSOHsWZdH38SOJ1eQWLcrZ1YEHvUgrE955k4Kx4RjS/C
        D63RDP/P471V42vvE4PiARwBc8c8igYvCr9IDn8UUw==
X-Google-Smtp-Source: AGHT+IFg+JgeGQMJ4cIGHep0QrvVgUa8jel0SdfS3XTevi6kHFwEyMXHU0/zPchJZQgaeAY2bt3ByA==
X-Received: by 2002:a05:6402:494:b0:523:102f:3ce0 with SMTP id k20-20020a056402049400b00523102f3ce0mr9934377edv.21.1695115910935;
        Tue, 19 Sep 2023 02:31:50 -0700 (PDT)
Received: from brgl-uxlite.. (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id cy18-20020a0564021c9200b005231e1780aasm3227294edb.91.2023.09.19.02.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 02:31:50 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
Subject: [libgpiod][PATCH 2/3] bindings: cxx: tests: don't use the same chip from different threads
Date:   Tue, 19 Sep 2023 11:31:41 +0200
Message-Id: <20230919093142.85389-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919093142.85389-1-brgl@bgdev.pl>
References: <20230919093142.85389-1-brgl@bgdev.pl>
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

There are no thread-safety guarantees in libgpiod. Let's not reuse the
chip object created in one thread to generate info events in another but
create a second chip for that purpose instead.

Reported-by: Erik Schilling <erik.schilling@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/tests/tests-info-event.cpp | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/bindings/cxx/tests/tests-info-event.cpp b/bindings/cxx/tests/tests-info-event.cpp
index 249b1e8..21c0ef0 100644
--- a/bindings/cxx/tests/tests-info-event.cpp
+++ b/bindings/cxx/tests/tests-info-event.cpp
@@ -3,6 +3,7 @@
 
 #include <catch2/catch.hpp>
 #include <chrono>
+#include <filesystem>
 #include <gpiod.hpp>
 #include <sstream>
 #include <thread>
@@ -17,11 +18,11 @@ using event_type = ::gpiod::info_event::event_type;
 
 namespace {
 
-void request_reconfigure_release_line(::gpiod::chip& chip)
+void request_reconfigure_release_line(const ::std::filesystem::path& chip_path)
 {
 	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
 
-	auto request = chip
+	auto request = ::gpiod::chip(chip_path)
 		.prepare_request()
 		.add_line_settings(7, ::gpiod::line_settings())
 		.do_request();
@@ -48,7 +49,9 @@ TEST_CASE("Lines can be watched", "[info-event][chip]")
 		.set_num_lines(8)
 		.build();
 
-	::gpiod::chip chip(sim.dev_path());
+	const auto chip_path = sim.dev_path();
+
+	::gpiod::chip chip(chip_path);
 
 	SECTION("watch_line_info() returns line info")
 	{
@@ -74,7 +77,7 @@ TEST_CASE("Lines can be watched", "[info-event][chip]")
 
 		REQUIRE(info.direction() == direction::INPUT);
 
-		::std::thread thread(request_reconfigure_release_line, ::std::ref(chip));
+		::std::thread thread(request_reconfigure_release_line, ::std::ref(chip_path));
 
 		REQUIRE(chip.wait_info_event(::std::chrono::seconds(1)));
 		auto event = chip.read_info_event();
-- 
2.39.2

