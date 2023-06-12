Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E846D72B58B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 04:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233116AbjFLC5f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Jun 2023 22:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjFLC5e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Jun 2023 22:57:34 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EBFCE42
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jun 2023 19:57:33 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b24cd75989so19532405ad.1
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jun 2023 19:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686538653; x=1689130653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNJQLbLjUoBG6g4pKvrv2qTKtL+SnSDIeMUWzTK01R0=;
        b=aix/vpL9Cc3QspnGg6FztGr+wpJtBWG1iLO7Td9zHZjqWGBC/g2hem203+lgArLEhC
         yoLE0EzinnJBAu8an1JjtVWW9GQqP5fsd64PNPRJYJreTEgv4qba5sZ2XrXowZuAw/wt
         cLlqS5vn6TRVDFr0CnlperGBy59TEsiwhSPvyBueFCFvVZqkXFqTVCASbx7aAmrPUdka
         hsnaPFmfenfAbT489pHgYlK7L/5ObNKExXfsNTFQJVJWsBPsvDiW1XYuBt7APO5a1nN4
         4zx0FYK/c1iFBaRrED0kQdy06cyiq4sYcDm6CWUfR/3VxhxGNHMy3Sw1qZxLwCGE4raf
         h8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686538653; x=1689130653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNJQLbLjUoBG6g4pKvrv2qTKtL+SnSDIeMUWzTK01R0=;
        b=btNi04oX7jfp2uUzD8dEaYU+l4g7+8ALhGT7WTrw+XFgeGvMA0pOzVZCcqwCChNf2f
         tHL7eNXVKPqRZCSaYTtuyDxPmwgonn2sBKc8YiRDBnTAeKEAG+Y7/z/k/BnimbYumRBq
         lxDUsyZ9fN2scTmBKy75xm/E3Ax0zpoe13r+9bM5jkxK4MADVyUDOnJDgp088C5OgcRt
         hARxtrb69MLpirfQpSpmojLn3Q+V0YFh6RI4YrNypiSncG5KxDWW+0TMDbLVWH0Ew3rB
         cQH/5WK+39ySSH/Wd2s2jLWgk7kZKwxX6HC0CThfjpZV0a4Cbbk5C8RZ9OyAc+HzyzcG
         sx+w==
X-Gm-Message-State: AC+VfDxNiwwOLHsEX97JReTqDToPBsXQFXAK3tyVKg6Mys/UIgeF3Ujo
        w9c8p4LLkckp+NykL/wt6kGmYI7NqJY=
X-Google-Smtp-Source: ACHHUZ7xDmTFGK1veylVFWFLTRxzwbjaSQ/GIoLKFu6sEYiX2V6NZl+EgYlADGPf5X2xr8aB96LCLg==
X-Received: by 2002:a17:903:22c6:b0:1b3:d25a:5ece with SMTP id y6-20020a17090322c600b001b3d25a5ecemr1451967plg.31.1686538652915;
        Sun, 11 Jun 2023 19:57:32 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id jm18-20020a17090304d200b001a1d553de0fsm6980992plb.271.2023.06.11.19.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 19:57:32 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 2/3] tools: tests: speed up continuous toggle test
Date:   Mon, 12 Jun 2023 10:56:41 +0800
Message-Id: <20230612025642.11554-3-warthog618@gmail.com>
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

The continuous toggle test was recently changed to poll the line to
check for toggles, and so increase test reliability.
Tighten up the test timings so the test can now also run in a
significantly shorter time.
And, as it is now faster, add an extra edge just to be sure.

Note that the test does not need to catch every edge, it only has to
check that the line is in fact toggling.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio-tools-test.bats | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index a1100ec..cc28f1b 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -148,9 +148,9 @@ gpiosim_wait_value() {
 	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
 	local PORT=$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value
 
-	for i in {1..15}; do
+	for i in {1..30}; do
 		[ "$(<$PORT)" = "$EXPECTED" ] && return
-		sleep 0.1
+		sleep 0.01
 	done
 	return 1
 }
@@ -1575,7 +1575,7 @@ request_release_line() {
 	gpiosim_set_pull sim0 4 pull-up
 	gpiosim_set_pull sim0 7 pull-up
 
-	dut_run gpioset --banner --toggle 1s foo=1 bar=0 baz=0
+	dut_run gpioset --banner --toggle 100ms foo=1 bar=0 baz=0
 
 	gpiosim_check_value sim0 1 1
 	gpiosim_check_value sim0 4 0
@@ -1589,6 +1589,10 @@ request_release_line() {
 	gpiosim_wait_value sim0 1 1
 	gpiosim_check_value sim0 4 0
 	gpiosim_check_value sim0 7 0
+
+	gpiosim_wait_value sim0 1 0
+	gpiosim_check_value sim0 4 1
+	gpiosim_check_value sim0 7 1
 }
 
 @test "gpioset: toggle (terminated)" {
-- 
2.40.1

