Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7975A31DB52
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Feb 2021 15:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233398AbhBQOUa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Feb 2021 09:20:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbhBQOU0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Feb 2021 09:20:26 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09043C061574;
        Wed, 17 Feb 2021 06:19:46 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id g20so7496074plo.2;
        Wed, 17 Feb 2021 06:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PrBPn4ucvSZDYyOg5P1485RiveVpxJfQgk27MHvdjcQ=;
        b=Dc6x4dorP7H1v4dUzIUMTv1iH0y/m8xen5IEZZR/eI8SIpVmsgcYp+FTXJpPrPHffa
         z9aE+DNcPZARp7KUl2m3kaPYyq7HRjBdIFd2NvSMu66K2d00SG+Vj2CFMT/cfItsSLmz
         m6dh1Dws/c6UbLR+tZxOlinNuQMYyfaRGUrE1mJg7r6uc2qdEUuNp1g+S56BbRpuQzur
         NV9OYEANNrUVzqjc5wyCCgSrtlapViZh4iJQ/KZyRVUAdWR9reWwypDjnNsoDOJ0IwW0
         TFzKmywqqzmNephZup94VxCZ19qicXkbhX5kem19jv0EmmRd2Yq221TQD1uNnW0AzPMG
         6qNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PrBPn4ucvSZDYyOg5P1485RiveVpxJfQgk27MHvdjcQ=;
        b=AA3VMjwpKz2p461yK92Jx4eJYNZ/dDLy54/G7YaTdvtBB40HXm/cCAkilRN+jetPP2
         /Tz5L/PY4qMdifHPpGbJNj1UfsxP+148CCoGihAv+vPUe3zjr/aWXeLMFRk7LHeIvVxj
         g92fhIyiyx7Tso2/Qdt/uZw0oFYgno2AOdrqaEv7OkbueAms8+d01Q+yjPlhvbF2hsGF
         LzlGaVIOrAQ8mX9RfX8z98vyz1/rQmA1kHF6ewigTTg7DrvLxvlpQBa+kftVWyc3WmC9
         Gf4xHXwd0NpFVXVES/WepIAUtiT9sOCZAi2PrQl2/WVLNn4bcx3YTm5xVEmOdEEK8Imm
         +umw==
X-Gm-Message-State: AOAM533tcfOnf7w76L8nrGWjDw/t6TlLdVH5xUltJEC2WI8HLqwMYfqW
        lD4RQqjA4cUELtxJTKU+F5cIL6RN7s6o8gBq+EQ=
X-Google-Smtp-Source: ABdhPJyDsNr463ejN3TXRk3mrr7eqip19jDxQgwKn3TJjeI0Gg6WojU0sMfbhcuhYtpsCJGhr8rzufyDROEEE714hyc=
X-Received: by 2002:a17:90b:3d8:: with SMTP id go24mr9641404pjb.181.1613571585464;
 Wed, 17 Feb 2021 06:19:45 -0800 (PST)
MIME-Version: 1.0
References: <20210211175140.85391-1-alban.bedel@aerq.com> <CAHp75VfUY5-VtCWjaU6Q=hJY9hyUz8B36C0528RXUxkbnL9yEA@mail.gmail.com>
 <4d67d5627921b0f7ca6579b81f97691c53ef0c34.camel@aerq.com> <CAHp75Vczzhs=8k9G1FQYvqOV+Xg3GHp2=TykJX+E5ypT8puFqw@mail.gmail.com>
 <a1f4f5cc14a5037a8b122c811d2f24a8d3068c41.camel@aerq.com>
In-Reply-To: <a1f4f5cc14a5037a8b122c811d2f24a8d3068c41.camel@aerq.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 17 Feb 2021 16:19:29 +0200
Message-ID: <CAHp75VekEoU3y0iZ9RyfB4887n1hbLMcKfrgzYWfa6_cbKp_iQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: pca953x: add support for open drain pins on PCAL6524
To:     "Bedel, Alban" <alban.bedel@aerq.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 17, 2021 at 3:11 PM Bedel, Alban <alban.bedel@aerq.com> wrote:
> On Tue, 2021-02-16 at 19:50 +0200, Andy Shevchenko wrote:
> > On Tue, Feb 16, 2021 at 6:37 PM Bedel, Alban <alban.bedel@aerq.com>
> > wrote:
> > > On Mon, 2021-02-15 at 14:53 +0200, Andy Shevchenko wrote:
> > > > On Thu, Feb 11, 2021 at 7:52 PM Alban Bedel <alban.bedel@aerq.com
> > > > wrote:

...

> > Before continuing on this, have you considered to split this
> > particular chip to a real pin controller and use the existing driver
> > only for GPIO part of the functionality?
>
> No, this driver already use the ->set_config() mechanism so adding
> another property is trivial. On the other hand having a pinctrl driver
> would be a massive undertaking as the pinctrl API is quiet complex
> iirc.

