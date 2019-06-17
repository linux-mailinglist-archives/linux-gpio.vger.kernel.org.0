Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB8E948CC9
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728720AbfFQSlo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:41:44 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:55069 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbfFQSln (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:41:43 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MowSu-1iPkr60HhG-00qVKy; Mon, 17 Jun 2019 20:41:22 +0200
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
Subject: [PATCH 02/30] drivers: gpio: altera: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:40:43 +0200
Message-Id: <1560796871-18560-2-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:n6lNF/HiERfH9tPVBrtbF8cjwb9Kd5R4hEw89zBMMBUSS2AViuC
 4gJyGnofyR32s6hyLipxjrmtm0hVyHI6gjievevJWOve7tRnvPBcIMtAJw7wKJhAWq5rDjj
 Iyj9m7RQrAUUKBSUGqHD1PBvmVAELc1atMNKegIh8gMZfgg4yV3opmtlH4Fg5chMY3jfnUb
 MdYDYDeTK0EIp4a8LH4YA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FubfsVQejOg=:hcx/YkqnedyIVid8oMi3jN
 yFOL1ldrSamVyPD1XqgcK7HgFK+YLZiUZ5yvtylcHhNZk5uHA+E7qZ88wMhHMfx/G6qICZD0t
 kUFz1TDSL2m3B39o8Io548h4eFN/QTaqpPmDIe0dunWwnR1niVaJ+u0P0aqZd25Dz4V8TegoU
 pnvj81x//YNVy2u9bJ0kzKQxjgLvAtc83GT8hRXOiDQFPm9mriTFPaw1bpeR1oNppt0pK83dJ
 dD3mH7BDynA0Q4gJRNVe3ofzSKpACg3mGS7U9Vq2lYVKtrr/SyraobT8ddVtOx3qWQIW4RD3v
 fjskP8Mt6UrUjEJDI1a4nmMvvYdD07zeobqRexYJCodR3kxAkE8iDK5liLpetva6eRoNkJjFX
 b9uKQXHWqbf4vnKcgKhkMLaddWIxFDwa4F2DxlBbqF9Z5OSAq8vVPA2y06vqu/VVEtOAra6v5
 K89jcHmBOGrt2YxGcaQO4ADJoAFw3n+DDbQL7f+fjeIJDS3PS0S3hoA0Wz14HnVEeV+yD6LSd
 rzL3OApCEIKrUxcGx9Z4W21lsMRMqPj7+3/YclHcYNUiad8gv47ZcU1aICcAME4tCBOv6a9Ko
 GGL12YFdJN5kIorHVpjmaAXnznWQPuaMSTNIur8CLGbRii4Vg63T6blfjBi4swjCMcib4ojaD
 48A8xT3tkMu3KlL2VaZbvNvw/u0D38Ga6DgmOIxmWdQbhVbYsS4c09qzB2a/ebj+8aJS6Lcbk
 3G/hwmRXYSg8ea7msahEPVimEv97KizsfoZKPw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-altera.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index e088b90..b757c650 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -342,18 +342,7 @@ static int altera_gpio_remove(struct platform_device *pdev)
 	.probe		= altera_gpio_probe,
 	.remove		= altera_gpio_remove,
 };
-
-static int __init altera_gpio_init(void)
-{
-	return platform_driver_register(&altera_gpio_driver);
-}
-subsys_initcall(altera_gpio_init);
-
-static void __exit altera_gpio_exit(void)
-{
-	platform_driver_unregister(&altera_gpio_driver);
-}
-module_exit(altera_gpio_exit);
+subsys_platform_driver(altera_gpio_driver);
 
 MODULE_AUTHOR("Tien Hock Loh <thloh@altera.com>");
 MODULE_DESCRIPTION("Altera GPIO driver");
-- 
1.9.1

