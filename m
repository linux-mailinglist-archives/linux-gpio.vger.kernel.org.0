Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99A8448C6E
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbfFQSmd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:42:33 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:37201 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728950AbfFQSmc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:42:32 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MvJsF-1iTG9P2nw1-00rDzz; Mon, 17 Jun 2019 20:42:06 +0200
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
Subject: [PATCH 25/30] drivers: gpio: omap: use postcore_platform_driver()
Date:   Mon, 17 Jun 2019 20:41:06 +0200
Message-Id: <1560796871-18560-25-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:tFS0GjzX6alLG19pcq9DPLM369DFPeY4/FfXiA6BRRzIIxKJuJS
 bNXHsgS/ru29Ym7LEcgtLqQ3RSCyKDKmMYd5nivpxeZUG7FiU8NWBBgmuutqWHyKZzUc5UG
 ma9M+hvWKe7effQ+FlIgyLiZ2wM+1bixOYbyXiJCjT2qfzwjQcV2uenT++3Ohkqd8O4Dqxj
 XYAPhfVY4/p46MS5cMn5A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tRv4K84lkKs=:dWeeZq/NGKHGQccUiV53fX
 +TfnnmpNbzSLBFctGjq0ZTz3GwgPFnGl8nJzS5loTtjj91jpEHPgmzHy20qTEKNbcJ8z2p9Vo
 GoZWKgp4S8lU8U0K5YvE2EWtrZEHZWWbmNzDc2hqR8bubuonqv17GXKP1+qwKI6mcTf/pfH0E
 gLp/OjbJg0A+2U3wLlbOXbuGjAP3gS+BybkKK7aE9WBly+37grzgb/VC1S2Ug/DUJyYdwOWGP
 YWNoFFW25yYVetpKsxQ9lPaRN3BoIyNFq9N7MuE7cWhXLji6QiupVcD2zHpo9mF3cf3rmoLIm
 dysQtuLi6MEYzE2fDslmkQqP6vc1xaff0aed7EZe3RL9sVEAmkp0cPFZX3Zl46YP8Bc5G39Y4
 1XC+/luChxFwaqixJcDv/yk712JGHzyXmJWousJnNZULeTSKujdCqplWg5kkke5kSXWnVyb7y
 NVPWSOw+igxbB4ELKpxhpBnO/N0x/LiISRS8wd46IsLz/cXE3XDK5VrBGSnctaYKfyhfYpcEJ
 X4iesZkyfZxA2yqyjCVTft6d1UYPl5kd7gnVF+Tph9SJvX+oISt5vrukTM51oo1GLGYPah6Bg
 Pv4STYGP5Z1zEPhWs29Eo+/K8DaWlejvl1o1RfjlZrLjfAYnJU2xbVSjyjep4QuFg4hBzhgYj
 onJrNyJyln7JMHYLZHt3WUB6C7bUbLO7eqqeIqsaac1WUQ4ehR7pkxyaJmXwwsDYCswjUqXcp
 QNfgRPg2hiT6q831hXs8IAWVANa8TbsHfWtwNA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
postcore_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-omap.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 16289ba..3ea02d3 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1693,17 +1693,7 @@ static int __maybe_unused omap_gpio_runtime_resume(struct device *dev)
  * machine_init functions access gpio APIs.
  * Hence omap_gpio_drv_reg() is a postcore_initcall.
  */
-static int __init omap_gpio_drv_reg(void)
-{
-	return platform_driver_register(&omap_gpio_driver);
-}
-postcore_initcall(omap_gpio_drv_reg);
-
-static void __exit omap_gpio_exit(void)
-{
-	platform_driver_unregister(&omap_gpio_driver);
-}
-module_exit(omap_gpio_exit);
+postcore_platform_driver(omap_gpio_driver);
 
 MODULE_DESCRIPTION("omap gpio driver");
 MODULE_ALIAS("platform:gpio-omap");
-- 
1.9.1

