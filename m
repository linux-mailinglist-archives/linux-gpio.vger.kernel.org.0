Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6E7D48C84
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbfFQSmt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:42:49 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:35907 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728951AbfFQSmX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:42:23 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MZCSt-1i7Pqf2Uvx-00V8jn; Mon, 17 Jun 2019 20:42:04 +0200
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
Subject: [PATCH 23/30] drivers: gpio: ep93xx: use postcore_platform_driver()
Date:   Mon, 17 Jun 2019 20:41:04 +0200
Message-Id: <1560796871-18560-23-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:WOHD6z9asr3ikN7lL1ee98rfa+4yx4hBYLHbF+efX3j4M5LLkvR
 sDVXUFmCtykyFiGPmYDnEKUAY8QshybPv6k5kxMpVGYxvCguQBbmzLBJCna07ckyJl6RSZM
 NeNjhxyFIK+1Vik1jGS9+TF5Vplnn/ft6QRXrV6tgGnHhCcEF0gmP1izCgKW2Qgbqh4qnxR
 heNHTgcWFM3MT6KFvJhkQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2xDZlBi8Df8=:A0N9iN1j1VFuwuzLFBQzIs
 2OyhIK9xxJwdIJsd0YEMKwvNpWuQf7jlCkhZLHaEMmsJtUvGOB0N9QivzjRiGFHwA2BJGRQi9
 iqTuYcWTYyrAkQF5iTVWxa0IWCQ3bi9qp4WmnQj3N+Gnrd+7n316xGp8pT856Wzq0VxEnuwox
 vHISWCC8YbDhLxDiAj0S8J+EbeYYnel3CPLOG6IAF0wfZK/qUYiUdc6+1Z0LalYiwU8B1TTsg
 u1T/p5Er5TfNWQ4qqJua2N1mK5K4Q2/sKelBadu1AfxzHc8JqXqLjK5TlexHgFod9ANaDkeKC
 3Dviu6iSNhMmzVstVoGK3aK/kTOfePnVgRFQRjgwO9SbqpVygrRDtqVZgBRcV2muBHvx1ckFH
 ieZtNcQPvQQJSljh4/KlgGMGxneQS22OasLwtbJnDLYnY5F/eBXYinG/BSvlUEZiOouIwMKcT
 BQmCXOjhBlBdLFMI4+3m6P8f8TKSZRJu3YBoFlFTFgDnLbILLs+YHhlHROMBS17/EKOOZ3375
 tW8xci8v/8TdcIlPw+EbqERV8WFNhuuty36kyTICLxPcfVdhS5oA1QY3h/yIwLJcAd8SIxmqT
 3qtxuaDPUnADbQT70J0e2VgG4VUpRvz+/UxnyfuRcgy3AKIevNkiYXU7+TOygqZ7jX12UKPR6
 bhB0mggBEBsftzQvrVmQuSEp12TLSYleMm4NL+4HvZ6tGNe6V6Y2Ytnh+WGbdmxZfvxYpaCNi
 Yn0nEIgyoqyoVm7zBXjR+qc+S070MS0f6qjUJg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
postcore_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-ep93xx.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 71728d6..d4dfb50 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -429,12 +429,7 @@ static int ep93xx_gpio_probe(struct platform_device *pdev)
 	},
 	.probe		= ep93xx_gpio_probe,
 };
-
-static int __init ep93xx_gpio_init(void)
-{
-	return platform_driver_register(&ep93xx_gpio_driver);
-}
-postcore_initcall(ep93xx_gpio_init);
+postcore_platform_driver(ep93xx_gpio_driver);
 
 MODULE_AUTHOR("Ryan Mallon <ryan@bluewatersys.com> "
 		"H Hartley Sweeten <hsweeten@visionengravers.com>");
-- 
1.9.1

