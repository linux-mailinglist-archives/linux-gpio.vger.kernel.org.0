Return-Path: <linux-gpio+bounces-23908-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C7EB167BF
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 22:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28D083B192F
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 20:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466A5219301;
	Wed, 30 Jul 2025 20:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DXEF/9BQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92A617BD3;
	Wed, 30 Jul 2025 20:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753908455; cv=none; b=ROWjouBRZSOMWkyRPhF/Ba8M9WRoSu2J2+VAndFyZT8sGjlSYKaviBV571LPnoXc8vfnpas2Q7LQEOZl1WkudsLMEwkt6NzfDohYQqvGnLKw9wpB+Ywg6XK3UtlHHKyA/hG66jAWh58oq6krhD+NcKp+a3PSjwgYe5iHPdmUA6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753908455; c=relaxed/simple;
	bh=RI0ksHF6O152eL68aDJf82KbbpvphujgM5aWcGo3uNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRfxUcsfxebQ0SwLb+f/H17OYF2A1eS4qgI36FFBVxD++Si5HtSIrXw8VxnPSGuR7F7n2EYAXSsA5QJKw2vrf80wm8yu4XMzPMqw3Z834zj5UM8pwy0tLr76DNcb6Lc2zaG6BOAMp1vqaVzIZfUHUNhEVSVJ8uZRHWofyvXElxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DXEF/9BQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542FDC4CEE3;
	Wed, 30 Jul 2025 20:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753908454;
	bh=RI0ksHF6O152eL68aDJf82KbbpvphujgM5aWcGo3uNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DXEF/9BQY5gJWoTcj2QRalWAgOTQjN8Q09CwQJoIAUti4iZsi1eErMTyzhqe+YudV
	 YBmToktDl7ADhktK08376xC2qPABezs52q7r8fc6Oclbqvm8ipsxMp1SWCYaQsI+Im
	 vN+nXsRDI2MyKQKbS4NTwvNE0G+TfERjk/s6TChnIPkYJxgaKoVHaz+1ZEXjqEOjgs
	 WOax7F6gUmcJbEcrZpukzZf6bS8HPtgSijnRkxRTHrv24S3V1zbU7pkE17brvIgFNw
	 wgLWdh9Y4mnA0no/AVICZKOtD29B/yGVqiKGwL1pbLZGFrv5KdSU8pUj+4Ej9dxoqZ
	 AuT1M4OwLWfow==
Date: Wed, 30 Jul 2025 15:47:33 -0500
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 5/6] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
Message-ID: <20250730204733.GA1717453-robh@kernel.org>
References: <20250725152618.32886-1-herve.codina@bootlin.com>
 <20250725152618.32886-6-herve.codina@bootlin.com>
 <20250729195137.GA658914-robh@kernel.org>
 <20250730115421.770d99bf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730115421.770d99bf@bootlin.com>

