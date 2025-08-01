Return-Path: <linux-gpio+bounces-23931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8420B17F15
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 11:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2301A18852CC
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 09:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61BC21D3DB;
	Fri,  1 Aug 2025 09:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AWEHDj9K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3E93C38;
	Fri,  1 Aug 2025 09:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754039886; cv=none; b=Io4x5bNt9l9xub4/tomzDPRhyyJ8PXuA0Un7klhGS7ugZDSbstqWYg/a0YKQXzS/Hla60A4F6i08kwQF1jXoFipWunJhwBosEMC8dBaRpZbLzyI9mvzmjF7qz2bSuQ1qD+FRe4hCPj/OTcNjPFLPoZvqjvAG1Vx2SdyfDuawFW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754039886; c=relaxed/simple;
	bh=J1eEF10rhJAnQ13Hw21v83TTHqtVdgLTWvjL928gjzo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qf1KwjUyfNMG/KraVEBzSFgSwMjqpIfUPoU4Mj+vbjpVS4I3F0/2Uw4sH9QsTm3JJJGd8B/qm1nV7bn9Uur2rr2wXABpTbR9tJgiAkRpkyYk/NC7lj1HfBY6ONBNLLyjNaderRPoXQf+5Ipaux8++6QWLAOnBgtQpVSBG+lYEMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AWEHDj9K; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AF3F4326F;
	Fri,  1 Aug 2025 09:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754039875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FewFLMj+fQDz2hp2M+gKHcBCf6X6YGYBd1gKSrxKs0g=;
	b=AWEHDj9KJ+miPFgXXzlgaTyOIImVkGkzHbYP+aHwKGM9PjqgcnK3TtRDL4sPb6dQdcllf9
	kzeaw4DAF+Pcqay33L32HSvOkSGUHV98InrB8pscontn/77hbMvkPzozxjlZ4qpwII0ccX
	PLlac8wupo/0rYU4la04VssrvOk85kMT6nsyLBByEdfj+d8ZmjHryIVd8OnOtgy2FNWrS5
	QpTGBNCvedMkC2MWXiakTryK8gUdU6NJ+FzEdei2niHajG3GEDBgzE8e+iKgK5u8X7pwqf
	Q7rfExdxNq/iOFXWReIq45iYfwWecaKuaWaPs/oiJHXmdAXqXaQmNPUg0AUywg==
Date: Fri, 1 Aug 2025 11:17:53 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, Serge
 Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Miquel
 Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 5/6] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
Message-ID: <20250801111753.382f52ac@bootlin.com>
In-Reply-To: <20250730204733.GA1717453-robh@kernel.org>
References: <20250725152618.32886-1-herve.codina@bootlin.com>
	<20250725152618.32886-6-herve.codina@bootlin.com>
	<20250729195137.GA658914-robh@kernel.org>
	<20250730115421.770d99bf@bootlin.com>
	<20250730204733.GA1717453-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdeffeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhorghnsehoshdrrghmphgvrhgvtghomhhpuhhtihhnghdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdou
 ghtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

Hi Rob,

On Wed, 30 Jul 2025 15:47:33 -0500
Rob Herring <robh@kernel.org> wrote:

...
> > > > +
> > > > +static int irqmux_imap_cb(void *data, const __be32 *imap,
> > > > +			  const struct of_phandle_args *parent_args)
> > > > +{
> > > > +	struct irqmux_cb_data *priv = data;
> > > > +	u32 src_hwirq;
> > > > +	int index;
> > > > +
> > > > +	/*
> > > > +	 * The child #address-cells is 0. Already checked in irqmux_setup().
> > > > +	 * The first value in imap is the src_hwirq
> > > > +	 */
> > > > +	src_hwirq = be32_to_cpu(*imap);    
> > > 
> > > The iterator should take care of the endianness conversion.  
> > 
> > Ok, it will take care.
> >   
> > >   
> > > > +
> > > > +	/*
> > > > +	 * Get the index in our interrupt array that matches the parent in the
> > > > +	 * interrupt-map
> > > > +	 */
> > > > +	index = irqmux_find_interrupt_index(priv->dev, priv->np, parent_args);
> > > > +	if (index < 0)
> > > > +		return dev_err_probe(priv->dev, index, "output interrupt not found\n");
> > > > +
> > > > +	dev_info(priv->dev, "interrupt %u mapped to output interrupt[%u]\n",
> > > > +		 src_hwirq, index);    
> > > 
> > > Do you even need "interrupts"? Just make the "interrupt-map" index 
> > > important and correspond to the hw index. That would greatly simplify 
> > > all this.  
> > 
> > I would like to avoid to be based on the interrupt-map index.
> > 
> > Indeed, IMHO, it is less robust. I don't thing that we can enforce the
> > interrupt-map items order. Based on interrupt-map index, we need to ensure
> > that the first item is related to GIC 103, the second one to GIC 104 and so
> > on.  
> 
> How exactly are you enforcing that order for "interrupts"? You can't.

I can impose interrupt-names property in the binding and at least, those
names are to be in order (checked by dtbs_check).

Based on that if a mismatch is present between interrupt-names and
interrupts it is an issue in the dts used.

With interrupt-map, nothing can be imposed and so nothing can be checked.

> 
> Aren't you just duplicating the information in "interrupts" in the 
> interrupt-map.
> 

I will remove 'interrupts' in the next iteration and use only 'interrupt-map'.

I will add some information related to the order of the interrup-map item in the
binding (description of the interrupt-map property).

Best regards,
Hervé

