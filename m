Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27C443DD5D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Oct 2021 10:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhJ1JBi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 05:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhJ1JBh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 05:01:37 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE93CC061570;
        Thu, 28 Oct 2021 01:59:10 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id y3so2392656ybf.2;
        Thu, 28 Oct 2021 01:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZAtIrMWbv5on6WRur6yNujhfIaAJ4f/Bmd/NvYd0jDY=;
        b=PTJrKYXcOixs0iQoLyBWy3utrJEj8Hyva9RCjveHiFKQ2jyGRsDgqECRJN+CyRAcjp
         5xrIWa6JOd7Z8C3eIidMlwPnH9D9pHxgnzmhMJt7IW48I45lEXiLO8Ru2ZnC6ZvTTllY
         lCwiECLjGzwfSCVyokrFyRaOe1/sXfoywen14IKtBPHOgY8juQ8Bj7+zn1rKtLMq8yse
         DTJoEKhCCFJdx/V2GLI5DS7mJuti2C2XJ0SE01cpB8IHv2NqSZeEJ0qTqYlhYYYxFKRJ
         DV73+BZhpVtmbQqywzmjNvnACnA4bxk4jO3vrQEJPSsiGZsQzyvYcOQpOcRodY/YzCOg
         7WZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZAtIrMWbv5on6WRur6yNujhfIaAJ4f/Bmd/NvYd0jDY=;
        b=O+QW6flXiL3pUK5nMd+rVCYc6J5730ZcagNXAZCf4gQNsOg+vpd8DNbiX2bhwNBtCa
         PxEmfVSkBzl7MbpIZOHuF9yHJj31DfaCRTaqVMtAyYZkcmQWRdR7KYIh3JXV7Rya1yDh
         1uPeVv2XkqpXyl/LRXVjv2Cb0cOxOwaRiv6b04it+iDcPVJW+JinMsMsPTWccpHpvKsb
         gSEg7HNSrIAvxkhdiYold5V7tAK4dY4yzoPpWJoH+1x0ZO+c7D2gBbXUaPQfOb27xqvk
         Gz06l2p67GnM1mhYsN1LyKHzZ34ebF5P1xDgIgFzGeoLXzzNm2cMjVnimnYY2l44sWGu
         s/lA==
X-Gm-Message-State: AOAM532pmVJyqIDCmt7a5ROchnU9XENx4IFCuQsC7ywzwXWNt6nktDsN
        yTYPSjp0wnDJS3bS4WO5L7xjkWIRJWY0PyZyU7k=
X-Google-Smtp-Source: ABdhPJzjpT13HnM7dPir9RBGBx7Ap1uzKzgouFd8ZmEHlVQNTap3gPa3pgqb8dJf8qyClGVdypM6t1SRO1Cgb4Y+TRY=
X-Received: by 2002:a25:56c3:: with SMTP id k186mr3227880ybb.543.1635411550018;
 Thu, 28 Oct 2021 01:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211027134509.5036-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX81X+1AHp4Dsp70kG1TaYj=x3T8j3xidfLuskjd1Vc6g@mail.gmail.com>
In-Reply-To: <CAMuHMdX81X+1AHp4Dsp70kG1TaYj=x3T8j3xidfLuskjd1Vc6g@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 28 Oct 2021 09:58:44 +0100
Message-ID: <CA+V-a8tRRaF=-1_94g54mYREujLed4G-=DtCXP=QJ6YeRwgfWg@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: renesas: pinctrl-rzg2l: Add support to
 get/set drive-strength and output-impedance-ohms
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thank you for the review.

On Thu, Oct 28, 2021 at 8:56 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Oct 27, 2021 at 3:45 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add support to get/set drive-strength and output-impedance-ohms
> > for the supported pins.
> >
> > While at it also renamed the below macros to match the HW manual,
> > PIN_CFG_IOLH_SD0 -> PIN_CFG_IO_VMC_SD0
> > PIN_CFG_IOLH_SD1 -> PIN_CFG_IO_VMC_SD1
> > PIN_CFG_IOLH_QSPI -> PIN_CFG_IO_VMC_QSPI
> > PIN_CFG_IOLH_ETH0 -> PIN_CFG_IO_VMC_ETH0
> > PIN_CFG_IOLH_ETH1 -> PIN_CFG_IO_VMC_ETH1
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for the update!
>
> > ---
> > RFC->v1
> >  * Renamed macros to match HW manual
>
> You may want to split that off into a separate patch, as not all lines
> changed are touched for other reasons.
Sure will do.

> BTW, where do I find these "VMC" names in the HW manual?
>
I have shortened VOLTAGE MODE CONTROL to VMC from ETH_ch0/1, SD_ch0/1
and QSPI registers.

