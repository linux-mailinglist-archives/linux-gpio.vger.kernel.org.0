Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEA4848C97
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbfFQSmH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:42:07 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:42179 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfFQSmH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:42:07 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Ml6i2-1iLvMQ2UcG-00lXWM; Mon, 17 Jun 2019 20:41:42 +0200
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
Subject: [PATCH 14/30] drivers: gpio: tegra: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:40:55 +0200
Message-Id: <1560796871-18560-14-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:iFWiFhcYYknd8StHR0u9aUbJBaXirauv2momRMOH7CEVwyMmx34
 F0l7McvrGvTC3Tk9IIRlhq6Kz/xKu4B+whDU+xz1oDXmlYyrhUBmn9Xd+gVAYCtjDrtGqbq
 YMFRFB7T1mdVpmBy9cVgwsFX2uBvUg4dN0QpAcJfeweS5L5xWd69Ea1ovRNgkIjEj9ZWsjK
 hRug8LBucbaIPEwK2RDwA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MJF7R8WTciA=:lVbBIPtwsBX3b1/G7FtOCr
 z3iDG6hXs6Tt2d2Te1Ni5ppc2unqhQog5Z2JC4cSA94rOsQIiFOA9Hs2akHuDb9jabFMWwH5N
 KFkrEPEOCRqWrlFv4CF7e+7OkzbGc2LYVrsg58pkoR/hbX9YSg2v4puyup4nozYBFXDKNuglI
 Shm1AT9ZU7pOmnU/uS72TD+PFxeFbzAVhFr32dm6BpsYIDSWFf0rO3Nhjr0poXfCg+PZ+LuIS
 PL4axpw93zv5Ntrd+mux/LUlNbpOfxnOVM5Yw83zUsymHRxpoGad4MOvzhCB7SOkYJ2DyxYPI
 xfCUg1l6QIJs/tK/+ZTcMFH4UiAsfTT/OTdWCAz/Ar8w7ytU0mNcbCWHSKh2yTGbwf0thtEWJ
 d0JxCP8Bik164oXB05YbZtDLUqaDz/SLhOJShnjnHRqF7QcL6bvb5RyHhyzvMXWSDe7OUil54
 4xmus9AKHDrxrS2EKH5OY9vEvE44MA5wLr+mqVfkfwQF8GoPW9dsUzifERSr5ytVuAHZsiShf
 B8TcHwpufpPmAIJkVsaSHPtIe43d1IzAcpezC1WebEm/B5cX3ie7xXrxZZQUOkIK3E1R94Rwb
 pRf0+ABCoc0jwrdpWDO0wGTqUbg05baZcDDLsXsHxeJTWquNqd25ChkS7Ai4RovYP76JrODM0
 e0maYvSYe3T/yZYjAl2vLTEgcjXzojAenTb4W2uBsUzqluvrmEZ03ZxrIPpeaXyWzpVEQuuOj
 mG9hwPZqHoI2DRReazXLXGIpNQfdjzFY71uHxA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-tegra.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index f57bfc0..64dbba4 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -711,9 +711,4 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	},
 	.probe		= tegra_gpio_probe,
 };
-
-static int __init tegra_gpio_init(void)
-{
-	return platform_driver_register(&tegra_gpio_driver);
-}
-subsys_initcall(tegra_gpio_init);
+subsys_platform_driver(tegra_gpio_driver);
-- 
1.9.1

