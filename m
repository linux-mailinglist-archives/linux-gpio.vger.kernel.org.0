Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE06548CCE
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725764AbfFQSli (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:41:38 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:60101 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbfFQSli (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:41:38 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MAORp-1hn8v92BXH-00Bvr3; Mon, 17 Jun 2019 20:41:24 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     thloh@altera.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, andriy.shevchenko@linux.intel.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, grygorii.strashko@ti.com,
        ssantosh@kernel.org, khilman@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 05/30] drivers: gpio: lynxpoint: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:40:46 +0200
Message-Id: <1560796871-18560-5-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:/j4c3FyWT7iNyjBM83hS+oirnyGOSBHrDy4mSedO3eOWbp294SX
 A+Ed8X11Ylq2mC41dad6tu9XDE3eB5sIetcv6lTw7L2rRsguhB5Jv0gBiufWxHdLJnH470I
 Jbxi+YCChbbgscoDecbvtrwBc3W9XqAiePBIZ6VDHC5IJbH6bwas7iwrFDGTyzN0/G5FpUk
 iCinY4J8YA07zTMcIQzpg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:I69TDSvAHEk=:354x7iU3r/TnN7yyD7caOR
 mtV7+NWSZ7xIG6yHHD7tPPe8iOz/YzBVTvve28kblCC+rX63X8HuAc5LMzsF9O7MOmLdSo30j
 YZYISl3GofEDNbdLqYRbUFFiv49/pw3pqaGALJdwRZ2+l7w54/OSkDXFIPl3I02lUDmIzzMcB
 S4r7og5ohxiOuFoQfNuB307tS3Eis6r5zA3sjx0tmyBUIPqkG4nl0IMklORHolIsCIzJzdi6L
 i+Q9R5WRZpqcK7h4O/UtBtZe36mw54h5QBgkkGVnctk1G/JP740CwQOfmY7a1jup80EikYmgu
 F1nmXuwiabkAcVq2WAGmoKJdB9rNjsM133FYxz6P3fsdS+7z2WqKmM/PRwhKHZj6CEKLULvLM
 /10hl0Iz97n1N1zWWGCKiF2vkLbtZExF8rxIqqlhvcki40haTE8u0ICCvV9GXgjT8wCfeSLCP
 1zNfMNKOPiML6rJFU6dSj/gpg2bh7/xcTgviQwV1by96jtLbvfdHo3kkCwjXytiYDqAz/u3dM
 kADOAt2BLFQiM9758631Fu/ml12cXkJqfyftZYWHNwyRLSDo7tsndy5wtZ2l5Iovg1dEgtc5V
 pl8hKEHhmVg8ciQGM2xgT/6W0dmU0I5Qs98JyvpNAOLp8bAF0w3JtKNFiaeh4Z+gJJZKZeHvl
 BhICMKtCnmu2MmvEZuT+UiouopvbByt4OX8hdd+M2ISTKsaA7ORP0+WHmqW094b8E7z+tv9z9
 5TXBh76124MvoTFW6wLqAPAIZAzp1lPVLhJjLA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-lynxpoint.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
index 31b4a09..8e6b998 100644
--- a/drivers/gpio/gpio-lynxpoint.c
+++ b/drivers/gpio/gpio-lynxpoint.c
@@ -438,19 +438,7 @@ static int lp_gpio_remove(struct platform_device *pdev)
 		.acpi_match_table = ACPI_PTR(lynxpoint_gpio_acpi_match),
 	},
 };
-
-static int __init lp_gpio_init(void)
-{
-	return platform_driver_register(&lp_gpio_driver);
-}
-
-static void __exit lp_gpio_exit(void)
-{
-	platform_driver_unregister(&lp_gpio_driver);
-}
-
-subsys_initcall(lp_gpio_init);
-module_exit(lp_gpio_exit);
+subsys_platform_driver(lp_gpio_driver);
 
 MODULE_AUTHOR("Mathias Nyman (Intel)");
 MODULE_DESCRIPTION("GPIO interface for Intel Lynxpoint");
-- 
1.9.1