> Furthermore, unless I'm missing something, that would not allow a
> consumer to request an open drain GPIO which is what I'm after.

Hmm... Linus, is it so?

...

> > > > > +#define PCAL65xx_REGS          BIT(10)
> > > >
> > > > Can we have it as a _TYPE, please?
> > >
> > > Let's please take a closer look at these macros and what they mean.
> > > Currently we have 3 possible set of functions that are indicated by
> > > setting bits in driver_data using the PCA_xxx macros:
> > >
> > > - Basic register only: 0
> > > - With interrupt support: PCA_INT
> > > - With latching interrupt regs: PCA_INT | PCA_PCAL = PCA_LATCH_INT
> > >
> > > This patch then add a forth case:
> > >
> > > - With pin config regs: PCA_INT | PCA_PCAL |
> > > $MACRO_WE_ARE_DICUSSING
> > >
> > > Then there is the PCA953X_TYPE and PCA957X_TYPE macros which
> > > indicate
> > > the need for a different regmap config and register layout.
> >
> > Exactly, and you have a different register layout (coincidentally
> > overlaps with the original PCA953x).
>
> We have 2 layout for the base registers, the "mixed up registers" of
> the PCA957x and the "standard" of the PCA953x. Then we have the
> PCALxxxx chips which extend the base PCA953x registers with further
> registers for better interrupt handling. These are not treated as a new
> type in the current code, but as an extra feature on top of the
> PCA953x.

Yes, because they are about interrupts AFAICS.

>  The PCAL65xx we are talking about add a further register
> block, so following the existing concept its not a new layout.

Yes, with one important detail, i.e. it extends the "mixed up"
registers, it's not a separate "feature" in this sense. The separate
"feature" can be, for example, PWM registers. I admit that this most
of the angle of preference how to draw a line between the features.

I prefer to see it as a type because of two things (in the current code):
 - OF_9*() macros take only two arguments, second of which is Interrupt related
 - PCA_INT group of bits is about Interrupt only

Your proposal will disrupt the code (more invasive).

Actually I prefer to see this chip as a pin controller, but it will be
a longer road to pass, I suppose.

...

> > > These are
> > > accessed using the PCA_CHIP_TYPE() and are used as an integer
> > > value,
> > > not as bit-field like the above ones. If we had a struct instead of
> > > a
> > > packed integer that would be a different field.
> >
> > How come? It's a bitmask.
>
> The definitions use BIT() but all evaluations of PCA_CHIP_TYPE() use
> the equality operator.

I don't get how it's related. It's a bitmap and each bit uniquely
defines the type.

...

> > > I'll change it to PCAL65xx_TYPE if you insist, but that seems very
> > > wrong to me to use the same naming convention for macros meant for
> > > different fields.
> >
> > To me it's the opposite. The 6524 defines a new type (which has some
> > registers others don't have). We even have already definitions of
> > those special registers. I think TYPE is a better approach here.
>
> Let's look at pca953x_writeable_register() which I think clearly show
> how chips variants are currently handled. This is just one example but
> the rest of the code follows the same concept.
>
> static bool pca953x_writeable_register(struct device *dev, unsigned int reg)
> {
>         struct pca953x_chip *chip = dev_get_drvdata(dev);
>         u32 bank;
>
>         if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE) {
>                 bank = PCA953x_BANK_OUTPUT | PCA953x_BANK_POLARITY |
>                         PCA953x_BANK_CONFIG;
>         } else {
>                 bank = PCA957x_BANK_OUTPUT | PCA957x_BANK_POLARITY |
>                         PCA957x_BANK_CONFIG | PCA957x_BANK_BUSHOLD;
>         }
>
>         if (chip->driver_data & PCA_PCAL)
>                 bank |= PCAL9xxx_BANK_IN_LATCH | PCAL9xxx_BANK_PULL_EN |
>                         PCAL9xxx_BANK_PULL_SEL | PCAL9xxx_BANK_IRQ_MASK;
>
> +       if (chip->driver_data & PCAL65xx_REGS)
> +               bank |= PCAL65xx_BANK_INDOUT_CONF;
> +
>         return pca953x_check_register(chip, reg, bank);
> }
>
> The chip we are talking about further extend the PCAL registers, so it
> is currently covered by PCA953X_TYPE as base type and has the PCA_PCAL
> bit set. I really fails to see how this new type would nicely fit in
> the existing code.

Use switch-case instead of if-else-if and it will bring you a better
picture (not sure about __fallthrough be good or bad here).

switch (PCA_CHIP_TYPE(chip->driver_data)) {
case PCA6524_TYPE:
 ...
 __fallthrough; // perhaps better is to explicitly show what's going on
case PCA953X_TYPE:
default: // originally default seems PCA957X, but I guess this makes more sense
 ...
break;
case PCA957X_TYPE:
...
break;
}

-- 
With Best Regards,
Andy Shevchenko
