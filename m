Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4C648CCC
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726941AbfFQSln (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:41:43 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:47939 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbfFQSln (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:41:43 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M3DBb-1hdkz93fAL-003e79; Mon, 17 Jun 2019 20:41:23 +0200
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
Subject: [PATCH 03/30] drivers: gpio: da9055: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:40:44 +0200
Message-Id: <1560796871-18560-3-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:Q5PltQXfiTOKHrKSj/Mo0rLI3IO7ONIoPXqcrcBIRXSnUAJ8vQ3
 wn1jtR1xBNHqfmRS0rbCc116r5T7LrtGwvVWsxrPVqXea/YZ+pVMj1nPRE2rsfDfskBXB3t
 8Sndve/+Bc55xXUqoxgSYGiBcYrkPefxqHAChWvwJ9wKATWTH801QzMXNEgcGFdwiALljoc
 r/1VvOX6UEa2O5X8ha6mw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UWp2ZL6PlN4=:2AH/c8BuRTW47BCMNdDqvv
 yDVEK3Sv4llPKToTHOQF9SMBJIZb2gIqZ+qlt9lapxCJmy9hoXYI1IaNCNIRmYtyvdRIvxmfM
 ui6NqAxXdTXfiOjsYp7VXNocwVi6KByYslGsgOTi4Vf2ZGW0KR9/1BqTK8R3kCveCp9r1piUe
 MQCG9K0PcWW4DORT5Mq1WJHM2+EtfDlfetIjsUJec1T04gjF8BOiKMfzQMLPkucA01pCymdSk
 UJD+eSoCMsj0CLHhDkHwwJO0KfWnoziwFNF2KIzhI0KxEmYTDGBSkT95mivFWNPXlhO5M0i8e
 WFtkZ8HE9bADucd0aFdICO9KPPhN1UoeVfN7EhdvsCGm+dtwRDvMYab1T8fKI3P9ULDhLGiPs
 DUyCsJxi6SmvFbV9McDe1bV3L/iyGS/1o9jTlMbnBBJULkTruOqNQ8ViAo3FaoNcnwwlqcarQ
 tRqfkew9JOrFLtQVzLzSa3/3itNZ4QHjMsQdF5evdMVI2gBP+GQmNUS/upSlqNmrM40v+rd/m
 scq/1nIJFUNzhBV5pA/JDqCru9IiWbw0D4DfpAp2EI78InNrxkmsFgbFQswJWLxHz1Z9nlBN5
 WzOswPED15wnkSUOpZ1C/+IE8aSVSjYdjtCiKWFSdWEXDVO9T7YSbqz41O1aou9QOU0cBKgrv
 OvFJhbVGlwvLY9Hxx82oEi4LIjFCB6ig8JM3d+EHGzKOCNa33TESzJSrCIqzpPRncZFBNGPnU
 aI6WiZpqzYApZDDynptHCCxAyvi/wlJ5T1FfPGqJMhy1CMZVBzTUP4R8oQZPX1jBt0vOfnneT
 UdQSn0whmPLAuIQpa2O0EATeqv7qvhc027itMVC+wv1DzEWhE2KBm07GQeCuGQll/T3BMuTJB
 SUuDBQddwizJpxw0KcIlY63jUEU5U/cPmxKwokiATJYCGXc8l/0oXIhaJQMkdc1FSbqVbSoqb
 kRmWLcTUP6Q==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-da9055.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-da9055.c b/drivers/gpio/gpio-da9055.c
index 6ad0c37..d93f8ba 100644
--- a/drivers/gpio/gpio-da9055.c
+++ b/drivers/gpio/gpio-da9055.c
@@ -163,18 +163,7 @@ static int da9055_gpio_probe(struct platform_device *pdev)
 		.name	= "da9055-gpio",
 	},
 };
-
-static int __init da9055_gpio_init(void)
-{
-	return platform_driver_register(&da9055_gpio_driver);
-}
-subsys_initcall(da9055_gpio_init);
-
-static void __exit da9055_gpio_exit(void)
-{
-	platform_driver_unregister(&da9055_gpio_driver);
-}
-module_exit(da9055_gpio_exit);
+subsys_platform_driver(da9055_gpio_driver);
 
 MODULE_AUTHOR("David Dajun Chen <dchen@diasemi.com>");
 MODULE_DESCRIPTION("DA9055 GPIO Device Driver");
-- 
1.9.1

