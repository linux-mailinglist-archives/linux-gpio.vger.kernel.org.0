Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3FF33646
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 19:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbfFCRPJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 13:15:09 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42914 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727247AbfFCRPJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 13:15:09 -0400
Received: by mail-lf1-f65.google.com with SMTP id y13so14190470lfh.9
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2019 10:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wx1qlMK3NepKa7TTJ5PUW2ztJ4RMVsDvNE3t80Pi7Yk=;
        b=qk4YTH/aK8Kaeu/mPgkElXYfvcdGP6XJh3xMnh8SUG6nUL3UNfT5aM6IKFimH1KDW9
         DwKZhEjMg+hMEvx9sjGh2ElxdaHptTFMnxpgxjuLvnW193C0wD6kmpLi9o7cgIVJragj
         Uvjs3tcZulLtNaWnvg2Tb/Zw/rDvE3tKHaPAPtcw8O2RJ/kRo+94nhKrW5dxRsNkKYmS
         Vr7f4vephC8YOFfJFxok0+2g2TL/79wro9M0DAQZo6fg0D91B9+iaESe7MQfHoe+xxdn
         DGBnoiewfWP89HvB6ZjZB5AqI9gpjXXEmZKXwIdCNFHQhIIRvr4238HWeFsiEwdo64L/
         SwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wx1qlMK3NepKa7TTJ5PUW2ztJ4RMVsDvNE3t80Pi7Yk=;
        b=oWwNOl+bFI8HqmK5+WYn17vTf4epv9KDfCMYOquTIswTxGxlAnQyX8idbP2YvzvPoO
         PtvdHSjjVT3+HCZ71UA7Z19gfdkmRxD0nmaSU8PwcB3TAisbOEAZovbALTqMs8Qj5022
         NyeP5X6rQSArIQUw6uoDFSju/zPTkLfcDMxHHfBgu6iXxiCKwWz+8vrRofH/1onT0H6f
         bK7R37CPK0XC8ShdAv2arj2KlURzUIBvn2GwkRTj0jONqvMY+xOqvMv4XzNEbCXd0+VB
         izO5fWRrkLZt2jOsOkMpqzv0QuxgaEMB4gDigh1mpvXxwqkhvcCObOmDcWjkr+RxBskM
         8F2Q==
X-Gm-Message-State: APjAAAViRqrHB1BSjMUOD+jmnS7susnpNc8Y99dh7OdcQKwZcSV50j/r
        VDl4UurffYZaWxowxp04UIRO+2XAXwxyzMKH2DBPgZEccko=
X-Google-Smtp-Source: APXvYqxbVJ05nLPoJ01NJyWakek+FTAApTtwpBnubTvb2Vd49Fl2YeNua4N6FgSbYprAWJ8QKMO6SbGz34oA1+bZU00=
X-Received: by 2002:ac2:429a:: with SMTP id m26mr12542502lfh.152.1559582106875;
 Mon, 03 Jun 2019 10:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190602205424.28674-1-linus.walleij@linaro.org> <2c14f320-41e8-6e66-6c6f-7fcc7ab65793@arm.com>
In-Reply-To: <2c14f320-41e8-6e66-6c6f-7fcc7ab65793@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 3 Jun 2019 19:14:55 +0200
Message-ID: <CACRpkdb7Q795HnUOat-ZhcWBLDqbbGpZ=9K9C+0GbHt7O+6FQA@mail.gmail.com>
Subject: Re: [PATCH 1/2] RFC: gpio: Add support for hierarchical IRQ domains
To:     Marc Zyngier <marc.zyngier@arm.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 3, 2019 at 6:12 PM Marc Zyngier <marc.zyngier@arm.com> wrote:
> On 02/06/2019 21:54, Linus Walleij wrote:

> > +     /* DT will deal with mapping each IRQ as we go along */
> > +     if (is_of_node(gpiochip->irq.fwnode))
> > +             return;
> > +
> > +     /*
> > +      * This is for legacy and boardfile "irqchip" fwnodes: allocate
> > +      * irqs upfront instead of dynamically since we don't have the
> > +      * dynamic type of allocation that hardware description languages
> > +      * provide.
> > +      */
> > +     if (is_fwnode_irqchip(gpiochip->irq.fwnode)) {
>
> How about ACPI-based systems? Do they even exist in this scheme? This is
> a genuine question, as I have no idea...

I assume we can just add another if() clause for them?

I have no ACPI system using gpiochip in my mental or practical
world, but I assume they are not very special wrt this since they
invented fwnode and drove it all the way into the core.

I don't know if I should add upfront code for them since I can't
test it (that I know).

> > +                     fwspec.fwnode = gpiochip->irq.fwnode;
> > +                     /* This is the hwirq for the GPIO line side of things */
> > +                     fwspec.param[0] = map->hwirq;
> > +                     /* Just pick something */
> > +                     fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
> > +                     fwspec.param_count = 2;
> > +                     ret = __irq_domain_alloc_irqs(gpiochip->irq.domain,
> > +                                                   /* just pick something */
> > +                                                   -1,
> > +                                                   1,
> > +                                                   NUMA_NO_NODE,
> > +                                                   &fwspec,
>
> It feels a bit odd that we're building a fwspec for something that
> already has all the required information (the alloc function has the
> gpio_irq_chip as host_data). I have the feeling that we could just have
> a single __irq_domain_alloc_irqs() call with irq.parent_n_irq_maps as
> the nr_irqs, and let the alloc function sort it out...

Oh you're probably right, since the domain is implicitly linear
anyways. I suppose this is part of the answer to Thierry's question
actually: since I do this one irq at the time the domain will look
like such as well.

> > +     /* Some drivers provide custom irqdomain ops */
> >       if (gpiochip->irq.domain_ops)
> >               ops = gpiochip->irq.domain_ops;
>
> Is that already a requirement? Or an educated guess?

Yeah look at drivers/gpio/gpio-tegra186.c:

irq = &gpio->gpio.irq;
(...)
irq->domain_ops = &tegra186_gpio_irq_domain_ops;

what I just discovered is that this driver does not call
irq_domain_add* or irq_domain_create* not does it ask gpiolib
to do it so I have no idea how that thing is even working, so I
asked Thierry to explain it.

Right now my assumption is that is uses a NULL initalized irqdomain
and assign some random translation functions to it and hope
for the best or something, I might be missing something here.

Yours,
Linus Walleij
