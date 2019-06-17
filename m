Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D98548C8C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbfFQSmT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:42:19 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:38381 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728926AbfFQSmS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:42:18 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MStKq-1i3qL01cOE-00UHWC; Mon, 17 Jun 2019 20:42:08 +0200
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
Subject: [PATCH 27/30] drivers: gpio: iop: use arch_platform_driver()
Date:   Mon, 17 Jun 2019 20:41:08 +0200
Message-Id: <1560796871-18560-27-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:NTbFVqHQR3mUK02EF5SUZOfvGIlFBgdKX3NDSeNjplODFG2aGbj
 LPmOsIiQ0lw44gx+sKsYL74ARD71Qs6dof8pRlIHbFKloBuMcQVnARK9vWSQyZf3UaFrwGL
 ibLSNF40xPu/pOTxQpOSh9dQ6P7VlAp98MYT5Bx6brehEz3Ton8YWviIkOz7k84FVmrJkh7
 z0zWK7y+GmU0RNmikvhRA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:REaB+gExQqo=:Zo6nlV1ZnA0bJdPyIPrdqC
 ldXUnUwxij/gqKA//Euaol3F0XtWgSVIyN0+SV+CH2fScXKVa7Q9uM3mdYajr5sDWuBrZHBfv
 2LIafGMm5FJxULI5eKqECRtm91gWHPIZkcyeukL6CoI6tgzJ4j0iyWxEQuSZu2qwqlOwn2v+0
 vVFzT7lZ9YaaPiOUdIh6STK9/JD+9QN0TCKNozW3L1g7XluVhVXpb766nZ5/6Qc0rFUGHFUoT
 XXmZE5tsNirgjVvuOPX/wW1HhPQmD9vMw9UxjGERBwpS5t/pS/sB6DoVnnu96bwWbZzlY5HuK
 cMt2AJSuBVdgY7+Y8Vmw+egvx+ws7iR6tZRJ6rPKKdRSTX+fIEAv1BlA/9XiKscGyqO1fw7mw
 F6aufhW4RfKZaGlMnkjzD3HSx3lIL+QPlLOJBQHutyQGwt9jU65pmY5ZxMrndlOH8ZOztQT/5
 TqrB+5cVNZTCeDOlrvVtlULnVKHJ0YBFB84tz2ufBbKvKDZZdT9U1o5xr+K2DEQDgdzD9QFZc
 M6iSO9l8jkN8QwPf7bF6AfqlSjpoUYKYByxXFpszF41O3jpa1jLgcgbzlIKYERa2FDF+UEKqx
 j6fGIQq6tWO2FSw3hhDeVRhG88dN5tpo6RZjMmSlCTkrYQPx3qHX3TSvD9N40xP7r9xC4HEYH
 NpnaKV87IYD1w94XEcarXxkZZ1KJ0HekdSLPiOra2903syQZrlZovH0FILebU1EGtFEdXhgLj
 Bwul842yJGoZXFq2tH4+kXufAD86kw+TYsChJg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
arch_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-iop.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-iop.c b/drivers/gpio/gpio-iop.c
index e355c59..651ab5a 100644
--- a/drivers/gpio/gpio-iop.c
+++ b/drivers/gpio/gpio-iop.c
@@ -46,12 +46,7 @@ static int iop3xx_gpio_probe(struct platform_device *pdev)
 	},
 	.probe = iop3xx_gpio_probe,
 };
-
-static int __init iop3xx_gpio_init(void)
-{
-	return platform_driver_register(&iop3xx_gpio_driver);
-}
-arch_initcall(iop3xx_gpio_init);
+arch_platform_driver(iop3xx_gpio_init);
 
 MODULE_DESCRIPTION("GPIO handling for Intel IOP3xx processors");
 MODULE_AUTHOR("Lennert Buytenhek <buytenh@wantstofly.org>");
-- 
1.9.1

