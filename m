Return-Path: <linux-gpio+bounces-39494-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mkztJsZyS2pzRgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39494-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 11:17:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2043670E85C
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 11:17:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=226LxmgD;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39494-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39494-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DD0B309D214
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 09:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18ACC4252DA;
	Mon,  6 Jul 2026 08:57:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891693F9F32
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 08:57:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328229; cv=none; b=D2R0K6bdbzKg/N/I2FmdjF/U33jPlVdku9P+ZWl01n/j4xMV8rH9Lz7s5ICGUD/YYnLPcCojQmgQJeDQ+6WlBefyXhi1DjnuRoOD2vXO/uWoh6Oz2OruNXMYMCBZQ1LB+cSB5uVKfBVcildYSaUgSSJYtvTIdaxd00+XrVgVSFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328229; c=relaxed/simple;
	bh=wORaGP4//9vVX5KYq6wgckhG1BIiCPbskHNhQHXCxF4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=G6cpGWC9iV5kYGtZa5sgf4OIJShWn1NsLIyxjoiP/XqhciiY2EujLuCtGmpwrLmrdOZKoUQh8AQHQcjL+jpPogEKPrcSxmAoJqZXRYudiXGK/q9cxPcU3Sc6CZyG2AFY0HjM6yqZaR3KlwqL5PmteqWV3CUNF5OcMDPejQp0woA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=226LxmgD; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6F1644E40CA6;
	Mon,  6 Jul 2026 08:56:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C3F2601A2;
	Mon,  6 Jul 2026 08:56:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6433611BB9BF5;
	Mon,  6 Jul 2026 10:56:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783328218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kfFPiegXNTBdwL7ERGkc+qHbAJDd2t8DcXD4UdKo670=;
	b=226LxmgDjx9k9eSuB9lzIsww26Zz8Ic9NQLh0i4uMKUs5Gns2LhFiuf3n4DK4rypNVQe6A
	/TpEfY4XWaVCUItIlaFrreQ60DyDdR4yrIhQ7Ifkk9ediqJJ2qtvj5eNbgG2rYPxTMINl5
	QsFHXtk2CV2yU84tHFQIqppoEDMmr6XdW0fhgucdghDZOnx/TxPtMEEUhG8myLxd0CUBa4
	+nmESPjYRIUYipXI5FEiL+Dc7T2FY2aE/d1SC9wXNZJQ2ZpqDc3Rmj96g4Bxos7X2yrQfw
	MoilbPUhQ3q+DMaGgK9IdAQ/+MinohXiBRAcDgWPzwvaqv3OMIbAC9w90W8ARg==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 10:56:54 +0200
Message-Id: <DJRD3C0919EP.CTZYPXDY93HI@bootlin.com>
Cc: <linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 08/12] soc: fsl: qe: Convert to generic IRQ chip
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>, "Qiang Zhao" <qiang.zhao@nxp.com>, "Thomas
 Gleixner" <tglx@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Linus Walleij" <linusw@kernel.org>, "Bartosz Golaszewski"
 <brgl@kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael
 Ellerman" <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-8-6c3e706e27dc@bootlin.com>
 <34946670-2a76-47fa-af82-3d70cdc9d8f0@kernel.org>
