Return-Path: <linux-gpio+bounces-39651-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CyKsKKElTmpaEAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39651-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:25:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E08724462
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 12:25:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=LLEBkXRz;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39651-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39651-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0825C305E1AD
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 10:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24BD3E5EC5;
	Wed,  8 Jul 2026 10:16:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1CB421A17;
	Wed,  8 Jul 2026 10:16:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505770; cv=none; b=PPFdMxZvxI/szNtESv8yoJLSyyrO7yClgJsEJUUsEZSuXdkQAsXDLPdIc7RuW1iMgza4b3VOtNGK34o9sB0xSZnqtfSkJubnvyxM4OLMEildYc1dguGS9YVzaEwfEWH2VE0sTte/7JOu+lfknwHgWM425pE8cfwPgsUPR9KN8n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505770; c=relaxed/simple;
	bh=2fU5qgzI067+YKsW5U6XhpL6PROn/SmAkPi2/0Y1X4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJFYwdVQA8bQI+oSBxf0ttd2FrITFo+KSjDjN0HceCwPQ3xbARhhMAbC2XWNvECYBiwHZ1OIdA7uGYcBDkdIG0IGACXKp2vfvKBSq8eQh79KEFSfeJmjmbwPFPbxiv0/ezLn87aGVoUCgtk+H+M2IuyLrwN8ow1+ZZBTbkI124M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LLEBkXRz; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E2B681A0EDD;
	Wed,  8 Jul 2026 10:16:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B719160337;
	Wed,  8 Jul 2026 10:16:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E39F11BC3441;
	Wed,  8 Jul 2026 12:16:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505766; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Qadg2bKcBCZki//uobbEy5MLY0VFB6w3J0kBGnJdHgY=;
	b=LLEBkXRzNYn0Bk7u5ijbpYCGog03MdICeT52N+u9/QVGAA2EdTr75iO5F6KoSVflK9W92v
	G5kJ4SzIiBA+klFpg2Ix/NRD+cDPmsAUZGEdlfhEoX8hyDYLAoLiFjQyvYEkQfMp4SNzjh
	6AWB8uUVe6MtCo2B3mt6gsg63QzgPc/YgDLU7+6jRmeLH5uphv9GePaGXdrh1fBbwZFYnF
	wn6JwewOURipCkgpHNZAf/Es1fIutSJJHq7AUlNPgHdhYRN7eUyAluy93skTjddAJ4MCBN
	0vulpIL26Pohw06Sg9Ovn/g+upnptfaRZvTAoC/dgKaXvsoNKcanbsORpTANYg==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 08 Jul 2026 12:15:21 +0200
