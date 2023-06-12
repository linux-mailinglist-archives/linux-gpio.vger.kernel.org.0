Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5247D72B58A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 04:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbjFLC5W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Jun 2023 22:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjFLC5W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Jun 2023 22:57:22 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA76DF0
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jun 2023 19:57:20 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b3be39e666so5908365ad.0
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jun 2023 19:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686538640; x=1689130640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VR1ZmpifYI1e2kNcIPJJy794FXhX0WV4R3R8B/139RM=;
        b=lvRM06Zac0m6JqEiV7ndcd5pvJsK3r+HjAjqQHaooxq7+AdDFNmhOSwBbpH/2jQM21
         G3VnKPmYr9Yy3KleRpsArr0Yp1EpP4SYH2/rqLZnBY3hlLDmvWCPPGY+P2YDgaEVQJx/
         UJtiSMwIyo9FrqXEVAGzsFKTPKz3xafVMbiivFAmgIYK5s/yJNktK8qeeDZVoAUonYyD
         t71RmWj6qbeMrojIkq+mEIBywrSO+cO/lEpakd/HgEx/a3QsbK/rZlRLmuicdekkmehl
         G+aJ9fZ4pFh+FAKrGiumBeqIDXcpVJGxU5EfChvQ04DLb0ncxAfrKFkV4AbZFX1VIZyW
         dPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686538640; x=1689130640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VR1ZmpifYI1e2kNcIPJJy794FXhX0WV4R3R8B/139RM=;
        b=GGLcofZAVNtbaUYLhbu+0cR4ztXnpqZeq5pr3jifxmmyC0s9ox2caUP9ecZSdWkzBR
         rpSXcayYzpXgHVV/JOMtobttXmDiEgVxO2a0W3sgzoYZ/pIouLyZ5TEmztR+o7iSGzGD
         5X+C0dei5dSoHSDQEVNRYYytv4FthEaH6yO5++9scHjL5FCVbt3CmCORqdvvJ4HNPJtK
         5NStiIZ8N8NmB0ahn9mxO/T7QhXFqWi5itHeLiO00M/0pLd4SjdRdrfYuhI0wfjM0Aav
         wz99Nm/zItoMSiUhqLWZucuxbJBJ4IPkhDVBtXgzvYCNOcxeE+mMpLH8EZnRjXML1mE7
         IbOA==
X-Gm-Message-State: AC+VfDzvMozgWKSNksFfVWwznYIx4Z6eqVXQVbj94jCJQK/7fuVXVKkz
        Li1xH5141r1uvpq67hW2A0CSPCjXgOg=
X-Google-Smtp-Source: ACHHUZ5uo/xSmJwpedR2Z/XfZ0qViH+F3A3JickVyiKY2zAcioU4h+LEEAzGSJ8z7UqicQYPx/5v/Q==
X-Received: by 2002:a17:902:f688:b0:1ad:d542:6e14 with SMTP id l8-20020a170902f68800b001add5426e14mr6144185plg.12.1686538640016;
        Sun, 11 Jun 2023 19:57:20 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id jm18-20020a17090304d200b001a1d553de0fsm6980992plb.271.2023.06.11.19.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 19:57:19 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 1/3] tools: tests: add tests for idle-timeout and debounce period.
Date:   Mon, 12 Jun 2023 10:56:40 +0800
Message-Id: <20230612025642.11554-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612025642.11554-1-warthog618@gmail.com>
References: <20230612025642.11554-1-warthog618@gmail.com>
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

There are no tests for the --debounce-period for gpiomon, or the new
idle-timeout option for gpiomon and gpionotify, so add some.

In both cases the focus of the test is not the period itself, which is
problematic to test reliably, but that the options are supported and
have the otherwise anticipated effects.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio-tools-test.bats | 79 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index 929c35a..a1100ec 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -2083,6 +2083,36 @@ request_release_line() {
 	num_lines_is 4
 }
 
+@test "gpiomon: with debounce-period" {
+	gpiosim_chip sim0 num_lines=4 line_name=1:foo line_name=2:bar
+	gpiosim_chip sim1 num_lines=8 line_name=3:baz line_name=4:xyz
+
+	dut_run gpiomon --banner --debounce-period 123us foo baz
+
+	run_tool gpioinfo
+
+	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
+	output_regex_match \
+"\\s+line\\s+1:\\s+\"foo\"\\s+input edges=both debounce-period=123us"
+	output_regex_match \
+"\\s+line\\s+3:\\s+\"baz\"\\s+input edges=both debounce-period=123us"
+	status_is 0
+}
+
+@test "gpiomon: with idle-timeout" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	# redirect, as gpiomon exits
+	dut_run_redirect gpiomon --idle-timeout 10ms --chip $sim0 4
+
+	dut_wait
+	status_is 0
+	dut_read_redirect
+	num_lines_is 0
+}
+
 @test "gpiomon: multiple lines" {
 	gpiosim_chip sim0 num_lines=8
 
@@ -2299,6 +2329,28 @@ request_release_line() {
 	status_is 1
 }
 
+@test "gpiomon: with invalid debounce-period" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpiomon --debounce-period bad -c $sim0 0 1
+
+	output_regex_match ".*invalid period: bad"
+	status_is 1
+}
+
+@test "gpiomon: with invalid idle-timeout" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpiomon --idle-timeout bad -c $sim0 0 1
+
+	output_regex_match ".*invalid period: bad"
+	status_is 1
+}
+
 @test "gpiomon: with custom format (event type + offset)" {
 	gpiosim_chip sim0 num_lines=8
 
@@ -2603,6 +2655,22 @@ request_release_line() {
 	num_lines_is 4
 }
 
+@test "gpionotify: with idle-timeout" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	# redirect, as gpionotify exits
+	dut_run_redirect gpionotify --idle-timeout 10ms --chip $sim0 3 4
+
+
+	dut_wait
+	status_is 0
+	dut_read_redirect
+
+	num_lines_is 0
+}
+
 @test "gpionotify: multiple lines" {
 	gpiosim_chip sim0 num_lines=8
 
@@ -2813,6 +2881,17 @@ request_release_line() {
 	status_is 1
 }
 
+@test "gpionotify: with invalid idle-timeout" {
+	gpiosim_chip sim0 num_lines=8
+
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	run_tool gpionotify --idle-timeout bad -c $sim0 0 1
+
+	output_regex_match ".*invalid period: bad"
+	status_is 1
+}
+
 @test "gpionotify: with custom format (event type + offset)" {
 	gpiosim_chip sim0 num_lines=8
 
-- 
2.40.1

