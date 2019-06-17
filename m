Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2EC48CA7
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbfFQSna (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:43:30 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:56949 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728691AbfFQSl5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:41:57 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MnJdC-1iJjV53YXs-00jLfG; Mon, 17 Jun 2019 20:41:43 +0200
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
Subject: [PATCH 15/30] drivers: gpio: tps6586x: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:40:56 +0200
Message-Id: <1560796871-18560-15-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:qKwzpuqgoNiBk70+PbpO/q0x0KY+ySxWp9cR8SnTejgI5QoqMFa
 oLeLwb1gqAmg4mU3A7BWnd9S6/IFmKSCJm/Ozd4/97DFdS9iJw8lCN44gl2f2aZTID2KN3x
 YV9q5hFSfUkRdVQyPBJ5IKvaUei3ah8ksa36aCwx4M6tzhIi1VNeK1/mxKQOFLi3+vL8XWb
 L5Td7lDeu6Sy5PS+Oavjg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9omeeGzECNA=:ra+/juBGEHcZ37DeNlQ49G
 rSbMDrnWJ0rPQpqpJ3tFdAAH/CulVNRYeHFQ9/SEa3BaNur9BPHUkeuaoFWwINkD2c/GV8xNU
 a86BJXIH2rTbCjCsOWcck1mLhD4yOeqOzxGU1HMCxwIOvT6r5oJ+xdDSmCM7PeI8tHywRWxiy
 GKneMAhOmeDmmFZeSLX1dGqFnyloM2zFvEPgP0ueoKjyQJszlnxIZ/bahIMoAfUVnOkYqEDhK
 7jtXW3rVhvr20Eq1zq98mgrdY2SouJvSssnYiItlqmXIQON8x/OGfp+icpmAarWtz5QMhCsnJ
 MLq+qGYYZ0M0CgQ5Ufn/AfkhzkNdyOu4j+g+RyCCEwqC39YOqVz5RFbvAcUMXy5JvNexJZQ+6
 VqmtoJNmfNC6n5+JaBiSrF6ssltxsZ1ZcZOrfh2CsCK4UPMwAZ/9DAppLtcLuBBpwzva9uUBe
 NHr4E4ZmD/pgaTQmFjqkMwaLRnMGMVnj/aEvoyTv4z1b4H/Kowra08gzkNvAXnkTB7dtWryaq
 cXAmMYR4tmbMPDaYGLpZIH8tYaJEn1rpIuuLxA9OeFvDnw74vvVj8ecjNnT9juY/dGs8G5z4e
 A3VVllS3k3J9G/CaiZYHzXGkRDrgZ1UiNl40q7j087MuUebOeDI31JuHPIgYasiIVkFqqZes5
 l7+r0CSd/eMDRTczl7aYWyYH7BMzIOliDC//M4jC/1b+YQPnHEeKDS3XY+ZcTAhpXejQZUMBK
 AqwnLneVu8XwP7hEuAR72gUiulwMyLn53ccfJg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-tps6586x.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tps6586x.c b/drivers/gpio/gpio-tps6586x.c
index 9b6cc74..8f75718 100644
--- a/drivers/gpio/gpio-tps6586x.c
+++ b/drivers/gpio/gpio-tps6586x.c
@@ -122,9 +122,4 @@ static int tps6586x_gpio_probe(struct platform_device *pdev)
 	.driver.name	= "tps6586x-gpio",
 	.probe		= tps6586x_gpio_probe,
 };
-
-static int __init tps6586x_gpio_init(void)
-{
-	return platform_driver_register(&tps6586x_gpio_driver);
-}
-subsys_initcall(tps6586x_gpio_init);
+subsys_platform_driver(tps6586x_gpio_driver);
-- 
1.9.1

