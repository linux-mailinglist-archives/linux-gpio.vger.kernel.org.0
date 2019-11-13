Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 544E0FAE24
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 11:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfKMKLH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 05:11:07 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:47438 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbfKMKLH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 05:11:07 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id RNB52100j5USYZQ01NB5ne; Wed, 13 Nov 2019 11:11:06 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iUpc9-0002JV-SH; Wed, 13 Nov 2019 11:11:05 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iUpc9-0007FU-RD; Wed, 13 Nov 2019 11:11:05 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: em: Use platform_get_irq() to obtain interrupts
Date:   Wed, 13 Nov 2019 11:11:03 +0100
Message-Id: <20191113101103.27821-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the platform_get_irq() helper instead of handling resources
directly.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/gpio/gpio-em.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index adc281daacff4896..17a243c528adeaf8 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -269,13 +269,12 @@ static void em_gio_irq_domain_remove(void *data)
 static int em_gio_probe(struct platform_device *pdev)
 {
 	struct em_gio_priv *p;
-	struct resource *irq[2];
 	struct gpio_chip *gpio_chip;
 	struct irq_chip *irq_chip;
 	struct device *dev = &pdev->dev;
 	const char *name = dev_name(dev);
 	unsigned int ngpios;
-	int ret;
+	int irq[2], ret;
 
 	p = devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
 	if (!p)
@@ -285,13 +284,13 @@ static int em_gio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, p);
 	spin_lock_init(&p->sense_lock);
 
-	irq[0] = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	irq[1] = platform_get_resource(pdev, IORESOURCE_IRQ, 1);
+	irq[0] = platform_get_irq(pdev, 0);
+	if (irq[0] < 0)
+		return irq[0];
 
-	if (!irq[0] || !irq[1]) {
-		dev_err(dev, "missing IRQ or IOMEM\n");
-		return -EINVAL;
-	}
+	irq[1] = platform_get_irq(pdev, 1);
+	if (irq[1] < 0)
+		return irq[1];
 
 	p->base0 = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(p->base0))
@@ -342,14 +341,12 @@ static int em_gio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (devm_request_irq(dev, irq[0]->start,
-			     em_gio_irq_handler, 0, name, p)) {
+	if (devm_request_irq(dev, irq[0], em_gio_irq_handler, 0, name, p)) {
 		dev_err(dev, "failed to request low IRQ\n");
 		return -ENOENT;
 	}
 
-	if (devm_request_irq(dev, irq[1]->start,
-			     em_gio_irq_handler, 0, name, p)) {
+	if (devm_request_irq(dev, irq[1], em_gio_irq_handler, 0, name, p)) {
 		dev_err(dev, "failed to request high IRQ\n");
 		return -ENOENT;
 	}
-- 
2.17.1

