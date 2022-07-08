Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 726A556B955
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 14:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237070AbiGHMIR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 08:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237965AbiGHMIO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 08:08:14 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 205B19B1B9
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 05:08:11 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id b2so16181930plx.7
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 05:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cs60ckaV8e2TmKDdLfUOsjaVm0nijH9N84gbrd00ETg=;
        b=lqDSo5ClYx1SijrS396VDDVmJQJNouFXgNicyAUnCmqNqjo+ilBJkBotBBwu3UxNTn
         3DmGRFwduQS5JHgoVG3ZubPpTVl7/0UdP+6+cEFBJXgYzQK1z0x0/JdrLIu/gag/o71K
         pJJttb50l6cZX6yAb5eqix7+6R8cdtu/NWPnk4RFJOUKxhE9VkJgoqif+0XeYYPbeKrK
         cFrRHPXSfSvnv4BHQJBd92yF9Rb4ivRrduVNhX2BSbSjw+L8FMT7moO3Lr9+JyxvogxL
         Q5zT4D2sX1AXW/0ELGJzQjd90s8NUVmtwneSNdSZF8eyW3SFVUsRDUc8uU70kFrcmW+b
         pHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cs60ckaV8e2TmKDdLfUOsjaVm0nijH9N84gbrd00ETg=;
        b=fId88Jqvtf8ik3ixa07R5D5ugnjYuz2M76JphF+uFzqNe8BDQ1m9tof4zkDa2zUhAT
         VQAye6fpTD3yuVTh+YjqjRk4pjVWFyKo7QKY3jH8RfwYgC1IkizO18TIwP9TWFaOO7Oy
         uoum+Wt7y+1XHyBK/iFU8LKdvFL8LWjnai6b4gkCAETBh1wW6bktJc5Rnd9gVkw1fkPF
         y5hul+BBuGcpyKSOYE9hy5halqMjeBmFmOsdaNdSC6u2Jdf6MhjaJ/6Le9Pt8HoJ4hYb
         ogemYysTnmW1MzhIkzSQCcwb9/w0+t/0bG06LMiSum0AYzbOgZwwn5gH/Q4+HCwu+ROy
         fxjw==
X-Gm-Message-State: AJIora90R0NUrGFudCPfIvko5GZrUMkhLwsaTzQaUpwp7tu8UwslPJ1s
        Gl+Rdx/E7cXXz1/I0DsXFG3Y53cCFTA=
X-Google-Smtp-Source: AGRyM1tD9Ls/QFbKLc7UMOQUYYhPwJ7QIn6GmWuI8Dp7U+Rpem8wl1FeXFzQdjHuTQs3SHDqhQdhFQ==
X-Received: by 2002:a17:902:744c:b0:16b:dacb:5724 with SMTP id e12-20020a170902744c00b0016bdacb5724mr3430028plt.57.1657282088904;
        Fri, 08 Jul 2022 05:08:08 -0700 (PDT)
Received: from sol.home.arpa (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b0016bfafffa0esm6490312plq.227.2022.07.08.05.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 05:08:08 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH v2 5/6] tools: gpiowatch tests
Date:   Fri,  8 Jul 2022 20:06:25 +0800
Message-Id: <20220708120626.89844-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220708120626.89844-1-warthog618@gmail.com>
References: <20220708120626.89844-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Extend the tool test suite to cover the gpiowatch tool.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio-tools-test.bats | 289 +++++++++++++++++++++++++++++++++++++
 1 file changed, 289 insertions(+)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index fad234b..a9161e3 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -2320,3 +2320,292 @@ request_release_line() {
 	dut_read
 	output_is "%x"
 }
