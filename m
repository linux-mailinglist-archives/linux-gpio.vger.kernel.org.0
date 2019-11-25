Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D645D10900E
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 15:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbfKYOdE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 09:33:04 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44874 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbfKYOdE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 09:33:04 -0500
Received: by mail-pf1-f194.google.com with SMTP id d199so2824146pfd.11
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 06:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kSnyeo1X2JTqBLbCys03JvqhhOkGJtDeDc2nw0RC24E=;
        b=hXF2Zc8aN2Q/A+5j96vzIeNkjVJP3ZFH2UGdrknYJ+thfWig8BmENw+ekBLih1FXUj
         irgmzG4CTMpTg9dFhM5FLk+IZkcxNw92HEqKgPwg0x2mKtDAin3X/NteGkl5VfdMuffl
         xn+uNnT52fBsA/Pq9+PearyWSv/G8d1KUIV8I1Ho5O2iV7oHcMlNgbVx1DERrPuyUFjj
         0i0gVMPYhc8HOLI2pLQweKeadHJmov8UbgzLLnXfaoWc58RzZumm5E6afKMKzwsk5iVF
         2wZjXkH8mfQI7DAv+d+1rLEd1g7QlRe9pxosoARuZkgcYqWld7vccCkgdGlPsArj17G1
         1uZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kSnyeo1X2JTqBLbCys03JvqhhOkGJtDeDc2nw0RC24E=;
        b=MMCbKoA6yzrP6UlAUqQYsZmSoeVAMNxZoONHkuxMY2gFdgXcSFR7BR4UiVQTsbNfvH
         lr3VSMGDouR5l21GFOq+ccTFqIowRdlJ2OQzY5traPTCjxmhdt+F75ejaU1yNluYTBt7
         //Glb5oKhovjpnMCAzv/KHXTsN7qKZSmckv0LOUjf//FJaHkhcHth63MaiEcwao8RsNX
         0tdW7zZqJm2Il62geDrAhIzY1Ft9pT1vvgpPH6AmfOLIy50LqJKEnIBFQEwcbQvLwsRs
         qzLcmS8qtx062A7pVYAyrlS0lmCgwL2zN7vrZvdZ//g4eX7JANz3thFd8Cj5v+tIMUiW
         /5Yg==
X-Gm-Message-State: APjAAAWJXLZOVpipu5h5dKWTv39mSAHQada9k1jZTkTE0ocy4wk5Pj54
        RMLeEDscoYqOFb2Mx02BDYLTlJMeev6lpg==
X-Google-Smtp-Source: APXvYqxTB0Sz/kHVjLPNmtzEwncL13rjhTD/hZQFTlzhZoWQL2WwTwov1dTIPGLrXdFa6N8lI4+LvA==
X-Received: by 2002:a65:46c1:: with SMTP id n1mr33193325pgr.257.1574692382903;
        Mon, 25 Nov 2019 06:33:02 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id i5sm8642100pfo.52.2019.11.25.06.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:33:02 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v3 10/14] bindings: cxx: tests: add tests for SET_CONFIG methods
Date:   Mon, 25 Nov 2019 22:31:53 +0800
Message-Id: <20191125143157.26154-11-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125143157.26154-1-warthog618@gmail.com>
References: <20191125143157.26154-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Extend test coverage over set_config, set_flags, set_direction_input, and
set_direction_output methods.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/cxx/tests/tests-line.cpp | 128 ++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index 9a0b488..5353093 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -324,6 +324,134 @@ TEST_CASE("Line values can be set and read", "[line]")
 	}
 }
 
+TEST_CASE("Line can be reconfigured", "[line]")
+{
+	mockup::probe_guard mockup_chips({ 8 });
+	::gpiod::chip chip(mockup::instance().chip_name(0));
+	::gpiod::line_request config;
+
+	config.consumer = consumer.c_str();
+
+	SECTION("set config (single line, active-state)")
+	{
+		auto line = chip.get_line(3);
+		config.request_type = ::gpiod::line_request::DIRECTION_INPUT;
+		config.flags = 0;
+		line.request(config);
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_INPUT);
+		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+
+		line.set_config(::gpiod::line_request::DIRECTION_OUTPUT,
+			::gpiod::line_request::FLAG_ACTIVE_LOW,1);
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_LOW);
+		REQUIRE(mockup::instance().chip_get_value(0, 3) == 0);
+		line.set_value(0);
+		REQUIRE(mockup::instance().chip_get_value(0, 3) == 1);
+
+		line.set_config(::gpiod::line_request::DIRECTION_OUTPUT, 0);
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE(mockup::instance().chip_get_value(0, 3) == 0);
+		line.set_value(1);
+		REQUIRE(mockup::instance().chip_get_value(0, 3) == 1);
+	}
+
+	SECTION("set flags (single line, active-state)")
+	{
+		auto line = chip.get_line(3);
+		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
+		config.flags = 0;
+		line.request(config,1);
+		REQUIRE(mockup::instance().chip_get_value(0, 3) == 1);
+
+		line.set_flags(::gpiod::line_request::FLAG_ACTIVE_LOW);
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_LOW);
+		REQUIRE(mockup::instance().chip_get_value(0, 3) == 0);
+
+		line.set_flags(0);
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE(mockup::instance().chip_get_value(0, 3) == 1);
+	}
+
+	SECTION("set flags (single line, drive)")
+	{
+		auto line = chip.get_line(3);
+		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
+		config.flags = 0;
+		line.request(config);
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE_FALSE(line.is_open_drain());
+		REQUIRE_FALSE(line.is_open_source());
+
+		line.set_flags(::gpiod::line_request::FLAG_OPEN_DRAIN);
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE(line.is_open_drain());
+		REQUIRE_FALSE(line.is_open_source());
+
+		line.set_flags(::gpiod::line_request::FLAG_OPEN_SOURCE);
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE_FALSE(line.is_open_drain());
+		REQUIRE(line.is_open_source());
+
+		line.set_flags(0);
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE_FALSE(line.is_open_drain());
+		REQUIRE_FALSE(line.is_open_source());
+	}
+
+	SECTION("set flags (single line, bias)")
+	{
+		auto line = chip.get_line(3);
+		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
+		config.flags = 0;
+		line.request(config);
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE_FALSE(line.is_open_drain());
+		REQUIRE_FALSE(line.is_open_source());
+
+		line.set_flags(::gpiod::line_request::FLAG_OPEN_DRAIN);
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE(line.is_open_drain());
+		REQUIRE_FALSE(line.is_open_source());
+
+		line.set_flags(::gpiod::line_request::FLAG_OPEN_SOURCE);
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE_FALSE(line.is_open_drain());
+		REQUIRE(line.is_open_source());
+
+		line.set_flags(0);
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE_FALSE(line.is_open_drain());
+		REQUIRE_FALSE(line.is_open_source());
+	}
+
+	SECTION("set direction input (single line)")
+	{
+		auto line = chip.get_line(3);
+		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
+		config.flags = 0;
+		line.request(config);
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		line.set_direction_input();
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_INPUT);
+	}
+
+	SECTION("set direction output (single line)")
+	{
+		auto line = chip.get_line(3);
+		config.request_type = ::gpiod::line_request::DIRECTION_INPUT;
+		config.flags = 0;
+		line.request(config);
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_INPUT);
+		line.set_direction_output(1);
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE(mockup::instance().chip_get_value(0, 3) == 1);
+	}
+}
+
 TEST_CASE("Exported line can be released", "[line]")
 {
 	mockup::probe_guard mockup_chips({ 8 });
-- 
2.24.0

