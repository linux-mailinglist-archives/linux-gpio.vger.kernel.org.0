Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8473A75BC
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 06:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbhFOEZF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 00:25:05 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:34213 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbhFOEZF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 00:25:05 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 15F482WE037072;
        Tue, 15 Jun 2021 12:08:02 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 15 Jun
 2021 12:22:16 +0800
Date:   Tue, 15 Jun 2021 12:22:08 +0800
From:   Steven Lee <steven_lee@aspeedtech.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
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
        Andrew Jeffery <andrew@aj.id.au>,
        "Billy Tsai" <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v5 06/10] gpio: gpio-aspeed-sgpio: Add AST2400 and
 AST2500 platform data.
Message-ID: <20210615042207.GB30360@aspeedtech.com>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <20210608102547.4880-7-steven_lee@aspeedtech.com>
 <6f87ccf4-9b8f-4c67-84a1-e83a2ee5103b@www.fastmail.com>
 <20210609041227.GB14839@aspeedtech.com>
 <1a4dc5a6-8035-4879-ba9d-b6d6afd48196@www.fastmail.com>
 <CAMpxmJUMQg2tsO+GLzNDNwoEtm6G3OHcK5M3zPOt9A4LDmCyYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAMpxmJUMQg2tsO+GLzNDNwoEtm6G3OHcK5M3zPOt9A4LDmCyYw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15F482WE037072
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 06/12/2021 03:02, Bartosz Golaszewski wrote:
> On Wed, Jun 9, 2021 at 8:46 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> >
> >
> > On Wed, 9 Jun 2021, at 13:42, Steven Lee wrote:
> > > The 06/09/2021 08:55, Andrew Jeffery wrote:
> > > >
> > > >
> > > > On Tue, 8 Jun 2021, at 19:55, Steven Lee wrote:
> > > > > We use platform data to store GPIO pin mask and the max number of
> > > > > available GPIO pins for AST2600.
> > > > > Refactor driver to also add the platform data for AST2400/AST2500 and
> > > > > remove unused MAX_NR_HW_SGPIO and ASPEED_SGPIO_PINS_MASK macros.
> > > > >
> > > > > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > > > > ---
> > > > >  drivers/gpio/gpio-aspeed-sgpio.c | 34 +++++++++++---------------------
> > > > >  1 file changed, 12 insertions(+), 22 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> > > > > index ea20a0127748..7d0a4f6fd9d1 100644
> > > > > --- a/drivers/gpio/gpio-aspeed-sgpio.c
> > > > > +++ b/drivers/gpio/gpio-aspeed-sgpio.c
> > > > > @@ -17,21 +17,8 @@
> > > > >  #include <linux/spinlock.h>
> > > > >  #include <linux/string.h>
> > > > >
> > > > > -/*
> > > > > - * MAX_NR_HW_GPIO represents the number of actual hardware-supported GPIOs (ie,
> > > > > - * slots within the clocked serial GPIO data). Since each HW GPIO is both an
> > > > > - * input and an output, we provide MAX_NR_HW_GPIO * 2 lines on our gpiochip
> > > > > - * device.
> > > > > - *
> > > > > - * We use SGPIO_OUTPUT_OFFSET to define the split between the inputs and
> > > > > - * outputs; the inputs start at line 0, the outputs start at OUTPUT_OFFSET.
> > > > > - */
> > > > > -#define MAX_NR_HW_SGPIO                  80
> > > > > -#define SGPIO_OUTPUT_OFFSET              MAX_NR_HW_SGPIO
> > > > > -
> > > > >  #define ASPEED_SGPIO_CTRL                0x54
> > > > >
> > > > > -#define ASPEED_SGPIO_PINS_MASK           GENMASK(9, 6)
> > > > >  #define ASPEED_SGPIO_CLK_DIV_MASK        GENMASK(31, 16)
> > > > >  #define ASPEED_SGPIO_ENABLE              BIT(0)
> > > > >  #define ASPEED_SGPIO_PINS_SHIFT          6
> > > > > @@ -484,6 +471,11 @@ static int aspeed_sgpio_setup_irqs(struct
> > > > > aspeed_sgpio *gpio,
> > > > >   return 0;
> > > > >  }
> > > > >
> > > > > +static const struct aspeed_sgpio_pdata ast2400_sgpio_pdata = {
> > > > > + .max_ngpios = 80,
> > > > > + .pin_mask = GENMASK(9, 6),
> > > > > +};
> > > > > +
> > > > >  static const struct aspeed_sgpio_pdata ast2600_sgpiom_128_pdata = {
> > > > >   .max_ngpios = 128,
> > > > >   .pin_mask = GENMASK(10, 6),
> > > > > @@ -495,8 +487,8 @@ static const struct aspeed_sgpio_pdata
> > > > > ast2600_sgpiom_80_pdata = {
> > > > >  };
> > > > >
> > > > >  static const struct of_device_id aspeed_sgpio_of_table[] = {
> > > > > - { .compatible = "aspeed,ast2400-sgpio" },
> > > > > - { .compatible = "aspeed,ast2500-sgpio" },
> > > > > + { .compatible = "aspeed,ast2400-sgpio", .data = &ast2400_sgpio_pdata,
> > > > > },
> > > > > + { .compatible = "aspeed,ast2500-sgpio", .data = &ast2400_sgpio_pdata,
> > > > > },
> > > > >   { .compatible = "aspeed,ast2600-sgpiom-128", .data =
> > > > > &ast2600_sgpiom_128_pdata, },
> > > > >   { .compatible = "aspeed,ast2600-sgpiom-80", .data =
> > > > > &ast2600_sgpiom_80_pdata, },
> > > > >   {}
> > > > > @@ -521,13 +513,11 @@ static int __init aspeed_sgpio_probe(struct
> > > > > platform_device *pdev)
> > > > >           return PTR_ERR(gpio->base);
> > > > >
> > > > >   pdata = device_get_match_data(&pdev->dev);
> > > > > - if (pdata) {
> > > > > -         gpio->max_ngpios = pdata->max_ngpios;
> > > > > -         pin_mask = pdata->pin_mask;
> > > > > - } else {
> > > > > -         gpio->max_ngpios = MAX_NR_HW_SGPIO;
> > > > > -         pin_mask = ASPEED_SGPIO_PINS_MASK;
> > > > > - }
> > > > > + if (!pdata)
> > > > > +         return -EINVAL;
> > > > > +
> > > > > + gpio->max_ngpios = pdata->max_ngpios;
> > > > > + pin_mask = pdata->pin_mask;
> > > >
> > > > Hmm, okay, maybe just re-order the patches so this commit comes before the previous one. That way we don't immediately rip out this condition that we just introduced in the previous patch.
> > > >
> > > > I think I suggested squashing it into the previous patch, but with the removal of the comments and macros I think it's worth leaving it separate, just reordered.
> > > >
> > >
> > > I was wondering if I can squash patch-05 and patch-06 into one patch
> > > as this patch(patch-06) requires macros, structures, and functions that
> > > modified in the previous patch(patch-05).
> >
> > Yeah, fair enough. Just squash them.
> >
> > Cheers,
> >
> > Andrew
> 
> I'm ready to pick this up as soon as you respin the series.
> 

Hi Bart,

Per the discussion in the following mail threads, I may redesign
aspeed sgpio driver for the new solution.

https://lkml.org/lkml/2021/6/3/1507
https://lkml.org/lkml/2021/6/10/240

Patch02- Patch06 of this patch series will need to be modified for
the new solution, although some of them have Reviewed-by tag.

Thanks,
Steven

> Bart
