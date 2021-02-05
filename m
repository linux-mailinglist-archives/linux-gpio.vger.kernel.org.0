Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE8331063B
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Feb 2021 09:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbhBEIGC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Feb 2021 03:06:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbhBEIGA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2021 03:06:00 -0500
Received: from forward104j.mail.yandex.net (forward104j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0D4C06178A;
        Fri,  5 Feb 2021 00:05:19 -0800 (PST)
Received: from forward103q.mail.yandex.net (forward103q.mail.yandex.net [IPv6:2a02:6b8:c0e:50:0:640:b21c:d009])
        by forward104j.mail.yandex.net (Yandex) with ESMTP id C94ED4A35B2;
        Fri,  5 Feb 2021 11:05:16 +0300 (MSK)
Received: from vla1-7d66b24b62b3.qloud-c.yandex.net (vla1-7d66b24b62b3.qloud-c.yandex.net [IPv6:2a02:6b8:c0d:360d:0:640:7d66:b24b])
        by forward103q.mail.yandex.net (Yandex) with ESMTP id C1BF961E0008;
        Fri,  5 Feb 2021 11:05:16 +0300 (MSK)
Received: from vla1-1bc5b51c612f.qloud-c.yandex.net (vla1-1bc5b51c612f.qloud-c.yandex.net [2a02:6b8:c0d:89c:0:640:1bc5:b51c])
        by vla1-7d66b24b62b3.qloud-c.yandex.net (mxback/Yandex) with ESMTP id ARjQYZbpdq-5GIi5ll7;
        Fri, 05 Feb 2021 11:05:16 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612512316;
        bh=JPTXGO5bMF41hdHAoaK/g/DYbPxZx1DNYfpjY6Od3C0=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=AOisBGI1HVCQ5Szt40XevfiNU724Dz+GXL3JnrIrbTHy93OkzgrpwDsabM1PEhCBv
         TrhSUnHBV0GPHe4arq1cLIU73zV+QgdP88y84Zx6Ot+KfL6wkgcSMdskkGJtkUAAmB
         u5oYzBOS4npyFvl72OYN1ZxxEZ2eowjMaoflgQs4=
Authentication-Results: vla1-7d66b24b62b3.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by vla1-1bc5b51c612f.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 8MWdPhaokU-5Gn8UpBD;
        Fri, 05 Feb 2021 11:05:16 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/7] gpio: gpio-ep93xx: Fix single irqchip with multi gpiochips
Date:   Fri,  5 Feb 2021 11:05:02 +0300
Message-Id: <20210205080507.16007-3-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205080507.16007-1-nikita.shubin@maquefel.me>
References: <20210205080507.16007-1-nikita.shubin@maquefel.me>
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
 drivers/gpio/gpio-ep93xx.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index e3b5e2c37259..3c9f7233e62d 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -38,6 +38,7 @@
 #define EP93XX_GPIO_F_IRQ_BASE 80
 
 struct ep93xx_gpio_irq_chip {
+	struct irq_chip ic;
 	u8 irq_offset;
 	u8 int_unmasked;
 	u8 int_enabled;
@@ -284,9 +285,11 @@ struct ep93xx_gpio_bank {
 	bool		has_irq;
 	bool		has_hierarchical_irq;
 	unsigned int	irq_base;
+	const char	*irq_name;
 };
 
-#define EP93XX_GPIO_BANK(_label, _data, _dir, _irq, _base, _has_irq, _has_hier, _irq_base) \
+#define EP93XX_GPIO_BANK(_label, _data, _dir, _irq, _base, _has_irq, _has_hier, _irq_base, \
+_irq_name) \
 	{							\
 		.label		= _label,			\
 		.data		= _data,			\
@@ -296,20 +299,21 @@ struct ep93xx_gpio_bank {
 		.has_irq	= _has_irq,			\
 		.has_hierarchical_irq = _has_hier,		\
 		.irq_base	= _irq_base,			\
+		.irq_name	= _irq_name,			\
 	}
 
 static struct ep93xx_gpio_bank ep93xx_gpio_banks[] = {
 	/* Bank A has 8 IRQs */
-	EP93XX_GPIO_BANK("A", 0x00, 0x10, 0x90, 0, true, false, 64),
+	EP93XX_GPIO_BANK("A", 0x00, 0x10, 0x90, 0, true, false, 64, "gpio-irq-a"),
 	/* Bank B has 8 IRQs */
-	EP93XX_GPIO_BANK("B", 0x04, 0x14, 0xac, 8, true, false, 72),
-	EP93XX_GPIO_BANK("C", 0x08, 0x18, 0x00, 40, false, false, 0),
-	EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 0x00, 24, false, false, 0),
-	EP93XX_GPIO_BANK("E", 0x20, 0x24, 0x00, 32, false, false, 0),
+	EP93XX_GPIO_BANK("B", 0x04, 0x14, 0xac, 8, true, false, 72, "gpio-irq-b"),
+	EP93XX_GPIO_BANK("C", 0x08, 0x18, 0x00, 40, false, false, 0, 0),
+	EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 0x00, 24, false, false, 0, 0),
+	EP93XX_GPIO_BANK("E", 0x20, 0x24, 0x00, 32, false, false, 0, 0),
 	/* Bank F has 8 IRQs */
-	EP93XX_GPIO_BANK("F", 0x30, 0x34, 0x4c, 16, false, true, 0),
-	EP93XX_GPIO_BANK("G", 0x38, 0x3c, 0x00, 48, false, false, 0),
-	EP93XX_GPIO_BANK("H", 0x40, 0x44, 0x00, 56, false, false, 0),
+	EP93XX_GPIO_BANK("F", 0x30, 0x34, 0x4c, 16, false, true, 0, "gpio-irq-b"),
+	EP93XX_GPIO_BANK("G", 0x38, 0x3c, 0x00, 48, false, false, 0, 0),
+	EP93XX_GPIO_BANK("H", 0x40, 0x44, 0x00, 56, false, false, 0, 0),
 };
 
 static int ep93xx_gpio_set_config(struct gpio_chip *gc, unsigned offset,
@@ -331,6 +335,16 @@ static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned offset)
 	return EP93XX_GPIO_F_IRQ_BASE + offset;
 }
 
+static void ep93xx_init_irq_chip(struct irq_chip *ic, const char *irq_name)
+{
+	ic->name = irq_name;
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
@@ -352,6 +366,8 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 
 	girq = &gc->irq;
 	if (bank->has_irq || bank->has_hierarchical_irq) {
+		struct irq_chip *ic;
+
 		gc->set_config = ep93xx_gpio_set_config;
 		egc->eic = devm_kcalloc(dev, 1,
 					sizeof(*egc->eic),
@@ -359,7 +375,9 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 		if (!egc->eic)
 			return -ENOMEM;
 		egc->eic->irq_offset = bank->irq;
-		girq->chip = &ep93xx_gpio_irq_chip;
+		ic = &egc->eic->ic;
+		ep93xx_init_irq_chip(ic, bank->irq_name);
+		girq->chip = ic;
 	}
 
 	if (bank->has_irq) {
-- 
2.26.2

