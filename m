Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBA523C5A9F
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jul 2021 13:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbhGLKHc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jul 2021 06:07:32 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:18845 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236948AbhGLKHV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jul 2021 06:07:21 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 16C9lbVK099596;
        Mon, 12 Jul 2021 17:47:37 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Jul
 2021 18:03:31 +0800
From:   Steven Lee <steven_lee@aspeedtech.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
CC:     <steven_lee@aspeedtech.com>, <Hongweiz@ami.com>,
        <ryan_chen@aspeedtech.com>, <billy_tsai@aspeedtech.com>
Subject: [PATCH v6 7/9] gpio: gpio-aspeed-sgpio: Move irq_chip to aspeed-sgpio struct
Date:   Mon, 12 Jul 2021 18:03:14 +0800
Message-ID: <20210712100317.23298-8-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210712100317.23298-1-steven_lee@aspeedtech.com>
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 16C9lbVK099596
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The current design initializes irq->chip from a global irqchip struct,
which causes multiple sgpio devices use the same irq_chip.
The patch moves irq_chip to aspeed_sgpio struct for initializing
irq_chip from their private gpio struct.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 9b809c28f842..6b3695197c97 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -29,6 +29,7 @@ struct aspeed_sgpio_pdata {
 
 struct aspeed_sgpio {
 	struct gpio_chip chip;
+	struct irq_chip intc;
 	struct clk *pclk;
 	spinlock_t lock;
 	void __iomem *base;
@@ -403,14 +404,6 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(ic, desc);
 }
 
-static struct irq_chip aspeed_sgpio_irqchip = {
-	.name       = "aspeed-sgpio",
-	.irq_ack    = aspeed_sgpio_irq_ack,
-	.irq_mask   = aspeed_sgpio_irq_mask,
-	.irq_unmask = aspeed_sgpio_irq_unmask,
-	.irq_set_type   = aspeed_sgpio_set_type,
-};
-
 static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 				   struct platform_device *pdev)
 {
@@ -433,8 +426,14 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_status));
 	}
 
+	gpio->intc.name = dev_name(&pdev->dev);
+	gpio->intc.irq_ack = aspeed_sgpio_irq_ack;
+	gpio->intc.irq_mask = aspeed_sgpio_irq_mask;
+	gpio->intc.irq_unmask = aspeed_sgpio_irq_unmask;
+	gpio->intc.irq_set_type = aspeed_sgpio_set_type;
+
 	irq = &gpio->chip.irq;
-	irq->chip = &aspeed_sgpio_irqchip;
+	irq->chip = &gpio->intc;
 	irq->init_valid_mask = aspeed_sgpio_irq_init_valid_mask;
 	irq->handler = handle_bad_irq;
 	irq->default_type = IRQ_TYPE_NONE;
-- 
2.17.1

