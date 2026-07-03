Return-Path: <linux-gpio+bounces-39413-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w0y5LWW8R2rBeQAAu9opvQ
	(envelope-from <linux-gpio+bounces-39413-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 15:43:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B860703014
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 15:43:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=uS9Up6Nh;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39413-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39413-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 868CD3055424
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 13:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09163DCDAE;
	Fri,  3 Jul 2026 13:30:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0223D1AB9;
	Fri,  3 Jul 2026 13:30:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085454; cv=none; b=sPDx+TKNdhx6eI43/oVbEu50GL+jsdGQ69I2a/IqHG2iprjDB+3O32F7j7OBxTGs2ob5p0n4Z3Jr/be7bVtgVA25W9IkRObfAa1DH6HkxRG/B9UGct0h+9UFTG2upls5mf7BgR0vBjMTHpjN4ZOsKolf6GvmXwFJDZxFKHj22qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085454; c=relaxed/simple;
	bh=KQ/8zR92O33jF8u7KItWauZlD5mu9z5Gq4G8xVUNdy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G753wEqnzjUPHqj5koMLLx8afvYplM+7ijadBxGjSrQvB8O8f2yx07OXntmA8ZoxeeleQVfqJrccjz5v/H6dy/wKoP1HmZ2pPJjXRt06cQQaeKCgH63+XdcAKwxGiVHgOf9DGR02KoOKK4yi4+Q1wrVTdPaabVux0h35LGqAFEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uS9Up6Nh; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 04F994E40C6F;
	Fri,  3 Jul 2026 13:30:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5F9E60300;
	Fri,  3 Jul 2026 13:30:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09D26104C95A9;
	Fri,  3 Jul 2026 15:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783085443; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=x0twSIpE7m4cPj3Ig88g1zIACZePCnPv6bKNCD++fr8=;
	b=uS9Up6NhEfglz7sia9B2B1y50iyxi4yn1pKfYp0g3FKsaHuOB/ETRKhSTX+Aa83ZKqUbKz
	TWt/TopuxusBfVwkb4gamT0LQ2CaCt5W/Eb1VzC5RdUkRo9n0hrqexHsIEsfQ8k2WtDEHu
	GubKMy0XTbuOLRiamCv7DcCotTR2K9LgGhv930WQOBGm8a47xxET1GjhykWSyAabZ0nOr1
	9B4Bq4Bgd5w6OFbzxyURdObSxsbRspPJbsDYoAoAXv55Odadctm86cDUkhG1KCh++NNLIv
	6MOwL0TTpxcaZBg24553aX+fwXbaGOdEInJyJpqlPrJt0jrzRO1tqwoANFqxtg==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 03 Jul 2026 15:30:16 +0200
Subject: [PATCH 08/12] soc: fsl: qe: Convert to generic IRQ chip
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qe-pic-gpios-v1-8-6c3e706e27dc@bootlin.com>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
In-Reply-To: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783085423; l=6648;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=KQ/8zR92O33jF8u7KItWauZlD5mu9z5Gq4G8xVUNdy8=;
 b=85BWRIYuoXfDZLoVu0OK8zlBEh3fbHEO5zRJByLQkj0tGo2xkWJXC01UjyzuRp/rGU3daP2h0
 13nPcFA5bk/BxtAcGA2K93qcsHjBQnEEvHZLgvImuiJkRt/FcnWIVp3
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39413-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com];
	FORGED_SENDER(0.00)[paul.louvel@bootlin.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:qiang.zhao@nxp.com,m:chleroy@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:paul.louvel@bootlin.com,m:thomas.petazzoni@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.louvel@bootlin.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:from_mime,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B860703014

The generic IRQ chip framework is available to handle IRQ chips. Using
this framework for the QE interrupt controller allows to simplify the
driver. Indeed, the framework internally handles operations coded
directly in the driver.

Add a select dependency to GENERIC_IRQ_CHIP in the PPC platform Kconfig.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 arch/powerpc/platforms/Kconfig   |   1 +
 drivers/soc/fsl/qe/qe_ports_ic.c | 103 ++++++++++++++++++++++++++-------------
 2 files changed, 70 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index c4e61843d9d9..b0b3a80f8cde 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -232,6 +232,7 @@ config QE_GPIO
 	bool "QE GPIO support"
 	depends on QUICC_ENGINE
 	select GPIOLIB
+	select GENERIC_IRQ_CHIP
 	help
 	  Say Y here if you're going to use hardware that connects to the
 	  QE GPIOs.
diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index c8b73b0aa233..d022aa224f6d 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -20,63 +20,65 @@ struct qepic_data {
 	void __iomem *reg;
 	struct irq_domain *host;
 	int irq;
+	struct irq_chip_generic *gc;
 };
 
 static void qepic_mask(struct irq_data *d)
 {
-	struct qepic_data *data = irq_data_get_irq_chip_data(d);
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct irq_chip_type *ct = irq_data_get_chip_type(d);
 
-	clrbits32(data->reg + CEPIMR, 1 << (31 - irqd_to_hwirq(d)));
+	clrbits32(gc->reg_base + ct->regs.mask, d->mask);
 }
 
 static void qepic_unmask(struct irq_data *d)
 {
-	struct qepic_data *data = irq_data_get_irq_chip_data(d);
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct irq_chip_type *ct = irq_data_get_chip_type(d);
 
-	setbits32(data->reg + CEPIMR, 1 << (31 - irqd_to_hwirq(d)));
+	setbits32(gc->reg_base + ct->regs.mask, d->mask);
 }
 
 static void qepic_end(struct irq_data *d)
 {
-	struct qepic_data *data = irq_data_get_irq_chip_data(d);
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct irq_chip_type *ct = irq_data_get_chip_type(d);
 
-	out_be32(data->reg + CEPIER, 1 << (31 - irqd_to_hwirq(d)));
+	out_be32(gc->reg_base + ct->regs.eoi, d->mask);
+}
+
+static void qepic_calc_mask(struct irq_data *d)
+{
+	d->mask = 1 << (31 - irqd_to_hwirq(d));
 }
 
 static int qepic_set_type(struct irq_data *d, unsigned int flow_type)
 {
-	struct qepic_data *data = irq_data_get_irq_chip_data(d);
-	unsigned int vec = (unsigned int)irqd_to_hwirq(d);
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct irq_chip_type *ct = irq_data_get_chip_type(d);
 
 	switch (flow_type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_FALLING:
-		setbits32(data->reg + CEPICR, 1 << (31 - vec));
+		setbits32(gc->reg_base + ct->regs.type, d->mask);
 		return 0;
 	case IRQ_TYPE_EDGE_BOTH:
 	case IRQ_TYPE_NONE:
-		clrbits32(data->reg + CEPICR, 1 << (31 - vec));
+		clrbits32(gc->reg_base + ct->regs.type, d->mask);
 		return 0;
 	}
 	return -EINVAL;
 }
 
-static struct irq_chip qepic = {
-	.name = "QEPIC",
-	.irq_mask = qepic_mask,
-	.irq_unmask = qepic_unmask,
-	.irq_eoi = qepic_end,
-	.irq_set_type = qepic_set_type,
-};
-
 static void qepic_cascade(struct irq_desc *desc)
 {
 	struct qepic_data *data = irq_desc_get_handler_data(desc);
+	struct irq_chip_type *ct = data->gc->chip_types;
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long event, bit;
 
 	chained_irq_enter(chip, desc);
 
-	event = in_be32(data->reg + CEPIER);
+	event = in_be32(data->gc->reg_base + ct->regs.eoi);
 	if (!event) {
 		handle_bad_irq(desc);
 		goto out;
@@ -89,33 +91,64 @@ static void qepic_cascade(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
-static int qepic_host_map(struct irq_domain *h, unsigned int virq, irq_hw_number_t hw)
+static int qepic_chip_init(struct irq_chip_generic *gc)
 {
-	irq_set_chip_data(virq, h->host_data);
-	irq_set_chip_and_handler(virq, &qepic, handle_fasteoi_irq);
+	struct irq_chip_type *ct = gc->chip_types;
+
+	ct->regs.mask = CEPIMR;
+	ct->chip.irq_mask = qepic_mask;
+	ct->chip.irq_unmask = qepic_unmask;
+	ct->regs.eoi = CEPIER;
+	ct->chip.irq_eoi = qepic_end;
+	ct->regs.type = CEPICR;
+	ct->chip.irq_set_type = qepic_set_type;
+	ct->chip.irq_calc_mask = qepic_calc_mask;
+
 	return 0;
 }
 
-static const struct irq_domain_ops qepic_host_ops = {
-	.map = qepic_host_map,
-};
+static int qepic_domain_init(struct irq_domain *d)
+{
+	struct qepic_data *data = d->host_data;
 
-static void qepic_remove(void *res)
+	irq_set_chained_handler_and_data(data->irq, qepic_cascade, data);
+
+	return 0;
+}
+
+static void qepic_domain_exit(struct irq_domain *d)
 {
-	struct qepic_data *data = res;
+	struct qepic_data *data = d->host_data;
 
 	irq_set_chained_handler_and_data(data->irq, NULL, NULL);
-	irq_domain_remove(data->host);
 }
 
 static int qepic_probe(struct platform_device *pdev)
 {
+	struct irq_domain_chip_generic_info dgc_info = {
+		.name		= "QEPIC",
+		.handler	= handle_fasteoi_irq,
+		.irqs_per_chip	= 32,
+		.num_ct		= 1,
+		.init		= qepic_chip_init,
+	};
+	struct irq_domain_info d_info = {
+		.fwnode		= of_fwnode_handle(pdev->dev.of_node),
+		.domain_flags	= IRQ_DOMAIN_FLAG_DESTROY_GC,
+		.size		= 32,
+		.hwirq_max	= 32,
+		.ops		= &irq_generic_chip_ops,
+		.dgc_info	= &dgc_info,
+		.init		= qepic_domain_init,
+		.exit		= qepic_domain_exit,
+	};
 	struct device *dev = &pdev->dev;
 	struct qepic_data *data;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
+	d_info.host_data = data;
 
 	data->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->reg))
@@ -125,14 +158,16 @@ static int qepic_probe(struct platform_device *pdev)
 	if (data->irq < 0)
 		return data->irq;
 
-	data->host = irq_domain_create_linear(dev_fwnode(dev), 32, &qepic_host_ops, data);
-	if (!data->host)
-		return -ENODEV;
+	data->host = devm_irq_domain_instantiate(dev, &d_info);
+	if (IS_ERR(data->host))
+		return PTR_ERR(data->host);
 
-	irq_set_chained_handler_and_data(data->irq, qepic_cascade, data);
-
-	return devm_add_action_or_reset(dev, qepic_remove, data);
+	data->gc = irq_get_domain_generic_chip(data->host, 0);
+	if (!data->gc)
+		return -ENODEV;
+	data->gc->reg_base = data->reg;
 
+	return 0;
 }
 
 static const struct of_device_id qepic_match[] = {

-- 
2.55.0