Subject: [PATCH v2 08/10] soc: fsl: qe: Convert to generic IRQ chip
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-qe-pic-gpios-v2-8-1972044cfbd1@bootlin.com>
References: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
In-Reply-To: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
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
 Herve Codina <herve.codina@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783505738; l=6809;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=2fU5qgzI067+YKsW5U6XhpL6PROn/SmAkPi2/0Y1X4E=;
 b=Sogx0Kfqnx0YsIBHXourwPbb83lbMeVKM7SwyB95fn0masdYi5WdafxfWg3vMq7aDRYxYN+Ts
 siKndxjXUCLDjFNvbYcABkEJvsre2fhsuTXSrarHEMnpYQnarU8t93K
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
	TAGGED_FROM(0.00)[bounces-39651-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com];
	FORGED_SENDER(0.00)[paul.louvel@bootlin.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:qiang.zhao@nxp.com,m:chleroy@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:paul.louvel@bootlin.com,m:herve.codina@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bootlin.com:from_mime,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05E08724462

The generic IRQ chip framework is available to handle IRQ chips. Using
this framework for the QE interrupt controller allows to simplify the
driver. Indeed, the framework internally handles operations coded
directly in the driver.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/Kconfig       |   1 +
 drivers/soc/fsl/qe/qe_ports_ic.c | 116 +++++++++++++++++++++++++--------------
 2 files changed, 76 insertions(+), 41 deletions(-)

diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
index b35a8fd30ebf..87cd1662e168 100644
--- a/drivers/soc/fsl/qe/Kconfig
+++ b/drivers/soc/fsl/qe/Kconfig
@@ -71,6 +71,7 @@ config QE_USB
 config QE_GPIO
 	bool "QE GPIO support"
 	depends on QUICC_ENGINE
+	select GENERIC_IRQ_CHIP
 	select GPIOLIB
 	help
 	  Say Y here if you're going to use hardware that connects to the
diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index 29f4334db5a0..4f6b75439f9f 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -18,107 +18,144 @@
 
 struct qepic_data {
 	void __iomem *reg;
-	struct irq_domain *host;
 	int irq;
 };
 
 static void qepic_mask(struct irq_data *d)
 {
-	struct qepic_data *data = irq_data_get_irq_chip_data(d);
-	u32 val = ioread32be(data->reg + CEPIMR);
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	u32 val;
 
-	iowrite32be(val & ~(1 << (31 - irqd_to_hwirq(d))), data->reg + CEPIMR);
+	guard(raw_spinlock)(&gc->lock);
+
+	val = ioread32be(gc->reg_base + CEPIMR);
+	iowrite32be(val & ~d->mask, gc->reg_base + CEPIMR);
 }
 
 static void qepic_unmask(struct irq_data *d)
 {
-	struct qepic_data *data = irq_data_get_irq_chip_data(d);
-	u32 val = ioread32be(data->reg + CEPIMR);
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	u32 val;
+
+	guard(raw_spinlock)(&gc->lock);
 
-	iowrite32be(val | 1 << (31 - irqd_to_hwirq(d)), data->reg + CEPIMR);
+	val = ioread32be(gc->reg_base + CEPIMR);
+	iowrite32be(val | d->mask, gc->reg_base + CEPIMR);
 }
 
 static void qepic_end(struct irq_data *d)
 {
-	struct qepic_data *data = irq_data_get_irq_chip_data(d);
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 
-	iowrite32be(1 << (31 - irqd_to_hwirq(d)), data->reg + CEPIER);
+	iowrite32be(d->mask, gc->reg_base + CEPIER);
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
-	u32 val = ioread32be(data->reg + CEPICR);
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	u32 val;
 
+	guard(raw_spinlock)(&gc->lock);
+
+	val = ioread32be(gc->reg_base + CEPICR);
 	switch (flow_type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_FALLING:
-		iowrite32be(val | 1 << (31 - vec), data->reg + CEPICR);
+		iowrite32be(val | d->mask, gc->reg_base + CEPICR);
 		return 0;
 	case IRQ_TYPE_EDGE_BOTH:
 	case IRQ_TYPE_NONE:
-		iowrite32be(val & ~(1 << (31 - vec)), data->reg + CEPICR);
+		iowrite32be(val & ~d->mask, gc->reg_base + CEPICR);
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
-	struct qepic_data *data = irq_desc_get_handler_data(desc);
+	struct irq_domain *domain = irq_desc_get_handler_data(desc);
+	struct irq_chip_generic *gc = irq_get_domain_generic_chip(domain, 0);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long event, bit;
 
 	chained_irq_enter(chip, desc);
 
-	event = ioread32be(data->reg + CEPIER);
+	event = ioread32be(gc->reg_base + CEPIER);
 	if (!event) {
 		handle_bad_irq(desc);
 		goto out;
 	}
 
 	for_each_set_bit(bit, &event, 32)
-		generic_handle_domain_irq(data->host, 31 - bit);
+		generic_handle_domain_irq(domain, 31 - bit);
 
 out:
 	chained_irq_exit(chip, desc);
 }
 
-static int qepic_host_map(struct irq_domain *h, unsigned int virq, irq_hw_number_t hw)
+static int qepic_chip_init(struct irq_chip_generic *gc)
 {
-	irq_set_chip_data(virq, h->host_data);
-	irq_set_chip_and_handler(virq, &qepic, handle_fasteoi_irq);
+	struct qepic_data *data = gc->domain->host_data;
+	struct irq_chip_type *ct = gc->chip_types;
+
+	gc->reg_base = data->reg;
+
+	ct->chip.irq_mask = qepic_mask;
+	ct->chip.irq_unmask = qepic_unmask;
+	ct->chip.irq_eoi = qepic_end;
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
+
+	irq_set_chained_handler_and_data(data->irq, qepic_cascade, d);
+
+	return 0;
+}
 
-static void qepic_remove(void *res)
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
+		.name = "QEPIC",
+		.handler = handle_fasteoi_irq,
+		.irqs_per_chip = 32,
+		.num_ct = 1,
+		.init = qepic_chip_init,
+	};
+	struct irq_domain_info d_info = {
+		.fwnode = of_fwnode_handle(pdev->dev.of_node),
+		.domain_flags = IRQ_DOMAIN_FLAG_DESTROY_GC,
+		.size = 32,
+		.hwirq_max = 32,
+		.ops = &irq_generic_chip_ops,
+		.dgc_info = &dgc_info,
+		.init = qepic_domain_init,
+		.exit = qepic_domain_exit,
+	};
 	struct device *dev = &pdev->dev;
+	struct irq_domain *domain;
 	struct qepic_data *data;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
+	d_info.host_data = data;
 
 	data->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->reg))
@@ -128,14 +165,11 @@ static int qepic_probe(struct platform_device *pdev)
 	if (data->irq < 0)
 		return data->irq;
 
-	data->host = irq_domain_create_linear(dev_fwnode(dev), 32, &qepic_host_ops, data);
-	if (!data->host)
-		return -ENODEV;
-
-	irq_set_chained_handler_and_data(data->irq, qepic_cascade, data);
-
-	return devm_add_action_or_reset(dev, qepic_remove, data);
+	domain = devm_irq_domain_instantiate(dev, &d_info);
+	if (IS_ERR(domain))
+		return PTR_ERR(domain);
 
+	return 0;
 }
 
 static const struct of_device_id qepic_match[] = {

-- 
2.55.0


