Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B62C48C94
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbfFQSnG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:43:06 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:48503 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbfFQSmS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:42:18 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MKbc2-1hvYpC0iuC-00Ktqk; Mon, 17 Jun 2019 20:42:02 +0200
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
Subject: [PATCH 20/30] drivers: gpio: wm8994: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:41:01 +0200
Message-Id: <1560796871-18560-20-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:pLNdmawIffiCHQrbod9BFFSHGoGtQwfKxyadnio7TVFPu1etlIZ
 kpNlfBy/TNxqX9C7n3M6Vh0yXfFYoeO3AGF7WfWkDJwsqaBOo327nq01hqQSUcp7UuNOzQE
 jbUrVqzqqvenQ9yiBAp8shSBHn5KZhB8BBMe6GTk26RqzKzO8WYUZSXr5ZDMjUVSBe1JfmD
 XvweC2TYSkottkmItC5DA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OPduHIDdewQ=:cN8bB2S93txpA7kXiDwIdQ
 DP0l3mQMPiEmqFwBJQ0WNDnT8fZ6QQfYpoNLqh/H1cOeHtL0pHKN3oYDfEtzecoS3mF3/fK3x
 bO+mV0fG2rk1evu1PJMU3/oJx4KoNwIPIWDb1fugeE55BT0eSRoOzXRvo3d8wzs4odQLrWts4
 +14akY3VEaVr1I/MwJfJ9wdKvmrWKh21WboORj55TfDVX76cUYAjAgsZGTykNzGTT19bzpVQS
 psgz4iqQjj2kDRrxtE32woF1LXMXfyAWF5rkSfSdzz8YRw1UhoZNT5GxmOjMgqwdpsrNAp7/R
 B0eooZIJ7Q5BTUNX6RGaEluZplKxF0mBz9KrQ0ThPAjA66859s05xZiyxJgEiqsNmXCPkDkFG
 Z6SkCjzXEWG6eFhVc5vStwya0rEmPI6myEkEacCiHyB4aLJM7lgi9LGksyDtmaoQR6kVSTFZo
 SpIKCslWfCUiWUOj9H2ZS3oUR3SUyOFgkEQ3UO51DcWWjiAehmsFa29SAE3+dW/diC93UnDWs
 /iV3vjYKVRotyXIwOKHvGWmdudP0Iw7oWHIjnZB9xnxYEC5NNPy7Vai+4Ect5RwN+g1JOKoU6
 38pNeAzBN9QSl6akTXiKKeseAS9/Vbff53lCrqw5bezrSoHo8IPWZsWD3emFqN7ipsme16jBA
 H1iuVGbaQxbMkon/JA98nW9h+rHMCnQ+f2IG7H6h3Mi6trFYWjnQukzfkW8rrj9qpEuLR2qDe
 5lYwdlzXExP+IRruurhUbX6i1HJyY4lUenhOCFZOoc/B7Xsg/oa7VLtM2AFI7HQ63HgK5fWXh
 s6hZZXhOBLOVFfPRFoKtKOA8+5PqEYaIDfky3Nukts7DvLRuKa87B4qQTJoUwk3uRTEdjqRiF
 dZwMAOb3omI15kxavj8jXD6gZk5gnB7QhwOIYhwl5bj3XNsBI/8jqm6DBUQwe26wl46h5jmtu
 VmGMur3UuZQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-wm8994.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
index 9af89cf..d9f4572 100644
--- a/drivers/gpio/gpio-wm8994.c
+++ b/drivers/gpio/gpio-wm8994.c
@@ -296,18 +296,7 @@ static int wm8994_gpio_probe(struct platform_device *pdev)
 	.driver.name	= "wm8994-gpio",
 	.probe		= wm8994_gpio_probe,
 };
-
-static int __init wm8994_gpio_init(void)
-{
-	return platform_driver_register(&wm8994_gpio_driver);
-}
-subsys_initcall(wm8994_gpio_init);
-
-static void __exit wm8994_gpio_exit(void)
-{
-	platform_driver_unregister(&wm8994_gpio_driver);
-}
-module_exit(wm8994_gpio_exit);
+subsys_platform_driver(wm8994_gpio_driver);
 
 MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
 MODULE_DESCRIPTION("GPIO interface for WM8994");
-- 
1.9.1

