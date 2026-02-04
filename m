Return-Path: <linux-gpio+bounces-31446-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BU3TEGB4g2nwngMAu9opvQ
	(envelope-from <linux-gpio+bounces-31446-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 17:48:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5C9EA80F
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 17:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B12A43055E42
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 16:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704133246F9;
	Wed,  4 Feb 2026 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Zu2bSoAM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C80322749;
	Wed,  4 Feb 2026 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770223416; cv=none; b=OgrQZu5EJE1DvaqlBUATLsW1rXX0GH5xnXbrDQ1kdvFTSaQ4bUPu3C5iLhdVaHoeJXW0CMpLK+2A32MTstyXbeplnGDYF0h8RB/XDGhlEObrdYQgmFxH+Pqa2OLqT2PNMUDYt7FZhvNkcK3lKdNWAV09pqz/UIt0dlij6ohJoGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770223416; c=relaxed/simple;
	bh=gYOW6vEGs06Iu9JZzL4qv7FFmeDRsdCgxQ42GqTb6xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JX+VRgcroWFJuE4ia8AqxHUhqFTvnPdgT9poI0t4LDYkJCVpPR7HCdoRD0MNoGCwvYyxiIhsKjF1newF9240KAc80Ow5DWtP6dz/GCt3JHECnOeOJQU3ATFj9yDCtG8Dsz9yEvRXsYfhdrSHrWdBxeS093jmZxTMgivnJDh77tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Zu2bSoAM; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 23C1AC002A3C;
	Wed,  4 Feb 2026 08:43:35 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 23C1AC002A3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1770223415;
	bh=gYOW6vEGs06Iu9JZzL4qv7FFmeDRsdCgxQ42GqTb6xs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zu2bSoAMfZzmNlbc6DBTRjw0KY6juL+AgJbXQOMAkFmAg82cfLTG/maHLb4PD9LL4
	 v8QPa4O7EEdIYTHJ9VzRW8J693T1R6DWDYnA3GTCjY4IVUh8fjtLihbUrv6ze1PSar
	 arNDUumTxMSPDhIxfpeUVQXzLRA+ZotEtwKSr5mg=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id C15A31B85C;
	Wed,  4 Feb 2026 08:43:34 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Doug Berger <opendmb@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v5 2/3] gpio: brcmstb: implement .irq_mask_ack()
Date: Wed,  4 Feb 2026 08:43:32 -0800
Message-ID: <20260204164333.1146039-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204164333.1146039-1-florian.fainelli@broadcom.com>
References: <20260204164333.1146039-1-florian.fainelli@broadcom.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31446-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,broadcom.com,vger.kernel.org,lists.infradead.org];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[broadcom.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:email,broadcom.com:dkim,broadcom.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0E5C9EA80F
X-Rspamd-Action: no action

From: Doug Berger <opendmb@gmail.com>

The .irq_mask_ack() operation is slightly more efficient than doing
.irq_mask() and .irq_ack() separately.

More importantly for this driver it bypasses the check of
irqd_irq_masked ensuring a previously masked but still active
interrupt gets remasked if unmasked at the hardware level. This
allows the driver to more efficiently unmask the wake capable
interrupts when quiescing without needing to enable the irqs
individually to clear the irqd_irq_masked state.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Doug Berger <opendmb@gmail.com>
Co-developed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/gpio/gpio-brcmstb.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 4c35ed664f65..7ebf1217f383 100644
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
-				   irq_hw_number_t hwirq, bool enable)
+static void __brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
+				     irq_hw_number_t hwirq, bool enable)
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
+				   irq_hw_number_t hwirq, bool enable)
+{
+	guard(gpio_generic_lock_irqsave)(&bank->chip);
+	__brcmstb_gpio_set_imask(bank, hwirq, enable);
+}
+
 static int brcmstb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 {
 	struct brcmstb_gpio_priv *priv = brcmstb_gpio_gc_to_priv(gc);
@@ -135,6 +140,20 @@ static void brcmstb_gpio_irq_mask(struct irq_data *d)
 	brcmstb_gpio_set_imask(bank, irqd_to_hwirq(d), false);
 }
 
+static void brcmstb_gpio_irq_mask_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
+	struct brcmstb_gpio_priv *priv = bank->parent_priv;
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(hwirq, bank));
+
+	guard(gpio_generic_lock_irqsave)(&bank->chip);
+	__brcmstb_gpio_set_imask(bank, hwirq, false);
+	gpio_generic_write_reg(&bank->chip,
+			       priv->reg_base + GIO_STAT(bank->id), mask);
+}
+
 static void brcmstb_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -471,6 +490,7 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 	priv->irq_chip.name = dev_name(dev);
 	priv->irq_chip.irq_disable = brcmstb_gpio_irq_mask;
 	priv->irq_chip.irq_mask = brcmstb_gpio_irq_mask;
+	priv->irq_chip.irq_mask_ack = brcmstb_gpio_irq_mask_ack;
 	priv->irq_chip.irq_unmask = brcmstb_gpio_irq_unmask;
 	priv->irq_chip.irq_ack = brcmstb_gpio_irq_ack;
 	priv->irq_chip.irq_set_type = brcmstb_gpio_irq_set_type;
-- 
2.43.0


