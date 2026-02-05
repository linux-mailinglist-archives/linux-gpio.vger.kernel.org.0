Return-Path: <linux-gpio+bounces-31474-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INflGESXhGk43gMAu9opvQ
	(envelope-from <linux-gpio+bounces-31474-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 14:12:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF385F30A1
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 14:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F9783015441
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Feb 2026 13:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245293D6474;
	Thu,  5 Feb 2026 13:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=dev.tdt.de header.i=@dev.tdt.de header.b="rGKVNnVe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [194.37.255.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73553D525C;
	Thu,  5 Feb 2026 13:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.37.255.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770297124; cv=none; b=DT0BJ10RBUSBFDGG/I3tbEWazCa3Co0m2qhNTyLafESs4rrHjmvGZgOcj+yGuRVM+DSUEFShT6oPhzucGCyisPZ8hDlw6o2ILW3WvIAYvGyyuXOL95YioHqQHwv6zfYSNY+GtrPuGVQwscwvMhi8r9EW7Oreb8tHtmmZU+i5Nro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770297124; c=relaxed/simple;
	bh=YwWsG62QiDkxGzXYUgv/9TSRbSgOGHLpT3dF/MpqWXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:Cc; b=Af0GnCtsHJvSt2059XViZ2LZB2AZKTdFwsxDsHi3hkHw+OvL06lg0+6yVG4FUmQsYc6MrYvTVihh0K+R7T9pijQQNLEMKWJ7rc18Lie6AvxL3KXsw12ZDTAqxA6qEYD00qFw0lSAp/x4RmhtRIazpAezr5QQZiyTTxpwi7FTlS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dev.tdt.de; spf=pass smtp.mailfrom=dev.tdt.de; dkim=temperror (0-bit key) header.d=dev.tdt.de header.i=@dev.tdt.de header.b=rGKVNnVe; arc=none smtp.client-ip=194.37.255.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dev.tdt.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.tdt.de
Received: from [194.37.255.9] (helo=mxout.expurgate.net)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=451014665c=fe@dev.tdt.de>)
	id 1vnytn-007WtK-IL; Thu, 05 Feb 2026 13:55:55 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <fe@dev.tdt.de>)
	id 1vnytm-007Wrw-VV; Thu, 05 Feb 2026 13:55:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dev.tdt.de;
	s=z1-selector1; t=1770296154;
	bh=oCm9KCJf3EanVvDALv3TOF9MseGp/uyFM3Yjfecwhw0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rGKVNnVeBcOdIoECKEVLe3aHpFRqZo/yLSTw4ymvaqvNzgpzCR4yiFtG09zde/wAo
	 EZZwagVl1nhCKaqIVrj95cPfh9RdWKihNR1In07i3QmHtPJ7VdC2WEz7dfpNopcM5s
	 mkxhDbhOYJ9D+MtMG0Lb90M7tAGN/XEqiSKc5wWlDESIFRPMhyjZgXmfKzbhsJHeLW
	 ynB7Iq/7wSeSGnZ4/eEq6UHtdahTyN+bc3y4OHbpsKl1BA1FeyA3tfQQPEccBXCorW
	 yt8FHV+Epm1PaHT8h1Du7MZY0s9VbKN8h4/N6xwVJtHT+yedx3Cnj56jzNq04tWDXt
	 D/uCDab+FSrmA==
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id 8918F240036;
	Thu,  5 Feb 2026 13:55:54 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id 8423A240041;
	Thu,  5 Feb 2026 13:55:54 +0100 (CET)
Received: from [10.2.3.40] (unknown [10.2.3.40])
	by mail.dev.tdt.de (Postfix) with ESMTPSA id 6504F22828;
	Thu,  5 Feb 2026 13:55:54 +0100 (CET)
