Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14D1448CB8
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728853AbfFQSnz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:43:55 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:58803 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728766AbfFQSlu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:41:50 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MxDgs-1ia6h43Oy8-00xYak; Mon, 17 Jun 2019 20:41:34 +0200
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
Subject: [PATCH 08/30] drivers: gpio: palmas: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:40:49 +0200
Message-Id: <1560796871-18560-8-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:52SXi3L2+ORnIKsoInSeCQIdMCF5PqEvUSjZ1IUqdMXOQjJz6CK
 QFuwK7in9fJYjIHT4RIe/33222jvXueshWiZ8Ty5PzTB0cL9rtWBFW9GEUfEO7THrrvJ/wa
 R1wYvi9ClTKRtByvwAcWPr4gyEb3kRQGl2BdljXN9n+db1DZ1QGFXfMfReOYRRr273ZH2DY
 /ujckZ8//MAObPqGSHK0g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yJUB0z5Bicc=:qUUcWOSONcIQ6ODc1wyPsJ
 WrRlT9QHHkK+w0AqpLSmh3m1e6+tREInEOeJHknNVa12/TG6CmP9E8mozvWQY6yd3QEECRC8Y
 Y4rx7tcfFd5NsxIIE2x7yv4Aa48ET9GRaXMZa1cafuXhyDaoIm4r85pFHOeAYpemTB8kdOcih
 8ukpgLFvCs6IBYRUCj/8GulixCCt+6G39WaL8qUESfpLWYq9mPuR14XgEDdcFO+3EQr/+/RLg
 Goripr+/9PvgWI8OOtaouUBBDlOb7ILPBceTTWrAvPd3e6RChKNsRp+jyiKIRHjRT/29bHc+G
 Qlhm8dvTJj4m+22nBZFGXU8zx9FBth/4yPu9dejlasoAEfLhfextU9yJ5OzJoDfq9zQV26AVU
 IY4ynzMekCMuPxf2f1eie3A38WkPllRnGwV+4Nmr7BjAYx40Tkf6bkYx9YmqxLR6GsIPwmiQi
 hyOewigA+Z4g1CuCRQ7nZhXTMNkqFH/WcHC2440ycBUsrZOcgNeMLctMqMSInbpbfeZPFu/X8
 PEHTFxtnzMV3Np1KVZwQgXRGfF8Ul8J+QiZdjVi94HgsA+BeDI0ETIb5IAkoyER1fQHU8sdAl
 nchOBjfVXdrwfMetWrX/wxGeWMukc30nGGm8dsOLRfwP2dTT1jFsMT17owQyzVbEGyEs6ZqZ/
 I55uY2EdqrO2HUVzKx2bWX0me5ZRLPnCUYecFWAvZQiRY3FwSa7/QcEfxkgr9hIDxnB5RTYBn
 ClsEPOVYoL2cdIQEvHMoeQInju2Aw5va+WhMFg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-palmas.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index e8e9029..4726200 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -195,9 +195,4 @@ static int palmas_gpio_probe(struct platform_device *pdev)
 	.driver.of_match_table = of_palmas_gpio_match,
 	.probe		= palmas_gpio_probe,
 };
-
-static int __init palmas_gpio_init(void)
-{
-	return platform_driver_register(&palmas_gpio_driver);
-}
-subsys_initcall(palmas_gpio_init);
+subsys_platform_driver(palmas_gpio_driver);
-- 
1.9.1

