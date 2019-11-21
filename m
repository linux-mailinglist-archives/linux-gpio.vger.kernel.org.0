Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F160B1047A7
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 01:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbfKUAgz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 19:36:55 -0500
Received: from mail-pf1-f171.google.com ([209.85.210.171]:43366 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbfKUAgy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 19:36:54 -0500
Received: by mail-pf1-f171.google.com with SMTP id 3so670589pfb.10
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 16:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zMTMfyn0qgrWE3bsY0sIswHuBaSbLHENecV0WRLRQ1w=;
        b=meJ8j87uVRF2bRossMm5Ykb1YKEXxu49mPMMRhL8CsQ19ZMLIek7/CppQllvbkRVfr
         iQheLJaBSL1fu9xQhOjkf5qLzqHCpcX0+PN05aTY+ivK3cexTn6I57ggJE9WjybP4fJy
         8lyF03DzVV1inho+hssVgZvDvHsr6gGdm0BN0uxbZdEgeq6ZElN8uLNg8xDx5oAOOrPr
         u0QGCQTm0fRhWA9Ye5ELjxE3N8/GgvBkG5erQMJER+aiANda7u9E16gpm6n0quhAmGpC
         Ag2yGHlqxmI6D8ug4jbJoqK5cv0XbsKucO/9jidzJc/je7F7TQGNq6LKNMPxTeaBwnME
         Ge2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zMTMfyn0qgrWE3bsY0sIswHuBaSbLHENecV0WRLRQ1w=;
        b=cGp1psDl4wAv/IMiyAgEZsXy373jhF8YTsH1QC7feFvutRM6Y4nBfx9KU6P6bRGjJs
         4gkFZnfNKslJ7WoM0QMgVaATri33nvRWIKVTA5LM/Edw0oVfreuJWuhfHc/uEJHr6gd2
         deBI1TdJH7CAfIFEOgpUhzOKTdetoNnd4cjnJU8L2KiUXCs61ua3sa6GRDengjb/wMcK
         F/9WQHutI6+/yu1KeozzRKLM99KJzhm35r9V5D00saZ4P+rtd7w1b+ILbVxq81glDjoM
         1lLJ9UemhJ0v/qeeMQc5MuivAqjC2tiVo54Gf/gyUQ9/gJOjoFZbOnm/mrJNXU2C1f7Q
         WQfQ==
X-Gm-Message-State: APjAAAXGL+ikRHb/7Sind8Cc6cYTQmSixkgtC0phjFEjI3nQ+3JYNm8j
        4lxOYUr5FS8tW6h9BM12GYS8+cuZXB8=
X-Google-Smtp-Source: APXvYqz61EqZG4WtGwww2h4r3k26cHEuAGA/RfBQ+P9FM4buQCGFMXKGuFVuVY1d3lyS/gONrTqy9w==
X-Received: by 2002:a63:4f41:: with SMTP id p1mr6314365pgl.138.1574296613477;
        Wed, 20 Nov 2019 16:36:53 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id s1sm420756pgk.9.2019.11.20.16.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:36:53 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH v2 14/14] tools: add tests for bias and drive flags
Date:   Thu, 21 Nov 2019 08:35:56 +0800
Message-Id: <20191121003556.9020-15-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121003556.9020-1-warthog618@gmail.com>
References: <20191121003556.9020-1-warthog618@gmail.com>
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

