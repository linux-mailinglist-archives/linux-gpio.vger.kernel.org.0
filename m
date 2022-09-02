Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDD15ABAA1
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Sep 2022 00:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbiIBWG2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 18:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbiIBWG1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 18:06:27 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED4FAF8FC1
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 15:06:25 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id bn9so3559457ljb.6
        for <linux-gpio@vger.kernel.org>; Fri, 02 Sep 2022 15:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=fEs1ZNTvqBOFiNaauD6/pokJy+n/Izie5bhXhLxN7MQ=;
        b=viSMpK2H7CcEgw5Jz/YZtxG+8PC2mGS7fY2gx60Me/v5sEXY+cEeoMqq7fYwBxiATf
         i/UxavUXTDHllgGHu99LcnTDx0qDSuTy4yqfys90tX9ksyH96GUSQEHucZLLl6RonaOQ
         BBAqpPPmxW39n1J5ZXMctt2EYng+7xR9GhPQmxBvsNfAyVi4ZEaekqU9h4ePKb1RJ2hx
         tOvwfd1faRP4QczHcVGty34ki6naF5CPG0GswqfdAWX0Uxbb20YmQel3gr7mEAERApCr
         eFSB05Uyyrj/9wM30QmXu67RpepGOt7BSnVzpHl9w1kXwoFVz21gmdw2vPxqlH4ES3jo
         psmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=fEs1ZNTvqBOFiNaauD6/pokJy+n/Izie5bhXhLxN7MQ=;
        b=dSGBhAT7E20SiCwMMDzSDwPYrfMQK9Zcr/c/yNETIlRhrVJn+EUFzVrexfepOQGBAQ
         pdggQgq1S+o4ggJmrpBl35FFozhDgxksZMBnyOQiYt/yU5p8mghjm793ECKGCGDnYI33
         pL0XXzGw+/VhVesX5MMRK+2e6WF8OMQE4v+NX6dB0lgrzmnvojqvoN6E6UEBExEAx6Np
         XHQ8/iLGhVQywE90GNlAC0V4NTo6fVgVHnhXWWr717HDh4wrr9kAf+19fvU+47QcGvMy
         xF+ktg7PpxtQHQWvQHAMokpgT/wrwcU9Ybs3JsV477jFCaeZfnTcpJhP//tbL2ul8vO6
         ZPRA==
X-Gm-Message-State: ACgBeo1ESRYmtvlrc3iPPaJJhbLYsb3gLzhqWMlBD/RxzuMkSp7+u22g
        pxXPHbkXFHz09hyJ0lCDoY6bcZEEQz157w==
X-Google-Smtp-Source: AA6agR6K3RP/rSl9bwKgrRo0ZS8F2c+rv+cc7Q0CaAV7NKXGEwwfVVE8EkTXyo2PKkD/94BhyHZcfA==
X-Received: by 2002:a2e:83c9:0:b0:24d:a95d:7b7a with SMTP id s9-20020a2e83c9000000b0024da95d7b7amr11487720ljh.254.1662156384324;
        Fri, 02 Sep 2022 15:06:24 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id b19-20020ac247f3000000b00492e6642937sm364152lfp.200.2022.09.02.15.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 15:06:23 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     H Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v2] ARM: ep93xx: Convert to use descriptors for GPIO LEDs
Date:   Sat,  3 Sep 2022 00:04:21 +0200
Message-Id: <20220902220421.604516-1-linus.walleij@linaro.org>
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
ChangeLog v1->v2:
- Fix syntax error (doubled left parens)
---
 arch/arm/mach-ep93xx/core.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-ep93xx/core.c b/arch/arm/mach-ep93xx/core.c
index 2d58e273c96d..318c09ee4723 100644
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
 
+	gpiod_add_lookup_table(&ep93xx_leds_gpio_table);
 	gpio_led_register_device(-1, &ep93xx_led_data);
 
 	return parent;
-- 
2.37.2

