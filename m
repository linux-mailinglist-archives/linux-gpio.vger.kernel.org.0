Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720BD43BC87
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 23:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239678AbhJZVjJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 17:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239669AbhJZVjI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Oct 2021 17:39:08 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09638C061570;
        Tue, 26 Oct 2021 14:36:44 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id a6so1031212ybq.9;
        Tue, 26 Oct 2021 14:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4wNyPqGE0Nzj26+1d7qK2TZKb0WDGW0xR3NS0/Dm8D8=;
        b=GEmgQETGyiJphS4CkZY+/W+RfT30EWmPhkSALapYdNnp7ZzzxU7W9CBTByYovl3XTu
         D1o4ToRTb4bN/71ajbmVU8N4Em1c8Q4hc9b461DCLf0F7hqdnyh7jmgeUBgvdAIZ+1bC
         op5Z2bIVLdcIGRRGO1vIPOWreM5JcGlu2Zvqh6Az3ccghSTHQ146nyhOjZF10Ggu26jO
         rXO0ZnJElx0VGUpvt4HjxAADRtNFhtk/eHxODAIIYXQDcYfCZ3FHlLMRaCurRUVHtcEP
         W29TdhkYvTJdTFzCBG/l/3GqQUW0HaFL/z+IMKoU8gCYeLWm4G/AD/MQJ+VLbuyxnQ8I
         KK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4wNyPqGE0Nzj26+1d7qK2TZKb0WDGW0xR3NS0/Dm8D8=;
        b=7pvWeqUn4/hU2irWQg1J9h4evfmcfyRhmJ7UuKUgwfhJJ1OkvznEMci0pKIQRBFq75
         3oyd5haCjxRbVcob0IdEuCa9Fxwyn3pwypmqS0i2nzO06H/WFng1pDBz6qYdci7viVy9
         RmLLjHUWWfNTXqViZRHmVI9/IkaNfZytrR+cN5ZC57HojTMXOEMghEGfm7hDxvD54TRU
         fx6EPpxE+rP+z6JOg/nMlVA0J0BWqB1+vRhmvROVjT0T3DtEL2ZcigNqFMrWwJB+OX0G
         ZcROQTtPaNXn8dnrokATeYsCp50Ke5rEmZJJosXUiVbFeUc+mqp2qxx5WPU8mfybu95u
         KDSQ==
X-Gm-Message-State: AOAM533MndgV8ZuV+0vYBZGoRlXpKnG28+QeytmXoCX6We9s+n8tda04
        2sE98VbmzF9/eDR8mPHMl6arXeyXjWNc1d/nBIJatVKqGzk=
X-Google-Smtp-Source: ABdhPJyYcqrrKYkTH7z5pS2QaoRaP8XhF7TcGKpw4QG6fNwhow0uLaanWQMMefPjJDQjEA4NA6a4x+vUzsD+cW4aFGY=
X-Received: by 2002:a5b:783:: with SMTP id b3mr25680236ybq.328.1635284203236;
 Tue, 26 Oct 2021 14:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210930121630.17449-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210930121630.17449-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXHv7H3xxEYFLhfBf+Pun-w=F4k5S2RAYJY6qz75QpxhQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXHv7H3xxEYFLhfBf+Pun-w=F4k5S2RAYJY6qz75QpxhQ@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 26 Oct 2021 22:36:17 +0100
Message-ID: <CA+V-a8uS6fiHAWbJTXtVJgHPqvtDGPf-RupQGaKJv7wWkurLYw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] pinctrl: renesas: pinctrl-rzg2l: Add support to
 get/set drive-strength and output-impedance
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

On Thu, Oct 7, 2021 at 6:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Sep 30, 2021 at 2:17 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add support to get/set drive-strength and output-impedance of the pins.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > @@ -47,6 +47,7 @@
> >  #define PIN_CFG_FILONOFF               BIT(9)
> >  #define PIN_CFG_FILNUM                 BIT(10)
> >  #define PIN_CFG_FILCLKSEL              BIT(11)
> > +#define PIN_CFG_GROUP_B                        BIT(12)
>
> Perhaps it would be easier to have separate PIN_CFG_IOLH_A and
> PIN_CFG_IOLH_B flags, instead of a PIN_CFG_IOLH flag and a
> PIN_CFG_GROUP_B modifier flag?
>
Agreed will do that.

> >
> >  #define RZG2L_MPXED_PIN_FUNCS          (PIN_CFG_IOLH | \
> >                                          PIN_CFG_SR | \
>
> > @@ -484,6 +513,38 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
> >                 break;
> >         }
> >
> > +       case PIN_CONFIG_OUTPUT_IMPEDANCE:
> > +       case PIN_CONFIG_DRIVE_STRENGTH: {
> > +               unsigned int mA[4] = { 2, 4, 8, 12 };
> > +               unsigned int oi[4] = { 100, 66, 50, 33 };
>
> static const
>
agreed.

> > +
> > +               if (param == PIN_CONFIG_DRIVE_STRENGTH) {
> > +                       if (!(cfg & PIN_CFG_IOLH) || groupb_pin)
> > +                               return -EINVAL;
> > +               } else {
> > +                       if (!(cfg & PIN_CFG_IOLH) || !groupb_pin)
> > +                               return -EINVAL;
> > +               }
> > +
> > +               spin_lock_irqsave(&pctrl->lock, flags);
> > +
> > +               /* handle _L/_H for 32-bit register read/write */
> > +               addr = pctrl->base + IOLH(port);
> > +               if (bit >= 4) {
> > +                       bit -= 4;
> > +                       addr += 4;
> > +               }
> > +
> > +               reg = readl(addr) & (IOLH_MASK << (bit * 8));
> > +               reg = reg >> (bit * 8);
> > +               if (param == PIN_CONFIG_DRIVE_STRENGTH)
> > +                       arg = mA[reg];
> > +               else
> > +                       arg = oi[reg];
> > +               spin_unlock_irqrestore(&pctrl->lock, flags);
>
> I think you've reached the point where it starts to make sense to
> have helper functions to read and modify these sub-register fields
> that may be located into the current or next register.
>
Ok will add helpers to read and rmw.

> And after that, you can split it in two smaller separate cases for
> drive strength and output impedance.
>
Agreed.

Cheers,
Prabhakar

> > +               break;
> > +       }
> > +
> >         default:
> >                 return -ENOTSUPP;
> >         }
>
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
