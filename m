Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCF71047A2
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 01:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbfKUAgo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 19:36:44 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40021 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbfKUAgo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 19:36:44 -0500
Received: by mail-pg1-f193.google.com with SMTP id e17so620221pgd.7
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 16:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kSnyeo1X2JTqBLbCys03JvqhhOkGJtDeDc2nw0RC24E=;
        b=T1fSXl37+P0Y/wGQ6AWlzCxuKuzA5JCDTxfIUYgYFqZyVfyvjZ3m0JQBMauLOE9Y8e
         lNSUeNdSkwQSD6NB0ZIlD9fa4EPqNoCu9zzczytXfyoqFoO3GECtJ4Spq+m3JlxqrKjD
         aHof69R6o+ADVNA3zK5G8XY9Ej3FkgWnTlJ6nTztlX6AKFc1EPYmyUDhCE/nbFrNf4lc
         epND6W28g5+RFs2k2elE1L76I7Qvsn4VcdbdTtd9BtInHk3YMinhC4GhEG7UAOA3rQx/
         56dM90EDLZbA6GHbk4QKv0M4aFXXSsTeSU88dfcBreMnT3iNQmKSO/btYu4b7dHtbkjM
         reyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kSnyeo1X2JTqBLbCys03JvqhhOkGJtDeDc2nw0RC24E=;
        b=FibCTOUqbpzFDOROVGImaYaM2yYvvqN18cKaT4GhwEkdYxpEM+gvsnDB6XkDOte87X
         EGlCTLHNcmbQzVp1DT7opR5OwvS6zv6AIRbQGzpA/eDarqx+3gpbR3u/bkhXRlOXZ3Xv
         Rx1EvhhGWL8b3UXArVYrahEw56OTsBuSX9kuISI31Xh6clwSGz4/MO1Rh6OCo0bFK/Kk
         n7QRhYYKLUcX4PmRMOhJAmVaLfP0wSfM/eEKZBgoOvqhFoFG6i4p9ewHK30ocC2txd6D
         QeUrGPxZ47SQAxTvtPmDZo3MW4kAOFJ5WQItN2f3iuJIl5ic1N2Oi864NAKp2g1AMrbh
         +VTw==
X-Gm-Message-State: APjAAAV8ofKec8iUndw6RYqhjMyXvruZcKilcquSkpBAj9XaFeIO3ycR
        6/qo5nuN27m02sdlda84bdLAqF9smv8=
X-Google-Smtp-Source: APXvYqzFa0X9E0xquCgXddGwxmhxe9i+0FDN6LpNuzyusBVnPZqjxPXV5wnTUPFkxw3Elcanv8YsUQ==
X-Received: by 2002:aa7:8610:: with SMTP id p16mr7373040pfn.185.1574296603066;
        Wed, 20 Nov 2019 16:36:43 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id s1sm420756pgk.9.2019.11.20.16.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:36:42 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH v2 10/14] bindings: cxx: tests: add tests for SET_CONFIG methods
Date:   Thu, 21 Nov 2019 08:35:52 +0800
Message-Id: <20191121003556.9020-11-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121003556.9020-1-warthog618@gmail.com>
References: <20191121003556.9020-1-warthog618@gmail.com>
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

