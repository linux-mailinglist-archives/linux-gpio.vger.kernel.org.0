Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E55E5A6EA3
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Aug 2022 22:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbiH3Upd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Aug 2022 16:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiH3Upd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Aug 2022 16:45:33 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F1E4D143
        for <linux-gpio@vger.kernel.org>; Tue, 30 Aug 2022 13:45:32 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id x10so12610346ljq.4
        for <linux-gpio@vger.kernel.org>; Tue, 30 Aug 2022 13:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=2mQItsya8Ub3MWvnmEA8OVjIz25Z0s6J5LlQpwiJ2qg=;
        b=WgF4McWAq8iOxdyIYojNPVjvXqPLnki7zlCVXxHGTmmcCnXfkr8q6ec1vBrW7EfgJk
         bSHqAbBEanXZBx9MwIN1bfoX7zq04SKsmV7Rx4q/Gig6JM9ZGOZJsXZmClcYSFCS2OM+
         AnHzdy58k2shWLHPsdn9pWzDqBRz2Oc2yLbR5ZO+TaiMWB8z4CKhMzJgK23UsDC7ZOU5
         i29P0HcYwZIhRmxBRpSuSgm9rw9t/jKqJFlZ/eMsilbBw1UAYbgMW1X3TivpLNTbgO79
         3td0PDzG58Pn+5mI3gyG3OwgnQVjidfwkG/g97eDIFU60Ee8+p8orBtntwMVk5MpXwk7
         Wt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=2mQItsya8Ub3MWvnmEA8OVjIz25Z0s6J5LlQpwiJ2qg=;
        b=ZUhoSItPVb4FIAVd/Zt+deneZzNKLcB/h3K4QOYlqzXCEtplQmehuMHMUg+GqCjHOj
         xynoJvTPZzQAyTOJArTqeC5HPRzhBBvuDK1FaVXhXNw6eQgwPQKAIQc6m1T73PDC4e6D
         PlqZdQp96+eTpn2hv1kNpGmRg6i3gPdXXSxuEb7L0oq9bGYzQxFJtVTxo5Pzxoz4W38r
         gOGr92XlIv/PKtxToAVbDbjCnwykJKGkNTvISk4nRaJh69HgCGGj810EbfRmeVrOMarL
         FJQYk56zPjGlmGlRJQ0eVRxDABUmfPLH5/7CfTVm/3jcZwIPFnuJuaQHiMct5y4OZOSJ
         +dTg==
X-Gm-Message-State: ACgBeo1+RKU8pEP/oZePne+FIKnBlZKvDtjpbNyhPw9ezgwD8uumeC30
        /BhT7rBiO+Ta91NxIiFggVZ7JQ==
X-Google-Smtp-Source: AA6agR7+x1YpHcrioMaf6UiS9868phUOCMrS9u5uBH8/DZj1LMqp7M8K1C50mIwowoIVHD7xkGdP6Q==
X-Received: by 2002:a05:651c:54c:b0:25f:dd42:5d06 with SMTP id q12-20020a05651c054c00b0025fdd425d06mr7986396ljp.161.1661892330571;
        Tue, 30 Aug 2022 13:45:30 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e99c5000000b00261cc67e9c2sm1921627ljj.131.2022.08.30.13.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 13:45:30 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     H Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Lukasz Majewski <lukma@denx.de>
Subject: [PATCH] ARM: ep93xx: Convert to use descriptors for GPIO LEDs
Date:   Tue, 30 Aug 2022 22:43:27 +0200
Message-Id: <20220830204327.368284-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.2
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

This converts the EP93xx to use GPIO descriptors for the
LEDs.

Cc: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Lukasz Majewski <lukma@denx.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-ep93xx/core.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-ep93xx/core.c b/arch/arm/mach-ep93xx/core.c
index 2d58e273c96d..1abd93b8a084 100644
--- a/arch/arm/mach-ep93xx/core.c
+++ b/arch/arm/mach-ep93xx/core.c
@@ -425,10 +425,8 @@ void __init ep93xx_register_spi(struct ep93xx_spi_info *info,
 static const struct gpio_led ep93xx_led_pins[] __initconst = {
 	{
 		.name	= "platform:grled",
-		.gpio	= EP93XX_GPIO_LINE_GRLED,
 	}, {
 		.name	= "platform:rdled",
-		.gpio	= EP93XX_GPIO_LINE_RDLED,
 	},
 };
 
@@ -437,6 +435,16 @@ static const struct gpio_led_platform_data ep93xx_led_data __initconst = {
 	.leds		= ep93xx_led_pins,
 };
 
+static struct gpiod_lookup_table ep93xx_leds_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		/* Use local offsets on gpiochip/port "E" */
+		GPIO_LOOKUP_IDX("E", 0, NULL, 0, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("E", 1,	NULL, 1, GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
 /*************************************************************************
  * EP93xx pwm peripheral handling
  *************************************************************************/
@@ -989,6 +997,7 @@ struct device __init *ep93xx_init_devices(void)
 	platform_device_register(&ep93xx_ohci_device);
 	platform_device_register(&ep93xx_wdt_device);
 
+	gpiod_add_lookup_table((&ep93xx_leds_gpio_table);
 	gpio_led_register_device(-1, &ep93xx_led_data);
 
 	return parent;
-- 
2.37.2

