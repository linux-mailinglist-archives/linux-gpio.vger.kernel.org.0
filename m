Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6600F5B9693
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 10:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiIOIrm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Sep 2022 04:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbiIOIra (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2022 04:47:30 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A4D39834B
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 01:47:27 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id bg5-20020a05600c3c8500b003a7b6ae4eb2so17242154wmb.4
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 01:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=RpcCGmOggSBEVCJysy5S6DItxV911hRy/ZHWIUonaYw=;
        b=kJq4kjkKb8nZy+1GFI0XVg3TVPiVN/fmX7nT1uKRCjunquW5RFCxN+rwjU+XoLh3Jg
         oPGhFGZQFdkvPkNTJdEVGAXRMEN1+yXh9qCYamKhobVVC+XGna8umBgdrp/3F52jpqBi
         GAoaJG7qxYINa28H/yHkfgDUUH5ZlR2zSumfewCkXRIodODn9RWBCN/NnYY0jN7/wxRr
         hAMvOjzlPaFEO/aHhDHsBh3SElTeoWCgRd5w7AqPEFihvgOftII6r3fEqo0UgJi3kW7g
         EiT0Ka2eLY4p36VpblKR074IdRfsKYa4ees61WcGvfnvRlAMTmAxGmwTrwRwYs8Hkg3k
         al4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=RpcCGmOggSBEVCJysy5S6DItxV911hRy/ZHWIUonaYw=;
        b=2rBQoS5Ot6abyFfgTF2oAK/ZzRZT0w7DKqb4cIp/kFocafJ7iIHrRl8ahgPkjKvriM
         /v8ijR20QJrOjgVnhm5+dN7dSdDSh3RxtnN4x6LJtczf/CnmISzMT1uxfs/tnn+RBRSf
         3d7eiOZyRkR+ab22lqm4Sspy0cY7wFOjFoTB35R/l4UkJm0L+JocVk0nNHvqNYa0a4x9
         esyppmCGhQv0A7WlduVXZMUv7oNYLFctczHqT3QqZCnlmIWhDQeUIly28Zs1c91ZuhTh
         FikcY/2VEQhbJsk+9MME9hIghDlmLbeY9m7T7EPkdXk7VDd4p0iWxx5E8rBtbDJFXkF6
         MGEQ==
X-Gm-Message-State: ACgBeo1JEMgPjybBkyB8QpynaJb/6KfRZF7Na11FQPZQ3zbRdS99ynyF
        z/XzPEiq1NPSWhyAeSoQlGoKNQ==
X-Google-Smtp-Source: AA6agR7MzpwMbRzGY7ml4GPcmANPJlSXN3K7YhNNAg/1tYQhbVcAjYHgA2DA+GiCVIq4mBGZguKY2g==
X-Received: by 2002:a05:600c:217:b0:3b4:9abc:a5d3 with SMTP id 23-20020a05600c021700b003b49abca5d3mr5842706wmi.17.1663231645336;
        Thu, 15 Sep 2022 01:47:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1560:185c:859f:2b3e])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d4585000000b002206203ed3dsm1867237wrq.29.2022.09.15.01.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 01:47:24 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v2] bindings: cxx: tests: use the builder pattern for the GPIO simulator
Date:   Thu, 15 Sep 2022 10:47:23 +0200
Message-Id: <20220915084723.19910-1-brgl@bgdev.pl>
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

In order to make the interface more elegant use the Rust-like builder
pattern for the GPIO simulator class.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 bindings/cxx/tests/gpiosim.cpp            | 261 ++++++++++++----------
 bindings/cxx/tests/gpiosim.hpp            |  65 ++++--
 bindings/cxx/tests/tests-chip-info.cpp    |  22 +-
 bindings/cxx/tests/tests-chip.cpp         |  63 +++---
 bindings/cxx/tests/tests-edge-event.cpp   |  25 ++-
 bindings/cxx/tests/tests-info-event.cpp   |  11 +-
 bindings/cxx/tests/tests-line-info.cpp    |  50 ++---
 bindings/cxx/tests/tests-line-request.cpp |  45 ++--
 bindings/cxx/tests/tests-misc.cpp         |   6 +-
 9 files changed, 316 insertions(+), 232 deletions(-)

