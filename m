Return-Path: <linux-gpio+bounces-23894-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0236B15D88
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 11:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE98D3A45B0
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 09:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1BB293B4C;
	Wed, 30 Jul 2025 09:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KmXUO4Wq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FBA442C;
	Wed, 30 Jul 2025 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753869267; cv=none; b=fnqaK0dnN0qVi7vM+tWYEv1Tgu+aoHhu53v2MVcTk7q5BFDOzrsj+Hy11N5Q13bNaGljaTC/JDaM/GZO7T5c4z0GVE9QutiNpmsffIdkWCpYrtzju5XR5yYR+BszGGmSyIL/o+J67GAZ0bX5vsQFFIj3o2wZOZxij2tI5iLk/iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753869267; c=relaxed/simple;
	bh=JliacoCtK5j0DKn71ybgNXHHkJQzdyhYXbhX8z7fdos=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IduRJ5pE2u6wG70jwRW71Ntls1RS3E7zqj8hUNtsjP5/caQjiOqVJt75vrFaWhXB0vB68TFUORCMz/s8KMKS7to6B1U1wvmb5BDU77FtjeYey5zAgYFiLqrqKCOV0htMnvpA9842YuMNIbEK4lyZTh/gk2RoakuzSO5SSSJYlIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KmXUO4Wq; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE35443173;
	Wed, 30 Jul 2025 09:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753869263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1PP918sGSIPuq6wRtcjBer+cHyUovX7JvOYbDIDINdY=;
	b=KmXUO4WqYJXYLmKtBQfhwAHlbEgZ2TdiIF7Qb+JSO7n0l5pVaztHfzq9YHqcE23OLAOPq0
	Qw8znwEDRXY/XZtAh4FiB+GX+URemFb0+reXGUyM9rNp6zIsEXMdVXaeI0Q4P/Xzvtoizp
	yEaSXPx7QLh6WnnJ5V+3G3VirJJDohkw7uxx/F+aUFoKWhVmZDZqEtBmA6euZoMas9Tk5P
	Z9xPpcgeGdUBpBjNDJTaJpkDC0X55ux9d1g9SA6u1ksfg/xFM5rVsl5ECg+73CwleMpUgb
	3sw9ZvwIZKUnUlnH4RMdd88JJk5KYClnNeTFmuycFVJyppgRW+5zqz93LCQw0w==
Date: Wed, 30 Jul 2025 11:54:21 +0200
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
Message-ID: <20250730115421.770d99bf@bootlin.com>
In-Reply-To: <20250729195137.GA658914-robh@kernel.org>
References: <20250725152618.32886-1-herve.codina@bootlin.com>
	<20250725152618.32886-6-herve.codina@bootlin.com>
	<20250729195137.GA658914-robh@kernel.org>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeljeeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhohgrnhesohhsrdgrmhhpvghrvggtohhmphhuthhinhhgrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgut
 heskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi Rob,

On Tue, 29 Jul 2025 14:51:37 -0500
Rob Herring <robh@kernel.org> wrote:

