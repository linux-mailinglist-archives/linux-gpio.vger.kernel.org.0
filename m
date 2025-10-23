Return-Path: <linux-gpio+bounces-27536-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCB8C01554
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 15:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ADE4188EC2A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69712C11FD;
	Thu, 23 Oct 2025 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2F8bN3nk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797DC314D18;
	Thu, 23 Oct 2025 13:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761225676; cv=none; b=V/Okax9qsw+4TXIFJxk+L2j5p7xZb/hQzq7qTugqtxvlzLVx1d3gdGE73VSh5fL54uyA1ZWxzPf75btfH5RJFqlgIs2ExkLbVLZpv5tP2oM2GFdCTPWsqjg00B1TT7SjZ+fIqtCd96Ur4jjfVhI+OJ/kyQV03KgEcGedbZEenk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761225676; c=relaxed/simple;
	bh=qb9wmhqplV3wjQdDGHKfi28mg6LC6D8Mi1D0V2AIouU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EKlIsELJbOEz7YypjNl88hTMQh3mIcVzzARheHMskt21XGrPtrlZNzICN/fBy7UYCr6BBLzghzbp8ytKCHZ8jSt3xr6VvrpeTwUMkowDtWWgv8ZuqsJyoml9Bni3nWPsHeahWkCHroULvh4tNFsTWBdoQdoLUgSqEmkIMuCQBbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2F8bN3nk; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8B8BCC0C41B;
	Thu, 23 Oct 2025 13:20:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 461466068C;
	Thu, 23 Oct 2025 13:21:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A9F7102F2469;
	Thu, 23 Oct 2025 15:20:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761225665; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IvA5a3iMkBEy7rcJCILOgoju8BwbH24xyx5w5WRuw0E=;
	b=2F8bN3nkWjZxmp1IJX8wJxx8IAuxhGX+qWcH7u9JEzWGPjBMSq55sPp1up2WNHHA0gwAL8
	wz9vb0pYmCvhB6jXU9wQv0dd1DHfQqb9RbWjybldJuBrzHEaDfQSfD3+3IhIFUPeW+0EVg
	IykD2sBLXEWWunG/ZC4W6VZvwcIBjNdeBsK6qHpKyJ/SbGtLJl98smbTEE17dw3BFQT+Nc
	SmrGTzXtRZmRSnxY4PY6SpPhtQgEqG3ait/xq5VaA8+brI5kue+Gq9sKKJGFa+B2mIo72n
	OnGWyMa6JnImuEC/aqlivwFX9uBb0cQB3q2xv1Z/Jm75asN5hN1sx17c6Zv98g==
Date: Thu, 23 Oct 2025 15:20:48 +0200
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
 Petazzoni <thomas.petazzoni@bootlin.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
Message-ID: <20251023152048.0e70a362@bootlin.com>
In-Reply-To: <CAMuHMdWY=FbO6YG1jrd0OWfrpPpBzrqmBVcWnw7TnnsKPGgr8A@mail.gmail.com>
References: <20251020080648.13452-1-herve.codina@bootlin.com>
	<20251020080648.13452-8-herve.codina@bootlin.com>
	<CAMuHMdV03D_3b_JA2vzW4tE_QbkkT1bN1dm+zLLLX24oDHMj0Q@mail.gmail.com>
	<20251022150339.4c48649e@bootlin.com>
	<CAMuHMdWY=FbO6YG1jrd0OWfrpPpBzrqmBVcWnw7TnnsKPGgr8A@mail.gmail.com>
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

On Thu, 23 Oct 2025 13:30:53 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> >
> > I have in mind a use case that can lead to a non-contiguous mapping.
> >
> > The RZ/N1 SoC embeds a Cortex-M3 CPU. This CPU can use GPIOs and
> > some of them for interrupt purpose. In that case, those GPIOs have
> > to be routed to the interrupt line expected by the Cortex-M3.
> >
> > And so, we have some interrupts reserved for CPUs running Linux and
> > some others for the Cortex-M3.
> >
> > Among those reserved interrupts may some are not used.
> >
> > for instance:
> >   Interrupt 103, 102: Reserved and used by Linux
> >   Interrupt 103: Reserved for Linux but not used -> Hole in the mapping
> >   Interrupt 104: Reserved and used my Cortex-M3 (need to be routed by Linux)  
> 
> 102 does not seem to  be correct?

My bad, my example was wrong.
   Interrupt 103, 104: Reserved and used by Linux
   Interrupt 105: Reserved for Linux but not used -> Hole in the mapping
   Interrupt 106: Reserved and used my Cortex-M3 (need to be routed by Linux) 


> 
> > I don't know if this use case is relevant but I think we should be too restrictive
> > on the mapping and so accept holes.
> >
> > With that in mind, I let you confirm that you still prefer to have a mapping
> > without any holes. A future patch to support that is always possible.  
> 
> While that would indeed be a non-discontiguous mapping, I do not see how
> it is related to rzn1_irqmux_output_lines[] in the driver.  That array
> would still contain the same contiguous values 103..110, right?

The array rzn1_irqmux_output_lines is still contiguous yes but the mapping
defined in irq-map property no.

Looking back again at your proposal, indeed I can remove the following loop:
	for (i = 0; i < output_lines_count; i++) {
               if (parent_args->args[1] == output_lines[i])
                       return i;
	} 

With just
	if (parent_args->args[1] >= RZN1_IRQMUX_SPI_BASE &&
            parent_args->args[1] < RZN1_IRQMUX_SPI_BASE + RZN1_IRQMUX_NUM_IRQS) {
		return parent_args->args[1] - RZN1_IRQMUX_SPI_BASE;

	dev_err(dev, "Invalid GIC interrupt %u\n", parent_args->args[1]);
	return -EINVAL;

> 
> Sorry, I haven't been following the development of this driver that
> closely (RZ/N1 is completely different from e.g. R-Car, and I never
> had access to an RZ/N1 platform), so perhaps I am missing something.
> Why does the user have to specify an interrupt-map in DT? Can't the
> driver create the mapping dynamically, based actual usage of the
> GPIOs? I.e. the first 8 GPIOs that ask for interrupt functionality
> receive it, and are mapped to an available GIC interrupt?
> I believe this is how rzg2l-irqc works, mapping up to 32 GPIO interrupts
> to 32 GIC (TINT) interrupts.

I think the main difference with rzg2l-irqc is that the RZ/N1 irq mux is
clearly not an interrupt controller.

It is just a mux with 96 inputs (GPIO lines coming from several GPIO
controller) and 8 outputs (connected to the GIC).

It is represented as an interrupt nexus node and has an interrupt-map property.
to describe the routing.

The interrupt-map property cannot be dynamically created.

Also, the routing is necessary even if the related GPIO is not used by Linux.
This GPIO can be used as a GPIO input interrupt line by the Cortex M3.

If the irq mux driver performs the routing only on Linux GPIO usage, it will
not route GPIOs depending on Cortex M3 internal usage.

Best regards,
Hervé