On Wed, Jul 30, 2025 at 11:54:21AM +0200, Herve Codina wrote:
> Hi Rob,
> 
> On Tue, 29 Jul 2025 14:51:37 -0500
> Rob Herring <robh@kernel.org> wrote:
> 
> > On Fri, Jul 25, 2025 at 05:26:14PM +0200, Herve Codina wrote:
> > > On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> > > interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> > > order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
> > > 
> > > The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> > > IRQ lines out of the 96 available to wire them to the GIC input lines.
> > > 
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > ---
> > >  drivers/soc/renesas/Kconfig       |   4 +
> > >  drivers/soc/renesas/Makefile      |   1 +
> > >  drivers/soc/renesas/rzn1_irqmux.c | 169 ++++++++++++++++++++++++++++++
> > >  3 files changed, 174 insertions(+)
> > >  create mode 100644 drivers/soc/renesas/rzn1_irqmux.c
> > > 
> > > diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> > > index fbc3b69d21a7..9e8ac33052fb 100644
> > > --- a/drivers/soc/renesas/Kconfig
> > > +++ b/drivers/soc/renesas/Kconfig
> > > @@ -58,6 +58,7 @@ config ARCH_RZN1
> > >  	select PM
> > >  	select PM_GENERIC_DOMAINS
> > >  	select ARM_AMBA
> > > +	select RZN1_IRQMUX
> > >  
> > >  if ARM && ARCH_RENESAS
> > >  
> > > @@ -435,6 +436,9 @@ config PWC_RZV2M
> > >  config RST_RCAR
> > >  	bool "Reset Controller support for R-Car" if COMPILE_TEST
> > >  
> > > +config RZN1_IRQMUX
> > > +	bool "Renesas RZ/N1 GPIO IRQ multiplexer support" if COMPILE_TEST
> > > +
> > >  config SYSC_RZ
> > >  	bool "System controller for RZ SoCs" if COMPILE_TEST
> > >  
> > > diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
> > > index 3bdcc6a395d5..daa932c7698d 100644
> > > --- a/drivers/soc/renesas/Makefile
> > > +++ b/drivers/soc/renesas/Makefile
> > > @@ -14,4 +14,5 @@ obj-$(CONFIG_SYS_R9A09G057)	+= r9a09g057-sys.o
> > >  # Family
> > >  obj-$(CONFIG_PWC_RZV2M)		+= pwc-rzv2m.o
> > >  obj-$(CONFIG_RST_RCAR)		+= rcar-rst.o
> > > +obj-$(CONFIG_RZN1_IRQMUX)		+= rzn1_irqmux.o
> > >  obj-$(CONFIG_SYSC_RZ)		+= rz-sysc.o
> > > diff --git a/drivers/soc/renesas/rzn1_irqmux.c b/drivers/soc/renesas/rzn1_irqmux.c
> > > new file mode 100644
> > > index 000000000000..37e41c2b9104
> > > --- /dev/null
> > > +++ b/drivers/soc/renesas/rzn1_irqmux.c
> > > @@ -0,0 +1,169 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * RZ/N1 GPIO Interrupt Multiplexer
> > > + *
> > > + * Copyright 2025 Schneider Electric
> > > + * Author: Herve Codina <herve.codina@bootlin.com>
> > > + */
> > > +
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_irq.h>
> > > +#include <linux/platform_device.h>
> > > +
> > > +#define IRQMUX_MAX_IRQS 8
> > > +
> > > +static int irqmux_is_phandle_args_equal(const struct of_phandle_args *a,
> > > +					const struct of_phandle_args *b)
> > > +{
> > > +	int i;
> > > +
> > > +	if (a->np != b->np)
> > > +		return false;
> > > +
> > > +	if (a->args_count != b->args_count)
> > > +		return false;
> > > +
> > > +	for (i = 0; i < a->args_count; i++) {
> > > +		if (a->args[i] != b->args[i])
> > > +			return false;
> > > +	}
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +static int irqmux_find_interrupt_index(struct device *dev, struct device_node *np,
> > > +				       const struct of_phandle_args *expected_irq)
> > > +{
> > > +	struct of_phandle_args out_irq;
> > > +	bool is_equal;
> > > +	int ret;
> > > +	int i;
> > > +
> > > +	for (i = 0; i < IRQMUX_MAX_IRQS; i++) {
> > > +		ret = of_irq_parse_one(np, i, &out_irq);  
> > 
> > I don't really want more users of this... More below.
> > 
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		is_equal = irqmux_is_phandle_args_equal(expected_irq, &out_irq);
> > > +		of_node_put(out_irq.np);
> > > +		if (is_equal)
> > > +			return i;
> > > +	}
> > > +
> > > +	return -ENOENT;
> > > +}
> > > +
> > > +struct irqmux_cb_data {
> > > +	struct device_node *np;
> > > +	struct device *dev;
> > > +	u32 __iomem *regs;
> > > +};
> > > +
> > > +static int irqmux_imap_cb(void *data, const __be32 *imap,
> > > +			  const struct of_phandle_args *parent_args)
> > > +{
> > > +	struct irqmux_cb_data *priv = data;
> > > +	u32 src_hwirq;
> > > +	int index;
> > > +
> > > +	/*
> > > +	 * The child #address-cells is 0. Already checked in irqmux_setup().
> > > +	 * The first value in imap is the src_hwirq
> > > +	 */
> > > +	src_hwirq = be32_to_cpu(*imap);  
> > 
> > The iterator should take care of the endianness conversion.
> 
> Ok, it will take care.
> 
> > 
> > > +
> > > +	/*
> > > +	 * Get the index in our interrupt array that matches the parent in the
> > > +	 * interrupt-map
> > > +	 */
> > > +	index = irqmux_find_interrupt_index(priv->dev, priv->np, parent_args);
> > > +	if (index < 0)
> > > +		return dev_err_probe(priv->dev, index, "output interrupt not found\n");
> > > +
> > > +	dev_info(priv->dev, "interrupt %u mapped to output interrupt[%u]\n",
> > > +		 src_hwirq, index);  
> > 
> > Do you even need "interrupts"? Just make the "interrupt-map" index 
> > important and correspond to the hw index. That would greatly simplify 
> > all this.
> 
> I would like to avoid to be based on the interrupt-map index.
> 
> Indeed, IMHO, it is less robust. I don't thing that we can enforce the
> interrupt-map items order. Based on interrupt-map index, we need to ensure
> that the first item is related to GIC 103, the second one to GIC 104 and so
> on.

How exactly are you enforcing that order for "interrupts"? You can't. 

Aren't you just duplicating the information in "interrupts" in the 
interrupt-map.

Rob

