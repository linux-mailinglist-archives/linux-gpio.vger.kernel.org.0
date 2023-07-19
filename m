Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7FF759E6E
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jul 2023 21:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbjGSTVN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 15:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbjGSTVL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 15:21:11 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C771FDD
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 12:21:09 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbf1b82d9cso67744755e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 12:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689794467; x=1690399267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7K3qwb55HKjciBSgVIQGZ+zljzs8UyMHnuxo6J/lLQ=;
        b=MU+t5zywXyC0PqPaUuPjrN4QhNqt0IUeAU14Qvz1CYeF44L1+lI7jXwSP75x0hx+w4
         UWx2qhlF5pnw7BvOF6BBGB4xMrMAlhWpP6+H3rbvJwyySQPIolrBRiLWrqCU89o9gzK/
         jD0xx5fKaLmKjVEWNqZcP1B0aXWZfLtdkADMDSuifreaYbuItyiK+Pnz0nUxPOwHb13N
         LaPgx+0K11ibJiJnAKIQ511B6l9zbHnujz4NU/ruz41BHp/+xdVTctF1F4j9fzuwflzL
         bbY7ToOaaeYk9zZ40/NQcfWi5UWvFdY+7guVNkypS2dAxPt6GU7djLqNMJ1HHeed9hx9
         Hahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689794467; x=1690399267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7K3qwb55HKjciBSgVIQGZ+zljzs8UyMHnuxo6J/lLQ=;
        b=ICNDxk/ExSBB/1xx4kSL1aTffNmwcrWIGkEV5fZRAoIoidR9xJVHOIr0Gn1uKjazI9
         bzPpLgDj1dvpQ8LPw4r+nmN6XFdHkIf8n7VuMt5N5Ywh2myAsYgfzmBVlohD0ZejwP8g
         fWo+8t8Cl+WJZkQTigPVbHa+f99FUjJLgNNMTxJaDYRUJ5ysPcHbglT+hK6Bar/MOrsM
         ZfdQ2DWIbjddZP2bHcgps7OcO3DV8qmfsSvE6y5QAZqR0xSoD7zdrrsM/3WLnnVt4Lq+
         OWYmFmbrP26Ap04Ab8snp4aEkY8gOXHRtKZZcLAJFlJCFd8ZdxNC8dAV1nkJ7VvqwcfN
         YaEg==
X-Gm-Message-State: ABy/qLZg9bJZF9EYcGsQ+RgFKLedFdX2nQp5EmdT6F5zDUhWQOhD6tY2
        y+X+7ALF3XoLf6DD0ChBJ8rtvA==
X-Google-Smtp-Source: APBJJlG8kOT++BzM8Vxa0YnA8w6bqnPFBhDWszfKDhOLbJ/qdJpQ3wg/k1nyqyUV1jyKzrGBWQEZoA==
X-Received: by 2002:a7b:ca52:0:b0:3fc:3f31:422f with SMTP id m18-20020a7bca52000000b003fc3f31422fmr2660880wml.3.1689794467638;
        Wed, 19 Jul 2023 12:21:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f884:f48d:2867:5c1d])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600c11ce00b003fbc0a49b57sm2373454wmi.6.2023.07.19.12.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 12:21:07 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 3/5] bindings: cxx: provide line_request::chip_path()
Date:   Wed, 19 Jul 2023 21:20:55 +0200
Message-Id: <20230719192057.172560-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230719192057.172560-1-brgl@bgdev.pl>
References: <20230719192057.172560-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a wrapper around gpiod_line_request_get_chip_path() for C++
bindings and update the tests.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/gpiodcxx/line-request.hpp    |  7 +++++++
 bindings/cxx/line-request.cpp             | 10 +++++++++-
 bindings/cxx/tests/tests-line-request.cpp |  6 ++++--
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/bindings/cxx/gpiodcxx/line-request.hpp b/bindings/cxx/gpiodcxx/line-request.hpp
index c1e1520..dd8b5b9 100644
--- a/bindings/cxx/gpiodcxx/line-request.hpp
+++ b/bindings/cxx/gpiodcxx/line-request.hpp
@@ -14,6 +14,7 @@
 
 #include <chrono>
 #include <cstddef>
+#include <filesystem>
 #include <iostream>
 #include <memory>
 
@@ -75,6 +76,12 @@ public:
 	 */
 	void release();
 
+	/**
+	 * @brief Get the path of the chip this request was made on.
+	 * @return Path to the GPIO chip device.
+	 */
+	::std::filesystem::path chip_path() const;
+
 	/**
 	 * @brief Get the number of requested lines.
 	 * @return Number of lines in this request.
diff --git a/bindings/cxx/line-request.cpp b/bindings/cxx/line-request.cpp
index b0723c3..33e9d6e 100644
--- a/bindings/cxx/line-request.cpp
+++ b/bindings/cxx/line-request.cpp
@@ -63,6 +63,13 @@ GPIOD_CXX_API void line_request::release()
 	this->_m_priv->request.reset();
 }
 
+GPIOD_CXX_API ::std::filesystem::path line_request::chip_path() const
+{
+	this->_m_priv->throw_if_released();
+
+	return ::gpiod_line_request_get_chip_path(this->_m_priv->request.get());
+}
+
 GPIOD_CXX_API ::std::size_t line_request::num_lines() const
 {
 	this->_m_priv->throw_if_released();
@@ -222,7 +229,8 @@ GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line_request
 	if (!request)
 		out << "gpiod::line_request(released)";
 	else
-		out << "gpiod::line_request(num_lines=" << request.num_lines() <<
+		out << "gpiod::line_request(chip_path=\"" << request.chip_path() <<
+		       "\", num_lines=" << request.num_lines() <<
 		       ", line_offsets=" << request.offsets() <<
 		       ", fd=" << request.fd() <<
 		       ")";
diff --git a/bindings/cxx/tests/tests-line-request.cpp b/bindings/cxx/tests/tests-line-request.cpp
index d1a56ae..914a60a 100644
--- a/bindings/cxx/tests/tests-line-request.cpp
+++ b/bindings/cxx/tests/tests-line-request.cpp
@@ -468,14 +468,16 @@ TEST_CASE("line_request stream insertion operator works", "[line-request]")
 		.set_num_lines(4)
 		.build();
 
-	auto request = ::gpiod::chip(sim.dev_path())
+	auto chip = ::gpiod::chip(sim.dev_path());
+	auto request = chip
 		.prepare_request()
 		.add_line_settings({ 3, 1, 0, 2}, ::gpiod::line_settings())
 		.do_request();
 
 	::std::stringstream buf, expected;
 
-	expected << "gpiod::line_request(num_lines=4, line_offsets=gpiod::offsets(3, 1, 0, 2), fd=" <<
+	expected << "gpiod::line_request(chip_path=\"" << chip.path() <<
+		    "\", num_lines=4, line_offsets=gpiod::offsets(3, 1, 0, 2), fd=" <<
 		    request.fd() << ")";
 
 	SECTION("active request")
-- 
2.39.2

