Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 470BB10E039
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbfLADY5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:24:57 -0500
Received: from mail-pf1-f170.google.com ([209.85.210.170]:33275 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADY5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:24:57 -0500
Received: by mail-pf1-f170.google.com with SMTP id y206so8002406pfb.0
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HY9UugjIbYniOEL1qtqA7+ZIck/K1pKLm7Te9BpRSUw=;
        b=VCW4HOwei7OV/NFGB+wDhq++y1zH6+bTjdO0VPBleGtwK9QEfzR4VNSy31CXoihCx2
         NHb3fl0ojU770uCK/CJCkNgZlzWfkv/9G+ZZnMD1F8u7HcbiofX5q+lndOUyrxrI5zB8
         feqrujzJ+zlbZXX6/FOp/zvk+GSNF7n70MkhAy/IdaTdSXX+EnfU2365w7Mbea3EeGzB
         vN/AfQ3diLZFPLQi+EgzSsSkZvaC+UjoU4CI7KTKzU8ipnMgnM1PgwJ51VflQh3JDJ9N
         Vykouy1oTVEu4rtyyXIG2nzSHsaF/trbYZh/d9GtQkagBHRbjlp3Xkj3PGBDygnISPFf
         /2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HY9UugjIbYniOEL1qtqA7+ZIck/K1pKLm7Te9BpRSUw=;
        b=iKOVj0YodHRGP618f7mW1D0D9RzdFZM5XKjK9UX87ZLihbb0GNbFJb02gJg881bg9e
         KxrDCN9qy2JciesaLoPmMNbJk6fcIq57IS4SGDcWS/KdM6g9JMdzOtnAANlkU64X9LgF
         iEpJ4H5rIZ0Jv9HNo/fR3z2FEPL4iDuq85c2pct/fKliRQTJFC2mZSXRpTreACrytHrD
         DmFRyLFsDpz/ECJvyoWhAHzLAGBKrf+acFs+rafqOM7IV5yRTmEOYgm+kdgwf3+K5/nC
         Mw3h/8SRPnkvj9gdUKX4vGN8DvXnpeEOPiCZ1JGyILKMtxdG+CnJaH9xKRT8L68qnSKH
         rO2w==
X-Gm-Message-State: APjAAAVL5JGIBPBsQMkSFt6an/B9WCbXzpueY7llLns7O4Ic0BiXRmmk
        jqP3Khk6JNyBzP29F/Yj5emDyWd3
X-Google-Smtp-Source: APXvYqzAf0P96ZjnrzsPXN4ticiE9DPIfU0SFBEYTbSzcQpyKaC3Fxg/ixbznxGU/IKJNLzdGUVQaA==
X-Received: by 2002:aa7:8aca:: with SMTP id b10mr25181137pfd.213.1575170696036;
        Sat, 30 Nov 2019 19:24:56 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:24:55 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 04/20] bindings: cxx: tests: add tests for bias flags
Date:   Sun,  1 Dec 2019 11:23:51 +0800
Message-Id: <20191201032407.23589-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
References: <20191201032407.23589-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Extend test coverage over the bias flags in requests and the bias setting
returned by line.bias().

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/cxx/tests/gpiod-cxx-test.cpp |  2 +-
 bindings/cxx/tests/tests-line.cpp     | 87 +++++++++++++++++++++++++++
 2 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/bindings/cxx/tests/gpiod-cxx-test.cpp b/bindings/cxx/tests/gpiod-cxx-test.cpp
index 11c895e..fbff8ac 100644
--- a/bindings/cxx/tests/gpiod-cxx-test.cpp
+++ b/bindings/cxx/tests/gpiod-cxx-test.cpp
@@ -54,6 +54,6 @@ public:
 	kernel_checker& operator=(kernel_checker&& other) = delete;
 };
 
-kernel_checker require_kernel(5, 2, 11);
+kernel_checker require_kernel(5, 5, 0);
 
 } /* namespace */
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index fedaa05..9a0b488 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -52,6 +52,9 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.consumer().empty());
 		REQUIRE_FALSE(line.is_requested());
 		REQUIRE_FALSE(line.is_used());
+		REQUIRE_FALSE(line.is_open_drain());
+		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_AS_IS);
 	}
 
 	SECTION("exported line")
@@ -68,6 +71,9 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
 		REQUIRE(line.is_requested());
 		REQUIRE(line.is_used());
+		REQUIRE_FALSE(line.is_open_drain());
+		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_AS_IS);
 	}
 
 	SECTION("exported line with flags")
@@ -88,6 +94,87 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.is_used());
 		REQUIRE(line.is_open_drain());
 		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_AS_IS);
+	}
+
+	SECTION("exported open source line")
+	{
+		::gpiod::line_request config;
+
+		config.consumer = consumer.c_str();
+		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
+		config.flags = ::gpiod::line_request::FLAG_OPEN_SOURCE;
+		line.request(config);
+
+		REQUIRE(line.offset() == 4);
+		REQUIRE(line.name() == "gpio-mockup-A-4");
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE(line.is_requested());
+		REQUIRE(line.is_used());
+		REQUIRE_FALSE(line.is_open_drain());
+		REQUIRE(line.is_open_source());
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_AS_IS);
+	}
+
+	SECTION("exported bias disable line")
+	{
+		::gpiod::line_request config;
+
+		config.consumer = consumer.c_str();
+		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
+		config.flags = ::gpiod::line_request::FLAG_BIAS_DISABLE;
+		line.request(config);
+
+		REQUIRE(line.offset() == 4);
+		REQUIRE(line.name() == "gpio-mockup-A-4");
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE(line.is_requested());
+		REQUIRE(line.is_used());
+		REQUIRE_FALSE(line.is_open_drain());
+		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_DISABLE);
+	}
+
+	SECTION("exported pull-down line")
+	{
+		::gpiod::line_request config;
+
+		config.consumer = consumer.c_str();
+		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
+		config.flags = ::gpiod::line_request::FLAG_BIAS_PULL_DOWN;
+		line.request(config);
+
+		REQUIRE(line.offset() == 4);
+		REQUIRE(line.name() == "gpio-mockup-A-4");
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE(line.is_requested());
+		REQUIRE(line.is_used());
+		REQUIRE_FALSE(line.is_open_drain());
+		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_PULL_DOWN);
+	}
+
+	SECTION("exported pull-up line")
+	{
+		::gpiod::line_request config;
+
+		config.consumer = consumer.c_str();
+		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
+		config.flags = ::gpiod::line_request::FLAG_BIAS_PULL_UP;
+		line.request(config);
+
+		REQUIRE(line.offset() == 4);
+		REQUIRE(line.name() == "gpio-mockup-A-4");
+		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
+		REQUIRE(line.active_state() == ::gpiod::line::ACTIVE_HIGH);
+		REQUIRE(line.is_requested());
+		REQUIRE(line.is_used());
+		REQUIRE_FALSE(line.is_open_drain());
+		REQUIRE_FALSE(line.is_open_source());
+		REQUIRE(line.bias() == ::gpiod::line::BIAS_PULL_UP);
 	}
 
 	SECTION("update line info")
-- 
2.24.0

