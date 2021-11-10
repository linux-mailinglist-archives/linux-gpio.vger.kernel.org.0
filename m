Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58F8C44CD49
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Nov 2021 23:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234074AbhKJXB2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 18:01:28 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:51486 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234064AbhKJXBX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Nov 2021 18:01:23 -0500
X-IronPort-AV: E=Sophos;i="5.87,225,1631545200"; 
   d="scan'208";a="99834541"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Nov 2021 07:58:34 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E400F400492A;
        Thu, 11 Nov 2021 07:58:31 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH v3 5/7] gpio: gpiolib: Add ngirq member to struct gpio_irq_chip
Date:   Wed, 10 Nov 2021 22:58:06 +0000
Message-Id: <20211110225808.16388-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110225808.16388-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211110225808.16388-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Number of GPIO IRQ's supported by the chip is not always
equal to the number of GPIO pins. For example on Renesas RZ/G2L
SoC where it has GPIO0-122 pins but at a give point a maximum
of only 32 GPIO pins can be used as IRQ lines in the IRQC domain.

This patch adds ngirq member to struct gpio_irq_chip and passes
this as a size to irq_domain_create_hierarchy()/irq_domain_create_simple()
if it is being set in the driver otherwise fallbacks to using ngpio.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpio/gpiolib.c      | 4 ++--
 include/linux/gpio/driver.h | 8 ++++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 30aabef37468..36a8eefe91b9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1185,7 +1185,7 @@ static int gpiochip_hierarchy_add_domain(struct gpio_chip *gc)
 	gc->irq.domain = irq_domain_create_hierarchy(
 		gc->irq.parent_domain,
 		0,
-		gc->ngpio,
+		gc->irq.ngirq ? gc->irq.ngirq : gc->ngpio,
 		gc->irq.fwnode,
 		&gc->irq.child_irq_domain_ops,
 		gc);
@@ -1528,7 +1528,7 @@ static int gpiochip_add_irqchip(struct gpio_chip *gc,
 	} else {
 		/* Some drivers provide custom irqdomain ops */
 		gc->irq.domain = irq_domain_create_simple(fwnode,
-			gc->ngpio,
+			gc->irq.ngirq ? gc->irq.ngirq : gc->ngpio,
 			gc->irq.first,
 			gc->irq.domain_ops ?: &gpiochip_domain_ops,
 			gc);
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a0f9901dcae6..129945bfe3e7 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -51,6 +51,14 @@ struct gpio_irq_chip {
 	 */
 	const struct irq_domain_ops *domain_ops;
 
+	/**
+	 * @ngirq:
+	 *
+	 * The number of GPIO IRQ's handled by this IRQ domain; usually is
+	 * equal to ngpio
+	 */
+	u16 ngirq;
+
 #ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
 	/**
 	 * @fwnode:
-- 
2.17.1

