Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9AA67516F
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 10:45:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbjATJpa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 04:45:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjATJp3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 04:45:29 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D69E07AF20
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 01:45:27 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id o17-20020a05600c511100b003db021ef437so3206363wms.4
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 01:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgI3Fk/2gyiGGUplRcEoLYgVoGEyCL5gPGqpn2TaikQ=;
        b=zUP8VBb5cmOSIL81LjrNf895TysTZxzc5GgqOmP4eG4Utp3rSfES5HNZIa0s1ZaJ98
         PzN28NtVK6jR0JrJcM05CiUarLHU+r4raM0WA+UG++B7UpBmZj/MMk4TTF6ADbmULTPS
         aNnGkz0DgEB8m9ds7ssEf81qC+nCzF18h5MtTlyBEsNUkCAeyvdTZA8ZkcBzgobbZN7i
         TQcfcVAf2MJpZQ7ESwF2ym+DmUfiWiFlWHjTm/9W4FHOi1H8jFdIpo9SFWO32nqaOpF3
         3RUneWBL8xN6nDELWkqvZLES3/fl8KD/PSOpbTAsWvsKx+b8S9aUSA9cYfD62Nk5lmp3
         g/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgI3Fk/2gyiGGUplRcEoLYgVoGEyCL5gPGqpn2TaikQ=;
        b=GtLrdG3YxYz88yOMspp85kdsKJCEtPHDZqOhYb3C+sbIrY6Lou0R8LWQaOUcC2RdHQ
         BbRGM0MerZkPq49hYmuIwMM+ADb6JyufYVLe7c1LzATaJasKM8KJQSlO2yxMAEbblh04
         xWdASAHBpKmwW5kHkLAO8Y4KW1xCT0fFMlopTio90u0xWhvcs/HYeGy60rRZ7GpsfP5v
         ThK8YwNwhYDvn5SqEOgrb+Mldbh5Nb2NG04dCp2SzOvC/h67oM2OBhT3w2yKUpQZajF+
         FRrzFBmiEGSD7iyWJrEshcIMKyRSSC8uXCuQ4mWvbdVSfRzn3znI9ZlmfE2Jmwm9qWw6
         aKNQ==
X-Gm-Message-State: AFqh2kp6ED0wZAJEfHeyWvJVlUVCxCKYL3TdpyFooTlaRWBjl7oDxJLL
        C28oWdHgN/GoZ1n7h7IMfF8gMg==
X-Google-Smtp-Source: AMrXdXue0oH8uHP2vxwMu5rH2Fp8f1Y6PsyNEWKDEENGbkPocJHI3TyBLsedSKglLLRlXfNbxJWLEQ==
X-Received: by 2002:a05:600c:3b07:b0:3d1:cdf7:debf with SMTP id m7-20020a05600c3b0700b003d1cdf7debfmr12893471wms.26.1674207926441;
        Fri, 20 Jan 2023 01:45:26 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:580c:7b02:3ffd:b2e])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c445100b003d9e74dd9b2sm1800485wmn.9.2023.01.20.01.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 01:45:25 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 5/8] bindings: cxx: add line_config.set_output_values()
Date:   Fri, 20 Jan 2023 10:45:12 +0100
Message-Id: <20230120094515.40464-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120094515.40464-1-brgl@bgdev.pl>
References: <20230120094515.40464-1-brgl@bgdev.pl>
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

Extend line_config to expose a new method - set_output_values() - which
wraps the new C function for setting multiple output values at once.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/gpiodcxx/line-config.hpp    |  7 ++++
 bindings/cxx/internal.hpp                |  1 +
 bindings/cxx/line-config.cpp             | 15 +++++++
 bindings/cxx/line-settings.cpp           |  5 +++
 bindings/cxx/tests/tests-line-config.cpp | 51 ++++++++++++++++++++++++
 5 files changed, 79 insertions(+)

diff --git a/bindings/cxx/gpiodcxx/line-config.hpp b/bindings/cxx/gpiodcxx/line-config.hpp
index a917913..b76fdff 100644
--- a/bindings/cxx/gpiodcxx/line-config.hpp
+++ b/bindings/cxx/gpiodcxx/line-config.hpp
@@ -76,6 +76,13 @@ public:
 	 */
 	line_config& add_line_settings(const line::offsets& offsets, const line_settings& settings);
 
