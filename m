Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEE066A561
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 22:52:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbjAMVw2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 16:52:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbjAMVwZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 16:52:25 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B935B89BE5
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:23 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so18297024wms.4
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VmQt1HMTwporVXhsXfzr+GKqhg/ppWUGA/M4/1vroo=;
        b=nCnJFNAs/S3L0pz1i0z8opxrfjl54XhmTcWTzZqR9veUl7c99/JAOvoGj+mfQ4WgwD
         tLc4uqA6hKyy3B7aF5XLDKagIEs4S1Z2rIM9ZmZ7qTtQQKe3tczGxMgf2OZVNX4DQhA8
         AgCliFi9G5l+N9ftGKp6p5+y1aSvLOJuYJGz8FNmkJuPB3CicE6mAp2DGV1CmMChp9A0
         3AU9R6DXA2Ns3Ps3AI4YJkrN/QagyTwO8GeZP1CKB5jDxWJZ+k7LQYU0ADbluiDtvVQO
         uU/SB14ig5+BwfF1A8pkfZpPsDA8+RUAIBVYuMrJlanZ4kSWQAzOsLHiRGJy5PP/5ssy
         wItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VmQt1HMTwporVXhsXfzr+GKqhg/ppWUGA/M4/1vroo=;
        b=PyrruWRMxj1vWc42w+t8ieD3JZMOKbZRXMX/yeFAO0aXaX32BwEP1TJEsXWghZ7Y7Q
         /YSbAnzanDpKL4lO+ADfF/nfUM+aXWx9x9lbq/j1OknEaV8UAWXUTHTa7ylahSd95odk
         4k5Yg+S/Q5enzmmGzcx+zCu5DYUg0JhVlpR0zBI4Kon53hk9/4FLc+ru5IehRmM9CPp/
         4+yDhhMkBPDZJnyPNzDE8uzOkmfwLzLFTGsW3piDg72kDIsq/xJVHhyZUAIIbu25K3XW
         fZeRqEfuMzOoj1bBvzTMI5dGrV79kK52Psit4W0PUc26Nu3lZKvvAdDJ+Bum5Sfce5UF
         QHBw==
X-Gm-Message-State: AFqh2kr6V21tzJuhrIWHlLPiw7HrOp4Rfs90dBFW8ClM9w1z5JsiQ5MW
        bDEzFz4Rsa32GhUKv04gG+ei8Q==
X-Google-Smtp-Source: AMrXdXufm/GJigJAxHO8DOdFPAwH2GWIClpZBaLN9rs6py9IJdMT78AAyunGP7XtV4tFFalsOKF9CA==
X-Received: by 2002:a05:600c:331d:b0:3d6:ecc4:6279 with SMTP id q29-20020a05600c331d00b003d6ecc46279mr948112wmp.27.1673646742239;
        Fri, 13 Jan 2023 13:52:22 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ba79:38ad:100f:e9ee])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003c70191f267sm33179234wmo.39.2023.01.13.13.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:52:21 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 06/16] bindings: cxx: prepend all C symbols with the scope resolution operator
Date:   Fri, 13 Jan 2023 22:52:00 +0100
Message-Id: <20230113215210.616812-7-brgl@bgdev.pl>
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

We explicitly resolve all global C symbols from libgpiod to the top-level
namespace. Fix it wherever its missing (mostly for C enum types).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/line-request.cpp  |  4 +--
 bindings/cxx/line-settings.cpp | 52 ++++++++++++++++++----------------
 2 files changed, 30 insertions(+), 26 deletions(-)

diff --git a/bindings/cxx/line-request.cpp b/bindings/cxx/line-request.cpp
index 438c0fa..b0723c3 100644
--- a/bindings/cxx/line-request.cpp
+++ b/bindings/cxx/line-request.cpp
@@ -118,7 +118,7 @@ GPIOD_CXX_API void line_request::get_values(const line::offsets& offsets, line::
 	int ret = ::gpiod_line_request_get_values_subset(
 					this->_m_priv->request.get(),
 					offsets.size(), this->_m_priv->offset_buf.data(),
-					reinterpret_cast<gpiod_line_value*>(values.data()));
+					reinterpret_cast<::gpiod_line_value*>(values.data()));
 	if (ret)
 		throw_from_errno("unable to retrieve line values");
 }
@@ -161,7 +161,7 @@ GPIOD_CXX_API line_request& line_request::set_values(const line::offsets& offset
 	int ret = ::gpiod_line_request_set_values_subset(
 					this->_m_priv->request.get(),
 					offsets.size(), this->_m_priv->offset_buf.data(),
-					reinterpret_cast<const enum gpiod_line_value*>(values.data()));
+					reinterpret_cast<const ::gpiod_line_value*>(values.data()));
 	if (ret)
 		throw_from_errno("unable to set line values");
 
diff --git a/bindings/cxx/line-settings.cpp b/bindings/cxx/line-settings.cpp
index 7d3d6a5..5ded953 100644
--- a/bindings/cxx/line-settings.cpp
+++ b/bindings/cxx/line-settings.cpp
@@ -22,56 +22,60 @@ make_reverse_maping(const ::std::map<cxx_enum_type, c_enum_type>& mapping)
 	return ret;
 }
 
