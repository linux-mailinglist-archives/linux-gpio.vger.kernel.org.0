Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2954310E044
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbfLADZY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:25:24 -0500
Received: from mail-pl1-f170.google.com ([209.85.214.170]:46544 "EHLO
        mail-pl1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADZY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:25:24 -0500
Received: by mail-pl1-f170.google.com with SMTP id k20so10160181pll.13
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4NttUD4nLBUCYDLIL2ceGEksskrR1EGhfSOWVnbdkdQ=;
        b=pwi6HREiTFviVvsTK/vsWIYEmzzHGyQNGqF61J0xedRQfSX+sLjhSAjmlaOgpJ+V28
         +O00Jl92BTbXMR6WXxqyKXFjTWxwzrz4Pkk3Xmvw1R86+q7z9A34ErFnzMCHjN8p/0vp
         hhr3DVDzFF8K7gy8JuG9+/g77sAswGfWhm3Yc3wEw8H++xa30RgkfGYOW+r1miZo27zH
         Mk3Ij9m8Hi+Jwwx26oBbcZy0XWrnqx0uYAflJzvccuv7MVoYX9nhGI6XCVYUJ+fYL22C
         8KqLP0BxveoAF00aq0PlxBqqHfLjfWjbozDq6aGvTb0kJXP8MHtn3Kz+SahsDGmqTGwd
         j78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4NttUD4nLBUCYDLIL2ceGEksskrR1EGhfSOWVnbdkdQ=;
        b=CDzD6XsM7PxqPrnfaTdnyX7l4OpcqnpsXxnLX0ClFtqYMSDP9PG7fWHbcoidHrebd0
         /mhfT5sOADFStSKd8WW6x4WkQ8p3eCTpJi/j04wjtQmfCjq/ts22prbHeWARpltbuN5e
         YVAsAN1JrHNglmU5eaV9kU2OSbgIGek4wD2eZY9q2wAZZ+63rIlHErs833tNXoEqKoPQ
         ziil1Cl6pGt1I15ZfcTVpkvEp18UB/ukmvejxlPuUGfKNHQ+NP+NHIjHON2CGwKX7Cjx
         ncoJgUEM25RqbPdciSZr7lOcBC7Nmi6goploa1P7BYtPv3YdzhlWbf7OCCQEMSDb3HtG
         41NQ==
X-Gm-Message-State: APjAAAV2Zj/vK4QIBU0q56JDbg+pP1dr9DeXGW2xJdSW1wGv/tWAhcQW
        L7rTabiIO0+Tux67mxp/oo0RPbzX
X-Google-Smtp-Source: APXvYqzFams3PxaGgfTCUiEuVWEXchdUQzI9R5S2+dkzl7keix84PUCLdIKd4tnJJrQ31BOFaVBtRQ==
X-Received: by 2002:a17:90a:fb4f:: with SMTP id iq15mr17054985pjb.86.1575170723248;
        Sat, 30 Nov 2019 19:25:23 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:25:22 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 15/20] tools: add tests for bias flags
Date:   Sun,  1 Dec 2019 11:24:02 +0800
Message-Id: <20191201032407.23589-16-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
References: <20191201032407.23589-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add tests for bias flags to applicable tools - gpioget, gpioset, and
gpiomon.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio-tools-test      |  2 +-
 tools/gpio-tools-test.bats | 93 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/tools/gpio-tools-test b/tools/gpio-tools-test
index 6b93655..1b9f9a1 100755
--- a/tools/gpio-tools-test
+++ b/tools/gpio-tools-test
@@ -7,7 +7,7 @@
 # Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
 #
 
-MIN_KERNEL_VERSION="5.2.7"
+MIN_KERNEL_VERSION="5.5.0"
 BATS_SCRIPT="gpio-tools-test.bats"
 SOURCE_DIR="$(dirname ${BASH_SOURCE[0]})"
 
diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index aff54f7..8953f38 100755
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
 
@@ -359,6 +387,15 @@ teardown() {
 	output_regex_match ".*error reading GPIO values.*"
 }
 
+@test "gpioget: invalid bias" {
+	gpio_mockup_probe 8 8 8
+
+	run_tool gpioget --bias=bad "$(gpio_mockup_chip_name 1)" 0 1
+
+	test "$status" -eq "1"
+	output_regex_match ".*invalid bias.*"
+}
+
 #
 # gpioset test cases
 #
@@ -521,6 +558,15 @@ teardown() {
 	output_regex_match ".*invalid offset"
 }
 
+@test "gpioset: invalid bias" {
+	gpio_mockup_probe 8 8 8
+
+	run_tool gpioset --bias=bad "$(gpio_mockup_chip_name 1)" 0=1 1=1
+
+	test "$status" -eq "1"
+	output_regex_match ".*invalid bias.*"
+}
+
 @test "gpioset: daemonize in invalid mode" {
 	gpio_mockup_probe 8 8 8
 
@@ -576,6 +622,44 @@ teardown() {
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
 
@@ -749,6 +833,15 @@ teardown() {
 	output_regex_match ".*error waiting for events"
 }
 
+@test "gpiomon: invalid bias" {
+	gpio_mockup_probe 8 8 8
+
+	run_tool gpiomon --bias=bad "$(gpio_mockup_chip_name 1)" 0 1
+
+	test "$status" -eq "1"
+	output_regex_match ".*invalid bias.*"
+}
+
 @test "gpiomon: custom format (event type + offset)" {
 	gpio_mockup_probe 8 8 8
 
-- 
2.24.0

