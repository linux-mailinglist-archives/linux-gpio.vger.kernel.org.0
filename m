Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E519F631E37
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Nov 2022 11:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbiKUKYG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 05:24:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbiKUKXw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 05:23:52 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 687C6AD9B3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 02:23:51 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id y13so10914349pfp.7
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 02:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFHUUOexPM5tZtPnn+1tIXnw6r2LLGXZYc8qiI0vDE0=;
        b=lFIWSerDqoRzzLVBS8buUUhQMMDKoju+2IsXs4VKVXm6I3tm4udUk3qyKVe9H8Kqo6
         NccEWAegtycpboHopPhu5VlLc/wW/F4KSRQc2n7V4GACenEQA66QkBrlFZk7s0SrCEbL
         otQYS8+ti1R/W60CvexzclfjEKulTaHJEYF7kHC/vsRWljBSDjBzQaLpupXxe4NO9vMK
         oR6fwAIIn5NuExr4nMx7AzXSDAqp/KI8XJdy+U30GpHSrhxKI0b6cmgsZUjgGno+p6Jw
         r8sHSgSys0+Vdt8TwTo9WZ906FmMVFr208HRRiee/x27BN+4CTqd0G0oSZ2CoXtzPXLx
         u7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFHUUOexPM5tZtPnn+1tIXnw6r2LLGXZYc8qiI0vDE0=;
        b=35vs8PZ6If89SCnIim60wDD1FyJ6/4IMmkLkx3HeRqqonOLTNyt1ftKPDMeFdmSUQc
         zuEr7DTLyYY6vtvUU5gN+DzWIC0l0ohSSD1TLQeHn7mjZw+uthOd1MLI89MSfGcyy6UN
         TzJJRb5cPp0tIPugwNsUec/3axS0xH2OxSZU31+OJF3NC/AP2otzPjzCPHh571Oj94lT
         pFtF+/kJzC6dVK3Sh9TG8HaV4P8u+/2y1v54ktBkqDPo5c/UgYGEumLqhead8Ggoeq0W
         i1yZyK5fZpqYP4l8a2faAYtTnIqXC0Wdrmpmnxm1J3ujusnC18vDiWTnb7Ru/CJbE6FI
         BxnQ==
X-Gm-Message-State: ANoB5pnSPOYDY7l3epQLsjMp67PNzo0G1vnrPtaESX25ipc8jeVulhaD
        zBsLfTDlHh68eETBDXroQ0QmI82P3MM=
X-Google-Smtp-Source: AA0mqf7MgUdtSooIojuvi1atexrgFDAdQ8CRSYTudlKkd6Y8HUHDqTV3yIA1yiTD4mcckMRLjpOWPg==
X-Received: by 2002:a63:d34e:0:b0:477:650a:705c with SMTP id u14-20020a63d34e000000b00477650a705cmr3732766pgi.588.1669026230519;
        Mon, 21 Nov 2022 02:23:50 -0800 (PST)
Received: from sol.home.arpa (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id s184-20020a625ec1000000b0056ba7ce4d5asm8347419pfb.52.2022.11.21.02.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 02:23:50 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH v5 5/6] tools: gpionotify tests
Date:   Mon, 21 Nov 2022 18:22:52 +0800
Message-Id: <20221121102253.38306-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121102253.38306-1-warthog618@gmail.com>
References: <20221121102253.38306-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Extend the tool test suite to cover the gpionotify tool.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio-tools-test.bats | 531 +++++++++++++++++++++++++++++++++++++
 1 file changed, 531 insertions(+)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index 88de9bf..bf7f3d6 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -906,6 +906,20 @@ request_release_line() {
 	status_is 0
 }
 
