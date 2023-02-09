Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D51FD6910C0
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Feb 2023 19:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjBISxT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Feb 2023 13:53:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjBISxS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Feb 2023 13:53:18 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87175EF98
        for <linux-gpio@vger.kernel.org>; Thu,  9 Feb 2023 10:53:16 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id d14so2768998wrr.9
        for <linux-gpio@vger.kernel.org>; Thu, 09 Feb 2023 10:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ReI+++Oh1/nFZM8g8EyZOb37jj6uXSWHr9rcjVyhtGg=;
        b=qq4ZAHWDO/zyfUCe6yxKJ6VBwIbB8+c2kp7ucAz1Or2Wj7cmAInt3YgUCMprCYUVZm
         IAznJdLPagnwRSAub5bc01wwlUzw4n10nB6p1Ud3rFyfc53JC9tFhMfNiuXuE/Gg45yP
         f+AXciHOU2AUS51mc7CA7d95E4Mg1W4gmZO6eD/Z6PTAR659hDI3J1su48jUBkhnwJd8
         K4i7kr+R/5yk8Wi2SKnikUrrqwkLuNO7jeFyyZino8WITNzvbXOjhBPV+yk25DzZdflR
         V1/h7nyewDLwVrXkvQrGtCm20egBs8+W1quoPwD1PiPV91gFOjZP4dfLVR38PdCzjEfJ
         w5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReI+++Oh1/nFZM8g8EyZOb37jj6uXSWHr9rcjVyhtGg=;
        b=M/opQ4MkPHpRZ3QedkjGTRi2I8HmYEcB6FIKP0Wvl5KamyCuf45PogquwC5OH/uQMT
         qaddnXa6KG53P60mV2+6dxvwsNUISwLOkGdJBUowUyi1D8f/9keZ2UnopnZLcX0zjHkJ
         zWD7ujXyxZdGKSESVEdJJSYg6L8Hwuaf048RHguySK5mgf523gsSVv+L0z0h8tp70okR
         hbqdLyEicFY7qnutj5+vHirE05wJeReRu23Nbh0DRU3Aj4AbearnhZHbw1VEEeS3p9NL
         GVnI2dVGeFqR8DZKS7b9OzilkLTGudQwbhDxbpZlsA/ro5Pdi2AjqgqPPy8CgJvjPAGX
         TIew==
X-Gm-Message-State: AO0yUKVY8QfHweRYG9Bb3oLLIRBf4rNK6aMJapER8e/bfhvvm1OmLpGz
        wp6BM+q4iixTTCSECgaUBhJT7h7Hz2Z8P+Dc
X-Google-Smtp-Source: AK7set8FoKW9tEYoH47PSvFjqSlQWa7a6qHpuUCAYnn4Z7rm/CDkF29DXxEFTMEGECEPy3RSdRciHw==
X-Received: by 2002:a5d:6684:0:b0:2bd:e8c2:c9bc with SMTP id l4-20020a5d6684000000b002bde8c2c9bcmr12289473wru.42.1675968795144;
        Thu, 09 Feb 2023 10:53:15 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7e6e:bfb6:975d:225b])
        by smtp.gmail.com with ESMTPSA id a4-20020adfeec4000000b002bfc0558ecdsm1772169wrp.113.2023.02.09.10.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:53:13 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] tools: use 'unsigned int' instead of 'uint'
Date:   Thu,  9 Feb 2023 19:53:12 +0100
Message-Id: <20230209185312.635613-1-brgl@bgdev.pl>
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

uint is an old compatibility name that GCC still provides but clang
doesn't. Use unsigned int instead.

Fixes: 8ffb6489286f ("tools: line name focussed rework")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/tools-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/tools-common.h b/tools/tools-common.h
index efbeeb8..5d39170 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -43,7 +43,7 @@ struct resolved_line {
 	int chip_num;
 
 	/* offset of line on chip */
-	uint offset;
+	unsigned int offset;
 
 	/* line value for gpioget/set */
 	int value;
-- 
2.37.2