> >  * Added PIN_CFG_IOLH_A/B macros to differentiate Group A/B
> >  * Added helper function to read/rmw pin config
> >  * Included RB tags
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>
> > +static u32 rzg2l_read_pin_config(void __iomem *addr,
> > +                                u8 bit, u32 mask)
>
> The above fits on a single line.
>
> > +{
> > +       void __iomem *addr_adjust = addr;
> > +       u8 bit_adjust = bit;
>
> No need for these, just operate on addr and bit directly.
>
will do.

> > +       u32 reg;
> > +
> > +       if (bit >= 4) {
> > +               bit_adjust -= 4;
> > +               addr_adjust += 4;
> > +       }
> > +
> > +       reg = readl(addr_adjust) & (mask << (bit_adjust * 8));
> > +       return (reg >> (bit_adjust * 8));
> > +}
> > +
> > +static void rzg2l_rmw_pin_config(void __iomem *addr,
> > +                                u8 bit, u32 mask, u32 val)
> > +{
>
> The above fits on a single line.
>
will adjust that.

> > +       void __iomem *addr_adjust = addr;
> > +       u8 bit_adjust = bit;
>
> No need for these, just operate on addr and bit directly.
>
OK.

> > +       u32 reg;
> > +
> > +       if (bit >= 4) {
> > +               bit_adjust -= 4;
> > +               addr_adjust += 4;
> > +       }
> > +
> > +       reg = readl(addr_adjust) & ~(mask << (bit_adjust * 8));
> > +
> > +       writel(reg | val, addr_adjust);
>
> I think you should handle "val << (bit * 8)" here, instead of in
> all callers.
>
Agreed.

> > +}
>
> Please split the introduction of these helpers (and add conversion
> of the existing PIN_CONFIG_INPUT_ENABLE handling) off into a separate
> patch.
>
Agreed, will do.

> > @@ -484,6 +544,34 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
> >                 break;
> >         }
> >
> > +       case PIN_CONFIG_DRIVE_STRENGTH: {
> > +               static const unsigned int mA[4] = { 2, 4, 8, 12 };
> > +
> > +               if (!(cfg & PIN_CFG_IOLH_A))
> > +                       return -EINVAL;
> > +
> > +               spin_lock_irqsave(&pctrl->lock, flags);
> > +               addr = pctrl->base + IOLH(port);
> > +               reg = rzg2l_read_pin_config(addr, bit, IOLH_MASK);
> > +               arg = mA[reg];
> > +               spin_unlock_irqrestore(&pctrl->lock, flags);
>
> Do you need the spinlock for reading?
>
Yes, to avoid any mishaps, I also looked at pinctrl.c which uses
spinlock while reading.

> > +               break;
> > +       }
> > +
> > +       case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS: {
> > +               static const unsigned int oi[4] = { 100, 66, 50, 33 };
> > +
> > +               if (!(cfg & PIN_CFG_IOLH_B))
> > +                       return -EINVAL;
> > +
> > +               spin_lock_irqsave(&pctrl->lock, flags);
> > +               addr = pctrl->base + IOLH(port);
> > +               reg = rzg2l_read_pin_config(addr, bit, IOLH_MASK);
> > +               arg = oi[reg];
> > +               spin_unlock_irqrestore(&pctrl->lock, flags);
>
> Likewise.
>
> > +               break;
> > +       }
> > +
> >         default:
> >                 return -ENOTSUPP;
> >         }
>
> > @@ -564,6 +659,49 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
> >                         spin_unlock_irqrestore(&pctrl->lock, flags);
> >                         break;
> >                 }
> > +
> > +               case PIN_CONFIG_DRIVE_STRENGTH: {
> > +                       unsigned int arg = pinconf_to_config_argument(_configs[i]);
> > +                       static const unsigned int mA[4] = { 2, 4, 8, 12 };
>
> Duplicate, move to file scope?
>
Ok will do.

> > +
> > +                       if (!(cfg & PIN_CFG_IOLH_A))
> > +                               return -EINVAL;
> > +
> > +                       for (i = 0; i < ARRAY_SIZE(mA); i++) {
> > +                               if (arg == mA[i])
> > +                                       break;
> > +                       }
> > +                       if (i >= ARRAY_SIZE(mA))
> > +                               return -EINVAL;
> > +
> > +                       spin_lock_irqsave(&pctrl->lock, flags);
> > +                       addr = pctrl->base + IOLH(port);
> > +                       rzg2l_rmw_pin_config(addr, bit, IOLH_MASK, (i << (bit * 8)));
>
> Pass pctrl and offset instead of addr (also for rzg2l_read_pin_config,
> for symmetry), and move locking into rzg2l_rmw_pin_config()?
> Taking all of the above into account, that would become:
>
Agreed.

>     rzg2l_rmw_pin_config(pctrl, IOLH(port), bit, IOLH_MASK, i);
>
That looks much cleaner.

> > +                       spin_unlock_irqrestore(&pctrl->lock, flags);
> > +                       break;
> > +               }
> > +
> > +               case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS: {
> > +                       unsigned int arg = pinconf_to_config_argument(_configs[i]);
> > +                       static const unsigned int oi[4] = { 100, 66, 50, 33 };
>
> Duplicate, move to file scope?
>
Agreed.

> > +
> > +                       if (!(cfg & PIN_CFG_IOLH_B))
> > +                               return -EINVAL;
> > +
> > +                       for (i = 0; i < ARRAY_SIZE(oi); i++) {
> > +                               if (arg == oi[i])
> > +                                       break;
> > +                       }
> > +                       if (i >= ARRAY_SIZE(oi))
> > +                               return -EINVAL;
> > +
> > +                       spin_lock_irqsave(&pctrl->lock, flags);
> > +                       addr = pctrl->base + IOLH(port);
> > +                       rzg2l_rmw_pin_config(addr, bit, IOLH_MASK, (i << (bit * 8)));
>
> Likewise.
>
OK.

> > +                       spin_unlock_irqrestore(&pctrl->lock, flags);
> > +                       break;
> > +               }
> > +
> >                 default:
> >                         return -EOPNOTSUPP;
> >                 }
>
> The rest looks good to me!
>
Thanks, I'll post a v2 just with patches 3 and 4 only. Hope that is OK with you.

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
