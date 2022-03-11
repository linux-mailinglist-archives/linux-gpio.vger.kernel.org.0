Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75DA64D5C8D
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Mar 2022 08:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238234AbiCKHlo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Mar 2022 02:41:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236037AbiCKHln (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Mar 2022 02:41:43 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F39B1B756A
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 23:40:41 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id w4so7005906ply.13
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 23:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z9HrZB9d8DBx3JHJSDjYyzB0UyItqzrVtl88HGduKhw=;
        b=m+8yyRbVZmZqTz+ZUHd6y4ilxAPzptRVVedz3PPVGUXdSMH3N6aagBE0Fc5l1cp3Tv
         jhbPn13w8gHMjMZkBX/DAezN4ojJu9Spt7B3AZR30ot66RGYuaYksqa7oQdKxsJ6JdIc
         wuPwpUwwjMZ9Qhaz8exyE5nN9s7/TDauGZndBiZW21RaMsADZgE7eITytK8KZOGKYQ8n
         3JAnzTB+a/2jaJNXQeh9ZXKnhKOCdTz8pDPwAVw6Yu37o+v9PiV9ey05LsvH0ilb7iZV
         zRnpmbDcjSvrEFZU7J6RGImqGw7TBer0YSPH7/ZYxEMn0u2/umslDX9f83TRvb3fX2v3
         rbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z9HrZB9d8DBx3JHJSDjYyzB0UyItqzrVtl88HGduKhw=;
        b=vYq3Ew4llYCKYJUNd4gOnZSPFBnbsBt5hYD3SrD9juZUIv8m87Y82mXx7zu1xoZO51
         77jBw9Hn8UTNlubNB6hpQiLOlFksQfgLox4cA6jf+O2sO1CI/nDK7qCVRbWy7PJRSj++
         2U3ynpTj5bFggR3SIqkpu/j63y4GqQhs75Cw/etODvHp8A3G12iPym/CYYhGjYM2gH2z
         fLU0WiPllK8XjOJ0eyhQthTQpnLHtEHlQAoPTFTdTb4e+HoHr4gH7yE2aNcMwRr1UUeC
         jSMGFfwwdxJA2Ve0arSvAL8fag78OlSs8GPssMDfgsh62F5dfd4qnNTOTdoYVMLCpI7N
         r1Uw==
X-Gm-Message-State: AOAM530mGOA6UuenE3h3f17Q8vZNZu9DO3OyN+7QMQrM6BMD/ZcqDvgF
        6lmw3yT9YI1O3lzHJ+5Mny9p9jKncCnXTg==
X-Google-Smtp-Source: ABdhPJy+8yYTCXUSXno/kLF5OC2E3XGk9ehoHUwV5u6/qOBrAIaqT93W6HRltm8pFaptZBCvIdvVEQ==
X-Received: by 2002:a17:902:6903:b0:151:6781:9397 with SMTP id j3-20020a170902690300b0015167819397mr9390387plk.137.1646984440604;
        Thu, 10 Mar 2022 23:40:40 -0800 (PST)
Received: from sol.home.arpa (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id m11-20020a17090a3f8b00b001bc299e0aefsm11973981pjc.56.2022.03.10.23.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 23:40:40 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 3/6] line-config: rename off to idx
Date:   Fri, 11 Mar 2022 15:39:23 +0800
Message-Id: <20220311073926.78636-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311073926.78636-1-warthog618@gmail.com>
References: <20220311073926.78636-1-warthog618@gmail.com>
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

The off variable in set_kernel_attr_mask actually refers to an index
into a bit mask, not a line offset, so rename it to idx to avoid any
confusion.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 lib/line-config.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/line-config.c b/lib/line-config.c
index f21e1c4..31fc1b3 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -1034,7 +1034,7 @@ static void set_kernel_attr_mask(uint64_t *out, const uint64_t *in,
 {
 	struct override_config *override;
 	size_t i, j;
-	int off;
+	int idx;
 
 	gpiod_line_mask_zero(out);
 
@@ -1045,9 +1045,9 @@ static void set_kernel_attr_mask(uint64_t *out, const uint64_t *in,
 		    !gpiod_line_mask_test_bit(in, i))
 			continue;
 
-		for (j = 0, off = -1; j < num_lines; j++) {
+		for (j = 0, idx = -1; j < num_lines; j++) {
 			if (offsets[j] == override->offset) {
-				off = j;
+				idx = j;
 				break;
 			}
 		}
@@ -1056,10 +1056,10 @@ static void set_kernel_attr_mask(uint64_t *out, const uint64_t *in,
 		 * Overridden offsets that are not in the list of offsets to
 		 * request (or already requested) are silently ignored.
 		 */
-		if (off < 0)
+		if (idx < 0)
 			continue;
 
-		gpiod_line_mask_set_bit(out, off);
+		gpiod_line_mask_set_bit(out, idx);
 	}
 }
 
-- 
2.35.1

