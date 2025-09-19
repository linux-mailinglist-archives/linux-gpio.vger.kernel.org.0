Return-Path: <linux-gpio+bounces-26377-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB9DB89A03
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0CE15856A9
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 13:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2289330ACFC;
	Fri, 19 Sep 2025 13:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Axz3FXF4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139CA20468E;
	Fri, 19 Sep 2025 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758287707; cv=none; b=oTaV8I631pHPMKBTjg7l5qyKZ7LasEf9RCfz3Zo75MbVoz8JHLvQL3YA4aJpGAbJlA90JIVyRed4glwW5HQI2RchBt6FViLSSpabx9ddOm2MENAL7wRs8tcpViN5WrErPYVBmagiILZ3QmQevSiqP89fVjhIPdvF0Ng0ny6fin4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758287707; c=relaxed/simple;
	bh=4fc6a0O2Ct2ACGyTZVA9k3181Dr2+/nX0D6D+4aFGQA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ahg6ZFBX8URHyQqQkZCVHSM117+XcmXcvTd7CCuc2XhsY/H7/ebITUFDxkLrqHsfL0GdvNQB0Xa5S/XhJucHbp346WVLKTENmWwIxaXIBVmZ/oFUkv11pna4qwFFNZ9w7tneMcnhXaRshpz2TqMyKPf0zY5y/zXmdVfsdmabzGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Axz3FXF4; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 62F10C8F1C5;
	Fri, 19 Sep 2025 13:14:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB47F606A8;
	Fri, 19 Sep 2025 13:15:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0E50102F17C5;
	Fri, 19 Sep 2025 15:14:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758287699; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zkLSfTCSK30R9rnBMrwgwQurzUY0AzbDvB3qzxOn7Vc=;
	b=Axz3FXF42lf4Jr7BG20uduI+4cHtaPmCNT+YGAtHgjs2YaI3lAqfOF52VepQXDiDCSqyIW
	2NNkJIXmbC5KnEdJUJe1VCrwIFmjDyjUQNGaPzY3eIh1cpWzs2SFTCNwOjuKz5CYMr+53u
	kRWOTUAydDlzosgQ+snn7FdhPrHmyC4XHPzlViUbtTqd4n6eT7LmLXORk/0b8IbhsS49kQ
	ycXbS/oneOwhVtcHgJ1tKE6kbACHX/HpH+27DGH6VaSlEH0gCb3iCP/XgIOP/5BPP46a7X
	3wPkVjOTgkkNTnEx6tMUxx0tmQi6qfRmOYVszE+GUbjO1dWCynOvzzBPOwJqAg==
Date: Fri, 19 Sep 2025 15:14:48 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Hoan Tran
 <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, Serge
 Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Pascal
 Eberhard <pascal.eberhard@se.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
Message-ID: <20250919151448.14f8719a@bootlin.com>
In-Reply-To: <aM0lU01x1w2wB3LG@ninjato>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
	<20250918104009.94754-8-herve.codina@bootlin.com>
	<aM0lU01x1w2wB3LG@ninjato>
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
X-Last-TLS-Session-Version: TLSv1.3

Hi Wolfram,

On Fri, 19 Sep 2025 11:41:39 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Hi Herve,
> 
> > +#define IRQMUX_MAX_IRQS 8
> > +
> > +static int irqmux_setup(struct device *dev, struct device_node *np, u32 __iomem *regs)  
> 
> The whole driver would benefit from a 'rzn1_irqmux' instead of 'irqmux'
> prefix, I'd say.

Agree, I will used the 'rzn1_irqmux' prefix.

> 
> > +	for_each_of_imap_item(&imap_parser, &imap_item) {
> > +		/*
> > +		 * The child #address-cells is 0 (already checked). The first
> > +		 * value in imap item is the src hwirq.
> > +		 *
> > +		 * imap items matches 1:1 the interrupt lines that could
> > +		 * be configured by registers (same order, same number).
> > +		 * Configure the related register with the src hwirq retrieved
> > +		 * from the interrupt-map.
> > +		 */  
> 
> I haven't looked into the above for_each_of_imap_item-helper. But
> wouldn't it be possibleto retrieve the GIC_SPI number as well and use
> the correct register based on that? That would remove the need of an
> already sorted interrupt-map.

Hum, this give the knowledge of the GIC interrupt number in the driver itself.

Not sure that the mapping between the output interrupt line number N (handled
by register index N) and the GIC interrupt number X should be hardcoded in
the driver.

In my v1 series iteration, I used the 'interrupts' property to provide this
missing information:
   interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>, /* line 0 (reg index 0) route to GIC 103 */
                <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>, /* line 1 (reg index 1) route to GIC 104 */
                <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>, /* line 2 (reg index 2) route to GIC 105 */
                ...

Base on the interrupts table and the interrupt-map, I deduce the reg index:
  - From interrupt-map, got a GIC interrupt number
  - From interrupts table and the GIC interrupt number, got the line/reg index.

Rob asked to use only interrupt-map and use directly the interrupt-map index as
the hardware index:
  https://lore.kernel.org/lkml/20250801111753.382f52ac@bootlin.com/

> 
> > +		if (index > IRQMUX_MAX_IRQS) {
> > +			of_node_put(imap_item.parent_args.np);
> > +			dev_err(dev, "too much items in interrupt-map\n");
> > +			return -EINVAL;  
> 
> -E2BIG? With such a unique errno, we could even drop the dev_err.

Yes sure.

> 
> > +		}
> > +
> > +		writel(imap_item.child_imap[0], regs + index);
> > +		index++;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int irqmux_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *np = dev->of_node;
> > +	u32 __iomem *regs;
> > +	int nr_irqs;
> > +	int ret;
> > +
> > +	regs = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(regs))
> > +		return PTR_ERR(regs);
> > +
> > +	nr_irqs = of_irq_count(np);
> > +	if (nr_irqs < 0)
> > +		return nr_irqs;
> > +
> > +	if (nr_irqs > IRQMUX_MAX_IRQS) {
> > +		dev_err(dev, "too many output interrupts\n");
> > +		return -ENOENT;  
> 
> -E2BIG? Wait, isn't this the same check twice?

This is not the same check but this one should not be there.

Indeed of_irq_count() counts the number of items available in the
'interrupts' property. This is not used anymore.

I missed to remove it from v1 to v2 updates (and also from v2 to v3).

The of_irq_count() call and related checks will be remove in the next
iteration.

Best regards,
Hervé

