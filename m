Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A163666A562
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 22:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbjAMVw3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 16:52:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbjAMVw1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 16:52:27 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C060C89BCB
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:24 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so1975439wmc.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFQ2H51r7PsBqopCZJpFuBJ7mXoJ8Zf6r1MD3c0aSxo=;
        b=pyvF9IbyKUIKukdj1z+pmNxJLTj3bQeA62xGhZafRHwYzs5Bo0gz0CbifDaReOoZv7
         Rt/74WfSSr0C2N5fhB9JaoBGrWveGJQyScq3ohUTUmakaM96aUpGXkiHKvDdTQInsjtW
         MpEg3ISROU4fn85EJuY+ALzYhxV8ySH+IL+3dk9R6hzSeKGcojAMBsiNF+37c+vmcwkU
         X0+oHJCJuSENcwiKDuUMOmfDH3odZHIoQXh7pogR/Hb6X32yKtqhVn581JTJSQNfGTMJ
         ZBPpYbPTfnzXtp235X/pr5oTi6olN/cwvrDw9KD9dTKNVYiHjhiCwPNfz69TlnR5wmQc
         J+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFQ2H51r7PsBqopCZJpFuBJ7mXoJ8Zf6r1MD3c0aSxo=;
        b=p1U83oAucKe0Y4nx2/cwQfsRY46Nr0qvJKdPR21J9qNulaDF1jHeAkC6Wpw/foO9pB
         mO4N+jmRAOC1d+Di+Omhm9UsakavBwPgz9lT/U2iyXPEK6iZTCoyHoju++cH/c1+a0cE
         W7CjRNd2SMhyOGZLE1hxHyKf6elSZ2welOiYF9a5NtElU5zm2Ftpob6SCz2zsUchVL74
         EzSvuYPIEIf3V0tmSD+fL+1q4QZpv1rPeEbdV7SH7QWQhLXF33yqSTKai+J6VD3BbDhs
         4dzFFLsZXI/0H+Vn9X/+wCCfw+9Q77RczRb7/aMF4lBP0VEl3lwoK8tBjX7rMGPcGpoc
         3xWA==
X-Gm-Message-State: AFqh2kpttRBOaL3WEbnJTUsulHRHePuGnIl9cnrnAQNRo27r3/1drA1y
        ppCFCry4qJKkeMWsnEC9hQVjYw==
X-Google-Smtp-Source: AMrXdXu179e3pLr/bqzSdi35dzps/D35lV1kHSWutktUzvucPu5JgT7+QITBZ0ecTSL1CMUlEu55TA==
X-Received: by 2002:a05:600c:1c9d:b0:3d1:f3eb:c718 with SMTP id k29-20020a05600c1c9d00b003d1f3ebc718mr71028956wms.19.1673646743239;
        Fri, 13 Jan 2023 13:52:23 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ba79:38ad:100f:e9ee])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003c70191f267sm33179234wmo.39.2023.01.13.13.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:52:22 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 07/16] bindings: cxx: allow to copy line_settings
Date:   Fri, 13 Jan 2023 22:52:01 +0100
Message-Id: <20230113215210.616812-8-brgl@bgdev.pl>
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

Implement the copy operator for line_settings. We have a copy() method
for line settings in C API while in C++ it's useful to copy line_settings
returned in an std::map from line_config.get_line_settings().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/gpiodcxx/line-settings.hpp    | 13 ++++++-
 bindings/cxx/internal.hpp                  |  2 +-
 bindings/cxx/line-settings.cpp             | 28 ++++++++++++++
 bindings/cxx/tests/tests-line-settings.cpp | 43 ++++++++++++++++++++++
 4 files changed, 83 insertions(+), 3 deletions(-)

diff --git a/bindings/cxx/gpiodcxx/line-settings.hpp b/bindings/cxx/gpiodcxx/line-settings.hpp
index c1477b1..c18dc52 100644
--- a/bindings/cxx/gpiodcxx/line-settings.hpp
+++ b/bindings/cxx/gpiodcxx/line-settings.hpp
@@ -38,7 +38,11 @@ public:
 	 */
 	line_settings();
 