+
+#
+# gpiowatch test cases
+#
+
+@test "gpiowatch: by name" {
+	gpiosim_chip sim0 num_lines=8 line_name=4:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner foo
+	dut_regex_match "Watching line .*"
+
+	request_release_line $sim0 4
+
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+foo\\s+.*"
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+foo\\s+.*"
+	# tools currently have no way to generate a RECONFIG event
+}
+
+@test "gpiowatch: by offset" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --chip $sim0 4
+	dut_regex_match "Watching line .*"
+
+	request_release_line $sim0 4
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+$sim0\\s+4\\s+.*"
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+$sim0\\s+4\\s+.*"
+
+	assert_fail dut_readable
+}
+
+@test "gpiowatch: by symlink" {
+	gpiosim_chip sim0 num_lines=8
+	gpiosim_chip_symlink sim0 .
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --chip $GPIOSIM_CHIP_LINK 4
+	dut_regex_match "Watching line .*"
+
+	request_release_line $sim0 4
+	dut_regex_match \
+"\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+$GPIOSIM_CHIP_LINK\\s+4\\s+.*"
+	dut_regex_match \
+"\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+$GPIOSIM_CHIP_LINK\\s+4\\s+.*"
+
+	assert_fail dut_readable
+}
+
+@test "gpiowatch: by chip and name" {
+	gpiosim_chip sim0 num_lines=8 line_name=4:foo
+	gpiosim_chip sim1 num_lines=8 line_name=2:foo
+
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	dut_run gpiowatch --banner --chip $sim1 foo
+	dut_regex_match "Watching line .*"
+
+	request_release_line $sim1 2
+	dut_regex_match \
+"\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+$sim1\\s+2\\s+foo\\s+.*"
+	dut_regex_match \
+"\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+$sim1\\s+2\\s+foo\\s+.*"
+
+	assert_fail dut_readable
+}
+
+@test "gpiowatch: first matching named line" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
+				      line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+
+	dut_run gpiowatch --banner foobar
+	dut_regex_match "Watching line .*"
+
+	request_release_line ${GPIOSIM_CHIP_NAME[sim0]} 3
+	dut_regex_match \
+"\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+foobar\\s+.*"
+	dut_regex_match \
+"\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+foobar\\s+.*"
+
+	assert_fail dut_readable
+}
+
+@test "gpiowatch: multiple lines" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --chip $sim0 1 2 3 4 5
+	dut_regex_match "Watching lines .*"
+
+	request_release_line $sim0 2
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+$sim0\\s+2\\s+.*"
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+$sim0\\s+2\\s+.*"
+
+	request_release_line $sim0 3
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+$sim0\\s+3\\s+.*"
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+$sim0\\s+3\\s+.*"
+
+	request_release_line $sim0 4
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+$sim0\\s+4\\s+.*"
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+$sim0\\s+4\\s+.*"
+
+	assert_fail dut_readable
+}
+
+@test "gpiowatch: multiple lines by name and offset" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --chip $sim0 bar foo 3
+	dut_regex_match "Watching lines .*"
+
+	request_release_line $sim0 2
+	dut_regex_match \
+"\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+$sim0\\s+2\\s+bar\\s+.*"
+	dut_regex_match \
+"\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+$sim0\\s+2\\s+bar\\s+.*"
+
+	request_release_line $sim0 1
+	dut_regex_match \
+"\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+$sim0\\s+1\\s+foo\\s+.*"
+	dut_regex_match \
+"\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+$sim0\\s+1\\s+foo\\s+.*"
+
+	request_release_line $sim0 3
+	dut_regex_match \
+"\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+$sim0\\s+3\\s+unnamed\\s+.*"
+	dut_regex_match \
+"\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+$sim0\\s+3\\s+unnamed\\s+.*"
+
+	assert_fail dut_readable
+}
+
+@test "gpiowatch: multiple lines across multiple chips" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=4:xyz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+	local sim1=${GPIOSIM_CHIP_NAME[sim1]}
+
+	dut_run gpiowatch --banner baz bar foo xyz
+	dut_regex_match "Watching lines .*"
+
+	request_release_line $sim0 2
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+bar\\s+.*"
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+bar\\s+.*"
+
+	request_release_line $sim0 1
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+foo\\s+.*"
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+foo\\s+.*"
+
+	request_release_line $sim1 4
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+xyz\\s+.*"
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+xyz\\s+.*"
+
+	request_release_line $sim1 0
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+baz\\s+.*"
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+baz\\s+.*"
+
+	assert_fail dut_readable
+}
+
+@test "gpiowatch: exit after SIGINT" {
+	gpiosim_chip sim0 num_lines=8
+
+	dut_run gpiowatch --banner --chip ${GPIOSIM_CHIP_NAME[sim0]} 4
+	dut_regex_match "Watching line .*"
+
+	dut_kill -SIGINT
+	dut_wait
+
+	status_is 130
+}
+
+@test "gpiowatch: exit after SIGTERM" {
+	gpiosim_chip sim0 num_lines=8
+
+	dut_run gpiowatch --banner --chip ${GPIOSIM_CHIP_NAME[sim0]} 4
+	dut_regex_match "Watching line .*"
+
+	dut_kill -SIGTERM
+	dut_wait
+
+	status_is 143
+}
+
+@test "gpiowatch: with nonexistent line" {
+	run_tool gpiowatch nonexistent-line
+
+	status_is 1
+	output_regex_match ".*cannot find line nonexistent-line"
+}
+
+@test "gpiowatch: with same line twice" {
+	gpiosim_chip sim0 num_lines=8 line_name=1:foo
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	# by offset
+	run_tool gpiowatch --chip $sim0 0 0
+
+	status_is 1
+	num_lines_is 1
+	output_regex_match ".*lines 0 and 0 are the same"
+
+	# by name
+	run_tool gpiowatch --chip $sim0 foo foo
+
+	status_is 1
+	num_lines_is 1
+	output_regex_match ".*lines foo and foo are the same"
+
+	# by name and offset
+	run_tool gpiowatch --chip $sim0 1 foo
+
+	status_is 1
+	num_lines_is 1
+	output_regex_match ".*lines 1 and foo are the same"
+}
+
+@test "gpiowatch: with strict named line check" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar \
+				      line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+
+	run_tool gpiowatch --strict foobar
+
+	status_is 1
+	output_regex_match ".*line foobar is not unique"
+}
+
+@test "gpiowatch: with lines strictly by name" {
+	# not suggesting this setup makes sense
+	# - just test that we can deal with it
+	gpiosim_chip sim0 num_lines=8 line_name=1:42 line_name=6:13
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --by-name --chip $sim0 42 13
+	dut_flush
+
+	request_release_line $sim0 1
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+$sim0\\s+1\\s+.*"
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+$sim0\\s+1\\s+.*"
+
+	request_release_line $sim0 6
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+$sim0\\s+6\\s+.*"
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+$sim0\\s+6\\s+.*"
+
+	assert_fail dut_readable
+}
+
+@test "gpiowatch: with no arguments" {
+	run_tool gpiowatch
+
+	status_is 1
+	output_regex_match ".*at least one GPIO line must be specified"
+}
+
+@test "gpiowatch: with no line specified" {
+	gpiosim_chip sim0 num_lines=8
+
+	run_tool gpiowatch --chip ${GPIOSIM_CHIP_NAME[sim0]}
+
+	status_is 1
+	output_regex_match ".*at least one GPIO line must be specified"
+}
+
+@test "gpiowatch: with offset out of range" {
+	gpiosim_chip sim0 num_lines=4
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpiowatch --chip $sim0 5
+
+	status_is 1
+	output_regex_match ".*offset 5 is out of range on chip $sim0"
+}
-- 
2.37.0