> On Fri, Jul 25, 2025 at 05:26:14PM +0200, Herve Codina wrote:
> > On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> > interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> > order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
> > 
> > The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> > IRQ lines out of the 96 available to wire them to the GIC input lines.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  drivers/soc/renesas/Kconfig       |   4 +
> >  drivers/soc/renesas/Makefile      |   1 +
> >  drivers/soc/renesas/rzn1_irqmux.c | 169 ++++++++++++++++++++++++++++++
> >  3 files changed, 174 insertions(+)
> >  create mode 100644 drivers/soc/renesas/rzn1_irqmux.c
> > 
> > diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> > index fbc3b69d21a7..9e8ac33052fb 100644
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -58,6 +58,7 @@ config ARCH_RZN1
> >  	select PM
> >  	select PM_GENERIC_DOMAINS
> >  	select ARM_AMBA
> > +	select RZN1_IRQMUX
> >  
> >  if ARM && ARCH_RENESAS
> >  
> > @@ -435,6 +436,9 @@ config PWC_RZV2M
> >  config RST_RCAR
> >  	bool "Reset Controller support for R-Car" if COMPILE_TEST
> >  
> > +config RZN1_IRQMUX
> > +	bool "Renesas RZ/N1 GPIO IRQ multiplexer support" if COMPILE_TEST
> > +
> >  config SYSC_RZ
> >  	bool "System controller for RZ SoCs" if COMPILE_TEST
> >  
> > diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
> > index 3bdcc6a395d5..daa932c7698d 100644
> > --- a/drivers/soc/renesas/Makefile
> > +++ b/drivers/soc/renesas/Makefile
> > @@ -14,4 +14,5 @@ obj-$(CONFIG_SYS_R9A09G057)	+= r9a09g057-sys.o
> >  # Family
> >  obj-$(CONFIG_PWC_RZV2M)		+= pwc-rzv2m.o
> >  obj-$(CONFIG_RST_RCAR)		+= rcar-rst.o
> > +obj-$(CONFIG_RZN1_IRQMUX)		+= rzn1_irqmux.o
> >  obj-$(CONFIG_SYSC_RZ)		+= rz-sysc.o
> > diff --git a/drivers/soc/renesas/rzn1_irqmux.c b/drivers/soc/renesas/rzn1_irqmux.c
> > new file mode 100644
> > index 000000000000..37e41c2b9104
> > --- /dev/null
> > +++ b/drivers/soc/renesas/rzn1_irqmux.c
> > @@ -0,0 +1,169 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * RZ/N1 GPIO Interrupt Multiplexer
> > + *
> > + * Copyright 2025 Schneider Electric
> > + * Author: Herve Codina <herve.codina@bootlin.com>
> > + */
> > +
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define IRQMUX_MAX_IRQS 8
> > +
> > +static int irqmux_is_phandle_args_equal(const struct of_phandle_args *a,
> > +					const struct of_phandle_args *b)
> > +{
> > +	int i;
> > +
> > +	if (a->np != b->np)
> > +		return false;
> > +
> > +	if (a->args_count != b->args_count)
> > +		return false;
> > +
> > +	for (i = 0; i < a->args_count; i++) {
> > +		if (a->args[i] != b->args[i])
> > +			return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > +static int irqmux_find_interrupt_index(struct device *dev, struct device_node *np,
> > +				       const struct of_phandle_args *expected_irq)
> > +{
> > +	struct of_phandle_args out_irq;
> > +	bool is_equal;
> > +	int ret;
> > +	int i;
> > +
> > +	for (i = 0; i < IRQMUX_MAX_IRQS; i++) {
> > +		ret = of_irq_parse_one(np, i, &out_irq);  
> 
> I don't really want more users of this... More below.
> 
> > +		if (ret)
> > +			return ret;
> > +
> > +		is_equal = irqmux_is_phandle_args_equal(expected_irq, &out_irq);
> > +		of_node_put(out_irq.np);
> > +		if (is_equal)
> > +			return i;
> > +	}
> > +
> > +	return -ENOENT;
> > +}
> > +
> > +struct irqmux_cb_data {
> > +	struct device_node *np;
> > +	struct device *dev;
> > +	u32 __iomem *regs;
> > +};
> > +
> > +static int irqmux_imap_cb(void *data, const __be32 *imap,
> > +			  const struct of_phandle_args *parent_args)
> > +{
> > +	struct irqmux_cb_data *priv = data;
> > +	u32 src_hwirq;
> > +	int index;
> > +
> > +	/*
> > +	 * The child #address-cells is 0. Already checked in irqmux_setup().
> > +	 * The first value in imap is the src_hwirq
> > +	 */
> > +	src_hwirq = be32_to_cpu(*imap);  
> 
> The iterator should take care of the endianness conversion.

Ok, it will take care.

> 
> > +
> > +	/*
> > +	 * Get the index in our interrupt array that matches the parent in the
> > +	 * interrupt-map
> > +	 */
> > +	index = irqmux_find_interrupt_index(priv->dev, priv->np, parent_args);
> > +	if (index < 0)
> > +		return dev_err_probe(priv->dev, index, "output interrupt not found\n");
> > +
> > +	dev_info(priv->dev, "interrupt %u mapped to output interrupt[%u]\n",
> > +		 src_hwirq, index);  
> 
> Do you even need "interrupts"? Just make the "interrupt-map" index 
> important and correspond to the hw index. That would greatly simplify 
> all this.

I would like to avoid to be based on the interrupt-map index.

Indeed, IMHO, it is less robust. I don't thing that we can enforce the
interrupt-map items order. Based on interrupt-map index, we need to ensure
that the first item is related to GIC 103, the second one to GIC 104 and so
on.

Anyway, I can simplify the code relying on the interrupt-map index even if
it is less robust.

I will propose this rework in the next iteration.

Best regards,
Hervé


> 
> > +
> > +	/*
> > +	 * Our interrupt array items matches 1:1 the interrupt lines that could
> > +	 * be configured by registers (same order, same number).
> > +	 * Configure the related register with the src hwirq retrieved from the
> > +	 * interrupt-map.
> > +	 */
> > +	writel(src_hwirq, priv->regs + index);
> > +
> > +	return 0;
> > +}  

