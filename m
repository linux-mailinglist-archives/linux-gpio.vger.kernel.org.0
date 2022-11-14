Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EAB9627522
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 05:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235714AbiKNEB6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Nov 2022 23:01:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235773AbiKNEB5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Nov 2022 23:01:57 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3F012D39
        for <linux-gpio@vger.kernel.org>; Sun, 13 Nov 2022 20:01:55 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id m6-20020a17090a5a4600b00212f8dffec9so9514605pji.0
        for <linux-gpio@vger.kernel.org>; Sun, 13 Nov 2022 20:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbK+IngWpViM1296w06W1SejMrRpWzBlWnD5Rov/MPA=;
        b=pmSt3IvQ7+EZev/YEErhcv5XsaB9ugQFhJOfkxuSEcbXohVhbs3Nq8zzbMzM3/YeIY
         C0sGRCsJPWZgyzJRP1E4kuHmX4a/j4wetCtwaVLN2+6fifCzi4r60lIsHL4MikiNbGoa
         t5eUqa3MupfBSnIy0H+7qcI7RbpIr9/luCCKSM+DDVYcc4bwXR53GmNmcM+loqFGpm+R
         UeIF2U/5IH0fS0hOgfpuOq4UoiCZrjiBlu87sdeBWIAEnd1sQ8+R4U2AX/XY2Qqe4ISy
         b0zzjCxHTX407l7UTzOXqdNwc6PxUHvoF4fJX67s1wM3zl7ofxL6bUjKjBDET02WuyO1
         r90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbK+IngWpViM1296w06W1SejMrRpWzBlWnD5Rov/MPA=;
        b=lkj8cYqaaJjXvSqWSyTLJIhYsuvO2bnSDXAiJqNgkSSkp2L72y4NNgwysgiSxEleou
         6HltVHYZPW8sE1m+J+gPijAyDl1qZSSrxDPZrubNHH9Aj0n5fax64v09lh8h592dXEkw
         Xd6RpQNcJib5wusljzBKNW/g4pLwZgmfGQNIxGpw0fREoOPHfy7T5igpwJaCdNTANB2H
         1byQcJ8C7Ezy51v+y3rLsWzCUzpnEzhLgB8neJOLlkpeBf6S0UiyA5M/Ryg96Iw0I+2Z
         nVpUiiRo8V4c9p+eM8AcetHxNpD7wq2i7G1ZMq3zHnbmqqxHvp5jvWuByrjW0whzFbfG
         sifw==
X-Gm-Message-State: ANoB5pk5WosExbCiyT8OVGVDR5m2PXzZK89BqBVcAQOdv8WPx2XDNsov
        9rLZR68qAH4dqg9tJS3m0YfMnCaxYhw=
X-Google-Smtp-Source: AA0mqf4iF2zPySxp6mmxrEEkSf1UzHCEEjHCJ0jqCzja9QXQI/wp7wi3JWqgdVebfkbv8K77bD1uDw==
X-Received: by 2002:a17:902:be12:b0:186:a97d:6bcc with SMTP id r18-20020a170902be1200b00186a97d6bccmr11881001pls.121.1668398514473;
        Sun, 13 Nov 2022 20:01:54 -0800 (PST)
Received: from sol.home.arpa (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id f11-20020a170902684b00b001801aec1f6bsm6018636pln.141.2022.11.13.20.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 20:01:54 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH v4 5/5] tools: gpionotify tests
Date:   Mon, 14 Nov 2022 12:01:02 +0800
Message-Id: <20221114040102.66031-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221114040102.66031-1-warthog618@gmail.com>
References: <20221114040102.66031-1-warthog618@gmail.com>
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
 tools/gpio-tools-test.bats | 503 +++++++++++++++++++++++++++++++++++++
 1 file changed, 503 insertions(+)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index 78b0959..d73cf9b 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -2419,3 +2419,506 @@ request_release_line() {
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

