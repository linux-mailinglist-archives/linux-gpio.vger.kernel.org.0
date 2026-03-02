Return-Path: <linux-gpio+bounces-32363-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKmqEDrtpGngvwUAu9opvQ
	(envelope-from <linux-gpio+bounces-32363-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 02:51:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3886F1D25EF
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 02:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E05A730060A5
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 01:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC66D274FE8;
	Mon,  2 Mar 2026 01:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Y5U6RvRi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10122242D72;
	Mon,  2 Mar 2026 01:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772416307; cv=none; b=f7Lcu2T3y3UQBg8HMNv8uEbBaZVoDud5BXpk8rcF00y+7oTybLo6oqRrt/SdJ8HcFs+m1i0zgKYmNsdWWeTLe/xSq0Nq+c/QzrVY0Q/hsD+DhJgZzgMUA/dFbUhL3gym9D+VAOsK+wfwgu+WMFmWpL9UvIRkg+1bQknHEl5qkTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772416307; c=relaxed/simple;
	bh=ceW7k2pxRcB/OKjz6uHOAXadA4Pg6fK6iXrE+5pqDdg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=QvpPOjjNY1hUvJbegsF8OWRFm5hxLWrgztsV+37drjL6akcKcp2kpTPAO945cMLYCbf7WLPpYuef120/qV1ZyfA9xrlfBZKSJN4+mKzAcCv3a6bNqrQdEV2YPqEgsHGpIAXADLqS+B/W0cTgLJ+d+n6bzOhUiGTMtRULXQ37dTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Y5U6RvRi; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772416293; bh=YBQN5kqOLVovZ/BXTkxUIZSpnaii9caloRqkGwzP20s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y5U6RvRigQLQKSwlcJFUm7wCKiwJfD8Nw93w56ymCUJ20PejvVsifyE5u64EVWUFh
	 llQEFPQS1wOGt+A8ZluBr4CKOLw5T/dp09Lr1w+8/AMEoWPdXBjr62zE7UyXxWxcRx
	 RStpn9JRMd0dwxHUdYDNWfhp/PkdVF5XGJQ9xmzI=
Received: from WIN-B62RPRBL2BM.localdomain ([218.76.62.144])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id C0CB9282; Mon, 02 Mar 2026 09:48:12 +0800
X-QQ-mid: xmsmtpt1772416095t1f9sgjzx
Message-ID: <tencent_4668247735FC9754324C22C7A6BEE78AD609@qq.com>
X-QQ-XMAILINFO: NDitEPzmrU8G0PJ4INinzsN0D8P0y4kM48WPUwy0OWn8NTtRIyL70P7tegmJ5w
	 BpWaOD0/ke/ysrE6LsWLH+lA4Nr4QQzaG1J/eXlGlSR+hSSKrPi+ycROQIWdkkAVn5UiQuz1f7e6
	 MA03k1QpGKtpPsHUKTgARgyruf5xvUE/1gHtYJ+EKUm9TK2BnqxDyJf0cO9klW0yqjQ3CI68Ln1H
	 MQ8JLLYPHc8vXmMLkDPrdpxrMSG71mcw3RyEcP9JsN18nvSSG4Lmra7/iB1AieNgdlCLV6a2OA4s
	 sOmQo9zWctn3788yHoaorUXIgGvnjVbACCz2Ykxf8gmlW5/IeDDGr9RIjJqcCvLp5++Q8fRbDdvo
	 n6FZobdZRguqlus5PuDNcU03QoaO3wlXnqt6falnUEJF/WLv5dLOiVcnj+vtLxWh9bhEaZWogs7L
	 Te4H4E/1zv1S1wfz8JsJW+1JW6hnBP6JtnhVaBtla3ZxAoX2ktmHIG3uwZsIzkAds0X6ThN8hCKX
	 TxsJw70X5ZHq7pA7zrARLBPQm929LMryKIb5/ztUGDXnJkZ0kIIY1eCHc9HO2F3kkGEVwVxauetM
	 UsGKorM+RGo4c+48A0g+L9o1Wt+Tu6S7AIXbOPxSEkEz9qscSYBRt7xCLFv97VtBowgUgwx1Kpjm
	 95NhpohQvV1Z4Ybc+o6gSt8+k43R4+WqB4lBqBaDlwM0tcJEjiWSN5hy98ljtZ4NGuo6fOeYy3J+
	 viqxQOOgNHwVdRAVfqxky0gUONd4Y3JdqxQqoSdbh5HTD6Cwsga5Bo3GrKK9/zmMybY/pE9hm9uN
	 It3l4ms7+49aS2ETAMoo95zVqTchkcGLpfA7IwVGAy/KFTwQa9A2rxUQw5F85camm3F/335A2vMu
	 TgcCKw5D2ydTHopSDWc0NvIIDyPG+RBLeZhpx4HX5EGFtWPunn+APl41BL3YOQ3Z9Kl3DguDEaLk
	 KQtvcW4aA4GG8NEjKo//3jkxJ4LuTztbFwtmfZzZ8lXLWI/5Iib6VxQsgr2sc9USZ2ch4DbPQW4r
	 2SzomtjGSVNX3zr6ql
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Zhu Ling <1536943441@qq.com>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	chenbaozi@phytium.com.cn,
	Zhu Ling <1536943441@qq.com>
Subject: [PATCH v1 2/4] gpio: phytium: switch platform driver to immutable irq_chip
Date: Mon,  2 Mar 2026 09:48:10 +0800
X-OQ-MSGID: <20260302014812.9649-3-1536943441@qq.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[qq.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32363-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:mid,qq.com:dkim,qq.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3886F1D25EF
X-Rspamd-Action: no action

Use a static immutable irq_chip and gpio_irq_chip_set_chip() in the
platform frontend.

Also initialize and restore interrupt state more explicitly for suspend
and resume, and accept both ngpios and nr-gpios child properties when
probing GPIO ports.

Signed-off-by: Zhu Ling <1536943441@qq.com>
---
 drivers/gpio/gpio-phytium-platform.c | 55 ++++++++++++++++++----------
 1 file changed, 35 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-phytium-platform.c b/drivers/gpio/gpio-phytium-platform.c
index 4925b45c9..182b6480c 100644
--- a/drivers/gpio/gpio-phytium-platform.c
+++ b/drivers/gpio/gpio-phytium-platform.c
@@ -2,7 +2,7 @@
 /*
  * Support functions for Phytium GPIO
  *
- * Copyright (c) 2019-2023, Phytium Phytium Technology Co., Ltd.
+ * Copyright (c) 2019-2023, Phytium Technology Co., Ltd.
  *
  * Derived from drivers/gpio/gpio-pl061.c
  *   Copyright (C) 2008, 2009 Provigent Ltd.
@@ -33,6 +33,20 @@ static const struct acpi_device_id phytium_gpio_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, phytium_gpio_acpi_match);
 
+static const struct irq_chip phytium_gpio_irq_chip = {
+	.irq_ack		= phytium_gpio_irq_ack,
+	.irq_mask		= phytium_gpio_irq_mask,
+	.irq_unmask		= phytium_gpio_irq_unmask,
+	.irq_set_type		= phytium_gpio_irq_set_type,
+	.irq_print_chip		= phytium_gpio_irq_print_chip,
+	.irq_enable		= phytium_gpio_irq_enable,
+	.irq_disable		= phytium_gpio_irq_disable,
+	.irq_set_wake		= phytium_gpio_irq_set_wake,
+	.irq_set_affinity	= phytium_gpio_irq_set_affinity,
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int phytium_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -64,8 +78,10 @@ static int phytium_gpio_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 
-		if (fwnode_property_read_u32(fwnode, "ngpios",
-					     &gpio->ngpio[idx])) {
+		if ((fwnode_property_read_u32(fwnode, "ngpios",
+					      &gpio->ngpio[idx])) &&
+		    (fwnode_property_read_u32(fwnode, "nr-gpios",
+					      &gpio->ngpio[idx]))) {
 			dev_info(dev,
 				 "failed to get number of gpios for Port%c\n",
 				 idx ? 'B' : 'A');
@@ -74,18 +90,11 @@ static int phytium_gpio_probe(struct platform_device *pdev)
 	}
 
 	/* irq_chip support */
-	gpio->irq_chip.name = dev_name(dev);
-	gpio->irq_chip.irq_ack = phytium_gpio_irq_ack;
-	gpio->irq_chip.irq_mask = phytium_gpio_irq_mask;
-	gpio->irq_chip.irq_unmask = phytium_gpio_irq_unmask;
-	gpio->irq_chip.irq_set_type = phytium_gpio_irq_set_type;
-	gpio->irq_chip.irq_enable = phytium_gpio_irq_enable;
-	gpio->irq_chip.irq_disable = phytium_gpio_irq_disable;
-#ifdef CONFIG_SMP
-	gpio->irq_chip.irq_set_affinity = phytium_gpio_irq_set_affinity;
-#endif
 	raw_spin_lock_init(&gpio->lock);
 
+	writel(0, gpio->regs + GPIO_INTEN);
+	writel(GPIO_CLEAR_IRQ, gpio->regs + GPIO_PORTA_EOI);
+
 	gpio->gc.base = -1;
 	gpio->gc.get_direction = phytium_gpio_get_direction;
 	gpio->gc.direction_input = phytium_gpio_direction_input;
@@ -101,20 +110,20 @@ static int phytium_gpio_probe(struct platform_device *pdev)
 	girq->handler = handle_bad_irq;
 	girq->default_type = IRQ_TYPE_NONE;
 
-	for (irq_count = 0; irq_count < gpio->ngpio[0]; irq_count++) {
+	for (irq_count = 0; irq_count < platform_irq_count(pdev); irq_count++) {
 		gpio->irq[irq_count] = -ENXIO;
 		gpio->irq[irq_count] = platform_get_irq(pdev, irq_count);
 		if (gpio->irq[irq_count] < 0) {
 			dev_warn(dev, "no irq is found.\n");
 			break;
 		}
-	};
+	}
 
 	girq->num_parents = irq_count;
 	girq->parents = gpio->irq;
 	girq->parent_handler = phytium_gpio_irq_handler;
 
-	girq->chip = &gpio->irq_chip;
+	gpio_irq_chip_set_chip(girq, &phytium_gpio_irq_chip);
 
 	err = devm_gpiochip_add_data(dev, &gpio->gc, gpio);
 	if (err)
@@ -122,7 +131,7 @@ static int phytium_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, gpio);
 	dev_info(dev, "Phytium GPIO controller @%pa registered\n",
-		&res->start);
+		 &res->start);
 
 	return 0;
 }
@@ -144,11 +153,14 @@ static int phytium_gpio_suspend(struct device *dev)
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
@@ -169,13 +181,15 @@ static int phytium_gpio_resume(struct device *dev)
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
 
@@ -198,6 +212,7 @@ static struct platform_driver phytium_gpio_driver = {
 
 module_platform_driver(phytium_gpio_driver);
 
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Chen Baozi <chenbaozi@phytium.com.cn>");
 MODULE_DESCRIPTION("Phytium GPIO driver");
+MODULE_VERSION(PHYTIUM_GPIO_DRIVER_VERSION);
-- 
2.34.1


