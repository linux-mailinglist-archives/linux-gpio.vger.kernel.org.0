Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42F28464119
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Nov 2021 23:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344775AbhK3WNM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Nov 2021 17:13:12 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:38650 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344672AbhK3WMU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Nov 2021 17:12:20 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 9B22ACE1CB3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 22:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8881DC53FCC;
        Tue, 30 Nov 2021 22:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638310133;
        bh=eHxGQRZA8SnJr+v/Ptp4jOeJXBUt2PqdBQ6hMDC8uV4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V/zJvmfkgfBRqMOTJQspTCITqMf75oV1dY3RlBRPBoQBQ2s40HvudQWOhaeyj9rsX
         FhNjJKp3X/99bx0YAwWWXp8MAwNgfbSIX5nv+ExAnTsUSMC5KgBOx820h4Yi2pbNrj
         4UcWqVlHeyeg8bmvXGt2Hob50i7DPezCTntt4k+6I9jRdQaYjJRlKWq+lXU7O9fQ1t
         OMjb2QP4OL1A0dxcriRvGk4foOMfW1dujGG1ePMioMJSZ2tkN7FQVzlJdITa7S9imJ
         zhWY88xCl8kpaJ2oZgS0+m0Ve2InGU8gpcES8d7uJQcRb5exNhxi1RapsAyOcVSNJm
         ffIAwGogzjXIw==
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-gpio@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 4/5] gpio: ml-ioh: Use BIT() to match gpio-pch.c
Date:   Tue, 30 Nov 2021 16:08:40 -0600
Message-Id: <20211130220841.2776562-5-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130220841.2776562-1-helgaas@kernel.org>
References: <20211130220841.2776562-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bjorn Helgaas <bhelgaas@google.com>

The ML IOH driver is very similar to the PCH driver.  To make it more
similar, replace "1 << nr" with "BIT(nr)".  No functional change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/gpio/gpio-ml-ioh.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 4e9528dd1152..0fb9c8bc9b2d 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -98,9 +98,9 @@ static void ioh_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
 	spin_lock_irqsave(&chip->spinlock, flags);
 	reg_val = ioread32(&chip->reg->regs[chip->ch].po);
 	if (val)
-		reg_val |= (1 << nr);
+		reg_val |= BIT(nr);
 	else
-		reg_val &= ~(1 << nr);
+		reg_val &= ~BIT(nr);
 
 	iowrite32(reg_val, &chip->reg->regs[chip->ch].po);
 	spin_unlock_irqrestore(&chip->spinlock, flags);
@@ -110,7 +110,7 @@ static int ioh_gpio_get(struct gpio_chip *gpio, unsigned nr)
 {
 	struct ioh_gpio *chip =	gpiochip_get_data(gpio);
 
-	return !!(ioread32(&chip->reg->regs[chip->ch].pi) & (1 << nr));
+	return !!(ioread32(&chip->reg->regs[chip->ch].pi) & BIT(nr));
 }
 
 static int ioh_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
@@ -123,15 +123,15 @@ static int ioh_gpio_direction_output(struct gpio_chip *gpio, unsigned nr,
 
 	spin_lock_irqsave(&chip->spinlock, flags);
 	pm = ioread32(&chip->reg->regs[chip->ch].pm) &
-					((1 << num_ports[chip->ch]) - 1);
-	pm |= (1 << nr);
+					(BIT(num_ports[chip->ch]) - 1);
+	pm |= BIT(nr);
 	iowrite32(pm, &chip->reg->regs[chip->ch].pm);
 
 	reg_val = ioread32(&chip->reg->regs[chip->ch].po);
 	if (val)
-		reg_val |= (1 << nr);
+		reg_val |= BIT(nr);
 	else
-		reg_val &= ~(1 << nr);
+		reg_val &= ~BIT(nr);
 	iowrite32(reg_val, &chip->reg->regs[chip->ch].po);
 
 	spin_unlock_irqrestore(&chip->spinlock, flags);
@@ -147,8 +147,8 @@ static int ioh_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 
 	spin_lock_irqsave(&chip->spinlock, flags);
 	pm = ioread32(&chip->reg->regs[chip->ch].pm) &
-				((1 << num_ports[chip->ch]) - 1);
-	pm &= ~(1 << nr);
+				(BIT(num_ports[chip->ch]) - 1);
+	pm &= ~BIT(nr);
 	iowrite32(pm, &chip->reg->regs[chip->ch].pm);
 	spin_unlock_irqrestore(&chip->spinlock, flags);
 
@@ -304,7 +304,7 @@ static void ioh_irq_unmask(struct irq_data *d)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct ioh_gpio *chip = gc->private;
 
-	iowrite32(1 << (d->irq - chip->irq_base),
+	iowrite32(BIT(d->irq - chip->irq_base),
 		  &chip->reg->regs[chip->ch].imaskclr);
 }
 
@@ -313,7 +313,7 @@ static void ioh_irq_mask(struct irq_data *d)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct ioh_gpio *chip = gc->private;
 
-	iowrite32(1 << (d->irq - chip->irq_base),
+	iowrite32(BIT(d->irq - chip->irq_base),
 		  &chip->reg->regs[chip->ch].imask);
 }
 
@@ -326,7 +326,7 @@ static void ioh_irq_disable(struct irq_data *d)
 
 	spin_lock_irqsave(&chip->spinlock, flags);
 	ien = ioread32(&chip->reg->regs[chip->ch].ien);
-	ien &= ~(1 << (d->irq - chip->irq_base));
+	ien &= ~BIT(d->irq - chip->irq_base);
 	iowrite32(ien, &chip->reg->regs[chip->ch].ien);
 	spin_unlock_irqrestore(&chip->spinlock, flags);
 }
@@ -340,7 +340,7 @@ static void ioh_irq_enable(struct irq_data *d)
 
 	spin_lock_irqsave(&chip->spinlock, flags);
 	ien = ioread32(&chip->reg->regs[chip->ch].ien);
-	ien |= 1 << (d->irq - chip->irq_base);
+	ien |= BIT(d->irq - chip->irq_base);
 	iowrite32(ien, &chip->reg->regs[chip->ch].ien);
 	spin_unlock_irqrestore(&chip->spinlock, flags);
 }
-- 
2.25.1

