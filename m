Return-Path: <linux-gpio+bounces-39490-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8r8EOlBlS2rOQgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39490-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 10:20:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B0E70E079
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 10:20:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NVEWslUl;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39490-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39490-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9100E323399D
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 07:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B133E2755;
	Mon,  6 Jul 2026 07:29:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0993380FC1;
	Mon,  6 Jul 2026 07:29:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322984; cv=none; b=AgySgI7ncJ5hNcWQNPigJqfT2IHIOFY+3AHgZy3GwwPBvq5mbvzaMBkct14i3Tf0BCjiafLnd/x6cT+QABPyZPvz/nZy3YSatGXohqB6KoSHW/BGl7PZEnJuZjTLaz2p9mNFsW1UGO4kuNFeJuoAQVQdgM06J9vR3ZVOfU0vSzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322984; c=relaxed/simple;
	bh=QFSTbP3AXZvJ/beXqlKt9fxMipVsbmFPRFkfbBCGmc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXCxFSKstlQhoQhImBE43U/YZAGPo4N6jQdgdUWEBujrK/bJmIpsD7eJ4waBHvykI3h808qyjrhgaZ3XuFL9stIbLM75ps/8TXmjPfm89yUWBIdGYz3WJnLf5VQgyC1uL99OA18iiohu9iWeWhqhYwdMtUtBud8K6Yo8N0neaMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVEWslUl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810511F000E9;
	Mon,  6 Jul 2026 07:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783322973;
	bh=nKzS4u+YMAULxq77QG+jAD+p3P+6bru/DOGdl2pXd3c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NVEWslUl0Zu3708doVCVsHGsSAvnFlr7Y9mhT+u+DPekJi1OIaVTL4mg5xsBvkpk4
	 4TiwyvDhjMrZ1WZ1zqDX6ZySpImhYg+kXowq5kX+S5KuLp1SnyB6sZGCbQSmw0q78v
	 1xbNm444HWiQmTjKVUsRnI7wOwGQdKoyHvNAjgx0FhgCJWS3Gd+O6Ly03O4ROBXHrG
	 7IgAi8VN51DB3VfmWXazcktu1j6/7fZaxI1eG/AJsKU2p4pDvP9NaadITHcOgNfGZI
	 YTKDUYaDJDC6c2mX0aE+z50g3ugtao+cEss+pdpngNMFcmOpHw7r5aVROYRbKZZ8tC
	 2S/OJ2kf/+hOQ==
