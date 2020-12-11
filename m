Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC40E2D82BD
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 00:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407153AbgLKXad (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 18:30:33 -0500
Received: from aposti.net ([89.234.176.197]:56430 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407132AbgLKXaJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Dec 2020 18:30:09 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Zhou Yanjie <zhouyanjie@zoho.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/2] pinctrl: ingenic: Rename registers from JZ4760_GPIO_* to JZ4770_GPIO_*
Date:   Fri, 11 Dec 2020 23:28:10 +0000
Message-Id: <20201211232810.261565-2-paul@crapouillou.net>
In-Reply-To: <20201211232810.261565-1-paul@crapouillou.net>
References: <20201211232810.261565-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now that JZ4760 support has been fixed, it looks wrong to have
JZ4760_GPIO_* registers being written if the SoC is a JZ4770 or later.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 54 +++++++++++++++----------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index a7804feb58c7..8b259c67d930 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -38,11 +38,11 @@
 #define JZ4740_GPIO_TRIG	0x70
 #define JZ4740_GPIO_FLAG	0x80
 
-#define JZ4760_GPIO_INT		0x10
-#define JZ4760_GPIO_PAT1	0x30
-#define JZ4760_GPIO_PAT0	0x40
-#define JZ4760_GPIO_FLAG	0x50
-#define JZ4760_GPIO_PEN		0x70
+#define JZ4770_GPIO_INT		0x10
+#define JZ4770_GPIO_PAT1	0x30
+#define JZ4770_GPIO_PAT0	0x40
+#define JZ4770_GPIO_FLAG	0x50
+#define JZ4770_GPIO_PEN		0x70
 
 #define X1830_GPIO_PEL			0x110
 #define X1830_GPIO_PEH			0x120
@@ -1690,7 +1690,7 @@ static void ingenic_gpio_set_value(struct ingenic_gpio_chip *jzgc,
 				   u8 offset, int value)
 {
 	if (jzgc->jzpc->info->version >= ID_JZ4770)
-		ingenic_gpio_set_bit(jzgc, JZ4760_GPIO_PAT0, offset, !!value);
+		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_PAT0, offset, !!value);
 	else
 		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, offset, !!value);
 }
@@ -1720,8 +1720,8 @@ static void irq_set_type(struct ingenic_gpio_chip *jzgc,
 	}
 
 	if (jzgc->jzpc->info->version >= ID_JZ4770) {
-		reg1 = JZ4760_GPIO_PAT1;
-		reg2 = JZ4760_GPIO_PAT0;
+		reg1 = JZ4770_GPIO_PAT1;
+		reg2 = JZ4770_GPIO_PAT0;
 	} else {
 		reg1 = JZ4740_GPIO_TRIG;
 		reg2 = JZ4740_GPIO_DIR;
@@ -1760,7 +1760,7 @@ static void ingenic_gpio_irq_enable(struct irq_data *irqd)
 	int irq = irqd->hwirq;
 
 	if (jzgc->jzpc->info->version >= ID_JZ4770)
-		ingenic_gpio_set_bit(jzgc, JZ4760_GPIO_INT, irq, true);
+		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_INT, irq, true);
 	else
 		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_SELECT, irq, true);
 
@@ -1776,7 +1776,7 @@ static void ingenic_gpio_irq_disable(struct irq_data *irqd)
 	ingenic_gpio_irq_mask(irqd);
 
 	if (jzgc->jzpc->info->version >= ID_JZ4770)
-		ingenic_gpio_set_bit(jzgc, JZ4760_GPIO_INT, irq, false);
+		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_INT, irq, false);
 	else
 		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_SELECT, irq, false);
 }
@@ -1801,7 +1801,7 @@ static void ingenic_gpio_irq_ack(struct irq_data *irqd)
 	}
 
 	if (jzgc->jzpc->info->version >= ID_JZ4770)
-		ingenic_gpio_set_bit(jzgc, JZ4760_GPIO_FLAG, irq, false);
+		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_FLAG, irq, false);
 	else
 		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, irq, true);
 }
@@ -1858,7 +1858,7 @@ static void ingenic_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_enter(irq_chip, desc);
 
 	if (jzgc->jzpc->info->version >= ID_JZ4770)
