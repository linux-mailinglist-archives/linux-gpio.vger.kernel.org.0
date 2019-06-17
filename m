Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45E0C48C9C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728849AbfFQSmB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:42:01 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:36965 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728840AbfFQSmB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:42:01 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MuluP-1iShui2LER-00rlxl; Mon, 17 Jun 2019 20:41:47 +0200
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
Subject: [PATCH 19/30] drivers: gpio: wm8350: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:41:00 +0200
Message-Id: <1560796871-18560-19-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:wLzkRuXKotLF2WaM3fpevEX0AxLNyeHRx9VsRrdtbrQDkAKGIih
 9kPBVP670wqyAqFmtgNWb+oATCjh5SLYlQGG6HqiVvtvzpTPyLm5PgfIdcoDctZ2gDTG47F
 4JZE1EQu7x3voQ/c6J41SBAwBbH54AXL9UbbhV65kBP0g0YOl4G3rRutVgfr+VFQxQl98kn
 3api/IhKX8mxlKBu1kbrQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:v+FzUkdU2rk=:4UibfO1F8mHTcl5gJhosWO
 L4kyyKtB7fuMjtVO9R2EPVP+JwoB/jxBMNS+5IWxUHi539sKS67bHyFRhDVzSlEOM7ruQpCWb
 BI0/d/4Saf9LR9uX9WsqJOjQzjKmh4KuQ6LewJyAoQNKnC5enDdzVWmWPC0gcR6+guX0B1gGc
 R4SFnjS55yTgDPUFprg3ZczzGA5FayYuYZMM6OgQtMR+X8Xr+yVwv2pOk3hrKthJ0FmhfYBjp
 lh8DN1w8Zwe61dDv53HUV87A7Sj76pHuVWkXf/EJtq0Fe3IePJhM6/sMmTN4p0Pcy13CznxY6
 NLHjO2KJYeCVDB8iumUHYXZMAJfRztzj011H4A6DwffCZTf0M6QfP3EC6+b7fS07E/NQFK/MS
 IiHxNxzfEKsOIniUmfbEeR5jGZMQhr7eoJmT6wdtqQwaKCEKpqp8pXtk0P0Jud4gwfM268AmV
 Afnwvoxr/7bmIWwTNfpI+ACqN8snUTjRRKzmprtpDbZM4QX/WqJmy0+ljxt2HFfAM68wvofwY
 5H22qVzj1CuH1ckNK0GJW/XQ2AkyjeS4Dsl2Ie7B4Hndu4u8UHh57jV5ZJu1Guxg8N1sevIe6
 0h4LimDbIZb1lX0SfHhUhdNSgSQKk2gDUret7Ge+wKUGgo2sy4x3N0PQTP4lB9K2n3SIX4Cpw
 goiFtMe+CyenolawmAT5YxRNJmWk8XVXchs5n8jIHr1nJwKxo4zZl7WgSQmOZOqfJBh6Szp9E
 Q/S6v2PHqYnRaWF1VLlhSc7JaxIVClMCpteOFAyCAU/1WQFF/LSvF+YG+q+4OQa4VEXGXp6/4
 D5GfAJc4h021jZF0xyAa+Qjlnaw4NQiKX4od2FGF/vcXWHhhgE0UqLIwxl+FGmdFxfdHAYVv+
 BZuz6BMQoo/xwTpS+Rvud/9MlxUx+ZX1q2IYVY8He5sBMVxY/z6JWEQr45BGJTnWNJisfdBbG
 /BnzXJombiw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-wm8350.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-wm8350.c b/drivers/gpio/gpio-wm8350.c
index 460f0a4..21a3191 100644
--- a/drivers/gpio/gpio-wm8350.c
+++ b/drivers/gpio/gpio-wm8350.c
@@ -137,18 +137,7 @@ static int wm8350_gpio_probe(struct platform_device *pdev)
 	.driver.name	= "wm8350-gpio",
 	.probe		= wm8350_gpio_probe,
 };
-
-static int __init wm8350_gpio_init(void)
-{
-	return platform_driver_register(&wm8350_gpio_driver);
-}
-subsys_initcall(wm8350_gpio_init);
-
-static void __exit wm8350_gpio_exit(void)
-{
-	platform_driver_unregister(&wm8350_gpio_driver);
-}
-module_exit(wm8350_gpio_exit);
+subsys_platform_driver(wm8350_gpio_driver);
 
 MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
 MODULE_DESCRIPTION("GPIO interface for WM8350 PMICs");
-- 
1.9.1

