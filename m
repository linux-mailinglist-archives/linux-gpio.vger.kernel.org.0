Return-Path: <linux-gpio+bounces-32359-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ExUQKG3spGmnvwUAu9opvQ
	(envelope-from <linux-gpio+bounces-32359-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 02:48:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C321D25A4
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 02:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 29D06300ACAA
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 01:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3641BCA1C;
	Mon,  2 Mar 2026 01:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="HvAnMDl7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99FD1391;
	Mon,  2 Mar 2026 01:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772416103; cv=none; b=hIrdjs8NL9eCsXccWg8GTe4k8ILYL/alvxrjGWVr1CfcRpoJD05h/+xt81aEOuyLqO3Y/zuLppAWoFYzfYILri31xn34TUPGExGU9Vnn7IzCuSyHZfvHZMPEb5CTVet75xBIVcXjDd7MXbDVOZGtWi0PyqlmMK8/MzfxmKviAZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772416103; c=relaxed/simple;
	bh=8n1KLYzMWDgQnQ59sUmJHkopKbmf+8D0g17hCFzoISI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Look82O2r3p/cN7qeK3BT4nCcCNQ0vcEMbTTMEGTTOi4dE5nzX1MJi/wp3rKHlpfO5L3PkhiSSLvs0joQ05Zn7cGApTPrUWQ6vPuged+SxxHdrg7xC/gVTxKwWbm1e1zlVAH17E9oZetebcrtlWMfiATO2EegrV6qk1BD69Ktcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=HvAnMDl7; arc=none smtp.client-ip=203.205.221.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772416097; bh=eUYvgMab6tEvGgbnkSDjcxjMG9cFaRQqLJKTw+UypQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HvAnMDl7ajV23q324ahv7xJ7IeysHgTQQbjQC4u+ZDO6R1TVoJAEzjFPCbUXhNlhv
	 sORNBCGvpD5u/TZCJLl0uwSZ7ttjdPj2Fm5lX9HCJJJoUUXUfzbiVAeJPQKPhaAse2
	 NBkJKRUZdQnYpTryGdERsTH7DFKbzregDezcRLUY=
Received: from WIN-B62RPRBL2BM.localdomain ([218.76.62.144])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id C0CB9282; Mon, 02 Mar 2026 09:48:12 +0800
X-QQ-mid: xmsmtpt1772416096tgh0o04z6
Message-ID: <tencent_362437351497DC32EC226DA7A4E722D6E609@qq.com>
X-QQ-XMAILINFO: MBHEkxMsYPCYJZ3IpdthRC4qBwnVI0LOk/aH6yyI3kVGRgTgXLJJ2mK81/HH/h
	 XwktK1pikORtgnA8mRy50bDkrm9Hec2dND6fw6gVY7kbM7GtQDMNX6YuhZf8yBEinyZm27otiqrH
	 UOf+4a6pGTyhldU1Fv+rNp/kgDKsSNgp0vffFrT+I6WNXmc+7Bs5xsWgB7pYpt3yxTsRW9iVLC42
	 9aZtQ+EDb1CiDnThz3qikQwXWi/6wWz9ZHOfmSMXVWgQrd3yN1cdvDeRNtTUxKxYkVhsH6gG63sX
	 Uo5BRn+ZpxGogCKqS7noVImEhsRgUk5X5BmY+Ea6uLVaiQXzYga7JzXXQoPyp2bsaYGehq2zAL8y
	 E5cv841A+dmEr60KQMWoPxQHDHyg1YzfTRjM8xYHCrIvOJ4xY2by1d0IwbJ5GgbPPBE16Jp0nZtk
	 HEWJaL6TJ2sRjlu2R31sDBUEt0jxozRoM9nJm/NF48kxvlkfopboMCxDHudsgTTSDlrgLPbQrL7M
	 OxZI5WO/30RDX5n7Ij3CRFy3TKEJrl0N0s7ft6fKVx4yxWT+K83pquV/bcqRuGIdYJKkWY+Mj419
	 hB/Gye2tNarZfILF6LtshJyrtOQ/gCiqOMaYYevXNHTHAEJSIHROrlJJQVttmOSVoKezLwkWwz5Y
	 84UAbes0RQ/D4L2nihJotjmkBEruqz+iCnsEaNIBGox7m9oj0w3aM5SEFRlHBl5Icb1gb/A/msRT
	 RFBwksbFOsP9vmkoPjv1WlEmE0dQDNJm5i2jlz5MgNuCpenj8fOF6NQgaGV4UD0RUTIZ6nkUrAfZ
	 VMH1H6DXl27gMFQA8SBkeEIxzYs2m2sYXnHwbZ36TBPhWqrtxcIY9fldsKdUwIQObEeuNGS11G8n
	 SoN5hpWu3Kc8TZmG8dmeI7pMl1z3GiMMMLUUhDuKvKO9a8w+Ser6ms0TxrdBWjJtI+0cYv2MqHix
	 QUoJI3Sr/eUHtyn/3YY3k3CHfYC/YQggyJAUAUE8FJhsl59E5wikJIxMT0jvGVHC+kw4YAE8Hq8o
	 7DXZmkJPwCRV8JeYZ2
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Zhu Ling <1536943441@qq.com>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	chenbaozi@phytium.com.cn,
	Zhu Ling <1536943441@qq.com>
Subject: [PATCH v1 3/4] gpio: phytium: switch PCI driver to immutable irq_chip
Date: Mon,  2 Mar 2026 09:48:11 +0800
X-OQ-MSGID: <20260302014812.9649-4-1536943441@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302014812.9649-1-1536943441@qq.com>
References: <20260302014812.9649-1-1536943441@qq.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[qq.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32359-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,phytium.com.cn,qq.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1536943441@qq.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:mid,qq.com:dkim,qq.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 38C321D25A4
X-Rspamd-Action: no action

Use a static immutable irq_chip and gpio_irq_chip_set_chip() in the
PCI frontend and align interrupt init/restore flow with the core and
platform driver paths.

Signed-off-by: Zhu Ling <1536943441@qq.com>
---
 drivers/gpio/gpio-phytium-pci.c | 43 ++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-phytium-pci.c b/drivers/gpio/gpio-phytium-pci.c
index a760ad793..73f90c495 100644
--- a/drivers/gpio/gpio-phytium-pci.c
+++ b/drivers/gpio/gpio-phytium-pci.c
@@ -13,6 +13,20 @@
 
 #include "gpio-phytium-core.h"
 
+static const struct irq_chip phytium_gpio_irq_chip = {
+	.irq_ack		= phytium_gpio_irq_ack,
+	.irq_mask		= phytium_gpio_irq_mask,
+	.irq_unmask		= phytium_gpio_irq_unmask,
+	.irq_set_type		= phytium_gpio_irq_set_type,
+	.irq_print_chip		= phytium_gpio_irq_print_chip,
+	.irq_enable		= phytium_gpio_irq_enable,
+	.irq_disable		= phytium_gpio_irq_disable,
+	.irq_set_wake		= phytium_gpio_irq_set_wake,
+	.irq_set_affinity       = phytium_gpio_irq_set_affinity,
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int phytium_gpio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	struct device *dev = &pdev->dev;
@@ -50,23 +64,18 @@ static int phytium_gpio_pci_probe(struct pci_dev *pdev, const struct pci_device_
 	pci_set_master(pdev);
 
 	gpio->irq[0] = pdev->irq;
-	if (gpio->irq < 0)
+	if (gpio->irq[0] < 0)
 		dev_warn(dev, "no irq is found.\n");
 
 	/* There is only one group of Pins at the moment. */
 	gpio->ngpio[0] = NGPIO_MAX;
 
 	/* irq_chip support */
-	gpio->irq_chip.name = dev_name(dev);
-	gpio->irq_chip.irq_ack = phytium_gpio_irq_ack;
-	gpio->irq_chip.irq_mask = phytium_gpio_irq_mask;
-	gpio->irq_chip.irq_unmask = phytium_gpio_irq_unmask;
-	gpio->irq_chip.irq_set_type = phytium_gpio_irq_set_type;
-	gpio->irq_chip.irq_enable = phytium_gpio_irq_enable;
-	gpio->irq_chip.irq_disable = phytium_gpio_irq_disable;
-
 	raw_spin_lock_init(&gpio->lock);
 
+	writel(0, gpio->regs + GPIO_INTEN);
+	writel(GPIO_CLEAR_IRQ, gpio->regs + GPIO_PORTA_EOI);
+
 	gpio->gc.base = -1;
 	gpio->gc.get_direction = phytium_gpio_get_direction;
 	gpio->gc.direction_input = phytium_gpio_direction_input;
@@ -90,14 +99,14 @@ static int phytium_gpio_pci_probe(struct pci_dev *pdev, const struct pci_device_
 	girq->parents[0] = gpio->irq[0];
 	girq->parent_handler = phytium_gpio_irq_handler;
 
-	girq->chip = &gpio->irq_chip;
+	gpio_irq_chip_set_chip(girq, &phytium_gpio_irq_chip);
 
 	err = devm_gpiochip_add_data(dev, &gpio->gc, gpio);
 	if (err)
 		goto out;
 
 	dev_info(dev, "Phytium PCI GPIO controller @%pa registered\n",
-		&gpio->regs);
+		 &pdev->resource[0].start);
 
 	pci_set_drvdata(pdev, gpio);
 
@@ -128,11 +137,14 @@ static int phytium_gpio_pci_suspend(struct device *dev)
 	gpio->ctx.ext_portb = readl(gpio->regs + GPIO_EXT_PORTB);
 
 	gpio->ctx.inten = readl(gpio->regs + GPIO_INTEN);
+	gpio->is_resuming = 1;
 	gpio->ctx.intmask = readl(gpio->regs + GPIO_INTMASK);
 	gpio->ctx.inttype_level = readl(gpio->regs + GPIO_INTTYPE_LEVEL);
 	gpio->ctx.int_polarity = readl(gpio->regs + GPIO_INT_POLARITY);
 	gpio->ctx.debounce = readl(gpio->regs + GPIO_DEBOUNCE);
 
+	writel(~gpio->ctx.wake_en, gpio->regs + GPIO_INTMASK);
+	writel(gpio->ctx.wake_en, gpio->regs + GPIO_INTEN);
 	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return 0;
@@ -153,13 +165,15 @@ static int phytium_gpio_pci_resume(struct device *dev)
 	writel(gpio->ctx.swportb_ddr, gpio->regs + GPIO_SWPORTB_DDR);
 	writel(gpio->ctx.ext_portb, gpio->regs + GPIO_EXT_PORTB);
 
-	writel(gpio->ctx.inten, gpio->regs + GPIO_INTEN);
 	writel(gpio->ctx.intmask, gpio->regs + GPIO_INTMASK);
 	writel(gpio->ctx.inttype_level, gpio->regs + GPIO_INTTYPE_LEVEL);
 	writel(gpio->ctx.int_polarity, gpio->regs + GPIO_INT_POLARITY);
 	writel(gpio->ctx.debounce, gpio->regs + GPIO_DEBOUNCE);
 
-	writel(0xffffffff, gpio->regs + GPIO_PORTA_EOI);
+	writel(GPIO_CLEAR_IRQ, gpio->regs + GPIO_PORTA_EOI);
+
+	writel(gpio->ctx.inten, gpio->regs + GPIO_INTEN);
+	gpio->is_resuming = 0;
 
 	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
@@ -182,6 +196,7 @@ static struct pci_driver phytium_gpio_pci_driver = {
 
 module_pci_driver(phytium_gpio_pci_driver);
 
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Cheng Quan <chengquan@phytium.com.cn>");
 MODULE_DESCRIPTION("Phytium GPIO PCI Driver");
+MODULE_VERSION(PHYTIUM_GPIO_DRIVER_VERSION);
-- 
2.34.1


