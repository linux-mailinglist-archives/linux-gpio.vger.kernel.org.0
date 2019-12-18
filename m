Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA5F124979
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 15:25:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbfLROZG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 09:25:06 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36670 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbfLROZG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 09:25:06 -0500
Received: by mail-wm1-f65.google.com with SMTP id p17so2119329wma.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2019 06:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dRBh4dacsNRPwKbmfRVKyhccjh1EPHZy/qFlfgV9esI=;
        b=PgP2Zy68qNbQh7N1bTgKIu4I3ysnulX+udmZ74uPugZdYqjzjBZZLFfFtvzxpe6mVj
         sn7aVXRgcXhTANLoqql/vI5hud/mV2F8+zMIRKuCit23JRPnU6weJnrVKRSXppRDInSG
         zElqLPSOvjtUqi5YxoHXpaYOJiljZBDgAjMO9vvtSaBlLJ3JOhlS3mLxMaik6nFGdAdA
         YZT+VsdvU4w4QdD2YNFjgDCIyDxvsF3c3kuhHaKoyQNHYuuJVb0pMFRD8Jp7XEAtFVsu
         jrfmu0Io16+AJugiUuS0dqEDkJcTV9G7mwO1sjgVGtAfLrlT+0zovc16NrOmRlfV6Rbz
         GbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dRBh4dacsNRPwKbmfRVKyhccjh1EPHZy/qFlfgV9esI=;
        b=NTpl76CVaD8dIoTliI/fHbhjdygd6Y5z/t9oskxV1/uqMtCY3jmLc/9jRLUoiwuGyP
         TswEwuR0NZs25LPrtMnmTDvIDJwax+t+yTXiIhdBzOHaO3Sy2lEAcARFPT4gN02u/BjN
         z0rW24zXPuHBXyj0XJM5jtzvPGSuBBYArcHJwnQoBx/jDWsoFqsphwoh68wiCR2LuCWG
         XReqAzhzFRaotp+t8UNW6QnDWyS/dSlosN8VP3IwXJFH2ebm/frUubf/U+QZ8+3M5rvs
         lVywc5C+gDbEP2rLp8ChVU04zMUcvmHstJhvU7aO+J1kleXsdv6cmLgTiaDEMBDi6Rsx
         TVvg==
X-Gm-Message-State: APjAAAVtRSTQpgirgKaoJx4hlH7J91VOAtq3Tg4EEJiPisIsLfRSNyPQ
        sFcz36qPEEtd7tmvCXEFIxs2Dg==
X-Google-Smtp-Source: APXvYqwQPpa4ccR9yn8sr1GHSz0ZBami4yoxqnFONavd5I9URFh1iVnI3248eVidBRh99JmG9Iub7Q==
X-Received: by 2002:a7b:cf01:: with SMTP id l1mr3467292wmg.86.1576679103907;
        Wed, 18 Dec 2019 06:25:03 -0800 (PST)
Received: from debian-brgl.home (amontpellier-652-1-53-230.w109-210.abo.wanadoo.fr. [109.210.44.230])
        by smtp.gmail.com with ESMTPSA id x11sm2889981wre.68.2019.12.18.06.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 06:25:03 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 5/7] bindings: cxx: tests: add a test-case for reading multiple line events
Date:   Wed, 18 Dec 2019 15:24:47 +0100
Message-Id: <20191218142449.10957-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191218142449.10957-1-brgl@bgdev.pl>
References: <20191218142449.10957-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Extend the test coverage of C++ bindings with tests of reading of
multiple line events at once.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/tests/tests-event.cpp | 31 ++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/bindings/cxx/tests/tests-event.cpp b/bindings/cxx/tests/tests-event.cpp
index 8713333..63b6cc5 100644
--- a/bindings/cxx/tests/tests-event.cpp
+++ b/bindings/cxx/tests/tests-event.cpp
@@ -8,6 +8,7 @@
 #include <catch2/catch.hpp>
 #include <gpiod.hpp>
 #include <poll.h>
+#include <thread>
 
 #include "gpio-mockup.hpp"
 
@@ -217,3 +218,33 @@ TEST_CASE("It's possible to read values from lines requested for events", "[even
 		REQUIRE(line.get_value() == 0);
 	}
 }
+
+TEST_CASE("It's possible to read more than one line event", "[event][line]")
+{
+	mockup::probe_guard mockup_chips({ 8 });
+	::gpiod::chip chip(mockup::instance().chip_name(0));
+	auto line = chip.get_line(4);
+	::gpiod::line_request config;
+
+	config.consumer = consumer.c_str();
+	config.request_type = ::gpiod::line_request::EVENT_BOTH_EDGES;
+
+	line.request(config);
+
+	mockup::instance().chip_set_pull(0, 4, 1);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+	mockup::instance().chip_set_pull(0, 4, 0);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+	mockup::instance().chip_set_pull(0, 4, 1);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+
+	auto events = line.event_read_multiple();
+
+	REQUIRE(events.size() == 3);
+	REQUIRE(events.at(0).event_type == ::gpiod::line_event::RISING_EDGE);
+	REQUIRE(events.at(1).event_type == ::gpiod::line_event::FALLING_EDGE);
+	REQUIRE(events.at(2).event_type == ::gpiod::line_event::RISING_EDGE);
+	REQUIRE(events.at(0).source == line);
+	REQUIRE(events.at(1).source == line);
+	REQUIRE(events.at(2).source == line);
+}
-- 
2.23.0

