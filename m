Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B98F55DBCE
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236207AbiF0Nqk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jun 2022 09:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236017AbiF0Nqk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2022 09:46:40 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E31C360C0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 06:46:38 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id a15so9046315pfv.13
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 06:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bItcgwOweyHpbTdbB2yStlE3LoN6u/SIqUTXgS5X+NM=;
        b=H5/X1uWvkgaoy61/W+cveuxNnnnl0UYHyzaGXFTJFa+BJxdk9Wr2EIWWqzjAqUOUqX
         khnGdLO1Wgj0Tf2u8TUm65/EbjDVcKYVIerGmTGSRyGHZlXAI9uEvAo9786my5y6r1Pm
         E2H45Vsxa6f6SqQqYLk1vEf22BajwCQSJpF/eClq4l9TB7ovGbYAZXfr5XG8vt6Cvp8X
         3okEPD8zaLOosaDvs4IOrP6O5NfdV3nzeiixyjpSBABgQLuuNfDchtWlwAfmPx0bQ3uf
         Zf98Jqy9sgiB1vu/uX6Te6QMkkTiVsU3hfnMx0ANC5L9hcfcJ+H79Q7JLE/gNLGLoJaw
         Q55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bItcgwOweyHpbTdbB2yStlE3LoN6u/SIqUTXgS5X+NM=;
        b=QxiVnZsxYZ2XHrHHnOK1j83PRzm8ffOyhAHPnVj2dTngnDM6nEZjDCN04ILWY/dcs6
         Ppi3/WrAHDIhsNAnSTpBFu3XkxwceLsUX6NJsKOejPghbRT66nELASMcY1LgD8EM1/SE
         D7uRXlzngzVoECmvE/b1PA41ln2RP3fb771G1b9VnyfxCnesQ3pUrAKJWEqrJwOoOKQx
         4Dq8EIkzN2lZhkJej8bHOiaE0aybqpZAOpgJU0a+ugreGEyDf46wUgX6JYAm1PomHRz/
         QAMZ8ULrKJtR72dish+3/OQsbzZGsRnfJYHt41SQpgr7a2YIH6o2QDaoYYzr1X+OZVxH
         6X8A==
X-Gm-Message-State: AJIora+iumKE1HY7e16QVzb70Q1xd4kmzjN7idrdeAu9I4cO2hpuLvmb
        ycdpHFyEpTSWgnky9VlRAKJ5AVrObig=
X-Google-Smtp-Source: AGRyM1vIFK1XuRz78H3KsHJd/Bh1JdImYDuKVEeTnJzSa7g6izgzwnF/2bN62v4bSGTBhspZZneTuw==
X-Received: by 2002:a05:6a00:2355:b0:525:a0e9:4b with SMTP id j21-20020a056a00235500b00525a0e9004bmr9743967pfj.32.1656337597746;
        Mon, 27 Jun 2022 06:46:37 -0700 (PDT)
Received: from sol.home.arpa (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902bd4500b0016a565f3f34sm6783395plx.168.2022.06.27.06.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 06:46:37 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 4/4] tools: gpiowatch tests
Date:   Mon, 27 Jun 2022 21:44:47 +0800
Message-Id: <20220627134447.81927-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627134447.81927-1-warthog618@gmail.com>
References: <20220627134447.81927-1-warthog618@gmail.com>
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
 tools/gpio-tools-test.bats | 249 +++++++++++++++++++++++++++++++++++++
 1 file changed, 249 insertions(+)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index eaa814f..73fdd93 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -2069,3 +2069,252 @@ request_release_line() {
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
+	local sim0=$(gpiosim_chip_name sim0)
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
+	local sim0=$(gpiosim_chip_name sim0)
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
+@test "gpiowatch: by chip and name" {
+	gpiosim_chip sim0 num_lines=8 line_name=4:foo
+	gpiosim_chip sim1 num_lines=8 line_name=2:foo
+	local sim1=$(gpiosim_chip_name sim1)
+
+	dut_run gpiowatch --banner --chip $sim1 foo
+	dut_regex_match "Watching line .*"
+
+	request_release_line $sim1 2
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+$sim1\\s+2\\s+foo\\s+.*"
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+$sim1\\s+2\\s+foo\\s+.*"
+
+	assert_fail dut_readable
+}
+
+@test "gpiowatch: first matching named line" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar line_name=3:foobar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=2:foobar \
+				      line_name=4:xyz line_name=7:foobar
+	gpiosim_chip sim2 num_lines=16
+
+	dut_run gpiowatch --banner foobar
+	dut_regex_match "Watching line .*"
+
+	request_release_line $(gpiosim_chip_name sim0) 3
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+foobar\\s+.*"
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+foobar\\s+.*"
+
+	assert_fail dut_readable
+}
+
+@test "gpiowatch: multiple lines" {
+	gpiosim_chip sim0 num_lines=8
+	local sim0=$(gpiosim_chip_name sim0)
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
+	local sim0=$(gpiosim_chip_name sim0)
+
+	dut_run gpiowatch --banner --chip $sim0 bar foo 3
+	dut_regex_match "Watching lines .*"
+
+	request_release_line $sim0 2
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+$sim0\\s+2\\s+bar\\s+.*"
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+$sim0\\s+2\\s+bar\\s+.*"
+
+	request_release_line $sim0 1
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+$sim0\\s+1\\s+foo\\s+.*"
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+$sim0\\s+1\\s+foo\\s+.*"
+
+	request_release_line $sim0 3
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+REQUESTED\\s+$sim0\\s+3\\s+unnamed\\s+.*"
+	dut_regex_match "\\s*[0-9]+\.[0-9]+\\s+RELEASED\\s+$sim0\\s+3\\s+unnamed\\s+.*"
+
+	assert_fail dut_readable
+}
+
+@test "gpiowatch: multiple lines across multiple chips" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
+	gpiosim_chip sim1 num_lines=8 line_name=0:baz line_name=4:xyz
+	local sim0=$(gpiosim_chip_name sim0)
+	local sim1=$(gpiosim_chip_name sim1)
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
+	dut_run gpiowatch --banner --chip $(gpiosim_chip_name sim0) 4
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
+	dut_run gpiowatch --banner --chip $(gpiosim_chip_name sim0) 4
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
+	local sim0=$(gpiosim_chip_name sim0)
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
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar line_name=3:foobar
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
+	# not suggesting this setup makes sense - just test that we can deal with it
+	gpiosim_chip sim0 num_lines=8 line_name=1:42 line_name=6:13
+	local sim0=$(gpiosim_chip_name sim0)
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
+	run_tool gpiowatch --chip $(gpiosim_chip_name sim0)
+
+	status_is 1
+	output_regex_match ".*at least one GPIO line must be specified"
+}
+
+@test "gpiowatch: with offset out of range" {
+	gpiosim_chip sim0 num_lines=4
+	local sim0=$(gpiosim_chip_name sim0)
+
+	run_tool gpiowatch --chip $sim0 5
+
+	status_is 1
+	output_regex_match ".*offset 5 is out of range on chip $sim0"
+}
-- 
2.36.1

