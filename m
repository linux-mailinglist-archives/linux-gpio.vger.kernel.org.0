Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 478011B4142
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 12:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732028AbgDVKvH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 06:51:07 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:57722 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbgDVKLX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Apr 2020 06:11:23 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 66CD83C057F;
        Wed, 22 Apr 2020 12:11:21 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OiO67EY15uNg; Wed, 22 Apr 2020 12:11:15 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id EA02B3C004C;
        Wed, 22 Apr 2020 12:11:15 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.60) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 22 Apr
 2020 12:11:15 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     <linux-renesas-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Yusuke Ashiduka <ashiduka@fujitsu.com>,
        Torii Kenichi <torii.ken1@jp.fujitsu.com>,
        Fukui Yohhei <yohhei.fukui@denso-ten.com>,
        Yasushi Asano <yasano@jp.adit-jv.com>,
        Yuichi Kusakabe <yuichi.kusakabe@denso-ten.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: [RFC PATCH 2/3] gpio: rcar: Add support for GPIO alternative interrupt
Date:   Wed, 22 Apr 2020 12:10:25 +0200
Message-ID: <20200422101026.9220-3-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200422101026.9220-1-erosca@de.adit-jv.com>
References: <20200422101026.9220-1-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.72.94.60]
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Torii Kenichi <torii.ken1@jp.fujitsu.com>

INTC-AP accepts both GPIO interrupt and GPIO alternative interrupt,
but INTC-RT can only handle GPIO interrupt, as depicted in below excerpt
from 'Figure 7.1 GPIO Block Configuration (1)' of
'R-Car3 HW User's Manual Rev.2.00, Jul 2019':

  +------------------------------+
  | Interrupt  display register  +----> GPIO.ch*  (to INTC-AP, INTC-RT)
  |           (INTDTn)           +----> GPIO.ch*A (to INTC-AP)
  +------------------------------+

It seems to be also the case for earlier Renesas SoCs like RZ/G,
as per 'Figure 6.1 GPIO Block Configuration' in
'RZ/G Series User’s Manual: Hardware Rev.1.00 Sep 2016' [1].

To reduce the interference between RT domain (CR7/SH) and the AP domain
(Cortex A5x) and to independently control GPIO interrupts in these two
domains, add support for processing GPIO alternative interrupts in AP.

This allows handling normal GPIO interrupts exclusively by INTC-RT.
The change is DT-driven and depends on the enablement of the
'use-alternative-interrupt' DTS property.

One caveat is that the 'interrupts' property update must go hand in hand
with the newly added 'use-alternative-interrupt' property.

[1] https://www.renesas.com/eu/en/products/microcontrollers-microprocessors/rz/rzg/rzg1m.html#documents

Signed-off-by: Torii Kenichi <torii.ken1@jp.fujitsu.com>
[erosca: enrich commit description]
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 drivers/gpio/gpio-rcar.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 7284473c9fe3..6bbab447bba8 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -43,6 +43,8 @@ struct gpio_rcar_priv {
 	bool has_outdtsel;
 	bool has_both_edge_trigger;
 	struct gpio_rcar_bank_info bank_info;
+	int intmsk;
+	int mskclr;
 };
 
 #define IOINTSEL 0x00	/* General IO/Interrupt Switching Register */
@@ -56,6 +58,8 @@ struct gpio_rcar_priv {
 #define POSNEG 0x20	/* Positive/Negative Logic Select Register */
 #define EDGLEVEL 0x24	/* Edge/level Select Register */
 #define FILONOFF 0x28	/* Chattering Prevention On/Off Register */
+#define INTMSKS 0x38	/* Interrupt Sub Mask Register */
+#define MSKCLRS 0x3c	/* Interrupt Sub Mask Clear Register */
 #define OUTDTSEL 0x40	/* Output Data Select Register */
 #define BOTHEDGE 0x4c	/* One Edge/Both Edge Select Register */
 
@@ -90,7 +94,7 @@ static void gpio_rcar_irq_disable(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct gpio_rcar_priv *p = gpiochip_get_data(gc);
 
-	gpio_rcar_write(p, INTMSK, ~BIT(irqd_to_hwirq(d)));
+	gpio_rcar_write(p, p->intmsk, ~BIT(irqd_to_hwirq(d)));
 }
 
 static void gpio_rcar_irq_enable(struct irq_data *d)
@@ -98,7 +102,7 @@ static void gpio_rcar_irq_enable(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct gpio_rcar_priv *p = gpiochip_get_data(gc);
 
-	gpio_rcar_write(p, MSKCLR, BIT(irqd_to_hwirq(d)));
+	gpio_rcar_write(p, p->mskclr, BIT(irqd_to_hwirq(d)));
 }
 
 static void gpio_rcar_config_interrupt_input_mode(struct gpio_rcar_priv *p,
@@ -203,7 +207,7 @@ static irqreturn_t gpio_rcar_irq_handler(int irq, void *dev_id)
 	unsigned int offset, irqs_handled = 0;
 
 	while ((pending = gpio_rcar_read(p, INTDT) &
-			  gpio_rcar_read(p, INTMSK))) {
+			  gpio_rcar_read(p, p->intmsk))) {
 		offset = __ffs(pending);
 		gpio_rcar_write(p, INTCLR, BIT(offset));
 		generic_handle_irq(irq_find_mapping(p->gpio_chip.irq.domain,
@@ -427,6 +431,14 @@ static int gpio_rcar_parse_dt(struct gpio_rcar_priv *p, unsigned int *npins)
 		*npins = RCAR_MAX_GPIO_PER_BANK;
 	}
 
+	if (of_get_property(np, "use-alternative-interrupt", NULL)) {
+		p->intmsk = INTMSKS;
+		p->mskclr = MSKCLRS;
+	} else {
+		p->intmsk = INTMSK;
+		p->mskclr = MSKCLR;
+	}
+
 	return 0;
 }
 
@@ -544,7 +556,7 @@ static int gpio_rcar_suspend(struct device *dev)
 	p->bank_info.iointsel = gpio_rcar_read(p, IOINTSEL);
 	p->bank_info.inoutsel = gpio_rcar_read(p, INOUTSEL);
 	p->bank_info.outdt = gpio_rcar_read(p, OUTDT);
-	p->bank_info.intmsk = gpio_rcar_read(p, INTMSK);
+	p->bank_info.intmsk = gpio_rcar_read(p, p->intmsk);
 	p->bank_info.posneg = gpio_rcar_read(p, POSNEG);
 	p->bank_info.edglevel = gpio_rcar_read(p, EDGLEVEL);
 	if (p->has_both_edge_trigger)
@@ -586,7 +598,7 @@ static int gpio_rcar_resume(struct device *dev)
 				!!(p->bank_info.bothedge & mask));
 
 			if (p->bank_info.intmsk & mask)
-				gpio_rcar_write(p, MSKCLR, mask);
+				gpio_rcar_write(p, p->mskclr, mask);
 		}
 	}
 
-- 
2.26.0

