Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 121A566A567
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 22:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbjAMVwe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 16:52:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbjAMVwa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 16:52:30 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D6D58F94
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:29 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so1975551wmc.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgI3Fk/2gyiGGUplRcEoLYgVoGEyCL5gPGqpn2TaikQ=;
        b=q68+/sXwusDmmwW92XsrdVJJb3YgBYJh9FrYWP73MrgOLeNV5JHO6v6L1bKnuhpHph
         ZfngntSf6s9m7O7xLW8plNN+b4WSUcC5X7kWvSt2Qh3o5qLhA6+3r7qBkB+cTqb3M+r/
         YgZ/R+Yho/iKPwqYcA+xBx4orrkew1xPrhfVAJfoDsCUXz02WtRa77BqvaVR3w5lUI0n
         EXtA6asv1L1WlzMtKwlxbrGyDnyVogMCDAq46sJzsltYxrebveuMjfTaGfqNAmhw4+wL
         mGMcjrOnOiFeFFEJP2RMym++/4FoEy7vzlxRE0YZXaphopKifQ5Nnl3OxJDJ3J4HDyP4
         b0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgI3Fk/2gyiGGUplRcEoLYgVoGEyCL5gPGqpn2TaikQ=;
        b=2AF3bX7JE3DkSD3pyYkQnKnwLmkUA2AYAXPasQ52C+mQe2B8sM2nQPSsNMxxRzjh7s
         m+9ChrHdARZRrjcQ/YKxgB3BdUSW4A1YcKUonO2NyjcNa2JKdFU2b4N7My2kMKq8LAyh
         C0pGPxRDqNDRXreL4St/T2xvwIDLpAYbnlZ+St2RdcngyNSjw/5JSsVNAZVu9V8vUOXM
         zFVfQZpGMJWmIQknfqmorX5EmbsAjHmIEuD5u6LDqnCITAkUHmZ+Mt4eySft7mzKKs6s
         OzSQQN0A8vWrr3o167eRFRFZNgB33UGw//ejK2D3ut7mntkl3cQd2WZy/1u8TVQJxv1p
         rfTA==
X-Gm-Message-State: AFqh2kqcB19WM1xyEbRmC4JhTZ38gy4F7GAcFScozSJ+EVsPAvEP2rdz
        AthHxAk0tkRrUnRoZGgidwvpdg==
X-Google-Smtp-Source: AMrXdXsrbV3Man8fBOAovMdWUZLVkUvAv9NN4RVUFfAKQYbnCfriCgkRGX7QLzpKvjRoxhuyE+1feA==
X-Received: by 2002:a05:600c:2046:b0:3da:1357:4ca2 with SMTP id p6-20020a05600c204600b003da13574ca2mr6685809wmg.11.1673646748705;
        Fri, 13 Jan 2023 13:52:28 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ba79:38ad:100f:e9ee])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003c70191f267sm33179234wmo.39.2023.01.13.13.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:52:28 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 12/16] bindings: cxx: add line_config.set_output_values()
Date:   Fri, 13 Jan 2023 22:52:06 +0100
Message-Id: <20230113215210.616812-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230113215210.616812-1-brgl@bgdev.pl>
References: <20230113215210.616812-1-brgl@bgdev.pl>
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

