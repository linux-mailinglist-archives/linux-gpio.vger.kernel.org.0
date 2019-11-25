Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E288A109008
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 15:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbfKYOct (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 09:32:49 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34818 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbfKYOcs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 09:32:48 -0500
Received: by mail-pg1-f193.google.com with SMTP id k32so7294836pgl.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 06:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1QMIzQdivMNr/urrFibb1d3I1FoG0wJ7ERlY8y923yU=;
        b=EGfapJNyb810WZJNWOZwL2gO4dkbneNv5mUH4WQHnEYb3ji/ppvsUNSDIjiv6TSv7Q
         kiJq+R/j/L/N5AuBDt7Z6Sz2L45TMbmpnNkC3y5XHPodjRYtQMN24nj/Y+eKiUpko0z1
         Kghq7XQPcxoURk4dqclt+1RE2s1FLpNhc6EfpqJPd4K64y99xXHdNEtZ22cZOTxg9k5d
         3AHc77rtjec712Cg1W41XDYUkwTJRGJn/X2wQmIKYBeFQYqPW44OUBBEATcAzWf1IBT5
         eB1+aZHVUjjjQ4BqY0nWwQlqqEBGycezwgvzNRpnhxBTKmy0Zu7VeGJrPwSdXhpQUEbx
         kyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1QMIzQdivMNr/urrFibb1d3I1FoG0wJ7ERlY8y923yU=;
        b=WF929YIUtK8oCKLomOMJFcsCW/L/cRWpwESjLKPtMp8o5HZPrkuMX2V4F3gw1NZPHl
         d7rNZKQdXD+ZVNTVx1g4Te3JnC+6KIn8nD0T+R9KyUlShu8cUhHGsfxZL9Eozi5gcQV6
         oc/KjUCDahrio3bLqkorEg+onqs4ET+fF5MmHoiO2k1OK+edMBpg828kDP/A2VF/w3oV
         B5ZKRBHJUZClfSNzyU5jHIJsa7uCplXFKjV8KjyDOpg8+wwi4E4/mwBFVwx7+LCqmcIa
         EN98IvYUerlKWdERiXaLvi2wGbR+3f3Z65Dn2l6qiJEO5xE3hilCxX53JuLjJLRDK2rK
         OO+Q==
X-Gm-Message-State: APjAAAVo15upGZzcsCYN38z00AMEoPLxqpcfuvruEccb51a3JiRZOxg8
        zq2Obuhe8/9hOLqc9faB/VrV3JWKmLGDwQ==
X-Google-Smtp-Source: APXvYqyE+KKITgSgHeb7GZ03VIFsoyAQFud8vw1GAEdDEL06I4PsfalfRbl7THgGOtuT/IavS5Srug==
X-Received: by 2002:a63:c406:: with SMTP id h6mr33404744pgd.213.1574692367599;
        Mon, 25 Nov 2019 06:32:47 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id i5sm8642100pfo.52.2019.11.25.06.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:32:47 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v3 04/14] bindings: cxx: tests: add tests for bias flags
Date:   Mon, 25 Nov 2019 22:31:47 +0800
Message-Id: <20191125143157.26154-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125143157.26154-1-warthog618@gmail.com>
References: <20191125143157.26154-1-warthog618@gmail.com>
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
 bindings/cxx/tests/tests-line.cpp | 87 +++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

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