+@test "gpioget: with consumer" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
+	gpiosim_chip sim1 num_lines=8 line_name=3:baz line_name=4:xyz
+
+	dut_run gpionotify --banner -F "%l %E %C" foo baz
+
+	run_tool gpioget --consumer gpio-tools-tests foo baz
+	status_is 0
+
+	dut_read
+	output_regex_match "foo requested gpio-tools-tests"
+	output_regex_match "baz requested gpio-tools-tests"
+}
+
 @test "gpioget: with pull-up" {
 	gpiosim_chip sim0 num_lines=8
 
@@ -2417,3 +2431,520 @@ request_release_line() {
 	dut_read
 	output_is "%x"
 }
+
+#
+# gpionotify test cases
+#
+
+@test "gpionotify: by name" {
+	gpiosim_chip sim0 num_lines=8 line_name=4:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner foo
+	dut_regex_match "Watching line .*"
+
+	request_release_line $sim0 4
+
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+\"foo\""
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+\"foo\""
+	# tools currently have no way to generate a reconfig event
+}
+
+@test "gpionotify: by offset" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --chip $sim0 4
+	dut_regex_match "Watching line .*"
+
+	request_release_line $sim0 4
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 4"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 4"
+
+	assert_fail dut_readable
+}
+
+@test "gpionotify: by symlink" {
+	gpiosim_chip sim0 num_lines=8
+	gpiosim_chip_symlink sim0 .
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --chip $GPIOSIM_CHIP_LINK 4
+	dut_regex_match "Watching line .*"
+
+	request_release_line $sim0 4
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0\\s+4"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0\\s+4"
+
+	assert_fail dut_readable
+}
+
+@test "gpionotify: by chip and name" {
+	gpiosim_chip sim0 num_lines=8 line_name=4:foo
+	gpiosim_chip sim1 num_lines=8 line_name=2:foo
+
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	dut_run gpionotify --banner --chip $sim1 foo
+	dut_regex_match "Watching line .*"
+
+	request_release_line $sim1 2
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim1 2 \"foo\""
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim1 2 \"foo\""
+
+	assert_fail dut_readable
+}
+
+@test "gpionotify: first matching named line" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
+				      line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+
+	dut_run gpionotify --banner foobar
+	dut_regex_match "Watching line .*"
+
+	request_release_line ${GPIOSIM_CHIP_NAME[sim0]} 3
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+\"foobar\""
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+\"foobar\""
+
+	assert_fail dut_readable
+}
+
+@test "gpionotify: with requested" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 4 pull-up
+
+	dut_run gpionotify --banner --event=requested --chip $sim0 4
+	dut_flush
+
+	request_release_line ${GPIOSIM_CHIP_NAME[sim0]} 4
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 4"
+	assert_fail dut_readable
+}
+
+@test "gpionotify: with released" {
+	gpiosim_chip sim0 num_lines=8
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 4 pull-down
+
+	dut_run gpionotify --banner --event=released --chip $sim0 4
+	dut_flush
+
+	request_release_line ${GPIOSIM_CHIP_NAME[sim0]} 4
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 4"
+	assert_fail dut_readable
+}
+
+@test "gpionotify: with quiet mode" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --quiet --chip $sim0 4
+	dut_flush
+
+	request_release_line ${GPIOSIM_CHIP_NAME[sim0]} 4
+	assert_fail dut_readable
+}
+
+@test "gpionotify: with unquoted" {
+	gpiosim_chip sim0 num_lines=8 line_name=4:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --unquoted foo
+	dut_regex_match "Watching line .*"
+
+	request_release_line $sim0 4
+
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+foo"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+foo"
+}
+
+@test "gpionotify: with num-events" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	# redirect, as gpionotify exits after 4 events
+	dut_run_redirect gpionotify --num-events=4 --chip $sim0 3 4
+
+
+	request_release_line ${GPIOSIM_CHIP_NAME[sim0]} 4
+	request_release_line ${GPIOSIM_CHIP_NAME[sim0]} 3
+
+	dut_wait
+	status_is 0
+	dut_read_redirect
+
+	regex_matches "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 4" "${lines[0]}"
+	regex_matches "[0-9]+\.[0-9]+\\s+released\\s+$sim0 4" "${lines[1]}"
+	regex_matches "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 3" "${lines[2]}"
+	regex_matches "[0-9]+\.[0-9]+\\s+released\\s+$sim0 3" "${lines[3]}"
+	num_lines_is 4
+}
+
+@test "gpionotify: multiple lines" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --chip $sim0 1 2 3 4 5
+	dut_regex_match "Watching lines .*"
+
+	request_release_line $sim0 2
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 2"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 2"
+
+	request_release_line $sim0 3
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 3"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 3"
+
+	request_release_line $sim0 4
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 4"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 4"
+
+	assert_fail dut_readable
+}
+
+@test "gpionotify: multiple lines by name and offset" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --chip $sim0 bar foo 3
+	dut_regex_match "Watching lines .*"
+
+	request_release_line $sim0 2
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 2\\s+\"bar\""
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 2\\s+\"bar\""
+
+	request_release_line $sim0 1
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 1\\s+\"foo\""
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 1\\s+\"foo\""
+
+	request_release_line $sim0 3
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 3"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 3"
+
+	assert_fail dut_readable
+}
+
+@test "gpionotify: multiple lines across multiple chips" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=4:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	dut_run gpionotify --banner baz bar foo xyz
+	dut_regex_match "Watching lines .*"
+
+	request_release_line $sim0 2
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+\"bar\""
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+\"bar\""
+
+	request_release_line $sim0 1
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+\"foo\""
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+\"foo\""
+
+	request_release_line $sim1 4
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+\"xyz\""
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+\"xyz\""
+
+	request_release_line $sim1 0
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+\"baz\""
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+\"baz\""
+
+	assert_fail dut_readable
+}
+
+@test "gpionotify: exit after SIGINT" {
+	gpiosim_chip sim0 num_lines=8
+
+	dut_run gpionotify --banner --chip ${GPIOSIM_CHIP_NAME[sim0]} 4
+	dut_regex_match "Watching line .*"
+
+	dut_kill -SIGINT
+	dut_wait
+
+	status_is 130
+}
+
+@test "gpionotify: exit after SIGTERM" {
+	gpiosim_chip sim0 num_lines=8
+
+	dut_run gpionotify --banner --chip ${GPIOSIM_CHIP_NAME[sim0]} 4
+	dut_regex_match "Watching line .*"
+
+	dut_kill -SIGTERM
+	dut_wait
+
+	status_is 143
+}
+
+@test "gpionotify: with nonexistent line" {
+	run_tool gpionotify nonexistent-line
+
+	status_is 1
+	output_regex_match ".*cannot find line 'nonexistent-line'"
+}
+
+@test "gpionotify: with same line twice" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	# by offset
+	run_tool gpionotify --chip $sim0 0 0
+
+	output_regex_match ".*lines '0' and '0' are the same line"
+	num_lines_is 1
+	status_is 1
+
+	# by name
+	run_tool gpionotify foo foo
+
+	output_regex_match ".*lines 'foo' and 'foo' are the same line"
+	num_lines_is 1
+	status_is 1
+
+	# by name and offset
+	run_tool gpionotify --chip $sim0 1 foo
+
+	output_regex_match ".*lines '1' and 'foo' are the same line"
+	num_lines_is 1
+	status_is 1
+}
+
+@test "gpionotify: with strict named line check" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
+				      line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+
+	run_tool gpionotify --strict foobar
+
+	output_regex_match ".*line 'foobar' is not unique"
+	status_is 1
+}
+
+@test "gpionotify: with lines by offset" {
+	# not suggesting this setup makes any sense
+	# - just test that we can deal with it
+	gpiosim_chip sim0 num_lines=8 line_name=1:6 line_name=6:1
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --chip $sim0 1
+	dut_flush
+
+	request_release_line $sim0 1
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 1"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 1"
+
+	request_release_line $sim0 6
+
+	assert_fail dut_readable
+}
+
+@test "gpionotify: with lines strictly by name" {
+	# not suggesting this setup makes any sense
+	# - just test that we can deal with it
+	gpiosim_chip sim0 num_lines=8 line_name=1:6 line_name=6:1
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --by-name --chip $sim0 1
+	dut_flush
+
+	request_release_line $sim0 6
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 6 \"1\""
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 6 \"1\""
+
+	request_release_line $sim0 1
+	assert_fail dut_readable
+}
+
+@test "gpionotify: with no arguments" {
+	run_tool gpionotify
+
+	output_regex_match ".*at least one GPIO line must be specified"
+	status_is 1
+}
+
+@test "gpionotify: with no line specified" {
+	gpiosim_chip sim0 num_lines=8
+
+	run_tool gpionotify --chip ${GPIOSIM_CHIP_NAME[sim0]}
+
+	output_regex_match ".*at least one GPIO line must be specified"
+	status_is 1
+}
+
+@test "gpionotify: with offset out of range" {
+	gpiosim_chip sim0 num_lines=4
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpionotify --chip $sim0 5
+
+	output_regex_match ".*offset 5 is out of range on chip '$sim0'"
+	status_is 1
+}
+
+@test "gpionotify: with custom format (event type + offset)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --event=requested "--format=%e %o" -c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_read
+	output_is "1 4"
+}
+
+@test "gpionotify: with custom format (event type + offset joined)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --event=requested "--format=%e%o" -c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_read
+	output_is "14"
+}
+
+@test "gpionotify: with custom format (event, chip and line)" {
+	gpiosim_chip sim0 num_lines=8 line_name=4:baz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --event=released \
+		"--format=%e %o %E %c %l" -c $sim0 baz
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_regex_match "2 4 released $sim0 baz"
+}
+
+@test "gpionotify: with custom format (seconds timestamp)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --event=requested "--format=%e %o %S" \
+		-c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_regex_match "1 4 [0-9]+\\.[0-9]+"
+}
+
+@test "gpionotify: with custom format (UTC timestamp)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --event=released \
+		"--format=%U %e %o" -c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_regex_match \
+"[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]T[0-2][0-9]:[0-5][0-9]:[0-5][0-9]\\.[0-9]+Z 2 4"
+}
+
+@test "gpionotify: with custom format (localtime timestamp)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --event=released \
+		"--format=%L %e %o" -c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_regex_match \
+"[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]T[0-2][0-9]:[0-5][0-9]:[0-5][0-9]\\.[0-9]+ 2 4"
+}
+
+@test "gpionotify: with custom format (double percent sign)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --event=requested "--format=start%%end" \
+		-c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_read
+	output_is "start%end"
+}
+
+@test "gpionotify: with custom format (double percent sign + event type specifier)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --event=requested "--format=%%e" -c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_read
+	output_is "%e"
+}
+
+@test "gpionotify: with custom format (single percent sign)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --event=requested "--format=%" -c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_read
+	output_is "%"
+}
+
+@test "gpionotify: with custom format (single percent sign between other characters)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --event=requested "--format=foo % bar" -c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_read
+	output_is "foo % bar"
+}
+
+@test "gpionotify: with custom format (unknown specifier)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpionotify --banner --event=requested "--format=%x" -c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_read
+	output_is "%x"
+}
-- 
2.38.1

