Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7E0B10E046
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727401AbfLADZ3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:25:29 -0500
Received: from mail-pf1-f179.google.com ([209.85.210.179]:40854 "EHLO
        mail-pf1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADZ2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:25:28 -0500
Received: by mail-pf1-f179.google.com with SMTP id q8so788610pfh.7
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4DZoLZh9mXZvWpKFr9luwqZl1ExQjVySucAaYkD9SyE=;
        b=KAEscWx9yjt/2g/WIsiYYxQJBOdQrLunnUR9P6UIxhfwGHF5G7Ldjln0zzQ0QWfGoG
         VxFPVbhU/BkAdbNXc1qlaMNUwesVdn0M90u8xIuDDs+nX1wVjUMYP7s59PUFSy7Gs+BJ
         +wIUUP/a1rsHVQ9S14icdJ5J1MUuSPfaihdbU3Nb//5tzC4cltz3YzeNpHC5ujP8lVpg
         sPpeACiMJjH1MKYnesZosia1g5oxDzZaufFu7vh8+HqbisBLRoTwxMDYVq7fdIWGqKgG
         lL1SH2IHGcdEUKe3NMMKWbOAEqMFuA80b+1QBhfj6odeoJ39FGDgnEKd8Oif9VHsj6sT
         cC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4DZoLZh9mXZvWpKFr9luwqZl1ExQjVySucAaYkD9SyE=;
        b=S/nPtD3RL/UG4JEH0aJZZvW1SY/cnXvJA8jVGq2eyzPN/BDxoO1Y/7h2kHOZMQiRjF
         VmHPeqETEpJ95wajbkwFU9+NxjMpNlZ7e7SJdlwTtmdA/2BFmeLuVLzIkSc8y4+V028S
         wq/Td1d4bjxsokie2G8Le0ie2xBVKHIqtFeNTSzHtACGRp2tEjmTWir/qYDDiVkzjhVs
         /OIEizUctEqzRzwDt6XwtH+aOcWhTma/ArpR5uhh1HWSxo+vEUXfFjPZ8lDnT6EFFdF3
         MAXE0KYeFepHUUyuNgrs7WroeVS438TFA7pBikWyGskwL7GSd4xAx5S4gsfx21B9nCch
         tK6Q==
X-Gm-Message-State: APjAAAW2Ed72iFx+Ft5sg12fMsONFebdOyVe401dvtUw5KncA/ZxQpdf
        LX9+8pUJEazLHvT2SWQ+HI/H/K1h
X-Google-Smtp-Source: APXvYqynVsVVsyOMpoi1RuO7cyGEjNXElGFWHE0RxJhR34eESnA2dVUKmtVhyx8eluzSj8v1oHbRJg==
X-Received: by 2002:a63:4c14:: with SMTP id z20mr24533734pga.10.1575170727914;
        Sat, 30 Nov 2019 19:25:27 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:25:27 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 17/20] tools: add tests for drive flags
Date:   Sun,  1 Dec 2019 11:24:04 +0800
Message-Id: <20191201032407.23589-18-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
References: <20191201032407.23589-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add tests for drive flags in gpioset.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio-tools-test.bats | 82 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index 8953f38..b5d8bb5 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -442,6 +442,79 @@ teardown() {
 	test "$status" -eq "0"
 }
 
+@test "gpioset: set lines and wait for SIGTERM (push-pull)" {
+	gpio_mockup_probe 8 8 8
+
+	coproc_run_tool gpioset --drive=push-pull --mode=signal "$(gpio_mockup_chip_name 2)" \
+					0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
+
+	gpio_mockup_check_value 2 0 0
+	gpio_mockup_check_value 2 1 0
+	gpio_mockup_check_value 2 2 1
+	gpio_mockup_check_value 2 3 1
+	gpio_mockup_check_value 2 4 1
+	gpio_mockup_check_value 2 5 1
+	gpio_mockup_check_value 2 6 0
+	gpio_mockup_check_value 2 7 1
+
+	coproc_tool_kill
+	coproc_tool_wait
+
+	test "$status" -eq "0"
+}
+
+@test "gpioset: set lines and wait for SIGTERM (open-drain)" {
+	gpio_mockup_probe 8 8 8
+
+	gpio_mockup_set_pull 2 2 1
+	gpio_mockup_set_pull 2 3 1
+	gpio_mockup_set_pull 2 5 1
+	gpio_mockup_set_pull 2 7 1
+
+	coproc_run_tool gpioset --drive=open-drain --mode=signal "$(gpio_mockup_chip_name 2)" \
+					0=0 1=0 2=1 3=1 4=1 5=1 6=0 7=1
+
+	gpio_mockup_check_value 2 0 0
+	gpio_mockup_check_value 2 1 0
+	gpio_mockup_check_value 2 2 1
+	gpio_mockup_check_value 2 3 1
+	gpio_mockup_check_value 2 4 0
+	gpio_mockup_check_value 2 5 1
+	gpio_mockup_check_value 2 6 0
+	gpio_mockup_check_value 2 7 1
+
+	coproc_tool_kill
+	coproc_tool_wait
+
+	test "$status" -eq "0"
+}
+
+@test "gpioset: set lines and wait for SIGTERM (open-source)" {
+	gpio_mockup_probe 8 8 8
+
+	gpio_mockup_set_pull 2 2 1
+	gpio_mockup_set_pull 2 3 1
+	gpio_mockup_set_pull 2 5 1
+	gpio_mockup_set_pull 2 7 1
+
+	coproc_run_tool gpioset --drive=open-source --mode=signal "$(gpio_mockup_chip_name 2)" \
+					0=0 1=0 2=1 3=0 4=1 5=1 6=0 7=1
+
+	gpio_mockup_check_value 2 0 0
+	gpio_mockup_check_value 2 1 0
+	gpio_mockup_check_value 2 2 1
+	gpio_mockup_check_value 2 3 1
+	gpio_mockup_check_value 2 4 1
+	gpio_mockup_check_value 2 5 1
+	gpio_mockup_check_value 2 6 0
+	gpio_mockup_check_value 2 7 1
+
+	coproc_tool_kill
+	coproc_tool_wait
+
+	test "$status" -eq "0"
+}
+
 @test "gpioset: set some lines and wait for ENTER" {
 	gpio_mockup_probe 8 8 8
 
@@ -567,6 +640,15 @@ teardown() {
 	output_regex_match ".*invalid bias.*"
 }
 
+@test "gpioset: invalid drive" {
+	gpio_mockup_probe 8 8 8
+
+	run_tool gpioset --drive=bad "$(gpio_mockup_chip_name 1)" 0=1 1=1
+
+	test "$status" -eq "1"
+	output_regex_match ".*invalid drive.*"
+}
+
 @test "gpioset: daemonize in invalid mode" {
 	gpio_mockup_probe 8 8 8
 
-- 
2.24.0

