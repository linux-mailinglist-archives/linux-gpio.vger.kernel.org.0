Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A045A8541B
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 21:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388554AbfHGTvz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Aug 2019 15:51:55 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:16054 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388488AbfHGTvz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Aug 2019 15:51:55 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 0A960A1039
        for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2019 21:51:54 +0200 (CEST)
Authentication-Results: spamfilter04.heinlein-hosting.de (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1565207513; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OXYVVcxkLaXfdngIhXH0oRHczAi+LJo+CZaddXInpvU=;
        b=jXikMaQ2K3YNk6cWRrq0uzRze/E8CNYQduaMI5rJyT9jGkZW20WfYvC4ddCXt0XJDeU6RT
        OkrxjV6Ezx1g4TccHX1Bd/WkhxIGnFqcw35SQCcQy+1eukePvMf8RPbPsgHjAkvN+FmCQ6
        ILbl/8jaitbxEJYHjsV00AvTy2nObEPNeQSOYYWXY8n1cUkpuAKLbOi1EBSnVgVjdEdoIJ
        6cUF+dWHpwwJLNwcMF0lT9yaqpDjeEarJA6CKia+B0oSHBuM4Y02ywSzaYQDS5qGUXAc1f
        exa5eeVKCAfRjTM6IUKq+XRkQhcygkR1ws8ZWOr3ykTcbb3RSMi3TBYHmL/u1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:mime-version:references:in-reply-to
        :message-id:date:date:subject:subject:from:from:received; s=
        mail20150812; t=1565207509; bh=gpP2T+v6dRzvxGBKKkpW7plXri7B+V7gB
        Frww9OFup0=; b=wEcv+ppCinyRHHQ+GeqT1l5+OM5l1JG+K8v/kEQRsOxZncf1h
        NOY0xv4ZzQsqjNimJPSoZM7bzDvsjppniv8QT0bqWIAHaldVcrNAlPAep4z4xNFf
        2/rLYbXRUV019aPR/Sm9xWwMqwUphm2R/DfEGqrw3H5JHXnQyk3IPz82pf4ZNdUu
        7EVVvNXZViPdNVg3zhbEIrLMy/hMOoztGLSdsPHVtT+Y9OBG34jM5kp66KujZIFt
        M2BPIvRg4r4M+98wNBhsDsJP7GHnC2ErorP+uLs/Jqyou15hTYJPV6N+nOd7o2cp
        1Jqrqlac/TdBXvPt8W0N46DbF+MQrpedHo83Q==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id RZ5AZD9ByHDl; Wed,  7 Aug 2019 21:51:49 +0200 (CEST)
From:   Alexander Stein <alexander.stein@mailbox.org>
To:     linux-gpio@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@mailbox.org>
Subject: [libgpiod] [PATCH 4/5] bindings: cxx: Fix compile errors
Date:   Wed,  7 Aug 2019 21:51:31 +0200
Message-Id: <20190807195132.7538-4-alexander.stein@mailbox.org>
In-Reply-To: <20190807195132.7538-1-alexander.stein@mailbox.org>
References: <20190807195132.7538-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This fixes the following compile errors:
tests-event.cpp:152:3: error: cannot declare reference to
'class std::system_error&', which is not a typedef or a template type
argument
  152 |   REQUIRE_THROWS_AS(line.event_get_fd(), ::std::system_error&);

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 bindings/cxx/tests/tests-chip.cpp  |  8 ++++----
 bindings/cxx/tests/tests-event.cpp |  4 ++--
 bindings/cxx/tests/tests-line.cpp  | 16 ++++++++--------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tests-chip.cpp
index 11c2d4c..c9eb8e5 100644
--- a/bindings/cxx/tests/tests-chip.cpp
+++ b/bindings/cxx/tests/tests-chip.cpp
@@ -107,7 +107,7 @@ TEST_CASE("Uninitialized GPIO chip behaves correctly", "[chip]")
 
 	SECTION("using uninitialized chip throws logic_error")
 	{
-		REQUIRE_THROWS_AS(chip.name(), ::std::logic_error&);
+		REQUIRE_THROWS_AS(chip.name(), ::std::logic_error);
 	}
 }
 
