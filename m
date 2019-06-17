Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB7B48CA1
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbfFQSnY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:43:24 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:36169 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728829AbfFQSl7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:41:59 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MV6G0-1i1eQB3wpy-00S5f6; Mon, 17 Jun 2019 20:41:46 +0200
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
Subject: [PATCH 17/30] drivers: gpio: twl4030: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:40:58 +0200
Message-Id: <1560796871-18560-17-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:6h1ie7eICxYmU6Y5CiT5Tc3+IJDhPWvoYpt1jRu50qNzLd6UPAP
 stcXFTdT4A2zB7A2Kh6IWZSrm4sQZJar+8J454KgqhNMbHwuVe2IKXNlSEfw9OshUC3E+82
 W9SeQ+m/ih4xZIGm30ZlqYY9sI6mCcDhSR0e/CSRnDotAsjxJx7d+xcDvmDkb4aGVAz8/vZ
 K8Y68ow7D7s5GAg8D+Ysw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sUhDXB3tx3s=:J+X9AEmECvzP1W9+WPVEgQ
 naDmQ+MYiNXeHyN78Ot3D8mmC9xcot+i47Qs8q0mLFOlvlCO1DKPOQTe+GmqA9qMGVXfQQj36
 nVEtfiIO8t1mtSXsutm8M75OfRwPBKps8PgRtSYl/UhOQ9+zEwyEnqqN8gzsADR3JRTAFWF2m
 ptPahmrHC2kuwLVeBJvzB99vd1GXfIl+pGxQGmMZ+j62nQ2Uo9QJ6BI2wsCXvsJE2HKOIKKVw
 JqqVwkQtu+GBU1UyCFBaeDYa4tslac9OoJS02bzzoAxajA9JqK5zkaNzubaaahul1LxdSTzG6
 ctmx0jzPCh2lq7XTFcARvtvQ6Yqjzg3bHCCJhwsKnrZs0z1ghVNDGLnSe0Y2YypoITdQIlhTG
 cBLUrYvEXejxWoay1Tl2Md4WOdUegsVrnQoW4XcivxgReSr/JsFp/tX/dlS2XTB5+JlqnuUDl
 2q4dg0ev0vJtMBmTONh3X82Cj/bRZ1d7ct7sOZZFDtQPP30+epkG9iSCkXPJTDNvH5C4simfH
 UZ7X/6eXktItvMU0xeQ4yzdGBTaRdXuh7T+Pzt5M8FrkdscIy5gtotf6G6/GM83FZgx/iDiSp
 7JyljriOUZ3wmhSrAQF3urZ27Rt315HYRwpF8Tg41EeFFMtAWzyCqQIAbKr96pk80XWG6NKWR
 s21zwYMopq8j7HhEMuKWeq4qpWKDoOM5AaWwNQpnpUd55eia9yFw/xslyt9LfzVxZfAzeIw6I
 6Y0dvyOvXw+rb0wzRDYe2+q6u+VVqE4RSpINcVEv0Mt0rQ/sD9zBJnC6t28c4Mv9XX4wTUVqv
 9jMzkCsyaFbhV7uqScEFE4MDesNFBX1WkwoE/uGoZiUBXQOxFX8Bjm4N8y3lmSePQZ6ptJBf+
 JQ01wiU61DgyICIRuqMYKGGWevmyq43PwjhdX2hN8zQFqP4z1msrron8yGtzLXxyfmg+qq4Fm
 jOfC/Htoozg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-twl4030.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index fbfb648..0c9a86f 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -633,18 +633,7 @@ static int gpio_twl4030_remove(struct platform_device *pdev)
 	.probe		= gpio_twl4030_probe,
 	.remove		= gpio_twl4030_remove,
 };
-
-static int __init gpio_twl4030_init(void)
-{
-	return platform_driver_register(&gpio_twl4030_driver);
-}
-subsys_initcall(gpio_twl4030_init);
-
-static void __exit gpio_twl4030_exit(void)
-{
-	platform_driver_unregister(&gpio_twl4030_driver);
-}
-module_exit(gpio_twl4030_exit);
+subsys_platform_driver(gpio_twl4030_driver);
 
 MODULE_AUTHOR("Texas Instruments, Inc.");
 MODULE_DESCRIPTION("GPIO interface for TWL4030");
-- 
1.9.1

