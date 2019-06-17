Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B60748C72
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728957AbfFQSmX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:42:23 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:37787 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728950AbfFQSmW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:42:22 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N8XHb-1igTYE26OP-014TYV; Mon, 17 Jun 2019 20:42:07 +0200
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
Subject: [PATCH 26/30] drivers: gpio: zynq: use postcore_platform_driver()
Date:   Mon, 17 Jun 2019 20:41:07 +0200
Message-Id: <1560796871-18560-26-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:aFqQ1DSPzh4v6frM7pCp7Kg/IxByxmUnQp3Jo6ZziTcbZFyUhRX
 eudPvP0owXDo/nfbxcpUF9SaYfMB6A30v9JgSJQlI29aIDIsx/RpJGOgRFpcSGK3v1XQpam
 GhFYLkj63TrCEKR8V3hpF+tmsJXq/RzM6vqTgvs/6Cc0MOLBW+7PdWWfbteRI9qMDXBNeUV
 DBQH6xvHc9NWFM1yyQL/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fSwFjrIXnsk=:IFNP7QO03UPTokbw81zkAO
 i2aj8dT8sWd658++/A8yiOuOaj6gToFzyEVmzj/1BVrfs/bbTmvMMWodEqNYHlmMvvw6FkW3O
 M4cTAyhznN3FsI61egaiQbJW9lQIPaSUHgwhbUcEcunnojk2gEAQrLka/il0zU8EQQHsG45JK
 E8pMeUbyULa77MMeUO9bFUu/SN1fY2uV0hQAW9cnrW5tgiryNiJ2tRf28czfQGp8GBMiAAXAg
 d8jgKYuH6IAdma0aAB1nBqdEaKtQXll/Cv8Oc0paIMUA42nuMFh8f3hiJokmQQXcUc4E/BvVr
 bMYRIlWyDNzRLNPPz6+PJmLD/ZOMrpXS0iTkEAJDu0ypVSUF/iKr1I+cnT2NmjUXRbh8xNxgY
 iN5gGkYrkH/9HDwx4tg+nJLIlntplA6GpcqGYwjVfzYlVEOHEHkpBqwIMohzzfLVbTSE5Lpnk
 Q3ZkxlijbN/4TZCv3Y5GPRMDqRp1KkS1WRcf2PXSdXDkxr//tPj+ler697rrsojl8baGGkQFm
 76ry/UipppfZk9795XZRZfnZrVQAphKfLfoaSfcXVljvB8fVmUukFkwNk+IkkoT+V2ny9WUkC
 bEWB/lEArPxQq16s0cFTiPuuR/PR6ftPZBqfIJmarbGT1GwYALgddjx0srlAWhiY0EbwVzW1Z
 9kGQkl49ouOKOy0lMAsOKfaMA+Q7RFv3tkH7FEMsVcuNQ22vw4buqs2w7ciDjdNlERwt//lni
 dZB3P9bpUypeHvh9o51fXuIVnYbob/RGcuxmww==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
postcore_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-zynq.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index f241b6c..30ad4ee 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -952,22 +952,7 @@ static int zynq_gpio_remove(struct platform_device *pdev)
 	.remove = zynq_gpio_remove,
 };
 
-/**
- * zynq_gpio_init - Initial driver registration call
- *
- * Return: value from platform_driver_register
- */
-static int __init zynq_gpio_init(void)
-{
-	return platform_driver_register(&zynq_gpio_driver);
-}
-postcore_initcall(zynq_gpio_init);
-
-static void __exit zynq_gpio_exit(void)
-{
-	platform_driver_unregister(&zynq_gpio_driver);
-}
-module_exit(zynq_gpio_exit);
+postcore_platform_driver(zynq_gpio_driver);
 
 MODULE_AUTHOR("Xilinx Inc.");
 MODULE_DESCRIPTION("Zynq GPIO driver");
-- 
1.9.1