@@ -139,7 +139,7 @@ TEST_CASE("GPIO chip can be opened with the open() method with implicit lookup",
 
 TEST_CASE("Trying to open a nonexistent chip throws system_error", "[chip]")
 {
-	REQUIRE_THROWS_AS(::gpiod::chip("nonexistent-chip"), ::std::system_error&);
+	REQUIRE_THROWS_AS(::gpiod::chip("nonexistent-chip"), ::std::system_error);
 }
 
 TEST_CASE("Chip object can be reset", "[chip]")
@@ -244,12 +244,12 @@ TEST_CASE("Errors occurring when retrieving lines are correctly reported", "[chi
 
 	SECTION("invalid offset (single line)")
 	{
-		REQUIRE_THROWS_AS(chip.get_line(9), ::std::out_of_range&);
+		REQUIRE_THROWS_AS(chip.get_line(9), ::std::out_of_range);
 	}
 
 	SECTION("invalid offset (multiple lines)")
 	{
-		REQUIRE_THROWS_AS(chip.get_lines({ 1, 19, 4, 7 }), ::std::out_of_range&);
+		REQUIRE_THROWS_AS(chip.get_lines({ 1, 19, 4, 7 }), ::std::out_of_range);
 	}
 
 	SECTION("line not found by name")
diff --git a/bindings/cxx/tests/tests-event.cpp b/bindings/cxx/tests/tests-event.cpp
index b34347f..b41cf7e 100644
--- a/bindings/cxx/tests/tests-event.cpp
+++ b/bindings/cxx/tests/tests-event.cpp
@@ -149,7 +149,7 @@ TEST_CASE("It's possible to retrieve the event file descriptor", "[event][line]"
 
 	SECTION("error if not requested")
 	{
-		REQUIRE_THROWS_AS(line.event_get_fd(), ::std::system_error&);
+		REQUIRE_THROWS_AS(line.event_get_fd(), ::std::system_error);
 	}
 
 	SECTION("error if requested for values")
@@ -157,7 +157,7 @@ TEST_CASE("It's possible to retrieve the event file descriptor", "[event][line]"
 		config.request_type = ::gpiod::line_request::DIRECTION_INPUT;
 
 		line.request(config);
-		REQUIRE_THROWS_AS(line.event_get_fd(), ::std::system_error&);
+		REQUIRE_THROWS_AS(line.event_get_fd(), ::std::system_error);
 	}
 }
 
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index e827e60..08ff1e8 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -122,7 +122,7 @@ TEST_CASE("Line bulk object works correctly", "[line][bulk]")
 	{
 		auto lines = chip.get_all_lines();
 
-		REQUIRE_THROWS_AS(lines.get(11), ::std::out_of_range&);
+		REQUIRE_THROWS_AS(lines.get(11), ::std::out_of_range);
 	}
 }
 
@@ -242,7 +242,7 @@ TEST_CASE("Exported line can be released", "[line]")
 	line.release();
 
 	REQUIRE_FALSE(line.is_requested());
-	REQUIRE_THROWS_AS(line.get_value(), ::std::system_error&);
+	REQUIRE_THROWS_AS(line.get_value(), ::std::system_error);
 }
 
 TEST_CASE("Uninitialized GPIO line behaves correctly", "[line]")
@@ -256,7 +256,7 @@ TEST_CASE("Uninitialized GPIO line behaves correctly", "[line]")
 
 	SECTION("using uninitialized line throws logic_error")
 	{
-		REQUIRE_THROWS_AS(line.name(), ::std::logic_error&);
+		REQUIRE_THROWS_AS(line.name(), ::std::logic_error);
 	}
 }
 
@@ -271,7 +271,7 @@ TEST_CASE("Uninitialized GPIO line_bulk behaves correctly", "[line][bulk]")
 
 	SECTION("using uninitialized line_bulk throws logic_error")
 	{
-		REQUIRE_THROWS_AS(bulk.get(0), ::std::logic_error&);
+		REQUIRE_THROWS_AS(bulk.get(0), ::std::logic_error);
 	}
 }
 
@@ -289,7 +289,7 @@ TEST_CASE("Cannot request the same line twice", "[line]")
 		auto line = chip.get_line(3);
 
 		REQUIRE_NOTHROW(line.request(config));
-		REQUIRE_THROWS_AS(line.request(config), ::std::system_error&);
+		REQUIRE_THROWS_AS(line.request(config), ::std::system_error);
 	}
 
 	SECTION("request the same line twice in line_bulk")
@@ -300,7 +300,7 @@ TEST_CASE("Cannot request the same line twice", "[line]")
 		 */
 		auto lines = chip.get_lines({ 2, 3, 4, 4 });
 
-		REQUIRE_THROWS_AS(lines.request(config), ::std::system_error&);
+		REQUIRE_THROWS_AS(lines.request(config), ::std::system_error);
 	}
 }
 
@@ -312,12 +312,12 @@ TEST_CASE("Cannot get/set values of unrequested lines", "[line]")
 
 	SECTION("get value")
 	{
-		REQUIRE_THROWS_AS(line.get_value(), ::std::system_error&);
+		REQUIRE_THROWS_AS(line.get_value(), ::std::system_error);
 	}
 
 	SECTION("set value")
 	{
-		REQUIRE_THROWS_AS(line.set_value(1), ::std::system_error&);
+		REQUIRE_THROWS_AS(line.set_value(1), ::std::system_error);
 	}
 }
 
-- 
2.22.0

