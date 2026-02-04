Return-Path: <linux-gpio+bounces-31444-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAcTIOJ3g2mFmwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31444-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 17:46:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 41234EA6F6
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 17:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0771302837B
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 16:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8056631B80E;
	Wed,  4 Feb 2026 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Rd1opatk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338B9313549;
	Wed,  4 Feb 2026 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770223415; cv=none; b=fF6jOZoSsJ77q8a6mjLDydz4sCOWjRzZj9Cyt8c8+dS+grPhofd70kQEhQcXLGxkjhGeBhmEyL5OsGVcX8fpuHod9fIxVnFN179edswVEuvBMy3dSvlxBCIV0DTDPmVx7pzMiRFlEmEpne3TLVSbzC9cviTAbFKVOCWXokxV3kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770223415; c=relaxed/simple;
	bh=YoPzbExBrUVv7/SrFPsRgUVdWXQcelYgPgGJIIm3MVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZywdvzOYILpYDOOa9dAudALBOkDpdtrYcpRPvpXsRB8sGhddpTcbPdLv47hQwCCDoHPOGjil1TIBA0sDm4sFQZaJp6ztZyG8a5OrLOzA3S7k5GFtHcAu5aVQI1JO3b2/b/yp3HIIJQ35dhkt9c7bBckAOPeQNZbEZgnea7oRAdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Rd1opatk; arc=none smtp.client-ip=192.19.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B9FEAC0131A4;
	Wed,  4 Feb 2026 08:43:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B9FEAC0131A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1770223414;
	bh=YoPzbExBrUVv7/SrFPsRgUVdWXQcelYgPgGJIIm3MVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rd1opatklCCXSaEybBysKjPUtHJW8cbFD/TNpKr73f+15Qr5NK0DzQ9kIXhCGQOyF
	 3idAubk6qDiTPInbw8GuNvxDXb6G2dWj9X0lryByDZSPYUCBrCT4dhr9cXzLTm9zXD
	 em0451i3qp054q6Utuud3yR0ESGs4zTdEphjmnZY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 999B51B869;
	Wed,  4 Feb 2026 08:43:34 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v5 1/3] gpio: brcmstb: Utilize irqd_to_hwirq(d) instead of d->hwirq
Date: Wed,  4 Feb 2026 08:43:31 -0800
Message-ID: <20260204164333.1146039-2-florian.fainelli@broadcom.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31444-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[broadcom.com,kernel.org,gmail.com,vger.kernel.org,lists.infradead.org];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:email,broadcom.com:dkim,broadcom.com:mid]
X-Rspamd-Queue-Id: 41234EA6F6
X-Rspamd-Action: no action

Consistently use irqd_to_hwirq(d) which is the recommended helper to
fetch the hardware IRQ number from an irq_data structure. While at it,
update the brcmstb_gpio_set_imask() function signature to use the proper
type for the "hwirq" argument rather than "unsigned int".

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/gpio/gpio-brcmstb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 2352d099709c..4c35ed664f65 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -96,7 +96,7 @@ static int brcmstb_gpio_hwirq_to_offset(irq_hw_number_t hwirq,
 }
 
 static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
-		unsigned int hwirq, bool enable)
+				   irq_hw_number_t hwirq, bool enable)
 {
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
 	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(hwirq, bank));
@@ -132,7 +132,7 @@ static void brcmstb_gpio_irq_mask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
 
-	brcmstb_gpio_set_imask(bank, d->hwirq, false);
+	brcmstb_gpio_set_imask(bank, irqd_to_hwirq(d), false);
 }
 
 static void brcmstb_gpio_irq_unmask(struct irq_data *d)
@@ -140,7 +140,7 @@ static void brcmstb_gpio_irq_unmask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
 
-	brcmstb_gpio_set_imask(bank, d->hwirq, true);
+	brcmstb_gpio_set_imask(bank, irqd_to_hwirq(d), true);
 }
 
 static void brcmstb_gpio_irq_ack(struct irq_data *d)
@@ -148,7 +148,7 @@ static void brcmstb_gpio_irq_ack(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
-	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(d->hwirq, bank));
+	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(irqd_to_hwirq(d), bank));
 
 	gpio_generic_write_reg(&bank->chip,
 			       priv->reg_base + GIO_STAT(bank->id), mask);
@@ -159,7 +159,7 @@ static int brcmstb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
-	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(d->hwirq, bank));
+	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(irqd_to_hwirq(d), bank));
 	u32 edge_insensitive, iedge_insensitive;
 	u32 edge_config, iedge_config;
 	u32 level, ilevel;
@@ -236,7 +236,7 @@ static int brcmstb_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
-	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(d->hwirq, bank));
+	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(irqd_to_hwirq(d), bank));
 
 	/*
 	 * Do not do anything specific for now, suspend/resume callbacks will
-- 
2.43.0