diff --git a/bindings/cxx/tests/gpiosim.cpp b/bindings/cxx/tests/gpiosim.cpp
index 402e1f0..0a29efe 100644
--- a/bindings/cxx/tests/gpiosim.cpp
+++ b/bindings/cxx/tests/gpiosim.cpp
@@ -1,15 +1,13 @@
 /* SPDX-License-Identifier: LGPL-3.0-or-later */
 /* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
-#include <functional>
 #include <map>
 #include <system_error>
+#include <utility>
 
 #include "gpiosim.h"
 #include "gpiosim.hpp"
 
-#define NORETURN __attribute__((noreturn))
-
 namespace gpiosim {
 
 namespace {
@@ -19,10 +17,10 @@ const ::std::map<chip::pull, int> pull_mapping = {
 	{ chip::pull::PULL_DOWN,	GPIOSIM_PULL_DOWN }
 };
 
-const ::std::map<chip::hog_direction, int> hog_dir_mapping = {
-	{ chip::hog_direction::INPUT,		GPIOSIM_HOG_DIR_INPUT },
-	{ chip::hog_direction::OUTPUT_HIGH,	GPIOSIM_HOG_DIR_OUTPUT_HIGH },
-	{ chip::hog_direction::OUTPUT_LOW,	GPIOSIM_HOG_DIR_OUTPUT_LOW }
+const ::std::map<chip_builder::hog_direction, int> hog_dir_mapping = {
+	{ chip_builder::hog_direction::INPUT,		GPIOSIM_HOG_DIR_INPUT },
+	{ chip_builder::hog_direction::OUTPUT_HIGH,	GPIOSIM_HOG_DIR_OUTPUT_HIGH },
+	{ chip_builder::hog_direction::OUTPUT_LOW,	GPIOSIM_HOG_DIR_OUTPUT_LOW }
 };
 
 const ::std::map<int, chip::value> value_mapping = {
@@ -82,45 +80,13 @@ bank_ptr make_sim_bank(const dev_ptr& dev)
 	return bank;
 }
 
-NORETURN void throw_invalid_type()
-{
-	throw ::std::logic_error("invalid type for property");
-}
-
-unsigned any_to_unsigned_int(const ::std::any& val)
-{
-	if (val.type() == typeid(int)) {
-		auto num_lines = ::std::any_cast<int>(val);
-		if (num_lines < 0)
-			throw ::std::invalid_argument("negative value not accepted");
-
-		   return static_cast<unsigned int>(num_lines);
-	} else if (val.type() == typeid(unsigned int)) {
-		return ::std::any_cast<unsigned int>(val);
-	}
-
-	throw_invalid_type();
-}
-
-::std::string any_to_string(const ::std::any& val)
-{
-	if (val.type() == typeid(::std::string))
-		return ::std::any_cast<::std::string>(val);
-	else if (val.type() == typeid(const char*))
-		return ::std::any_cast<const char*>(val);
-
-	throw_invalid_type();
-}
-
 } /* namespace */
 
 struct chip::impl
 {
 	impl()
 		: dev(make_sim_dev()),
-		  bank(make_sim_bank(this->dev)),
-		  has_num_lines(false),
-		  has_label(false)
+		  bank(make_sim_bank(this->dev))
 	{
 
 	}
@@ -131,99 +97,32 @@ struct chip::impl
 	impl& operator=(const impl& other) = delete;
 	impl& operator=(impl&& other) = delete;
 
-	static const ::std::map<chip::property,
-				::std::function<void (impl&,
-						      const ::std::any&)>> setter_mapping;
-
-	void set_property(chip::property prop, const ::std::any& val)
-	{
-		setter_mapping.at(prop)(*this, val);
-	}
-
-	void set_num_lines(const ::std::any& val)
-	{
-		if (this->has_num_lines)
-			throw ::std::logic_error("number of lines can be set at most once");
-
-		int ret = ::gpiosim_bank_set_num_lines(this->bank.get(), any_to_unsigned_int(val));
-		if (ret)
-			throw ::std::system_error(errno, ::std::system_category(),
-						  "failed to set the number of lines");
-
-		this->has_num_lines = true;
-	}
-
-	void set_label(const ::std::any& val)
-	{
-		if (this->has_label)
-			throw ::std::logic_error("label can be set at most once");
-
-		int ret = ::gpiosim_bank_set_label(this->bank.get(),
-						   any_to_string(val).c_str());
-		if (ret)
-			throw ::std::system_error(errno, ::std::system_category(),
-						  "failed to set the chip label");
-
-		this->has_label = true;
-	}
-
-	void set_line_name(const ::std::any& val)
-	{
-		auto name = ::std::any_cast<line_name>(val);
-
-		int ret = ::gpiosim_bank_set_line_name(this->bank.get(),
-						       ::std::get<0>(name),
-						       ::std::get<1>(name).c_str());
-		if (ret)
-			throw ::std::system_error(errno, ::std::system_category(),
-						  "failed to set simulated line name");
-	}
-
-	void set_line_hog(const ::std::any& val)
-	{
-		auto hog = ::std::any_cast<line_hog>(val);
-
-		int ret = ::gpiosim_bank_hog_line(this->bank.get(),
-						  ::std::get<0>(hog),
-						  ::std::get<1>(hog).c_str(),
-						  hog_dir_mapping.at(::std::get<2>(hog)));
-		if (ret)
-			throw ::std::system_error(errno, ::std::system_category(),
-						  "failed to hog a simulated line");
-	}
-
 	dev_ptr dev;
 	bank_ptr bank;
-	bool has_num_lines;
-	bool has_label;
 };
 
