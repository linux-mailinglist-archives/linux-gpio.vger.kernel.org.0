Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C909650FD94
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Apr 2022 14:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348793AbiDZMyH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Apr 2022 08:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350253AbiDZMyE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2022 08:54:04 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4726047057
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 05:50:54 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id e24so5449994wrc.9
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 05:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rg333NoevqtNXQI9s204bwnkJivIV1lxMW9pljjB68o=;
        b=r9o+0fC/YM4D/Os4gBjYuTR5XrljkphppyJThwGDCprgeKaJe6DeVPRCyu1FrtWrHq
         eqNZxlatyP8oaRWQmun+qfYPZS+B8p95siH+bT2ZQjSY1HcEg6N+IP3FAgAwFT/BZGwu
         MYooHiJ5rxHWQBdDNAy8YcwItcNDIIHhh3JrZiv6LIGb5TjWRa2gvg2yLr4iuLulyliW
         Yt33adFpwIAxvNq1Bewhrvq00yQEkBUCdYsTKW38zrU2n4JtK1zrVWr3gcl8Xr+uNi4l
         yndwyH50pzwVarC3jZ7baRNGSSmpYASW4aCpFBcM/a9W3kRtuP0sn0A5E++QX3rpcO0F
         Kf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rg333NoevqtNXQI9s204bwnkJivIV1lxMW9pljjB68o=;
        b=lDjU12NXUMCHj5MYjp1U86YaSRpTvoJb0LkW5y6Uq1Hv8zE5pcE/iPdFZZhSG7zcK8
         DudwJNGXsBngft3Pls484sMCYtT9ML5L0nxqVkvn7f9Blz5uTamG+mLgwPMmbiQ99tm9
         BbFD2vopVoukQyBtTV8RtjmN+1zQCLHlGuPqDnZdA214q4ZuWqdLzPOyFLQhEPncCDZO
         atYWCoQxPGib08N3G40lkyUpDg9x1fCjm5hpbwsEmKsGsDlDtpe3hoMspBuBK/WHYTVe
         q/VS+xe0Y82oB65jJjo6grFTEy0Y6xJjaFInjb24eA4sfzdrdwuj+C17VqK6LUfT/F8q
         5jhg==
X-Gm-Message-State: AOAM530KzKVoh8ITnmHqAlZIiqC4rFAaCubTb72oUmE7MEKAYxdD6vTI
        qyZep+KCJfWjndTX+RpgFMzFAQ==
X-Google-Smtp-Source: ABdhPJwNvqKb9SIm/P8wuCMSaEPekS1GOC13aBPLJkgBEbCFpkZoIWHIdmrEgiU6CuHHtCBR58/puA==
X-Received: by 2002:adf:f710:0:b0:20a:e189:9983 with SMTP id r16-20020adff710000000b0020ae1899983mr4340512wrp.24.1650977452337;
        Tue, 26 Apr 2022 05:50:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:faf0:6ae0:9a53:ee37])
        by smtp.gmail.com with ESMTPSA id n20-20020a05600c3b9400b00393ea849663sm6128600wms.30.2022.04.26.05.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 05:50:51 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexander Stein <alexander.stein@mailbox.org>,
        David Kozub <zub@linux.fjfi.cvut.cz>,
        =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
        Michael Beach <michaelb@ieee.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v6 3/5] bindings: cxx: add v2 tests
Date:   Tue, 26 Apr 2022 14:50:21 +0200
Message-Id: <20220426125023.2664623-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220426125023.2664623-1-brgl@bgdev.pl>
References: <20220426125023.2664623-1-brgl@bgdev.pl>
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

This adds the tests for the v2 C++ bindings.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 bindings/cxx/tests/.gitignore               |   4 +
 bindings/cxx/tests/Makefile.am              |  31 ++
 bindings/cxx/tests/check-kernel.cpp         |  48 ++
 bindings/cxx/tests/gpiod-cxx-test-main.cpp  |   5 +
 bindings/cxx/tests/gpiosim.cpp              | 258 +++++++++++
 bindings/cxx/tests/gpiosim.hpp              |  69 +++
 bindings/cxx/tests/helpers.cpp              |  37 ++
 bindings/cxx/tests/helpers.hpp              |  62 +++
 bindings/cxx/tests/tests-chip-info.cpp      | 109 +++++
 bindings/cxx/tests/tests-chip.cpp           | 171 +++++++
 bindings/cxx/tests/tests-edge-event.cpp     | 417 +++++++++++++++++
 bindings/cxx/tests/tests-info-event.cpp     | 198 ++++++++
 bindings/cxx/tests/tests-line-config.cpp    | 270 +++++++++++
 bindings/cxx/tests/tests-line-info.cpp      | 156 +++++++
 bindings/cxx/tests/tests-line-request.cpp   | 490 ++++++++++++++++++++
 bindings/cxx/tests/tests-line.cpp           | 137 ++++++
 bindings/cxx/tests/tests-misc.cpp           |  78 ++++
 bindings/cxx/tests/tests-request-config.cpp | 155 +++++++
 18 files changed, 2695 insertions(+)
 create mode 100644 bindings/cxx/tests/.gitignore
 create mode 100644 bindings/cxx/tests/Makefile.am
 create mode 100644 bindings/cxx/tests/check-kernel.cpp
 create mode 100644 bindings/cxx/tests/gpiod-cxx-test-main.cpp
 create mode 100644 bindings/cxx/tests/gpiosim.cpp
 create mode 100644 bindings/cxx/tests/gpiosim.hpp
 create mode 100644 bindings/cxx/tests/helpers.cpp
 create mode 100644 bindings/cxx/tests/helpers.hpp
 create mode 100644 bindings/cxx/tests/tests-chip-info.cpp
 create mode 100644 bindings/cxx/tests/tests-chip.cpp
 create mode 100644 bindings/cxx/tests/tests-edge-event.cpp
 create mode 100644 bindings/cxx/tests/tests-info-event.cpp
 create mode 100644 bindings/cxx/tests/tests-line-config.cpp
 create mode 100644 bindings/cxx/tests/tests-line-info.cpp
 create mode 100644 bindings/cxx/tests/tests-line-request.cpp
 create mode 100644 bindings/cxx/tests/tests-line.cpp
 create mode 100644 bindings/cxx/tests/tests-misc.cpp
 create mode 100644 bindings/cxx/tests/tests-request-config.cpp

