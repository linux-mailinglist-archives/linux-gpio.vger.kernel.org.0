Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A8B30596A
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 12:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236462AbhA0LRA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 06:17:00 -0500
Received: from forward101p.mail.yandex.net ([77.88.28.101]:56095 "EHLO
        forward101p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235048AbhA0KsK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Jan 2021 05:48:10 -0500
Received: from iva3-4874dd324817.qloud-c.yandex.net (iva3-4874dd324817.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:49a4:0:640:4874:dd32])
        by forward101p.mail.yandex.net (Yandex) with ESMTP id 9050C32830F7;
        Wed, 27 Jan 2021 13:46:29 +0300 (MSK)
Received: from iva6-2d18925256a6.qloud-c.yandex.net (iva6-2d18925256a6.qloud-c.yandex.net [2a02:6b8:c0c:7594:0:640:2d18:9252])
        by iva3-4874dd324817.qloud-c.yandex.net (mxback/Yandex) with ESMTP id k8eJcl5Y2y-kTGCIS3p;
        Wed, 27 Jan 2021 13:46:29 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1611744389;
        bh=MjRDgxGTiCbkvysV4oEPs6x8SIGM1B5dcgTPZ1aY3Hg=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=DxJtolUZBvHzxGkJokYKrlzSmVHC0e6oR0Re2a/Dp7m4FD/qX9HFZwlmRBj1BQTiH
         Lj9G39msGPaq4uIl4ecXJtZZOKLlAFRrN9M6qn9QLCLS2wHy6Bm2lQB4z2yXg3g1vr
         +HBnOHtekr+DcAEnuiHO5Y/f+9ow0TPCtoRHZ5eo=
Authentication-Results: iva3-4874dd324817.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id AUuDuROonk-kSm8U3AH;
        Wed, 27 Jan 2021 13:46:28 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Maulik Shah <mkshah@codeaurora.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] gpio: ep93xx: Fix single irqchip with multi gpiochips
Date:   Wed, 27 Jan 2021 13:46:10 +0300
Message-Id: <20210127104617.1173-3-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210127104617.1173-1-nikita.shubin@maquefel.me>
References: <20201228150052.2633-1-nikita.shubin@maquefel.me>
 <20210127104617.1173-1-nikita.shubin@maquefel.me>
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
- reworked ep93xx_gpio_port to make it usable before chip_add_data 
  in ep93xx_init_irq_chips

Fixes: a8173820f441 ("gpio: gpiolib: Allow GPIO IRQs to lazy disable")
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 45 ++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 0d0435c07a5a..2eea02c906e0 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -34,9 +34,12 @@
  */
 #define EP93XX_GPIO_F_IRQ_BASE 80
 
+#define EP93XX_GPIO_IRQ_CHIPS_NUM 3
+
 struct ep93xx_gpio {
 	void __iomem		*base;
 	struct gpio_chip	gc[8];
+	struct irq_chip		ic[EP93XX_GPIO_IRQ_CHIPS_NUM];
 };
 
 /*
@@ -55,6 +58,11 @@ static unsigned char gpio_int_type2[3];
 static unsigned char gpio_int_debounce[3];
 
 /* Port ordering is: A B F */
+static const char * const irq_chip_names[] = {
+	"gpio-irq-a",
+	"gpio-irq-b",
+	"gpio-irq-f"
+};
 static const u8 int_type1_register_offset[3]	= { 0x90, 0xac, 0x4c };
 static const u8 int_type2_register_offset[3]	= { 0x94, 0xb0, 0x50 };
 static const u8 eoi_register_offset[3]		= { 0x98, 0xb4, 0x54 };
@@ -77,9 +85,8 @@ static void ep93xx_gpio_update_int_params(struct ep93xx_gpio *epg, unsigned port
 	       epg->base + int_en_register_offset[port]);
 }
 
