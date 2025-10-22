Return-Path: <linux-gpio+bounces-27438-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAEEBFC14D
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 849B95083F3
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA504348479;
	Wed, 22 Oct 2025 13:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CRb9AjB4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEDC347FC3
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 13:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761138239; cv=none; b=YYDk0PkckgEUpNAdNHVACUBMUHd04I6q9bPHvzvPerVjtpH1p/qq59Y1F4puymERyIrPAcPvOx/S7xIr5UmDjFhdX68ki7hQtjMXbobb+KmF//hglPlW6Aj8q6M4tUBrnoMmXMVgw2PWdRx5GWnB+fVGHemMN3ysaa1mdoGCqvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761138239; c=relaxed/simple;
	bh=qQz3ga9qmBR9R9/nc53usRDAIqxyK3MS0UKBQkFP8Is=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gm/1W/q/xDrc7Fe2/TXICjLfV8qwzoJ2PHEAF4H1/BQoKGY97vAGH0w2gAVo+27n1bZira5J6ize2uVo4Tts8sG+7VN0r92QA11xbIF5XkjzYBRs6vbgLmjmxOOHG9Ljos1j6fbo2ewer/FPwPX6WUGpL5Tdm83TUMMS2H9jftY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CRb9AjB4; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E28A3C0AFCD;
	Wed, 22 Oct 2025 13:03:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 80384606DC;
	Wed, 22 Oct 2025 13:03:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74172102F23A9;
	Wed, 22 Oct 2025 15:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761138232; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4bhiUbDPLaZq5ohRkNEUuLoQCCw3DEdqJYfVZiHrwgE=;
	b=CRb9AjB4eNLdX6Ehta3j5uPzuWX9Fuh38h2Y2zeA5ekGe6TdyVf1jn+IxMhk+3y5azpn1z
	mZLKLx68sft8yfWwDS26Ozawkxm6kPkv/Z7MEw1n2uvq7UJLRWESdGue3fWycHNX3KXw+B
	2ahFDQfQFzCqiNA9oa0hbY8wFKbf1NONU+IXeC/n5bYsC/jQHkYxKclTNfsEgNM/T100Ri
	gkIIhY4x00Sqt/nQu8m5lTXyS17zMbFIoNf0liqIwwnECsm7vQXd9kqriH86nDBAcC0olk
	xJR/fzUq0aJwjR3diCL4Ed+l15MWIw8H9lTWe5BTfiJR1+Gu6PoId3h9P7Nq2w==
Date: Wed, 22 Oct 2025 15:03:39 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Hoan Tran
 <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan
 <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, Phil
 Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Pascal Eberhard
 <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
Message-ID: <20251022150339.4c48649e@bootlin.com>
In-Reply-To: <CAMuHMdV03D_3b_JA2vzW4tE_QbkkT1bN1dm+zLLLX24oDHMj0Q@mail.gmail.com>
References: <20251020080648.13452-1-herve.codina@bootlin.com>
	<20251020080648.13452-8-herve.codina@bootlin.com>
	<CAMuHMdV03D_3b_JA2vzW4tE_QbkkT1bN1dm+zLLLX24oDHMj0Q@mail.gmail.com>
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

Hi Geert,

On Tue, 21 Oct 2025 15:05:35 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Hervé,
> 
> On Mon, 20 Oct 2025 at 10:08, Herve Codina (Schneider Electric)
> <herve.codina@bootlin.com> wrote:
> > On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> > interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> > order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
> >
> > The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> > IRQ lines out of the 96 available to wire them to the GIC input lines.
> >
> > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>  
> 
> Thanks for your patch!
> 
> > --- a/drivers/soc/renesas/Makefile
> > +++ b/drivers/soc/renesas/Makefile
> > @@ -14,4 +14,5 @@ obj-$(CONFIG_SYS_R9A09G057)   += r9a09g057-sys.o
> >  # Family
> >  obj-$(CONFIG_PWC_RZV2M)                += pwc-rzv2m.o
> >  obj-$(CONFIG_RST_RCAR)         += rcar-rst.o
> > +obj-$(CONFIG_RZN1_IRQMUX)              += rzn1_irqmux.o  
> 
> One TAB too much.

Yes indeed, will be removed.

> 
> > --- /dev/null
> > +++ b/drivers/soc/renesas/rzn1_irqmux.c
> > @@ -0,0 +1,150 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * RZ/N1 GPIO Interrupt Multiplexer
> > + *
> > + * Copyright 2025 Schneider Electric
> > + * Author: Herve Codina <herve.codina@bootlin.com>
> > + */
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/build_bug.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/platform_device.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/*
> > + * The array index is the output line index, the value at the index is the
> > + * GIC SPI interrupt number the output line is connected to.
> > + */
> > +static const u32 rzn1_irqmux_output_lines[] = {
> > +       103, 104, 105, 106, 107, 108, 109, 110
> > +};  
> 
> I did read the discussion with Wolfram, but the flexibility (and
> overhead) provided by this array sounds a bit overkill to me.
> 
> What about just defining:
> 
>     #define RZN1_IRQMUX_SPI_BASE    103
>     #define RZN1_IRQMUX_NUM_IRQS    8
> 
> ?
> 
> If/when a new SoC with a similar setup ever arrives, you can probably
> just replace the constants above by variables inside SoC-specific
> match data.  And if the new mapping would be non-contiguous, you can
> still revive this array ;-)

I have in mind a use case that can lead to a non-contiguous mapping.

