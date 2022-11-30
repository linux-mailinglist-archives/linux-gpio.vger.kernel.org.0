Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC7363D5CC
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 13:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234798AbiK3Mmx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 07:42:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234607AbiK3Mmt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 07:42:49 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F40F310FFA
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:37 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id x17so26869382wrn.6
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjTPJ7l3MPIYMCNcQHBVBhcoW9q7XcXRc5B6133NoOc=;
        b=B9U0NeX1sVCN2eLCS7wMlkI0Wua9M2ib9SPHk623eUDNpmyMytJD5+Z170a3FpO+qd
         7jz88b2aSxRtVQOwWdn4kwSKQQ9Z+C/TrhkQs0tRgbuqHbX5uLMhLEm2Kh5daKHI8sVv
         1i71wZZjhgms+3Jvs88nWqXg/YJ3cDj/7XSgc+Kb3miKsVQ11z2juD4ui4/wbl7laNC+
         mXkWQxxyTeqWYvBG3Br8JmsU/aFohXhNi0wCXl3HEDuUZsKTj/aDtTBLmbzvPskMqS0/
         Kua9bsVp87Mw591bvrEKytwivofA15Tt6bJjB9VlV8+FmoDs5jcOni+7ZGC251scOXjf
         w+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjTPJ7l3MPIYMCNcQHBVBhcoW9q7XcXRc5B6133NoOc=;
        b=tE/8hDk69ECswIybYYpsHa6dLFQztC6vOssYe30EJOaTpraIIKtzgOhQlQv2+JqEas
         d4hqq23GiMcy339YhRjGbOPNiQtg8np/QEg6hzf9CaV0U+l+kBCBFU9p5cn/5gL7vEOf
         OSpx7PTWJQlc4orhSP7wBcPtOLCQzhO8blBii61EhU0lfKaenhAbcJgPdT7UYdbAvMKa
         gFtxrir7/64xkWhtJu/Gh5aoltiQ8ExfWufBqT4bQpflwKbH1ZYAUMAsp0W/EiA8R53g
         4iN6WdXvspE+VwMFQVfqJz1ytAV2YLo1MxTucjQaJTr+6ZQMDbTPCqThkj03ZWVJdXcS
         2doA==
X-Gm-Message-State: ANoB5pmkosQ1UK3CKTf7Bmtsi7fd0s2s8UCYtwqDG1plQDSut2+OiDpO
        YiS7zaWhNXYqz/0nppYZuTp3AQ==
X-Google-Smtp-Source: AA0mqf6YPY30y3uIjIrNgg7P2mwBVphGkg9gJGILRXrfJMFv8ECSIrGRJ0MZUVyTigYKrGXVc/rRKQ==
X-Received: by 2002:a5d:614b:0:b0:242:18a0:d03 with SMTP id y11-20020a5d614b000000b0024218a00d03mr8788118wrt.542.1669812156014;
        Wed, 30 Nov 2022 04:42:36 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:458c:6db9:e033:a468])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4402000000b00226dba960b4sm1514985wrq.3.2022.11.30.04.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 04:42:35 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 01/11] treewide: use C enum types explicitly
Date:   Wed, 30 Nov 2022 13:42:21 +0100
Message-Id: <20221130124231.1054001-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221130124231.1054001-1-brgl@bgdev.pl>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
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

Use enum types explicitly across the entire C API. Modern compilers can
catch some bugs with enums and it also helps IDEs and general readability.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
[Viresh: make rust bindings work with negative enum values]
Co-authored-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/cxx/edge-event.cpp                 |   2 +-
 bindings/cxx/info-event.cpp                 |   2 +-
 bindings/cxx/internal.hpp                   |   6 +-
 bindings/cxx/line-info.cpp                  |   2 +-
 bindings/cxx/line-request.cpp               |  14 +-
 bindings/cxx/line-settings.cpp              |  81 +++++-----
 bindings/cxx/tests/gpiosim.cpp              |  14 +-
 bindings/python/gpiod/ext/line-settings.c   |  54 +++----
 bindings/python/gpiod/ext/request.c         |   4 +-
 bindings/rust/gpiosim-sys/src/lib.rs        |  42 +++--
 bindings/rust/gpiosim-sys/src/sim.rs        |   2 +-
 bindings/rust/libgpiod/src/lib.rs           | 169 ++++++++++++--------
 bindings/rust/libgpiod/src/line_info.rs     |  10 +-
 bindings/rust/libgpiod/src/line_settings.rs |  30 ++--
 include/gpiod.h                             |  84 ++++++----
 lib/edge-event.c                            |   5 +-
 lib/info-event.c                            |   5 +-
 lib/line-config.c                           |  12 +-
 lib/line-info.c                             |  25 +--
 lib/line-request.c                          |  21 +--
 lib/line-settings.c                         |  39 ++---
 tests/gpiosim/gpiosim.c                     |  26 +--
 tests/gpiosim/gpiosim.h                     |  18 ++-
 tests/tests-line-request.c                  |  25 +--
 tools/gpioget.c                             |   7 +-
 tools/gpiomon.c                             |   6 +-
 tools/gpioset.c                             |  45 +++---
 tools/tools-common.c                        |   7 +-
 tools/tools-common.h                        |   8 +-
 29 files changed, 431 insertions(+), 334 deletions(-)

diff --git a/bindings/cxx/edge-event.cpp b/bindings/cxx/edge-event.cpp
index 5992934..9d12273 100644
--- a/bindings/cxx/edge-event.cpp
+++ b/bindings/cxx/edge-event.cpp
@@ -100,7 +100,7 @@ GPIOD_CXX_API edge_event::event_type edge_event::type() const
 {
 	int evtype = ::gpiod_edge_event_get_event_type(this->_m_priv->get_event_ptr());
 
-	return map_int_to_enum(evtype, event_type_mapping);
+	return map_enum_c_to_cxx(evtype, event_type_mapping);
 }
 
 GPIOD_CXX_API timestamp edge_event::timestamp_ns() const noexcept
diff --git a/bindings/cxx/info-event.cpp b/bindings/cxx/info-event.cpp
index d9e14a3..f709408 100644
--- a/bindings/cxx/info-event.cpp
+++ b/bindings/cxx/info-event.cpp
@@ -77,7 +77,7 @@ GPIOD_CXX_API info_event::event_type info_event::type() const
 {
 	int type = ::gpiod_info_event_get_event_type(this->_m_priv->event.get());
 
-	return map_int_to_enum(type, event_type_mapping);
+	return map_enum_c_to_cxx(type, event_type_mapping);
 }
 
 GPIOD_CXX_API ::std::uint64_t info_event::timestamp_ns() const noexcept
diff --git a/bindings/cxx/internal.hpp b/bindings/cxx/internal.hpp
index 0703474..d27aa22 100644
--- a/bindings/cxx/internal.hpp
+++ b/bindings/cxx/internal.hpp
@@ -18,15 +18,15 @@
 
 namespace gpiod {
 
-template<class enum_type> enum_type
-map_int_to_enum(int value, const ::std::map<int, enum_type>& mapping)
+template<class cxx_enum_type, class c_enum_type> cxx_enum_type
+map_enum_c_to_cxx(c_enum_type value, const ::std::map<c_enum_type, cxx_enum_type>& mapping)
 {
 	try {
 		return mapping.at(value);
 	} catch (const ::std::out_of_range& err) {
 		/* FIXME Demangle the name. */
 		throw bad_mapping(::std::string("invalid value for ") +
-				  typeid(enum_type).name());
+				  typeid(cxx_enum_type).name());
 	}
 }
 
diff --git a/bindings/cxx/line-info.cpp b/bindings/cxx/line-info.cpp
index a6b6dfa..944e34d 100644
--- a/bindings/cxx/line-info.cpp
+++ b/bindings/cxx/line-info.cpp
@@ -114,7 +114,7 @@ GPIOD_CXX_API line::direction line_info::direction() const
 {
 	int direction = ::gpiod_line_info_get_direction(this->_m_priv->info.get());
 
-	return map_int_to_enum(direction, direction_mapping);
+	return map_enum_c_to_cxx(direction, direction_mapping);
 }
 
 GPIOD_CXX_API bool line_info::active_low() const noexcept
diff --git a/bindings/cxx/line-request.cpp b/bindings/cxx/line-request.cpp
index bde34e8..be0bac5 100644
--- a/bindings/cxx/line-request.cpp
+++ b/bindings/cxx/line-request.cpp
@@ -115,9 +115,10 @@ GPIOD_CXX_API void line_request::get_values(const line::offsets& offsets, line::
 
 	this->_m_priv->fill_offset_buf(offsets);
 
-	int ret = ::gpiod_line_request_get_values_subset(this->_m_priv->request.get(),
-							 offsets.size(), this->_m_priv->offset_buf.data(),
-							 reinterpret_cast<int*>(values.data()));
+	int ret = ::gpiod_line_request_get_values_subset(
+					this->_m_priv->request.get(),
+					offsets.size(), this->_m_priv->offset_buf.data(),
+					reinterpret_cast<gpiod_line_value*>(values.data()));
 	if (ret)
 		throw_from_errno("unable to retrieve line values");
 }