Message-ID: <34946670-2a76-47fa-af82-3d70cdc9d8f0@kernel.org>
Date: Mon, 6 Jul 2026 09:29:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] soc: fsl: qe: Convert to generic IRQ chip
To: Paul Louvel <paul.louvel@bootlin.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-8-6c3e706e27dc@bootlin.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260703-qe-pic-gpios-v1-8-6c3e706e27dc@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:paul.louvel@bootlin.com,m:qiang.zhao@nxp.com,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:thomas.petazzoni@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[bootlin.com,nxp.com,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39490-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83B0E70E079

Hi Paul,

Le 03/07/2026 à 15:30, Paul Louvel a écrit :
> The generic IRQ chip framework is available to handle IRQ chips. Using
> this framework for the QE interrupt controller allows to simplify the
> driver. Indeed, the framework internally handles operations coded
> directly in the driver.
> 
> Add a select dependency to GENERIC_IRQ_CHIP in the PPC platform Kconfig.
> 
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
> ---
>   arch/powerpc/platforms/Kconfig   |   1 +
>   drivers/soc/fsl/qe/qe_ports_ic.c | 103 ++++++++++++++++++++++++++-------------
>   2 files changed, 70 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
> index c4e61843d9d9..b0b3a80f8cde 100644
> --- a/arch/powerpc/platforms/Kconfig
> +++ b/arch/powerpc/platforms/Kconfig
> @@ -232,6 +232,7 @@ config QE_GPIO
>   	bool "QE GPIO support"
>   	depends on QUICC_ENGINE
>   	select GPIOLIB
> +	select GENERIC_IRQ_CHIP
>   	help
>   	  Say Y here if you're going to use hardware that connects to the
>   	  QE GPIOs.
> diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
> index c8b73b0aa233..d022aa224f6d 100644
> --- a/drivers/soc/fsl/qe/qe_ports_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ports_ic.c
> @@ -20,63 +20,65 @@ struct qepic_data {
>   	void __iomem *reg;
>   	struct irq_domain *host;
>   	int irq;
> +	struct irq_chip_generic *gc;
>   };
>   
>   static void qepic_mask(struct irq_data *d)
>   {
> -	struct qepic_data *data = irq_data_get_irq_chip_data(d);
> +	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
> +	struct irq_chip_type *ct = irq_data_get_chip_type(d);
>   
> -	clrbits32(data->reg + CEPIMR, 1 << (31 - irqd_to_hwirq(d)));
> +	clrbits32(gc->reg_base + ct->regs.mask, d->mask);

Is there a real added value with this change ?

Previously we had:

00000000 <qepic_mask>:
    0:	81 03 00 18 	lwz     r8,24(r3)
    4:	81 28 00 00 	lwz     r9,0(r8)
    8:	7c 00 04 ac 	hwsync
    c:	81 29 00 10 	lwz     r9,16(r9)
   10:	0c 09 00 00 	twi     0,r9,0
   14:	4c 00 01 2c 	isync
   18:	80 e3 00 08 	lwz     r7,8(r3)
   1c:	3d 40 80 00 	lis     r10,-32768
   20:	81 08 00 00 	lwz     r8,0(r8)
   24:	7d 4a 3c 30 	srw     r10,r10,r7
   28:	7d 29 50 78 	andc    r9,r9,r10
   2c:	7c 00 04 ac 	hwsync
   30:	91 28 00 10 	stw     r9,16(r8)
   34:	4e 80 00 20 	blr

Now we have:

00000000 <qepic_mask>:
    0:	80 e3 00 18 	lwz     r7,24(r3)
    4:	81 03 00 10 	lwz     r8,16(r3)
    8:	81 27 00 00 	lwz     r9,0(r7)
    c:	81 48 00 94 	lwz     r10,148(r8)
   10:	7d 29 52 14 	add     r9,r9,r10
   14:	7c 00 04 ac 	hwsync
   18:	81 49 00 00 	lwz     r10,0(r9)
   1c:	0c 0a 00 00 	twi     0,r10,0
   20:	4c 00 01 2c 	isync
   24:	80 c3 00 00 	lwz     r6,0(r3)
   28:	81 27 00 00 	lwz     r9,0(r7)
   2c:	81 08 00 94 	lwz     r8,148(r8)
   30:	7d 4a 30 78 	andc    r10,r10,r6
   34:	7d 29 42 14 	add     r9,r9,r8
   38:	7c 00 04 ac 	hwsync
   3c:	91 49 00 00 	stw     r10,0(r9)
   40:	4e 80 00 20 	blr

We now have three more indirect loads (8x lwz instead of 5x), for 
loading some value which is already known at compile time.


>   }
>   
>   static void qepic_unmask(struct irq_data *d)
>   {
> -	struct qepic_data *data = irq_data_get_irq_chip_data(d);
> +	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
> +	struct irq_chip_type *ct = irq_data_get_chip_type(d);
>   
> -	setbits32(data->reg + CEPIMR, 1 << (31 - irqd_to_hwirq(d)));
> +	setbits32(gc->reg_base + ct->regs.mask, d->mask);
>   }
>   
>   static void qepic_end(struct irq_data *d)
>   {
> -	struct qepic_data *data = irq_data_get_irq_chip_data(d);
> +	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
> +	struct irq_chip_type *ct = irq_data_get_chip_type(d);
>   
> -	out_be32(data->reg + CEPIER, 1 << (31 - irqd_to_hwirq(d)));
> +	out_be32(gc->reg_base + ct->regs.eoi, d->mask);
> +}
> +
> +static void qepic_calc_mask(struct irq_data *d)
> +{
> +	d->mask = 1 << (31 - irqd_to_hwirq(d));
>   }
>   
>   static int qepic_set_type(struct irq_data *d, unsigned int flow_type)
>   {
> -	struct qepic_data *data = irq_data_get_irq_chip_data(d);
> -	unsigned int vec = (unsigned int)irqd_to_hwirq(d);
> +	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
> +	struct irq_chip_type *ct = irq_data_get_chip_type(d);
>   
>   	switch (flow_type & IRQ_TYPE_SENSE_MASK) {
>   	case IRQ_TYPE_EDGE_FALLING:
> -		setbits32(data->reg + CEPICR, 1 << (31 - vec));
> +		setbits32(gc->reg_base + ct->regs.type, d->mask);
>   		return 0;
>   	case IRQ_TYPE_EDGE_BOTH:
>   	case IRQ_TYPE_NONE:
> -		clrbits32(data->reg + CEPICR, 1 << (31 - vec));
> +		clrbits32(gc->reg_base + ct->regs.type, d->mask);
>   		return 0;
>   	}
>   	return -EINVAL;
>   }
>   
> -static struct irq_chip qepic = {
> -	.name = "QEPIC",
> -	.irq_mask = qepic_mask,
> -	.irq_unmask = qepic_unmask,
> -	.irq_eoi = qepic_end,
> -	.irq_set_type = qepic_set_type,
> -};
> -
>   static void qepic_cascade(struct irq_desc *desc)
>   {
>   	struct qepic_data *data = irq_desc_get_handler_data(desc);
> +	struct irq_chip_type *ct = data->gc->chip_types;
>   	struct irq_chip *chip = irq_desc_get_chip(desc);
>   	unsigned long event, bit;
>   
>   	chained_irq_enter(chip, desc);
>   
> -	event = in_be32(data->reg + CEPIER);
> +	event = in_be32(data->gc->reg_base + ct->regs.eoi);
>   	if (!event) {
>   		handle_bad_irq(desc);
>   		goto out;
> @@ -89,33 +91,64 @@ static void qepic_cascade(struct irq_desc *desc)
>   	chained_irq_exit(chip, desc);
>   }
>   
> -static int qepic_host_map(struct irq_domain *h, unsigned int virq, irq_hw_number_t hw)
> +static int qepic_chip_init(struct irq_chip_generic *gc)
>   {
> -	irq_set_chip_data(virq, h->host_data);
> -	irq_set_chip_and_handler(virq, &qepic, handle_fasteoi_irq);
> +	struct irq_chip_type *ct = gc->chip_types;
> +
> +	ct->regs.mask = CEPIMR;
> +	ct->chip.irq_mask = qepic_mask;
> +	ct->chip.irq_unmask = qepic_unmask;
> +	ct->regs.eoi = CEPIER;
> +	ct->chip.irq_eoi = qepic_end;
> +	ct->regs.type = CEPICR;
> +	ct->chip.irq_set_type = qepic_set_type;
> +	ct->chip.irq_calc_mask = qepic_calc_mask;

Are ct->regs.mask, ct->regs.eoi and ct->regs.type used anywhere else 
than locally in qepic_{mask/unmask/end/set_type} ?

Christophe

> +
>   	return 0;
>   }
>   
> -static const struct irq_domain_ops qepic_host_ops = {
> -	.map = qepic_host_map,
> -};
> +static int qepic_domain_init(struct irq_domain *d)
> +{
> +	struct qepic_data *data = d->host_data;
>   
> -static void qepic_remove(void *res)
> +	irq_set_chained_handler_and_data(data->irq, qepic_cascade, data);
> +
> +	return 0;
> +}
> +
> +static void qepic_domain_exit(struct irq_domain *d)
>   {
> -	struct qepic_data *data = res;
> +	struct qepic_data *data = d->host_data;
>   
>   	irq_set_chained_handler_and_data(data->irq, NULL, NULL);
> -	irq_domain_remove(data->host);
>   }
>   
>   static int qepic_probe(struct platform_device *pdev)
>   {
> +	struct irq_domain_chip_generic_info dgc_info = {
> +		.name		= "QEPIC",
> +		.handler	= handle_fasteoi_irq,
> +		.irqs_per_chip	= 32,
> +		.num_ct		= 1,
> +		.init		= qepic_chip_init,
> +	};
> +	struct irq_domain_info d_info = {
> +		.fwnode		= of_fwnode_handle(pdev->dev.of_node),
> +		.domain_flags	= IRQ_DOMAIN_FLAG_DESTROY_GC,
> +		.size		= 32,
> +		.hwirq_max	= 32,
> +		.ops		= &irq_generic_chip_ops,
> +		.dgc_info	= &dgc_info,
> +		.init		= qepic_domain_init,
> +		.exit		= qepic_domain_exit,
> +	};
>   	struct device *dev = &pdev->dev;
>   	struct qepic_data *data;
>   
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
> +	d_info.host_data = data;
>   
>   	data->reg = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(data->reg))
> @@ -125,14 +158,16 @@ static int qepic_probe(struct platform_device *pdev)
>   	if (data->irq < 0)
>   		return data->irq;
>   
> -	data->host = irq_domain_create_linear(dev_fwnode(dev), 32, &qepic_host_ops, data);
> -	if (!data->host)
> -		return -ENODEV;
> +	data->host = devm_irq_domain_instantiate(dev, &d_info);
> +	if (IS_ERR(data->host))
> +		return PTR_ERR(data->host);
>   
> -	irq_set_chained_handler_and_data(data->irq, qepic_cascade, data);
> -
> -	return devm_add_action_or_reset(dev, qepic_remove, data);
> +	data->gc = irq_get_domain_generic_chip(data->host, 0);
> +	if (!data->gc)
> +		return -ENODEV;
> +	data->gc->reg_base = data->reg;
>   
> +	return 0;
>   }
>   
>   static const struct of_device_id qepic_match[] = {
> 


