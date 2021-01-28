Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF733075E7
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 13:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231697AbhA1MW7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 07:22:59 -0500
Received: from forward100o.mail.yandex.net ([37.140.190.180]:53942 "EHLO
        forward100o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231608AbhA1MW0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 28 Jan 2021 07:22:26 -0500
Received: from sas1-f8c01700c95b.qloud-c.yandex.net (sas1-f8c01700c95b.qloud-c.yandex.net [IPv6:2a02:6b8:c14:39a5:0:640:f8c0:1700])
        by forward100o.mail.yandex.net (Yandex) with ESMTP id 09F6E4AC2169;
        Thu, 28 Jan 2021 15:21:38 +0300 (MSK)
Received: from sas1-27140bb19246.qloud-c.yandex.net (sas1-27140bb19246.qloud-c.yandex.net [2a02:6b8:c08:1803:0:640:2714:bb1])
        by sas1-f8c01700c95b.qloud-c.yandex.net (mxback/Yandex) with ESMTP id LV4tNqI7gB-LbGuAVfI;
        Thu, 28 Jan 2021 15:21:37 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1611836497;
        bh=PoqI9G6G4WSAJWj2ze6FYg4Qf5LrU3S/pSYhCIP5qYM=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=CU/tknFtLeyvAIkAyNM6kFBVG8nlMviWQCKkpYWNefZtRg7hCcxoDBIhuwaJSn4zp
         hdqk9cwUxSksL9u97hZ86VgizQcd8EK0RsukMSb7HvxuPBg5pe7Nu6lM0P+CiUyD8B
         X97VJT2+7E/U7TfHXouxK3J4gCzUKw1Bvfu3nc5M=
Authentication-Results: sas1-f8c01700c95b.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by sas1-27140bb19246.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id dVFT85naok-Lan86iH7;
        Thu, 28 Jan 2021 15:21:37 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/7] gpio: gpio-ep93xx: Fix single irqchip with multi gpiochips
Date:   Thu, 28 Jan 2021 15:21:18 +0300
Message-Id: <20210128122123.25341-3-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128122123.25341-1-nikita.shubin@maquefel.me>
References: <20210128122123.25341-1-nikita.shubin@maquefel.me>
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

Fixes: d2b091961510 ("gpio: ep93xx: Pass irqchip when adding gpiochip")
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
v2->v3
- Added a coma
- changed to fixes commit d2b091961510
---
 drivers/gpio/gpio-ep93xx.c | 45 ++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 0d5a9a90cf48..b990d37da143 100644
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
+	"gpio-irq-f",
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

