Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B85B675B18A
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 16:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbjGTOsF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 10:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbjGTOsE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 10:48:04 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D7510F5
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 07:48:03 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3158a5e64b6so748558f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 07:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689864481; x=1690469281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LN3HBqQ/z8x29O7+OLP3+jUwXpgcldLFQfrT/3tFVc=;
        b=jCqvTaiUlgPgoCB2/54d97Hx86MIy088fPy2SoLP20rfcMgsHHTqB3ug4DXqtioXQC
         BUx5o7l0O/MBt2SXjSAFXY3sLXaDeSZfap7j/Ov+wSNfZGcVYunOjZciDdPMJEBu+kxI
         J0KJ4M/wrUwA5ePDXbW4fA0JP1THkoDR/iEjAbvnTmHxZz7971UM1OGuCyNmhIp7yLQO
         dzBi9McX0BWFTtAwTsDpOuJe2OuCIK6MmCUMpJ6DKxRR6ORW8ob2rh5HUJGziMbtDShG
         D64cpNXx9VqzSVLclqdeFCWnClYd4JkQaKhQc/VQFsPt5UfyUvof1EXq4vhvd5/ZD8uj
         YO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689864481; x=1690469281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LN3HBqQ/z8x29O7+OLP3+jUwXpgcldLFQfrT/3tFVc=;
        b=DcOXZ0iwn1NdGjE8LCk3ak7AuSd/gF57f6BZRTTuXfayNtOCqzn1eXdBqU89iZNcX3
         EFnJru9Mz4oackoaot1apDuecPTZW94k+UgcE4/XYjN7F0Ams4D3aBm1I6A6nGAJikS7
         ACCIDheDElDN4SUPLlIfnBYWnQKm5d9G5KKOzYhZ/Xn9QbgA0I9WCazDh1e5nHlFBqF6
         UmF9IS/d++x+gPwL9vRnc4wgZnrQKY0RHCoe1wPpatCpsFkgw+4L4aFZPhIU0YkdwSN3
         Rrz5Q5FdutEcd4we5rDVxZsQxynLm+RwpvakR0+MDq5R4cZdbAjLdpmBWP4zaLoIMaGF
         /aZw==
X-Gm-Message-State: ABy/qLb+DSqsD0U9j4Uk+smbtrDfZyWB8UfEziSq7ipWM8kt3JOsMTpP
        aPPN6Uew43ZUzEKhNKzkhYSj0A==
X-Google-Smtp-Source: APBJJlG0bncmHd8kuKrcnn1teeLe7ZSoaKhNNNF1Wt5X9KzE0S/E6zvmon0Fn/c1bLGoL9IhkTGS9A==
X-Received: by 2002:adf:d846:0:b0:315:8f4f:81b1 with SMTP id k6-20020adfd846000000b003158f4f81b1mr2116132wrl.50.1689864481222;
        Thu, 20 Jul 2023 07:48:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bd83:c166:7e2d:3d74])
        by smtp.gmail.com with ESMTPSA id r1-20020adfce81000000b0031128382ed0sm1550906wrn.83.2023.07.20.07.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 07:48:00 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 3/5] bindings: cxx: provide line_request::chip_name()
Date:   Thu, 20 Jul 2023 16:47:45 +0200
Message-Id: <20230720144747.73276-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230720144747.73276-1-brgl@bgdev.pl>
References: <20230720144747.73276-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a wrapper around gpiod_line_request_get_chip_name() for C++
bindings and update the tests.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/gpiodcxx/line-request.hpp    |  6 ++++++
 bindings/cxx/line-request.cpp             | 10 +++++++++-
 bindings/cxx/tests/tests-line-request.cpp |  6 ++++--
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/bindings/cxx/gpiodcxx/line-request.hpp b/bindings/cxx/gpiodcxx/line-request.hpp
index c1e1520..8c1b474 100644
--- a/bindings/cxx/gpiodcxx/line-request.hpp
+++ b/bindings/cxx/gpiodcxx/line-request.hpp
@@ -75,6 +75,12 @@ public:
 	 */
 	void release();
 
+	/**
+	 * @brief Get the name of the chip this request was made on.
+	 * @return Name to the GPIO chip.
+	 */
+	::std::string chip_name() const;
+
 	/**
 	 * @brief Get the number of requested lines.
 	 * @return Number of lines in this request.
diff --git a/bindings/cxx/line-request.cpp b/bindings/cxx/line-request.cpp
index b0723c3..e8e0b96 100644
--- a/bindings/cxx/line-request.cpp
+++ b/bindings/cxx/line-request.cpp
@@ -63,6 +63,13 @@ GPIOD_CXX_API void line_request::release()
 	this->_m_priv->request.reset();
 }
 
+GPIOD_CXX_API ::std::string line_request::chip_name() const
+{
+	this->_m_priv->throw_if_released();
+
+	return ::gpiod_line_request_get_chip_name(this->_m_priv->request.get());
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
+		out << "gpiod::line_request(chip=\"" << request.chip_name() <<
+		       "\", num_lines=" << request.num_lines() <<
 		       ", line_offsets=" << request.offsets() <<
 		       ", fd=" << request.fd() <<
 		       ")";
diff --git a/bindings/cxx/tests/tests-line-request.cpp b/bindings/cxx/tests/tests-line-request.cpp
index d1a56ae..9632ae0 100644
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
+	expected << "gpiod::line_request(chip=\"" << sim.name() <<
+		    "\", num_lines=4, line_offsets=gpiod::offsets(3, 1, 0, 2), fd=" <<
 		    request.fd() << ")";
 
 	SECTION("active request")
-- 
2.39.2

