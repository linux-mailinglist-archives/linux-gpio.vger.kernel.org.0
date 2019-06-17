Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7DCD48949
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 18:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbfFQQtb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 12:49:31 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:57613 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728487AbfFQQt0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 12:49:26 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MwxNF-1iZJEN1bcR-00yMlz; Mon, 17 Jun 2019 18:49:24 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH 7/7] drivers: gpio: vr41xx: use devm_platform_ioremap_resource()
Date:   Mon, 17 Jun 2019 18:49:20 +0200
Message-Id: <1560790160-3372-7-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560790160-3372-1-git-send-email-info@metux.net>
References: <1560790160-3372-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:iUF692x61ZLmpEW0cyk7fN8zcW0UYE6NQcxbLTjJriJAElwKTNe
 R8nuHt6HzR9DEAZVvZ8bupP06/M7gDcUdeCSM8bfmcqQmGRwO5y3oJxgPJJWaD18K/L+zLz
 xF5esffapY6LrK9w3lS2JPXeAPx+O7VO8aJddt3M4sYKGu0nRKp3MmfEnQd6Vl4/MrZJkz5
 R/U/uB22KtRpWnqp9I44w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0EfjCshqp9A=:ApvvgQiO6IU01FfSZtslzu
 /WbmaDnBcgnDieQ7FUOdGTn4BY9twHFbWXMoSJkZNIg8bK1sVfINLgb3LYUNPFohw1XgWTJC6
 snsGp6Y72hWZ9d+5pFWJdbhU46FVNUwVzlI/kJ2CVvlYgLUwakZIdgztXTevWL11XlJaBDO7l
 o9szWMXH+DgaC9SACrJDBvnFfQf75nT6aQ0yrecIQUGMZSsRNVCsN7dPzDchPDnHJQf6UKxic
 IJdWE+8gCX7uom/dlkTJRczyj1dZHHMkQW7v6+VlY3v4ONTHK5n/4UKEVtCtUhLHcYlznHJtc
 BfS/zWIZyHOg9AxSkPTGc2UAcSM8V2uAlAprYP0HMkZxkO6cf7Wtg0uFIlxuVXk/8bNlmTqPJ
 b16dS7nHumju55aSUSKDuBeM4x+aIPGper2nuStFVCbj8M2Pd0ZXyE9GPhMzqiKshdDSbFdpF
 yhUblqaJm7P1P3utwh9934wlrYmlD40De3pwM8iVikfzxk8/A2LlC20WxFoFPAOLFPcbRd3NP
 TdW1b2RmLbBpp8owrGGmOgRxbUBAKOqniFxg/Pb2h5hBrOLifF213dA7gJdvQ1lWjl5EnrJKQ
 jsEaJxWe9PlPJKPcay3gSOc9QElOxTyccfwn2lDbRn2uoOBY69EcwICnVEwTx/fenRmcyDabl
 Xz8M4XJVKikzdg+YYEYymkher2mqlq0IKXTj/U2ZLvKMsFrfwn4G8J+HuDuU9F1C/vL+lNgEo
 ohVgT3gmaZCnRJODpEz7HuqyK82T2uieuWwDRw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the new helper that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together.

this driver deserves a bit more cleanup, to get rid of the global
variable giu_base, which makes it single-instance-only.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpio/gpio-vr41xx.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-vr41xx.c b/drivers/gpio/gpio-vr41xx.c
index b13a49c..98cd715 100644
--- a/drivers/gpio/gpio-vr41xx.c
+++ b/drivers/gpio/gpio-vr41xx.c
@@ -467,10 +467,9 @@ static int vr41xx_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 
 static int giu_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	unsigned int trigger, i, pin;
 	struct irq_chip *chip;
-	int irq, ret;
+	int irq;
 
 	switch (pdev->id) {
 	case GPIO_50PINS_PULLUPDOWN:
@@ -489,21 +488,14 @@ static int giu_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EBUSY;
-
-	giu_base = ioremap(res->start, resource_size(res));
-	if (!giu_base)
-		return -ENOMEM;
+	giu_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(giu_base))
+		return PTR_ERR(giu_base);
 
 	vr41xx_gpio_chip.parent = &pdev->dev;
 
-	ret = gpiochip_add_data(&vr41xx_gpio_chip, NULL);
-	if (!ret) {
-		iounmap(giu_base);
+	if (gpiochip_add_data(&vr41xx_gpio_chip, NULL))
 		return -ENODEV;
-	}
 
 	giu_write(GIUINTENL, 0);
 	giu_write(GIUINTENH, 0);
@@ -534,7 +526,6 @@ static int giu_probe(struct platform_device *pdev)
 static int giu_remove(struct platform_device *pdev)
 {
 	if (giu_base) {
-		iounmap(giu_base);
 		giu_base = NULL;
 	}
 
-- 
1.9.1