+	/**
+	 * @brief Set output values for a number of lines.
+	 * @param values Buffer containing the output values.
+	 * @return Reference to self.
+	 */
+	line_config& set_output_values(const line::values& values);
+
 	/**
 	 * @brief Get a mapping of offsets to line settings stored by this
 	 *        object.
diff --git a/bindings/cxx/internal.hpp b/bindings/cxx/internal.hpp
index 6aceac1..8322e12 100644
--- a/bindings/cxx/internal.hpp
+++ b/bindings/cxx/internal.hpp
@@ -31,6 +31,7 @@ map_enum_c_to_cxx(c_enum_type value, const ::std::map<c_enum_type, cxx_enum_type
 }
 
 void throw_from_errno(const ::std::string& what);
+::gpiod_line_value map_output_value(line::value value);
 
 template<class T, void F(T*)> struct deleter
 {
diff --git a/bindings/cxx/line-config.cpp b/bindings/cxx/line-config.cpp
index 3ec99f0..233ba33 100644
--- a/bindings/cxx/line-config.cpp
+++ b/bindings/cxx/line-config.cpp
@@ -100,6 +100,21 @@ GPIOD_CXX_API line_config& line_config::add_line_settings(const line::offsets& o
 	return *this;
 }
 
+GPIOD_CXX_API line_config& line_config::set_output_values(const line::values& values)
+{
+	::std::vector<::gpiod_line_value> mapped_values(values.size());
+
+	for (unsigned int i = 0; i < values.size(); i++)
+		mapped_values[i] = map_output_value(values[i]);
+
+	auto ret = ::gpiod_line_config_set_output_values(this->_m_priv->config.get(),
+							 mapped_values.data(), mapped_values.size());
+	if (ret)
+		throw_from_errno("unable to set output values");
+
+	return *this;
+}
+
 GPIOD_CXX_API ::std::map<line::offset, line_settings> line_config::get_line_settings() const
 {
 	::std::size_t num_offsets = ::gpiod_line_config_get_num_configured_offsets(
diff --git a/bindings/cxx/line-settings.cpp b/bindings/cxx/line-settings.cpp
index 32f21a3..2159062 100644
--- a/bindings/cxx/line-settings.cpp
+++ b/bindings/cxx/line-settings.cpp
@@ -139,6 +139,11 @@ cxx_enum_type get_mapped_value(::gpiod_line_settings* settings,
 
 } /* namespace */
 
+::gpiod_line_value map_output_value(line::value value)
+{
+	return do_map_value(value, value_mapping);
+}
+
 line_settings::impl::impl()
 	: settings(make_line_settings())
 {
diff --git a/bindings/cxx/tests/tests-line-config.cpp b/bindings/cxx/tests/tests-line-config.cpp
index 5fa0f94..5e439a1 100644
--- a/bindings/cxx/tests/tests-line-config.cpp
+++ b/bindings/cxx/tests/tests-line-config.cpp
@@ -4,12 +4,17 @@
 #include <catch2/catch.hpp>
 #include <gpiod.hpp>
 
+#include "gpiosim.hpp"
 #include "helpers.hpp"
 
+using ::gpiosim::make_sim;
 using namespace ::std::chrono_literals;
 using direction = ::gpiod::line::direction;
 using drive = ::gpiod::line::drive;
 using edge = ::gpiod::line::edge;
+using simval = ::gpiosim::chip::value;
+using value = ::gpiod::line::value;
+using values = ::gpiod::line::values;
 
 namespace {
 
@@ -72,6 +77,52 @@ TEST_CASE("line_config can be reset", "[line-config]")
 	REQUIRE(cfg.get_line_settings().size() == 0);
 }
 
+TEST_CASE("output values can be set globally", "[line-config]")
+{
+	const values vals = { value::ACTIVE, value::INACTIVE, value::ACTIVE, value::INACTIVE };
+
+	auto sim = make_sim()
+		.set_num_lines(4)
+		.build();
+
+	::gpiod::line_config cfg;
+
+	SECTION("request with globally set output values")
+	{
+		cfg
+			.add_line_settings(
+				{0, 1, 2, 3},
+				::gpiod::line_settings().set_direction(direction::OUTPUT)
+			)
+			.set_output_values(vals);
+
+		auto request = ::gpiod::chip(sim.dev_path())
+			.prepare_request()
+			.set_line_config(cfg)
+			.do_request();
+
+		REQUIRE(sim.get_value(0) == simval::ACTIVE);
+		REQUIRE(sim.get_value(1) == simval::INACTIVE);
+		REQUIRE(sim.get_value(2) == simval::ACTIVE);
+		REQUIRE(sim.get_value(3) == simval::INACTIVE);
+	}
+
+	SECTION("read back global output values")
+	{
+		cfg
+			.add_line_settings(
+				{0, 1, 2, 3},
+				::gpiod::line_settings()
+					.set_direction(direction::OUTPUT)
+					.set_output_value(value::ACTIVE)
+			)
+			.set_output_values(vals);
+
+		auto settings = cfg.get_line_settings()[1];
+		REQUIRE(settings.output_value() == value::INACTIVE);
+	}
+}
+
 TEST_CASE("line_config stream insertion operator works", "[line-config]")
 {
 	::gpiod::line_config cfg;
-- 
2.37.2