-const ::std::map<chip::property,
-		 ::std::function<void (chip::impl&,
-				       const ::std::any&)>> chip::impl::setter_mapping = {
-	{ chip::property::NUM_LINES,	&chip::impl::set_num_lines },
-	{ chip::property::LABEL,	&chip::impl::set_label },
-	{ chip::property::LINE_NAME,	&chip::impl::set_line_name },
-	{ chip::property::HOG,		&chip::impl::set_line_hog }
-};
-
-chip::chip(const properties& args)
+chip::chip()
 	: _m_priv(new impl)
 {
-	int ret;
 
-	for (const auto& arg: args)
-		this->_m_priv.get()->set_property(arg.first, arg.second);
+}
+
+chip::chip(chip&& other)
+	: _m_priv(::std::move(other._m_priv))
+{
 
-	ret = ::gpiosim_dev_enable(this->_m_priv->dev.get());
-	if (ret)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "failed to enable the simulated GPIO chip");
 }
 
 chip::~chip()
 {
-	this->_m_priv.reset(nullptr);
+
+}
+
+chip& chip::operator=(chip&& other)
+{
+	this->_m_priv = ::std::move(other._m_priv);
+
+	return *this;
 }
 
 ::std::filesystem::path chip::dev_path() const
@@ -255,4 +154,124 @@ void chip::set_pull(unsigned int offset, pull pull)
 					  "failed to set the pull of simulated GPIO line");
 }
 
+struct chip_builder::impl
+{
+	impl()
+		: num_lines(0),
+		  label(),
+		  line_names(),
+		  hogs()
+	{
+
+	}
+
+	::std::size_t num_lines;
+	::std::string label;
+	::std::map<unsigned int, ::std::string> line_names;
+	::std::map<unsigned int, ::std::pair<::std::string, hog_direction>> hogs;
+};
+
+chip_builder::chip_builder()
+	: _m_priv(new impl)
+{
+
+}
+
+chip_builder::chip_builder(chip_builder&& other)
+	: _m_priv(::std::move(other._m_priv))
+{
+
+}
+
+chip_builder::~chip_builder()
+{
+
+}
+
+chip_builder& chip_builder::operator=(chip_builder&& other)
+{
+	this->_m_priv = ::std::move(other._m_priv);
+
+	return *this;
+}
+
+chip_builder& chip_builder::set_num_lines(::std::size_t num_lines)
+{
+	this->_m_priv->num_lines = num_lines;
+
+	return *this;
+}
+
+chip_builder& chip_builder::set_label(const ::std::string& label)
+{
+	this->_m_priv->label = label;
+
+	return *this;
+}
+
+chip_builder& chip_builder::set_line_name(unsigned int offset, const ::std::string& name)
+{
+	this->_m_priv->line_names[offset] = name;
+
+	return *this;
+}
+
+chip_builder& chip_builder::set_hog(unsigned int offset, const ::std::string& name, hog_direction direction)
+{
+	this->_m_priv->hogs[offset] = { name, direction };
+
+	return *this;
+}
+
+chip chip_builder::build()
+{
+	chip sim;
+	int ret;
+
+	if (this->_m_priv->num_lines) {
+		ret = ::gpiosim_bank_set_num_lines(sim._m_priv->bank.get(),
+						   this->_m_priv->num_lines);
+		if (ret)
+			throw ::std::system_error(errno, ::std::system_category(),
+						  "failed to set number of lines");
+	}
+
+	if (!this->_m_priv->label.empty()) {
+		ret = ::gpiosim_bank_set_label(sim._m_priv->bank.get(),
+					       this->_m_priv->label.c_str());
+		if (ret)
+			throw ::std::system_error(errno, ::std::system_category(),
+						  "failed to set the chip label");
+	}
+
+	for (const auto& name: this->_m_priv->line_names) {
+		ret = ::gpiosim_bank_set_line_name(sim._m_priv->bank.get(),
+						 name.first, name.second.c_str());
+		if (ret)
+			throw ::std::system_error(errno, ::std::system_category(),
+						  "failed to set the line name");
+	}
+
+	for (const auto& hog: this->_m_priv->hogs) {
+		ret = ::gpiosim_bank_hog_line(sim._m_priv->bank.get(), hog.first,
+					      hog.second.first.c_str(),
+					      hog_dir_mapping.at(hog.second.second));
+		if (ret)
+			throw ::std::system_error(errno, ::std::system_category(),
+						  "failed to hog the line");
+	}
+
+	ret = ::gpiosim_dev_enable(sim._m_priv->dev.get());
+	if (ret)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "failed to enable the simulated GPIO device");
+
+	return sim;
+}
+
+chip_builder make_sim()
+{
+	return chip_builder();
+}
+
 } /* namespace gpiosim */
diff --git a/bindings/cxx/tests/gpiosim.hpp b/bindings/cxx/tests/gpiosim.hpp
index 0cdb423..c9300ef 100644
--- a/bindings/cxx/tests/gpiosim.hpp
+++ b/bindings/cxx/tests/gpiosim.hpp
@@ -4,52 +4,32 @@
 #ifndef __GPIOD_CXX_GPIOSIM_HPP__
 #define __GPIOD_CXX_GPIOSIM_HPP__
 
