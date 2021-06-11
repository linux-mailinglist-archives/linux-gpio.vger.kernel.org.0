Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD6C3A492C
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 21:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbhFKTGE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Jun 2021 15:06:04 -0400
Received: from mail-yb1-f179.google.com ([209.85.219.179]:34674 "EHLO
        mail-yb1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbhFKTGC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Jun 2021 15:06:02 -0400
Received: by mail-yb1-f179.google.com with SMTP id c8so4015243ybq.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jun 2021 12:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ca6H2fyumZSb+eKMZ7WVBfn+mdbBLwSkfIc3JCOOo00=;
        b=aMWPZNu0C6XDfhORKql1wIVPjcZXsyNf1TErE5dsDoA+CkUhGhuCqPgkjZIYwXbMah
         HDEvEyrDmQueDgJRvz21YAx4ALlJUdZ2VPqDWt5Wa5486MxOFw4iiJ+pNlyGhGAU9qdz
         h93QKuu5vW0SJrcfh5DniZPLJUfdm8YMSnOZtUMeAOkA/vdQIxYTiwCxvZzWw/yso+w1
         3QTB47fzDa8unr48AJAb9ZnsguMWN/2CYwpqk5vzevBQk0RI5b6b4O9rWByrQkZWAqk/
         BngLY9MEn9xONu5lUTL3lSEFGcCjSL6/5PC56Hx+Jj4y6JmKpaySF9TooDv6U4UEwy5h
         fG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ca6H2fyumZSb+eKMZ7WVBfn+mdbBLwSkfIc3JCOOo00=;
        b=KzfywgAt17I3e7hpbWZa2sl7bhjqsq0vcXtgA9FlCk8bMgytxjvLv3MFXnJqAB1Pec
         x3s9aH88Xjt/Wt/1pb1qpfHgcru2zBd3xWcbWfkuYqwIgfxW0U7b21Ymem6aYYWywhuv
         86gLnzzRdGkc/j7WuZzlt4eqziV5EhKOiQBfQOgZbFJa9qT9mhtuRef7+A9bhwnw51yN
         qvZ264tq0gDxkh9ZJlRCqD3MgrngVlSKwsCjT4J46fvZUoH+IIx/fdJBDXteyoOnUBpr
         mM4gfGb+qa0uYEZc/G6LQhY6BazDU/bptXJqQA3rufXchpcEwCOXQgem6orrcNtQrCtB
         vQ+w==
X-Gm-Message-State: AOAM530BozfwGPi/X19CarYZXg8q8YZ+k44Cek+T8TcK52TfRZ0I68ty
        0VKaW7nngs/YR9dBycqKCiN5kbjOiWHl/gT9dG5xkg==
X-Google-Smtp-Source: ABdhPJwZHsPWI3zqCfdxyOXgBLv+wobDe+BhBsloA91sKRTTqLWgQjTE1yxqpVaZw80uNADiR1hf5M+7bZykDVSp+pE=
X-Received: by 2002:a25:cf15:: with SMTP id f21mr7680332ybg.366.1623438183875;
 Fri, 11 Jun 2021 12:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
 <20210608102547.4880-7-steven_lee@aspeedtech.com> <6f87ccf4-9b8f-4c67-84a1-e83a2ee5103b@www.fastmail.com>
 <20210609041227.GB14839@aspeedtech.com> <1a4dc5a6-8035-4879-ba9d-b6d6afd48196@www.fastmail.com>
In-Reply-To: <1a4dc5a6-8035-4879-ba9d-b6d6afd48196@www.fastmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 11 Jun 2021 21:02:53 +0200
Message-ID: <CAMpxmJUMQg2tsO+GLzNDNwoEtm6G3OHcK5M3zPOt9A4LDmCyYw@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] gpio: gpio-aspeed-sgpio: Add AST2400 and AST2500
 platform data.
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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
        Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 9, 2021 at 8:46 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Wed, 9 Jun 2021, at 13:42, Steven Lee wrote:
> > The 06/09/2021 08:55, Andrew Jeffery wrote:
> > >
> > >
> > > On Tue, 8 Jun 2021, at 19:55, Steven Lee wrote:
> > > > We use platform data to store GPIO pin mask and the max number of
> > > > available GPIO pins for AST2600.
> > > > Refactor driver to also add the platform data for AST2400/AST2500 and
> > > > remove unused MAX_NR_HW_SGPIO and ASPEED_SGPIO_PINS_MASK macros.
> > > >
> > > > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > > > ---
> > > >  drivers/gpio/gpio-aspeed-sgpio.c | 34 +++++++++++---------------------
> > > >  1 file changed, 12 insertions(+), 22 deletions(-)
> > > >
> > > > diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
> > > > index ea20a0127748..7d0a4f6fd9d1 100644
> > > > --- a/drivers/gpio/gpio-aspeed-sgpio.c
> > > > +++ b/drivers/gpio/gpio-aspeed-sgpio.c
> > > > @@ -17,21 +17,8 @@
> > > >  #include <linux/spinlock.h>
> > > >  #include <linux/string.h>
> > > >
> > > > -/*
> > > > - * MAX_NR_HW_GPIO represents the number of actual hardware-supported GPIOs (ie,
> > > > - * slots within the clocked serial GPIO data). Since each HW GPIO is both an
> > > > - * input and an output, we provide MAX_NR_HW_GPIO * 2 lines on our gpiochip
> > > > - * device.
> > > > - *
> > > > - * We use SGPIO_OUTPUT_OFFSET to define the split between the inputs and
> > > > - * outputs; the inputs start at line 0, the outputs start at OUTPUT_OFFSET.
> > > > - */
> > > > -#define MAX_NR_HW_SGPIO                  80
> > > > -#define SGPIO_OUTPUT_OFFSET              MAX_NR_HW_SGPIO
> > > > -
> > > >  #define ASPEED_SGPIO_CTRL                0x54
> > > >
> > > > -#define ASPEED_SGPIO_PINS_MASK           GENMASK(9, 6)
> > > >  #define ASPEED_SGPIO_CLK_DIV_MASK        GENMASK(31, 16)
> > > >  #define ASPEED_SGPIO_ENABLE              BIT(0)
> > > >  #define ASPEED_SGPIO_PINS_SHIFT          6
> > > > @@ -484,6 +471,11 @@ static int aspeed_sgpio_setup_irqs(struct
> > > > aspeed_sgpio *gpio,
> > > >   return 0;
> > > >  }
> > > >
> > > > +static const struct aspeed_sgpio_pdata ast2400_sgpio_pdata = {
> > > > + .max_ngpios = 80,
> > > > + .pin_mask = GENMASK(9, 6),
> > > > +};
> > > > +
> > > >  static const struct aspeed_sgpio_pdata ast2600_sgpiom_128_pdata = {
> > > >   .max_ngpios = 128,
> > > >   .pin_mask = GENMASK(10, 6),
> > > > @@ -495,8 +487,8 @@ static const struct aspeed_sgpio_pdata
> > > > ast2600_sgpiom_80_pdata = {
> > > >  };
> > > >
> > > >  static const struct of_device_id aspeed_sgpio_of_table[] = {
> > > > - { .compatible = "aspeed,ast2400-sgpio" },
> > > > - { .compatible = "aspeed,ast2500-sgpio" },
> > > > + { .compatible = "aspeed,ast2400-sgpio", .data = &ast2400_sgpio_pdata,
> > > > },
> > > > + { .compatible = "aspeed,ast2500-sgpio", .data = &ast2400_sgpio_pdata,
> > > > },
> > > >   { .compatible = "aspeed,ast2600-sgpiom-128", .data =
> > > > &ast2600_sgpiom_128_pdata, },
> > > >   { .compatible = "aspeed,ast2600-sgpiom-80", .data =
> > > > &ast2600_sgpiom_80_pdata, },
> > > >   {}
> > > > @@ -521,13 +513,11 @@ static int __init aspeed_sgpio_probe(struct
> > > > platform_device *pdev)
> > > >           return PTR_ERR(gpio->base);
> > > >
> > > >   pdata = device_get_match_data(&pdev->dev);
> > > > - if (pdata) {
> > > > -         gpio->max_ngpios = pdata->max_ngpios;
> > > > -         pin_mask = pdata->pin_mask;
> > > > - } else {
> > > > -         gpio->max_ngpios = MAX_NR_HW_SGPIO;
> > > > -         pin_mask = ASPEED_SGPIO_PINS_MASK;
> > > > - }
> > > > + if (!pdata)
> > > > +         return -EINVAL;
> > > > +
> > > > + gpio->max_ngpios = pdata->max_ngpios;
> > > > + pin_mask = pdata->pin_mask;
> > >
> > > Hmm, okay, maybe just re-order the patches so this commit comes before the previous one. That way we don't immediately rip out this condition that we just introduced in the previous patch.
> > >
> > > I think I suggested squashing it into the previous patch, but with the removal of the comments and macros I think it's worth leaving it separate, just reordered.
> > >
> >
> > I was wondering if I can squash patch-05 and patch-06 into one patch
> > as this patch(patch-06) requires macros, structures, and functions that
> > modified in the previous patch(patch-05).
>
> Yeah, fair enough. Just squash them.
>
> Cheers,
>
> Andrew

I'm ready to pick this up as soon as you respin the series.

Bart
