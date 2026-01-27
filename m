Return-Path: <linux-gpio+bounces-31181-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MANTH2AyeWmNvwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31181-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 22:47:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9E69ACD3
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 22:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CDAB302A554
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 21:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F71632E128;
	Tue, 27 Jan 2026 21:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="oHRqNqF+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AC328A3FA;
	Tue, 27 Jan 2026 21:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769550427; cv=none; b=gLGLCQplJtGbqufbfIiupSpmhiMxghpSDeiddnCCjhIAR+w1TJGhjSY+YeBW5x9GFaZLOENn17nj86ibfr33Gy0RkQNAA3fk+osKKnuIfou9aa16LBK7Qz5aavzE5ydqdgQ8E/v0pCb7sf4ST2H2HoSrUrzo5M47TfeYCAb4Vf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769550427; c=relaxed/simple;
	bh=L374EcJRAc/qEjuY/FVQi+JhFU4/ncCIa2WaXKx/r3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dxQ85bG+AyBG98Ap66bdE7ywViJesF4Jnu8cCXjeOQCqOcCM+dNHZZzcPjIMWliyLiU1VrIV0UJngml15WHL1POPKNDhC/QkhkO3j8X8L6a9h+HUcHwf3+JM+pxbO2WM8MPFzD77eygwu38ucWNsfew7Vlb4N0mHxoEBSKZpakI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=oHRqNqF+; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B7644C000733;
	Tue, 27 Jan 2026 13:46:59 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B7644C000733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1769550419;
	bh=L374EcJRAc/qEjuY/FVQi+JhFU4/ncCIa2WaXKx/r3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oHRqNqF+tyTHzIkMeUB9UZc25HkYip9O6CkZnbM8l9jwsOw3W7/6DgUtc3ABp0Lro
	 Z7GNoVn2am/w2ZNt0f6/qEVhS6sZuOIWuogId44csbP7CF2lkUfAsCM34uRRgrVBXb
	 5KOcHb/haul/M3f7Ta63rDD+jEcnLZ+UJq7KTyC8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 9174D199D2;
	Tue, 27 Jan 2026 13:46:59 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v2 2/3] gpio: brcmstb: implement irq_mask_ack
Date: Tue, 27 Jan 2026 13:46:55 -0800
Message-ID: <20260127214656.447333-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127214656.447333-1-florian.fainelli@broadcom.com>
References: <20260127214656.447333-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=dkimrelay];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31181-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,broadcom.com,kernel.org,vger.kernel.org,lists.infradead.org];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.983];
	DKIM_TRACE(0.00)[broadcom.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:email,broadcom.com:dkim,broadcom.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC9E69ACD3
X-Rspamd-Action: no action

From: Doug Berger <opendmb@gmail.com>

The irq_mask_ack operation is slightly more efficient than doing
irq_mask and irq_ack separately.

More importantly for this driver it bypasses the check of
irqd_irq_masked ensuring a previously masked but still active
interrupt gets remasked if unmasked at the hardware level. This
allows the driver to more efficiently unmask the wake capable
interrupts when quiescing without needing to enable the irqs
individually to clear the irqd_irq_masked state.

Signed-off-by: Doug Berger <opendmb@gmail.com>
Co-developed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/gpio/gpio-brcmstb.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 2352d099709c..bf0192b82276 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-// Copyright (C) 2015-2017 Broadcom
+// Copyright (C) 2015-2017, 2026 Broadcom
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
@@ -95,15 +95,13 @@ static int brcmstb_gpio_hwirq_to_offset(irq_hw_number_t hwirq,
 	return hwirq - bank->chip.gc.offset;
 }
 
-static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
-		unsigned int hwirq, bool enable)
+static void __brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
+				    unsigned int hwirq, bool enable)
 {
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
 	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(hwirq, bank));
 	u32 imask;
 
-	guard(gpio_generic_lock_irqsave)(&bank->chip);
-
 	imask = gpio_generic_read_reg(&bank->chip,
 				      priv->reg_base + GIO_MASK(bank->id));
 	if (enable)
@@ -114,6 +112,13 @@ static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
 			       priv->reg_base + GIO_MASK(bank->id), imask);
 }
 
+static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
+		unsigned int hwirq, bool enable)
+{
+	guard(gpio_generic_lock_irqsave)(&bank->chip);
+	__brcmstb_gpio_set_imask(bank, hwirq, enable);
+}
+
 static int brcmstb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 {
 	struct brcmstb_gpio_priv *priv = brcmstb_gpio_gc_to_priv(gc);
@@ -135,6 +140,19 @@ static void brcmstb_gpio_irq_mask(struct irq_data *d)
 	brcmstb_gpio_set_imask(bank, d->hwirq, false);
 }
 
+static void brcmstb_gpio_irq_mask_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
+	struct brcmstb_gpio_priv *priv = bank->parent_priv;
+	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(d->hwirq, bank));
+
+	guard(gpio_generic_lock_irqsave)(&bank->chip);
+	__brcmstb_gpio_set_imask(bank, d->hwirq, false);
+	gpio_generic_write_reg(&bank->chip,
+			       priv->reg_base + GIO_STAT(bank->id), mask);
+}
+
 static void brcmstb_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -471,6 +489,7 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 	priv->irq_chip.name = dev_name(dev);
 	priv->irq_chip.irq_disable = brcmstb_gpio_irq_mask;
 	priv->irq_chip.irq_mask = brcmstb_gpio_irq_mask;
+	priv->irq_chip.irq_mask_ack = brcmstb_gpio_irq_mask_ack;
 	priv->irq_chip.irq_unmask = brcmstb_gpio_irq_unmask;
 	priv->irq_chip.irq_ack = brcmstb_gpio_irq_ack;
 	priv->irq_chip.irq_set_type = brcmstb_gpio_irq_set_type;
-- 
2.43.0


