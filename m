Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1169410E03F
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbfLADZM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:25:12 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37915 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADZM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:25:12 -0500
Received: by mail-pf1-f196.google.com with SMTP id x185so3934559pfc.5
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kSnyeo1X2JTqBLbCys03JvqhhOkGJtDeDc2nw0RC24E=;
        b=U3sexmZJSMa0rKrFQfEPd2TXpUpglWWMvK2Ba68GqOB/cL3D3sTdLoJ9LxmPTWXwSC
         9CcRTOWN2NJjFujrNv64jcawh5gKWBg/4F6VZBzyB39Myt11ARd9Q9PNoLYXlWGhMfcN
         pBSpADDambeo2nepf4bZg7UdQ2ZRz5/DYwTEelvHpl/QnRf9C3Ft0pyk7s18hPt/9u0Y
         YFN16W/r9pw0FgsSXno2vMQcosk+x/XsC+apEKWNV4Hm39jkUjQ5bxoKQ/R0gYfdVqos
         ix3PtUHEyShLNzo0/ekpU+AZLFHmwaWlVASoKBuS+BnbIbjrM4/w2kZ8T0XToAya7PVS
         prjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kSnyeo1X2JTqBLbCys03JvqhhOkGJtDeDc2nw0RC24E=;
        b=QlFQdhS58MuSXPoyJfxAIut+wXqFMKCb5cRMB9sOOgYE/5scriYuDvn3pSw7gLo+A4
         6sPywDck7xNxcqzHxdaCvE8TlaxYYm+K+QlMSFDxD1qy85xpEYO4W25rmzgS56GOWlPf
         iGmqLc0LOcTO0LuKFa5HONn8kTFKPh5RHTEqw555r4/bDHD2qlvWgRuVBkorTWCedFFk
         oLJW04VPdZcBAwGUZBI8DEEyZalZp1NWVrc4jWgDRA83e/loHDw2+gyrlbsuBHaaWGCx
         JMPg6FjnqGZRtJhhv9PlSaUuDiVsgQJ5g+SS0VE+JJajbmhD8QHVjKWKws0r6nyOovI0
         /W2w==
X-Gm-Message-State: APjAAAWH7RyVkX1iM6jvqU3d8APVdGVUrTpSce4ODcmS1ds3d5x5l/m/
        VP8NUlmrWFBwuNtUlG21CZxL5xky
X-Google-Smtp-Source: APXvYqxanEhXmWtgOb/BtyDX/3evDNFVrEtdhLkUZwB2BTqsxNQN/ZTv9UeqiOGc8bQyyNr9BsJmsQ==
X-Received: by 2002:a63:ec4b:: with SMTP id r11mr24531765pgj.147.1575170711000;
        Sat, 30 Nov 2019 19:25:11 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:25:10 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 10/20] bindings: cxx: tests: add tests for SET_CONFIG methods
Date:   Sun,  1 Dec 2019 11:23:57 +0800
Message-Id: <20191201032407.23589-11-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
References: <20191201032407.23589-1-warthog618@gmail.com>
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