-const ::std::map<line::direction, gpiod_line_direction> direction_mapping = {
+const ::std::map<line::direction, ::gpiod_line_direction> direction_mapping = {
 	{ line::direction::AS_IS,	GPIOD_LINE_DIRECTION_AS_IS },
 	{ line::direction::INPUT,	GPIOD_LINE_DIRECTION_INPUT },
 	{ line::direction::OUTPUT,	GPIOD_LINE_DIRECTION_OUTPUT },
 };
 
-const ::std::map<gpiod_line_direction, line::direction>
+const ::std::map<::gpiod_line_direction, line::direction>
 reverse_direction_mapping = make_reverse_maping(direction_mapping);
 
-const ::std::map<line::edge, gpiod_line_edge> edge_mapping = {
+const ::std::map<line::edge, ::gpiod_line_edge> edge_mapping = {
 	{ line::edge::NONE,		GPIOD_LINE_EDGE_NONE },
 	{ line::edge::FALLING,		GPIOD_LINE_EDGE_FALLING },
 	{ line::edge::RISING,		GPIOD_LINE_EDGE_RISING },
 	{ line::edge::BOTH,		GPIOD_LINE_EDGE_BOTH },
 };
 
-const ::std::map<gpiod_line_edge, line::edge> reverse_edge_mapping = make_reverse_maping(edge_mapping);
+const ::std::map<::gpiod_line_edge, line::edge>
+reverse_edge_mapping = make_reverse_maping(edge_mapping);
 
-const ::std::map<line::bias, gpiod_line_bias> bias_mapping = {
+const ::std::map<line::bias, ::gpiod_line_bias> bias_mapping = {
 	{ line::bias::AS_IS,		GPIOD_LINE_BIAS_AS_IS },
 	{ line::bias::DISABLED,		GPIOD_LINE_BIAS_DISABLED },
 	{ line::bias::PULL_UP,		GPIOD_LINE_BIAS_PULL_UP },
 	{ line::bias::PULL_DOWN,	GPIOD_LINE_BIAS_PULL_DOWN },
 };
 
-const ::std::map<gpiod_line_bias, line::bias> reverse_bias_mapping = make_reverse_maping(bias_mapping);
+const ::std::map<::gpiod_line_bias, line::bias>
+reverse_bias_mapping = make_reverse_maping(bias_mapping);
 
-const ::std::map<line::drive, gpiod_line_drive> drive_mapping = {
+const ::std::map<line::drive, ::gpiod_line_drive> drive_mapping = {
 	{ line::drive::PUSH_PULL,	GPIOD_LINE_DRIVE_PUSH_PULL },
 	{ line::drive::OPEN_DRAIN,	GPIOD_LINE_DRIVE_OPEN_DRAIN },
 	{ line::drive::OPEN_SOURCE,	GPIOD_LINE_DRIVE_OPEN_SOURCE },
 };
 
-const ::std::map<gpiod_line_drive, line::drive> reverse_drive_mapping = make_reverse_maping(drive_mapping);
+const ::std::map<::gpiod_line_drive, line::drive>
+reverse_drive_mapping = make_reverse_maping(drive_mapping);
 
-const ::std::map<line::clock, gpiod_line_clock> clock_mapping = {
+const ::std::map<line::clock, ::gpiod_line_clock> clock_mapping = {
 	{ line::clock::MONOTONIC,	GPIOD_LINE_CLOCK_MONOTONIC },
 	{ line::clock::REALTIME,	GPIOD_LINE_CLOCK_REALTIME },
 	{ line::clock::HTE,		GPIOD_LINE_CLOCK_HTE },
 };
 
-const ::std::map<gpiod_line_clock, line::clock>
+const ::std::map<::gpiod_line_clock, line::clock>
 reverse_clock_mapping = make_reverse_maping(clock_mapping);
 
-const ::std::map<line::value, gpiod_line_value> value_mapping = {
+const ::std::map<line::value, ::gpiod_line_value> value_mapping = {
 	{ line::value::INACTIVE,	GPIOD_LINE_VALUE_INACTIVE },
 	{ line::value::ACTIVE,		GPIOD_LINE_VALUE_ACTIVE },
 };
 
-const ::std::map<gpiod_line_value, line::value> reverse_value_mapping = make_reverse_maping(value_mapping);
+const ::std::map<::gpiod_line_value, line::value>
+reverse_value_mapping = make_reverse_maping(value_mapping);
 
 line_settings_ptr make_line_settings()
 {
@@ -165,7 +169,7 @@ GPIOD_CXX_API line_settings& line_settings::reset(void) noexcept
 
 GPIOD_CXX_API line_settings& line_settings::set_direction(line::direction direction)
 {
-	set_mapped_value<line::direction, gpiod_line_direction,
+	set_mapped_value<line::direction, ::gpiod_line_direction,
 			 ::gpiod_line_settings_set_direction>(this->_m_priv->settings.get(),
 							      direction, direction_mapping);
 
@@ -174,7 +178,7 @@ GPIOD_CXX_API line_settings& line_settings::set_direction(line::direction direct
 
 GPIOD_CXX_API line::direction line_settings::direction() const
 {
-	return get_mapped_value<line::direction, gpiod_line_direction,
+	return get_mapped_value<line::direction, ::gpiod_line_direction,
 				::gpiod_line_settings_get_direction>(
 							this->_m_priv->settings.get(),
 							reverse_direction_mapping);
@@ -182,7 +186,7 @@ GPIOD_CXX_API line::direction line_settings::direction() const
 
 GPIOD_CXX_API line_settings& line_settings::set_edge_detection(line::edge edge)
 {
-	set_mapped_value<line::edge, gpiod_line_edge,
+	set_mapped_value<line::edge, ::gpiod_line_edge,
 			 ::gpiod_line_settings_set_edge_detection>(this->_m_priv->settings.get(),
 								   edge, edge_mapping);
 
@@ -191,7 +195,7 @@ GPIOD_CXX_API line_settings& line_settings::set_edge_detection(line::edge edge)
 
 GPIOD_CXX_API line::edge line_settings::edge_detection() const
 {
-	return get_mapped_value<line::edge, gpiod_line_edge,
+	return get_mapped_value<line::edge, ::gpiod_line_edge,
 				::gpiod_line_settings_get_edge_detection>(
 							this->_m_priv->settings.get(),
 							reverse_edge_mapping);
@@ -199,7 +203,7 @@ GPIOD_CXX_API line::edge line_settings::edge_detection() const
 
 GPIOD_CXX_API line_settings& line_settings::set_bias(line::bias bias)
 {
-	set_mapped_value<line::bias, gpiod_line_bias,
+	set_mapped_value<line::bias, ::gpiod_line_bias,
 			 ::gpiod_line_settings_set_bias>(this->_m_priv->settings.get(),
 							 bias, bias_mapping);
 
@@ -208,14 +212,14 @@ GPIOD_CXX_API line_settings& line_settings::set_bias(line::bias bias)
 
 GPIOD_CXX_API line::bias line_settings::bias() const
 {
-	return get_mapped_value<line::bias, gpiod_line_bias,
+	return get_mapped_value<line::bias, ::gpiod_line_bias,
 				::gpiod_line_settings_get_bias>(this->_m_priv->settings.get(),
 								reverse_bias_mapping);
 }
 
 GPIOD_CXX_API line_settings& line_settings::set_drive(line::drive drive)
 {
-	set_mapped_value<line::drive, gpiod_line_drive,
+	set_mapped_value<line::drive, ::gpiod_line_drive,
 			 ::gpiod_line_settings_set_drive>(this->_m_priv->settings.get(),
 							  drive, drive_mapping);
 
@@ -224,7 +228,7 @@ GPIOD_CXX_API line_settings& line_settings::set_drive(line::drive drive)
 
 GPIOD_CXX_API line::drive line_settings::drive() const
 {
-	return get_mapped_value<line::drive, gpiod_line_drive,
+	return get_mapped_value<line::drive, ::gpiod_line_drive,
 				::gpiod_line_settings_get_drive>(this->_m_priv->settings.get(),
 								 reverse_drive_mapping);
 }
@@ -257,7 +261,7 @@ GPIOD_CXX_API ::std::chrono::microseconds line_settings::debounce_period() const
 
 GPIOD_CXX_API line_settings& line_settings::set_event_clock(line::clock event_clock)
 {
-	set_mapped_value<line::clock, gpiod_line_clock,
+	set_mapped_value<line::clock, ::gpiod_line_clock,
 			 ::gpiod_line_settings_set_event_clock>(this->_m_priv->settings.get(),
 								event_clock, clock_mapping);
 
@@ -266,7 +270,7 @@ GPIOD_CXX_API line_settings& line_settings::set_event_clock(line::clock event_cl
 
 GPIOD_CXX_API line::clock line_settings::event_clock() const
 {
-	return get_mapped_value<line::clock, gpiod_line_clock,
+	return get_mapped_value<line::clock, ::gpiod_line_clock,
 				::gpiod_line_settings_get_event_clock>(
 							this->_m_priv->settings.get(),
 							reverse_clock_mapping);
@@ -274,7 +278,7 @@ GPIOD_CXX_API line::clock line_settings::event_clock() const
 
 GPIOD_CXX_API line_settings& line_settings::set_output_value(line::value value)
 {
-	set_mapped_value<line::value, gpiod_line_value,
+	set_mapped_value<line::value, ::gpiod_line_value,
 			 ::gpiod_line_settings_set_output_value>(this->_m_priv->settings.get(),
 								 value, value_mapping);
 
@@ -283,7 +287,7 @@ GPIOD_CXX_API line_settings& line_settings::set_output_value(line::value value)
 
 GPIOD_CXX_API line::value line_settings::output_value() const
 {
-	return get_mapped_value<line::value, gpiod_line_value,
+	return get_mapped_value<line::value, ::gpiod_line_value,
 				::gpiod_line_settings_get_output_value>(
 							this->_m_priv->settings.get(),
 							reverse_value_mapping);
-- 
2.37.2

