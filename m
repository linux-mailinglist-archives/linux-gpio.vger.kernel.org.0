Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE7F9109012
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 15:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbfKYOdR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 09:33:17 -0500
Received: from mail-pj1-f53.google.com ([209.85.216.53]:40030 "EHLO
        mail-pj1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbfKYOdR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 09:33:17 -0500
Received: by mail-pj1-f53.google.com with SMTP id ep1so6695823pjb.7
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 06:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zMTMfyn0qgrWE3bsY0sIswHuBaSbLHENecV0WRLRQ1w=;
        b=sVL89zaHjMMS1r95wHUPnulT5NOii+cu7bxB4t3YYCVZH1UJN6i9SJ032H0JMaQa9S
         22muClDjHnPnwf1hCIq2iMmS9306+Ap1E4aj7yl4rmj3NBTWUsSmXzdMKrahLP08z21Y
         O4a6GunBZ/X5oRHqCiXfetinvRMx8KQu+XEMNvZ1SsX+2HI6q3tLVxf14Yd7+6babK/4
         acbuzEWhITqcrfsiynJjz2WICEvDMzttE7P6jKrYXnbDdejACIkop370olSI5Uae7h7+
         lM6i0CURDhoMyUlgrvGN0S5nLl+Wh3Oo6Qzh9pSwX5xVNPvKvmYiqOdBNnqiYoL0P5bF
         01Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zMTMfyn0qgrWE3bsY0sIswHuBaSbLHENecV0WRLRQ1w=;
        b=EEWgeBIP3FDh/8Ibph2VCE58PjLYNpFLm2077dO3PNAae1hUbmFqCmrJQ/3OINnjil
         HAFORs1EwKC7oUaCRso3ep+FuI7GgLICYeK8wFVNq1C5rC6DVQ6Di+Imdxw/hdCXapS/
         cFwLGUel8uWSA9uwPE4hPPu7j5qbS/+/dPSHNVjhMBHEPEz6XnjD6pVCKJD0cSAlo0HH
         NZv6LSH0JsRYnac1qdvqYQZyyjTHiy2UD8XZSMRzvNywZ/3M73vQ9DJwOafdX3YNxBtY
         r9hfhHJTAj7chQ1TfIDh/lA9n2YMJ8KlD2KY48K04PQl+LX9Oh5Mx3KJGNZqdqEOQhhZ
         U+OQ==
X-Gm-Message-State: APjAAAXUlQESP+RSmHP958OXREghspsBydVLvYPYsMVBX2pcei0aOCr6
        9GyWBk4zEl7RRZJAtjFGDX32mLlF4xzT7A==
X-Google-Smtp-Source: APXvYqxT33X2DXWH7Kl5Jzx+GidvBmdP4e8PiWz7qzCdt/c9NIAaccKFNEQuizFxWSRlRPmFd0609Q==
X-Received: by 2002:a17:90a:bc41:: with SMTP id t1mr40352456pjv.89.1574692395975;
        Mon, 25 Nov 2019 06:33:15 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id i5sm8642100pfo.52.2019.11.25.06.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:33:14 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v3 14/14] tools: add tests for bias and drive flags
Date:   Mon, 25 Nov 2019 22:31:57 +0800
Message-Id: <20191125143157.26154-15-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125143157.26154-1-warthog618@gmail.com>
References: <20191125143157.26154-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add tests for bias flags to applicable tools - gpioget, gpioset, and
gpiomon, as well as drive flags for gpioset.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio-tools-test.bats | 139 +++++++++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index aff54f7..8bced02 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -312,6 +312,34 @@ teardown() {
 	test "$output" = "1 1 0 0 1 0 1 0"
 }
 
+@test "gpioget: read all lines (pull-up)" {
+	gpio_mockup_probe 8 8 8
+
+	gpio_mockup_set_pull 1 2 1
+	gpio_mockup_set_pull 1 3 1
+	gpio_mockup_set_pull 1 5 1
+	gpio_mockup_set_pull 1 7 1
+
+	run_tool gpioget --bias=pull-up "$(gpio_mockup_chip_name 1)" 0 1 2 3 4 5 6 7
+
+	test "$status" -eq "0"
+	test "$output" = "1 1 1 1 1 1 1 1"
+}
+
+@test "gpioget: read all lines (pull-down)" {
+	gpio_mockup_probe 8 8 8
+
+	gpio_mockup_set_pull 1 2 1
+	gpio_mockup_set_pull 1 3 1
+	gpio_mockup_set_pull 1 5 1
+	gpio_mockup_set_pull 1 7 1
+
+	run_tool gpioget --bias=pull-down "$(gpio_mockup_chip_name 1)" 0 1 2 3 4 5 6 7
+
+	test "$status" -eq "0"
+	test "$output" = "0 0 0 0 0 0 0 0"
+}
+
 @test "gpioget: read some lines" {
 	gpio_mockup_probe 8 8 8
 
@@ -405,6 +433,79 @@ teardown() {
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
 
@@ -576,6 +677,44 @@ teardown() {
 "event:\\s+FALLING\\s+EDGE\\s+offset:\\s+4\\s+timestamp:\\s+\[[0-9]+\.[0-9]+\]"
 }
 
+@test "gpiomon: single falling edge event (pull-up)" {
+	gpio_mockup_probe 8 8
+
+	gpio_mockup_set_pull 1 4 0
+
+	coproc_run_tool gpiomon --bias=pull-up "$(gpio_mockup_chip_name 1)" 4
+
+	gpio_mockup_set_pull 1 4 0
+	sleep 0.2
+
+	coproc_tool_kill
+	coproc_tool_wait
+
+	test "$status" -eq "0"
+	output_regex_match \
+"event:\\s+FALLING\\s+EDGE\\s+offset:\\s+4\\s+timestamp:\\s+\[[0-9]+\.[0-9]+\]"
+
+}
+
+@test "gpiomon: single rising edge event (pull-down)" {
+	gpio_mockup_probe 8 8
+
+	gpio_mockup_set_pull 1 4 1
+
+	coproc_run_tool gpiomon --bias=pull-down "$(gpio_mockup_chip_name 1)" 4
+
+	gpio_mockup_set_pull 1 4 1
+	sleep 0.2
+
+	coproc_tool_kill
+	coproc_tool_wait
+
+	test "$status" -eq "0"
+	output_regex_match \
+"event:\\s+RISING\\s+EDGE\\s+offset:\\s+4\\s+timestamp:\\s+\[[0-9]+\.[0-9]+\]"
+
+}
+
 @test "gpiomon: single rising edge event (active-low)" {
 	gpio_mockup_probe 8 8
 
-- 
2.24.0