@@ -157,9 +158,10 @@ GPIOD_CXX_API line_request& line_request::set_values(const line::offsets& offset
 
 	this->_m_priv->fill_offset_buf(offsets);
 
-	int ret = ::gpiod_line_request_set_values_subset(this->_m_priv->request.get(),
-							 offsets.size(), this->_m_priv->offset_buf.data(),
-							 reinterpret_cast<const int*>(values.data()));
+	int ret = ::gpiod_line_request_set_values_subset(
+					this->_m_priv->request.get(),
+					offsets.size(), this->_m_priv->offset_buf.data(),
+					reinterpret_cast<const enum gpiod_line_value*>(values.data()));
 	if (ret)
 		throw_from_errno("unable to set line values");
 
diff --git a/bindings/cxx/line-settings.cpp b/bindings/cxx/line-settings.cpp
index 22655e2..17c5ca2 100644
--- a/bindings/cxx/line-settings.cpp
+++ b/bindings/cxx/line-settings.cpp
@@ -10,10 +10,11 @@ namespace gpiod {
 
 namespace {
 
-template<class enum_type>
-::std::map<int, enum_type> make_reverse_maping(const ::std::map<enum_type, int>& mapping)
+template<class cxx_enum_type, class c_enum_type>
+::std::map<c_enum_type, cxx_enum_type>
+make_reverse_maping(const ::std::map<cxx_enum_type, c_enum_type>& mapping)
 {
-	::std::map<int, enum_type> ret;
+	::std::map<c_enum_type, cxx_enum_type> ret;
 
 	for (const auto &item: mapping)
 		ret[item.second] = item.first;
@@ -21,54 +22,56 @@ template<class enum_type>
 	return ret;
 }
 
-const ::std::map<line::direction, int> direction_mapping = {
+const ::std::map<line::direction, gpiod_line_direction> direction_mapping = {
 	{ line::direction::AS_IS,	GPIOD_LINE_DIRECTION_AS_IS },
 	{ line::direction::INPUT,	GPIOD_LINE_DIRECTION_INPUT },
 	{ line::direction::OUTPUT,	GPIOD_LINE_DIRECTION_OUTPUT }
 };
 
-const ::std::map<int, line::direction> reverse_direction_mapping = make_reverse_maping(direction_mapping);
+const ::std::map<gpiod_line_direction, line::direction>
+reverse_direction_mapping = make_reverse_maping(direction_mapping);
 
-const ::std::map<line::edge, int> edge_mapping = {
+const ::std::map<line::edge, gpiod_line_edge> edge_mapping = {
 	{ line::edge::NONE,		GPIOD_LINE_EDGE_NONE },
 	{ line::edge::FALLING,		GPIOD_LINE_EDGE_FALLING },
 	{ line::edge::RISING,		GPIOD_LINE_EDGE_RISING },
 	{ line::edge::BOTH,		GPIOD_LINE_EDGE_BOTH }
 };
 
-const ::std::map<int, line::edge> reverse_edge_mapping = make_reverse_maping(edge_mapping);
+const ::std::map<gpiod_line_edge, line::edge> reverse_edge_mapping = make_reverse_maping(edge_mapping);
 
-const ::std::map<line::bias, int> bias_mapping = {
+const ::std::map<line::bias, gpiod_line_bias> bias_mapping = {
 	{ line::bias::AS_IS,		GPIOD_LINE_BIAS_AS_IS },
 	{ line::bias::DISABLED,		GPIOD_LINE_BIAS_DISABLED },
 	{ line::bias::PULL_UP,		GPIOD_LINE_BIAS_PULL_UP },
 	{ line::bias::PULL_DOWN,	GPIOD_LINE_BIAS_PULL_DOWN }
 };
 
-const ::std::map<int, line::bias> reverse_bias_mapping = make_reverse_maping(bias_mapping);
+const ::std::map<gpiod_line_bias, line::bias> reverse_bias_mapping = make_reverse_maping(bias_mapping);
 
-const ::std::map<line::drive, int> drive_mapping = {
+const ::std::map<line::drive, gpiod_line_drive> drive_mapping = {
 	{ line::drive::PUSH_PULL,	GPIOD_LINE_DRIVE_PUSH_PULL },
 	{ line::drive::OPEN_DRAIN,	GPIOD_LINE_DRIVE_OPEN_DRAIN },
 	{ line::drive::OPEN_SOURCE,	GPIOD_LINE_DRIVE_OPEN_SOURCE }
 };
 
-const ::std::map<int, line::drive> reverse_drive_mapping = make_reverse_maping(drive_mapping);
+const ::std::map<gpiod_line_drive, line::drive> reverse_drive_mapping = make_reverse_maping(drive_mapping);
 
-const ::std::map<line::clock, int> clock_mapping = {
+const ::std::map<line::clock, gpiod_line_event_clock> clock_mapping = {
 	{ line::clock::MONOTONIC,	GPIOD_LINE_EVENT_CLOCK_MONOTONIC },
 	{ line::clock::REALTIME,	GPIOD_LINE_EVENT_CLOCK_REALTIME },
 	{ line::clock::HTE,		GPIOD_LINE_EVENT_CLOCK_HTE }
 };
 
-const ::std::map<int, line::clock> reverse_clock_mapping = make_reverse_maping(clock_mapping);
+const ::std::map<gpiod_line_event_clock, line::clock>
+reverse_clock_mapping = make_reverse_maping(clock_mapping);
 
-const ::std::map<line::value, int> value_mapping = {
+const ::std::map<line::value, gpiod_line_value> value_mapping = {
 	{ line::value::INACTIVE,	GPIOD_LINE_VALUE_INACTIVE },
 	{ line::value::ACTIVE,		GPIOD_LINE_VALUE_ACTIVE }
 };
 
-const ::std::map<int, line::value> reverse_value_mapping = make_reverse_maping(value_mapping);
+const ::std::map<gpiod_line_value, line::value> reverse_value_mapping = make_reverse_maping(value_mapping);
 
 line_settings_ptr make_line_settings()
 {
@@ -95,30 +98,30 @@ value_type map_setting(const key_type& key, const ::std::map<key_type, value_typ
 	return ret;
 }
 
-template<class enum_type>
-int do_map_value(enum_type value, const ::std::map<enum_type, int>& mapping)
+template<class cxx_enum_type, class c_enum_type>
+c_enum_type do_map_value(cxx_enum_type value, const ::std::map<cxx_enum_type, c_enum_type>& mapping)
 {
-	return map_setting<enum_type, int, ::std::invalid_argument>(value, mapping);
+	return map_setting<cxx_enum_type, c_enum_type, ::std::invalid_argument>(value, mapping);
 }
 
-template<class enum_type, int set_func(::gpiod_line_settings*, int)>
-void set_mapped_value(::gpiod_line_settings* settings, enum_type value,
-		      const ::std::map<enum_type, int>& mapping)
+template<class cxx_enum_type, class c_enum_type, int set_func(::gpiod_line_settings*, c_enum_type)>
+void set_mapped_value(::gpiod_line_settings* settings, cxx_enum_type value,
+		      const ::std::map<cxx_enum_type, c_enum_type>& mapping)
 {
-	auto mapped_val = do_map_value(value, mapping);
+	c_enum_type mapped_val = do_map_value(value, mapping);
 
 	auto ret = set_func(settings, mapped_val);
 	if (ret)
 		throw_from_errno("unable to set property");
 }
 
-template<class ret_type, int get_func(::gpiod_line_settings*)>
-ret_type get_mapped_value(::gpiod_line_settings* settings,
-			  const ::std::map<int, ret_type>& mapping)
+template<class cxx_enum_type, class c_enum_type, c_enum_type get_func(::gpiod_line_settings*)>
+cxx_enum_type get_mapped_value(::gpiod_line_settings* settings,
+			  const ::std::map<c_enum_type, cxx_enum_type>& mapping)
 {
-	int mapped_val = get_func(settings);
+	auto mapped_val = get_func(settings);
 
-	return map_int_to_enum(mapped_val, mapping);
+	return map_enum_c_to_cxx(mapped_val, mapping);
 }
 
 } /* namespace */
@@ -162,7 +165,7 @@ GPIOD_CXX_API line_settings& line_settings::reset(void) noexcept
 
 GPIOD_CXX_API line_settings& line_settings::set_direction(line::direction direction)
 {
-	set_mapped_value<line::direction,
+	set_mapped_value<line::direction, gpiod_line_direction,
 			 ::gpiod_line_settings_set_direction>(this->_m_priv->settings.get(),
 							      direction, direction_mapping);
 
@@ -171,7 +174,7 @@ GPIOD_CXX_API line_settings& line_settings::set_direction(line::direction direct
 
 GPIOD_CXX_API line::direction line_settings::direction() const
 {
-	return get_mapped_value<line::direction,
+	return get_mapped_value<line::direction, gpiod_line_direction,
 				::gpiod_line_settings_get_direction>(
 							this->_m_priv->settings.get(),
 							reverse_direction_mapping);
@@ -179,7 +182,7 @@ GPIOD_CXX_API line::direction line_settings::direction() const
 
 GPIOD_CXX_API line_settings& line_settings::set_edge_detection(line::edge edge)
 {
-	set_mapped_value<line::edge,
+	set_mapped_value<line::edge, gpiod_line_edge,
 			 ::gpiod_line_settings_set_edge_detection>(this->_m_priv->settings.get(),
 								   edge, edge_mapping);
 
@@ -188,7 +191,7 @@ GPIOD_CXX_API line_settings& line_settings::set_edge_detection(line::edge edge)
 
 GPIOD_CXX_API line::edge line_settings::edge_detection() const
 {
-	return get_mapped_value<line::edge,
+	return get_mapped_value<line::edge, gpiod_line_edge,
 				::gpiod_line_settings_get_edge_detection>(
 							this->_m_priv->settings.get(),
 							reverse_edge_mapping);
@@ -196,7 +199,7 @@ GPIOD_CXX_API line::edge line_settings::edge_detection() const
 
 GPIOD_CXX_API line_settings& line_settings::set_bias(line::bias bias)
 {
-	set_mapped_value<line::bias,
+	set_mapped_value<line::bias, gpiod_line_bias,
 			 ::gpiod_line_settings_set_bias>(this->_m_priv->settings.get(),
 							 bias, bias_mapping);
 
@@ -205,14 +208,14 @@ GPIOD_CXX_API line_settings& line_settings::set_bias(line::bias bias)
 
 GPIOD_CXX_API line::bias line_settings::bias() const
 {
-	return get_mapped_value<line::bias,
+	return get_mapped_value<line::bias, gpiod_line_bias,
 				::gpiod_line_settings_get_bias>(this->_m_priv->settings.get(),
 								reverse_bias_mapping);
 }
 
 GPIOD_CXX_API line_settings& line_settings::set_drive(line::drive drive)
 {
-	set_mapped_value<line::drive,
+	set_mapped_value<line::drive, gpiod_line_drive,
 			 ::gpiod_line_settings_set_drive>(this->_m_priv->settings.get(),
 							  drive, drive_mapping);
 
@@ -221,7 +224,7 @@ GPIOD_CXX_API line_settings& line_settings::set_drive(line::drive drive)
 
 GPIOD_CXX_API line::drive line_settings::drive() const
 {
-	return get_mapped_value<line::drive,
+	return get_mapped_value<line::drive, gpiod_line_drive,
 				::gpiod_line_settings_get_drive>(this->_m_priv->settings.get(),
 								 reverse_drive_mapping);
 }
@@ -254,7 +257,7 @@ GPIOD_CXX_API ::std::chrono::microseconds line_settings::debounce_period() const
 
 GPIOD_CXX_API line_settings& line_settings::set_event_clock(line::clock event_clock)
 {
-	set_mapped_value<line::clock,
+	set_mapped_value<line::clock, gpiod_line_event_clock,
 			 ::gpiod_line_settings_set_event_clock>(this->_m_priv->settings.get(),
 								event_clock, clock_mapping);
 
@@ -263,7 +266,7 @@ GPIOD_CXX_API line_settings& line_settings::set_event_clock(line::clock event_cl
 
 GPIOD_CXX_API line::clock line_settings::event_clock() const
 {
-	return get_mapped_value<line::clock,
+	return get_mapped_value<line::clock, gpiod_line_event_clock,
 				::gpiod_line_settings_get_event_clock>(
 							this->_m_priv->settings.get(),
 							reverse_clock_mapping);
@@ -271,7 +274,7 @@ GPIOD_CXX_API line::clock line_settings::event_clock() const
 
 GPIOD_CXX_API line_settings& line_settings::set_output_value(line::value value)
 {
-	set_mapped_value<line::value,
+	set_mapped_value<line::value, gpiod_line_value,
 			 ::gpiod_line_settings_set_output_value>(this->_m_priv->settings.get(),
 								 value, value_mapping);
 
@@ -280,7 +283,7 @@ GPIOD_CXX_API line_settings& line_settings::set_output_value(line::value value)
 
 GPIOD_CXX_API line::value line_settings::output_value() const
 {
-	return get_mapped_value<line::value,
+	return get_mapped_value<line::value, gpiod_line_value,
 				::gpiod_line_settings_get_output_value>(
 							this->_m_priv->settings.get(),
 							reverse_value_mapping);
diff --git a/bindings/cxx/tests/gpiosim.cpp b/bindings/cxx/tests/gpiosim.cpp
index 0a29efe..281f9cc 100644
--- a/bindings/cxx/tests/gpiosim.cpp
+++ b/bindings/cxx/tests/gpiosim.cpp
@@ -12,18 +12,18 @@ namespace gpiosim {
 
 namespace {
 
-const ::std::map<chip::pull, int> pull_mapping = {
+const ::std::map<chip::pull, gpiosim_pull> pull_mapping = {
 	{ chip::pull::PULL_UP,		GPIOSIM_PULL_UP },
 	{ chip::pull::PULL_DOWN,	GPIOSIM_PULL_DOWN }
 };
 
-const ::std::map<chip_builder::hog_direction, int> hog_dir_mapping = {
+const ::std::map<chip_builder::hog_direction, gpiosim_direction> hog_dir_mapping = {
 	{ chip_builder::hog_direction::INPUT,		GPIOSIM_HOG_DIR_INPUT },
 	{ chip_builder::hog_direction::OUTPUT_HIGH,	GPIOSIM_HOG_DIR_OUTPUT_HIGH },
 	{ chip_builder::hog_direction::OUTPUT_LOW,	GPIOSIM_HOG_DIR_OUTPUT_LOW }
 };
 
-const ::std::map<int, chip::value> value_mapping = {
+const ::std::map<gpiosim_value, chip::value> value_mapping = {
 	{ GPIOSIM_VALUE_INACTIVE,	chip::value::INACTIVE },
 	{ GPIOSIM_VALUE_ACTIVE,		chip::value::ACTIVE }
 };
@@ -137,8 +137,8 @@ chip& chip::operator=(chip&& other)
 
 chip::value chip::get_value(unsigned int offset)
 {
-	int val = ::gpiosim_bank_get_value(this->_m_priv->bank.get(), offset);
-	if (val < 0)
+	auto val = ::gpiosim_bank_get_value(this->_m_priv->bank.get(), offset);
+	if (val == GPIOSIM_VALUE_ERROR)
 		throw ::std::system_error(errno, ::std::system_category(),
 					  "failed to read the simulated GPIO line value");
 
@@ -147,8 +147,8 @@ chip::value chip::get_value(unsigned int offset)
 
 void chip::set_pull(unsigned int offset, pull pull)
 {
-	int ret = ::gpiosim_bank_set_pull(this->_m_priv->bank.get(),
-					  offset, pull_mapping.at(pull));
+	auto ret = ::gpiosim_bank_set_pull(this->_m_priv->bank.get(),
+					   offset, pull_mapping.at(pull));
 	if (ret)
 		throw ::std::system_error(errno, ::std::system_category(),
 					  "failed to set the pull of simulated GPIO line");
diff --git a/bindings/python/gpiod/ext/line-settings.c b/bindings/python/gpiod/ext/line-settings.c
index f38b770..8ec1390 100644
--- a/bindings/python/gpiod/ext/line-settings.c
+++ b/bindings/python/gpiod/ext/line-settings.c
@@ -8,18 +8,10 @@ typedef struct {
 	struct gpiod_line_settings *settings;
 } line_settings_object;
 
-static int set_int_prop(struct gpiod_line_settings *settings, int val,
-			int (*func)(struct gpiod_line_settings *, int))
+static int set_error(void)
 {
-	int ret;
-
-	ret = func(settings, val);
-	if (ret) {
-		Py_gpiod_SetErrFromErrno();
-		return -1;
-	}
-
-	return 0;
+	Py_gpiod_SetErrFromErrno();
+	return -1;
 }
 
 static int
@@ -37,9 +29,14 @@ line_settings_init(line_settings_object *self, PyObject *args, PyObject *kwargs)
 		NULL
 	};
 
-	int direction, edge, bias, drive, active_low, event_clock, output_value,
-	    ret;
+	enum gpiod_line_event_clock event_clock;
+	enum gpiod_line_direction direction;
+	enum gpiod_line_value output_value;
 	unsigned long debounce_period;
+	enum gpiod_line_drive drive;
+	enum gpiod_line_edge edge;
+	enum gpiod_line_bias bias;
+	int ret, active_low;
 
 	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "IIIIpkII", kwlist,
 			&direction, &edge, &bias, &drive, &active_low,
@@ -53,39 +50,34 @@ line_settings_init(line_settings_object *self, PyObject *args, PyObject *kwargs)
 		return -1;
 	}
 
-	ret = set_int_prop(self->settings, direction,
-			   gpiod_line_settings_set_direction);
+	ret = gpiod_line_settings_set_direction(self->settings, direction);
 	if (ret)
-		return -1;
+		return set_error();
 
-	ret = set_int_prop(self->settings, edge,
-			   gpiod_line_settings_set_edge_detection);
+	ret = gpiod_line_settings_set_edge_detection(self->settings, edge);
 	if (ret)
-		return -1;
+		return set_error();
 
-	ret = set_int_prop(self->settings, bias,
-			   gpiod_line_settings_set_bias);
+	ret = gpiod_line_settings_set_bias(self->settings, bias);
 	if (ret)
-		return -1;
+		return set_error();
 
-	ret = set_int_prop(self->settings, drive,
-			   gpiod_line_settings_set_drive);
+	ret = gpiod_line_settings_set_drive(self->settings, drive);
 	if (ret)
-		return -1;
+		return set_error();
 
 	gpiod_line_settings_set_active_low(self->settings, active_low);
 	gpiod_line_settings_set_debounce_period_us(self->settings,
 						   debounce_period);
 
-	ret = set_int_prop(self->settings, edge,
-			   gpiod_line_settings_set_edge_detection);
+	ret = gpiod_line_settings_set_edge_detection(self->settings, edge);
 	if (ret)
-		return -1;
+		return set_error();
 
-	ret = set_int_prop(self->settings, output_value,
-			   gpiod_line_settings_set_output_value);
+	ret = gpiod_line_settings_set_output_value(self->settings,
+						   output_value);
 	if (ret)
-		return -1;
+		return set_error();
 
 	return 0;
 }
diff --git a/bindings/python/gpiod/ext/request.c b/bindings/python/gpiod/ext/request.c
index 820d1e1..62378f5 100644
--- a/bindings/python/gpiod/ext/request.c
+++ b/bindings/python/gpiod/ext/request.c
@@ -7,7 +7,7 @@ typedef struct {
 	PyObject_HEAD;
 	struct gpiod_line_request *request;
 	unsigned int *offsets;
-	int *values;
+	enum gpiod_line_value *values;
 	size_t num_lines;
 	struct gpiod_edge_event_buffer *buffer;
 } request_object;
@@ -360,10 +360,10 @@ PyObject *Py_gpiod_MakeRequestObject(struct gpiod_line_request *request,
 				     size_t event_buffer_size)
 {
 	struct gpiod_edge_event_buffer *buffer;
+	enum gpiod_line_value *values;
 	request_object *req_obj;
 	unsigned int *offsets;
 	size_t num_lines;
-	int *values;
 
 	num_lines = gpiod_line_request_get_num_lines(request);
 
diff --git a/bindings/rust/gpiosim-sys/src/lib.rs b/bindings/rust/gpiosim-sys/src/lib.rs
index 5391dbd..420e015 100644
--- a/bindings/rust/gpiosim-sys/src/lib.rs
+++ b/bindings/rust/gpiosim-sys/src/lib.rs
@@ -2,7 +2,7 @@
 // SPDX-FileCopyrightText: 2022 Linaro Ltd.
 // SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
 
-use libgpiod::{Error, Result};
+use libgpiod::{Error, Result, OperationType};
 
 #[allow(non_camel_case_types, non_upper_case_globals)]
 #[cfg_attr(test, allow(deref_nullptr, non_snake_case))]
@@ -15,6 +15,17 @@ use bindings_raw::*;
 mod sim;
 pub use sim::*;
 
+use crate::{
+    gpiosim_value_GPIOSIM_VALUE_INACTIVE as GPIOSIM_VALUE_INACTIVE,
+    gpiosim_value_GPIOSIM_VALUE_ACTIVE as GPIOSIM_VALUE_ACTIVE,	
+    gpiosim_value_GPIOSIM_VALUE_ERROR as GPIOSIM_VALUE_ERROR,
+    gpiosim_direction_GPIOSIM_HOG_DIR_INPUT as GPIOSIM_HOG_DIR_INPUT,
+    gpiosim_direction_GPIOSIM_HOG_DIR_OUTPUT_HIGH as GPIOSIM_HOG_DIR_OUTPUT_HIGH,
+    gpiosim_direction_GPIOSIM_HOG_DIR_OUTPUT_LOW as GPIOSIM_HOG_DIR_OUTPUT_LOW,
+    gpiosim_pull_GPIOSIM_PULL_UP as GPIOSIM_PULL_UP,
+    gpiosim_pull_GPIOSIM_PULL_DOWN as GPIOSIM_PULL_DOWN,
+};
+
 /// Value settings.
 #[derive(Copy, Clone, Debug, Eq, PartialEq)]
 pub enum Value {
@@ -25,12 +36,17 @@ pub enum Value {
 }
 
 impl Value {
-    pub(crate) fn new(val: u32) -> Result<Self> {
-        match val {
-            GPIOSIM_VALUE_INACTIVE => Ok(Value::InActive),
-            GPIOSIM_VALUE_ACTIVE => Ok(Value::Active),
-            _ => Err(Error::InvalidEnumValue("Value", val as u32)),
-        }
+    pub(crate) fn new(val: gpiosim_value) -> Result<Self> {
+        Ok(match val {
+            GPIOSIM_VALUE_INACTIVE => Value::InActive,
+            GPIOSIM_VALUE_ACTIVE => Value::Active,
+            GPIOSIM_VALUE_ERROR => {
+                return Err(Error::OperationFailed(
+                    OperationType::SimBankGetVal, errno::errno()
+                ))
+            }
+            _ => return Err(Error::InvalidEnumValue("Value", val as i32)),
+        })
     }
 }
 
@@ -46,12 +62,12 @@ pub enum Direction {
 }
 
 impl Direction {
-    fn val(self) -> i32 {
-        (match self {
+    fn val(self) -> gpiosim_direction {
+        match self {
             Direction::Input => GPIOSIM_HOG_DIR_INPUT,
             Direction::OutputHigh => GPIOSIM_HOG_DIR_OUTPUT_HIGH,
             Direction::OutputLow => GPIOSIM_HOG_DIR_OUTPUT_LOW,
-        }) as i32
+        }
     }
 }
 
@@ -65,10 +81,10 @@ pub enum Pull {
 }
 
 impl Pull {
-    fn val(self) -> i32 {
-        (match self {
+    fn val(self) -> gpiosim_pull {
+        match self {
             Pull::Up => GPIOSIM_PULL_UP,
             Pull::Down => GPIOSIM_PULL_DOWN,
-        }) as i32
+        }
     }
 }
diff --git a/bindings/rust/gpiosim-sys/src/sim.rs b/bindings/rust/gpiosim-sys/src/sim.rs
index 4930fb6..777bf08 100644
--- a/bindings/rust/gpiosim-sys/src/sim.rs
+++ b/bindings/rust/gpiosim-sys/src/sim.rs
@@ -164,7 +164,7 @@ impl SimBank {
                 errno::errno(),
             ))
         } else {
-            Value::new(ret as u32)
+            Value::new(ret as i32)
         }
     }
 
diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
index 161de16..d7a0615 100644
--- a/bindings/rust/libgpiod/src/lib.rs
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -24,6 +24,35 @@ use thiserror::Error as ThisError;
 
 use libgpiod_sys as gpiod;
 
+use gpiod::{
+    gpiod_edge_event_type_GPIOD_EDGE_EVENT_FALLING_EDGE as GPIOD_EDGE_EVENT_FALLING_EDGE,
+    gpiod_edge_event_type_GPIOD_EDGE_EVENT_RISING_EDGE as GPIOD_EDGE_EVENT_RISING_EDGE,
+    gpiod_info_event_type_GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED as GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED,
+    gpiod_info_event_type_GPIOD_INFO_EVENT_LINE_RELEASED as GPIOD_INFO_EVENT_LINE_RELEASED,
+    gpiod_info_event_type_GPIOD_INFO_EVENT_LINE_REQUESTED as GPIOD_INFO_EVENT_LINE_REQUESTED,
+    gpiod_line_bias_GPIOD_LINE_BIAS_AS_IS as GPIOD_LINE_BIAS_AS_IS,
+    gpiod_line_bias_GPIOD_LINE_BIAS_DISABLED as GPIOD_LINE_BIAS_DISABLED,
+    gpiod_line_bias_GPIOD_LINE_BIAS_PULL_DOWN as GPIOD_LINE_BIAS_PULL_DOWN,
+    gpiod_line_bias_GPIOD_LINE_BIAS_PULL_UP as GPIOD_LINE_BIAS_PULL_UP,
+    gpiod_line_bias_GPIOD_LINE_BIAS_UNKNOWN as GPIOD_LINE_BIAS_UNKNOWN,
+    gpiod_line_direction_GPIOD_LINE_DIRECTION_AS_IS as GPIOD_LINE_DIRECTION_AS_IS,
+    gpiod_line_direction_GPIOD_LINE_DIRECTION_INPUT as GPIOD_LINE_DIRECTION_INPUT,
+    gpiod_line_direction_GPIOD_LINE_DIRECTION_OUTPUT as GPIOD_LINE_DIRECTION_OUTPUT,
+    gpiod_line_drive_GPIOD_LINE_DRIVE_OPEN_DRAIN as GPIOD_LINE_DRIVE_OPEN_DRAIN,
+    gpiod_line_drive_GPIOD_LINE_DRIVE_OPEN_SOURCE as GPIOD_LINE_DRIVE_OPEN_SOURCE,
+    gpiod_line_drive_GPIOD_LINE_DRIVE_PUSH_PULL as GPIOD_LINE_DRIVE_PUSH_PULL,
+    gpiod_line_edge_GPIOD_LINE_EDGE_BOTH as GPIOD_LINE_EDGE_BOTH,
+    gpiod_line_edge_GPIOD_LINE_EDGE_FALLING as GPIOD_LINE_EDGE_FALLING,
+    gpiod_line_edge_GPIOD_LINE_EDGE_NONE as GPIOD_LINE_EDGE_NONE,
+    gpiod_line_edge_GPIOD_LINE_EDGE_RISING as GPIOD_LINE_EDGE_RISING,
+    gpiod_line_event_clock_GPIOD_LINE_EVENT_CLOCK_HTE as GPIOD_LINE_EVENT_CLOCK_HTE,
+    gpiod_line_event_clock_GPIOD_LINE_EVENT_CLOCK_MONOTONIC as GPIOD_LINE_EVENT_CLOCK_MONOTONIC,
+    gpiod_line_event_clock_GPIOD_LINE_EVENT_CLOCK_REALTIME as GPIOD_LINE_EVENT_CLOCK_REALTIME,
+    gpiod_line_value_GPIOD_LINE_VALUE_ACTIVE as GPIOD_LINE_VALUE_ACTIVE,
+    gpiod_line_value_GPIOD_LINE_VALUE_INACTIVE as GPIOD_LINE_VALUE_INACTIVE,
+    gpiod_line_value_GPIOD_LINE_VALUE_ERROR as GPIOD_LINE_VALUE_ERROR,
+};
+
 /// Operation types, used with OperationFailed() Error.
 #[derive(Copy, Clone, Debug, Eq, PartialEq)]
 pub enum OperationType {
@@ -96,7 +125,7 @@ pub enum Error {
     #[error("Invalid String")]
     InvalidString,
     #[error("Invalid enum {0} value: {1}")]
-    InvalidEnumValue(&'static str, u32),
+    InvalidEnumValue(&'static str, i32),
     #[error("Operation {0} Failed: {1}")]
     OperationFailed(OperationType, errno::Errno),
     #[error("Invalid Arguments")]
@@ -150,18 +179,24 @@ pub mod line {
     pub type ValueMap = IntMap<Value>;
 
     impl Value {
-        pub fn new(val: i32) -> Result<Self> {
+        pub fn new(val: gpiod::gpiod_line_value) -> Result<Self> {
             Ok(match val {
-                0 => Value::InActive,
-                1 => Value::Active,
-                _ => return Err(Error::InvalidEnumValue("Value", val as u32)),
+                GPIOD_LINE_VALUE_INACTIVE => Value::InActive,
+                GPIOD_LINE_VALUE_ACTIVE => Value::Active,
+                GPIOD_LINE_VALUE_ERROR => {
+                    return Err(Error::OperationFailed(
+                        OperationType::LineRequestGetVal,
+                        errno::errno(),
+                    ))
+                }
+                _ => return Err(Error::InvalidEnumValue("Value", val as i32)),
             })
         }
 
-        pub(crate) fn value(&self) -> i32 {
+        pub(crate) fn value(&self) -> gpiod::gpiod_line_value {
             match self {
-                Value::Active => 1,
-                Value::InActive => 0,
+                Value::Active => GPIOD_LINE_VALUE_ACTIVE,
+                Value::InActive => GPIOD_LINE_VALUE_INACTIVE,
             }
         }
     }
@@ -181,20 +216,20 @@ pub mod line {
     }
 
     impl Direction {
-        pub(crate) fn new(dir: u32) -> Result<Self> {
+        pub(crate) fn new(dir: gpiod::gpiod_line_direction) -> Result<Self> {
             Ok(match dir {
-                gpiod::GPIOD_LINE_DIRECTION_AS_IS => Direction::AsIs,
-                gpiod::GPIOD_LINE_DIRECTION_INPUT => Direction::Input,
-                gpiod::GPIOD_LINE_DIRECTION_OUTPUT => Direction::Output,
-                _ => return Err(Error::InvalidEnumValue("Direction", dir)),
+                GPIOD_LINE_DIRECTION_AS_IS => Direction::AsIs,
+                GPIOD_LINE_DIRECTION_INPUT => Direction::Input,
+                GPIOD_LINE_DIRECTION_OUTPUT => Direction::Output,
+                _ => return Err(Error::InvalidEnumValue("Direction", dir as i32)),
             })
         }
 
-        pub(crate) fn gpiod_direction(&self) -> u32 {
+        pub(crate) fn gpiod_direction(&self) -> gpiod::gpiod_line_direction {
             match self {
-                Direction::AsIs => gpiod::GPIOD_LINE_DIRECTION_AS_IS,
-                Direction::Input => gpiod::GPIOD_LINE_DIRECTION_INPUT,
-                Direction::Output => gpiod::GPIOD_LINE_DIRECTION_OUTPUT,
+                Direction::AsIs => GPIOD_LINE_DIRECTION_AS_IS,
+                Direction::Input => GPIOD_LINE_DIRECTION_INPUT,
+                Direction::Output => GPIOD_LINE_DIRECTION_OUTPUT,
             }
         }
     }
@@ -211,24 +246,24 @@ pub mod line {
     }
 
     impl Bias {
-        pub(crate) fn new(bias: u32) -> Result<Option<Self>> {
+        pub(crate) fn new(bias: gpiod::gpiod_line_bias) -> Result<Option<Self>> {
             Ok(match bias {
-                gpiod::GPIOD_LINE_BIAS_UNKNOWN => None,
-                gpiod::GPIOD_LINE_BIAS_AS_IS => None,
-                gpiod::GPIOD_LINE_BIAS_DISABLED => Some(Bias::Disabled),
-                gpiod::GPIOD_LINE_BIAS_PULL_UP => Some(Bias::PullUp),
-                gpiod::GPIOD_LINE_BIAS_PULL_DOWN => Some(Bias::PullDown),
-                _ => return Err(Error::InvalidEnumValue("Bias", bias)),
+                GPIOD_LINE_BIAS_UNKNOWN => None,
+                GPIOD_LINE_BIAS_AS_IS => None,
+                GPIOD_LINE_BIAS_DISABLED => Some(Bias::Disabled),
+                GPIOD_LINE_BIAS_PULL_UP => Some(Bias::PullUp),
+                GPIOD_LINE_BIAS_PULL_DOWN => Some(Bias::PullDown),
+                _ => return Err(Error::InvalidEnumValue("Bias", bias as i32)),
             })
         }
 
-        pub(crate) fn gpiod_bias(bias: Option<Bias>) -> u32 {
+        pub(crate) fn gpiod_bias(bias: Option<Bias>) -> gpiod::gpiod_line_bias {
             match bias {
-                None => gpiod::GPIOD_LINE_BIAS_AS_IS,
+                None => GPIOD_LINE_BIAS_AS_IS,
                 Some(bias) => match bias {
-                    Bias::Disabled => gpiod::GPIOD_LINE_BIAS_DISABLED,
-                    Bias::PullUp => gpiod::GPIOD_LINE_BIAS_PULL_UP,
-                    Bias::PullDown => gpiod::GPIOD_LINE_BIAS_PULL_DOWN,
+                    Bias::Disabled => GPIOD_LINE_BIAS_DISABLED,
+                    Bias::PullUp => GPIOD_LINE_BIAS_PULL_UP,
+                    Bias::PullDown => GPIOD_LINE_BIAS_PULL_DOWN,
                 },
             }
         }
@@ -246,20 +281,20 @@ pub mod line {
     }
 
     impl Drive {
-        pub(crate) fn new(drive: u32) -> Result<Self> {
+        pub(crate) fn new(drive: gpiod::gpiod_line_drive) -> Result<Self> {
             Ok(match drive {
-                gpiod::GPIOD_LINE_DRIVE_PUSH_PULL => Drive::PushPull,
-                gpiod::GPIOD_LINE_DRIVE_OPEN_DRAIN => Drive::OpenDrain,
-                gpiod::GPIOD_LINE_DRIVE_OPEN_SOURCE => Drive::OpenSource,
-                _ => return Err(Error::InvalidEnumValue("Drive", drive)),
+                GPIOD_LINE_DRIVE_PUSH_PULL => Drive::PushPull,
+                GPIOD_LINE_DRIVE_OPEN_DRAIN => Drive::OpenDrain,
+                GPIOD_LINE_DRIVE_OPEN_SOURCE => Drive::OpenSource,
+                _ => return Err(Error::InvalidEnumValue("Drive", drive as i32)),
             })
         }
 
-        pub(crate) fn gpiod_drive(&self) -> u32 {
+        pub(crate) fn gpiod_drive(&self) -> gpiod::gpiod_line_drive {
             match self {
-                Drive::PushPull => gpiod::GPIOD_LINE_DRIVE_PUSH_PULL,
-                Drive::OpenDrain => gpiod::GPIOD_LINE_DRIVE_OPEN_DRAIN,
-                Drive::OpenSource => gpiod::GPIOD_LINE_DRIVE_OPEN_SOURCE,
+                Drive::PushPull => GPIOD_LINE_DRIVE_PUSH_PULL,
+                Drive::OpenDrain => GPIOD_LINE_DRIVE_OPEN_DRAIN,
+                Drive::OpenSource => GPIOD_LINE_DRIVE_OPEN_SOURCE,
             }
         }
     }
@@ -276,23 +311,23 @@ pub mod line {
     }
 
     impl Edge {
-        pub(crate) fn new(edge: u32) -> Result<Option<Self>> {
+        pub(crate) fn new(edge: gpiod::gpiod_line_edge) -> Result<Option<Self>> {
             Ok(match edge {
-                gpiod::GPIOD_LINE_EDGE_NONE => None,
-                gpiod::GPIOD_LINE_EDGE_RISING => Some(Edge::Rising),
-                gpiod::GPIOD_LINE_EDGE_FALLING => Some(Edge::Falling),
-                gpiod::GPIOD_LINE_EDGE_BOTH => Some(Edge::Both),
-                _ => return Err(Error::InvalidEnumValue("Edge", edge)),
+                GPIOD_LINE_EDGE_NONE => None,
+                GPIOD_LINE_EDGE_RISING => Some(Edge::Rising),
+                GPIOD_LINE_EDGE_FALLING => Some(Edge::Falling),
+                GPIOD_LINE_EDGE_BOTH => Some(Edge::Both),
+                _ => return Err(Error::InvalidEnumValue("Edge", edge as i32)),
             })
         }
 
-        pub(crate) fn gpiod_edge(edge: Option<Edge>) -> u32 {
+        pub(crate) fn gpiod_edge(edge: Option<Edge>) -> gpiod::gpiod_line_edge {
             match edge {
-                None => gpiod::GPIOD_LINE_EDGE_NONE,
+                None => GPIOD_LINE_EDGE_NONE,
                 Some(edge) => match edge {
-                    Edge::Rising => gpiod::GPIOD_LINE_EDGE_RISING,
-                    Edge::Falling => gpiod::GPIOD_LINE_EDGE_FALLING,
-                    Edge::Both => gpiod::GPIOD_LINE_EDGE_BOTH,
+                    Edge::Rising => GPIOD_LINE_EDGE_RISING,
+                    Edge::Falling => GPIOD_LINE_EDGE_FALLING,
+                    Edge::Both => GPIOD_LINE_EDGE_BOTH,
                 },
             }
         }
@@ -358,20 +393,20 @@ pub mod line {
     }
 
     impl EventClock {
-        pub(crate) fn new(clock: u32) -> Result<Self> {
+        pub(crate) fn new(clock: gpiod::gpiod_line_event_clock) -> Result<Self> {
             Ok(match clock {
-                gpiod::GPIOD_LINE_EVENT_CLOCK_MONOTONIC => EventClock::Monotonic,
-                gpiod::GPIOD_LINE_EVENT_CLOCK_REALTIME => EventClock::Realtime,
-                gpiod::GPIOD_LINE_EVENT_CLOCK_HTE => EventClock::HTE,
-                _ => return Err(Error::InvalidEnumValue("Eventclock", clock)),
+                GPIOD_LINE_EVENT_CLOCK_MONOTONIC => EventClock::Monotonic,
+                GPIOD_LINE_EVENT_CLOCK_REALTIME => EventClock::Realtime,
+                GPIOD_LINE_EVENT_CLOCK_HTE => EventClock::HTE,
+                _ => return Err(Error::InvalidEnumValue("Eventclock", clock as i32)),
             })
         }
 
-        pub(crate) fn gpiod_clock(&self) -> u32 {
+        pub(crate) fn gpiod_clock(&self) -> gpiod::gpiod_line_event_clock {
             match self {
-                EventClock::Monotonic => gpiod::GPIOD_LINE_EVENT_CLOCK_MONOTONIC,
-                EventClock::Realtime => gpiod::GPIOD_LINE_EVENT_CLOCK_REALTIME,
-                EventClock::HTE => gpiod::GPIOD_LINE_EVENT_CLOCK_HTE,
+                EventClock::Monotonic => GPIOD_LINE_EVENT_CLOCK_MONOTONIC,
+                EventClock::Realtime => GPIOD_LINE_EVENT_CLOCK_REALTIME,
+                EventClock::HTE => GPIOD_LINE_EVENT_CLOCK_HTE,
             }
         }
     }
@@ -388,12 +423,12 @@ pub mod line {
     }
 
     impl InfoChangeKind {
-        pub(crate) fn new(kind: u32) -> Result<Self> {
+        pub(crate) fn new(kind: gpiod::gpiod_info_event_type) -> Result<Self> {
             Ok(match kind {
-                gpiod::GPIOD_INFO_EVENT_LINE_REQUESTED => InfoChangeKind::LineRequested,
-                gpiod::GPIOD_INFO_EVENT_LINE_RELEASED => InfoChangeKind::LineReleased,
-                gpiod::GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED => InfoChangeKind::LineConfigChanged,
-                _ => return Err(Error::InvalidEnumValue("InfoChangeKind", kind)),
+                GPIOD_INFO_EVENT_LINE_REQUESTED => InfoChangeKind::LineRequested,
+                GPIOD_INFO_EVENT_LINE_RELEASED => InfoChangeKind::LineReleased,
+                GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED => InfoChangeKind::LineConfigChanged,
+                _ => return Err(Error::InvalidEnumValue("InfoChangeKind", kind as i32)),
             })
         }
     }
@@ -408,11 +443,11 @@ pub mod line {
     }
 
     impl EdgeKind {
-        pub(crate) fn new(kind: u32) -> Result<Self> {
+        pub(crate) fn new(kind: gpiod::gpiod_edge_event_type) -> Result<Self> {
             Ok(match kind {
-                gpiod::GPIOD_EDGE_EVENT_RISING_EDGE => EdgeKind::Rising,
-                gpiod::GPIOD_EDGE_EVENT_FALLING_EDGE => EdgeKind::Falling,
-                _ => return Err(Error::InvalidEnumValue("EdgeEvent", kind)),
+                GPIOD_EDGE_EVENT_RISING_EDGE => EdgeKind::Rising,
+                GPIOD_EDGE_EVENT_FALLING_EDGE => EdgeKind::Falling,
+                _ => return Err(Error::InvalidEnumValue("EdgeEvent", kind as i32)),
             })
         }
     }
diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
index 1784cde..b45878c 100644
--- a/bindings/rust/libgpiod/src/line_info.rs
+++ b/bindings/rust/libgpiod/src/line_info.rs
@@ -100,7 +100,7 @@ impl Info {
     /// Get the GPIO line's direction.
     pub fn direction(&self) -> Result<Direction> {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        Direction::new(unsafe { gpiod::gpiod_line_info_get_direction(self.info) } as u32)
+        Direction::new(unsafe { gpiod::gpiod_line_info_get_direction(self.info) })
     }
 
     /// Returns true if the line is "active-low", false otherwise.
@@ -112,25 +112,25 @@ impl Info {
     /// Get the GPIO line's bias setting.
     pub fn bias(&self) -> Result<Option<Bias>> {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        Bias::new(unsafe { gpiod::gpiod_line_info_get_bias(self.info) } as u32)
+        Bias::new(unsafe { gpiod::gpiod_line_info_get_bias(self.info) })
     }
 
     /// Get the GPIO line's drive setting.
     pub fn drive(&self) -> Result<Drive> {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        Drive::new(unsafe { gpiod::gpiod_line_info_get_drive(self.info) } as u32)
+        Drive::new(unsafe { gpiod::gpiod_line_info_get_drive(self.info) })
     }
 
     /// Get the current edge detection setting of the line.
     pub fn edge_detection(&self) -> Result<Option<Edge>> {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        Edge::new(unsafe { gpiod::gpiod_line_info_get_edge_detection(self.info) } as u32)
+        Edge::new(unsafe { gpiod::gpiod_line_info_get_edge_detection(self.info) })
     }
 
     /// Get the current event clock setting used for edge event timestamps.
     pub fn event_clock(&self) -> Result<EventClock> {
         // SAFETY: `gpiod_line_info` is guaranteed to be valid here.
-        EventClock::new(unsafe { gpiod::gpiod_line_info_get_event_clock(self.info) } as u32)
+        EventClock::new(unsafe { gpiod::gpiod_line_info_get_event_clock(self.info) })
     }
 
     /// Returns true if the line is debounced (either by hardware or by the
diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
index cedf7ca..1c5ac66 100644
--- a/bindings/rust/libgpiod/src/line_settings.rs
+++ b/bindings/rust/libgpiod/src/line_settings.rs
@@ -102,10 +102,7 @@ impl Settings {
     pub fn set_direction(&mut self, direction: Direction) -> Result<&mut Self> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
         let ret = unsafe {
-            gpiod::gpiod_line_settings_set_direction(
-                self.settings,
-                direction.gpiod_direction() as i32,
-            )
+            gpiod::gpiod_line_settings_set_direction(self.settings, direction.gpiod_direction())
         };
 
         if ret == -1 {
@@ -121,17 +118,14 @@ impl Settings {
     /// Get the direction setting.
     pub fn direction(&self) -> Result<Direction> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
-        Direction::new(unsafe { gpiod::gpiod_line_settings_get_direction(self.settings) } as u32)
+        Direction::new(unsafe { gpiod::gpiod_line_settings_get_direction(self.settings) })
     }
 
     /// Set the edge event detection setting.
     pub fn set_edge_detection(&mut self, edge: Option<Edge>) -> Result<&mut Self> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
         let ret = unsafe {
-            gpiod::gpiod_line_settings_set_edge_detection(
-                self.settings,
-                Edge::gpiod_edge(edge) as i32,
-            )
+            gpiod::gpiod_line_settings_set_edge_detection(self.settings, Edge::gpiod_edge(edge))
         };
 
         if ret == -1 {
@@ -147,15 +141,14 @@ impl Settings {
     /// Get the edge event detection setting.
     pub fn edge_detection(&self) -> Result<Option<Edge>> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
-        Edge::new(unsafe { gpiod::gpiod_line_settings_get_edge_detection(self.settings) } as u32)
+        Edge::new(unsafe { gpiod::gpiod_line_settings_get_edge_detection(self.settings) })
     }
 
     /// Set the bias setting.
     pub fn set_bias(&mut self, bias: Option<Bias>) -> Result<&mut Self> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
-        let ret = unsafe {
-            gpiod::gpiod_line_settings_set_bias(self.settings, Bias::gpiod_bias(bias) as i32)
-        };
+        let ret =
+            unsafe { gpiod::gpiod_line_settings_set_bias(self.settings, Bias::gpiod_bias(bias)) };
 
         if ret == -1 {
             Err(Error::OperationFailed(
@@ -170,15 +163,14 @@ impl Settings {
     /// Get the bias setting.
     pub fn bias(&self) -> Result<Option<Bias>> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
-        Bias::new(unsafe { gpiod::gpiod_line_settings_get_bias(self.settings) } as u32)
+        Bias::new(unsafe { gpiod::gpiod_line_settings_get_bias(self.settings) })
     }
 
     /// Set the drive setting.
     pub fn set_drive(&mut self, drive: Drive) -> Result<&mut Self> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
-        let ret = unsafe {
-            gpiod::gpiod_line_settings_set_drive(self.settings, drive.gpiod_drive() as i32)
-        };
+        let ret =
+            unsafe { gpiod::gpiod_line_settings_set_drive(self.settings, drive.gpiod_drive()) };
 
         if ret == -1 {
             Err(Error::OperationFailed(
@@ -193,7 +185,7 @@ impl Settings {
     /// Get the drive setting.
     pub fn drive(&self) -> Result<Drive> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
-        Drive::new(unsafe { gpiod::gpiod_line_settings_get_drive(self.settings) } as u32)
+        Drive::new(unsafe { gpiod::gpiod_line_settings_get_drive(self.settings) })
     }
 
     /// Set active-low setting.
@@ -236,7 +228,7 @@ impl Settings {
     pub fn set_event_clock(&mut self, clock: EventClock) -> Result<&mut Self> {
         // SAFETY: `gpiod_line_settings` is guaranteed to be valid here.
         let ret = unsafe {
-            gpiod::gpiod_line_settings_set_event_clock(self.settings, clock.gpiod_clock() as i32)
+            gpiod::gpiod_line_settings_set_event_clock(self.settings, clock.gpiod_clock())
         };
 
         if ret == -1 {
diff --git a/include/gpiod.h b/include/gpiod.h
index 2975e3a..f4bb5f2 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -244,7 +244,9 @@ size_t gpiod_chip_info_get_num_lines(struct gpiod_chip_info *info);
 /**
  * @brief Logical line state.
  */
-enum {
+enum gpiod_line_value {
+	GPIOD_LINE_VALUE_ERROR = -1,
+	/**< Returned to indicate an error when reading the value. */
 	GPIOD_LINE_VALUE_INACTIVE = 0,
 	/**< Line is logically inactive. */
 	GPIOD_LINE_VALUE_ACTIVE = 1,
@@ -254,7 +256,7 @@ enum {
 /**
  * @brief Direction settings.
  */
-enum {
+enum gpiod_line_direction {
 	GPIOD_LINE_DIRECTION_AS_IS = 1,
 	/**< Request the line(s), but don't change direction. */
 	GPIOD_LINE_DIRECTION_INPUT,
@@ -266,7 +268,7 @@ enum {
 /**
  * @brief Edge detection settings.
  */
-enum {
+enum gpiod_line_edge {
 	GPIOD_LINE_EDGE_NONE = 1,
 	/**< Line edge detection is disabled. */
 	GPIOD_LINE_EDGE_RISING,
@@ -280,7 +282,7 @@ enum {
 /**
  * @brief Internal bias settings.
  */
-enum {
+enum gpiod_line_bias {
 	GPIOD_LINE_BIAS_AS_IS = 1,
 	/**< Don't change the bias setting when applying line config. */
 	GPIOD_LINE_BIAS_UNKNOWN,
@@ -296,7 +298,7 @@ enum {
 /**
  * @brief Drive settings.
  */
-enum {
+enum gpiod_line_drive {
 	GPIOD_LINE_DRIVE_PUSH_PULL = 1,
 	/**< Drive setting is push-pull. */
 	GPIOD_LINE_DRIVE_OPEN_DRAIN,
@@ -308,7 +310,7 @@ enum {
 /**
  * @brief Event clock settings.
  */
-enum {
+enum gpiod_line_event_clock {
 	GPIOD_LINE_EVENT_CLOCK_MONOTONIC = 1,
 	/**< Line uses the monotonic clock for edge event timestamps. */
 	GPIOD_LINE_EVENT_CLOCK_REALTIME,
@@ -404,7 +406,8 @@ const char *gpiod_line_info_get_consumer(struct gpiod_line_info *info);
  * @return Returns ::GPIOD_LINE_DIRECTION_INPUT or
  *	   ::GPIOD_LINE_DIRECTION_OUTPUT.
  */
-int gpiod_line_info_get_direction(struct gpiod_line_info *info);
+enum gpiod_line_direction
+gpiod_line_info_get_direction(struct gpiod_line_info *info);
 
 /**
  * @brief Get the edge detection setting of the line.
@@ -412,7 +415,8 @@ int gpiod_line_info_get_direction(struct gpiod_line_info *info);
  * @return Returns ::GPIOD_LINE_EDGE_NONE, ::GPIOD_LINE_EDGE_RISING,
  *	   ::GPIOD_LINE_EDGE_FALLING or ::GPIOD_LINE_EDGE_BOTH.
  */
-int gpiod_line_info_get_edge_detection(struct gpiod_line_info *info);
+enum gpiod_line_edge
+gpiod_line_info_get_edge_detection(struct gpiod_line_info *info);
 
 /**
  * @brief Get the bias setting of the line.
@@ -420,7 +424,8 @@ int gpiod_line_info_get_edge_detection(struct gpiod_line_info *info);
  * @return Returns ::GPIOD_LINE_BIAS_PULL_UP, ::GPIOD_LINE_BIAS_PULL_DOWN,
  *	   ::GPIOD_LINE_BIAS_DISABLED or ::GPIOD_LINE_BIAS_UNKNOWN.
  */
-int gpiod_line_info_get_bias(struct gpiod_line_info *info);
+enum gpiod_line_bias
+gpiod_line_info_get_bias(struct gpiod_line_info *info);
 
 /**
  * @brief Get the drive setting of the line.
@@ -428,7 +433,8 @@ int gpiod_line_info_get_bias(struct gpiod_line_info *info);
  * @return Returns ::GPIOD_LINE_DRIVE_PUSH_PULL, ::GPIOD_LINE_DRIVE_OPEN_DRAIN
  *	   or ::GPIOD_LINE_DRIVE_OPEN_SOURCE.
  */
-int gpiod_line_info_get_drive(struct gpiod_line_info *info);
+enum gpiod_line_drive
+gpiod_line_info_get_drive(struct gpiod_line_info *info);
 
 /**
  * @brief Check if the logical value of the line is inverted compared to the
@@ -462,7 +468,8 @@ gpiod_line_info_get_debounce_period_us(struct gpiod_line_info *info);
  * @return Returns ::GPIOD_LINE_EVENT_CLOCK_MONOTONIC or
  *	   ::GPIOD_LINE_EVENT_CLOCK_REALTIME.
  */
-int gpiod_line_info_get_event_clock(struct gpiod_line_info *info);
+enum gpiod_line_event_clock
+gpiod_line_info_get_event_clock(struct gpiod_line_info *info);
 
 /**
  * @}
@@ -482,7 +489,7 @@ int gpiod_line_info_get_event_clock(struct gpiod_line_info *info);
 /**
  * @brief Line status change event types.
  */
-enum {
+enum gpiod_info_event_type {
 	GPIOD_INFO_EVENT_LINE_REQUESTED = 1,
 	/**< Line has been requested. */
 	GPIOD_INFO_EVENT_LINE_RELEASED,
@@ -504,7 +511,8 @@ void gpiod_info_event_free(struct gpiod_info_event *event);
  *	   ::GPIOD_INFO_EVENT_LINE_RELEASED or
  *	   ::GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED.
  */
-int gpiod_info_event_get_event_type(struct gpiod_info_event *event);
+enum gpiod_info_event_type
+gpiod_info_event_get_event_type(struct gpiod_info_event *event);
 
 /**
  * @brief Get the timestamp of the event.
@@ -575,14 +583,15 @@ gpiod_line_settings_copy(struct gpiod_line_settings *settings);
  * @return 0 on success, -1 on error.
  */
 int gpiod_line_settings_set_direction(struct gpiod_line_settings *settings,
-				      int direction);
+				      enum gpiod_line_direction direction);
 
 /**
  * @brief Get direction.
  * @param settings Line settings object.
  * @return Current direction.
  */
-int gpiod_line_settings_get_direction(struct gpiod_line_settings *settings);
+enum gpiod_line_direction
+gpiod_line_settings_get_direction(struct gpiod_line_settings *settings);
 
 /**
  * @brief Set edge detection.
@@ -591,14 +600,14 @@ int gpiod_line_settings_get_direction(struct gpiod_line_settings *settings);
  * @return 0 on success, -1 on failure.
  */
 int gpiod_line_settings_set_edge_detection(struct gpiod_line_settings *settings,
-					   int edge);
+					   enum gpiod_line_edge edge);
 
 /**
  * @brief Get edge detection.
  * @param settings Line settings object.
  * @return Current edge detection setting.
  */
-int
+enum gpiod_line_edge
 gpiod_line_settings_get_edge_detection(struct gpiod_line_settings *settings);
 
 /**
@@ -608,14 +617,15 @@ gpiod_line_settings_get_edge_detection(struct gpiod_line_settings *settings);
  * @return 0 on success, -1 on failure.
  */
 int gpiod_line_settings_set_bias(struct gpiod_line_settings *settings,
-				 int bias);
+				 enum gpiod_line_bias bias);
 
 /**
  * @brief Get bias.
  * @param settings Line settings object.
  * @return Current bias setting.
  */
-int gpiod_line_settings_get_bias(struct gpiod_line_settings *settings);
+enum gpiod_line_bias
+gpiod_line_settings_get_bias(struct gpiod_line_settings *settings);
 
 /**
  * @brief Set drive.
@@ -624,14 +634,15 @@ int gpiod_line_settings_get_bias(struct gpiod_line_settings *settings);
  * @return 0 on success, -1 on failure.
  */
 int gpiod_line_settings_set_drive(struct gpiod_line_settings *settings,
-				  int drive);
+				  enum gpiod_line_drive drive);
 
 /**
  * @brief Get drive.
  * @param settings Line settings object.
  * @return Current drive setting.
  */
-int gpiod_line_settings_get_drive(struct gpiod_line_settings *settings);
+enum gpiod_line_drive
+gpiod_line_settings_get_drive(struct gpiod_line_settings *settings);
 
 /**
  * @brief Set active-low setting.
@@ -673,14 +684,15 @@ gpiod_line_settings_get_debounce_period_us(
  * @return 0 on success, -1 on failure.
  */
 int gpiod_line_settings_set_event_clock(struct gpiod_line_settings *settings,
-					int event_clock);
+				enum gpiod_line_event_clock event_clock);
 
 /**
  * @brief Get event clock setting.
  * @param settings Line settings object.
  * @return Current event clock setting.
  */
-int gpiod_line_settings_get_event_clock(struct gpiod_line_settings *settings);
+enum gpiod_line_event_clock
+gpiod_line_settings_get_event_clock(struct gpiod_line_settings *settings);
 
 /**
  * @brief Set the output value.
@@ -689,14 +701,15 @@ int gpiod_line_settings_get_event_clock(struct gpiod_line_settings *settings);
  * @return 0 on success, -1 on failure.
  */
 int gpiod_line_settings_set_output_value(struct gpiod_line_settings *settings,
-					 int value);
+					 enum gpiod_line_value value);
 
 /**
  * @brief Get the output value.
  * @param settings Line settings object.
  * @return Current output value.
  */
-int gpiod_line_settings_get_output_value(struct gpiod_line_settings *settings);
+enum gpiod_line_value
+gpiod_line_settings_get_output_value(struct gpiod_line_settings *settings);
 
 /*
  * @}
@@ -884,8 +897,9 @@ void gpiod_line_request_get_offsets(struct gpiod_line_request *request,
  * @param offset The offset of the line of which the value should be read.
  * @return Returns 1 or 0 on success and -1 on error.
  */
-int gpiod_line_request_get_value(struct gpiod_line_request *request,
-				 unsigned int offset);
+enum gpiod_line_value
+gpiod_line_request_get_value(struct gpiod_line_request *request,
+			     unsigned int offset);
 
 /**
  * @brief Get the values of a subset of requested lines.
@@ -901,7 +915,7 @@ int gpiod_line_request_get_value(struct gpiod_line_request *request,
 int gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
 					 size_t num_values,
 					 const unsigned int *offsets,
-					 int *values);
+					 enum gpiod_line_value *values);
 
 /**
  * @brief Get the values of all requested lines.
@@ -915,7 +929,7 @@ int gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
  * @return 0 on success, -1 on failure.
  */
 int gpiod_line_request_get_values(struct gpiod_line_request *request,
-				  int *values);
+				  enum gpiod_line_value *values);
 
 /**
  * @brief Set the value of a single requested line.
@@ -924,7 +938,8 @@ int gpiod_line_request_get_values(struct gpiod_line_request *request,
  * @param value Value to set.
  */
 int gpiod_line_request_set_value(struct gpiod_line_request *request,
-				 unsigned int offset, int value);
+				 unsigned int offset,
+				 enum gpiod_line_value value);
 
 /**
  * @brief Set the values of a subset of requested lines.
@@ -941,7 +956,7 @@ int gpiod_line_request_set_value(struct gpiod_line_request *request,
 int gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
 					 size_t num_values,
 					 const unsigned int *offsets,
-					 const int *values);
+					 const enum gpiod_line_value *values);
 
 /**
  * @brief Set the values of all lines associated with a request.
@@ -954,7 +969,7 @@ int gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
  *		 ::gpiod_line_request_get_offsets.
  */
 int gpiod_line_request_set_values(struct gpiod_line_request *request,
-				  const int *values);
+				  const enum gpiod_line_value *values);
 
 /**
  * @brief Update the configuration of lines associated with a line request.
@@ -1032,7 +1047,7 @@ int gpiod_line_request_read_edge_event(struct gpiod_line_request *request,
 /**
  * @brief Event types.
  */
-enum {
+enum gpiod_edge_event_type {
 	GPIOD_EDGE_EVENT_RISING_EDGE = 1,
 	/**< Rising edge event. */
 	GPIOD_EDGE_EVENT_FALLING_EDGE
@@ -1059,7 +1074,8 @@ struct gpiod_edge_event *gpiod_edge_event_copy(struct gpiod_edge_event *event);
  * @return The event type (::GPIOD_EDGE_EVENT_RISING_EDGE or
  *	   ::GPIOD_EDGE_EVENT_FALLING_EDGE).
  */
-int gpiod_edge_event_get_event_type(struct gpiod_edge_event *event);
+enum gpiod_edge_event_type
+gpiod_edge_event_get_event_type(struct gpiod_edge_event *event);
 
 /**
  * @brief Get the timestamp of the event.
diff --git a/lib/edge-event.c b/lib/edge-event.c
index 48a0f95..ad8a7d1 100644
--- a/lib/edge-event.c
+++ b/lib/edge-event.c
@@ -13,7 +13,7 @@
 #define EVENT_BUFFER_MAX_CAPACITY (GPIO_V2_LINES_MAX * 16)
 
 struct gpiod_edge_event {
-	int event_type;
+	enum gpiod_edge_event_type event_type;
 	uint64_t timestamp;
 	unsigned int line_offset;
 	unsigned long global_seqno;
@@ -49,7 +49,8 @@ gpiod_edge_event_copy(struct gpiod_edge_event *event)
 	return copy;
 }
 
-GPIOD_API int gpiod_edge_event_get_event_type(struct gpiod_edge_event *event)
+GPIOD_API enum gpiod_edge_event_type
+gpiod_edge_event_get_event_type(struct gpiod_edge_event *event)
 {
 	return event->event_type;
 }
diff --git a/lib/info-event.c b/lib/info-event.c
index 73a3d6d..c0d7307 100644
--- a/lib/info-event.c
+++ b/lib/info-event.c
@@ -9,7 +9,7 @@
 #include "internal.h"
 
 struct gpiod_info_event {
-	int event_type;
+	enum gpiod_info_event_type event_type;
 	uint64_t timestamp;
 	struct gpiod_line_info *info;
 };
@@ -61,7 +61,8 @@ GPIOD_API void gpiod_info_event_free(struct gpiod_info_event *event)
 	free(event);
 }
 
-GPIOD_API int gpiod_info_event_get_event_type(struct gpiod_info_event *event)
+GPIOD_API enum gpiod_info_event_type
+gpiod_info_event_get_event_type(struct gpiod_info_event *event)
 {
 	return event->event_type;
 }
diff --git a/lib/line-config.c b/lib/line-config.c
index 5ee7390..48ea618 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -194,7 +194,7 @@ static void set_kernel_output_values(uint64_t *mask, uint64_t *vals,
 				     struct gpiod_line_config *config)
 {
 	struct per_line_config *per_line;
-	int value;
+	enum gpiod_line_value value;
 	size_t i;
 
 	gpiod_line_mask_zero(mask);
@@ -292,6 +292,8 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
 	case GPIOD_LINE_DIRECTION_OUTPUT:
 		flags |= GPIO_V2_LINE_FLAG_OUTPUT;
 		break;
+	default:
+		break;
 	}
 
 	switch (gpiod_line_settings_get_edge_detection(settings)) {
@@ -311,6 +313,8 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
 			   GPIO_V2_LINE_FLAG_INPUT);
 		flags &= ~GPIOD_LINE_DIRECTION_OUTPUT;
 		break;
+	default:
+		break;
 	}
 
 	switch (gpiod_line_settings_get_drive(settings)) {
@@ -320,6 +324,8 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
 	case GPIOD_LINE_DRIVE_OPEN_SOURCE:
 		flags |= GPIO_V2_LINE_FLAG_OPEN_SOURCE;
 		break;
+	default:
+		break;
 	}
 
 	switch (gpiod_line_settings_get_bias(settings)) {
@@ -332,6 +338,8 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
 	case GPIOD_LINE_BIAS_PULL_DOWN:
 		flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN;
 		break;
+	default:
+		break;
 	}
 
 	if (gpiod_line_settings_get_active_low(settings))
@@ -344,6 +352,8 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
 	case GPIOD_LINE_EVENT_CLOCK_HTE:
 		flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE;
 		break;
+	default:
+		break;
 	}
 
 	return flags;
diff --git a/lib/line-info.c b/lib/line-info.c
index 9809c43..75d886f 100644
--- a/lib/line-info.c
+++ b/lib/line-info.c
@@ -12,12 +12,12 @@ struct gpiod_line_info {
 	char name[GPIO_MAX_NAME_SIZE];
 	bool used;
 	char consumer[GPIO_MAX_NAME_SIZE];
-	int direction;
+	enum gpiod_line_direction direction;
 	bool active_low;
-	int bias;
-	int drive;
-	int edge;
-	int event_clock;
+	enum gpiod_line_bias bias;
+	enum gpiod_line_drive drive;
+	enum gpiod_line_edge edge;
+	enum gpiod_line_event_clock event_clock;
 	bool debounced;
 	unsigned long debounce_period_us;
 };
@@ -64,7 +64,8 @@ GPIOD_API const char *gpiod_line_info_get_consumer(struct gpiod_line_info *info)
 	return info->consumer[0] == '\0' ? NULL : info->consumer;
 }
 
-GPIOD_API int gpiod_line_info_get_direction(struct gpiod_line_info *info)
+GPIOD_API enum gpiod_line_direction
+gpiod_line_info_get_direction(struct gpiod_line_info *info)
 {
 	return info->direction;
 }
@@ -74,22 +75,26 @@ GPIOD_API bool gpiod_line_info_is_active_low(struct gpiod_line_info *info)
 	return info->active_low;
 }
 
-GPIOD_API int gpiod_line_info_get_bias(struct gpiod_line_info *info)
+GPIOD_API enum gpiod_line_bias
+gpiod_line_info_get_bias(struct gpiod_line_info *info)
 {
 	return info->bias;
 }
 
-GPIOD_API int gpiod_line_info_get_drive(struct gpiod_line_info *info)
+GPIOD_API enum gpiod_line_drive
+gpiod_line_info_get_drive(struct gpiod_line_info *info)
 {
 	return info->drive;
 }
 
-GPIOD_API int gpiod_line_info_get_edge_detection(struct gpiod_line_info *info)
+GPIOD_API enum gpiod_line_edge
+gpiod_line_info_get_edge_detection(struct gpiod_line_info *info)
 {
 	return info->edge;
 }
 
-GPIOD_API int gpiod_line_info_get_event_clock(struct gpiod_line_info *info)
+GPIOD_API enum gpiod_line_event_clock
+gpiod_line_info_get_event_clock(struct gpiod_line_info *info)
 {
 	return info->event_clock;
 }
diff --git a/lib/line-request.c b/lib/line-request.c
index ee452e7..5936593 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -57,15 +57,16 @@ gpiod_line_request_get_offsets(struct gpiod_line_request *request,
 	       sizeof(*offsets) * request->num_lines);
 }
 
-GPIOD_API int gpiod_line_request_get_value(struct gpiod_line_request *request,
-					   unsigned int offset)
+GPIOD_API enum gpiod_line_value
+gpiod_line_request_get_value(struct gpiod_line_request *request,
+			     unsigned int offset)
 {
+	enum gpiod_line_value val;
 	unsigned int ret;
-	int val;
 
 	ret = gpiod_line_request_get_values_subset(request, 1, &offset, &val);
 	if (ret)
-		return -1;
+		return GPIOD_LINE_VALUE_ERROR;
 
 	return val;
 }
@@ -86,7 +87,8 @@ static int offset_to_bit(struct gpiod_line_request *request,
 GPIOD_API int
 gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
 				     size_t num_values,
-				     const unsigned int *offsets, int *values)
+				     const unsigned int *offsets,
+				     enum gpiod_line_value *values)
 {
 	struct gpio_v2_line_values uapi_values;
 	uint64_t mask = 0, bits = 0;
@@ -123,14 +125,15 @@ gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
 }
 
 GPIOD_API int gpiod_line_request_get_values(struct gpiod_line_request *request,
-					    int *values)
+					    enum gpiod_line_value *values)
 {
 	return gpiod_line_request_get_values_subset(request, request->num_lines,
 						    request->offsets, values);
 }
 
 GPIOD_API int gpiod_line_request_set_value(struct gpiod_line_request *request,
-					   unsigned int offset, int value)
+					   unsigned int offset,
+					   enum gpiod_line_value value)
 {
 	return gpiod_line_request_set_values_subset(request, 1,
 						    &offset, &value);
@@ -140,7 +143,7 @@ GPIOD_API int
 gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
 				     size_t num_values,
 				     const unsigned int *offsets,
-				     const int *values)
+				     const enum gpiod_line_value *values)
 {
 	struct gpio_v2_line_values uapi_values;
 	uint64_t mask = 0, bits = 0;
@@ -166,7 +169,7 @@ gpiod_line_request_set_values_subset(struct gpiod_line_request *request,
 }
 
 GPIOD_API int gpiod_line_request_set_values(struct gpiod_line_request *request,
-					    const int *values)
+					    const enum gpiod_line_value *values)
 {
 	return gpiod_line_request_set_values_subset(request, request->num_lines,
 						    request->offsets, values);
diff --git a/lib/line-settings.c b/lib/line-settings.c
index f97a90e..f245b20 100644
--- a/lib/line-settings.c
+++ b/lib/line-settings.c
@@ -9,14 +9,14 @@
 #include "internal.h"
 
 struct gpiod_line_settings {
-	int direction;
-	int edge_detection;
-	int drive;
-	int bias;
+	enum gpiod_line_direction direction;
+	enum gpiod_line_edge edge_detection;
+	enum gpiod_line_drive drive;
+	enum gpiod_line_bias bias;
 	bool active_low;
-	int event_clock;
+	enum gpiod_line_event_clock event_clock;
 	long debounce_period_us;
-	int output_value;
+	enum gpiod_line_value output_value;
 };
 
 GPIOD_API struct gpiod_line_settings *gpiod_line_settings_new(void)
@@ -65,7 +65,7 @@ gpiod_line_settings_copy(struct gpiod_line_settings *settings)
 
 GPIOD_API int
 gpiod_line_settings_set_direction(struct gpiod_line_settings *settings,
-				  int direction)
+				  enum gpiod_line_direction direction)
 {
 	switch (direction) {
 	case GPIOD_LINE_DIRECTION_INPUT:
@@ -82,7 +82,7 @@ gpiod_line_settings_set_direction(struct gpiod_line_settings *settings,
 	return 0;
 }
 
-GPIOD_API int
+GPIOD_API enum gpiod_line_direction
 gpiod_line_settings_get_direction(struct gpiod_line_settings *settings)
 {
 	return settings->direction;
@@ -90,7 +90,7 @@ gpiod_line_settings_get_direction(struct gpiod_line_settings *settings)
 
 GPIOD_API int
 gpiod_line_settings_set_edge_detection(struct gpiod_line_settings *settings,
-				       int edge)
+				       enum gpiod_line_edge edge)
 {
 	switch (edge) {
 	case GPIOD_LINE_EDGE_NONE:
@@ -108,14 +108,15 @@ gpiod_line_settings_set_edge_detection(struct gpiod_line_settings *settings,
 	return 0;
 }
 
-GPIOD_API int
+GPIOD_API enum gpiod_line_edge
 gpiod_line_settings_get_edge_detection(struct gpiod_line_settings *settings)
 {
 	return settings->edge_detection;
 }
 
 GPIOD_API int
-gpiod_line_settings_set_bias(struct gpiod_line_settings *settings, int bias)
+gpiod_line_settings_set_bias(struct gpiod_line_settings *settings,
+			     enum gpiod_line_bias bias)
 {
 	switch (bias) {
 	case GPIOD_LINE_BIAS_AS_IS:
@@ -133,13 +134,15 @@ gpiod_line_settings_set_bias(struct gpiod_line_settings *settings, int bias)
 	return 0;
 }
 
-GPIOD_API int gpiod_line_settings_get_bias(struct gpiod_line_settings *settings)
+GPIOD_API enum gpiod_line_bias
+gpiod_line_settings_get_bias(struct gpiod_line_settings *settings)
 {
 	return settings->bias;
 }
 
 GPIOD_API int
-gpiod_line_settings_set_drive(struct gpiod_line_settings *settings, int drive)
+gpiod_line_settings_set_drive(struct gpiod_line_settings *settings,
+			      enum gpiod_line_drive drive)
 {
 	switch (drive) {
 	case GPIOD_LINE_DRIVE_PUSH_PULL:
@@ -156,7 +159,7 @@ gpiod_line_settings_set_drive(struct gpiod_line_settings *settings, int drive)
 	return 0;
 }
 
-GPIOD_API int
+GPIOD_API enum gpiod_line_drive
 gpiod_line_settings_get_drive(struct gpiod_line_settings *settings)
 {
 	return settings->drive;
@@ -190,7 +193,7 @@ gpiod_line_settings_get_debounce_period_us(struct gpiod_line_settings *settings)
 
 GPIOD_API int
 gpiod_line_settings_set_event_clock(struct gpiod_line_settings *settings,
-				    int event_clock)
+				    enum gpiod_line_event_clock event_clock)
 {
 	switch (event_clock) {
 	case GPIOD_LINE_EVENT_CLOCK_MONOTONIC:
@@ -207,7 +210,7 @@ gpiod_line_settings_set_event_clock(struct gpiod_line_settings *settings,
 	return 0;
 }
 
-GPIOD_API int
+GPIOD_API enum gpiod_line_event_clock
 gpiod_line_settings_get_event_clock(struct gpiod_line_settings *settings)
 {
 	return settings->event_clock;
@@ -215,7 +218,7 @@ gpiod_line_settings_get_event_clock(struct gpiod_line_settings *settings)
 
 GPIOD_API int
 gpiod_line_settings_set_output_value(struct gpiod_line_settings *settings,
-				     int value)
+				     enum gpiod_line_value value)
 {
 	switch (value) {
 	case GPIOD_LINE_VALUE_INACTIVE:
@@ -231,7 +234,7 @@ gpiod_line_settings_set_output_value(struct gpiod_line_settings *settings,
 	return 0;
 }
 
-GPIOD_API int
+GPIOD_API enum gpiod_line_value
 gpiod_line_settings_get_output_value(struct gpiod_line_settings *settings)
 {
 	return settings->output_value;
diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
index ea638cd..5a8ec88 100644
--- a/tests/gpiosim/gpiosim.c
+++ b/tests/gpiosim/gpiosim.c
@@ -1007,8 +1007,8 @@ GPIOSIM_API int gpiosim_bank_set_line_name(struct gpiosim_bank *bank,
 }
 
 GPIOSIM_API int gpiosim_bank_hog_line(struct gpiosim_bank *bank,
-				      unsigned int offset,
-				      const char *name, int direction)
+				      unsigned int offset, const char *name,
+				      enum gpiosim_direction direction)
 {
 	char buf[64], *dir;
 	int ret, fd;
@@ -1081,15 +1081,16 @@ static int sysfs_read_bank_attr(struct gpiosim_bank *bank, unsigned int offset,
 	return open_read_close(bank->sysfs_dir_fd, where, buf, bufsize);
 }
 
-GPIOSIM_API int gpiosim_bank_get_value(struct gpiosim_bank *bank,
-				       unsigned int offset)
+GPIOSIM_API enum
+gpiosim_value gpiosim_bank_get_value(struct gpiosim_bank *bank,
+				     unsigned int offset)
 {
 	char what[3];
 	int ret;
 
 	ret = sysfs_read_bank_attr(bank, offset, "value", what, sizeof(what));
 	if (ret)
-		return ret;
+		return GPIOSIM_VALUE_ERROR;
 
 	if (what[0] == '0')
 		return GPIOSIM_VALUE_INACTIVE;
@@ -1097,18 +1098,18 @@ GPIOSIM_API int gpiosim_bank_get_value(struct gpiosim_bank *bank,
 		return GPIOSIM_VALUE_ACTIVE;
 
 	errno = EIO;
-	return -1;
+	return GPIOSIM_VALUE_ERROR;
 }
 
-GPIOSIM_API int gpiosim_bank_get_pull(struct gpiosim_bank *bank,
-				      unsigned int offset)
+GPIOSIM_API enum gpiosim_pull
+gpiosim_bank_get_pull(struct gpiosim_bank *bank, unsigned int offset)
 {
 	char what[16];
 	int ret;
 
 	ret = sysfs_read_bank_attr(bank, offset, "pull", what, sizeof(what));
 	if (ret)
-		return ret;
+		return GPIOSIM_PULL_ERROR;
 
 	if (strcmp(what, "pull-down") == 0)
 		return GPIOSIM_PULL_DOWN;
@@ -1116,11 +1117,12 @@ GPIOSIM_API int gpiosim_bank_get_pull(struct gpiosim_bank *bank,
 		return GPIOSIM_PULL_UP;
 
 	errno = EIO;
-	return -1;
+	return GPIOSIM_PULL_ERROR;
 }
 
-GPIOSIM_API int gpiosim_bank_set_pull(struct gpiosim_bank *bank,
-				      unsigned int offset, int pull)
+GPIOSIM_API int
+gpiosim_bank_set_pull(struct gpiosim_bank *bank,
+		      unsigned int offset, enum gpiosim_pull pull)
 {
 	struct gpiosim_dev *dev = bank->dev;
 	char where[32], what[16];
diff --git a/tests/gpiosim/gpiosim.h b/tests/gpiosim/gpiosim.h
index 8013595..80d437e 100644
--- a/tests/gpiosim/gpiosim.h
+++ b/tests/gpiosim/gpiosim.h
@@ -15,17 +15,19 @@ struct gpiosim_ctx;
 struct gpiosim_dev;
 struct gpiosim_bank;
 
-enum {
+enum gpiosim_value {
+	GPIOSIM_VALUE_ERROR = -1,
 	GPIOSIM_VALUE_INACTIVE = 0,
 	GPIOSIM_VALUE_ACTIVE = 1,
 };
 
-enum {
+enum gpiosim_pull {
+	GPIOSIM_PULL_ERROR = -1,
 	GPIOSIM_PULL_DOWN = 1,
 	GPIOSIM_PULL_UP,
 };
 
-enum {
+enum gpiosim_direction {
 	GPIOSIM_HOG_DIR_INPUT = 1,
 	GPIOSIM_HOG_DIR_OUTPUT_HIGH,
 	GPIOSIM_HOG_DIR_OUTPUT_LOW,
@@ -59,13 +61,15 @@ int gpiosim_bank_set_num_lines(struct gpiosim_bank *bank, size_t num_lines);
 int gpiosim_bank_set_line_name(struct gpiosim_bank *bank,
 			       unsigned int offset, const char *name);
 int gpiosim_bank_hog_line(struct gpiosim_bank *bank, unsigned int offset,
-			  const char *name, int direction);
+			  const char *name, enum gpiosim_direction direction);
 int gpiosim_bank_clear_hog(struct gpiosim_bank *bank, unsigned int offset);
 
-int gpiosim_bank_get_value(struct gpiosim_bank *bank, unsigned int offset);
-int gpiosim_bank_get_pull(struct gpiosim_bank *bank, unsigned int offset);
+enum gpiosim_value
+gpiosim_bank_get_value(struct gpiosim_bank *bank, unsigned int offset);
+enum gpiosim_pull
+gpiosim_bank_get_pull(struct gpiosim_bank *bank, unsigned int offset);
 int gpiosim_bank_set_pull(struct gpiosim_bank *bank,
-			  unsigned int offset, int pull);
+			  unsigned int offset, enum gpiosim_pull pull);
 
 #ifdef __cplusplus
 } /* extern "C" */
diff --git a/tests/tests-line-request.c b/tests/tests-line-request.c
index 92e3028..6cf85ab 100644
--- a/tests/tests-line-request.c
+++ b/tests/tests-line-request.c
@@ -173,7 +173,8 @@ GPIOD_TEST_CASE(read_all_values)
 	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
-	gint ret, values[5];
+	enum gpiod_line_value values[5];
+	gint ret;
 	guint i;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
@@ -232,11 +233,13 @@ GPIOD_TEST_CASE(request_multiple_values_but_read_one)
 GPIOD_TEST_CASE(set_all_values)
 {
 	static const guint offsets[] = { 0, 2, 4, 5, 6 };
-	static const gint values[] = { GPIOD_LINE_VALUE_ACTIVE,
-				       GPIOD_LINE_VALUE_INACTIVE,
-				       GPIOD_LINE_VALUE_ACTIVE,
-				       GPIOD_LINE_VALUE_ACTIVE,
-				       GPIOD_LINE_VALUE_ACTIVE };
+	static const enum gpiod_line_value values[] = {
+		GPIOD_LINE_VALUE_ACTIVE,
+		GPIOD_LINE_VALUE_INACTIVE,
+		GPIOD_LINE_VALUE_ACTIVE,
+		GPIOD_LINE_VALUE_ACTIVE,
+		GPIOD_LINE_VALUE_ACTIVE
+	};
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
@@ -270,9 +273,11 @@ GPIOD_TEST_CASE(set_values_subset_of_lines)
 {
 	static const guint offsets[] = { 0, 1, 2, 3 };
 	static const guint offsets_to_set[] = { 0, 1, 3 };
-	static const gint values[] = { GPIOD_LINE_VALUE_ACTIVE,
-				       GPIOD_LINE_VALUE_INACTIVE,
-				       GPIOD_LINE_VALUE_ACTIVE };
+	static const enum gpiod_line_value values[] = {
+		GPIOD_LINE_VALUE_ACTIVE,
+		GPIOD_LINE_VALUE_INACTIVE,
+		GPIOD_LINE_VALUE_ACTIVE
+	};
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
@@ -508,8 +513,8 @@ GPIOD_TEST_CASE(request_lines_with_unordered_offsets)
 	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
+	enum gpiod_line_value values[4];
 	guint set_offsets[4];
-	gint values[4];
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
 	settings = gpiod_test_create_line_settings_or_fail();
diff --git a/tools/gpioget.c b/tools/gpioget.c
index 31a3102..08c17e6 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -17,8 +17,8 @@ struct config {
 	bool numeric;
 	bool strict;
 	bool unquoted;
-	int bias;
-	int direction;
+	enum gpiod_line_bias bias;
+	enum gpiod_line_direction direction;
 	unsigned int hold_period_us;
 	const char *chip_id;
 	const char *consumer;
@@ -137,11 +137,12 @@ int main(int argc, char **argv)
 	struct gpiod_request_config *req_cfg;
 	struct gpiod_line_request *request;
 	struct gpiod_line_config *line_cfg;
-	int i, num_lines, ret, *values;
 	struct line_resolver *resolver;
+	enum gpiod_line_value *values;
 	struct resolved_line *line;
 	struct gpiod_chip *chip;
 	unsigned int *offsets;
+	int i, num_lines, ret;
 	struct config cfg;
 	const char *fmt;
 
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 45e4471..dc157df 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -21,14 +21,14 @@ struct config {
 	bool quiet;
 	bool strict;
 	bool unquoted;
-	int bias;
-	int edges;
+	enum gpiod_line_bias bias;
+	enum gpiod_line_edge edges;
 	int events_wanted;
 	unsigned int debounce_period_us;
 	const char *chip_id;
 	const char *consumer;
 	const char *fmt;
-	int event_clock;
+	enum gpiod_line_event_clock event_clock;
 	int timestamp_fmt;
 };
 
diff --git a/tools/gpioset.c b/tools/gpioset.c
index c49d229..a32c894 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -25,8 +25,8 @@ struct config {
 	bool interactive;
 	bool strict;
 	bool unquoted;
-	int bias;
-	int drive;
+	enum gpiod_line_bias bias;
+	enum gpiod_line_drive drive;
 	int toggles;
 	unsigned int *toggle_periods;
 	unsigned int hold_period_us;
@@ -228,25 +228,26 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 	return optind;
 }
 
-static int parse_value(const char *option)
+static enum gpiod_line_value parse_value(const char *option)
 {
 	if (strcmp(option, "0") == 0)
-		return 0;
+		return GPIOD_LINE_VALUE_INACTIVE;
 	if (strcmp(option, "1") == 0)
-		return 1;
+		return GPIOD_LINE_VALUE_ACTIVE;
 	if (strcmp(option, "inactive") == 0)
-		return 0;
+		return GPIOD_LINE_VALUE_INACTIVE;
 	if (strcmp(option, "active") == 0)
-		return 1;
+		return GPIOD_LINE_VALUE_ACTIVE;
 	if (strcmp(option, "off") == 0)
-		return 0;
+		return GPIOD_LINE_VALUE_INACTIVE;
 	if (strcmp(option, "on") == 0)
-		return 1;
+		return GPIOD_LINE_VALUE_ACTIVE;
 	if (strcmp(option, "false") == 0)
-		return 0;
+		return GPIOD_LINE_VALUE_INACTIVE;
 	if (strcmp(option, "true") == 0)
-		return 1;
-	return -1;
+		return GPIOD_LINE_VALUE_ACTIVE;
+
+	return GPIOD_LINE_VALUE_ERROR;
 }
 
 /*
@@ -259,7 +260,7 @@ static int parse_value(const char *option)
  * If line id is quoted then it is returned unquoted.
  */
 static bool parse_line_values(int num_lines, char **lvs, char **lines,
-			      int *values, bool interactive)
+			      enum gpiod_line_value *values, bool interactive)
 {
 	char *value;
 	char *line;
@@ -293,7 +294,7 @@ static bool parse_line_values(int num_lines, char **lvs, char **lines,
 		value++;
 		values[i] = parse_value(value);
 
-		if (values[i] < 0) {
+		if (values[i] == GPIOD_LINE_VALUE_ERROR) {
 			if (interactive)
 				printf("invalid line value: '%s'\n", value);
 			else
@@ -312,7 +313,7 @@ static bool parse_line_values(int num_lines, char **lvs, char **lines,
  * Parse line id and values from lvs into lines and values, or die trying.
  */
 static void parse_line_values_or_die(int num_lines, char **lvs, char **lines,
-				     int *values)
+				     enum gpiod_line_value *values)
 {
 	if (!parse_line_values(num_lines, lvs, lines, values, false))
 		exit(EXIT_FAILURE);
@@ -352,7 +353,7 @@ static void wait_fd(int fd)
  */
 static void apply_values(struct gpiod_line_request **requests,
 			 struct line_resolver *resolver,
-			 unsigned int *offsets, int *values)
+			 unsigned int *offsets, enum gpiod_line_value *values)
 {
 	int i;
 
@@ -381,7 +382,7 @@ static void toggle_all_lines(struct line_resolver *resolver)
 static void toggle_sequence(int toggles, unsigned int *toggle_periods,
 			 struct gpiod_line_request **requests,
 			 struct line_resolver *resolver,
-			 unsigned int *offsets, int *values)
+			 unsigned int *offsets, enum gpiod_line_value *values)
 {
 	int i = 0;
 
@@ -436,7 +437,8 @@ static bool parse_line_ids(int num_lines, char **words, char **lines)
  * the remaining parameters.
  */
 static void set_line_values_subset(struct line_resolver *resolver,
-				   int num_lines, char **lines, int *values)
+				   int num_lines, char **lines,
+				   enum gpiod_line_value *values)
 {
 	int l, i;
 
@@ -739,8 +741,8 @@ static char **tab_completion(const char *text, int start, int end)
 
 static void interact(struct gpiod_line_request **requests,
 		    struct line_resolver *resolver,
-		    char **lines, unsigned int *offsets, int *values,
-		    bool unquoted)
+		    char **lines, unsigned int *offsets,
+		    enum gpiod_line_value *values, bool unquoted)
 {
 	int num_words, num_lines, max_words, period_us, i;
 	char *line, **words, *line_buf;
@@ -869,8 +871,9 @@ int main(int argc, char **argv)
 	struct gpiod_request_config *req_cfg;
 	struct gpiod_line_request **requests;
 	struct gpiod_line_config *line_cfg;
-	int i, j, num_lines, ret, *values;
 	struct line_resolver *resolver;
+	enum gpiod_line_value *values;
+	int i, j, num_lines, ret;
 	struct gpiod_chip *chip;
 	unsigned int *offsets;
 	struct config cfg;
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 69af77a..6dbcf57 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -336,7 +336,7 @@ static void print_consumer(struct gpiod_line_info *info, bool unquoted)
 
 void print_line_attributes(struct gpiod_line_info *info, bool unquoted_strings)
 {
-	int direction;
+	enum gpiod_line_direction direction;
 
 	direction = gpiod_line_info_get_direction(info);
 
@@ -714,7 +714,7 @@ void free_line_resolver(struct line_resolver *resolver)
 
 int get_line_offsets_and_values(struct line_resolver *resolver,
 				int chip_num, unsigned int *offsets,
-				int *values)
+				enum gpiod_line_value *values)
 {
 	struct resolved_line *line;
 	int i, num_lines = 0;
@@ -754,7 +754,8 @@ const char *get_line_name(struct line_resolver *resolver,
 	return 0;
 }
 
-void set_line_values(struct line_resolver *resolver, int chip_num, int *values)
+void set_line_values(struct line_resolver *resolver, int chip_num,
+		     enum gpiod_line_value *values)
 {
 	int i, j;
 
diff --git a/tools/tools-common.h b/tools/tools-common.h
index aa697de..d467197 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -110,11 +110,13 @@ bool resolve_lines_by_offset(struct line_resolver *resolver,
 bool resolve_done(struct line_resolver *resolver);
 void validate_resolution(struct line_resolver *resolver, const char *chip_id);
 void free_line_resolver(struct line_resolver *resolver);
-int get_line_offsets_and_values(struct line_resolver *resolver,
-		int chip_num, unsigned int *offsets, int *values);
+int get_line_offsets_and_values(struct line_resolver *resolver, int chip_num,
+				unsigned int *offsets,
+				enum gpiod_line_value *values);
 const char *get_chip_name(struct line_resolver *resolver, int chip_num);
 const char *get_line_name(struct line_resolver *resolver, int chip_num,
 			  unsigned int offset);
-void set_line_values(struct line_resolver *resolver, int chip_num, int *values);
+void set_line_values(struct line_resolver *resolver, int chip_num,
+		     enum gpiod_line_value *values);
 
 #endif /* __GPIOD_TOOLS_COMMON_H__ */
-- 
2.37.2

