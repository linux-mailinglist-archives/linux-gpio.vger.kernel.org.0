Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9619A377481
	for <lists+linux-gpio@lfdr.de>; Sun,  9 May 2021 01:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhEHXDj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 May 2021 19:03:39 -0400
Received: from sibelius.xs4all.nl ([83.163.83.176]:64334 "EHLO
        sibelius.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhEHXDi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 May 2021 19:03:38 -0400
Received: from localhost (bloch.sibelius.xs4all.nl [local])
        by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id c9fdf47c;
        Sun, 9 May 2021 01:02:34 +0200 (CEST)
Date:   Sun, 9 May 2021 01:02:33 +0200 (CEST)
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kettenis@openbsd.org, krzk@kernel.org, tomasz.figa@gmail.com,
        maz@kernel.org, devicetree@vger.kernel.org, marcan@marcan.st,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        bgolaszewski@baylibre.com, sven@svenpeter.dev
In-Reply-To: <CACRpkdbUNs_FFv9RteWKUrxBdRuiXU2Fkt-oY4=Phke4gNBoaQ@mail.gmail.com>
        (message from Linus Walleij on Sat, 8 May 2021 23:09:55 +0200)
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add DT bindings for apple,pinctrl
References: <20210508142000.85116-1-kettenis@openbsd.org> <20210508142000.85116-2-kettenis@openbsd.org> <CACRpkdbUNs_FFv9RteWKUrxBdRuiXU2Fkt-oY4=Phke4gNBoaQ@mail.gmail.com>
Message-ID: <c1bd678c5dc81db8@bloch.sibelius.xs4all.nl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> From: Linus Walleij <linus.walleij@linaro.org>
> Date: Sat, 8 May 2021 23:09:55 +0200
> 
> On Sat, May 8, 2021 at 4:20 PM Mark Kettenis <kettenis@openbsd.org> wrote:
> 
> > The Apple GPIO controller is a simple combined pin and GPIO conroller
> > present on Apple ARM SoC platforms, including various iPhone and iPad
> > devices and the "Apple Silicon" Macs.
> >
> > Signed-off-by: Mark Kettenis <kettenis@openbsd.org>

Hi Linus,

Thanks for taking a look.

> I knew this was coming! I saw an earlier version of the Linux
> pin control driver in some tree somewhere.

That may have been the initial Corellium port.  I'm working with the
Asahi Linux folks to get something that is a bit more upstreamable and
something that works for U-Boot and other OSes too.  So these proposed
DT bindings deviate a little bit from what Corellium did.

> I see we're only discussing bindings right now, but it would be
> great to also take a look at the U-Boot driver and scratch Linux
> driver (which I bet both exist) for a deeper understanding.
> Git tree web links are fine.

My U-Boot driver is here:

https://github.com/kettenis/u-boot/blob/apple-m1-m1n1-gpio/drivers/pinctrl/pinctrl-apple.c

Not yet submitted upstream since that is a bit pointless without an
agreed upon binding; typically U-Boot requires a binding that is
accepted by the Linux devlopers before accepting patches.

Sven Peter may have a draft Linux driver somewhere as he has been
working on support for the type-C USB ports, but I haven't seen that
part of his code yet.

> > +description: |
> > +  The Apple GPIO controller is a simple combined pin and GPIO controller
> 
> spelling

Not sure I'm seeing a spelling mistake here.  Do you want a comma
inserted somewhere?

> 
> > +  present on Apple ARM SoC platforms, including various iPhone and iPad
> > +  devices and the "Apple Silicon" Macs.
> 
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: apple,t8103-pinctrl
> > +      - const: apple,pinctrl
> 
> So is this an entirely Apple thing now, and not based on some Samsung
> block from S3C like what we have seen before?

As far as I can tell, yes.  This Apple controller has a single
register per pin that controls the muxing and gpio functions, whereas
the S3C controller seems to have 4 registers per pin.

In the Apple device tree this controller has a "gpio,t8101" compatible
property which suggests that this particular incarnation was
introduced with the the T8101 SoC (marketed as A14 and found in the
iPhone 12).  Of course that's just an educated guess.

> It'd be great if Krzysztof or Tomasz who have experience with the
> Samsung hardware could have a look at the registers etc in the
> drivers and confirm or clear any relationship to Samsung hardware.
> 
> This would partly involve trying to keep the pin control bindings
> similar to Samsungs if there is a relationship.
> 
> If there is no relationship, then we invent something new.
> 
> All looks pretty good, but I am suspicious about this:
> 
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 7
> 
> Which is used like that.
> 
> > +        interrupt-controller;
> > +        interrupt-parent = <&aic>;
> > +        interrupts = <AIC_IRQ 16 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <AIC_IRQ 17 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <AIC_IRQ 18 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <AIC_IRQ 19 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <AIC_IRQ 20 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <AIC_IRQ 21 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <AIC_IRQ 22 IRQ_TYPE_LEVEL_HIGH>;
> 
> First it is really odd with 7 of something as in all computer
> science but I guess there is some explanation for that.

No kidding.  But all 4 controllers present on the SoC have 7
interrupts assigned to them in the Apple device tree.

> What I am really wondering is if these interrupts are hierarchical,
> i.e. that they match 1-to-1 to a GPIO line.

They don't match 1-1.  The GPIOs can be assigned to one of
(apparently) 7 interrupt groups.  I haven't looked to closely at this
yet since U-Boot doesn't need/use the interrupt capability.  But I
suspect that pins don't have to be assigned to a interrupt group and
that explains why there are only 7 interrupt groups as the 8th state
is reserved for "unasigned".  The number of pins per controller
varies, but one of them has 212 pins.

> We only (ideally) define the interrupts when it is used by the
> GPIO block itself, such as when it spawns a cascaded interrupt
> controller (i.e. you need to read status bits inside the GPIO
> controller to figure out which line was fired).

Multiple pins can be assigned to the same interrupt group as far as I
can tell.  So in that case the driver will have to look at status
bits.

> If the interrupt has a 1-to-1 mapping between GPIO lines and
> the parent interrupt controller we usually do not define these
> interrupts in the device tree at all.
> 
> In those cases the interrupt is considered hierarchical and we
> rely on the compatible for the block to define how the
> interrupt lines are routed to the parent interrupt controller
> (in this case AIC).
> 
> In the Linux case, the GPIO driver has a hardcoded table
> of mappings from the GPIO irq line offset and the corresponding
> index on the parent interrupt controller (AIC).
> 
> This is reflected in this IRQ routing information missing
> from the bindings.
> 
> Marc Zyngier can probably tell the story of why it is handled
> like this,

Ok, hopefully Marc can say something sensible here, but I'd say the
interrupts on this hardware are cascaded.

> There is some info on hierarchical IRQ handling in the
> Linux GPIO driver docs:
> https://www.kernel.org/doc/html/latest/driver-api/gpio/driver.html
> Section "GPIO drivers providing IRQs"
> 
> Yours,
> Linus Walleij
> 
