Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5EA131C58
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 00:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbgAFX1u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 18:27:50 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:40156 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbgAFX1u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2020 18:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1578353252; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D7hPJSwSfas2UFBSKF1eZM/m/HCalHn/ARkCQLQehwY=;
        b=Xs3Hd7fmEj8f5t1HBMopOn9Zu6DxHVfdLv9D+KHr5a+ldAMtJjT0CX9rxi+CD0ufc1OzV8
        zJ8CaV4q6PIaEddW8PLk3d+v3q3E2DLUzbuiPpz9LQdl3BfbLG0uewBhRIQ8HxjwPmWg3E
        YBH6uy3PO8IOwmrAFxmjQkukBZB7cnI=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 4/5] pinctrl: ingenic: Factorize irq_set_type function
Date:   Tue,  7 Jan 2020 00:27:10 +0100
Message-Id: <20200106232711.559727-5-paul@crapouillou.net>
In-Reply-To: <20200106232711.559727-1-paul@crapouillou.net>
References: <20200106232711.559727-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Simplify the code of the driver's irq_set_type() function by doing some
factorization. The behaviour is unchanged.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 64 ++++++++++++-------------------
 1 file changed, 24 insertions(+), 40 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 7f73f27cce91..419717fc7793 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -1676,58 +1676,42 @@ static void irq_set_type(struct ingenic_gpio_chip *jzgc,
 		u8 offset, unsigned int type)
 {
 	u8 reg1, reg2;
-
-	if (jzgc->jzpc->info->version >= ID_JZ4760) {
-		reg1 = JZ4760_GPIO_PAT1;
-		reg2 = JZ4760_GPIO_PAT0;
-	} else {
-		reg1 = JZ4740_GPIO_TRIG;
-		reg2 = JZ4740_GPIO_DIR;
-	}
+	bool val1, val2;
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
-		if (jzgc->jzpc->info->version >= ID_X1000) {
-			ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, true);
-			ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, true);
-			ingenic_gpio_shadow_set_bit_load(jzgc);
-		} else {
-			ingenic_gpio_set_bit(jzgc, reg2, offset, true);
-			ingenic_gpio_set_bit(jzgc, reg1, offset, true);
-		}
+		val1 = val2 = true;
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
-		if (jzgc->jzpc->info->version >= ID_X1000) {
-			ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, false);
-			ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, true);
-			ingenic_gpio_shadow_set_bit_load(jzgc);
-		} else {
-			ingenic_gpio_set_bit(jzgc, reg2, offset, false);
-			ingenic_gpio_set_bit(jzgc, reg1, offset, true);
-		}
+		val1 = false;
+		val2 = true;
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
-		if (jzgc->jzpc->info->version >= ID_X1000) {
-			ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, true);
-			ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, false);
-			ingenic_gpio_shadow_set_bit_load(jzgc);
-		} else {
-			ingenic_gpio_set_bit(jzgc, reg2, offset, true);
-			ingenic_gpio_set_bit(jzgc, reg1, offset, false);
-		}
+		val1 = true;
+		val2 = false;
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
 	default:
-		if (jzgc->jzpc->info->version >= ID_X1000) {
-			ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, false);
-			ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, false);
-			ingenic_gpio_shadow_set_bit_load(jzgc);
-		} else {
-			ingenic_gpio_set_bit(jzgc, reg2, offset, false);
-			ingenic_gpio_set_bit(jzgc, reg1, offset, false);
-		}
+		val1 = val2 = false;
 		break;
 	}
+
+	if (jzgc->jzpc->info->version >= ID_JZ4760) {
+		reg1 = JZ4760_GPIO_PAT1;
+		reg2 = JZ4760_GPIO_PAT0;
+	} else {
+		reg1 = JZ4740_GPIO_TRIG;
+		reg2 = JZ4740_GPIO_DIR;
+	}
+
+	if (jzgc->jzpc->info->version >= ID_X1000) {
+		ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, val1);
+		ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, val2);
+		ingenic_gpio_shadow_set_bit_load(jzgc);
+	} else {
+		ingenic_gpio_set_bit(jzgc, reg2, offset, val1);
+		ingenic_gpio_set_bit(jzgc, reg1, offset, val2);
+	}
 }
 
 static void ingenic_gpio_irq_mask(struct irq_data *irqd)
-- 
2.24.1

