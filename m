Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46CD54FB3C9
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Apr 2022 08:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244961AbiDKGic (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Apr 2022 02:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244109AbiDKGib (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Apr 2022 02:38:31 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4728B21268
        for <linux-gpio@vger.kernel.org>; Sun, 10 Apr 2022 23:36:17 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id x33so18349354lfu.1
        for <linux-gpio@vger.kernel.org>; Sun, 10 Apr 2022 23:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=emlid.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iRcYxJVdDiiICHxHO2f45y7+4rlasd/ctsihDzRoQKU=;
        b=BpM+uhn+mmt2R1nQH6oS5XFfR4Lj8J1o+xE07ONTJPEvD+TWtrex7qmw+Ws8ZDJKqj
         XhnIrN0znHoacNC9scPWxael80iJfPG4fvtUIDBn+QkTGlSJmcJBjDhD1FUBK/pETfD7
         DPKRYn1l72t67LCTh0bxnOOkIjee8QntF15+86TyhP8kBAa0UDw+BkqyaMcHEWdzjaqG
         9Jw1DmM+jOniZKquWKci5tT7lC4PeAQr+KNMf6OEMSbu8yzaz5yBj4/h1ciJoJ8m0j3M
         EdEmiQut3AE2oDd0S3jJ+HpwfEA8uKrkw8/B8DKxReOH3JNmK2vNLDWtzy97glvHQ8mX
         Am/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iRcYxJVdDiiICHxHO2f45y7+4rlasd/ctsihDzRoQKU=;
        b=IuWTvWOQzLb9YqTfLMYfQ1cuEnZI2ly8vJK9lGjmRclphU5t6nK9ezVHz93dDAtnl2
         uNYNrOas7grSx78YxFuSZw9FcJpqVjutz+O6S4GKt/uK+sFFGowR9wo13hgkzGS0co2y
         /tSTfkD3F3mWPxGY4nHkWY10HI+5vure9z+1UhKB7y99BblZQwTU1M2hJ1tEk/Q/ikAO
         Ud+56Q1PLdFT7ApkmAqxt2IzY5ck2sKXWicJl8ghGQKbKtXpGKQA/CVUhxa0fxcZGqeI
         bfg4hC6deQJTO7sxxyG+aQeD7s9zTzOvp4Cah76S+ZSMkQWA7Wdne2O9cUOfJyQgiTwG
         chng==
X-Gm-Message-State: AOAM530dpPVwrt6Ofn5ZuQxeUOAgUZJtqDB2vEC0ATd0p9rfY+aXKuh9
        UhgUjX3+T7hK8vjer8hGkguvDL5R8i0ftSZY
X-Google-Smtp-Source: ABdhPJxjyvTdAHPbrmGoXOI8yTgOwtl7h3M7ZrlEuC8Go1T3gG8NFMg7Im+eaJwh31CJQ6s8ussEHw==
X-Received: by 2002:ac2:514c:0:b0:46b:8997:9ad6 with SMTP id q12-20020ac2514c000000b0046b89979ad6mr9554456lfd.620.1649658975548;
        Sun, 10 Apr 2022 23:36:15 -0700 (PDT)
Received: from emlid-ThinkPad-E480.localdomain ([85.143.205.202])
        by smtp.gmail.com with ESMTPSA id m9-20020ac24249000000b004471fa09a95sm3232177lfl.265.2022.04.10.23.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 23:36:15 -0700 (PDT)
From:   Andrei Lalaev <andrei.lalaev@emlid.com>
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrei Lalaev <andrei.lalaev@emlid.com>
Subject: [PATCH] gpiolib: of: fix bounds check for valid mask
Date:   Mon, 11 Apr 2022 09:33:25 +0300
Message-Id: <20220411063324.98542-1-andrei.lalaev@emlid.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use "greater" instead of "greater or equal" when performs bounds check
to make sure that GPIOS are in available range. Previous implementation
skipped ranges which include last GPIO in range.

Signed-off-by: Andrei Lalaev <andrei.lalaev@emlid.com>
---
 drivers/gpio/gpiolib-of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index ae1ce319cd78..7e5e51d49d09 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -910,7 +910,7 @@ static void of_gpiochip_init_valid_mask(struct gpio_chip *chip)
 					   i, &start);
 		of_property_read_u32_index(np, "gpio-reserved-ranges",
 					   i + 1, &count);
-		if (start >= chip->ngpio || start + count >= chip->ngpio)
+		if (start >= chip->ngpio || start + count > chip->ngpio)
 			continue;
 
 		bitmap_clear(chip->valid_mask, start, count);
-- 
2.25.1