The RZ/N1 SoC embeds a Cortex-M3 CPU. This CPU can use GPIOs and
some of them for interrupt purpose. In that case, those GPIOs have
to be routed to the interrupt line expected by the Cortex-M3.

And so, we have some interrupts reserved for CPUs running Linux and
some others for the Cortex-M3.

Among those reserved interrupts may some are not used.

for instance:
  Interrupt 103, 102: Reserved and used by Linux
  Interrupt 103: Reserved for Linux but not used -> Hole in the mapping
  Interrupt 104: Reserved and used my Cortex-M3 (need to be routed by Linux)

I don't know if this use case is relevant but I think we should be too restrictive
on the mapping and so accept holes.

With that in mind, I let you confirm that you still prefer to have a mapping
without any holes. A future patch to support that is always possible.

> 
> More about this below...
> 
> > +
> > +static int rzn1_irqmux_parent_args_to_line_index(struct device *dev,
> > +                                                const struct of_phandle_args *parent_args,
> > +                                                const u32 output_lines[],
> > +                                                unsigned int output_lines_count)
> > +{
> > +       unsigned int i;
> > +
> > +       /*
> > +        * The parent interrupt should be one of the GIC controller.
> > +        * Three arguments must be provided.
> > +        *  - args[0]: GIC_SPI
> > +        *  - args[1]: The GIC interrupt number
> > +        *  - args[2]: The interrupt flags
> > +        *
> > +        * We retrieve the line index based on the GIC interrupt number
> > +        * provided and rzn1_irqmux_output_line[] mapping array.
> > +        */
> > +
> > +       if (parent_args->args_count != 3 ||
> > +           parent_args->args[0] != GIC_SPI) {
> > +               dev_err(dev, "Invalid interrupt-map item\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       for (i = 0; i < output_lines_count; i++) {
> > +               if (parent_args->args[1] == output_lines[i])
> > +                       return i;
> > +       }  
> 
> ... then this loop can be replaced by two simple comparisons.
> 
> > +
> > +       dev_err(dev, "Invalid GIC interrupt %u\n", parent_args->args[1]);
> > +       return -EINVAL;
> > +}
> > +
> > +static int rzn1_irqmux_setup(struct device *dev, struct device_node *np, u32 __iomem *regs)
> > +{
> > +       struct of_imap_parser imap_parser;
> > +       struct of_imap_item imap_item;
> > +       unsigned long index_done = 0;  
> 
> Perhaps "DECLARE_BITMAP(index_done, RZN1_IRQMUX_NUM_IRQS)",
> so the BITS_PER_LONG limit can be lifted, without any cost?

Yes.

> 
> > +       int index;
> > +       int ret;
> > +       u32 tmp;
> > +
> > +       /* We support only #interrupt-cells = <1> and #address-cells = <0> */
> > +       ret = of_property_read_u32(np, "#interrupt-cells", &tmp);
> > +       if (ret)
> > +               return ret;
> > +       if (tmp != 1)
> > +               return -EINVAL;
> > +
> > +       ret = of_property_read_u32(np, "#address-cells", &tmp);
> > +       if (ret)
> > +               return ret;
> > +       if (tmp != 0)
> > +               return -EINVAL;
> > +
> > +       ret = of_imap_parser_init(&imap_parser, np, &imap_item);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* 8 output lines are available */
> > +       BUILD_BUG_ON(ARRAY_SIZE(rzn1_irqmux_output_lines) != 8);  
> 
> ... then this check can be removed, too.
> 
> > +
> > +       /*
> > +        * index_done is an unsigned long integer. Be sure that no buffer
> > +        * overflow can occur.
> > +        */
> > +       BUILD_BUG_ON(ARRAY_SIZE(rzn1_irqmux_output_lines) > BITS_PER_LONG);  
> 
> Currently this is less strict than the check above, so a bit useless?

Yes. My first intention was to explicitly check both constraints:
  - The number of output lines which lead to the maximum index value used to
    index register addresses (i.e. writel(imap_item.child_imap[0], regs + index)
    below).

  - The number of output lines to the maximum index value used to
    index register addresses which which lead to the maximum index value used
    for testing and setting the "index_done" flags.

But yes, I can keep the stricter one.

Also, if RZN1_IRQMUX_NUM_IRQS is introduced and related DECLARE_BITMAP(index_done,
RZN1_IRQMUX_NUM_IRQS), a single check against RZN1_IRQMUX_NUM_IRQS will be enough
for both cases

> 
> > +
> > +       for_each_of_imap_item(&imap_parser, &imap_item) {
> > +               index = rzn1_irqmux_parent_args_to_line_index(dev,
> > +                                                             &imap_item.parent_args,
> > +                                                             rzn1_irqmux_output_lines,
> > +                                                             ARRAY_SIZE(rzn1_irqmux_output_lines));
> > +               if (index < 0) {
> > +                       of_node_put(imap_item.parent_args.np);
> > +                       return index;
> > +               }
> > +
> > +               if (test_and_set_bit(index, &index_done)) {
> > +                       of_node_put(imap_item.parent_args.np);
> > +                       dev_err(dev, "Mux output line already defined\n");
> > +                       return -EINVAL;
> > +               }
> > +
> > +               /*
> > +                * The child #address-cells is 0 (already checked). The first
> > +                * value in imap item is the src hwirq.
> > +                */
> > +               writel(imap_item.child_imap[0], regs + index);
> > +       }
> > +
> > +       return 0;
> > +}  
> 


