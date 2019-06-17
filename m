Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC91748C89
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbfFQSnA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:43:00 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:56873 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728464AbfFQSmT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:42:19 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MMXYH-1hsXkr46gZ-00JX4b; Mon, 17 Jun 2019 20:42:03 +0200
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
Subject: [PATCH 21/30] drivers: gpio: xilinx: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:41:02 +0200
Message-Id: <1560796871-18560-21-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:jZQIPS/8kKBvumGOIeRZuEAZfBqep8NBgz3VKgJkgVxmn/2i+46
 FLlq0UcVuWtpQwBDhlk7SchFPixQJXzIjLbhU4okNMK1xqofBeHvPHPLY1lvryE/VJUZ5yZ
 rFpaYvh8TKkLlrnF+mXC4fh2PSaSPmSDCBZyCL7J6azaRKrLrxVaVLNMWOPj9JBztB686W6
 VQxIKEaVuwqplatFtFqTA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WGfUmeSdphc=:LI3Ccf1BYHeuToQjrLXimx
 NJP/R+hDLf5AShTxNufrxU8XyW23qnVylQVOV4vn7kOkI/ReczOdNefOBEmyS8qETuDFgvkYu
 90fVIssCcWjOYiJuWGnowlyh8HxdXfpxPEq9XDezHHKlqvZqLBds0F1i8ULidSzZCht0tOc5R
 1q0HgfWRosnVn3veP6zRG6nIH3WgjjMlOflt7UspIPMfejjdaspEBZxkavKcUJkY+uYuD7Yo0
 Mwg//qezX8gGfxU/Dhxw+j3vijeXjI5DAR0kyprJlGl6lKnPvAYGypZtksCR7k3xUw/iU5eXM
 RpWeJOfo9ULAchTpU/RcUUBLudJFEuz1xkJ4yQnb5242EndVJAofniOGO2MNec8BoQw7IYrza
 b8XbbQJg09Qw+PPpwMOq6b9WII6NQ078iI9P6m9FYDWcf32ZEOqb35UsZqkIx5N4LumcPepmI
 muHIEQbXV7R6opaMqvj4SzSoHgQtBdreSWJIYFCj0D7L+XpbeKTZLGPcTSm4n7f7ZYrY4jU3L
 fRmi8WVCVPtRdCv/DJyOhr9NucYmBlZqs5UNktJR6G7XrAu1xf+qc65aXy3fYOUiVQ4CCG3+b
 XfUqNTJuXstGwD6M4mAtari3bETGjNFS1XALzARL4X/okpDqlDEZxqSYi8+PTLz2WkTeGn79x
 K1GhG7Xk1LODkC1t/PZrA8tFn6+Whw7q+trhFotAPXFriX1B+An5Sq4asIKtTecYzv8NBFAgq
 t3ObVbdOcDOw3hw0GhdrSvYsRT6RQRUJqdzrZQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-xilinx.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 32944eb..255facc 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -376,19 +376,7 @@ static int xgpio_probe(struct platform_device *pdev)
 			.of_match_table	= xgpio_of_match,
 	},
 };
-
-static int __init xgpio_init(void)
-{
-	return platform_driver_register(&xgpio_plat_driver);
-}
-
-subsys_initcall(xgpio_init);
-
-static void __exit xgpio_exit(void)
-{
-	platform_driver_unregister(&xgpio_plat_driver);
-}
-module_exit(xgpio_exit);
+subsys_platform_driver(xgpio_plat_driver);
 
 MODULE_AUTHOR("Xilinx, Inc.");
 MODULE_DESCRIPTION("Xilinx GPIO driver");
-- 
1.9.1

