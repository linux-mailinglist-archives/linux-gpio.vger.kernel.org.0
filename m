Return-Path: <linux-gpio+bounces-32362-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M3TGEbtpGngvwUAu9opvQ
	(envelope-from <linux-gpio+bounces-32362-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 02:52:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4C91D25F8
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 02:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8520B3006B6E
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 01:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA47D242D72;
	Mon,  2 Mar 2026 01:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="X+8Tz68w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BD0238159;
	Mon,  2 Mar 2026 01:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772416300; cv=none; b=VjjaI2QpjspqdkqBp2x2xbABGgJ9DbS/8DfXgdl9cNXZt3kAq++10mGJBAggdE8y7PsyFQsrBSQg/pvhvh91yAt/b5LzQb9hd0msxfvJjDZ+WYSI1J2tlzhwshmJe2r7Kkz9S2IuaWRhlUscjy3/rZEbmZ2evy5/Rg310uknpWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772416300; c=relaxed/simple;
	bh=qXSgpmdCfX6GFrIDtEBeOmSoB+zavqryaBubEMoXq8E=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=cNM1T2iFUc8f2QC1KLorvrTJ2VHIfRF6tW9Kjuh+fIxazcB5PXXjoVu432kvSBDwmZu1dI5R8SYgxIFZdOsGXXtg4rVB25jtE+dZBeeA0CQY8lzwhC0r4lkKd3I67lQail7hWPZot1k9UDxCUGjClIN+IAZCq5iBkiwVRc8/SmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=X+8Tz68w; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772416293; bh=fZyLrC2oup488EseAPblsb/9t+IlcNhcGnHWrpeWk+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X+8Tz68wn5Q5Pp7W7N/72fpLU3TOyX1YMUCSMyCm1zP0r25uPuilW9ctRm6t+qPla
	 YwV3tF3TpfbcuxQx5oPZFV7cvIk/1m+zAnxt6iHPjlOvA9K9rsq20uMqyUMtJnsukg
	 XV7cTnv9o6+JkKu7Ow+FYuooht8GQwaPg7lE41jo=
Received: from WIN-B62RPRBL2BM.localdomain ([218.76.62.144])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id C0CB9282; Mon, 02 Mar 2026 09:48:12 +0800
X-QQ-mid: xmsmtpt1772416094t0xi5jq58
Message-ID: <tencent_CF911C5343732C6B9F925B1AAE4B10198C08@qq.com>
X-QQ-XMAILINFO: MKFQA+k1yb/2Kow46lj8WKllpn9Yr4EqZ0nwTozPNwUgwMoIaIZW0IdquQnCrs
	 fOCSa5rp7iXfy1H4PYPHcUH41MhDtALuRvmp304liv0PaH/d49ZYXmsUQC+ROjQPYHljZchId2ze
	 X/XPSE4K3cqCflsbO7ytBp2Ab7FAZBzzITi8L5JYaps1LdOkgG6XYOy3b4hk2f27DWMdjKt9T+SV
	 p5aw3w0yI++94ybkPTaplCaSa6gayRcBD8Tzli+sNgoQ+fBv15wMnunEz402vlMNHNVMLc7MGswE
	 NXmCOo9lRRtwjT6nmRIbg3YXeXtbjxxhIHZRpzOd2TVWWvglxiyE7QZB6zl4plXA5c0w4kEvCHYz
	 /Fr2NTBr4+SDr/kEkPjHM9EhKE7HdxyVJIKIuzK32qzGe3i0PlwO+MRZLcIdIDvBYYf9W6A01pxA
	 KBT+xOKc4zdtggxewaJwoUd5/C89eY8lBK5WPGb1kbpHgQ0N0jT87lGY+qjkcqSrmhMT6/BGlWor
	 KGViGPtCxg79IfOlnyQbZC8sNmIwa6bFxYOP+UQzgCBoOZuzWwhYz+7uIwTyN1NQahqQupHEqAwb
	 5ElvGtUsCwe3WFTkpuIqG9dj9Vfva6rLtTxFvAKueBNEnyXe+G9W8cCHUZctShX6/v1SyQZlDThg
	 BeGzugPYlxB8Gw1d+dwIcVWF4LQobBDMEwRpM8o3yYIPZiUdL4PIwBLkX02VIE932wZd3jmSSb5+
	 mCJucp55I/xOIPr2yie0aVwxPYZR7MZgHoSJaM+QX9GRBBgx54Yr55YiF0EAjkY9efAumAMS+xXQ
	 POcVDDP1EuaahZwDNyiBo8/rWUhn8taNCHHnkPMbiw9o5pupYDguSVbVHvEp5e4cMbremt1NXswo
	 sj0BWkKNpZkaTvactALd3LLu5Cp1nhWyrjDyAgaeWjV8PkJmXkF4yuRaDmz6R+I13PpokjOA/qSd
	 HadZufhOk0eZxvU5bHmKrqAkuUPKSc4VIn4bY3TXCNneQ6y9q+DUcuCJ+9Y7gxwU6WuSLdSZSMXn
	 3/2xq3quZ7UOuJlDcU
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Zhu Ling <1536943441@qq.com>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	chenbaozi@phytium.com.cn,
	Zhu Ling <1536943441@qq.com>
Subject: [PATCH v1 1/4] gpio: phytium: improve core IRQ and wake handling
Date: Mon,  2 Mar 2026 09:48:09 +0800
X-OQ-MSGID: <20260302014812.9649-2-1536943441@qq.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[qq.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32362-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:mid,qq.com:dkim,qq.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF4C91D25F8
X-Rspamd-Action: no action

Refactor the core GPIO IRQ path to better match gpiolib IRQ chip
expectations and suspend/resume behavior.

This updates the core to:
- add IRQ chip print and wake hooks
- handle both single and multi-parent IRQ routing
- fix wake IRQ lookup by checking valid parent IRQs
- use GPIO clear/version macros shared by frontends
- track resume state while restoring IRQ registers

The change also keeps direction/output programming order consistent
with other GPIO controllers.

Signed-off-by: Zhu Ling <1536943441@qq.com>
---
 drivers/gpio/gpio-phytium-core.c | 114 +++++++++++++++++++++++++------
 drivers/gpio/gpio-phytium-core.h |   8 ++-
 2 files changed, 102 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-phytium-core.c b/drivers/gpio/gpio-phytium-core.c
index 7d7695acc..df7755ad7 100644
--- a/drivers/gpio/gpio-phytium-core.c
+++ b/drivers/gpio/gpio-phytium-core.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2019-2023, Phytium Phytium Technology Co., Ltd.
+ * Copyright (c) 2019-2023, Phytium Technology Co., Ltd.
  */
 
 #include <linux/err.h>
@@ -8,11 +8,13 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/bitops.h>
+#include <linux/seq_file.h>
+#include <linux/interrupt.h>
 
 #include "gpio-phytium-core.h"
 
 static int get_pin_location(struct phytium_gpio *gpio, unsigned int offset,
-		     struct pin_loc *pl)
+			    struct pin_loc *pl)
 {
 	int ret;
 
@@ -32,7 +34,7 @@ static int get_pin_location(struct phytium_gpio *gpio, unsigned int offset,
 }
 
 static void phytium_gpio_toggle_trigger(struct phytium_gpio *gpio,
-				 unsigned int offset)
+					unsigned int offset)
 {
 	struct gpio_chip *gc;
 	u32 pol;
@@ -128,14 +130,13 @@ int phytium_gpio_direction_output(struct gpio_chip *gc, unsigned int offset,
 		return -EINVAL;
 	ddr = gpio->regs + GPIO_SWPORTA_DDR + (loc.port * GPIO_PORT_STRIDE);
 
+	phytium_gpio_set(gc, offset, value);
 	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	writel(readl(ddr) | BIT(loc.offset), ddr);
 
 	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
-	phytium_gpio_set(gc, offset, value);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(phytium_gpio_direction_output);
@@ -171,6 +172,8 @@ void phytium_gpio_irq_mask(struct irq_data *d)
 	writel(val, gpio->regs + GPIO_INTMASK);
 
 	raw_spin_unlock(&gpio->lock);
+
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 EXPORT_SYMBOL_GPL(phytium_gpio_irq_mask);
 
@@ -184,6 +187,8 @@ void phytium_gpio_irq_unmask(struct irq_data *d)
 	if (irqd_to_hwirq(d) >= gpio->ngpio[0])
 		return;
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
+
 	raw_spin_lock(&gpio->lock);
 
 	val = readl(gpio->regs + GPIO_INTMASK);
@@ -267,10 +272,14 @@ void phytium_gpio_irq_enable(struct irq_data *d)
 	unsigned long flags;
 	u32 val;
 
+	if (gpio->is_resuming)
+		return;
 	/* Only port A can provide interrupt source */
 	if (irqd_to_hwirq(d) >= gpio->ngpio[0])
 		return;
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
+
 	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	val = readl(gpio->regs + GPIO_INTEN);
@@ -278,6 +287,8 @@ void phytium_gpio_irq_enable(struct irq_data *d)
 	writel(val, gpio->regs + GPIO_INTEN);
 
 	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 EXPORT_SYMBOL_GPL(phytium_gpio_irq_enable);
 
@@ -302,6 +313,14 @@ void phytium_gpio_irq_disable(struct irq_data *d)
 }
 EXPORT_SYMBOL_GPL(phytium_gpio_irq_disable);
 
+void phytium_gpio_irq_print_chip(struct irq_data *data, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+
+	seq_printf(p, dev_name(gc->parent));
+}
+EXPORT_SYMBOL_GPL(phytium_gpio_irq_print_chip);
+
 void phytium_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
@@ -309,19 +328,36 @@ void phytium_gpio_irq_handler(struct irq_desc *desc)
 	struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	unsigned long pending;
 	int offset;
+	int index = -1;
+	unsigned int index_found = 0;
 
 	chained_irq_enter(irqchip, desc);
 
 	pending = readl(gpio->regs + GPIO_INTSTATUS);
+
+	if (gc->irq.num_parents > 1) {
+		for (index = 0 ; index < gc->irq.num_parents; index++) {
+			if (gc->irq.parents[index] == desc->irq_data.irq) {
+				index_found = 1;
+				break;
+			}
+		}
+		if (index_found == 0) {
+			pr_err("Can't find index for this gpio interrupt.\n");
+			index = -1;
+		}
+	}
+
 	if (pending) {
 		for_each_set_bit(offset, &pending, gpio->ngpio[0]) {
-			int gpio_irq = irq_find_mapping(gc->irq.domain,
-							offset);
-			generic_handle_irq(gpio_irq);
-
-			if ((irq_get_trigger_type(gpio_irq) &
-			    IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_EDGE_BOTH)
-				phytium_gpio_toggle_trigger(gpio, offset);
+			if (index == -1 || offset == index) {
+				int gpio_irq = irq_find_mapping(gc->irq.domain,
+						offset);
+				generic_handle_irq(gpio_irq);
+				if ((irq_get_trigger_type(gpio_irq) &
+					IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_EDGE_BOTH)
+					phytium_gpio_toggle_trigger(gpio, offset);
+			}
 		}
 	}
 
@@ -343,13 +379,54 @@ int phytium_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(phytium_gpio_get_direction);
 
-#if CONFIG_SMP
-int
-phytium_gpio_irq_set_affinity(struct irq_data *d, const struct cpumask *mask_val, bool force)
+int phytium_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 {
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct phytium_gpio *gpio = gpiochip_get_data(gc);
+	struct phytium_gpio_ctx *ctx = &gpio->ctx;
+	irq_hw_number_t bit = irqd_to_hwirq(d);
+	unsigned long flags;
+	int ret;
+
+	if (gpio->irq[bit] >= 0)
+		ret = irq_set_irq_wake(gpio->irq[bit], enable);
+	else
+		ret = irq_set_irq_wake(gpio->irq[0], enable);
+
+	if (ret < 0)
+		dev_err(gc->parent, "set gpio irq wake failed!\n");
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	if (enable) {
+		ctx->wake_en |= BIT(bit);
+		if (gpio->is_resuming == 1) {
+			writel(~ctx->wake_en, gpio->regs + GPIO_INTMASK);
+			writel(ctx->wake_en, gpio->regs + GPIO_INTEN);
+		}
+	} else {
+		ctx->wake_en &= ~BIT(bit);
+	}
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(phytium_gpio_irq_set_wake);
+
+int phytium_gpio_irq_set_affinity(struct irq_data *d,
+				  const struct cpumask *mask_val, bool force)
+{
+	int hwirq = irqd_to_hwirq(d);
 	struct gpio_chip *chip_data = irq_data_get_irq_chip_data(d);
-	struct irq_chip *chip = irq_get_chip(chip_data->irq.num_parents);
-	struct irq_data *data = irq_get_irq_data(chip_data->irq.num_parents);
+	struct irq_chip *chip;
+	struct irq_data *data;
+
+	if (chip_data->irq.num_parents == 1)
+		hwirq = 0;
+
+	chip = irq_get_chip(chip_data->irq.parents[hwirq]);
+	data = irq_get_irq_data(chip_data->irq.parents[hwirq]);
 
 	if (chip && chip->irq_set_affinity)
 		return chip->irq_set_affinity(data, mask_val, force);
@@ -357,7 +434,6 @@ phytium_gpio_irq_set_affinity(struct irq_data *d, const struct cpumask *mask_val
 	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(phytium_gpio_irq_set_affinity);
-#endif
 
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Phytium GPIO Controller core");
diff --git a/drivers/gpio/gpio-phytium-core.h b/drivers/gpio/gpio-phytium-core.h
index 5a99e1fd6..bb3f5af26 100644
--- a/drivers/gpio/gpio-phytium-core.h
+++ b/drivers/gpio/gpio-phytium-core.h
@@ -32,6 +32,9 @@
 #define NGPIO_DEFAULT		8
 #define NGPIO_MAX		32
 #define GPIO_PORT_STRIDE	(GPIO_EXT_PORTB - GPIO_EXT_PORTA)
+#define GPIO_CLEAR_IRQ		0xffffffff
+
+#define PHYTIUM_GPIO_DRIVER_VERSION "1.1.2"
 
 struct pin_loc {
 	unsigned int port;
@@ -54,6 +57,7 @@ struct phytium_gpio_ctx {
 	u32 raw_intstatus;
 	u32 ls_sync;
 	u32 debounce;
+	u32 wake_en;
 };
 #endif
 
@@ -61,9 +65,9 @@ struct phytium_gpio {
 	raw_spinlock_t		lock;
 	void __iomem		*regs;
 	struct gpio_chip	gc;
-	struct irq_chip		irq_chip;
 	unsigned int		ngpio[2];
 	int			irq[32];
+	int			is_resuming;
 #ifdef CONFIG_PM_SLEEP
 	struct phytium_gpio_ctx	ctx;
 #endif
@@ -80,8 +84,10 @@ void phytium_gpio_irq_ack(struct irq_data *d);
 void phytium_gpio_irq_mask(struct irq_data *d);
 void phytium_gpio_irq_unmask(struct irq_data *d);
 int phytium_gpio_irq_set_type(struct irq_data *d, unsigned int flow_type);
+void phytium_gpio_irq_print_chip(struct irq_data *data, struct seq_file *p);
 void phytium_gpio_irq_enable(struct irq_data *d);
 void phytium_gpio_irq_disable(struct irq_data *d);
 void phytium_gpio_irq_handler(struct irq_desc *desc);
+int phytium_gpio_irq_set_wake(struct irq_data *d, unsigned int enable);
 int phytium_gpio_irq_set_affinity(struct irq_data *d, const struct cpumask *mask_val, bool force);
 #endif
-- 
2.34.1