From: Florian Eckert <fe@dev.tdt.de>
Date: Thu, 05 Feb 2026 13:55:45 +0100
Subject: [PATCH 1/2] pinctrl: equilibrium: rename irq_chip function
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260205-pinctrl-equilibrium-v1-1-66909a3b0acb@dev.tdt.de>
References: <20260205-pinctrl-equilibrium-v1-0-66909a3b0acb@dev.tdt.de>
In-Reply-To: <20260205-pinctrl-equilibrium-v1-0-66909a3b0acb@dev.tdt.de>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Florian Eckert <Eckert.Florian@gmail.com>,
	Florian Eckert <fe@dev.tdt.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770296154; l=2865;
 i=fe@dev.tdt.de; s=20260205; h=from:subject:message-id;
 bh=YwWsG62QiDkxGzXYUgv/9TSRbSgOGHLpT3dF/MpqWXw=;
 b=Hyr8dtboQmtynpzm0cJBm0WQZWGoodVsRWmX4L2VUS1qhBq/AlNcwbwhU8GsD+w/7jvXrdha2
 67YYrvPn2ZwD+5RBQLCTwlZzID6Z2IBvOnJbKAgNTapx8qnmiBUwXIT
X-Developer-Key: i=fe@dev.tdt.de; a=ed25519;
 pk=q7Pvv3Au2sAVRhBz5UF7ZqUPNxUwXQ78Jdqu8E6Negk=
X-purgate: clean
X-purgate-ID: 151534::1770296155-955FC330-41E7C008/0/0
X-purgate-type: clean
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tdt.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[dev.tdt.de:s=z1-selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,dev.tdt.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31474-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[dev.tdt.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tdt.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,dev.tdt.de:mid,dev.tdt.de:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fe@dev.tdt.de,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BF385F30A1
X-Rspamd-Action: no action

Renaming of the irq_chip callback functions to improve clarity.

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 2d04829b29c9976fdebbaa56e6c1407eafa121a9..99596236f4d2b1c0ea280a2bd2cf4be247bc5042 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -23,7 +23,7 @@
 #define PIN_NAME_LEN	10
 #define PAD_REG_OFF	0x100
 
-static void eqbr_gpio_disable_irq(struct irq_data *d)
+static void eqbr_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct eqbr_gpio_ctrl *gctrl = gpiochip_get_data(gc);
@@ -36,7 +36,7 @@ static void eqbr_gpio_disable_irq(struct irq_data *d)
 	gpiochip_disable_irq(gc, offset);
 }
 
-static void eqbr_gpio_enable_irq(struct irq_data *d)
+static void eqbr_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct eqbr_gpio_ctrl *gctrl = gpiochip_get_data(gc);
@@ -50,7 +50,7 @@ static void eqbr_gpio_enable_irq(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&gctrl->lock, flags);
 }
 
-static void eqbr_gpio_ack_irq(struct irq_data *d)
+static void eqbr_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct eqbr_gpio_ctrl *gctrl = gpiochip_get_data(gc);
@@ -62,10 +62,10 @@ static void eqbr_gpio_ack_irq(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&gctrl->lock, flags);
 }
 
-static void eqbr_gpio_mask_ack_irq(struct irq_data *d)
+static void eqbr_irq_mask_ack(struct irq_data *d)
 {
-	eqbr_gpio_disable_irq(d);
-	eqbr_gpio_ack_irq(d);
+	eqbr_irq_mask(d);
+	eqbr_irq_ack(d);
 }
 
 static inline void eqbr_cfg_bit(void __iomem *addr,
@@ -92,7 +92,7 @@ static int eqbr_irq_type_cfg(struct gpio_irq_type *type,
 	return 0;
 }
 
-static int eqbr_gpio_set_irq_type(struct irq_data *d, unsigned int type)
+static int eqbr_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct eqbr_gpio_ctrl *gctrl = gpiochip_get_data(gc);
@@ -166,11 +166,11 @@ static void eqbr_irq_handler(struct irq_desc *desc)
 
 static const struct irq_chip eqbr_irq_chip = {
 	.name = "gpio_irq",
-	.irq_mask = eqbr_gpio_disable_irq,
-	.irq_unmask = eqbr_gpio_enable_irq,
-	.irq_ack = eqbr_gpio_ack_irq,
-	.irq_mask_ack = eqbr_gpio_mask_ack_irq,
-	.irq_set_type = eqbr_gpio_set_irq_type,
+	.irq_ack = eqbr_irq_ack,
+	.irq_mask = eqbr_irq_mask,
+	.irq_mask_ack = eqbr_irq_mask_ack,
+	.irq_unmask = eqbr_irq_unmask,
+	.irq_set_type = eqbr_irq_set_type,
 	.flags = IRQCHIP_IMMUTABLE,
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };

-- 
2.47.3