-	line_settings(const line_settings& other) = delete;
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy.
+	 */
+	line_settings(const line_settings& other);
 
 	/**
 	 * @brief Move constructor.
@@ -48,7 +52,12 @@ public:
 
 	~line_settings();
 
-	line_settings& operator=(const line_settings& other) = delete;
+	/**
+	 * @brief Copy assignment operator.
+	 * @param other Object to copy.
+	 * @return Reference to self.
+	 */
+	line_settings& operator=(const line_settings& other);
 
 	/**
 	 * @brief Move assignment operator.
diff --git a/bindings/cxx/internal.hpp b/bindings/cxx/internal.hpp
index d27aa22..6aceac1 100644
--- a/bindings/cxx/internal.hpp
+++ b/bindings/cxx/internal.hpp
@@ -120,7 +120,7 @@ struct info_event::impl
 struct line_settings::impl
 {
 	impl();
-	impl(const impl& other) = delete;
+	impl(const impl& other);
 	impl(impl&& other) = delete;
 	impl& operator=(const impl& other) = delete;
 	impl& operator=(impl&& other) = delete;
diff --git a/bindings/cxx/line-settings.cpp b/bindings/cxx/line-settings.cpp
index 5ded953..32f21a3 100644
--- a/bindings/cxx/line-settings.cpp
+++ b/bindings/cxx/line-settings.cpp
@@ -86,6 +86,15 @@ line_settings_ptr make_line_settings()
 	return settings;
 }
 
+line_settings_ptr copy_line_settings(const line_settings_ptr& ptr)
+{
+	line_settings_ptr settings(::gpiod_line_settings_copy(ptr.get()));
+	if (!settings)
+		throw_from_errno("Unable to copy the line settings object");
+
+	return settings;
+}
+
 template<class key_type, class value_type, class exception_type>
 value_type map_setting(const key_type& key, const ::std::map<key_type, value_type>& mapping)
 {
@@ -136,12 +145,24 @@ line_settings::impl::impl()
 
 }
 
+line_settings::impl::impl(const impl& other)
+	: settings(copy_line_settings(other.settings))
+{
+
+}
+
 GPIOD_CXX_API line_settings::line_settings()
 	: _m_priv(new impl)
 {
 
 }
 
+GPIOD_CXX_API line_settings::line_settings(const line_settings& other)
+	: _m_priv(new impl(*other._m_priv))
+{
+
+}
+
 GPIOD_CXX_API line_settings::line_settings(line_settings&& other) noexcept
 	: _m_priv(::std::move(other._m_priv))
 {
@@ -153,6 +174,13 @@ GPIOD_CXX_API line_settings::~line_settings()
 
 }
 
+GPIOD_CXX_API line_settings& line_settings::operator=(const line_settings& other)
+{
+	this->_m_priv.reset(new impl(*other._m_priv));
+
+	return *this;
+}
+
 GPIOD_CXX_API line_settings& line_settings::operator=(line_settings&& other)
 {
 	this->_m_priv = ::std::move(other._m_priv);
diff --git a/bindings/cxx/tests/tests-line-settings.cpp b/bindings/cxx/tests/tests-line-settings.cpp
index a3f4bc5..dc821bb 100644
--- a/bindings/cxx/tests/tests-line-settings.cpp
+++ b/bindings/cxx/tests/tests-line-settings.cpp
@@ -124,6 +124,49 @@ TEST_CASE("line_settings mutators work", "[line-settings]")
 	}
 }
 
+TEST_CASE("line_settings can be moved and copied", "[line-settings]")
+{
+	::gpiod::line_settings settings;
+
+	settings
+		.set_direction(direction::INPUT)
+		.set_edge_detection(edge::BOTH);
+
+	SECTION("copy constructor works")
+	{
+		auto copy(settings);
+		settings.set_direction(direction::OUTPUT);
+		settings.set_edge_detection(edge::NONE);
+		REQUIRE(copy.direction() == direction::INPUT);
+		REQUIRE(copy.edge_detection() == edge::BOTH);
+	}
+
+	SECTION("assignment operator works")
+	{
+		::gpiod::line_settings copy;
+		copy = settings;
+		settings.set_direction(direction::OUTPUT);
+		settings.set_edge_detection(edge::NONE);
+		REQUIRE(copy.direction() == direction::INPUT);
+		REQUIRE(copy.edge_detection() == edge::BOTH);
+	}
+
+	SECTION("move constructor works")
+	{
+		auto copy(::std::move(settings));
+		REQUIRE(copy.direction() == direction::INPUT);
+		REQUIRE(copy.edge_detection() == edge::BOTH);
+	}
+
+	SECTION("move assignment operator works")
+	{
+		::gpiod::line_settings copy;
+		copy = ::std::move(settings);
+		REQUIRE(copy.direction() == direction::INPUT);
+		REQUIRE(copy.edge_detection() == edge::BOTH);
+	}
+}
+
 TEST_CASE("line_settings stream insertion operator works", "[line-settings]")
 {
 	::gpiod::line_settings settings;
-- 
2.37.2

