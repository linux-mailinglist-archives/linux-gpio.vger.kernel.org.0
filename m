Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3596FE06C
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 15:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbfKOOpg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 09:45:36 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43082 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727427AbfKOOpf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 09:45:35 -0500
Received: by mail-pg1-f195.google.com with SMTP id l24so6098126pgh.10
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 06:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gk/j1mfXbfzocBq862+4vuKUi80sU4iTCYMixwTbe6E=;
        b=sFrvKX37mYhb81wrKODxDJEwemVrgSExPToXTUB+s9fDiod/1LpKlw0RmXwQd1uNgZ
         o+8oHf1YDTgzwpRDOjoFnGVf6E+QnwlnGC1t9hwl7GQarxFINXp0RU0lv2dUjILpcfnN
         4QLC4DJPmzyPOmlL/plDUNE/5nltEIVDnFpAlBBivyKF6FX5SxLhsXHIT0Kx9Bd9Ck/i
         NrPDdvqZSFQ398s59oYAAA19wAMDe2WzRGkdzSMPfhItiWRzhHRmHIHDwf0kTiaZjh+Y
         4DCTJUuJrd/ExBqua+PzztjvgKwgWYzXwcYLciqketNaavsHqPH3d8O3dvDekl80erht
         PI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gk/j1mfXbfzocBq862+4vuKUi80sU4iTCYMixwTbe6E=;
        b=Wc5BLFM5iIsXW9oD8FqOiyur7pps3FjsM83ImYX9S/n3YXyAK6xLDWUYnM6BjFsr+H
         RPFyIAcMIhemBu4JFNvWCZEWpwnv9/YUnYqIT0EfF243grKwZ2GqbXDN1Gc+C//Cnnbw
         6LukFJVaJT2hhgXf0Ihxn2AsA0y6K0v3e6ytY+eb4atF05ZfIxjjxQjTrm4u0dvBtpEb
         61eJPzyL1eXdQB46NcyFPcoePw9/gA7Mc17sSwZ3X98s2mkKa7JPL/g1PLQdaKNzQCdf
         //vSJW8TsJ7n1cQTBokCU/fpTkDI3wJE0caJ0gPTZxXjbE3JNYs9/laPUmrRDPyxD0CX
         cRbw==
X-Gm-Message-State: APjAAAXuFhlxDz9wDzrnRyNag6+eepi+zgR+kNJr/po6r0OfGMpvV/P3
        0mk+o7MuACQ7G4tBYGP2xBh+uO24lHc=
X-Google-Smtp-Source: APXvYqxNVuXvfssicDxRDzIEUKc7rmLhXx4JOT77dn5k35pIGiYQJcXuPQU1T2jEUUklK386XBt41A==
X-Received: by 2002:a63:3f04:: with SMTP id m4mr16814740pga.234.1573829133222;
        Fri, 15 Nov 2019 06:45:33 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y123sm10517726pfg.64.2019.11.15.06.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 06:45:32 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH 15/19] bindings: cxx: tests: add tests for SET_CONFIG methods
Date:   Fri, 15 Nov 2019 22:43:51 +0800
Message-Id: <20191115144355.975-16-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115144355.975-1-warthog618@gmail.com>
References: <20191115144355.975-1-warthog618@gmail.com>
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
index ef314b9..f5b829d 100644
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

