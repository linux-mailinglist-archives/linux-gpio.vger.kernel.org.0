Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 459EF6BAAD7
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Mar 2023 09:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbjCOIfF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Mar 2023 04:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbjCOIfE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2023 04:35:04 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD42193C8
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 01:35:02 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id bi20so2070237wmb.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 01:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678869301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a3SCWw7W3l4vhawK/FCucZgOumVK6W00MgYt5iADk0Q=;
        b=PyGfgCguiFQe70l3svjqh6w0M5VJVPVMMTxPQnqDPg1Psl1BAvYHi/Xho3y/8KI4qY
         QljcvvSR3HXWp5JWcgc4cNCA9uFvQCNibeilrouCDl7KWwd3YGOje5iRxiKGRal/EjyA
         Rc/aCtpuJ4Cm3NVcjgShRcjcyeFXGuNOkskJGkOnAeGAMvRMH3d1BlBwElr01iydvE/g
         21FVxeAAVZwIBWqqMZiL4g8mlv9oWd6mi/w87CmfNCrWgoybDdYHmV2zfVJNZYavpMKs
         Bl9m69QGlPmRpZtIjwZNJjm0cgEpnHpCCIMppCXCZo6CKcw7YkPhSEwBMlwl5b32T5hN
         GX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678869301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3SCWw7W3l4vhawK/FCucZgOumVK6W00MgYt5iADk0Q=;
        b=g+5Sm/Cegc5npEE5jgpQQH8xuc0Y7jufR0ep4vZ8ZLdVORmF8t1SqiUsevWV+Qi2EP
         ZSZFmOs+ug7bOQs0iRNZrU6bPifAml+GXjd3nYu8znQLC30bWWgGKgqAArCIjeg5oZ1R
         75LPJsV04vLcgue50qgAjvbAlPFJ6qqh0vgd5Sh7L//BMzJRkc3yL0OahYzauyss3q8E
         gjZ0IzsXo3G0U7t3f6lSHoVd5RCntkPHzs9NVHA8mb1hEXB4H9H9wvXSP/gKhxCPh109
         a2E9v9vnwlnxoyoNKiwmrC8DGOi0AQSr1VQIz3lSgCEND5eLF1IcEF8U0DbtcbYYqm5g
         j6Sw==
X-Gm-Message-State: AO0yUKX8PKV/fijWAFphdEVXpzNyK6Sk3hhVwrFRWu0k55QEqzVGb1fQ
        zIcH2iqY7pS56Q5cjA89kzTgSg==
X-Google-Smtp-Source: AK7set82rSovb7+Rg5Zvyp9MlA4iM6uIxVJERe5RkED98hlv/w6P+gLV0aiaYcAtW0/94vFySp+meA==
X-Received: by 2002:a05:600c:4f4e:b0:3eb:3945:d406 with SMTP id m14-20020a05600c4f4e00b003eb3945d406mr16976236wmq.16.1678869301056;
        Wed, 15 Mar 2023 01:35:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:dc34:6420:c408:f64e])
        by smtp.gmail.com with ESMTPSA id l3-20020a1ced03000000b003ed29f5616dsm1094588wmh.4.2023.03.15.01.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 01:35:00 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Wes Tarro <wes.tarro@azuresummit.com>
Subject: [libgpiod][PATCH] tools: gpiomon: fix setting event clock type
Date:   Wed, 15 Mar 2023 09:34:56 +0100
Message-Id: <20230315083456.27590-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Fix an inverted logic bug when parsing event clock type in gpiomon.

Fixes: 8ffb6489286f ("tools: line name focussed rework")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reported-by: Wes Tarro <wes.tarro@azuresummit.com>
---
 tools/gpiomon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index ec177df..c2684c2 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -99,7 +99,7 @@ static int parse_event_clock_or_die(const char *option)
 {
 	if (strcmp(option, "realtime") == 0)
 		return GPIOD_LINE_CLOCK_REALTIME;
-	if (strcmp(option, "hte") != 0)
+	if (strcmp(option, "hte") == 0)
 		return GPIOD_LINE_CLOCK_HTE;
 	if (strcmp(option, "monotonic") != 0)
 		die("invalid event clock: %s", option);
-- 
2.37.2