diff --git a/bindings/cxx/tests/.gitignore b/bindings/cxx/tests/.gitignore
new file mode 100644
index 0000000..7990193
--- /dev/null
+++ b/bindings/cxx/tests/.gitignore
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+gpiod-cxx-test
diff --git a/bindings/cxx/tests/Makefile.am b/bindings/cxx/tests/Makefile.am
new file mode 100644
index 0000000..1314103
--- /dev/null
+++ b/bindings/cxx/tests/Makefile.am
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+AM_CPPFLAGS = -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
+AM_CPPFLAGS += -I$(top_srcdir)/tests/gpiosim/
+AM_CPPFLAGS += -Wall -Wextra -g -std=gnu++17 $(CATCH2_CFLAGS)
+AM_CPPFLAGS += $(PROFILING_CFLAGS)
+AM_LDFLAGS = -lgpiodcxx -L$(top_builddir)/bindings/cxx/
+AM_LDFLAGS += -lgpiosim -L$(top_builddir)/tests/gpiosim/
+AM_LDFLAGS += $(PROFILING_LDFLAGS)
+AM_LDFLAGS += -pthread
+
+bin_PROGRAMS = gpiod-cxx-test
+
+gpiod_cxx_test_SOURCES =			\
+		check-kernel.cpp		\
+		gpiod-cxx-test-main.cpp		\
+		gpiosim.cpp			\
+		gpiosim.hpp			\
+		helpers.cpp			\
+		helpers.hpp			\
+		tests-chip.cpp			\
+		tests-chip-info.cpp		\
+		tests-edge-event.cpp		\
+		tests-line.cpp			\
+		tests-line-config.cpp		\
+		tests-line-info.cpp		\
+		tests-line-request.cpp		\
+		tests-info-event.cpp		\
+		tests-misc.cpp			\
+		tests-request-config.cpp
diff --git a/bindings/cxx/tests/check-kernel.cpp b/bindings/cxx/tests/check-kernel.cpp
new file mode 100644
index 0000000..9bdd1e6
--- /dev/null
+++ b/bindings/cxx/tests/check-kernel.cpp
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <linux/version.h>
+#include <sys/utsname.h>
+#include <system_error>
+#include <sstream>
+
+namespace {
+
+class kernel_checker
+{
+public:
+	kernel_checker(int major, int minor, int release)
+	{
+		int curr_major, curr_minor, curr_release, curr_ver, req_ver;
+		::std::string major_str, minor_str, release_str;
+		::utsname un;
+		int ret;
+
+		ret = ::uname(::std::addressof(un));
+		if (ret)
+			throw ::std::system_error(errno, ::std::system_category(),
+						  "unable to read the kernel version");
+
+		::std::stringstream ver_stream(::std::string(un.release));
+		::std::getline(ver_stream, major_str, '.');
+		::std::getline(ver_stream, minor_str, '.');
+		::std::getline(ver_stream, release_str, '-');
+
+		curr_major = ::std::stoi(major_str, nullptr, 0);
+		curr_minor = ::std::stoi(minor_str, nullptr, 0);
+		curr_release = ::std::stoi(release_str, nullptr, 0);
+
+		curr_ver = KERNEL_VERSION(curr_major, curr_minor, curr_release);
+		req_ver = KERNEL_VERSION(major, minor, release);
+
+		if (curr_ver < req_ver)
+			throw ::std::runtime_error("kernel release must be at least: " +
+						   ::std::to_string(major) + "." +
+						   ::std::to_string(minor) + "." +
+						   ::std::to_string(release));
+	}
+};
+
+kernel_checker require_kernel(5, 17, 0);
+
+} /* namespace */
diff --git a/bindings/cxx/tests/gpiod-cxx-test-main.cpp b/bindings/cxx/tests/gpiod-cxx-test-main.cpp
new file mode 100644
index 0000000..11bf8e5
--- /dev/null
+++ b/bindings/cxx/tests/gpiod-cxx-test-main.cpp
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+#define CATCH_CONFIG_MAIN
+#include <catch2/catch.hpp>
diff --git a/bindings/cxx/tests/gpiosim.cpp b/bindings/cxx/tests/gpiosim.cpp
new file mode 100644
index 0000000..408ad81
--- /dev/null
+++ b/bindings/cxx/tests/gpiosim.cpp
@@ -0,0 +1,258 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+#include <functional>
+#include <map>
+#include <system_error>
+
+#include "gpiosim.h"
+#include "gpiosim.hpp"
+
+#define NORETURN __attribute__((noreturn))
+
+namespace gpiosim {
+
+namespace {
+
+const ::std::map<chip::pull, int> pull_mapping = {
+	{ chip::pull::PULL_UP,		GPIOSIM_PULL_UP },
+	{ chip::pull::PULL_DOWN,	GPIOSIM_PULL_DOWN }
+};
+
+const ::std::map<chip::hog_direction, int> hog_dir_mapping = {
+	{ chip::hog_direction::INPUT,		GPIOSIM_HOG_DIR_INPUT },
+	{ chip::hog_direction::OUTPUT_HIGH,	GPIOSIM_HOG_DIR_OUTPUT_HIGH },
+	{ chip::hog_direction::OUTPUT_LOW,	GPIOSIM_HOG_DIR_OUTPUT_LOW }
+};
+
+const ::std::map<int, chip::value> value_mapping = {
+	{ GPIOSIM_VALUE_INACTIVE,	chip::value::INACTIVE },
+	{ GPIOSIM_VALUE_ACTIVE,		chip::value::ACTIVE }
+};
+
+template<class gpiosim_type, void free_func(gpiosim_type*)> struct deleter
+{
+	void operator()(gpiosim_type* ptr)
+	{
+		free_func(ptr);
+	}
+};
+
+using ctx_deleter = deleter<::gpiosim_ctx, ::gpiosim_ctx_unref>;
+using dev_deleter = deleter<::gpiosim_dev, ::gpiosim_dev_unref>;
+using bank_deleter = deleter<::gpiosim_bank, ::gpiosim_bank_unref>;
+
+using ctx_ptr = ::std::unique_ptr<::gpiosim_ctx, ctx_deleter>;
+using dev_ptr = ::std::unique_ptr<::gpiosim_dev, dev_deleter>;
+using bank_ptr = ::std::unique_ptr<::gpiosim_bank, bank_deleter>;
+
+ctx_ptr sim_ctx;
+
+class sim_ctx_initializer
+{
+public:
+	sim_ctx_initializer(void)
+	{
+		sim_ctx.reset(gpiosim_ctx_new());
+		if (!sim_ctx)
+			throw ::std::system_error(errno, ::std::system_category(),
+						  "unable to create the GPIO simulator context");
+	}
+};
+
+dev_ptr make_sim_dev(void)
+{
+	static sim_ctx_initializer ctx_initializer;
+
+	dev_ptr dev(::gpiosim_dev_new(sim_ctx.get()));
+	if (!dev)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "failed to create a new GPIO simulator device");
+
+	return dev;
+}
+
+bank_ptr make_sim_bank(const dev_ptr& dev)
+{
+	bank_ptr bank(::gpiosim_bank_new(dev.get()));
+	if (!bank)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "failed to create a new GPIO simulator bank");
+
+	return bank;
+}
+
+NORETURN void throw_invalid_type(void)
+{
+	throw ::std::logic_error("invalid type for property");
+}
+
+unsigned any_to_unsigned_int(const ::std::any& val)
+{
+	if (val.type() == typeid(int)) {
+		auto num_lines = ::std::any_cast<int>(val);
+		if (num_lines < 0)
+			throw ::std::invalid_argument("negative value not accepted");
+
+		   return static_cast<unsigned int>(num_lines);
+	} else if (val.type() == typeid(unsigned int)) {
+		return ::std::any_cast<unsigned int>(val);
+	}
+
+	throw_invalid_type();
+}
+
+::std::string any_to_string(const ::std::any& val)
+{
+	if (val.type() == typeid(::std::string))
+		return ::std::any_cast<::std::string>(val);
+	else if (val.type() == typeid(const char*))
+		return ::std::any_cast<const char*>(val);
+
+	throw_invalid_type();
+}
+
+} /* namespace */
+
+struct chip::impl
+{
+	impl(void)
+		: dev(make_sim_dev()),
+		  bank(make_sim_bank(this->dev)),
+		  has_num_lines(false),
+		  has_label(false)
+	{
+
+	}
+
+	impl(const impl& other) = delete;
+	impl(impl&& other) = delete;
+	~impl(void) = default;
+	impl& operator=(const impl& other) = delete;
+	impl& operator=(impl&& other) = delete;
+
+	static const ::std::map<chip::property,
+				::std::function<void (impl&,
+						      const ::std::any&)>> setter_mapping;
+
+	void set_property(chip::property prop, const ::std::any& val)
+	{
+		setter_mapping.at(prop)(*this, val);
+	}
+
+	void set_num_lines(const ::std::any& val)
+	{
+		if (this->has_num_lines)
+			throw ::std::logic_error("number of lines can be set at most once");
+
+		int ret = ::gpiosim_bank_set_num_lines(this->bank.get(), any_to_unsigned_int(val));
+		if (ret)
+			throw ::std::system_error(errno, ::std::system_category(),
+						  "failed to set the number of lines");
+
+		this->has_num_lines = true;
+	}
+
+	void set_label(const ::std::any& val)
+	{
+		if (this->has_label)
+			throw ::std::logic_error("label can be set at most once");
+
+		int ret = ::gpiosim_bank_set_label(this->bank.get(),
+						   any_to_string(val).c_str());
+		if (ret)
+			throw ::std::system_error(errno, ::std::system_category(),
+						  "failed to set the chip label");
+
+		this->has_label = true;
+	}
+
+	void set_line_name(const ::std::any& val)
+	{
+		auto name = ::std::any_cast<line_name>(val);
+
+		int ret = ::gpiosim_bank_set_line_name(this->bank.get(),
+						       ::std::get<0>(name),
+						       ::std::get<1>(name).c_str());
+		if (ret)
+			throw ::std::system_error(errno, ::std::system_category(),
+						  "failed to set simulated line name");
+	}
+
+	void set_line_hog(const ::std::any& val)
+	{
+		auto hog = ::std::any_cast<line_hog>(val);
+
+		int ret = ::gpiosim_bank_hog_line(this->bank.get(),
+						  ::std::get<0>(hog),
+						  ::std::get<1>(hog).c_str(),
+						  hog_dir_mapping.at(::std::get<2>(hog)));
+		if (ret)
+			throw ::std::system_error(errno, ::std::system_category(),
+						  "failed to hog a simulated line");
+	}
+
+	dev_ptr dev;
+	bank_ptr bank;
+	bool has_num_lines;
+	bool has_label;
+};
+
+const ::std::map<chip::property,
+		 ::std::function<void (chip::impl&,
+				       const ::std::any&)>> chip::impl::setter_mapping = {
+	{ chip::property::NUM_LINES,	&chip::impl::set_num_lines },
+	{ chip::property::LABEL,	&chip::impl::set_label },
+	{ chip::property::LINE_NAME,	&chip::impl::set_line_name },
+	{ chip::property::HOG,		&chip::impl::set_line_hog }
+};
+
+chip::chip(const properties& args)
+	: _m_priv(new impl)
+{
+	int ret;
+
+	for (const auto& arg: args)
+		this->_m_priv.get()->set_property(arg.first, arg.second);
+
+	ret = ::gpiosim_dev_enable(this->_m_priv->dev.get());
+	if (ret)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "failed to enable the simulated GPIO chip");
+}
+
+chip::~chip(void)
+{
+	this->_m_priv.reset(nullptr);
+}
+
+::std::filesystem::path chip::dev_path(void) const
+{
+	return ::gpiosim_bank_get_dev_path(this->_m_priv->bank.get());
+}
+
+::std::string chip::name(void) const
+{
+	return ::gpiosim_bank_get_chip_name(this->_m_priv->bank.get());
+}
+
+chip::value chip::get_value(unsigned int offset)
+{
+	int val = ::gpiosim_bank_get_value(this->_m_priv->bank.get(), offset);
+	if (val < 0)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "failed to read the simulated GPIO line value");
+
+	return value_mapping.at(val);
+}
+
+void chip::set_pull(unsigned int offset, pull pull)
+{
+	int ret = ::gpiosim_bank_set_pull(this->_m_priv->bank.get(),
+					  offset, pull_mapping.at(pull));
+	if (ret)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "failed to set the pull of simulated GPIO line");
+}
+
+} /* namespace gpiosim */
diff --git a/bindings/cxx/tests/gpiosim.hpp b/bindings/cxx/tests/gpiosim.hpp
new file mode 100644
index 0000000..53870c1
--- /dev/null
+++ b/bindings/cxx/tests/gpiosim.hpp
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+#ifndef __GPIOD_CXX_GPIOSIM_HPP__
+#define __GPIOD_CXX_GPIOSIM_HPP__
+
+#include <any>
+#include <filesystem>
+#include <memory>
+#include <tuple>
+#include <utility>
+#include <vector>
+
+namespace gpiosim {
+
+class chip
+{
+public:
+	enum class property {
+		NUM_LINES = 1,
+		LABEL,
+		LINE_NAME,
+		HOG
+	};
+
+	enum class pull {
+		PULL_UP = 1,
+		PULL_DOWN
+	};
+
+	enum class hog_direction {
+		INPUT = 1,
+		OUTPUT_HIGH,
+		OUTPUT_LOW
+	};
+
+	enum class value {
+		INACTIVE = 0,
+		ACTIVE = 1
+	};
+
+	using line_name = ::std::tuple<unsigned int, ::std::string>;
+	using line_hog = ::std::tuple<unsigned int, ::std::string, hog_direction>;
+	using properties = ::std::vector<::std::pair<property, ::std::any>>;
+
+	explicit chip(const properties& args = properties());
+	chip(const chip& other) = delete;
+	chip(chip&& other) = delete;
+	~chip(void);
+
+	chip& operator=(const chip& other) = delete;
+	chip& operator=(chip&& other) = delete;
+
+	::std::filesystem::path dev_path(void) const;
+	::std::string name(void) const;
+
+	value get_value(unsigned int offset);
+	void set_pull(unsigned int offset, pull pull);
+
+private:
+
+	struct impl;
+
+	::std::unique_ptr<impl> _m_priv;
+};
+
+} /* namespace gpiosim */
+
+#endif /* __GPIOD_CXX_GPIOSIM_HPP__ */
diff --git a/bindings/cxx/tests/helpers.cpp b/bindings/cxx/tests/helpers.cpp
new file mode 100644
index 0000000..b82d03b
--- /dev/null
+++ b/bindings/cxx/tests/helpers.cpp
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "helpers.hpp"
+
+system_error_matcher::system_error_matcher(int expected_errno)
+	: _m_cond(::std::system_category().default_error_condition(expected_errno))
+{
+
+}
+
+::std::string system_error_matcher::describe(void) const
+{
+	return "matches: errno " + ::std::to_string(this->_m_cond.value());
+}
+
+bool system_error_matcher::match(const ::std::system_error& error) const
+{
+	return error.code().value() == this->_m_cond.value();
+}
+
+regex_matcher::regex_matcher(const ::std::string& pattern)
+	: _m_pattern(pattern),
+	  _m_repr("matches: regex \"" + pattern + "\"")
+{
+
+}
+
+::std::string regex_matcher::describe(void) const
+{
+	return this->_m_repr;
+}
+
+bool regex_matcher::match(const ::std::string& str) const
+{
+	return ::std::regex_match(str, this->_m_pattern);
+}
diff --git a/bindings/cxx/tests/helpers.hpp b/bindings/cxx/tests/helpers.hpp
new file mode 100644
index 0000000..fca7a1d
--- /dev/null
+++ b/bindings/cxx/tests/helpers.hpp
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+#ifndef __GPIOD_CXX_TEST_HELPERS_HPP__
+#define __GPIOD_CXX_TEST_HELPERS_HPP__
+
+#include <catch2/catch.hpp>
+#include <regex>
+#include <string>
+#include <sstream>
+#include <system_error>
+
+class system_error_matcher : public Catch::MatcherBase<::std::system_error>
+{
+public:
+	explicit system_error_matcher(int expected_errno);
+	::std::string describe(void) const override;
+	bool match(const ::std::system_error& error) const override;
+
+private:
+	::std::error_condition _m_cond;
+};
+
+class regex_matcher : public Catch::MatcherBase<::std::string>
+{
+public:
+	explicit regex_matcher(const ::std::string& pattern);
+	::std::string describe(void) const override;
+	bool match(const ::std::string& str) const override;
+
+private:
+	::std::regex _m_pattern;
+	::std::string _m_repr;
+};
+
+template<class T> class stringify_matcher : public Catch::MatcherBase<T>
+{
+public:
+	explicit stringify_matcher(const ::std::string& expected) : _m_expected(expected)
+	{
+
+	}
+
+	::std::string describe(void) const override
+	{
+		return "equals " + this->_m_expected;
+	}
+
+	bool match(const T& obj) const override
+	{
+		::std::stringstream buf;
+
+		buf << obj;
+
+		return buf.str() == this->_m_expected;
+	}
+
+private:
+	::std::string _m_expected;
+};
+
+#endif /* __GPIOD_CXX_TEST_HELPERS_HPP__ */
diff --git a/bindings/cxx/tests/tests-chip-info.cpp b/bindings/cxx/tests/tests-chip-info.cpp
new file mode 100644
index 0000000..a6bb123
--- /dev/null
+++ b/bindings/cxx/tests/tests-chip-info.cpp
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <gpiod.hpp>
+#include <sstream>
+
+#include "gpiosim.hpp"
+#include "helpers.hpp"
+
+using property = ::gpiosim::chip::property;
+
+namespace {
+
+TEST_CASE("chip_info properties can be read", "[chip-info][chip]")
+{
+	::gpiosim::chip sim({{ property::NUM_LINES, 8 }, { property::LABEL, "foobar" }});
+	::gpiod::chip chip(sim.dev_path());
+	auto info = chip.get_info();
+
+	SECTION("get chip name")
+	{
+		REQUIRE_THAT(info.name(), Catch::Equals(sim.name()));
+	}
+
+	SECTION("get chip label")
+	{
+		REQUIRE_THAT(info.label(), Catch::Equals("foobar"));
+	}
+
+	SECTION("get num_lines")
+	{
+		REQUIRE(info.num_lines() == 8);
+	}
+}
+
+TEST_CASE("chip_info can be copied and moved", "[chip-info]")
+{
+	::gpiosim::chip sim({{ property::NUM_LINES, 4 }, { property::LABEL, "foobar" }});
+	::gpiod::chip chip(sim.dev_path());
+	auto info = chip.get_info();
+
+	SECTION("copy constructor works")
+	{
+		auto copy(info);
+
+		REQUIRE_THAT(copy.name(), Catch::Equals(sim.name()));
+		REQUIRE_THAT(copy.label(), Catch::Equals("foobar"));
+		REQUIRE(copy.num_lines() == 4);
+
+		REQUIRE_THAT(info.name(), Catch::Equals(sim.name()));
+		REQUIRE_THAT(info.label(), Catch::Equals("foobar"));
+		REQUIRE(info.num_lines() == 4);
+	}
+
+	SECTION("assignment operator works")
+	{
+		auto copy = chip.get_info();
+
+		copy = info;
+
+		REQUIRE_THAT(copy.name(), Catch::Equals(sim.name()));
+		REQUIRE_THAT(copy.label(), Catch::Equals("foobar"));
+		REQUIRE(copy.num_lines() == 4);
+
+		REQUIRE_THAT(info.name(), Catch::Equals(sim.name()));
+		REQUIRE_THAT(info.label(), Catch::Equals("foobar"));
+		REQUIRE(info.num_lines() == 4);
+	}
+
+	SECTION("move constructor works")
+	{
+		auto moved(std::move(info));
+
+		REQUIRE_THAT(moved.name(), Catch::Equals(sim.name()));
+		REQUIRE_THAT(moved.label(), Catch::Equals("foobar"));
+		REQUIRE(moved.num_lines() == 4);
+	}
+
+	SECTION("move assignment operator works")
+	{
+		auto moved = chip.get_info();
+
+		moved = ::std::move(info);
+
+		REQUIRE_THAT(moved.name(), Catch::Equals(sim.name()));
+		REQUIRE_THAT(moved.label(), Catch::Equals("foobar"));
+		REQUIRE(moved.num_lines() == 4);
+	}
+}
+
+TEST_CASE("stream insertion operator works for chip_info", "[chip-info]")
+{
+	::gpiosim::chip sim({
+		{ property::NUM_LINES, 4 },
+		{ property::LABEL, "foobar" }
+	});
+
+	::gpiod::chip chip(sim.dev_path());
+	auto info = chip.get_info();
+	::std::stringstream expected;
+
+	expected << "gpiod::chip_info(name=\"" << sim.name() <<
+		    "\", label=\"foobar\", num_lines=4)";
+
+	REQUIRE_THAT(info, stringify_matcher<::gpiod::chip_info>(expected.str()));
+}
+
+} /* namespace */
diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tests-chip.cpp
new file mode 100644
index 0000000..f7841dd
--- /dev/null
+++ b/bindings/cxx/tests/tests-chip.cpp
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <gpiod.hpp>
+#include <sstream>
+#include <system_error>
+#include <utility>
+
+#include "gpiosim.hpp"
+#include "helpers.hpp"
+
+using property = ::gpiosim::chip::property;
+using line_name = ::gpiosim::chip::line_name;
+
+namespace {
+
+TEST_CASE("chip constructor works", "[chip]")
+{
+	SECTION("open an existing GPIO chip")
+	{
+		::gpiosim::chip sim;
+
+		REQUIRE_NOTHROW(::gpiod::chip(sim.dev_path()));
+	}
+
+	SECTION("opening a nonexistent file fails with ENOENT")
+	{
+		REQUIRE_THROWS_MATCHES(::gpiod::chip("/dev/nonexistent"),
+				       ::std::system_error, system_error_matcher(ENOENT));
+	}
+
+	SECTION("opening a file that is not a device fails with ENOTTY")
+	{
+		REQUIRE_THROWS_MATCHES(::gpiod::chip("/tmp"),
+				       ::std::system_error, system_error_matcher(ENOTTY));
+	}
+
+	SECTION("opening a non-GPIO character device fails with ENODEV")
+	{
+		REQUIRE_THROWS_MATCHES(::gpiod::chip("/dev/null"),
+				       ::std::system_error, system_error_matcher(ENODEV));
+	}
+
+	SECTION("move constructor")
+	{
+		::gpiosim::chip sim({{ property::LABEL, "foobar" }});
+
+		::gpiod::chip first(sim.dev_path());
+		REQUIRE_THAT(first.get_info().label(), Catch::Equals("foobar"));
+		::gpiod::chip second(::std::move(first));
+		REQUIRE_THAT(second.get_info().label(), Catch::Equals("foobar"));
+	}
+}
+
+TEST_CASE("chip operators work", "[chip]")
+{
+	::gpiosim::chip sim({{ property::LABEL, "foobar" }});
+	::gpiod::chip chip(sim.dev_path());
+
+	SECTION("assignment operator")
+	{
+		::gpiosim::chip moved_sim({{ property::LABEL, "moved" }});
+		::gpiod::chip moved_chip(moved_sim.dev_path());
+
+		REQUIRE_THAT(chip.get_info().label(), Catch::Equals("foobar"));
+		chip = ::std::move(moved_chip);
+		REQUIRE_THAT(chip.get_info().label(), Catch::Equals("moved"));
+	}
+
+	SECTION("boolean operator")
+	{
+		REQUIRE(chip);
+		chip.close();
+		REQUIRE_FALSE(chip);
+	}
+}
+
+TEST_CASE("chip properties can be read", "[chip]")
+{
+	::gpiosim::chip sim({{ property::NUM_LINES, 8 }, { property::LABEL, "foobar" }});
+	::gpiod::chip chip(sim.dev_path());
+
+	SECTION("get device path")
+	{
+		REQUIRE_THAT(chip.path(), Catch::Equals(sim.dev_path()));
+	}
+
+	SECTION("get file descriptor")
+	{
+		REQUIRE(chip.fd() >= 0);
+	}
+}
+
+TEST_CASE("line lookup by name works", "[chip]")
+{
+	::gpiosim::chip sim({
+		{ property::NUM_LINES, 8 },
+		{ property::LINE_NAME, line_name(0, "foo") },
+		{ property::LINE_NAME, line_name(2, "bar") },
+		{ property::LINE_NAME, line_name(3, "baz") },
+		{ property::LINE_NAME, line_name(5, "xyz") }
+	});
+
+	::gpiod::chip chip(sim.dev_path());
+
+	SECTION("lookup successful")
+	{
+		REQUIRE(chip.get_line_offset_from_name("baz") == 3);
+	}
+
+	SECTION("lookup failed")
+	{
+		REQUIRE(chip.get_line_offset_from_name("nonexistent") < 0);
+	}
+}
+
+TEST_CASE("line lookup: behavior for duplicate names", "[chip]")
+{
+	::gpiosim::chip sim({
+		{ property::NUM_LINES, 8 },
+		{ property::LINE_NAME, line_name(0, "foo") },
+		{ property::LINE_NAME, line_name(2, "bar") },
+		{ property::LINE_NAME, line_name(3, "baz") },
+		{ property::LINE_NAME, line_name(5, "bar") }
+	});
+
+	::gpiod::chip chip(sim.dev_path());
+
+	REQUIRE(chip.get_line_offset_from_name("bar") == 2);
+}
+
+TEST_CASE("closed chip can no longer be used", "[chip]")
+{
+	::gpiosim::chip sim;
+
+	::gpiod::chip chip(sim.dev_path());
+	chip.close();
+	REQUIRE_THROWS_AS(chip.path(), ::gpiod::chip_closed);
+}
+
+TEST_CASE("stream insertion operator works for chip", "[chip]")
+{
+	::gpiosim::chip sim({
+		{ property::NUM_LINES, 4 },
+		{ property::LABEL, "foobar" }
+	});
+
+	::gpiod::chip chip(sim.dev_path());
+	::std::stringstream buf;
+
+	SECTION("open chip")
+	{
+		::std::stringstream expected;
+
+		expected << "gpiod::chip(path=" << sim.dev_path() <<
+			    ", info=gpiod::chip_info(name=\"" << sim.name() <<
+			    "\", label=\"foobar\", num_lines=4))";
+
+		buf << chip;
+		REQUIRE_THAT(buf.str(), Catch::Equals(expected.str()));
+	}
+
+	SECTION("closed chip")
+	{
+		chip.close();
+		REQUIRE_THAT(chip, stringify_matcher<::gpiod::chip>("gpiod::chip(closed)"));
+	}
+}
+
+} /* namespace */
diff --git a/bindings/cxx/tests/tests-edge-event.cpp b/bindings/cxx/tests/tests-edge-event.cpp
new file mode 100644
index 0000000..d634e20
--- /dev/null
+++ b/bindings/cxx/tests/tests-edge-event.cpp
@@ -0,0 +1,417 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <chrono>
+#include <gpiod.hpp>
+#include <sstream>
+#include <thread>
+#include <utility>
+
+#include "gpiosim.hpp"
+#include "helpers.hpp"
+
+using simprop = ::gpiosim::chip::property;
+using reqprop = ::gpiod::request_config::property;
+using lineprop = ::gpiod::line_config::property;
+using direction = ::gpiod::line::direction;
+using edge = ::gpiod::line::edge;
+using offsets = ::gpiod::line::offsets;
+using pull = ::gpiosim::chip::pull;
+using event_type = ::gpiod::edge_event::event_type;
+
+namespace {
+
+TEST_CASE("edge_event_buffer capacity settings work", "[edge-event]")
+{
+	SECTION("default capacity")
+	{
+		REQUIRE(::gpiod::edge_event_buffer().capacity() == 64);
+	}
+
+	SECTION("user-defined capacity")
+	{
+		REQUIRE(::gpiod::edge_event_buffer(123).capacity() == 123);
+	}
+
+	SECTION("max capacity")
+	{
+		REQUIRE(::gpiod::edge_event_buffer(16 * 64 * 2).capacity() == 1024);
+	}
+}
+
+TEST_CASE("edge_event wait timeout", "[edge-event]")
+{
+	::gpiosim::chip sim;
+	::gpiod::chip chip(sim.dev_path());
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offsets({ 0 })}
+		}),
+		::gpiod::line_config({
+			{ lineprop::EDGE, edge::BOTH }
+		})
+	);
+
+	REQUIRE_FALSE(request.wait_edge_event(::std::chrono::milliseconds(100)));
+}
+
+TEST_CASE("output mode and edge detection don't work together", "[edge-event]")
+{
+	::gpiosim::chip sim;
+	::gpiod::chip chip(sim.dev_path());
+
+	REQUIRE_THROWS_AS(
+		chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 0 })}
+			}),
+			::gpiod::line_config({
+				{ lineprop::DIRECTION, direction::OUTPUT },
+				{ lineprop::EDGE, edge::BOTH }
+			})
+		),
+		::std::invalid_argument
+	);
+}
+
+void trigger_falling_and_rising_edge(::gpiosim::chip& sim, unsigned int offset)
+{
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(30));
+	sim.set_pull(offset, pull::PULL_UP);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(30));
+	sim.set_pull(offset, pull::PULL_DOWN);
+}
+
+void trigger_rising_edge_events_on_two_offsets(::gpiosim::chip& sim,
+					       unsigned int off0, unsigned int off1)
+{
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(30));
+	sim.set_pull(off0, pull::PULL_UP);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(30));
+	sim.set_pull(off1, pull::PULL_UP);
+}
+
+TEST_CASE("waiting for and reading edge events works", "[edge-event]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	::gpiod::chip chip(sim.dev_path());
+	::gpiod::edge_event_buffer buffer;
+
+	SECTION("both edge events")
+	{
+		auto request = chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 2 })}
+			}),
+			::gpiod::line_config({
+				{ lineprop::EDGE, edge::BOTH }
+			})
+		);
+
+		::std::uint64_t ts_rising, ts_falling;
+
+		::std::thread thread(trigger_falling_and_rising_edge, ::std::ref(sim), 2);
+
+		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_event(buffer, 1) == 1);
+		REQUIRE(buffer.num_events() == 1);
+		auto event = buffer.get_event(0);
+		REQUIRE(event.type() == event_type::RISING_EDGE);
+		REQUIRE(event.line_offset() == 2);
+		ts_rising = event.timestamp_ns();
+
+		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_event(buffer, 1) == 1);
+		REQUIRE(buffer.num_events() == 1);
+		event = buffer.get_event(0);
+		REQUIRE(event.type() == event_type::FALLING_EDGE);
+		REQUIRE(event.line_offset() == 2);
+		ts_falling = event.timestamp_ns();
+
+		REQUIRE_FALSE(request.wait_edge_event(::std::chrono::milliseconds(100)));
+
+		thread.join();
+
+		REQUIRE(ts_falling > ts_rising);
+	}
+
+	SECTION("rising edge event")
+	{
+		auto request = chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 6 })}
+			}),
+			::gpiod::line_config({
+				{ lineprop::EDGE, edge::RISING }
+			})
+		);
+
+		::std::thread thread(trigger_falling_and_rising_edge, ::std::ref(sim), 6);
+
+		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_event(buffer, 1) == 1);
+		REQUIRE(buffer.num_events() == 1);
+		auto event = buffer.get_event(0);
+		REQUIRE(event.type() == event_type::RISING_EDGE);
+		REQUIRE(event.line_offset() == 6);
+
+		REQUIRE_FALSE(request.wait_edge_event(::std::chrono::milliseconds(100)));
+
+		thread.join();
+	}
+
+	SECTION("falling edge event")
+	{
+		auto request = chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 7 })}
+			}),
+			::gpiod::line_config({
+				{ lineprop::EDGE, edge::FALLING }
+			})
+		);
+
+		::std::thread thread(trigger_falling_and_rising_edge, ::std::ref(sim), 7);
+
+		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_event(buffer, 1) == 1);
+		REQUIRE(buffer.num_events() == 1);
+		auto event = buffer.get_event(0);
+		REQUIRE(event.type() == event_type::FALLING_EDGE);
+		REQUIRE(event.line_offset() == 7);
+
+		REQUIRE_FALSE(request.wait_edge_event(::std::chrono::milliseconds(100)));
+
+		thread.join();
+	}
+
+	SECTION("sequence numbers")
+	{
+		auto request = chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 0, 1 })}
+			}),
+			::gpiod::line_config({
+				{ lineprop::EDGE, edge::BOTH }
+			})
+		);
+
+		::std::thread thread(trigger_rising_edge_events_on_two_offsets, ::std::ref(sim), 0, 1);
+
+		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_event(buffer, 1) == 1);
+		REQUIRE(buffer.num_events() == 1);
+		auto event = buffer.get_event(0);
+		REQUIRE(event.type() == event_type::RISING_EDGE);
+		REQUIRE(event.line_offset() == 0);
+		REQUIRE(event.global_seqno() == 1);
+		REQUIRE(event.line_seqno() == 1);
+
+		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_event(buffer, 1) == 1);
+		REQUIRE(buffer.num_events() == 1);
+		event = buffer.get_event(0);
+		REQUIRE(event.type() == event_type::RISING_EDGE);
+		REQUIRE(event.line_offset() == 1);
+		REQUIRE(event.global_seqno() == 2);
+		REQUIRE(event.line_seqno() == 1);
+
+		thread.join();
+	}
+}
+
+TEST_CASE("reading multiple events", "[edge-event]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	::gpiod::chip chip(sim.dev_path());
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offsets({ 1 })}
+		}),
+		::gpiod::line_config({
+			{ lineprop::EDGE, edge::BOTH }
+		})
+	);
+
+	unsigned long line_seqno = 1, global_seqno = 1;
+
+	sim.set_pull(1, pull::PULL_UP);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+	sim.set_pull(1, pull::PULL_DOWN);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+	sim.set_pull(1, pull::PULL_UP);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+
+	SECTION("read multiple events")
+	{
+		::gpiod::edge_event_buffer buffer;
+
+		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_event(buffer) == 3);
+		REQUIRE(buffer.num_events() == 3);
+
+		for (const auto& event: buffer) {
+			REQUIRE(event.line_offset() == 1);
+			REQUIRE(event.line_seqno() == line_seqno++);
+			REQUIRE(event.global_seqno() == global_seqno++);
+		}
+	}
+
+	SECTION("read over capacity")
+	{
+		::gpiod::edge_event_buffer buffer(2);
+
+		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_event(buffer) == 2);
+		REQUIRE(buffer.num_events() == 2);
+	}
+}
+
+TEST_CASE("edge_event_buffer can be moved", "[edge-event]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 2 }});
+	::gpiod::chip chip(sim.dev_path());
+	::gpiod::edge_event_buffer buffer(13);
+
+	/* Get some events into the buffer. */
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offsets({ 1 })}
+		}),
+		::gpiod::line_config({
+			{ lineprop::EDGE, edge::BOTH }
+		})
+	);
+
+	sim.set_pull(1, pull::PULL_UP);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+	sim.set_pull(1, pull::PULL_DOWN);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+	sim.set_pull(1, pull::PULL_UP);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(500));
+
+	REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+	REQUIRE(request.read_edge_event(buffer) == 3);
+
+	SECTION("move constructor works")
+	{
+		auto moved(::std::move(buffer));
+		REQUIRE(moved.capacity() == 13);
+		REQUIRE(moved.num_events() == 3);
+	}
+
+	SECTION("move assignment operator works")
+	{
+		::gpiod::edge_event_buffer moved;
+
+		moved = ::std::move(buffer);
+		REQUIRE(moved.capacity() == 13);
+		REQUIRE(moved.num_events() == 3);
+	}
+}
+
+TEST_CASE("edge_event can be copied and moved", "[edge-event]")
+{
+	::gpiosim::chip sim;
+	::gpiod::chip chip(sim.dev_path());
+	::gpiod::edge_event_buffer buffer;
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offsets({ 0 })}
+		}),
+		::gpiod::line_config({
+			{ lineprop::EDGE, edge::BOTH }
+		})
+	);
+
+	sim.set_pull(0, pull::PULL_UP);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+	REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+	REQUIRE(request.read_edge_event(buffer) == 1);
+	auto event = buffer.get_event(0);
+
+	sim.set_pull(0, pull::PULL_DOWN);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+	REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+	REQUIRE(request.read_edge_event(buffer) == 1);
+	auto copy = buffer.get_event(0);
+
+	SECTION("copy constructor works")
+	{
+		auto copy(event);
+		REQUIRE(copy.line_offset() == 0);
+		REQUIRE(copy.type() == event_type::RISING_EDGE);
+		REQUIRE(event.line_offset() == 0);
+		REQUIRE(event.type() == event_type::RISING_EDGE);
+	}
+
+	SECTION("move constructor works")
+	{
+		auto copy(::std::move(event));
+		REQUIRE(copy.line_offset() == 0);
+		REQUIRE(copy.type() == event_type::RISING_EDGE);
+	}
+
+	SECTION("assignment operator works")
+	{
+		copy = event;
+		REQUIRE(copy.line_offset() == 0);
+		REQUIRE(copy.type() == event_type::RISING_EDGE);
+		REQUIRE(event.line_offset() == 0);
+		REQUIRE(event.type() == event_type::RISING_EDGE);
+	}
+
+	SECTION("move assignment operator works")
+	{
+		copy = ::std::move(event);
+		REQUIRE(copy.line_offset() == 0);
+		REQUIRE(copy.type() == event_type::RISING_EDGE);
+	}
+}
+
+TEST_CASE("stream insertion operators work for edge_event and edge_event_buffer", "[edge-event]")
+{
+	/*
+	 * This tests the stream insertion operators for both edge_event and
+	 * edge_event_buffer classes.
+	 */
+
+	::gpiosim::chip sim;
+	::gpiod::chip chip(sim.dev_path());
+	::gpiod::edge_event_buffer buffer;
+	::std::stringstream sbuf, expected;
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offsets({ 0 })}
+		}),
+		::gpiod::line_config({
+			{ lineprop::EDGE, edge::BOTH }
+		})
+	);
+
+	sim.set_pull(0, pull::PULL_UP);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(30));
+	sim.set_pull(0, pull::PULL_DOWN);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(30));
+
+	REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+	REQUIRE(request.read_edge_event(buffer) == 2);
+
+	sbuf << buffer;
+
+	expected << "gpiod::edge_event_buffer\\(num_events=2, capacity=64, events=\\[gpiod::edge_event\\" <<
+		    "(type='RISING_EDGE', timestamp=[1-9][0-9]+, line_offset=0, global_seqno=1, " <<
+		    "line_seqno=1\\), gpiod::edge_event\\(type='FALLING_EDGE', timestamp=[1-9][0-9]+, " <<
+		    "line_offset=0, global_seqno=2, line_seqno=2\\)\\]\\)";
+
+	REQUIRE_THAT(sbuf.str(), regex_matcher(expected.str()));
+}
+
+} /* namespace */
diff --git a/bindings/cxx/tests/tests-info-event.cpp b/bindings/cxx/tests/tests-info-event.cpp
new file mode 100644
index 0000000..b838d5c
--- /dev/null
+++ b/bindings/cxx/tests/tests-info-event.cpp
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <chrono>
+#include <gpiod.hpp>
+#include <sstream>
+#include <thread>
+#include <utility>
+
+#include "gpiosim.hpp"
+#include "helpers.hpp"
+
+using simprop = ::gpiosim::chip::property;
+using reqprop = ::gpiod::request_config::property;
+using lineprop = ::gpiod::line_config::property;
+using direction = ::gpiod::line::direction;
+using event_type = ::gpiod::info_event::event_type;
+
+namespace {
+
+void request_reconfigure_release_line(::gpiod::chip& chip)
+{
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, ::gpiod::line::offsets({ 7 }) }
+		}),
+		::gpiod::line_config()
+	);
+
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+
+	request.reconfigure_lines(
+		::gpiod::line_config({
+			{ lineprop::DIRECTION, direction::OUTPUT }
+		})
+	);
+
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+
+	request.release();
+}
+
+TEST_CASE("Lines can be watched", "[info-event][chip]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	::gpiod::chip chip(sim.dev_path());
+
+	SECTION("watch_line_info() returns line info")
+	{
+		auto info = chip.watch_line_info(7);
+		REQUIRE(info.offset() == 7);
+	}
+
+	SECTION("watch_line_info() fails for offset out of range")
+	{
+		REQUIRE_THROWS_AS(chip.watch_line_info(8), ::std::invalid_argument);
+	}
+
+	SECTION("waiting for event timeout")
+	{
+		chip.watch_line_info(3);
+		REQUIRE_FALSE(chip.wait_info_event(::std::chrono::milliseconds(100)));
+	}
+
+	SECTION("request-reconfigure-release events")
+	{
+		auto info = chip.watch_line_info(7);
+		::std::uint64_t ts_req, ts_rec, ts_rel;
+
+		REQUIRE(info.direction() == direction::INPUT);
+
+		::std::thread thread(request_reconfigure_release_line, ::std::ref(chip));
+
+		REQUIRE(chip.wait_info_event(::std::chrono::seconds(1)));
+		auto event = chip.read_info_event();
+		REQUIRE(event.type() == event_type::LINE_REQUESTED);
+		REQUIRE(event.get_line_info().direction() == direction::INPUT);
+		ts_req = event.timestamp_ns();
+
+		REQUIRE(chip.wait_info_event(::std::chrono::seconds(1)));
+		event = chip.read_info_event();
+		REQUIRE(event.type() == event_type::LINE_CONFIG_CHANGED);
+		REQUIRE(event.get_line_info().direction() == direction::OUTPUT);
+		ts_rec = event.timestamp_ns();
+
+		REQUIRE(chip.wait_info_event(::std::chrono::seconds(1)));
+		event = chip.read_info_event();
+		REQUIRE(event.type() == event_type::LINE_RELEASED);
+		ts_rel = event.timestamp_ns();
+
+		/* No more events. */
+		REQUIRE_FALSE(chip.wait_info_event(::std::chrono::milliseconds(100)));
+		thread.join();
+
+		/* Check timestamps are really monotonic. */
+		REQUIRE(ts_rel > ts_rec);
+		REQUIRE(ts_rec > ts_req);
+	}
+}
+
+TEST_CASE("info_event can be copied and moved", "[info-event]")
+{
+	::gpiosim::chip sim;
+	::gpiod::chip chip(sim.dev_path());
+	::std::stringstream buf, expected;
+
+	chip.watch_line_info(0);
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, ::gpiod::line::offsets({ 0 }) }
+		}),
+		::gpiod::line_config()
+	);
+
+	REQUIRE(chip.wait_info_event(::std::chrono::seconds(1)));
+	auto event = chip.read_info_event();
+
+	request.release();
+
+	REQUIRE(chip.wait_info_event(::std::chrono::seconds(1)));
+	auto copy = chip.read_info_event();
+
+	SECTION("copy constructor works")
+	{
+		auto copy(event);
+
+		REQUIRE(copy.type() == event_type::LINE_REQUESTED);
+		REQUIRE(copy.get_line_info().offset() == 0);
+
+		REQUIRE(event.type() == event_type::LINE_REQUESTED);
+		REQUIRE(event.get_line_info().offset() == 0);
+	}
+
+	SECTION("assignment operator works")
+	{
+		copy = event;
+
+		REQUIRE(copy.type() == event_type::LINE_REQUESTED);
+		REQUIRE(copy.get_line_info().offset() == 0);
+
+		REQUIRE(event.type() == event_type::LINE_REQUESTED);
+		REQUIRE(event.get_line_info().offset() == 0);
+	}
+
+	SECTION("move constructor works")
+	{
+		auto copy(::std::move(event));
+
+		REQUIRE(copy.type() == event_type::LINE_REQUESTED);
+		REQUIRE(copy.get_line_info().offset() == 0);
+	}
+
+	SECTION("move assignment operator works")
+	{
+		copy = ::std::move(event);
+
+		REQUIRE(copy.type() == event_type::LINE_REQUESTED);
+		REQUIRE(copy.get_line_info().offset() == 0);
+	}
+}
+
+TEST_CASE("info_event stream insertion operator works", "[info-event][line-info]")
+{
+	/*
+	 * This tests the stream insertion operator for both the info_event
+	 * and line_info classes.
+	 */
+
+	::gpiosim::chip sim;
+	::gpiod::chip chip(sim.dev_path());
+	::std::stringstream buf, expected;
+
+	chip.watch_line_info(0);
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, ::gpiod::line::offsets({ 0 }) }
+		}),
+		::gpiod::line_config()
+	);
+
+	auto event = chip.read_info_event();
+
+	buf << event;
+
+	expected << "gpiod::info_event\\(event_type='LINE_REQUESTED', timestamp=[1-9][0-9]+, " <<
+		    "line_info=gpiod::line_info\\(offset=0, name=unnamed, used=true, consumer='', " <<
+		    "direction=INPUT, active_low=false, bias=UNKNOWN, drive=PUSH_PULL, " <<
+		    "edge_detection=NONE, event_clock=MONOTONIC, debounced=false\\)\\)";
+
+	REQUIRE_THAT(buf.str(), regex_matcher(expected.str()));
+}
+
+} /* namespace */
diff --git a/bindings/cxx/tests/tests-line-config.cpp b/bindings/cxx/tests/tests-line-config.cpp
new file mode 100644
index 0000000..e76ec8a
--- /dev/null
+++ b/bindings/cxx/tests/tests-line-config.cpp
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <gpiod.hpp>
+#include <sstream>
+
+#include "helpers.hpp"
+
+using lineprop = ::gpiod::line_config::property;
+using value = ::gpiod::line::value;
+using direction = ::gpiod::line::direction;
+using edge = ::gpiod::line::edge;
+using bias = ::gpiod::line::bias;
+using drive = ::gpiod::line::drive;
+using clock_type = ::gpiod::line::clock;
+using mappings = ::gpiod::line::value_mappings;
+using offsets = ::gpiod::line::offsets;
+
+using namespace ::std::chrono_literals;
+
+namespace {
+
+TEST_CASE("line_config constructor works", "[line-config]")
+{
+	SECTION("no arguments - default values")
+	{
+		::gpiod::line_config cfg;
+
+		REQUIRE_NOTHROW(cfg.direction_default() == direction::INPUT);
+		REQUIRE(cfg.edge_detection_default() == edge::NONE);
+		REQUIRE(cfg.bias_default() == bias::AS_IS);
+		REQUIRE(cfg.drive_default() == drive::PUSH_PULL);
+		REQUIRE_FALSE(cfg.active_low_default());
+		REQUIRE(cfg.debounce_period_default() == 0us);
+		REQUIRE(cfg.event_clock_default() == clock_type::MONOTONIC);
+		REQUIRE(cfg.output_value_default() == value::INACTIVE);
+		REQUIRE(cfg.num_overrides() == 0);
+		REQUIRE(cfg.overrides().empty());
+	}
+
+	SECTION("default values set from constructor")
+	{
+		/*
+		 * These are wrong and the request would fail but we're just
+		 * testing the object's behavior.
+		 */
+		::gpiod::line_config cfg({
+			{ lineprop::DIRECTION, direction::OUTPUT },
+			{ lineprop::EDGE, edge::FALLING },
+			{ lineprop::BIAS, bias::DISABLED },
+			{ lineprop::DRIVE, drive::OPEN_DRAIN },
+			{ lineprop::ACTIVE_LOW, true },
+			{ lineprop::DEBOUNCE_PERIOD, 3000us },
+			{ lineprop::EVENT_CLOCK, clock_type::REALTIME },
+			{ lineprop::OUTPUT_VALUE, value::ACTIVE }
+		});
+
+		REQUIRE_NOTHROW(cfg.direction_default() == direction::OUTPUT);
+		REQUIRE(cfg.edge_detection_default() == edge::FALLING);
+		REQUIRE(cfg.bias_default() == bias::DISABLED);
+		REQUIRE(cfg.drive_default() == drive::OPEN_DRAIN);
+		REQUIRE(cfg.active_low_default());
+		/* Test implicit conversion between duration types. */
+		REQUIRE(cfg.debounce_period_default() == 3ms);
+		REQUIRE(cfg.event_clock_default() == clock_type::REALTIME);
+		REQUIRE(cfg.output_value_default() == value::ACTIVE);
+		REQUIRE(cfg.num_overrides() == 0);
+		REQUIRE(cfg.overrides().empty());
+	}
+
+	SECTION("output value overrides can be set from constructor")
+	{
+		::gpiod::line_config cfg({
+			{
+				lineprop::OUTPUT_VALUES, mappings({
+					{ 0, value::ACTIVE },
+					{ 3, value::INACTIVE },
+					{ 1, value::ACTIVE }
+				})
+			}
+		});
+
+		REQUIRE(cfg.num_overrides() == 3);
+		auto overrides = cfg.overrides();
+		REQUIRE(overrides[0].first == 0);
+		REQUIRE(overrides[0].second == lineprop::OUTPUT_VALUE);
+		REQUIRE(overrides[1].first == 3);
+		REQUIRE(overrides[1].second == lineprop::OUTPUT_VALUE);
+		REQUIRE(overrides[2].first == 1);
+		REQUIRE(overrides[2].second == lineprop::OUTPUT_VALUE);
+	}
+}
+
+TEST_CASE("line_config overrides work")
+{
+	::gpiod::line_config cfg;
+
+	SECTION("direction")
+	{
+		cfg.set_direction_default(direction::AS_IS);
+		cfg.set_direction_override(direction::INPUT, 3);
+
+		REQUIRE(cfg.direction_is_overridden(3));
+		REQUIRE(cfg.direction_offset(3) == direction::INPUT);
+		cfg.clear_direction_override(3);
+		REQUIRE_FALSE(cfg.direction_is_overridden(3));
+		REQUIRE(cfg.direction_offset(3) == direction::AS_IS);
+	}
+
+	SECTION("edge detection")
+	{
+		cfg.set_edge_detection_default(edge::NONE);
+		cfg.set_edge_detection_override(edge::BOTH, 0);
+
+		REQUIRE(cfg.edge_detection_is_overridden(0));
+		REQUIRE(cfg.edge_detection_offset(0) == edge::BOTH);
+		cfg.clear_edge_detection_override(0);
+		REQUIRE_FALSE(cfg.edge_detection_is_overridden(0));
+		REQUIRE(cfg.edge_detection_offset(0) == edge::NONE);
+	}
+
+	SECTION("bias")
+	{
+		cfg.set_bias_default(bias::AS_IS);
+		cfg.set_bias_override(bias::PULL_DOWN, 3);
+
+		REQUIRE(cfg.bias_is_overridden(3));
+		REQUIRE(cfg.bias_offset(3) == bias::PULL_DOWN);
+		cfg.clear_bias_override(3);
+		REQUIRE_FALSE(cfg.bias_is_overridden(3));
+		REQUIRE(cfg.bias_offset(3) == bias::AS_IS);
+	}
+
+	SECTION("drive")
+	{
+		cfg.set_drive_default(drive::PUSH_PULL);
+		cfg.set_drive_override(drive::OPEN_DRAIN, 4);
+
+		REQUIRE(cfg.drive_is_overridden(4));
+		REQUIRE(cfg.drive_offset(4) == drive::OPEN_DRAIN);
+		cfg.clear_drive_override(4);
+		REQUIRE_FALSE(cfg.drive_is_overridden(4));
+		REQUIRE(cfg.drive_offset(4) == drive::PUSH_PULL);
+	}
+
+	SECTION("active-low")
+	{
+		cfg.set_active_low_default(false);
+		cfg.set_active_low_override(true, 16);
+
+		REQUIRE(cfg.active_low_is_overridden(16));
+		REQUIRE(cfg.active_low_offset(16));
+		cfg.clear_active_low_override(16);
+		REQUIRE_FALSE(cfg.active_low_is_overridden(16));
+		REQUIRE_FALSE(cfg.active_low_offset(16));
+	}
+
+	SECTION("debounce period")
+	{
+		/*
+		 * Test the chrono literals and implicit duration conversions
+		 * too.
+		 */
+
+		cfg.set_debounce_period_default(5000us);
+		cfg.set_debounce_period_override(3ms, 1);
+
+		REQUIRE(cfg.debounce_period_is_overridden(1));
+		REQUIRE(cfg.debounce_period_offset(1) == 3ms);
+		cfg.clear_debounce_period_override(1);
+		REQUIRE_FALSE(cfg.debounce_period_is_overridden(1));
+		REQUIRE(cfg.debounce_period_offset(1) == 5ms);
+	}
+
+	SECTION("event clock")
+	{
+		cfg.set_event_clock_default(clock_type::MONOTONIC);
+		cfg.set_event_clock_override(clock_type::REALTIME, 4);
+
+		REQUIRE(cfg.event_clock_is_overridden(4));
+		REQUIRE(cfg.event_clock_offset(4) == clock_type::REALTIME);
+		cfg.clear_event_clock_override(4);
+		REQUIRE_FALSE(cfg.event_clock_is_overridden(4));
+		REQUIRE(cfg.event_clock_offset(4) == clock_type::MONOTONIC);
+	}
+
+	SECTION("output value")
+	{
+		cfg.set_output_value_default(value::INACTIVE);
+		cfg.set_output_value_override(value::ACTIVE, 0);
+		cfg.set_output_values({ 1, 2, 8 }, { value::ACTIVE, value::ACTIVE, value::ACTIVE });
+		cfg.set_output_values({ { 17, value::ACTIVE }, { 21, value::ACTIVE } });
+
+		for (const auto& off: offsets({ 0, 1, 2, 8, 17, 21 })) {
+			REQUIRE(cfg.output_value_is_overridden(off));
+			REQUIRE(cfg.output_value_offset(off) == value::ACTIVE);
+			cfg.clear_output_value_override(off);
+			REQUIRE_FALSE(cfg.output_value_is_overridden(off));
+			REQUIRE(cfg.output_value_offset(off) == value::INACTIVE);
+		}
+	}
+}
+
+TEST_CASE("line_config can be moved", "[line-config]")
+{
+	::gpiod::line_config cfg({
+		{ lineprop::DIRECTION, direction::INPUT },
+		{ lineprop::EDGE, edge::BOTH },
+		{ lineprop::DEBOUNCE_PERIOD, 3000us },
+		{ lineprop::EVENT_CLOCK, clock_type::REALTIME },
+	});
+
+	cfg.set_direction_override(direction::OUTPUT, 2);
+	cfg.set_edge_detection_override(edge::NONE, 2);
+
+	SECTION("move constructor works")
+	{
+		auto moved(::std::move(cfg));
+
+		REQUIRE(moved.direction_default() == direction::INPUT);
+		REQUIRE(moved.edge_detection_default() == edge::BOTH);
+		REQUIRE(moved.debounce_period_default() == 3000us);
+		REQUIRE(moved.event_clock_default() == clock_type::REALTIME);
+		REQUIRE(moved.direction_offset(2) == direction::OUTPUT);
+		REQUIRE(moved.edge_detection_offset(2) == edge::NONE);
+	}
+
+	SECTION("move constructor works")
+	{
+		::gpiod::line_config moved;
+
+		moved = ::std::move(cfg);
+
+		REQUIRE(moved.direction_default() == direction::INPUT);
+		REQUIRE(moved.edge_detection_default() == edge::BOTH);
+		REQUIRE(moved.debounce_period_default() == 3000us);
+		REQUIRE(moved.event_clock_default() == clock_type::REALTIME);
+		REQUIRE(moved.direction_offset(2) == direction::OUTPUT);
+		REQUIRE(moved.edge_detection_offset(2) == edge::NONE);
+	}
+}
+
+TEST_CASE("line_config stream insertion operator works", "[line-config]")
+{
+	::gpiod::line_config cfg({
+		{ lineprop::DIRECTION, direction::INPUT },
+		{ lineprop::EDGE, edge::BOTH },
+		{ lineprop::DEBOUNCE_PERIOD, 3000us },
+		{ lineprop::EVENT_CLOCK, clock_type::REALTIME },
+	});
+
+	cfg.set_direction_override(direction::OUTPUT, 2);
+	cfg.set_edge_detection_override(edge::NONE, 2);
+
+	::std::stringstream buf;
+
+	buf << cfg;
+
+	::std::string expected(
+		"gpiod::line_config(defaults=(direction=INPUT, edge_detection=BOTH_EDGES, bias="
+		"AS_IS, drive=PUSH_PULL, active-high, debounce_period=3000us, event_clock="
+		"REALTIME, default_output_value=INACTIVE), overrides=[(offset=2 -> direction="
+		"OUTPUT), (offset=2 -> edge_detection=NONE)])"
+	);
+
+	REQUIRE_THAT(buf.str(), Catch::Equals(expected));
+}
+
+} /* namespace */
diff --git a/bindings/cxx/tests/tests-line-info.cpp b/bindings/cxx/tests/tests-line-info.cpp
new file mode 100644
index 0000000..e7136f0
--- /dev/null
+++ b/bindings/cxx/tests/tests-line-info.cpp
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <gpiod.hpp>
+#include <string>
+
+#include "helpers.hpp"
+#include "gpiosim.hpp"
+
+using property = ::gpiosim::chip::property;
+using line_name = ::gpiosim::chip::line_name;
+using line_hog = ::gpiosim::chip::line_hog;
+using hog_dir = ::gpiosim::chip::hog_direction;
+using direction = ::gpiod::line::direction;
+using edge = ::gpiod::line::edge;
+using bias = ::gpiod::line::bias;
+using drive = ::gpiod::line::drive;
+using event_clock = ::gpiod::line::clock;
+
+using namespace ::std::chrono_literals;
+
+namespace {
+
+TEST_CASE("get_line_info() works", "[chip][line-info]")
+{
+	::gpiosim::chip sim({
+		{ property::NUM_LINES, 8 },
+		{ property::LINE_NAME, line_name(0, "foobar") },
+		{ property::HOG, line_hog(0, "hog", hog_dir::OUTPUT_HIGH ) }
+	});
+
+	::gpiod::chip chip(sim.dev_path());
+
+	SECTION("line_info can be retrieved from chip")
+	{
+		auto info = chip.get_line_info(0);
+
+		REQUIRE(info.offset() == 0);
+		REQUIRE_THAT(info.name(), Catch::Equals("foobar"));
+		REQUIRE(info.used());
+		REQUIRE_THAT(info.consumer(), Catch::Equals("hog"));
+		REQUIRE(info.direction() == ::gpiod::line::direction::OUTPUT);
+		REQUIRE_FALSE(info.active_low());
+		REQUIRE(info.bias() == ::gpiod::line::bias::UNKNOWN);
+		REQUIRE(info.drive() == ::gpiod::line::drive::PUSH_PULL);
+		REQUIRE(info.edge_detection() == ::gpiod::line::edge::NONE);
+		REQUIRE(info.event_clock() == ::gpiod::line::clock::MONOTONIC);
+		REQUIRE_FALSE(info.debounced());
+		REQUIRE(info.debounce_period() == 0us);
+	}
+
+	SECTION("offset out of range")
+	{
+		REQUIRE_THROWS_AS(chip.get_line_info(8), ::std::invalid_argument);
+	}
+}
+
+TEST_CASE("line properties can be retrieved", "[line-info]")
+{
+	::gpiosim::chip sim({
+		{ property::NUM_LINES, 8 },
+		{ property::LINE_NAME, line_name(1, "foo") },
+		{ property::LINE_NAME, line_name(2, "bar") },
+		{ property::LINE_NAME, line_name(4, "baz") },
+		{ property::LINE_NAME, line_name(5, "xyz") },
+		{ property::HOG, line_hog(3, "hog3", hog_dir::OUTPUT_HIGH) },
+		{ property::HOG, line_hog(4, "hog4", hog_dir::OUTPUT_LOW) }
+	});
+
+	::gpiod::chip chip(sim.dev_path());
+
+	SECTION("basic properties")
+	{
+		auto info4 = chip.get_line_info(4);
+		auto info6 = chip.get_line_info(6);
+
+		REQUIRE(info4.offset() == 4);
+		REQUIRE_THAT(info4.name(), Catch::Equals("baz"));
+		REQUIRE(info4.used());
+		REQUIRE_THAT(info4.consumer(), Catch::Equals("hog4"));
+		REQUIRE(info4.direction() == direction::OUTPUT);
+		REQUIRE(info4.edge_detection() == edge::NONE);
+		REQUIRE_FALSE(info4.active_low());
+		REQUIRE(info4.bias() == bias::UNKNOWN);
+		REQUIRE(info4.drive() == drive::PUSH_PULL);
+		REQUIRE(info4.event_clock() == event_clock::MONOTONIC);
+		REQUIRE_FALSE(info4.debounced());
+		REQUIRE(info4.debounce_period() == 0us);
+	}
+}
+
+TEST_CASE("line_info can be copied and moved")
+{
+	::gpiosim::chip sim({
+		{ property::NUM_LINES, 4 },
+		{ property::LINE_NAME, line_name(2, "foobar") }
+	});
+
+	::gpiod::chip chip(sim.dev_path());
+	auto info = chip.get_line_info(2);
+
+	SECTION("copy constructor works")
+	{
+		auto copy(info);
+		REQUIRE(copy.offset() == 2);
+		REQUIRE_THAT(copy.name(), Catch::Equals("foobar"));
+		/* info can still be used */
+		REQUIRE(info.offset() == 2);
+		REQUIRE_THAT(info.name(), Catch::Equals("foobar"));
+	}
+
+	SECTION("assignment operator works")
+	{
+		auto copy = chip.get_line_info(0);
+		copy = info;
+		REQUIRE(copy.offset() == 2);
+		REQUIRE_THAT(copy.name(), Catch::Equals("foobar"));
+		/* info can still be used */
+		REQUIRE(info.offset() == 2);
+		REQUIRE_THAT(info.name(), Catch::Equals("foobar"));
+	}
+
+	SECTION("move constructor works")
+	{
+		auto copy(::std::move(info));
+		REQUIRE(copy.offset() == 2);
+		REQUIRE_THAT(copy.name(), Catch::Equals("foobar"));
+	}
+
+	SECTION("move assignment operator works")
+	{
+		auto copy = chip.get_line_info(0);
+		copy = ::std::move(info);
+		REQUIRE(copy.offset() == 2);
+		REQUIRE_THAT(copy.name(), Catch::Equals("foobar"));
+	}
+}
+
+TEST_CASE("line_info stream insertion operator works")
+{
+	::gpiosim::chip sim({
+		{ property::LINE_NAME, line_name(0, "foo") },
+		{ property::HOG, line_hog(0, "hogger", hog_dir::OUTPUT_HIGH) }
+	});
+
+	::gpiod::chip chip(sim.dev_path());
+
+	auto info = chip.get_line_info(0);
+
+	REQUIRE_THAT(info, stringify_matcher<::gpiod::line_info>(
+		"gpiod::line_info(offset=0, name='foo', used=true, consumer='foo', direction=OUTPUT, "
+		"active_low=false, bias=UNKNOWN, drive=PUSH_PULL, edge_detection=NONE, event_clock=MONOTONIC, debounced=false)"));
+}
+
+} /* namespace */
diff --git a/bindings/cxx/tests/tests-line-request.cpp b/bindings/cxx/tests/tests-line-request.cpp
new file mode 100644
index 0000000..624a4e9
--- /dev/null
+++ b/bindings/cxx/tests/tests-line-request.cpp
@@ -0,0 +1,490 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <gpiod.hpp>
+#include <sstream>
+#include <stdexcept>
+#include <vector>
+
+#include "gpiosim.hpp"
+#include "helpers.hpp"
+
+using simprop = ::gpiosim::chip::property;
+using reqprop = ::gpiod::request_config::property;
+using lineprop = ::gpiod::line_config::property;
+using offsets = ::gpiod::line::offsets;
+using values = ::gpiod::line::values;
+using direction = ::gpiod::line::direction;
+using value = ::gpiod::line::value;
+using simval = ::gpiosim::chip::value;
+using pull = ::gpiosim::chip::pull;
+
+namespace {
+
+class value_matcher : public Catch::MatcherBase<value>
+{
+public:
+	value_matcher(pull pull, bool active_low = false)
+		: _m_pull(pull),
+		  _m_active_low(active_low)
+	{
+
+	}
+
+	::std::string describe(void) const override
+	{
+		::std::string repr(this->_m_pull == pull::PULL_UP ? "PULL_UP" : "PULL_DOWN");
+		::std::string active_low = this->_m_active_low ? "(active-low) " : "";
+
+		return active_low + "corresponds with " + repr;
+	}
+
+	bool match(const value& val) const override
+	{
+		if (this->_m_active_low) {
+			if ((val == value::ACTIVE && this->_m_pull == pull::PULL_DOWN) ||
+			    (val == value::INACTIVE && this->_m_pull == pull::PULL_UP))
+				return true;
+		} else {
+			if ((val == value::ACTIVE && this->_m_pull == pull::PULL_UP) ||
+			    (val == value::INACTIVE && this->_m_pull == pull::PULL_DOWN))
+				return true;
+		}
+
+		return false;
+	}
+
+private:
+	pull _m_pull;
+	bool _m_active_low;
+};
+
+TEST_CASE("requesting lines fails with invalid arguments", "[line-request][chip]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	::gpiod::chip chip(sim.dev_path());
+
+	SECTION("no offsets")
+	{
+		REQUIRE_THROWS_AS(chip.request_lines(::gpiod::request_config(),
+						     ::gpiod::line_config()),
+				  ::std::invalid_argument);
+	}
+
+	SECTION("duplicate offsets")
+	{
+		REQUIRE_THROWS_MATCHES(chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 2, 0, 0, 4 }) }
+			}),
+			::gpiod::line_config()),
+			::std::system_error,
+			 system_error_matcher(EBUSY)
+		);
+	}
+
+	SECTION("offset out of bounds")
+	{
+		REQUIRE_THROWS_AS(chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 2, 0, 8, 4 }) }
+			}),
+			::gpiod::line_config()),
+			::std::invalid_argument
+		);
+	}
+}
+
+TEST_CASE("consumer string is set correctly", "[line-request]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 4 }});
+	::gpiod::chip chip(sim.dev_path());
+	offsets offs({ 3, 0, 2 });
+
+	SECTION("set custom consumer")
+	{
+		auto request = chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 2 }) },
+				{ reqprop::CONSUMER, "foobar" }
+			}),
+			::gpiod::line_config()
+		);
+
+		auto info = chip.get_line_info(2);
+
+		REQUIRE(info.used());
+		REQUIRE_THAT(info.consumer(), Catch::Equals("foobar"));
+	}
+
+	SECTION("empty consumer")
+	{
+		auto request = chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 2 }) },
+			}),
+			::gpiod::line_config()
+		);
+
+		auto info = chip.get_line_info(2);
+
+		REQUIRE(info.used());
+		REQUIRE_THAT(info.consumer(), Catch::Equals("?"));
+	}
+}
+
+TEST_CASE("values can be read", "[line-request]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	const offsets offs({ 7, 1, 0, 6, 2 });
+
+	const ::std::vector<pull> pulls({
+		pull::PULL_UP,
+		pull::PULL_UP,
+		pull::PULL_DOWN,
+		pull::PULL_UP,
+		pull::PULL_DOWN
+	});
+
+	for (unsigned int i = 0; i < offs.size(); i++)
+		sim.set_pull(offs[i], pulls[i]);
+
+	auto request = ::gpiod::chip(sim.dev_path()).request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offs }
+		}),
+		::gpiod::line_config({
+			{ lineprop::DIRECTION, direction::INPUT }
+		})
+	);
+
+	SECTION("get all values (returning variant)")
+	{
+		auto vals = request.get_values();
+
+		REQUIRE_THAT(vals[0], value_matcher(pull::PULL_UP));
+		REQUIRE_THAT(vals[1], value_matcher(pull::PULL_UP));
+		REQUIRE_THAT(vals[2], value_matcher(pull::PULL_DOWN));
+		REQUIRE_THAT(vals[3], value_matcher(pull::PULL_UP));
+		REQUIRE_THAT(vals[4], value_matcher(pull::PULL_DOWN));
+	}
+
+	SECTION("get all values (passed buffer variant)")
+	{
+		values vals(5);
+
+		request.get_values(vals);
+
+		REQUIRE_THAT(vals[0], value_matcher(pull::PULL_UP));
+		REQUIRE_THAT(vals[1], value_matcher(pull::PULL_UP));
+		REQUIRE_THAT(vals[2], value_matcher(pull::PULL_DOWN));
+		REQUIRE_THAT(vals[3], value_matcher(pull::PULL_UP));
+		REQUIRE_THAT(vals[4], value_matcher(pull::PULL_DOWN));
+	}
+
+	SECTION("get_values(buffer) throws for invalid buffer size")
+	{
+		values vals(4);
+		REQUIRE_THROWS_AS(request.get_values(vals), ::std::invalid_argument);
+		vals.resize(6);
+		REQUIRE_THROWS_AS(request.get_values(vals), ::std::invalid_argument);
+	}
+
+	SECTION("get a single value")
+	{
+		auto val = request.get_value(7);
+
+		REQUIRE_THAT(val, value_matcher(pull::PULL_UP));
+	}
+
+	SECTION("get a single value (active-low)")
+	{
+		request.reconfigure_lines(
+			::gpiod::line_config({
+				{ lineprop::ACTIVE_LOW, true }
+			})
+		);
+
+		auto val = request.get_value(7);
+
+		REQUIRE_THAT(val, value_matcher(pull::PULL_UP, true));
+	}
+
+	SECTION("get a subset of values (returning variant)")
+	{
+		auto vals = request.get_values(offsets({ 2, 0, 6 }));
+
+		REQUIRE_THAT(vals[0], value_matcher(pull::PULL_DOWN));
+		REQUIRE_THAT(vals[1], value_matcher(pull::PULL_DOWN));
+		REQUIRE_THAT(vals[2], value_matcher(pull::PULL_UP));
+	}
+
+	SECTION("get a subset of values (passed buffer variant)")
+	{
+		values vals(3);
+
+		request.get_values(offsets({ 2, 0, 6 }), vals);
+
+		REQUIRE_THAT(vals[0], value_matcher(pull::PULL_DOWN));
+		REQUIRE_THAT(vals[1], value_matcher(pull::PULL_DOWN));
+		REQUIRE_THAT(vals[2], value_matcher(pull::PULL_UP));
+	}
+}
+
+TEST_CASE("output values can be set at request time", "[line-request]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	::gpiod::chip chip(sim.dev_path());
+	const offsets offs({ 0, 1, 3, 4 });
+
+	::gpiod::request_config req_cfg({
+		{ reqprop::OFFSETS, offs }
+	});
+
+	::gpiod::line_config line_cfg({
+		{ lineprop::DIRECTION, direction::OUTPUT },
+		{ lineprop::OUTPUT_VALUE, value::ACTIVE }
+	});
+
+	SECTION("default output value")
+	{
+		auto request = chip.request_lines(req_cfg, line_cfg);
+
+		for (const auto& off: offs)
+			REQUIRE(sim.get_value(off) == simval::ACTIVE);
+
+		REQUIRE(sim.get_value(2) == simval::INACTIVE);
+	}
+
+	SECTION("overridden output value")
+	{
+		line_cfg.set_output_value_override(value::INACTIVE, 1);
+
+		auto request = chip.request_lines(req_cfg, line_cfg);
+
+		REQUIRE(sim.get_value(0) == simval::ACTIVE);
+		REQUIRE(sim.get_value(1) == simval::INACTIVE);
+		REQUIRE(sim.get_value(2) == simval::INACTIVE);
+		REQUIRE(sim.get_value(3) == simval::ACTIVE);
+		REQUIRE(sim.get_value(4) == simval::ACTIVE);
+	}
+}
+
+TEST_CASE("values can be set after requesting lines", "[line-request]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	const offsets offs({ 0, 1, 3, 4 });
+
+	::gpiod::request_config req_cfg({
+		{ reqprop::OFFSETS, offs }
+	});
+
+	::gpiod::line_config line_cfg({
+		{ lineprop::DIRECTION, direction::OUTPUT },
+		{ lineprop::OUTPUT_VALUE, value::INACTIVE }
+	});
+
+	auto request = ::gpiod::chip(sim.dev_path()).request_lines(req_cfg, line_cfg);
+
+	SECTION("set single value")
+	{
+		request.set_value(1, value::ACTIVE);
+
+		REQUIRE(sim.get_value(0) == simval::INACTIVE);
+		REQUIRE(sim.get_value(1) == simval::ACTIVE);
+		REQUIRE(sim.get_value(3) == simval::INACTIVE);
+		REQUIRE(sim.get_value(4) == simval::INACTIVE);
+	}
+
+	SECTION("set all values")
+	{
+		request.set_values({
+			value::ACTIVE,
+			value::INACTIVE,
+			value::ACTIVE,
+			value::INACTIVE
+		});
+
+		REQUIRE(sim.get_value(0) == simval::ACTIVE);
+		REQUIRE(sim.get_value(1) == simval::INACTIVE);
+		REQUIRE(sim.get_value(3) == simval::ACTIVE);
+		REQUIRE(sim.get_value(4) == simval::INACTIVE);
+	}
+
+	SECTION("set a subset of values")
+	{
+		request.set_values({ 4, 3 }, { value::ACTIVE, value::INACTIVE });
+
+		REQUIRE(sim.get_value(0) == simval::INACTIVE);
+		REQUIRE(sim.get_value(1) == simval::INACTIVE);
+		REQUIRE(sim.get_value(3) == simval::INACTIVE);
+		REQUIRE(sim.get_value(4) == simval::ACTIVE);
+	}
+
+	SECTION("set a subset of values with mappings")
+	{
+		request.set_values({
+			{ 0, value::ACTIVE },
+			{ 4, value::INACTIVE },
+			{ 1, value::ACTIVE}
+		});
+
+		REQUIRE(sim.get_value(0) == simval::ACTIVE);
+		REQUIRE(sim.get_value(1) == simval::ACTIVE);
+		REQUIRE(sim.get_value(3) == simval::INACTIVE);
+		REQUIRE(sim.get_value(4) == simval::INACTIVE);
+	}
+}
+
+TEST_CASE("line_request can be moved", "[line-request]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	::gpiod::chip chip(sim.dev_path());
+	const offsets offs({ 3, 1, 0, 2 });
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offs }
+		}),
+		::gpiod::line_config()
+	);
+
+	auto fd = request.fd();
+
+	auto another = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offsets({ 6 }) }
+		}),
+		::gpiod::line_config()
+	);
+
+	SECTION("move constructor works")
+	{
+		auto moved(::std::move(request));
+
+		REQUIRE(moved.fd() == fd);
+		REQUIRE_THAT(moved.offsets(), Catch::Equals(offs));
+	}
+
+	SECTION("move assignment operator works")
+	{
+		another = ::std::move(request);
+
+		REQUIRE(another.fd() == fd);
+		REQUIRE_THAT(another.offsets(), Catch::Equals(offs));
+	}
+}
+
+TEST_CASE("released request can no longer be used", "[line-request]")
+{
+	::gpiosim::chip sim;
+
+	auto request = ::gpiod::chip(sim.dev_path()).request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offsets({ 0 }) }
+		}),
+		::gpiod::line_config()
+	);
+
+	request.release();
+
+	REQUIRE_THROWS_AS(request.offsets(), ::gpiod::request_released);
+}
+
+TEST_CASE("line_request survives parent chip", "[line-request][chip]")
+{
+	::gpiosim::chip sim;
+
+	sim.set_pull(0, pull::PULL_UP);
+
+	SECTION("chip is released")
+	{
+		::gpiod::chip chip(sim.dev_path());
+
+		auto request = chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 0 }) }
+			}),
+			::gpiod::line_config({
+				{ lineprop::DIRECTION, direction::INPUT }
+			})
+		);
+
+		REQUIRE_THAT(request.get_value(0), value_matcher(pull::PULL_UP));
+
+		chip.close();
+
+		REQUIRE_THAT(request.get_value(0), value_matcher(pull::PULL_UP));
+	}
+
+	SECTION("chip goes out of scope")
+	{
+		/* Need to get the request object somehow. */
+		::gpiod::chip dummy(sim.dev_path());
+
+		auto request = dummy.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 0 }) }
+			}),
+			::gpiod::line_config({
+				{ lineprop::DIRECTION, direction::INPUT }
+			})
+		);
+
+		request.release();
+		dummy.close();
+
+		{
+			::gpiod::chip chip(sim.dev_path());
+
+			request = chip.request_lines(
+				::gpiod::request_config({
+					{ reqprop::OFFSETS, offsets({ 0 }) }
+				}),
+				::gpiod::line_config({
+					{ lineprop::DIRECTION, direction::INPUT }
+				})
+			);
+
+			REQUIRE_THAT(request.get_value(0), value_matcher(pull::PULL_UP));
+		}
+
+		REQUIRE_THAT(request.get_value(0), value_matcher(pull::PULL_UP));
+	}
+}
+
+TEST_CASE("line_request stream insertion operator works", "[line-request]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 4 }});
+
+	auto request = ::gpiod::chip(sim.dev_path()).request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offsets({ 3, 1, 0, 2 }) }
+		}),
+		::gpiod::line_config()
+	);
+
+	::std::stringstream buf, expected;
+
+	expected << "gpiod::line_request(num_lines=4, line_offsets=gpiod::offsets(3, 1, 0, 2), fd=" <<
+		    request.fd() << ")";
+
+	SECTION("active request")
+	{
+		buf << request;
+
+		REQUIRE_THAT(buf.str(), Catch::Equals(expected.str()));
+	}
+
+	SECTION("request released")
+	{
+		request.release();
+
+		buf << request;
+
+		REQUIRE_THAT(buf.str(), Catch::Equals("gpiod::line_request(released)"));
+	}
+}
+
+} /* namespace */
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
new file mode 100644
index 0000000..c17122c
--- /dev/null
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <gpiod.hpp>
+
+#include "helpers.hpp"
+
+using offset = ::gpiod::line::offset;
+using value = ::gpiod::line::value;
+using direction = ::gpiod::line::direction;
+using edge = ::gpiod::line::edge;
+using bias = ::gpiod::line::bias;
+using drive = ::gpiod::line::drive;
+using clock_type = ::gpiod::line::clock;
+using offsets = ::gpiod::line::offsets;
+using values = ::gpiod::line::values;
+using value_mapping = ::gpiod::line::value_mapping;
+using value_mappings = ::gpiod::line::value_mappings;
+
+namespace {
+
+TEST_CASE("stream insertion operators for types in gpiod::line work", "[line]")
+{
+	SECTION("offset")
+	{
+		offset off = 4;
+
+		REQUIRE_THAT(off, stringify_matcher<offset>("4"));
+	}
+
+	SECTION("value")
+	{
+		auto active = value::ACTIVE;
+		auto inactive = value::INACTIVE;
+
+		REQUIRE_THAT(active, stringify_matcher<value>("ACTIVE"));
+		REQUIRE_THAT(inactive, stringify_matcher<value>("INACTIVE"));
+	}
+
+	SECTION("direction")
+	{
+		auto input = direction::INPUT;
+		auto output = direction::OUTPUT;
+		auto as_is = direction::AS_IS;
+
+		REQUIRE_THAT(input, stringify_matcher<direction>("INPUT"));
+		REQUIRE_THAT(output, stringify_matcher<direction>("OUTPUT"));
+		REQUIRE_THAT(as_is, stringify_matcher<direction>("AS_IS"));
+	}
+
+	SECTION("edge")
+	{
+		auto rising = edge::RISING;
+		auto falling = edge::FALLING;
+		auto both = edge::BOTH;
+		auto none = edge::NONE;
+
+		REQUIRE_THAT(rising, stringify_matcher<edge>("RISING_EDGE"));
+		REQUIRE_THAT(falling, stringify_matcher<edge>("FALLING_EDGE"));
+		REQUIRE_THAT(both, stringify_matcher<edge>("BOTH_EDGES"));
+		REQUIRE_THAT(none, stringify_matcher<edge>("NONE"));
+	}
+
+	SECTION("bias")
+	{
+		auto pull_up = bias::PULL_UP;
+		auto pull_down = bias::PULL_DOWN;
+		auto disabled = bias::DISABLED;
+		auto as_is = bias::AS_IS;
+		auto unknown = bias::UNKNOWN;
+
+		REQUIRE_THAT(pull_up, stringify_matcher<bias>("PULL_UP"));
+		REQUIRE_THAT(pull_down, stringify_matcher<bias>("PULL_DOWN"));
+		REQUIRE_THAT(disabled, stringify_matcher<bias>("DISABLED"));
+		REQUIRE_THAT(as_is, stringify_matcher<bias>("AS_IS"));
+		REQUIRE_THAT(unknown, stringify_matcher<bias>("UNKNOWN"));
+	}
+
+	SECTION("drive")
+	{
+		auto push_pull = drive::PUSH_PULL;
+		auto open_drain = drive::OPEN_DRAIN;
+		auto open_source = drive::OPEN_SOURCE;
+
+		REQUIRE_THAT(push_pull, stringify_matcher<drive>("PUSH_PULL"));
+		REQUIRE_THAT(open_drain, stringify_matcher<drive>("OPEN_DRAIN"));
+		REQUIRE_THAT(open_source, stringify_matcher<drive>("OPEN_SOURCE"));
+	}
+
+	SECTION("clock")
+	{
+		auto monotonic = clock_type::MONOTONIC;
+		auto realtime = clock_type::REALTIME;
+
+		REQUIRE_THAT(monotonic, stringify_matcher<clock_type>("MONOTONIC"));
+		REQUIRE_THAT(realtime, stringify_matcher<clock_type>("REALTIME"));
+	}
+
+	SECTION("offsets")
+	{
+		offsets offs = { 2, 5, 3, 9, 8, 7 };
+
+		REQUIRE_THAT(offs, stringify_matcher<offsets>("gpiod::offsets(2, 5, 3, 9, 8, 7)"));
+	}
+
+	SECTION("values")
+	{
+		values vals = {
+			value::ACTIVE,
+			value::INACTIVE,
+			value::ACTIVE,
+			value::ACTIVE,
+			value::INACTIVE
+		};
+
+		REQUIRE_THAT(vals,
+			     stringify_matcher<values>("gpiod::values(ACTIVE, INACTIVE, ACTIVE, ACTIVE, INACTIVE)"));
+	}
+
+	SECTION("value_mapping")
+	{
+		value_mapping val = { 4, value::ACTIVE };
+
+		REQUIRE_THAT(val, stringify_matcher<value_mapping>("gpiod::value_mapping(4: ACTIVE)"));
+	}
+
+	SECTION("value_mappings")
+	{
+		value_mappings vals = { { 0, value::ACTIVE }, { 4, value::INACTIVE }, { 8, value::ACTIVE } };
+
+		REQUIRE_THAT(vals, stringify_matcher<value_mappings>(
+			"gpiod::value_mappings(gpiod::value_mapping(0: ACTIVE), gpiod::value_mapping(4: INACTIVE), gpiod::value_mapping(8: ACTIVE))"));
+	}
+}
+
+} /* namespace */
diff --git a/bindings/cxx/tests/tests-misc.cpp b/bindings/cxx/tests/tests-misc.cpp
new file mode 100644
index 0000000..ba4920f
--- /dev/null
+++ b/bindings/cxx/tests/tests-misc.cpp
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <filesystem>
+#include <gpiod.hpp>
+#include <string>
+#include <regex>
+#include <unistd.h>
+
+#include "gpiosim.hpp"
+#include "helpers.hpp"
+
+using property = ::gpiosim::chip::property;
+
+namespace {
+
+class symlink_guard
+{
+public:
+	symlink_guard(const ::std::filesystem::path& target,
+		      const ::std::filesystem::path& link)
+		: _m_link(link)
+	{
+		::std::filesystem::create_symlink(target, this->_m_link);
+	}
+
+	~symlink_guard(void)
+	{
+		::std::filesystem::remove(this->_m_link);
+	}
+
+private:
+	::std::filesystem::path _m_link;
+};
+
+TEST_CASE("is_gpiochip_device() works", "[misc][chip]")
+{
+	SECTION("is_gpiochip_device() returns false for /dev/null")
+	{
+		REQUIRE_FALSE(::gpiod::is_gpiochip_device("/dev/null"));
+	}
+
+	SECTION("is_gpiochip_device() returns false for nonexistent file")
+	{
+		REQUIRE_FALSE(::gpiod::is_gpiochip_device("/dev/nonexistent"));
+	}
+
+	SECTION("is_gpiochip_device() returns true for a GPIO chip")
+	{
+		::gpiosim::chip sim;
+
+		REQUIRE(::gpiod::is_gpiochip_device(sim.dev_path()));
+	}
+
+	SECTION("is_gpiochip_device() can resolve a symlink")
+	{
+		::gpiosim::chip sim;
+		::std::string link("/tmp/gpiod-cxx-tmp-link.");
+
+		link += ::std::to_string(::getpid());
+
+		symlink_guard link_guard(sim.dev_path(), link);
+
+		REQUIRE(::gpiod::is_gpiochip_device(link));
+	}
+}
+
+TEST_CASE("version_string() returns a valid API version", "[misc]")
+{
+	SECTION("check version_string() format")
+	{
+		REQUIRE_THAT(::gpiod::version_string(),
+			     regex_matcher("^[0-9][1-9]?\\.[0-9][1-9]?([\\.0-9]?|\\-devel)$"));
+	}
+}
+
+} /* namespace */
diff --git a/bindings/cxx/tests/tests-request-config.cpp b/bindings/cxx/tests/tests-request-config.cpp
new file mode 100644
index 0000000..ddec724
--- /dev/null
+++ b/bindings/cxx/tests/tests-request-config.cpp
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <cstddef>
+#include <gpiod.hpp>
+#include <string>
+#include <sstream>
+
+#include "helpers.hpp"
+
+using property = ::gpiod::request_config::property;
+using offsets = ::gpiod::line::offsets;
+
+namespace {
+
+TEST_CASE("request_config constructor works", "[request-config]")
+{
+	SECTION("no arguments")
+	{
+		::gpiod::request_config cfg;
+
+		REQUIRE(cfg.consumer().empty());
+		REQUIRE(cfg.offsets().empty());
+		REQUIRE(cfg.event_buffer_size() == 0);
+	}
+
+	SECTION("constructor with default settings")
+	{
+		offsets offsets({ 0, 1, 2, 3 });
+
+		::gpiod::request_config cfg({
+			{ property::CONSUMER, "foobar" },
+			{ property::OFFSETS, offsets},
+			{ property::EVENT_BUFFER_SIZE, 64 }
+		});
+
+		REQUIRE_THAT(cfg.consumer(), Catch::Equals("foobar"));
+		REQUIRE_THAT(cfg.offsets(), Catch::Equals(offsets));
+		REQUIRE(cfg.event_buffer_size() == 64);
+	}
+
+	SECTION("invalid default value types passed to constructor")
+	{
+		REQUIRE_THROWS_AS(::gpiod::request_config({
+			{ property::CONSUMER, 42 }
+		}), ::std::invalid_argument);
+
+		REQUIRE_THROWS_AS(::gpiod::request_config({
+			{ property::OFFSETS, 42 }
+		}), ::std::invalid_argument);
+
+		REQUIRE_THROWS_AS(::gpiod::request_config({
+			{ property::EVENT_BUFFER_SIZE, "foobar" }
+		}), ::std::invalid_argument);
+	}
+}
+
+TEST_CASE("request_config can be moved", "[request-config]")
+{
+	offsets offsets({ 0, 1, 2, 3 });
+
+	::gpiod::request_config cfg({
+		{ property::CONSUMER, "foobar" },
+		{ property::OFFSETS, offsets },
+		{ property::EVENT_BUFFER_SIZE, 64 }
+	});
+
+	SECTION("move constructor works")
+	{
+		auto moved(::std::move(cfg));
+		REQUIRE_THAT(moved.consumer(), Catch::Equals("foobar"));
+		REQUIRE_THAT(moved.offsets(), Catch::Equals(offsets));
+		REQUIRE(moved.event_buffer_size() == 64);
+	}
+
+	SECTION("move assignment operator works")
+	{
+		::gpiod::request_config moved;
+
+		moved = ::std::move(cfg);
+
+		REQUIRE_THAT(moved.consumer(), Catch::Equals("foobar"));
+		REQUIRE_THAT(moved.offsets(), Catch::Equals(offsets));
+		REQUIRE(moved.event_buffer_size() == 64);
+	}
+}
+
+TEST_CASE("request_config mutators work", "[request-config]")
+{
+	::gpiod::request_config cfg;
+
+	SECTION("set consumer")
+	{
+		cfg.set_consumer("foobar");
+		REQUIRE_THAT(cfg.consumer(), Catch::Equals("foobar"));
+	}
+
+	SECTION("set offsets")
+	{
+		offsets offsets({ 3, 1, 2, 7, 5 });
+		cfg.set_offsets(offsets);
+		REQUIRE_THAT(cfg.offsets(), Catch::Equals(offsets));
+	}
+
+	SECTION("set event_buffer_size")
+	{
+		cfg.set_event_buffer_size(128);
+		REQUIRE(cfg.event_buffer_size() == 128);
+	}
+}
+
+TEST_CASE("request_config generic property setting works", "[request-config]")
+{
+	::gpiod::request_config cfg;
+
+	SECTION("set consumer")
+	{
+		cfg.set_property(property::CONSUMER, "foobar");
+		REQUIRE_THAT(cfg.consumer(), Catch::Equals("foobar"));
+	}
+
+	SECTION("set offsets")
+	{
+		offsets offsets({ 3, 1, 2, 7, 5 });
+		cfg.set_property(property::OFFSETS, offsets);
+		REQUIRE_THAT(cfg.offsets(), Catch::Equals(offsets));
+	}
+
+	SECTION("set event_buffer_size")
+	{
+		cfg.set_property(property::EVENT_BUFFER_SIZE, 128);
+		REQUIRE(cfg.event_buffer_size() == 128);
+	}
+}
+
+TEST_CASE("request_config stream insertion operator works", "[request-config]")
+{
+	::gpiod::request_config cfg({
+		{ property::CONSUMER, "foobar" },
+		{ property::OFFSETS, offsets({ 0, 1, 2, 3 })},
+		{ property::EVENT_BUFFER_SIZE, 32 }
+	});
+
+	::std::stringstream buf;
+
+	buf << cfg;
+
+	::std::string expected("gpiod::request_config(consumer='foobar', num_offsets=4, "
+			       "offsets=(gpiod::offsets(0, 1, 2, 3)), event_buffer_size=32)");
+
+	REQUIRE_THAT(buf.str(), Catch::Equals(expected));
+}
+
+} /* namespace */
-- 
2.32.0

