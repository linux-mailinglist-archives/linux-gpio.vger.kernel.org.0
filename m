Return-Path: <linux-gpio+bounces-39448-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MTFmBK8jSWqoygAAu9opvQ
	(envelope-from <linux-gpio+bounces-39448-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Jul 2026 17:15:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A79F707CE8
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Jul 2026 17:15:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=X0v4DRUy;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=tY79+LLs;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39448-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39448-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B298930158B3
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jul 2026 15:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7718935E1B6;
	Sat,  4 Jul 2026 15:15:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593C635DA7F;
	Sat,  4 Jul 2026 15:15:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783178149; cv=none; b=MHXC5hCAm359734JhbA/nSTPjaiLeaIJvMfM8xVHofSsVwjcujZ/Vd9CdAGQ0XqFmEatCf6tPiz8X889O8I4iDghaTZnaLvmBQ/N3i4uPJyptIFu+6SoLhQp4N5jDBop8C4wO6BXiZRyoLJ4R/e3AlWqWobQghkVFiq8E14iXq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783178149; c=relaxed/simple;
	bh=VX9EksxBnbq2GrUQJTSEi9rVGmclI8+xnc31hAmTEtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A9J8uLonysVQCFjAiakbPP22CV7Ii0DD5/btwXsP5TQJZfkrWjvMLgMBs/YQPo8/n24wouZCNT++ih3mnQtMfnq3N9lJYvFxRN+wCh4EIo+aoo9WxeHZGCECeNpdGhFye4lEUi/ksiG78td24mHGVgAbovKDFjwFqDNqjH8ccoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=X0v4DRUy; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tY79+LLs; arc=none smtp.client-ip=80.241.56.152
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gsvMC4BNQz9vCX;
	Sat,  4 Jul 2026 17:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783178135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PE29dZpCaxKqRSw/w3IwZJZkkAzbhBe5GREsJCk9pHE=;
	b=X0v4DRUy++cZ13/PgA5W2sLEf00SuGBv6H6usKPlvqudoyQtx6q9yZHPD5fDQ4Tncau8xr
	sk0csfL5hfIHSbFwDOAbAjsilbyVc7wqlJ40jbs+FsyTG1OZkR+J1VXvw9Ix4TGHXMfVS1
	00Us8Ed6s7MMpBDXlctgao8tDJw/lYtWLbciDyJccu669kj5CeWgf9PhFGYefpY38oPFIY
	3Q2SNP1LDWGuDV5bg9LWXElBPA6JdyUrg8BF+T+g6Qoapol+z7SmWvxDijz4PE++fGosP6
	WyauRkJ4CS5kcdRu6AyMKdm8+SFWMwsCcN6BFuRxFkJj2Gahr21f25hmRzzGQw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783178134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PE29dZpCaxKqRSw/w3IwZJZkkAzbhBe5GREsJCk9pHE=;
	b=tY79+LLsxrr8uPC84V2NyJZwapCuUl1BqsJTu9gwfhzVP1ILDX/fZ5kZwrcJ+unfrszklf
	Fq5YotvV4NkjmS5bjsBlrctJctVjXIVxjR89BDTpZkfVokrGZGB7JNaIlWelTQzeKLcBi4
	lFttJgwxxdw7TqI0KmRj15MCeBLdi+HaX1U6CMR7br27NbultFwy/NkKiccJicbn9GY3Fq
	5whUF/Rb6HOPmXSTVHXG+EOeZ0VvryyQlgiYXg4ss3ZQkqb+FKebi56e8WcqUD91flBxIs
	HAIi44hKgmCZEQ5qMIL3o50m8jaZ0nPVZc/kn0u2wLYVYsIIDOr9RiST+3GQQg==
To: linux-gpio@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
Date: Sat,  4 Jul 2026 17:13:47 +0200
Message-ID: <20260704151521.211335-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: uk8n5i7h33rhjyu96fy5pa34d46nogs7
X-MBO-RS-ID: 5d8af0c748bd7cc1393
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39448-lists,linux-gpio=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:brgl@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-gpio@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A79F707CE8

R-Car X5H (R8A78000) is the first member of the R-Car Gen5 family.
Add support for R-Car X5H, which has slightly different GPIO block
register layout compared to previous generations. Introduce offset
remap function which performs 1:1 remap for R-Car Gen1..4 and a bit
more complex remap for R-Car Gen5.

The GPIO block register offsets on R-Car Gen5 changed and the change
can be divided into five groups, registers which remained at the
same offset, INDT register shifted by +0x10, OUTDTSEL register
shifted by -0x34, INEN register shifted by -0x38 and the rest of
the registers used by the driver shifted by +0x70 .

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpio/gpio-rcar.c | 61 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 09bebde5c4260..a22112d9dce0f 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -36,6 +36,7 @@ struct gpio_rcar_info {
 	bool has_both_edge_trigger;
 	bool has_always_in;
 	bool has_inen;
+	bool has_layout_gen5;
 };
 
 struct gpio_rcar_priv {
@@ -65,14 +66,59 @@ struct gpio_rcar_priv {
 
 #define RCAR_MAX_GPIO_PER_BANK		32
 
+static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
+{
+	/* R-Car Gen4 and older do not need any offset remap. */
+	if (!p->info.has_layout_gen5)
+		return 0;
+
+	/*
+	 * R-Car Gen5 register layout is slightly different and the offsets
+	 * that have to be added to or subtracted from each register offset
+	 * can be divided into five groups, listed below.
+	 */
+	switch (*offs) {
+	case IOINTSEL...OUTDT:
+		return 0;
+	case INDT:
+		*offs += 0x10;
+		return 0;
+	case INTDT...EDGLEVEL:
+		fallthrough;
+	case BOTHEDGE:
+		*offs += 0x70;
+		return 0;
+	case OUTDTSEL:
+		*offs -= 0x34;
+		return 0;
+	case INEN:
+		*offs -= 0x38;
+		return 0;
+	default:
+		/*
+		 * This here must never be reached, if this is reached, that
+		 * means there is a catastrophic failure in the driver. Skip
+		 * any IO read/write to prevent further damage.
+		 */
+		WARN_ON(1);
+		return -EINVAL;
+	}
+}
+
 static inline u32 gpio_rcar_read(struct gpio_rcar_priv *p, int offs)
 {
+	if (gpio_rcar_remap_offset(p, &offs))
+		return 0;
+
 	return ioread32(p->base + offs);
 }
 
 static inline void gpio_rcar_write(struct gpio_rcar_priv *p, int offs,
 				   u32 value)
 {
+	if (gpio_rcar_remap_offset(p, &offs))
+		return;
+
 	iowrite32(value, p->base + offs);
 }
 
@@ -399,6 +445,7 @@ static const struct gpio_rcar_info gpio_rcar_info_gen1 = {
 	.has_both_edge_trigger = false,
 	.has_always_in = false,
 	.has_inen = false,
+	.has_layout_gen5 = false,
 };
 
 static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
@@ -406,6 +453,7 @@ static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
 	.has_both_edge_trigger = true,
 	.has_always_in = false,
 	.has_inen = false,
+	.has_layout_gen5 = false,
 };
 
 static const struct gpio_rcar_info gpio_rcar_info_gen3 = {
@@ -413,6 +461,7 @@ static const struct gpio_rcar_info gpio_rcar_info_gen3 = {
 	.has_both_edge_trigger = true,
 	.has_always_in = true,
 	.has_inen = false,
+	.has_layout_gen5 = false,
 };
 
 static const struct gpio_rcar_info gpio_rcar_info_gen4 = {
@@ -420,6 +469,15 @@ static const struct gpio_rcar_info gpio_rcar_info_gen4 = {
 	.has_both_edge_trigger = true,
 	.has_always_in = true,
 	.has_inen = true,
+	.has_layout_gen5 = false,
+};
+
+static const struct gpio_rcar_info gpio_rcar_info_gen5 = {
+	.has_outdtsel = true,
+	.has_both_edge_trigger = true,
+	.has_always_in = true,
+	.has_inen = true,
+	.has_layout_gen5 = true,
 };
 
 static const struct of_device_id gpio_rcar_of_table[] = {
@@ -438,6 +496,9 @@ static const struct of_device_id gpio_rcar_of_table[] = {
 	}, {
 		.compatible = "renesas,rcar-gen4-gpio",
 		.data = &gpio_rcar_info_gen4,
+	}, {
+		.compatible = "renesas,rcar-gen5-gpio",
+		.data = &gpio_rcar_info_gen5,
 	}, {
 		.compatible = "renesas,gpio-rcar",
 		.data = &gpio_rcar_info_gen1,
-- 
2.53.0


