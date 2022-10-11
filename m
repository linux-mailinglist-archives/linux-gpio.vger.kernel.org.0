Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7BB15FA94D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 02:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiJKAaI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Oct 2022 20:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiJKAaH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Oct 2022 20:30:07 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70F315FDE
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 17:30:05 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id bh13so11533157pgb.4
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2022 17:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXDAZSPlB3hFw4mxEX8zWSZZwDzMvwj/gShI9Uacsv4=;
        b=SkEPTztkO6qm2vQM42Pse/jLCC1Z8Ol8H0jtBU8JrT9/997RqdceCkNhlgI/yhB2Qf
         I1+01UQ/Sl1AIGraHLM6iQuV8/8SAUdCbpRU236D/RUM0tWpSHbXLqAsxqxb2uxIeA+F
         iGa/FEQZ0VKf6RUkeueTAg+jXg7bczLsBCleEKIBnNX16B9JkT4ysxAkZFW25ojv3For
         qQFPU5COf0xSxZDvBKT2i+pD9M16FMXmfGTfYhlDRVX/Qj3zWCy6OOf17QabKi3srZVM
         rr7f4XphkrTzxn/0/OdODw46CrVAUu8X6N8xGgsaObw8AEdFRepdMn6feC698rUHgLkp
         Hqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXDAZSPlB3hFw4mxEX8zWSZZwDzMvwj/gShI9Uacsv4=;
        b=Q92RG1XWSJfEEdicLRvh4mOXKWpUTRyDr9BaqEpf5gZUZAHSiI34HLtLMduDU279Ih
         eawXEZI2XJ0ZgtghPEyL+CMovikaHnHjnhca2pkEajQnpDCT8pSLfYhoAQzOhpVnAWli
         CYa1mPf3oz1lo9INyTace/aA0V3CYqAfvJL6xaJo//ggHQ6E5TJ1p5y5Y2uViXMtVtQx
         TLaPHAyFkppyCg2CvUGouBbb+xZqvytRqzoOUG8ZekDskKAju6ctzYzQpAa1uJDNZatg
         JZimg8QM8B3PGZL3cSWnhk4HK0bEeaRSbX920OYz+FQf9pmqVB/y1dR8hd729EZZjgj6
         AUmQ==
X-Gm-Message-State: ACrzQf1MCW3TR+W+nKWXmNkVy2OV+s5y6rdwiMd36fdDkGlf173Qe90b
        jugSNP8BxqqlfuhtQntpvD2niBZqueE=
X-Google-Smtp-Source: AMsMyM5n27EG7lcYr9FH9X3zkeqa7SpWP27h/oQDN3jk/iaDwoN5tNnSH4m45XyMHuKhMhW/mL33DQ==
X-Received: by 2002:a63:c1b:0:b0:457:dc63:6b01 with SMTP id b27-20020a630c1b000000b00457dc636b01mr18742052pgl.513.1665448204876;
        Mon, 10 Oct 2022 17:30:04 -0700 (PDT)
Received: from sol.home.arpa (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id y69-20020a62ce48000000b005377c74c409sm7541351pfg.4.2022.10.10.17.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 17:30:04 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH v3 5/5] tools: gpiowatch tests
Date:   Tue, 11 Oct 2022 08:29:09 +0800
Message-Id: <20221011002909.26987-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221011002909.26987-1-warthog618@gmail.com>
References: <20221011002909.26987-1-warthog618@gmail.com>
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