-static int ep93xx_gpio_port(struct gpio_chip *gc)
+static int ep93xx_gpio_port(struct ep93xx_gpio *epg, struct gpio_chip *gc)
 {
-	struct ep93xx_gpio *epg = gpiochip_get_data(gc);
 	int port = 0;
 
 	while (port < ARRAY_SIZE(epg->gc) && gc != &epg->gc[port])
@@ -101,7 +108,7 @@ static void ep93xx_gpio_int_debounce(struct gpio_chip *gc,
 				     unsigned int offset, bool enable)
 {
 	struct ep93xx_gpio *epg = gpiochip_get_data(gc);
-	int port = ep93xx_gpio_port(gc);
+	int port = ep93xx_gpio_port(epg, gc);
 	int port_mask = BIT(offset);
 
 	if (enable)
@@ -163,7 +170,7 @@ static void ep93xx_gpio_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct ep93xx_gpio *epg = gpiochip_get_data(gc);
-	int port = ep93xx_gpio_port(gc);
+	int port = ep93xx_gpio_port(epg, gc);
 	int port_mask = BIT(d->irq & 7);
 
 	if (irqd_get_trigger_type(d) == IRQ_TYPE_EDGE_BOTH) {
@@ -178,7 +185,7 @@ static void ep93xx_gpio_irq_mask_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct ep93xx_gpio *epg = gpiochip_get_data(gc);
-	int port = ep93xx_gpio_port(gc);
+	int port = ep93xx_gpio_port(epg, gc);
 	int port_mask = BIT(d->irq & 7);
 
 	if (irqd_get_trigger_type(d) == IRQ_TYPE_EDGE_BOTH)
@@ -194,7 +201,7 @@ static void ep93xx_gpio_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct ep93xx_gpio *epg = gpiochip_get_data(gc);
-	int port = ep93xx_gpio_port(gc);
+	int port = ep93xx_gpio_port(epg, gc);
 
 	gpio_int_unmasked[port] &= ~BIT(d->irq & 7);
 	ep93xx_gpio_update_int_params(epg, port);
@@ -204,7 +211,7 @@ static void ep93xx_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct ep93xx_gpio *epg = gpiochip_get_data(gc);
-	int port = ep93xx_gpio_port(gc);
+	int port = ep93xx_gpio_port(epg, gc);
 
 	gpio_int_unmasked[port] |= BIT(d->irq & 7);
 	ep93xx_gpio_update_int_params(epg, port);
@@ -219,7 +226,7 @@ static int ep93xx_gpio_irq_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct ep93xx_gpio *epg = gpiochip_get_data(gc);
-	int port = ep93xx_gpio_port(gc);
+	int port = ep93xx_gpio_port(epg, gc);
 	int offset = d->irq & 7;
 	int port_mask = BIT(offset);
 	irq_flow_handler_t handler;
@@ -335,6 +342,22 @@ static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned offset)
 	return EP93XX_GPIO_F_IRQ_BASE + offset;
 }
 
+static void ep93xx_init_irq_chips(struct ep93xx_gpio *epg)
+{
+	int i;
+
+	for (i = 0; i < EP93XX_GPIO_IRQ_CHIPS_NUM; i++) {
+		struct irq_chip *ic = &epg->ic[i];
+
+		ic->name = irq_chip_names[i];
+		ic->irq_ack = ep93xx_gpio_irq_ack;
+		ic->irq_mask_ack = ep93xx_gpio_irq_mask_ack;
+		ic->irq_mask = ep93xx_gpio_irq_mask;
+		ic->irq_unmask = ep93xx_gpio_irq_unmask;
+		ic->irq_set_type = ep93xx_gpio_irq_type;
+	}
+}
+
 static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
 				struct platform_device *pdev,
 				struct ep93xx_gpio *epg,
@@ -345,6 +368,7 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
 	struct device *dev = &pdev->dev;
 	struct gpio_irq_chip *girq;
 	int err;
+	int port;
 
 	err = bgpio_init(gc, dev, 1, data, NULL, NULL, dir, NULL, 0);
 	if (err)
@@ -356,7 +380,8 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
 	girq = &gc->irq;
 	if (bank->has_irq || bank->has_hierarchical_irq) {
 		gc->set_config = ep93xx_gpio_set_config;
-		girq->chip = &ep93xx_gpio_irq_chip;
+		port = ep93xx_gpio_port(epg, gc);
+		girq->chip = &epg->ic[port];
 	}
 
 	if (bank->has_irq) {
@@ -423,6 +448,8 @@ static int ep93xx_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(epg->base))
 		return PTR_ERR(epg->base);
 
+	ep93xx_init_irq_chips(epg);
+
 	for (i = 0; i < ARRAY_SIZE(ep93xx_gpio_banks); i++) {
 		struct gpio_chip *gc = &epg->gc[i];
 		struct ep93xx_gpio_bank *bank = &ep93xx_gpio_banks[i];
-- 
2.29.2