In-Reply-To: <34946670-2a76-47fa-af82-3d70cdc9d8f0@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39494-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[paul.louvel@bootlin.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:thomas.petazzoni@bootlin.com,m:chleroy@kernel.org,m:paul.louvel@bootlin.com,m:qiang.zhao@nxp.com,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,bootlin.com,nxp.com,linux.ibm.com,ellerman.id.au,gmail.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.louvel@bootlin.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:mid,bootlin.com:from_mime,bootlin.com:url,bootlin.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2043670E85C

On Mon Jul 6, 2026 at 9:29 AM CEST, Christophe Leroy (CS GROUP) wrote:
> Hi Paul,
>
> Le 03/07/2026 =C3=A0 15:30, Paul Louvel a =C3=A9crit=C2=A0:
>> The generic IRQ chip framework is available to handle IRQ chips. Using
>> this framework for the QE interrupt controller allows to simplify the
>> driver. Indeed, the framework internally handles operations coded
>> directly in the driver.
>>=20
>> Add a select dependency to GENERIC_IRQ_CHIP in the PPC platform Kconfig.
>>=20
>> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
>> ---
>>   arch/powerpc/platforms/Kconfig   |   1 +
>>   drivers/soc/fsl/qe/qe_ports_ic.c | 103 ++++++++++++++++++++++++++-----=
--------
>>   2 files changed, 70 insertions(+), 34 deletions(-)
>>=20
>> diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kco=
nfig
>> index c4e61843d9d9..b0b3a80f8cde 100644
>> --- a/arch/powerpc/platforms/Kconfig
>> +++ b/arch/powerpc/platforms/Kconfig
>> @@ -232,6 +232,7 @@ config QE_GPIO
>>   	bool "QE GPIO support"
>>   	depends on QUICC_ENGINE
>>   	select GPIOLIB
>> +	select GENERIC_IRQ_CHIP
>>   	help
>>   	  Say Y here if you're going to use hardware that connects to the
>>   	  QE GPIOs.
>> diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_po=
rts_ic.c
>> index c8b73b0aa233..d022aa224f6d 100644
>> --- a/drivers/soc/fsl/qe/qe_ports_ic.c
>> +++ b/drivers/soc/fsl/qe/qe_ports_ic.c
>> @@ -20,63 +20,65 @@ struct qepic_data {
>>   	void __iomem *reg;
>>   	struct irq_domain *host;
>>   	int irq;
>> +	struct irq_chip_generic *gc;
>>   };
>>  =20
>>   static void qepic_mask(struct irq_data *d)
>>   {
>> -	struct qepic_data *data =3D irq_data_get_irq_chip_data(d);
>> +	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>> +	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
>>  =20
>> -	clrbits32(data->reg + CEPIMR, 1 << (31 - irqd_to_hwirq(d)));
>> +	clrbits32(gc->reg_base + ct->regs.mask, d->mask);
>
> Is there a real added value with this change ?
>
> Previously we had:
>
> 00000000 <qepic_mask>:
>     0:	81 03 00 18 	lwz     r8,24(r3)
>     4:	81 28 00 00 	lwz     r9,0(r8)
>     8:	7c 00 04 ac 	hwsync
>     c:	81 29 00 10 	lwz     r9,16(r9)
>    10:	0c 09 00 00 	twi     0,r9,0
>    14:	4c 00 01 2c 	isync
>    18:	80 e3 00 08 	lwz     r7,8(r3)
>    1c:	3d 40 80 00 	lis     r10,-32768
>    20:	81 08 00 00 	lwz     r8,0(r8)
>    24:	7d 4a 3c 30 	srw     r10,r10,r7
>    28:	7d 29 50 78 	andc    r9,r9,r10
>    2c:	7c 00 04 ac 	hwsync
>    30:	91 28 00 10 	stw     r9,16(r8)
>    34:	4e 80 00 20 	blr
>
> Now we have:
>
> 00000000 <qepic_mask>:
>     0:	80 e3 00 18 	lwz     r7,24(r3)
>     4:	81 03 00 10 	lwz     r8,16(r3)
>     8:	81 27 00 00 	lwz     r9,0(r7)
>     c:	81 48 00 94 	lwz     r10,148(r8)
>    10:	7d 29 52 14 	add     r9,r9,r10
>    14:	7c 00 04 ac 	hwsync
>    18:	81 49 00 00 	lwz     r10,0(r9)
>    1c:	0c 0a 00 00 	twi     0,r10,0
>    20:	4c 00 01 2c 	isync
>    24:	80 c3 00 00 	lwz     r6,0(r3)
>    28:	81 27 00 00 	lwz     r9,0(r7)
>    2c:	81 08 00 94 	lwz     r8,148(r8)
>    30:	7d 4a 30 78 	andc    r10,r10,r6
>    34:	7d 29 42 14 	add     r9,r9,r8
>    38:	7c 00 04 ac 	hwsync
>    3c:	91 49 00 00 	stw     r10,0(r9)
>    40:	4e 80 00 20 	blr
>
> We now have three more indirect loads (8x lwz instead of 5x), for=20
> loading some value which is already known at compile time.
>
>
>>   }
>>  =20
>>   static void qepic_unmask(struct irq_data *d)
>>   {
>> -	struct qepic_data *data =3D irq_data_get_irq_chip_data(d);
>> +	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>> +	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
>>  =20
>> -	setbits32(data->reg + CEPIMR, 1 << (31 - irqd_to_hwirq(d)));
>> +	setbits32(gc->reg_base + ct->regs.mask, d->mask);
>>   }
>>  =20
>>   static void qepic_end(struct irq_data *d)
>>   {
>> -	struct qepic_data *data =3D irq_data_get_irq_chip_data(d);
>> +	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>> +	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
>>  =20
>> -	out_be32(data->reg + CEPIER, 1 << (31 - irqd_to_hwirq(d)));
>> +	out_be32(gc->reg_base + ct->regs.eoi, d->mask);
>> +}
>> +
>> +static void qepic_calc_mask(struct irq_data *d)
>> +{
>> +	d->mask =3D 1 << (31 - irqd_to_hwirq(d));
>>   }
>>  =20
>>   static int qepic_set_type(struct irq_data *d, unsigned int flow_type)
>>   {
>> -	struct qepic_data *data =3D irq_data_get_irq_chip_data(d);
>> -	unsigned int vec =3D (unsigned int)irqd_to_hwirq(d);
>> +	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>> +	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
>>  =20
>>   	switch (flow_type & IRQ_TYPE_SENSE_MASK) {
>>   	case IRQ_TYPE_EDGE_FALLING:
>> -		setbits32(data->reg + CEPICR, 1 << (31 - vec));
>> +		setbits32(gc->reg_base + ct->regs.type, d->mask);
>>   		return 0;
>>   	case IRQ_TYPE_EDGE_BOTH:
>>   	case IRQ_TYPE_NONE:
>> -		clrbits32(data->reg + CEPICR, 1 << (31 - vec));
>> +		clrbits32(gc->reg_base + ct->regs.type, d->mask);
>>   		return 0;
>>   	}
>>   	return -EINVAL;
>>   }
>>  =20
>> -static struct irq_chip qepic =3D {
>> -	.name =3D "QEPIC",
>> -	.irq_mask =3D qepic_mask,
>> -	.irq_unmask =3D qepic_unmask,
>> -	.irq_eoi =3D qepic_end,
>> -	.irq_set_type =3D qepic_set_type,
>> -};
>> -
>>   static void qepic_cascade(struct irq_desc *desc)
>>   {
>>   	struct qepic_data *data =3D irq_desc_get_handler_data(desc);
>> +	struct irq_chip_type *ct =3D data->gc->chip_types;
>>   	struct irq_chip *chip =3D irq_desc_get_chip(desc);
>>   	unsigned long event, bit;
>>  =20
>>   	chained_irq_enter(chip, desc);
>>  =20
>> -	event =3D in_be32(data->reg + CEPIER);
>> +	event =3D in_be32(data->gc->reg_base + ct->regs.eoi);
>>   	if (!event) {
>>   		handle_bad_irq(desc);
>>   		goto out;
>> @@ -89,33 +91,64 @@ static void qepic_cascade(struct irq_desc *desc)
>>   	chained_irq_exit(chip, desc);
>>   }
>>  =20
>> -static int qepic_host_map(struct irq_domain *h, unsigned int virq, irq_=
hw_number_t hw)
>> +static int qepic_chip_init(struct irq_chip_generic *gc)
>>   {
>> -	irq_set_chip_data(virq, h->host_data);
>> -	irq_set_chip_and_handler(virq, &qepic, handle_fasteoi_irq);
>> +	struct irq_chip_type *ct =3D gc->chip_types;
>> +
>> +	ct->regs.mask =3D CEPIMR;
>> +	ct->chip.irq_mask =3D qepic_mask;
>> +	ct->chip.irq_unmask =3D qepic_unmask;
>> +	ct->regs.eoi =3D CEPIER;
>> +	ct->chip.irq_eoi =3D qepic_end;
>> +	ct->regs.type =3D CEPICR;
>> +	ct->chip.irq_set_type =3D qepic_set_type;
>> +	ct->chip.irq_calc_mask =3D qepic_calc_mask;
>
> Are ct->regs.mask, ct->regs.eoi and ct->regs.type used anywhere else=20
> than locally in qepic_{mask/unmask/end/set_type} ?

No they are not.
The main purpose of these registers is that they are used in the generic ir=
q
chip framework functions like irq_gc_mask_set_bit(), which we dropped earli=
er in
favor of using our own hooks.
At this stage, if you consider that the instructions overhead of the functi=
ons
above is already too much, it is better to get rid of the framework complet=
ly
then.

>
> Christophe
>
>> +
>>   	return 0;
>>   }
>>  =20
>> -static const struct irq_domain_ops qepic_host_ops =3D {
>> -	.map =3D qepic_host_map,
>> -};
>> +static int qepic_domain_init(struct irq_domain *d)
>> +{
>> +	struct qepic_data *data =3D d->host_data;
>>  =20
>> -static void qepic_remove(void *res)
>> +	irq_set_chained_handler_and_data(data->irq, qepic_cascade, data);
>> +
>> +	return 0;
>> +}
>> +
>> +static void qepic_domain_exit(struct irq_domain *d)
>>   {
>> -	struct qepic_data *data =3D res;
>> +	struct qepic_data *data =3D d->host_data;
>>  =20
>>   	irq_set_chained_handler_and_data(data->irq, NULL, NULL);
>> -	irq_domain_remove(data->host);
>>   }
>>  =20
>>   static int qepic_probe(struct platform_device *pdev)
>>   {
>> +	struct irq_domain_chip_generic_info dgc_info =3D {
>> +		.name		=3D "QEPIC",
>> +		.handler	=3D handle_fasteoi_irq,
>> +		.irqs_per_chip	=3D 32,
>> +		.num_ct		=3D 1,
>> +		.init		=3D qepic_chip_init,
>> +	};
>> +	struct irq_domain_info d_info =3D {
>> +		.fwnode		=3D of_fwnode_handle(pdev->dev.of_node),
>> +		.domain_flags	=3D IRQ_DOMAIN_FLAG_DESTROY_GC,
>> +		.size		=3D 32,
>> +		.hwirq_max	=3D 32,
>> +		.ops		=3D &irq_generic_chip_ops,
>> +		.dgc_info	=3D &dgc_info,
>> +		.init		=3D qepic_domain_init,
>> +		.exit		=3D qepic_domain_exit,
>> +	};
>>   	struct device *dev =3D &pdev->dev;
>>   	struct qepic_data *data;
>>  =20
>>   	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>>   	if (!data)
>>   		return -ENOMEM;
>> +	d_info.host_data =3D data;
>>  =20
>>   	data->reg =3D devm_platform_ioremap_resource(pdev, 0);
>>   	if (IS_ERR(data->reg))
>> @@ -125,14 +158,16 @@ static int qepic_probe(struct platform_device *pde=
v)
>>   	if (data->irq < 0)
>>   		return data->irq;
>>  =20
>> -	data->host =3D irq_domain_create_linear(dev_fwnode(dev), 32, &qepic_ho=
st_ops, data);
>> -	if (!data->host)
>> -		return -ENODEV;
>> +	data->host =3D devm_irq_domain_instantiate(dev, &d_info);
>> +	if (IS_ERR(data->host))
>> +		return PTR_ERR(data->host);
>>  =20
>> -	irq_set_chained_handler_and_data(data->irq, qepic_cascade, data);
>> -
>> -	return devm_add_action_or_reset(dev, qepic_remove, data);
>> +	data->gc =3D irq_get_domain_generic_chip(data->host, 0);
>> +	if (!data->gc)
>> +		return -ENODEV;
>> +	data->gc->reg_base =3D data->reg;
>>  =20
>> +	return 0;
>>   }
>>  =20
>>   static const struct of_device_id qepic_match[] =3D {
>>=20

Thanks,
Paul.



--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


