Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64A26395506
	for <lists+linux-gpio@lfdr.de>; Mon, 31 May 2021 07:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbhEaFZz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 May 2021 01:25:55 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:43623 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbhEaFZy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 May 2021 01:25:54 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 14V5A8us020907;
        Mon, 31 May 2021 13:10:08 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 31 May
 2021 13:23:27 +0800
Date:   Mon, 31 May 2021 13:23:19 +0800
From:   Steven Lee <steven_lee@aspeedtech.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: aspeed-sgpio: Convert txt bindings
 to yaml.
Message-ID: <20210531052318.GA3973@aspeedtech.com>
References: <20210527005455.25758-1-steven_lee@aspeedtech.com>
 <20210527005455.25758-2-steven_lee@aspeedtech.com>
 <CACRpkdZFcFuT9rdrc8BfEBmhy0--9uLMSJWfr=A+nU117_BT8A@mail.gmail.com>
 <20210528040934.GA28403@aspeedtech.com>
 <CACRpkdYnvzOW_86QgLAsNpNXWZXpaMiE7g9_jHZ0ZsFyhOjjAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CACRpkdYnvzOW_86QgLAsNpNXWZXpaMiE7g9_jHZ0ZsFyhOjjAg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14V5A8us020907
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 05/28/2021 16:35, Linus Walleij wrote:
> On Fri, May 28, 2021 at 6:10 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
> > The 05/28/2021 07:51, Linus Walleij wrote:
> > > On Thu, May 27, 2021 at 2:55 AM Steven Lee <steven_lee@aspeedtech.com> wrote:
> > >
> > > > +  max-ngpios:
> > > > +    description:
> > > > +      represents the number of actual hardware-supported GPIOs (ie,
> > > > +      slots within the clocked serial GPIO data). Since each HW GPIO is both an
> > > > +      input and an output, we provide max_ngpios * 2 lines on our gpiochip
> > > > +      device. We also use it to define the split between the inputs and
> > > > +      outputs; the inputs start at line 0, the outputs start at max_ngpios.
> > > > +    minimum: 0
> > > > +    maximum: 128
> > >
> > > Why can this not be derived from the compatible value?
> > >
> > > Normally there should be one compatible per hardware variant
> > > of the block. And this should be aligned with that, should it not?
> > >
> > > If this is not the case, maybe more detailed compatible strings
> > > are needed, maybe double compatibles with compatible per
> > > family and SoC?
> > >
> >
> > Thanks for your suggestion.
> > I add max-ngpios in dt-bindings as there is ngpios defined in
> > dt-bindings, users can get the both max-ngpios and ngpios information
> > from dtsi without digging sgpio driver.
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/aspeed-g5.dtsi#n354
> >
> > If adding more detailed compatibles is better, I will add them to sgpio driver
> > in V3 patch and remove max-ngpios from dt-bindings.
> >
> > Since AST2600 has 2 sgpio controller one with 128 pins and another one with 80 pins.
> > For supporting max-ngpios in compatibles, 2 platform data for each
> > ast2600 sgpio controller as follows are necessary.
> >
> > ```
> > static const struct aspeed_sgpio_pdata ast2600_sgpiom1_pdata = {
> >         .max_ngpios = 128;
> > };
> > static const struct aspeed_sgpio_pdata ast2600_sgpiom2_pdata = {
> >         .max_ngpios = 80;
> > };
> >
> > { .compatible = "aspeed,ast2500-sgpio" , .data = &ast2400_sgpio_pdata, },
> > { .compatible = "aspeed,ast2600-sgpiom1", .data = &ast2600_sgpiom1_pdata, },
> > { .compatible = "aspeed,ast2600-sgpiom2", .data = &ast2600_sgpiom2_pdata, },
> 
> There is a soft border between two IP blocks being "compatible"
> and parameterized and two IP blocks being different and having
> unique compatibles.
> 
> For example we know for sure we don't use different compatibles
> because of how interrupt lines or DMA channels are connected.
> 

Thanks for sharing the knowledge and examples.

> So if this is an external thing, outside of the IP itself, I might back
> off on this and say it shall be a parameter.
> 
> But max-ngpios? It is confusingly similar to ngpios.
> 
> So we need to think about this name.
> 
> Something like gpio-hardware-slots or something else that
> really describe what this is.
> 
> Does this always strictly follow ngpios so that the number
> of gpio slots == ngpios * 2? In that case only put ngpios into
> the device tree and multiply by 2 in the driver, because ngpios
> is exactly for this: parameterizing hardware limitations.
> 

The parameter max-ngpios is the maxmum number of gpio pins that SoC supported,
ngpios is the maximum number of gpio pins that sgpio devices(e.g. sgpio cards) supported.

For instance, a sgpio card that supports 64 gpio pins which is connected to
ast2600evb sgpio master interface 2. The dts file should be configured as follows.

```
max-ngpios = <80>
ngpios = <64>

```

About the parameter naming, I was wondering if 'ngpios-of-sgpiom' is more clear
than max-ngpios as it is the maximum number of gpio pins that sgpio master
interfaces supported.

> Yours,
> Linus Walleij