Extend the tool test suite to cover the gpiowatch tool.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio-tools-test.bats | 503 +++++++++++++++++++++++++++++++++++++
 1 file changed, 503 insertions(+)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index 6c12ffc..e42576b 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -2318,3 +2318,506 @@ request_release_line() {
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
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+foo"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+foo"
+	# tools currently have no way to generate a reconfig event
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
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 4"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 4"
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
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0\\s+4"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0\\s+4"
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
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim1 2 foo"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim1 2 foo"
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
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+foobar"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+foobar"
+
+	assert_fail dut_readable
+}
+
+@test "gpiowatch: with requested" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 4 pull-up
+
+	dut_run gpiowatch --banner --event=requested --chip $sim0 4
+	dut_flush
+
+	request_release_line ${GPIOSIM_CHIP_NAME[sim0]} 4
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 4"
+	assert_fail dut_readable
+}
+
+@test "gpiowatch: with released" {
+	gpiosim_chip sim0 num_lines=8
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	gpiosim_set_pull sim0 4 pull-down
+
+	dut_run gpiowatch --banner --event=released --chip $sim0 4
+	dut_flush
+
+	request_release_line ${GPIOSIM_CHIP_NAME[sim0]} 4
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 4"
+	assert_fail dut_readable
+}
+
+@test "gpiowatch: with quiet mode" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --quiet --chip $sim0 4
+	dut_flush
+
+	request_release_line ${GPIOSIM_CHIP_NAME[sim0]} 4
+	assert_fail dut_readable
+}
+
+@test "gpiowatch: with num-events" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	# redirect, as gpiowatch exits after 4 events
+	dut_run_redirect gpiowatch --num-events=4 --chip $sim0 3 4
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
+@test "gpiowatch: multiple lines" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --chip $sim0 1 2 3 4 5
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
+@test "gpiowatch: multiple lines by name and offset" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --chip $sim0 bar foo 3
+	dut_regex_match "Watching lines .*"
+
+	request_release_line $sim0 2
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 2\\s+bar"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 2\\s+bar"
+
+	request_release_line $sim0 1
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 1\\s+foo"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 1\\s+foo"
+
+	request_release_line $sim0 3
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 3"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 3"
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
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+bar"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+bar"
+
+	request_release_line $sim0 1
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+foo"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+foo"
+
+	request_release_line $sim1 4
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+xyz"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+xyz"
+
+	request_release_line $sim1 0
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+baz"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+baz"
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
+	output_regex_match ".*cannot find line 'nonexistent-line'"
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
+	output_regex_match ".*lines '0' and '0' are the same line"
+	num_lines_is 1
+	status_is 1
+
+	# by name
+	run_tool gpiowatch foo foo
+
+	output_regex_match ".*lines 'foo' and 'foo' are the same line"
+	num_lines_is 1
+	status_is 1
+
+	# by name and offset
+	run_tool gpiowatch --chip $sim0 1 foo
+
+	output_regex_match ".*lines '1' and 'foo' are the same line"
+	num_lines_is 1
+	status_is 1
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
+	output_regex_match ".*line 'foobar' is not unique"
+	status_is 1
+}
+
+@test "gpiowatch: with lines by offset" {
+	# not suggesting this setup makes any sense
+	# - just test that we can deal with it
+	gpiosim_chip sim0 num_lines=8 line_name=1:6 line_name=6:1
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --chip $sim0 1
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
+@test "gpiowatch: with lines strictly by name" {
+	# not suggesting this setup makes any sense
+	# - just test that we can deal with it
+	gpiosim_chip sim0 num_lines=8 line_name=1:6 line_name=6:1
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --by-name --chip $sim0 1
+	dut_flush
+
+	request_release_line $sim0 6
+	dut_regex_match "[0-9]+\.[0-9]+\\s+requested\\s+$sim0 6 1"
+	dut_regex_match "[0-9]+\.[0-9]+\\s+released\\s+$sim0 6 1"
+
+	request_release_line $sim0 1
+	assert_fail dut_readable
+}
+
+@test "gpiowatch: with no arguments" {
+	run_tool gpiowatch
+
+	output_regex_match ".*at least one GPIO line must be specified"
+	status_is 1
+}
+
+@test "gpiowatch: with no line specified" {
+	gpiosim_chip sim0 num_lines=8
+
+	run_tool gpiowatch --chip ${GPIOSIM_CHIP_NAME[sim0]}
+
+	output_regex_match ".*at least one GPIO line must be specified"
+	status_is 1
+}
+
+@test "gpiowatch: with offset out of range" {
+	gpiosim_chip sim0 num_lines=4
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpiowatch --chip $sim0 5
+
+	output_regex_match ".*offset 5 is out of range on chip '$sim0'"
+	status_is 1
+}
+
+@test "gpiowatch: with custom format (event type + offset)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --event=requested "--format=%e %o" -c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_read
+	output_is "1 4"
+}
+
+@test "gpiowatch: with custom format (event type + offset joined)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --event=requested "--format=%e%o" -c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_read
+	output_is "14"
+}
+
+@test "gpiowatch: with custom format (event, chip and line)" {
+	gpiosim_chip sim0 num_lines=8 line_name=4:baz
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --event=released \
+		"--format=%e %o %E %c %l" -c $sim0 baz
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_regex_match "2 4 released $sim0 baz"
+}
+
+@test "gpiowatch: with custom format (seconds timestamp)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --event=requested "--format=%e %o %S" \
+		-c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_regex_match "1 4 [0-9]+\\.[0-9]+"
+}
+
+@test "gpiowatch: with custom format (UTC timestamp)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --event=released \
+		"--format=%U %e %o" -c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_regex_match \
+"[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]T[0-2][0-9]:[0-5][0-9]:[0-5][0-9]\\.[0-9]+Z 2 4"
+}
+
+@test "gpiowatch: with custom format (localtime timestamp)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --event=released \
+		"--format=%L %e %o" -c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_regex_match \
+"[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]T[0-2][0-9]:[0-5][0-9]:[0-5][0-9]\\.[0-9]+ 2 4"
+}
+
+@test "gpiowatch: with custom format (double percent sign)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --event=requested "--format=start%%end" \
+		-c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_read
+	output_is "start%end"
+}
+
+@test "gpiowatch: with custom format (double percent sign + event type specifier)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --event=requested "--format=%%e" -c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_read
+	output_is "%e"
+}
+
+@test "gpiowatch: with custom format (single percent sign)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --event=requested "--format=%" -c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_read
+	output_is "%"
+}
+
+@test "gpiowatch: with custom format (single percent sign between other characters)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --event=requested "--format=foo % bar" -c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_read
+	output_is "foo % bar"
+}
+
+@test "gpiowatch: with custom format (unknown specifier)" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiowatch --banner --event=requested "--format=%x" -c $sim0 4
+	dut_flush
+
+	request_release_line $sim0 4
+	dut_read
+	output_is "%x"
+}
-- 
2.38.0

