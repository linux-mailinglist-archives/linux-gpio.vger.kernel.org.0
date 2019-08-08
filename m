Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C236886140
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 13:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729112AbfHHL54 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 07:57:56 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39215 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbfHHL54 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 07:57:56 -0400
Received: by mail-lj1-f196.google.com with SMTP id v18so88556613ljh.6
        for <linux-gpio@vger.kernel.org>; Thu, 08 Aug 2019 04:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8yEC218bFgjARk2k7GvRK1PPsge5yRD2wjYSYjKdg7g=;
        b=v8cdwO7rvXKI4DkkmzAfACSUOFDLHhfrR3vQjLNzf6jrCOs3P0N5mvAKjP1bNPxmT5
         vS0mdHXmjnzDSI4ItTsXJWSc6eu0593hgbvfPY8Me67ksTvYKtOVKZQGWzL/oFwf3qew
         nNisLGkzYq2ddMSFbYKnhYiPNUFADrRZj6gFf9W/WD4BTSuIn2lUqv83YyZ44DWCxXes
         L7fWOLKew0m5OwfvOoA/Ff3K8bFNCupzR6tnUwcmayxx2dkIpFBMuBun39q83Ln2Iz+H
         0wpzYXTXSKKonr1KxxVH4H1CwMSXXbrh6ylnmtgYJklSm5JpMfPOpf8PWOiPtt4O6V8J
         V3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8yEC218bFgjARk2k7GvRK1PPsge5yRD2wjYSYjKdg7g=;
        b=psHT1k0RikK66DVG2znI61n8/zf4N7RIBDub6XLxlhj3kjjESSb8Wd2RR9K5JvftLC
         KaKLEIe0RBGcvv14hTnTy5eJ5r556SI+Ua2RnwCHgFd7mOQprSBQMPhMesDFUD6mvyP3
         C1tnsoAP10RcPWH6d1rfohDbPXNEFdoQnSD8R9fEThiCqW6OMTk786ktPkczUk62MwwK
         NfQsLJolTBLxToIMpfaH+W38Wz0ryxIoo8z8lMtdkQnf6OZgZN8YFr/Wtb9roCN1CefH
         8Bsl82v8IK220hNptQp4b6dwPyU2wGCXXl5UNSXQIw/ZsJHU8djoE27CJA68BaK6XG+M
         3rJg==
X-Gm-Message-State: APjAAAU9Zo7qU55dTfrOFQ9tuKEBwYUxjFOq6Dvti/C53YU/AMaoYYAq
        v4Bsy1ZyuFmB15cqJex9C/d+udEJj23AWuBqIZcwwgeG7Yw=
X-Google-Smtp-Source: APXvYqy/eRplZEpIIs3O8rjK32pngwaifQdY4BLPZOPG3VNHOr4Cfi8eBlSeREnJtbfN3BCF1+x89m4iDhZHwh0OLds=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr7936425ljc.28.1565265474057;
 Thu, 08 Aug 2019 04:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190624132531.6184-1-linus.walleij@linaro.org>
 <20190624132531.6184-4-linus.walleij@linaro.org> <CAK7LNATdYG-POvQQXwEiOD1eYwT081ohqACXV95fU01kfojXjQ@mail.gmail.com>
In-Reply-To: <CAK7LNATdYG-POvQQXwEiOD1eYwT081ohqACXV95fU01kfojXjQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Aug 2019 13:57:42 +0200
Message-ID: <CACRpkdbYrLPPcxVWqrXwkGeQxOYUWmiMs1r9gBCorJaiUfpBYA@mail.gmail.com>
Subject: Re: [PATCH 4/4 v1] RFT: gpio: uniphier: Switch to GPIOLIB_IRQCHIP
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>,
        Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Masahiro,

thanks for your review!

On Thu, Jul 18, 2019 at 1:10 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> On Mon, Jun 24, 2019 at 10:25 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > -static void uniphier_gpio_irq_unmask(struct irq_data *data)
> > +static void uniphier_gpio_irq_unmask(struct irq_data *d)
>
> Are you renaming 'data' -> 'd'
> just for your personal preference?

Yes, I am still looking for proof of what kind of terseness gives
the optimal perceptive qualities in written code, so I have only
intuitive ideas about what is the easiest code to read and maintain.

But it's your file, and since you seem not to like it I will
back out this change.

> > -static int uniphier_gpio_irq_set_type(struct irq_data *data, unsigned int type)
> > +static int uniphier_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>
> Again, this seems a noise change.

Contrary to popular belief, coding style changes while writing
new code is not universally seen as "noise", actually the opposite,
sending pure code style changes as singular patches, is seen as
noise. See the following paragraph from
Documentation/process/4.Coding.rst:

"pure coding style fixes are seen as noise by the development community;
they tend to get a chilly reception.  So this type of patch is best
avoided.  It is natural to fix the style of a piece of code while working
on it for other reasons, but coding style changes should not be made for
their own sake."

Given the number of pure coding style patches I get,
one could believe this does not apply ... but I try to be
accepting of it anyway.

> I did not test this patch, but probably it would break my board.

Oh too bad, let's see if we can make it more plausible to
work (I will not apply it while it is in RFT state).

> ->(de)activate hook has offset  UNIPHIER_GPIO_IRQ_OFFSET (=120),
> but you are replacing it with generic  gpiochip_irq_domain_activate,
> which as zero offset.

Ah! Brian gave me the tool to fix this properly, I will try to
iterate and get this right.

> > -       priv->domain = irq_domain_create_hierarchy(
> > -                                       parent_domain, 0,
> > -                                       UNIPHIER_GPIO_IRQ_MAX_NUM,
>
> You are replacing UNIPHIER_GPIO_IRQ_MAX_NUM with gc->ngpio,
> which will much more irqs than needed.
>
> Is it possible to provide more flexibility?

UNIPHIER_GPIO_IRQ_MAX_NUM is 24 and ngpio comes
from the device tree and is compulsory. The current device
trees have:
arch/arm/boot/dts/uniphier-ld4.dtsi:                    ngpios = <136>;
arch/arm/boot/dts/uniphier-pro4.dtsi:                   ngpios = <248>;
arch/arm/boot/dts/uniphier-pro5.dtsi:                   ngpios = <248>;
arch/arm/boot/dts/uniphier-pxs2.dtsi:                   ngpios = <232>;
arch/arm/boot/dts/uniphier-sld8.dtsi:                   ngpios = <136>;

So I suppose that you mean that since only 24 GPIOs can
ever have assigned IRQs, making headroom for say 248 is
a waste of resources.

However irq descriptors are dynamically allocated, so saying
that the irqchip can have 24 descriptors rather than 248
is not going to save any memory.

What you might want is to only allow offset 0..23 to be mapped
to irqs. If I understand correctly this is how the hardware works:
the first 24 GPIOs have IRQs, the rest don't, is that right?

We have a facility for that: struct gpio_irq_chip field
.valid_mask

I will try to come up with a separate patch for that so you can
see if it works.

Yours,
Linus Walleij
