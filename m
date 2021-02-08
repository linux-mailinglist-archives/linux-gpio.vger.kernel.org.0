Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F07ED312CC0
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 10:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbhBHJH5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 04:07:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbhBHJAr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 04:00:47 -0500
Received: from forward105p.mail.yandex.net (forward105p.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8460AC061793;
        Mon,  8 Feb 2021 01:00:06 -0800 (PST)
Received: from iva5-76c5c16f2a53.qloud-c.yandex.net (iva5-76c5c16f2a53.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:7bae:0:640:76c5:c16f])
        by forward105p.mail.yandex.net (Yandex) with ESMTP id 39B8C4D414C9;
        Mon,  8 Feb 2021 12:00:03 +0300 (MSK)
Received: from iva5-057a0d1fbbd8.qloud-c.yandex.net (iva5-057a0d1fbbd8.qloud-c.yandex.net [2a02:6b8:c0c:7f1c:0:640:57a:d1f])
        by iva5-76c5c16f2a53.qloud-c.yandex.net (mxback/Yandex) with ESMTP id i4xTMfrdzM-03Fe1nL4;
        Mon, 08 Feb 2021 12:00:03 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612774803;
        bh=hL8ZeV5eLJIrhOvSQrkOi9a1wUhtufNHtLYHQ8+odNU=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=FVyPm3t6s4vo8UCqiSBkTaJcxvrm+gb8OIkunbkJOaFwTIjFLeGpGO92CNV05mPJp
         CmruEefOZwr7H2XtYEvde+nBgompTLn3x4cDBfLceH4m+ij3/EmatOWi5iCo+f88ql
         5AMNcDkNPYPSp+kp5kk4EUUjx8y6/Sbx7R+E+H0U=
Authentication-Results: iva5-76c5c16f2a53.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva5-057a0d1fbbd8.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id N9nOuejTfy-02JmCtwL;
        Mon, 08 Feb 2021 12:00:02 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/7] gpio: ep93xx: Fix single irqchip with multi gpiochips
Date:   Mon,  8 Feb 2021 11:59:49 +0300
Message-Id: <20210208085954.30050-3-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208085954.30050-1-nikita.shubin@maquefel.me>
References: <20210208085954.30050-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fixes the following warnings which results in interrupts disabled on
port B/F:

gpio gpiochip1: (B): detected irqchip that is shared with multiple gpiochips: please fix the driver.
gpio gpiochip5: (F): detected irqchip that is shared with multiple gpiochips: please fix the driver.

- added separate irqchip for each interrupt capable gpiochip
- provided unique names for each irqchip

Fixes: d2b091961510 ("gpio: ep93xx: Pass irqchip when adding gpiochip")
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
v4->v5:
- generate IRQ chip's names dynamicaly from label
---
 drivers/gpio/gpio-ep93xx.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 64d6c2b4282e..3d8eb8769470 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -38,6 +38,7 @@
 #define EP93XX_GPIO_F_IRQ_BASE 80
 
 struct ep93xx_gpio_irq_chip {
+	struct irq_chip ic;
 	u8 irq_offset;
 	u8 int_unmasked;
 	u8 int_enabled;
@@ -331,6 +332,16 @@ static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned offset)
 	return EP93XX_GPIO_F_IRQ_BASE + offset;
 }
 
+static void ep93xx_init_irq_chip(struct device *dev, struct irq_chip *ic, const char *label)
+{
+	ic->name = devm_kasprintf(dev, GFP_KERNEL, "gpio-irq-%s", label);
+	ic->irq_ack = ep93xx_gpio_irq_ack;
+	ic->irq_mask_ack = ep93xx_gpio_irq_mask_ack;
+	ic->irq_mask = ep93xx_gpio_irq_mask;
+	ic->irq_unmask = ep93xx_gpio_irq_unmask;
+	ic->irq_set_type = ep93xx_gpio_irq_type;
+}
+
 static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 				struct platform_device *pdev,
 				struct ep93xx_gpio *epg,
@@ -352,6 +363,8 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 
 	girq = &gc->irq;
 	if (bank->has_irq || bank->has_hierarchical_irq) {
+		struct irq_chip *ic;
+
 		gc->set_config = ep93xx_gpio_set_config;
 		egc->eic = devm_kcalloc(dev, 1,
 					sizeof(*egc->eic),
@@ -359,7 +372,9 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 		if (!egc->eic)
 			return -ENOMEM;
 		egc->eic->irq_offset = bank->irq;
-		girq->chip = &ep93xx_gpio_irq_chip;
+		ic = &egc->eic->ic;
+		ep93xx_init_irq_chip(dev, ic, bank->label);
+		girq->chip = ic;
 	}
 
 	if (bank->has_irq) {
-- 
2.26.2

