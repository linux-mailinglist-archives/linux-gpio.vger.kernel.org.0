Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF5148CBC
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728763AbfFQSlt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:41:49 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:33337 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728755AbfFQSlt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:41:49 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MQeI4-1hxCRN2g34-00NfoG; Mon, 17 Jun 2019 20:41:35 +0200
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
Subject: [PATCH 09/30] drivers: gpio: rc5t583: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:40:50 +0200
Message-Id: <1560796871-18560-9-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:NtfiuMTxPtr80+HHq665BNavw/BCJA4CgEhl2ViOFLYgu88eWOU
 2hhnzzDAS/UIAhXsTLZmMhvR5azFrVgoO8K7O9AWO18mS71Q9QqXPk/QlZ2hahMSN8xLbH5
 BpvY5n6zqLpshIgXs8kSDc0umTxmPZzUc9x16Y8s9R5fMBo3hrpHjBCyNxJ2e5JGiS4K5mA
 SPsRKeySP2Rf9bfO4EIEA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z7+Hk0iGS8w=:v68Ui3dBufbwKf2fdxsih1
 xyGo6MFOXAG6Rnqmex/eTqJdHND6dM1aL2DoQusdjev48d5nW747jhUT6QhIqvsQ+5PGH6DGC
 BwYjLMtTlsn5LMOYV6AMnQSt6qpgRqVDJxAwMxLYuLo9oPQWRlu6vFzdtt/A+zIjH2mpYuwVS
 YiJ/5C0QGAVVtovX2y6+lHyEAo7XYdbPZTk6illizoNnZ7qJ3fwSTUUxLT+ZDEiEbj/yG16gO
 j+UQVHaDEIiNbxyYp6b+KEvV7TRMKHSjY+CH7jIFjIZVNFVktw/5cwb4mv5et+1gYpitKQUy9
 5938IjvzhBbM9EmD/5y8h9DbBaE6/rT0TTya6auQEKHcC+C3vm20u2LUVoXOWBRdJsRO/O1mO
 MKla7BMEN+9zwuvV5dSRg+LI20ILNFEUJ7ljD9FWS8e2NoT9ECtiClxKiqjGXm0zMDn6DrPpD
 Itv8kFbZAh4DyIkM1KRgJYayh0Rml3vCW2/3l1e010aV0TDQGboRNzYdBVfJribaswChdeWZt
 BA6mb354jeWRFXEIl/olhVUSL78s9eAd4jhWpAh4UdbMDJcmnanoX5AX1lY3BqdGJ4WGRKada
 PWHOLSmslGlhYMoyD1wA07U3cPzPpxPi28B+wzWxeT8pPsOYNdu2XywZtsf12pswdjQp/yWx6
 ICpqNo33jhYCptfF+oqDt/2nXnWEcNvdV2n+jTkyfHO9NKdra44/j3c3ANoZD+Vgp4uennAmd
 i1iPHcmZDZMmiQb607DBQRiOmf8lQ+GHpaqvNA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-rc5t583.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-rc5t583.c b/drivers/gpio/gpio-rc5t583.c
index 4fae3eb..d0dd3c2 100644
--- a/drivers/gpio/gpio-rc5t583.c
+++ b/drivers/gpio/gpio-rc5t583.c
@@ -133,9 +133,4 @@ static int rc5t583_gpio_probe(struct platform_device *pdev)
 	},
 	.probe		= rc5t583_gpio_probe,
 };
-
-static int __init rc5t583_gpio_init(void)
-{
-	return platform_driver_register(&rc5t583_gpio_driver);
-}
-subsys_initcall(rc5t583_gpio_init);
+subsys_platform_driver(rc5t583_gpio_driver);
-- 
1.9.1