-#include <any>
 #include <filesystem>
 #include <memory>
-#include <tuple>
-#include <utility>
-#include <vector>
 
 namespace gpiosim {
 
+class chip_builder;
+
 class chip
 {
 public:
-	enum class property {
-		NUM_LINES = 1,
-		LABEL,
-		LINE_NAME,
-		HOG
-	};
-
 	enum class pull {
 		PULL_UP = 1,
 		PULL_DOWN
 	};
 
-	enum class hog_direction {
-		INPUT = 1,
-		OUTPUT_HIGH,
-		OUTPUT_LOW
-	};
-
 	enum class value {
 		INACTIVE = 0,
 		ACTIVE = 1
 	};
 
-	using line_name = ::std::tuple<unsigned int, ::std::string>;
-	using line_hog = ::std::tuple<unsigned int, ::std::string, hog_direction>;
-	using properties = ::std::vector<::std::pair<property, ::std::any>>;
-
-	explicit chip(const properties& args = properties());
 	chip(const chip& other) = delete;
-	chip(chip&& other) = delete;
+	chip(chip&& other);
 	~chip();
 
 	chip& operator=(const chip& other) = delete;
-	chip& operator=(chip&& other) = delete;
+	chip& operator=(chip&& other);
 
 	::std::filesystem::path dev_path() const;
 	::std::string name() const;
@@ -57,6 +37,41 @@ public:
 	value get_value(unsigned int offset);
 	void set_pull(unsigned int offset, pull pull);
 
+private:
+
+	chip();
+
+	struct impl;
+
+	::std::unique_ptr<impl> _m_priv;
+
+	friend chip_builder;
+};
+
+class chip_builder
+{
+public:
+	enum class hog_direction {
+		INPUT = 1,
+		OUTPUT_HIGH,
+		OUTPUT_LOW
+	};
+
+	chip_builder();
+	chip_builder(const chip_builder& other) = delete;
+	chip_builder(chip_builder&& other);
+	~chip_builder();
+
+	chip_builder& operator=(const chip_builder& other) = delete;
+	chip_builder& operator=(chip_builder&& other);
+
+	chip_builder& set_num_lines(::std::size_t num_lines);
+	chip_builder& set_label(const ::std::string& label);
+	chip_builder& set_line_name(unsigned int offset, const ::std::string& name);
+	chip_builder& set_hog(unsigned int offset, const ::std::string& name, hog_direction direction);
+
+	chip build();
+
 private:
 
 	struct impl;
@@ -64,6 +79,8 @@ private:
 	::std::unique_ptr<impl> _m_priv;
 };
 
+chip_builder make_sim();
+
 } /* namespace gpiosim */
 
 #endif /* __GPIOD_CXX_GPIOSIM_HPP__ */
diff --git a/bindings/cxx/tests/tests-chip-info.cpp b/bindings/cxx/tests/tests-chip-info.cpp
index a6bb123..717c387 100644
--- a/bindings/cxx/tests/tests-chip-info.cpp
+++ b/bindings/cxx/tests/tests-chip-info.cpp
@@ -8,13 +8,17 @@
 #include "gpiosim.hpp"
 #include "helpers.hpp"
 