-		flag = ingenic_gpio_read_reg(jzgc, JZ4760_GPIO_FLAG);
+		flag = ingenic_gpio_read_reg(jzgc, JZ4770_GPIO_FLAG);
 	else
 		flag = ingenic_gpio_read_reg(jzgc, JZ4740_GPIO_FLAG);
 
@@ -1940,8 +1940,8 @@ static int ingenic_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	unsigned int pin = gc->base + offset;
 
 	if (jzpc->info->version >= ID_JZ4770) {
-		if (ingenic_get_pin_config(jzpc, pin, JZ4760_GPIO_INT) ||
-		    ingenic_get_pin_config(jzpc, pin, JZ4760_GPIO_PAT1))
+		if (ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_INT) ||
+		    ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PAT1))
 			return GPIO_LINE_DIRECTION_IN;
 		return GPIO_LINE_DIRECTION_OUT;
 	}
@@ -1992,16 +1992,16 @@ static int ingenic_pinmux_set_pin_fn(struct ingenic_pinctrl *jzpc,
 			'A' + offt, idx, func);
 
 	if (jzpc->info->version >= ID_X1000) {
-		ingenic_shadow_config_pin(jzpc, pin, JZ4760_GPIO_INT, false);
+		ingenic_shadow_config_pin(jzpc, pin, JZ4770_GPIO_INT, false);
 		ingenic_shadow_config_pin(jzpc, pin, GPIO_MSK, false);
-		ingenic_shadow_config_pin(jzpc, pin, JZ4760_GPIO_PAT1, func & 0x2);
-		ingenic_shadow_config_pin(jzpc, pin, JZ4760_GPIO_PAT0, func & 0x1);
+		ingenic_shadow_config_pin(jzpc, pin, JZ4770_GPIO_PAT1, func & 0x2);
+		ingenic_shadow_config_pin(jzpc, pin, JZ4770_GPIO_PAT0, func & 0x1);
 		ingenic_shadow_config_pin_load(jzpc, pin);
 	} else if (jzpc->info->version >= ID_JZ4770) {
-		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_INT, false);
+		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_INT, false);
 		ingenic_config_pin(jzpc, pin, GPIO_MSK, false);
-		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PAT1, func & 0x2);
-		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PAT0, func & 0x1);
+		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PAT1, func & 0x2);
+		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PAT0, func & 0x1);
 	} else {
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_FUNC, true);
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_TRIG, func & 0x2);
@@ -2058,14 +2058,14 @@ static int ingenic_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
 			'A' + offt, idx, input ? "in" : "out");
 
 	if (jzpc->info->version >= ID_X1000) {
-		ingenic_shadow_config_pin(jzpc, pin, JZ4760_GPIO_INT, false);
+		ingenic_shadow_config_pin(jzpc, pin, JZ4770_GPIO_INT, false);
 		ingenic_shadow_config_pin(jzpc, pin, GPIO_MSK, true);
-		ingenic_shadow_config_pin(jzpc, pin, JZ4760_GPIO_PAT1, input);
+		ingenic_shadow_config_pin(jzpc, pin, JZ4770_GPIO_PAT1, input);
 		ingenic_shadow_config_pin_load(jzpc, pin);
 	} else if (jzpc->info->version >= ID_JZ4770) {
-		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_INT, false);
+		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_INT, false);
 		ingenic_config_pin(jzpc, pin, GPIO_MSK, true);
-		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PAT1, input);
+		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PAT1, input);
 	} else {
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_SELECT, false);
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_DIR, !input);
@@ -2093,7 +2093,7 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 	bool pull;
 
 	if (jzpc->info->version >= ID_JZ4770)
-		pull = !ingenic_get_pin_config(jzpc, pin, JZ4760_GPIO_PEN);
+		pull = !ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PEN);
 	else
 		pull = !ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_PULL_DIS);
 
@@ -2143,7 +2143,7 @@ static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
 		}
 
 	} else if (jzpc->info->version >= ID_JZ4770) {
-		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PEN, !bias);
+		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PEN, !bias);
 	} else {
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_PULL_DIS, !bias);
 	}
@@ -2153,7 +2153,7 @@ static void ingenic_set_output_level(struct ingenic_pinctrl *jzpc,
 				     unsigned int pin, bool high)
 {
 	if (jzpc->info->version >= ID_JZ4770)
-		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PAT0, high);
+		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PAT0, high);
 	else
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_DATA, high);
 }
-- 
2.29.2

