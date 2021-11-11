Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5A244DCF7
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Nov 2021 22:15:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233588AbhKKVSr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Nov 2021 16:18:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbhKKVSq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Nov 2021 16:18:46 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37581C061766;
        Thu, 11 Nov 2021 13:15:57 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id q74so18271706ybq.11;
        Thu, 11 Nov 2021 13:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KZdf4pMbWq8JTXgN5BWgwK9VtgLgJIIxkJxdX9n1lyM=;
        b=VN4vDAoplsMxRSbbxCk/I00mBDrUG8/NDPKjr5ztZVGC+1mmKCo1+j8HaklCqshzA+
         pfZXB5oLe/vj5b9G3SRNbzSQDXEcjPKUWqeTcIM/yCE5LmeLrf6unboszK6v64m180qn
         93EZ2QpRXunL3WzZ+bHRlBhlIigQh3ut8KP2WOBBWfeEfsWCX2cnOeibbcJQgERZJaz8
         bplZyATTSP58oNoi0wD/UgXhBDtR9kDBySBfgDQbYlk9IXWy2xlm0+Or+2CskFIgs6K1
         yOzyZi5eCZi9LrGjTYBl/S0d1W32qLJ/YG+xbSb89VoqyruqrzOGfFBfknER6m3aCTJH
         +i2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KZdf4pMbWq8JTXgN5BWgwK9VtgLgJIIxkJxdX9n1lyM=;
        b=o3374jZHEPz6uz0FSLLbWk7D0dGJW0sAL0OjauRlBHeArV/6DF9E6HGWRhkIFByCol
         KGPCp5EQc+ASaA5cgk6tGiqssYDnycwj6ax5ocPHYRF6jO/e1I9EGlQZ/+P1Nfw22OYL
         PeHIEV4dX842VeddYnO7PdVJO7zYoMTXTahb3PgzcLxWP+yoGCThKRZN6WAVQgzDrGha
         YsQ878pAVNMSnm1W2uWKoca2qUKCPKL7ZND4X8wxc4Nb0UZaY3TjnCwZiY36NUebtqMs
         HdW17pgs4pWZmqUg56dPiQ5TnqRu0JYicBdcQgeSQM0BE6fn0wyExBp+CjAywBla0pJc
         7Ccg==
X-Gm-Message-State: AOAM531e3kh7J6bij3h97iOj9SpPdElYRBpzolNy8+eyG3QgOOPmzDdL
        lcIT210QFOo6y/VK6Ea3oohNRXxvmTbmCCBSEoo=
X-Google-Smtp-Source: ABdhPJy7vtoWJN2CnXVY6+ohh9k2M8NECOo45VNy9NesiNYejc8QzoxX917R2E+4vlYnBTVI58aWdYqc77yA4r46lp8=
X-Received: by 2002:a25:56c3:: with SMTP id k186mr11374215ybb.543.1636665356487;
 Thu, 11 Nov 2021 13:15:56 -0800 (PST)
MIME-Version: 1.0
References: <20211110225808.16388-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211110225808.16388-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAHp75VcM-BWoLmS8yBm9uVcbUb6bZr--+m5qXx=WFe024sWJoQ@mail.gmail.com>
In-Reply-To: <CAHp75VcM-BWoLmS8yBm9uVcbUb6bZr--+m5qXx=WFe024sWJoQ@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 11 Nov 2021 21:15:30 +0000
Message-ID: <CA+V-a8v=pJTRDvASViCmcnxLHzbcRsDYUuNu0G3uNNv0fw0Erg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/7] gpio: gpiolib: Add ngirq member to struct gpio_irq_chip
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

Thank you for the review.

On Thu, Nov 11, 2021 at 8:52 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Nov 11, 2021 at 12:59 AM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > Number of GPIO IRQ's supported by the chip is not always
>
> supported GPIO IRQs by the chip
>
will update the change log.

> > equal to the number of GPIO pins. For example on Renesas RZ/G2L
> > SoC where it has GPIO0-122 pins but at a give point a maximum
> > of only 32 GPIO pins can be used as IRQ lines in the IRQC domain.
> >
> > This patch adds ngirq member to struct gpio_irq_chip and passes
> > this as a size to irq_domain_create_hierarchy()/irq_domain_create_simple()
> > if it is being set in the driver otherwise fallbacks to using ngpio.
>
> ...
>
> >         gc->irq.domain = irq_domain_create_hierarchy(
> >                 gc->irq.parent_domain,
> >                 0,
> > -               gc->ngpio,
> > +               gc->irq.ngirq ? gc->irq.ngirq : gc->ngpio,
>
> You may use ?: instead as it's done somewhere else in this module.
>
Agreed will do.

> >                 gc->irq.fwnode,
> >                 &gc->irq.child_irq_domain_ops,
> >                 gc);
>
> ...
>
> >                 gc->irq.domain = irq_domain_create_simple(fwnode,
> > -                       gc->ngpio,
> > +                       gc->irq.ngirq ? gc->irq.ngirq : gc->ngpio,
>
> Ditto.
>

> >                         gc->irq.first,
> >                         gc->irq.domain_ops ?: &gpiochip_domain_ops,
>
> (^^^ You see?)
>
Thanks for the pointer.

> >                         gc);
>
> ...
>
> > +       /**
> > +        * @ngirq:
> > +        *
> > +        * The number of GPIO IRQ's handled by this IRQ domain; usually is
>
> handled GPIO IRQs
>
OK, will update the description as mentioned above.

> > +        * equal to ngpio
>
> Missed period.
>
Ouch.

Cheers,
Prabhakar
> > +        */
>
> --
> With Best Regards,
> Andy Shevchenko