-using property = ::gpiosim::chip::property;
+using ::gpiosim::make_sim;
 
 namespace {
 
 TEST_CASE("chip_info properties can be read", "[chip-info][chip]")
 {
-	::gpiosim::chip sim({{ property::NUM_LINES, 8 }, { property::LABEL, "foobar" }});
+	auto sim = make_sim()
+		.set_num_lines(8)
+		.set_label("foobar")
+		.build();
+
 	::gpiod::chip chip(sim.dev_path());
 	auto info = chip.get_info();
 
@@ -36,7 +40,11 @@ TEST_CASE("chip_info properties can be read", "[chip-info][chip]")
 
 TEST_CASE("chip_info can be copied and moved", "[chip-info]")
 {
-	::gpiosim::chip sim({{ property::NUM_LINES, 4 }, { property::LABEL, "foobar" }});
+	auto sim = make_sim()
+		.set_num_lines(4)
+		.set_label("foobar")
+		.build();
+
 	::gpiod::chip chip(sim.dev_path());
 	auto info = chip.get_info();
 
@@ -91,10 +99,10 @@ TEST_CASE("chip_info can be copied and moved", "[chip-info]")
 
 TEST_CASE("stream insertion operator works for chip_info", "[chip-info]")
 {
-	::gpiosim::chip sim({
-		{ property::NUM_LINES, 4 },
-		{ property::LABEL, "foobar" }
-	});
+	auto sim = make_sim()
+		.set_num_lines(4)
+		.set_label("foobar")
+		.build();
 
 	::gpiod::chip chip(sim.dev_path());
 	auto info = chip.get_info();
diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tests-chip.cpp
index f7841dd..c5ec19b 100644
--- a/bindings/cxx/tests/tests-chip.cpp
+++ b/bindings/cxx/tests/tests-chip.cpp
@@ -10,8 +10,7 @@
 #include "gpiosim.hpp"
 #include "helpers.hpp"
 
-using property = ::gpiosim::chip::property;
-using line_name = ::gpiosim::chip::line_name;
+using ::gpiosim::make_sim;
 
 namespace {
 
@@ -19,7 +18,7 @@ TEST_CASE("chip constructor works", "[chip]")
 {
 	SECTION("open an existing GPIO chip")
 	{
-		::gpiosim::chip sim;
+		auto sim = make_sim().build();
 
 		REQUIRE_NOTHROW(::gpiod::chip(sim.dev_path()));
 	}
@@ -44,7 +43,9 @@ TEST_CASE("chip constructor works", "[chip]")
 
 	SECTION("move constructor")
 	{
-		::gpiosim::chip sim({{ property::LABEL, "foobar" }});
+		auto sim = make_sim()
+			.set_label("foobar")
+			.build();
 
 		::gpiod::chip first(sim.dev_path());
 		REQUIRE_THAT(first.get_info().label(), Catch::Equals("foobar"));
@@ -55,12 +56,18 @@ TEST_CASE("chip constructor works", "[chip]")
 
 TEST_CASE("chip operators work", "[chip]")
 {
-	::gpiosim::chip sim({{ property::LABEL, "foobar" }});
+	auto sim = make_sim()
+		.set_label("foobar")
+		.build();
+
 	::gpiod::chip chip(sim.dev_path());
 
 	SECTION("assignment operator")
 	{
-		::gpiosim::chip moved_sim({{ property::LABEL, "moved" }});
+		auto moved_sim = make_sim()
+			.set_label("moved")
+			.build();
+
 		::gpiod::chip moved_chip(moved_sim.dev_path());
 
 		REQUIRE_THAT(chip.get_info().label(), Catch::Equals("foobar"));
@@ -78,7 +85,11 @@ TEST_CASE("chip operators work", "[chip]")
 
 TEST_CASE("chip properties can be read", "[chip]")
 {
-	::gpiosim::chip sim({{ property::NUM_LINES, 8 }, { property::LABEL, "foobar" }});
+	auto sim = make_sim()
+		.set_num_lines(8)
+		.set_label("foobar")
+		.build();
+
 	::gpiod::chip chip(sim.dev_path());
 
 	SECTION("get device path")
@@ -94,13 +105,13 @@ TEST_CASE("chip properties can be read", "[chip]")
 
 TEST_CASE("line lookup by name works", "[chip]")
 {
-	::gpiosim::chip sim({
-		{ property::NUM_LINES, 8 },
-		{ property::LINE_NAME, line_name(0, "foo") },
-		{ property::LINE_NAME, line_name(2, "bar") },
-		{ property::LINE_NAME, line_name(3, "baz") },
-		{ property::LINE_NAME, line_name(5, "xyz") }
-	});
+	auto sim = make_sim()
+		.set_num_lines(8)
+		.set_line_name(0, "foo")
+		.set_line_name(2, "bar")
+		.set_line_name(3, "baz")
+		.set_line_name(5, "xyz")
+		.build();
 
 	::gpiod::chip chip(sim.dev_path());
 
@@ -117,13 +128,13 @@ TEST_CASE("line lookup by name works", "[chip]")
 
 TEST_CASE("line lookup: behavior for duplicate names", "[chip]")
 {
-	::gpiosim::chip sim({
-		{ property::NUM_LINES, 8 },
-		{ property::LINE_NAME, line_name(0, "foo") },
-		{ property::LINE_NAME, line_name(2, "bar") },
-		{ property::LINE_NAME, line_name(3, "baz") },
-		{ property::LINE_NAME, line_name(5, "bar") }
-	});
+	auto sim = make_sim()
+		.set_num_lines(8)
+		.set_line_name(0, "foo")
+		.set_line_name(2, "bar")
+		.set_line_name(3, "baz")
+		.set_line_name(5, "bar")
+		.build();
 
 	::gpiod::chip chip(sim.dev_path());
 
@@ -132,7 +143,7 @@ TEST_CASE("line lookup: behavior for duplicate names", "[chip]")
 
 TEST_CASE("closed chip can no longer be used", "[chip]")
 {
-	::gpiosim::chip sim;
+	auto sim = make_sim().build();
 
 	::gpiod::chip chip(sim.dev_path());
 	chip.close();
@@ -141,10 +152,10 @@ TEST_CASE("closed chip can no longer be used", "[chip]")
 
 TEST_CASE("stream insertion operator works for chip", "[chip]")
 {
-	::gpiosim::chip sim({
-		{ property::NUM_LINES, 4 },
-		{ property::LABEL, "foobar" }
-	});
+	auto sim = make_sim()
+		.set_num_lines(4)
+		.set_label("foobar")
+		.build();
 
 	::gpiod::chip chip(sim.dev_path());
 	::std::stringstream buf;
diff --git a/bindings/cxx/tests/tests-edge-event.cpp b/bindings/cxx/tests/tests-edge-event.cpp
index 04eb57b..ca42c42 100644
--- a/bindings/cxx/tests/tests-edge-event.cpp
+++ b/bindings/cxx/tests/tests-edge-event.cpp
@@ -11,7 +11,7 @@
 #include "gpiosim.hpp"
 #include "helpers.hpp"
 
-using simprop = ::gpiosim::chip::property;
+using ::gpiosim::make_sim;
 using direction = ::gpiod::line::direction;
 using edge = ::gpiod::line::edge;
 using offsets = ::gpiod::line::offsets;
@@ -40,7 +40,7 @@ TEST_CASE("edge_event_buffer capacity settings work", "[edge-event]")
 
 TEST_CASE("edge_event wait timeout", "[edge-event]")
 {
-	::gpiosim::chip sim;
+	auto sim = make_sim().build();
 	::gpiod::chip chip(sim.dev_path());
 
 	auto request = chip.prepare_request()
@@ -56,7 +56,7 @@ TEST_CASE("edge_event wait timeout", "[edge-event]")
 
 TEST_CASE("output mode and edge detection don't work together", "[edge-event]")
 {
-	::gpiosim::chip sim;
+	auto sim = make_sim().build();
 
 	REQUIRE_THROWS_AS(
 		::gpiod::chip(sim.dev_path())
@@ -91,7 +91,10 @@ void trigger_rising_edge_events_on_two_offsets(::gpiosim::chip& sim,
 
 TEST_CASE("waiting for and reading edge events works", "[edge-event]")
 {
-	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	auto sim = make_sim()
+		.set_num_lines(8)
+		.build();
+
 	::gpiod::chip chip(sim.dev_path());
 	::gpiod::edge_event_buffer buffer;
 
@@ -220,7 +223,10 @@ TEST_CASE("waiting for and reading edge events works", "[edge-event]")
 
 TEST_CASE("reading multiple events", "[edge-event]")
 {
-	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	auto sim = make_sim()
+		.set_num_lines(8)
+		.build();
+
 	::gpiod::chip chip(sim.dev_path());
 
 	auto request = chip
@@ -268,7 +274,10 @@ TEST_CASE("reading multiple events", "[edge-event]")
 
 TEST_CASE("edge_event_buffer can be moved", "[edge-event]")
 {
-	::gpiosim::chip sim({{ simprop::NUM_LINES, 2 }});
+	auto sim = make_sim()
+		.set_num_lines(2)
+		.build();
+
 	::gpiod::chip chip(sim.dev_path());
 	::gpiod::edge_event_buffer buffer(13);
 
@@ -313,7 +322,7 @@ TEST_CASE("edge_event_buffer can be moved", "[edge-event]")
 
 TEST_CASE("edge_event can be copied and moved", "[edge-event]")
 {
-	::gpiosim::chip sim;
+	auto sim = make_sim().build();
 	::gpiod::chip chip(sim.dev_path());
 	::gpiod::edge_event_buffer buffer;
 
@@ -378,7 +387,7 @@ TEST_CASE("stream insertion operators work for edge_event and edge_event_buffer"
 	 * edge_event_buffer classes.
 	 */
 
-	::gpiosim::chip sim;
+	auto sim = make_sim().build();
 	::gpiod::chip chip(sim.dev_path());
 	::gpiod::edge_event_buffer buffer;
 	::std::stringstream sbuf, expected;
diff --git a/bindings/cxx/tests/tests-info-event.cpp b/bindings/cxx/tests/tests-info-event.cpp
index 788da8f..2ec5176 100644
--- a/bindings/cxx/tests/tests-info-event.cpp
+++ b/bindings/cxx/tests/tests-info-event.cpp
@@ -11,7 +11,7 @@
 #include "gpiosim.hpp"
 #include "helpers.hpp"
 
-using simprop = ::gpiosim::chip::property;
+using ::gpiosim::make_sim;
 using direction = ::gpiod::line::direction;
 using event_type = ::gpiod::info_event::event_type;
 
@@ -44,7 +44,10 @@ void request_reconfigure_release_line(::gpiod::chip& chip)
 
 TEST_CASE("Lines can be watched", "[info-event][chip]")
 {
-	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	auto sim = make_sim()
+		.set_num_lines(8)
+		.build();
+
 	::gpiod::chip chip(sim.dev_path());
 
 	SECTION("watch_line_info() returns line info")
@@ -102,7 +105,7 @@ TEST_CASE("Lines can be watched", "[info-event][chip]")
 
 TEST_CASE("info_event can be copied and moved", "[info-event]")
 {
-	::gpiosim::chip sim;
+	auto sim = make_sim().build();
 	::gpiod::chip chip(sim.dev_path());
 	::std::stringstream buf, expected;
 
@@ -167,7 +170,7 @@ TEST_CASE("info_event stream insertion operator works", "[info-event][line-info]
 	 * and line_info classes.
 	 */
 
-	::gpiosim::chip sim;
+	auto sim = make_sim().build();
 	::gpiod::chip chip(sim.dev_path());
 	::std::stringstream buf, expected;
 
diff --git a/bindings/cxx/tests/tests-line-info.cpp b/bindings/cxx/tests/tests-line-info.cpp
index e7136f0..1d8c293 100644
--- a/bindings/cxx/tests/tests-line-info.cpp
+++ b/bindings/cxx/tests/tests-line-info.cpp
@@ -8,10 +8,8 @@
 #include "helpers.hpp"
 #include "gpiosim.hpp"
 
-using property = ::gpiosim::chip::property;
-using line_name = ::gpiosim::chip::line_name;
-using line_hog = ::gpiosim::chip::line_hog;
-using hog_dir = ::gpiosim::chip::hog_direction;
+using ::gpiosim::make_sim;
+using hog_dir = ::gpiosim::chip_builder::hog_direction;
 using direction = ::gpiod::line::direction;
 using edge = ::gpiod::line::edge;
 using bias = ::gpiod::line::bias;
@@ -24,11 +22,11 @@ namespace {
 
 TEST_CASE("get_line_info() works", "[chip][line-info]")
 {
-	::gpiosim::chip sim({
-		{ property::NUM_LINES, 8 },
-		{ property::LINE_NAME, line_name(0, "foobar") },
-		{ property::HOG, line_hog(0, "hog", hog_dir::OUTPUT_HIGH ) }
-	});
+	auto sim = make_sim()
+		.set_num_lines(8)
+		.set_line_name(0,  "foobar")
+		.set_hog(0, "hog", hog_dir::OUTPUT_HIGH)
+		.build();
 
 	::gpiod::chip chip(sim.dev_path());
 
@@ -58,15 +56,15 @@ TEST_CASE("get_line_info() works", "[chip][line-info]")
 
 TEST_CASE("line properties can be retrieved", "[line-info]")
 {
-	::gpiosim::chip sim({
-		{ property::NUM_LINES, 8 },
-		{ property::LINE_NAME, line_name(1, "foo") },
-		{ property::LINE_NAME, line_name(2, "bar") },
-		{ property::LINE_NAME, line_name(4, "baz") },
-		{ property::LINE_NAME, line_name(5, "xyz") },
-		{ property::HOG, line_hog(3, "hog3", hog_dir::OUTPUT_HIGH) },
-		{ property::HOG, line_hog(4, "hog4", hog_dir::OUTPUT_LOW) }
-	});
+	auto sim = make_sim()
+		.set_num_lines(8)
+		.set_line_name(1, "foo")
+		.set_line_name(2, "bar")
+		.set_line_name(4, "baz")
+		.set_line_name(5, "xyz")
+		.set_hog(3, "hog3", hog_dir::OUTPUT_HIGH)
+		.set_hog(4, "hog4", hog_dir::OUTPUT_LOW)
+		.build();
 
 	::gpiod::chip chip(sim.dev_path());
 
@@ -92,10 +90,10 @@ TEST_CASE("line properties can be retrieved", "[line-info]")
 
 TEST_CASE("line_info can be copied and moved")
 {
-	::gpiosim::chip sim({
-		{ property::NUM_LINES, 4 },
-		{ property::LINE_NAME, line_name(2, "foobar") }
-	});
+	auto sim = make_sim()
+		.set_num_lines(4)
+		.set_line_name(2, "foobar")
+		.build();
 
 	::gpiod::chip chip(sim.dev_path());
 	auto info = chip.get_line_info(2);
@@ -139,10 +137,10 @@ TEST_CASE("line_info can be copied and moved")
 
 TEST_CASE("line_info stream insertion operator works")
 {
-	::gpiosim::chip sim({
-		{ property::LINE_NAME, line_name(0, "foo") },
-		{ property::HOG, line_hog(0, "hogger", hog_dir::OUTPUT_HIGH) }
-	});
+	auto sim = make_sim()
+		.set_line_name(0, "foo")
+		.set_hog(0, "hogger", hog_dir::OUTPUT_HIGH)
+		.build();
 
 	::gpiod::chip chip(sim.dev_path());
 
diff --git a/bindings/cxx/tests/tests-line-request.cpp b/bindings/cxx/tests/tests-line-request.cpp
index 3e7bcce..d1a56ae 100644
--- a/bindings/cxx/tests/tests-line-request.cpp
+++ b/bindings/cxx/tests/tests-line-request.cpp
@@ -10,7 +10,7 @@
 #include "gpiosim.hpp"
 #include "helpers.hpp"
 
-using simprop = ::gpiosim::chip::property;
+using ::gpiosim::make_sim;
 using offsets = ::gpiod::line::offsets;
 using values = ::gpiod::line::values;
 using direction = ::gpiod::line::direction;
@@ -60,7 +60,10 @@ private:
 
 TEST_CASE("requesting lines behaves correctly with invalid arguments", "[line-request][chip]")
 {
-	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	auto sim = make_sim()
+		.set_num_lines(8)
+		.build();
+
 	::gpiod::chip chip(sim.dev_path());
 
 	SECTION("no offsets")
@@ -96,7 +99,10 @@ TEST_CASE("requesting lines behaves correctly with invalid arguments", "[line-re
 
 TEST_CASE("consumer string is set correctly", "[line-request]")
 {
-	::gpiosim::chip sim({{ simprop::NUM_LINES, 4 }});
+	auto sim = make_sim()
+		.set_num_lines(4)
+		.build();
+
 	::gpiod::chip chip(sim.dev_path());
 	offsets offs({ 3, 0, 2 });
 
@@ -130,7 +136,10 @@ TEST_CASE("consumer string is set correctly", "[line-request]")
 
 TEST_CASE("values can be read", "[line-request]")
 {
-	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	auto sim = make_sim()
+		.set_num_lines(8)
+		.build();
+
 	const offsets offs({ 7, 1, 0, 6, 2 });
 
 	const ::std::vector<pull> pulls({
@@ -230,14 +239,16 @@ TEST_CASE("values can be read", "[line-request]")
 
 TEST_CASE("output values can be set at request time", "[line-request]")
 {
-	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	auto sim = make_sim()
+		.set_num_lines(8)
+		.build();
+
 	::gpiod::chip chip(sim.dev_path());
 	const offsets offs({ 0, 1, 3, 4 });
 
 	::gpiod::line_settings settings;
-	settings
-		.set_direction(direction::OUTPUT)
-		.set_output_value(value::ACTIVE);
+	settings.set_direction(direction::OUTPUT);
+	settings.set_output_value(value::ACTIVE);
 
 	::gpiod::line_config line_cfg;
 	line_cfg.add_line_settings(offs, settings);
@@ -275,7 +286,10 @@ TEST_CASE("output values can be set at request time", "[line-request]")
 
 TEST_CASE("values can be set after requesting lines", "[line-request]")
 {
-	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	auto sim = make_sim()
+		.set_num_lines(8)
+		.build();
+
 	const offsets offs({ 0, 1, 3, 4 });
 
 	auto request = ::gpiod::chip(sim.dev_path())
@@ -339,7 +353,10 @@ TEST_CASE("values can be set after requesting lines", "[line-request]")
 
 TEST_CASE("line_request can be moved", "[line-request]")
 {
-	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	auto sim = make_sim()
+		.set_num_lines(8)
+		.build();
+
 	::gpiod::chip chip(sim.dev_path());
 	const offsets offs({ 3, 1, 0, 2 });
 
@@ -377,7 +394,7 @@ TEST_CASE("line_request can be moved", "[line-request]")
 
 TEST_CASE("released request can no longer be used", "[line-request]")
 {
-	::gpiosim::chip sim;
+	auto sim = make_sim().build();
 
 	auto request = ::gpiod::chip(sim.dev_path())
 		.prepare_request()
@@ -391,7 +408,7 @@ TEST_CASE("released request can no longer be used", "[line-request]")
 
 TEST_CASE("line_request survives parent chip", "[line-request][chip]")
 {
-	::gpiosim::chip sim;
+	auto sim = make_sim().build();
 
 	sim.set_pull(0, pull::PULL_UP);
 
@@ -447,7 +464,9 @@ TEST_CASE("line_request survives parent chip", "[line-request][chip]")
 
 TEST_CASE("line_request stream insertion operator works", "[line-request]")
 {
-	::gpiosim::chip sim({{ simprop::NUM_LINES, 4 }});
+	auto sim = make_sim()
+		.set_num_lines(4)
+		.build();
 
 	auto request = ::gpiod::chip(sim.dev_path())
 		.prepare_request()
diff --git a/bindings/cxx/tests/tests-misc.cpp b/bindings/cxx/tests/tests-misc.cpp
index 7f6bf29..fe8cdea 100644
--- a/bindings/cxx/tests/tests-misc.cpp
+++ b/bindings/cxx/tests/tests-misc.cpp
@@ -11,7 +11,7 @@
 #include "gpiosim.hpp"
 #include "helpers.hpp"
 
-using property = ::gpiosim::chip::property;
+using ::gpiosim::make_sim;
 
 namespace {
 
@@ -48,14 +48,14 @@ TEST_CASE("is_gpiochip_device() works", "[misc][chip]")
 
 	SECTION("is_gpiochip_device() returns true for a GPIO chip")
 	{
-		::gpiosim::chip sim;
+		auto sim = make_sim().build();
 
 		REQUIRE(::gpiod::is_gpiochip_device(sim.dev_path()));
 	}
 
 	SECTION("is_gpiochip_device() can resolve a symlink")
 	{
-		::gpiosim::chip sim;
+		auto sim = make_sim().build();
 		::std::string link("/tmp/gpiod-cxx-tmp-link.");
 
 		link += ::std::to_string(::getpid());
-- 
2.34.1

