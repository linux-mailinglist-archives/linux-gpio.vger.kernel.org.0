Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A95D44C243
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Nov 2021 14:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbhKJNnN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 08:43:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbhKJNnL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Nov 2021 08:43:11 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67799C061764;
        Wed, 10 Nov 2021 05:40:24 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id q74so6410624ybq.11;
        Wed, 10 Nov 2021 05:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t8z0LYFGE6DI0GYMpGpDh9ycQEL09twpw3cECR1Vgxg=;
        b=Lphqzelmw/aq8+au0LafvSHcHqc6/axxJg4Qb53yDwy3F60/Ozf1/tAE5lx4cjlfah
         rAOl8YcqG5TlLCvDijtepDIMJmp0LLBD+lj4UGWp018obtbWpc9mAtPf0+eH8PMvq6yj
         xQn7vZ1vf0qO59acJ5rraIVChrgGVqRYLq9FfuOwQLBGKyLKxYAku2JJvF6aZJf2d5hm
         WobeE8Epje/Y9JGosNz+J1kxcunf+5Py9A9JGvFuMY3wkN5tlTwHfXqxv1PjLYIT2bep
         lvMQEs787bePQ7CUG+2HHKGcJd98MY8/V52VWk46JfOn2soeBxvJijnb4Qm3g4TnqllJ
         mT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t8z0LYFGE6DI0GYMpGpDh9ycQEL09twpw3cECR1Vgxg=;
        b=2agz+KrXV5EjRElaiXZByIbVqAmZbRgEpvzebwnPkzBjHdUBQC8IfUr+PW3+A8STx8
         UhxVq5HpNt10YoZZmb7Y6fwMWrq5cQ24l6IuhGdWEMshtSz/vgYeiItpNomsgBS1SeMg
         DFExg7qWA9QlMgZyHY5bHbsy5zaSobhk4O22O1jIyG5KHe0OWRLHsUPWCEDXyTJxHzTe
         WiBg4D5lXezhL+U3dXuC6qD8hW8/6p01G5FpLx8gQEN72t7E8V8fH2A0OF8UCQ0wOqKD
         x59IqqKBClQt1qebvt67YZnRvcxrlaBIJ1NU+84LOdZbsL+UwEwEribWhExGj2i4gLw4
         1fdg==
X-Gm-Message-State: AOAM530TbH4Ldf7iGP4ZWQdQOlDdI7H6XtQoEvW7WDTPGVvkT6N7cXm7
        GFUpOsqCcT6D/m+yGLYq6wlhN5/cYVhD4j+f8mEzX4avYhk=
X-Google-Smtp-Source: ABdhPJzj/O3r0ddby2+afMmLd143VEC/07nnzbWiC38BZrjVNn58H6kulJ/fPYZc315tVMeyCbCr66DTK3cPhL/c0Qw=
X-Received: by 2002:a25:1c02:: with SMTP id c2mr18224314ybc.218.1636551623650;
 Wed, 10 Nov 2021 05:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20211029124437.20721-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211029124437.20721-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXwJ043PuJnNU=L9+oN05ExjU-Km9CWBoXO9zqAVizByg@mail.gmail.com>
In-Reply-To: <CAMuHMdXwJ043PuJnNU=L9+oN05ExjU-Km9CWBoXO9zqAVizByg@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 10 Nov 2021 13:39:57 +0000
Message-ID: <CA+V-a8v6L6eFTVaCNO_gRxs4Yb0RCHyk1mmy7+r+hOp=ukLhBQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] pinctrl: renesas: pinctrl-rzg2l: Add support to
 get/set drive-strength and output-impedance-ohms
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
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

On Mon, Nov 8, 2021 at 3:40 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Oct 29, 2021 at 2:45 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > RZ/G2L supports two groups of pins Group-A and Group-B. For Group-A
> > pins drive-strength can be configured and for Group-B output-impedance
> > can be configured.
> >
> > This patch splits PIN_CFG_IOLH macro to PIN_CFG_IOLH_A/B and adds
> > support to get/set drive-strength and output-impedance-ohms for the
> > supported pins.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>
> > @@ -501,7 +507,7 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
> >         unsigned int arg = 0;
> >         unsigned long flags;
> >         void __iomem *addr;
> > -       u32 port = 0;
> > +       u32 port = 0, reg;
>
> "unsigned int index", for symmetry with rzg2l_pinctrl_pinconf_set()?
>
Agreed.

> >         u32 cfg = 0;
> >         u8 bit = 0;
> >
> > @@ -549,6 +555,24 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
> >                 break;
> >         }
> >
> > +       case PIN_CONFIG_DRIVE_STRENGTH: {
> > +               if (!(cfg & PIN_CFG_IOLH_A))
> > +                       return -EINVAL;
> > +
> > +               reg = rzg2l_read_pin_config(pctrl, port_pin, IOLH(port), bit, IOLH_MASK);
>
> port_pin still under discussion, cfr. my comments for the other
> patches in this series.
>
As discussed in patch 3/5 will drop this.

Cheers,
Prabhakar

> The rest looks good to me, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
