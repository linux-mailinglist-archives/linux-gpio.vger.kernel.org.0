Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 579E848CB4
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728624AbfFQSnk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:43:40 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:41707 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728803AbfFQSlz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:41:55 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MspyA-1iVizF3GJ6-00t8ju; Mon, 17 Jun 2019 20:41:41 +0200
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
Subject: [PATCH 13/30] drivers: gpio: tc3589x: use subsys_platform_driver()
Date:   Mon, 17 Jun 2019 20:40:54 +0200
Message-Id: <1560796871-18560-13-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:KrVoP4vjl12gjhS5mZN4JRyOMm71/rHFm+seF2fjW4HDqMnyA9z
 i7/gWIp0+QdEp5YTxyI8hlSXO8VoSehUm8jDuoy3yxjiIP2CVIJCStEdhnwwmFg77oSrTSG
 5n+uVdYAylSYyNCOmi0LGjs41PbzjT4S+fEV9iTzA5JjEBNvwpGFPUPya5r4S1fYyqQ2ePU
 wqvICV1/74+gsSDJ/I1CA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:f5YSQ2fpssk=:HnhA79MjR0QcrbOrYV1JVh
 uxh0ML8XxUgT9uiqtti1WOKznAsttBP4Cifx9lW92Sv3yrqv0eeOtqFdDqM9ckD1GqP9bAW2j
 lZBirmVJHM3a8gYeT7OcuUIVh9voP9b6OvhCaUStZ/adHDgyn627UP9CqtU6+54xsIgWmkbxd
 HjhHwoio0TDWtlbNGfFrcrsXdBYnNk9EhQ1a8CGYQPD9ygFutqGJPoD6rUkzHiTX6W9gxxc+z
 BuArCrJRCZGknjvV/Gthm6zws0KU+YGx9b2tumusBKMp8MbT+H9ooy6faqniOZFLNpf10zuB1
 6cJnkfLs5FFOJfCx+NF9BFOmpxCoQjBa45d/9lNU7mwFsLhht7nKPvqcDbaAwu9186j1vhYQO
 UnJCk7lJBIQu0fnhyNpQf0nABRPxXxHtngyOfw1Ph0uU88YnZqNRhonCM85qp26cLqhpdpzeo
 S5I9XC4xyMR+2q4gbjTqFIut0k8qU5oSsd4J/MwtmMxjn49Fidrmwg6OCuHh2xpcHkRmuA3IG
 m+0VWfAuMXuAAVid1PB5L/yfzf9WiL5bocvOc85FdeXoVnL9Cn8qu0hFupCjc5+kzHLVIVhNX
 9/RF9SnsSIBa9itwpxrG2pgeBQ7jlApqZoWib+ofiO3dDJ/3myaKyvPwnWa8ro1dsxkIpq4mW
 ZGBaxzvScEF+jiwWGIOCMHHz9JGoq75jj1ED0aS9Cc2K6hcT0+fGNLR7IOtA6AJ3ALEJXct5X
 1HDbVk7VaXfyvClN5Mr5vlizaGCw73bxlpOAzw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_platform_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-tc3589x.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 91a8ef8..8084698 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -360,9 +360,4 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 	.driver.name	= "tc3589x-gpio",
 	.probe		= tc3589x_gpio_probe,
 };
-
-static int __init tc3589x_gpio_init(void)
-{
-	return platform_driver_register(&tc3589x_gpio_driver);
-}
-subsys_initcall(tc3589x_gpio_init);
+subsys_platform_driver(tc3589x_gpio_driver);
-- 
1.9.1

