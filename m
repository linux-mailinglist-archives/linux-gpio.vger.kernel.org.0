Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C28B1FC471
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 05:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgFQDH2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 23:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbgFQDH1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 23:07:27 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2507EC061573
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 20:07:27 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id j1so434949pfe.4
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 20:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zHkJzBaZ77L8USW6UosIa6ZFshVU3LCBBdcLyBUEXNo=;
        b=Cdeg4StDc7+IlNxzLiAsdYGKTF4j2P6d576vx8TmWwGmdsrZ7ZJSynsqMUOFwVXNlW
         VxMyV4aAopIfkBPWIx2gcszpkwdiefrvVhvqinGYnxORTw+4v9Brmp7aJsRXk53AWSfv
         59iujtWGyNPsPUTQGtmVkMLjUIS+d6SQaxxMaHaad4LjpFQzfyQpDb510dnRFAyOyM9g
         cFQyaTe7Vq3w0ZyUqOK8kGcSZ+W5KDIe8mLrAKKO2pCo+y8ojExLsZ7LkjLNhzvYlDDw
         Pv6p103AKjQj58asg2lKgneyhDEPvr33jRbetFhlxRbLlAiKvjJdAtzFxmGCZifZrL8K
         PFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zHkJzBaZ77L8USW6UosIa6ZFshVU3LCBBdcLyBUEXNo=;
        b=oO0UDGnKEela3M7SjEEypZedLgC44nmWu337Bb6nckHImNIKCaPzSMI1eru0TpTAwf
         5f79Vw03yErkvpRyWOmq6xnKqf7WSpRj6X7b65DnC5/RBgAUGPsEXJiXs4PeWCZd+J9C
         sJayYV/qY8hJ2o67S4DFEhVbyYVuC3Qw556F9Z71qGUEsJlgNod1pZU1prwZ/gdOCwV+
         aFPP/m4Pe2FDHke5NwvgPlwoWKd2Iormkn1x0GSTeoEshRrkT+C+qRXnYppQJBrg7OcS
         PoNsm1AbADn58p1BlfWNQG97XDq4xUfocaVpkcCDJtpSBxmqm4ddHkP+bcdld01sooU/
         cgEQ==
X-Gm-Message-State: AOAM530ROEhBREhhaX4zDC86R3hxUTJV6w+TOSubDeh8gqdM1isXUf/N
        4LKMNxfg+sYsLNXhDvED32YfB8AnPLs=
X-Google-Smtp-Source: ABdhPJy/PJna8oMWlrqtL3Jn+bZsZ8CXfTcSkJ+z0jaQAZfOKQQ8/WIq52fHcbQCbke1wmrbdD/p0w==
X-Received: by 2002:a63:5b0e:: with SMTP id p14mr4660340pgb.43.1592363246273;
        Tue, 16 Jun 2020 20:07:26 -0700 (PDT)
Received: from sol.lan (220-235-93-205.dyn.iinet.net.au. [220.235.93.205])
        by smtp.gmail.com with ESMTPSA id p6sm9185578pfb.152.2020.06.16.20.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 20:07:25 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        ml@ionscale.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 1/3] bindings: cxx: tests: add tests for bulk events get_values
Date:   Wed, 17 Jun 2020 11:06:37 +0800
Message-Id: <20200617030639.27690-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200617030639.27690-1-warthog618@gmail.com>
References: <20200617030639.27690-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add tests to verify the behaviour of get_values when applied to a bulk
of event lines.

Reported-by: Gerrit Wyen <ml@ionscale.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>

---

The reported behaviour is that only the first line value is returned correctly.
The tests verify that behaviour in v1.5.

 bindings/cxx/tests/tests-event.cpp | 36 +++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/bindings/cxx/tests/tests-event.cpp b/bindings/cxx/tests/tests-event.cpp
index 63b6cc5..6d1c069 100644
--- a/bindings/cxx/tests/tests-event.cpp
+++ b/bindings/cxx/tests/tests-event.cpp
@@ -193,7 +193,7 @@ TEST_CASE("Event file descriptors can be used for polling", "[event]")
 	}
 }
 
-TEST_CASE("It's possible to read values from lines requested for events", "[event][line]")
+TEST_CASE("It's possible to read a value from a line requested for events", "[event][line]")
 {
 	mockup::probe_guard mockup_chips({ 8 });
 	::gpiod::chip chip(mockup::instance().chip_name(0));
@@ -219,6 +219,40 @@ TEST_CASE("It's possible to read values from lines requested for events", "[even
 	}
 }
 
+TEST_CASE("It's possible to read values from lines requested for events", "[event][bulk]")
+{
+	mockup::probe_guard mockup_chips({ 8 });
+	::gpiod::chip chip(mockup::instance().chip_name(0));
+	auto lines = chip.get_lines({ 0, 1, 2, 3, 4 });
+	::gpiod::line_request config;
+
+	config.consumer = consumer.c_str();
+	config.request_type = ::gpiod::line_request::EVENT_BOTH_EDGES;
+
+	mockup::instance().chip_set_pull(0, 5, 1);
+
+	SECTION("active-high (default)")
+	{
+		lines.request(config);
+		REQUIRE(lines.get_values() == ::std::vector<int>({ 0, 0, 0, 0, 0 }));
+		mockup::instance().chip_set_pull(0, 1, 1);
+		mockup::instance().chip_set_pull(0, 3, 1);
+		mockup::instance().chip_set_pull(0, 4, 1);
+		REQUIRE(lines.get_values() == ::std::vector<int>({ 0, 1, 0, 1, 1 }));
+	}
+
+	SECTION("active-low")
+	{
+		config.flags = ::gpiod::line_request::FLAG_ACTIVE_LOW;
+		lines.request(config);
+		REQUIRE(lines.get_values() == ::std::vector<int>({ 1, 1, 1, 1, 1 }));
+		mockup::instance().chip_set_pull(0, 1, 1);
+		mockup::instance().chip_set_pull(0, 3, 1);
+		mockup::instance().chip_set_pull(0, 4, 1);
+		REQUIRE(lines.get_values() == ::std::vector<int>({ 1, 0, 1, 0, 0 }));
+	}
+}
+
 TEST_CASE("It's possible to read more than one line event", "[event][line]")
 {
 	mockup::probe_guard mockup_chips({ 8 });
-- 
2.27.0

