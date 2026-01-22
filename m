Return-Path: <linux-gpio+bounces-30880-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL0dKuR5cWkvHwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30880-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 02:14:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 591BA6035F
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 02:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BB1923C7A0D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 01:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E1933F370;
	Thu, 22 Jan 2026 01:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="sFSILUUs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41EC340D82;
	Thu, 22 Jan 2026 01:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769044437; cv=none; b=rn4D+QG4YaWEAAt9fDj61CIH5ryLE1aCl8CqT6YMmJf76DxPmCxmWdSJ5DHMLN9PwE14fi77ISloBj5IuvkN4hmBvCT6meJ+F0YdzorhS6+IliWNxAS99ijEU76hD8jG1vkwPvdW394X4bABF8SvC+7LfogxwHKFZO1pxC+L6Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769044437; c=relaxed/simple;
	bh=HexbE4h+Gs6KykT03gyu0tt3owJKTbjX9Kje2L/OQiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wp8MF7/JINqMPs3/5R+TgXTvXpfjPp8iVxKewkO5tboTIq2PVHEmwGhkCqzxdA4ct/1snY9QlFnLTEWEUceiwhMwsNbHngy5GozyABZr+79+lXMCY0twptu85RmtXVzdUU7BljBWBPVuCLXEz9H4Wkx9zbj564z7uBju/eUHKSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=sFSILUUs; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id D80C7C008DE2;
	Wed, 21 Jan 2026 17:06:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com D80C7C008DE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1769043985;
	bh=HexbE4h+Gs6KykT03gyu0tt3owJKTbjX9Kje2L/OQiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sFSILUUstI5k7lriBf2QCHl67LS53vbe/58GskyRyAtxx10FwZ7dODCUNBjXb8oTv
	 Bg+qhFOc+HDU3LP+yvsDZgOHbSC150w2nGQi15V62EfFCc6Y1nRb2ovQmEZL76kW9m
	 YPgythBoocXN2rvmriuuZCE6Sqp9x2bCJAYvgVJM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id B8AC119CDA;
	Wed, 21 Jan 2026 17:06:25 -0800 (PST)
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
Subject: [PATCH 2/3] gpio: brcmstb: implement irq_mask_ack
Date: Wed, 21 Jan 2026 17:05:15 -0800
Message-ID: <20260122010516.1200630-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122010516.1200630-1-florian.fainelli@broadcom.com>
References: <20260122010516.1200630-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=dkimrelay];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[broadcom.com:+];
	TAGGED_FROM(0.00)[bounces-30880-lists,linux-gpio=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[broadcom.com,reject];
	FREEMAIL_CC(0.00)[gmail.com,broadcom.com,kernel.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 591BA6035F
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
[florian: forward ported change after switch to guard()]
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/gpio/gpio-brcmstb.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 2352d099709c..5fb6612c2aa5 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-// Copyright (C) 2015-2017 Broadcom
+// Copyright (C) 2015-2026 Broadcom
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
@@ -96,7 +96,7 @@ static int brcmstb_gpio_hwirq_to_offset(irq_hw_number_t hwirq,
 }
 
 static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
-		unsigned int hwirq, bool enable)
+		unsigned int hwirq, bool enable, bool ack)
 {
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
 	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(hwirq, bank));
@@ -110,8 +110,10 @@ static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
 		imask |= mask;
 	else
 		imask &= ~mask;
-	gpio_generic_write_reg(&bank->chip,
-			       priv->reg_base + GIO_MASK(bank->id), imask);
+	if (ack)
+		gpio_generic_write_reg(&bank->chip,
+				       priv->reg_base + GIO_MASK(bank->id),
+				       imask);
 }
 
 static int brcmstb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
@@ -132,7 +134,15 @@ static void brcmstb_gpio_irq_mask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
 
-	brcmstb_gpio_set_imask(bank, d->hwirq, false);
+	brcmstb_gpio_set_imask(bank, d->hwirq, false, false);
+}
+
+static void brcmstb_gpio_irq_mask_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
+
+	brcmstb_gpio_set_imask(bank, d->hwirq, false, true);
 }
 
 static void brcmstb_gpio_irq_unmask(struct irq_data *d)
@@ -140,7 +150,7 @@ static void brcmstb_gpio_irq_unmask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
 
-	brcmstb_gpio_set_imask(bank, d->hwirq, true);
+	brcmstb_gpio_set_imask(bank, d->hwirq, true, false);
 }
 
 static void brcmstb_gpio_irq_ack(struct irq_data *d)
@@ -471,6 +481,7 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 	priv->irq_chip.name = dev_name(dev);
 	priv->irq_chip.irq_disable = brcmstb_gpio_irq_mask;
 	priv->irq_chip.irq_mask = brcmstb_gpio_irq_mask;
+	priv->irq_chip.irq_mask_ack = brcmstb_gpio_irq_mask_ack;
 	priv->irq_chip.irq_unmask = brcmstb_gpio_irq_unmask;
 	priv->irq_chip.irq_ack = brcmstb_gpio_irq_ack;
 	priv->irq_chip.irq_set_type = brcmstb_gpio_irq_set_type;
-- 
2.43.0


