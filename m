Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB3048C8E
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbfFQSmL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:42:11 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:59295 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728898AbfFQSmL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:42:11 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MMoXC-1htMxo3zl6-00Ihze; Mon, 17 Jun 2019 20:41:45 +0200
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
Subject: [PATCH 16/30] drivers: gpio: tps65910: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:40:57 +0200
Message-Id: <1560796871-18560-16-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:yRCd7FPD6XjAvKCP3tjNf2xZyvbH9nrLgWbh0O3MsE8jvt4UPIJ
 nrbE/gI1wH1Q+myNlT9NjmlsFRsO6aTuyVKm2IQFl00CR1lcykUeEYfD8tjCZKpeNtpUPr0
 96VVXmkHN2YmthYwaA4ZmN7amD19jRxvMgB24idoHK0nBaNVnprQjsBS8bbGcpyKXgalrjB
 b4OBBeVUuCUXCgTnmmAdg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HnN9qHWYfXk=:REvvrSHdUd52Afrt5r7uYg
 OJWFEPiuerA41T9E3uF8emq2llDVWnGX3L+KGNAl1kthauq3lP8r0hsAkZhovyQSo2gzM/voC
 VTCLs5+XW8gvlhPPcnLZ+pFfBKCapfncdPJBDF1Gd3/Kd07b1DkERPZxazqdFEhyX1DfXbW5Z
 OQC/vm5sgHaw+mqH+CC72lJTOKZeFw8SgGccXZvLqI60hFcFnFfUOp3PAAUCwbR8KJBMWkr3G
 nO3+RQMRL1WT7bBmWLO1iKozQ8Hic7FFrukSVmIcCwFMx8fhAu6McYUk+hsFkSfXBzYu3kba1
 QvPzn0KG2NBPF1dIulIypKN0Xk8Opq+jCDltES+2n1UASUysSTNrUj2/wKBkxXOeBzW4qs0mz
 BL7/vMnAh+X/Ftwr6j+vcAiXH7SLCYLz1h5RmIYS2lXBGAogRPT1ONSwGykWyoPNHOxXOyXez
 nw7KoL0mpJllmxGQ4mCxsZQ4wRp8hEn7HE2l26OJpaR3LKOkAuaKC/YidAwqcXXStjP2WTEAo
 pm73RhmXvs9RezXE3h4yIWEqcmJAAyV8an0fCYpRsIcNG4es7QZai4PNXp5Wm0JqC9+Gn2hAO
 EIHdh3tDDwAPzScPu1iH9AO2DO7UI9VIqEL0MgBEAMzuFqx0F1hGhkT3uUCum6RJvTerTVExl
 FDvlT5a/Dd4g+EyeZtyFk1VYvO+sCctZRcOL5EjCN679j/4d10R2jfywzdeC+sJsUWThtR79D
 tnePzU8PewkCecSJ6ZBRs0Eig8N1NCuKr1NAdw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-tps65910.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tps65910.c b/drivers/gpio/gpio-tps65910.c
index 0c785b0..c618cd2 100644
--- a/drivers/gpio/gpio-tps65910.c
+++ b/drivers/gpio/gpio-tps65910.c
@@ -181,9 +181,4 @@ static int tps65910_gpio_probe(struct platform_device *pdev)
 	.driver.name    = "tps65910-gpio",
 	.probe		= tps65910_gpio_probe,
 };
-
-static int __init tps65910_gpio_init(void)
-{
-	return platform_driver_register(&tps65910_gpio_driver);
-}
-subsys_initcall(tps65910_gpio_init);
+subsys_platform_driver(tps65910_gpio_driver);
-- 
1.9.1

