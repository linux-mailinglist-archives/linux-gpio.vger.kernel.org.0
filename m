Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C67A548C82
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729032AbfFQSmu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:42:50 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:37109 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728953AbfFQSmX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:42:23 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Ml6i2-1iLvMX3bHI-00lXWM; Mon, 17 Jun 2019 20:42:06 +0200
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
Subject: [PATCH 24/30] drivers: gpio: mxs: use postcore_platform_driver()
Date:   Mon, 17 Jun 2019 20:41:05 +0200
Message-Id: <1560796871-18560-24-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:Qgiw7ZaeiBAjth0IOr6Xj5h6QYCD3X5jMH6eO4uCwVPY0vNhBnF
 Tjp0/G3Wgb/0FjEev5mvC+Vp7ieVHg2mJHR9IovvMX/+Fm+kWy0hIfmJrfd1F0r/cbMLuP6
 eo6LYhsHjyyeJaUw2OYjkBfwglhY/Viysszh8D9Qb71GN1vKYXdpI6rav7qKz6jdnKHc80I
 RJK0LQ13fjzz1sL6bq9VQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xk1hB4mvM7Q=:Hk2ZVnuqbi2GaMoVsI1kxf
 g9jH2NtsTfBh3cVpLMa1gCq8nGE2IVd36SEOka8iaL4ZbS5f+HxoonbpaarzsKVuO6mHKr2X5
 PQHsDbS1FspceNstxdV0/4Tqw69t2xRIEZUX9wy7c+aTDC1FhSMvyIqoxDcve2wbO+xObiAg2
 YBOIoMIKoz8LJGhhFDEpReiD1L3ywYQEv4SDgJ5Yn5npdXaDS3vcu8rMmwSWRI4F/i2Xa6je3
 KH7LkdHixEa2Qzc0YbI9S1Sc+7oeMotLJeLHBjXBnAHMiwlsPOHwPwd3BAhXUZyxPrlrnmmU7
 ItAe8ejPa3567p53x846fP6hKiWUjhgPUtIIVL1IeKqvzetcxQnGkYp2tQblk3AmU2RRVcTfb
 o9lhmgWAk8+pdb3HnWlD7sl9KaNGp5hO+gW4u2uCUikfnPcwGhXy07C2jDCyyRaQDpBijFOlM
 NWji7Qfs8uMKN1e26MG1Xncs7sE95ZEDOSQGkidl+QNkC3oirtwRL2jWvzRv0kKIi7G+/0DnO
 VCScUaSxUugvlWXfNWTRQp24UIjSrGz4/IgQrnqvdbOWQAv9x1ka2CN/a/jCT60QskLUYIr72
 3Cgnpy+1wqmem0ZHLtcqoTE5evM2WDJkp2sIy71SH43mRTTABG4Fh3V7VX/78y+0TIeJE0nBt
 A9v5x0/suhw2XUkMCw6JNTzyY4W463sEX4oBC9oN7wsZ8vSo3Zl7TClEwEUO9VaWFzQRQfCVb
 saQXQp51obvIXSmRy9y7Vru0PIdSO0bdcZxZEQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
postcore_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-mxs.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 5e5437a..e2f54b8 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -369,12 +369,7 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 	.probe		= mxs_gpio_probe,
 	.id_table	= mxs_gpio_ids,
 };
-
-static int __init mxs_gpio_init(void)
-{
-	return platform_driver_register(&mxs_gpio_driver);
-}
-postcore_initcall(mxs_gpio_init);
+postcore_platform_driver(mxs_gpio_driver);
 
 MODULE_AUTHOR("Freescale Semiconductor, "
 	      "Daniel Mack <danielncaiaq.de>, "
-- 
1.9.1

