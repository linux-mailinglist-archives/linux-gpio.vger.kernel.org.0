Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFC748CC2
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728916AbfFQSoB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:44:01 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:44289 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728760AbfFQSlu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:41:50 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MOzKk-1hzwXk1n6i-00PJha; Mon, 17 Jun 2019 20:41:36 +0200
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
Subject: [PATCH 10/30] drivers: gpio: spear-spics: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:40:51 +0200
Message-Id: <1560796871-18560-10-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:4h6NwlU1DftNIO46WTLlIk1U9jeIrbC+0HB5ro+yUcwM9EiZs2/
 pDGYqRWRH0GUxeSGS90EtGopJnM/wqYUgcxkI3p8C92KBBLwFAdIlIUs6EEc+A7oaLjJSU/
 K17l1KHC59XsgPRYwCRH6LKV6AQKi7//FodS5pmevdbF3JxK9piYHCouAOa3k3cIzSeKHwe
 mx/r615pVKlQNOBBYiCgA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0th+QeGO5Oc=:LhQhQZkNQpC5fBq+Ljrj+r
 YFA65RxCxr2pBwmYxN+W8AZ1vMcmZKu9LPuu+xsxh5oMy0sseJ0kOq1yUk31OSdgkmu5OOtoq
 IRRUVI/fYBFgn1PbXDIxuozuqjiUxXKLFfNTnRHJrejWwDOHOYAQvOJ+4Qiam2buzacT7sOVB
 svTySllHcJGvKDMmLXw0pDrJNn7no9JLF1fVQheQ4rLnpIE4GJCqmvbmCSQR1xCznr4xi4yp+
 9hWRtKFXpWjx+WqN0jH9nm0QisAfAstLsRSo11ZxJnPxZY+y3s+LFod1pFxq/SI8iKCP2YCtU
 wYs2SuzjR7RvG5i4RCE9W86wOTfQx2+869e/ffimo0cqLHS/JFVQe/t8FYYLFFeumvL/dHxSw
 icvfFjP9oMJyp9jP+FT2YQZFz8S99HyMlA5tnswKOEJydwe14LDMrQX3coUAQnmxCV8fpETPc
 8qLvoQXV/YTGkHIlwfuD3cbJQGAMT09WfNgzKb8vesLvf+nABrm07HQ5xXDYS8/pNhdFcszN3
 for6/RnXlaFIw8IrakD1LR7SMb55y6eRoDh+f1RkQkvamJJ8cfQO4KiVkLUuqWrFhvdyTySvU
 QzUG6CCP78hsAODemukTtMWtlyzUm8OZXh3eEcZz63j8UprjujOyI3jPu7851h5MEy3k8fG7M
 c/m3JNQS0lO9DwNJic/LY4d3vCFDJ/woItYZ5tTuC38a4yDJiXmT9lrI00gOUAEcCSuGl0sGN
 FQUGu+jsF434wofSqZOWy7dMN2DRCQqWBRTiAg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-spear-spics.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index 6eca531..efb99f0 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -189,9 +189,4 @@ static int spics_gpio_probe(struct platform_device *pdev)
 		.of_match_table = spics_gpio_of_match,
 	},
 };
-
-static int __init spics_gpio_init(void)
-{
-	return platform_driver_register(&spics_gpio_driver);
-}
-subsys_initcall(spics_gpio_init);
+subsys_platform_driver(spics_gpio_driver);
-- 
1.9.1

