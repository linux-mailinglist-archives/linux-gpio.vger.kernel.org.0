Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC253D606F
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 18:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237323AbhGZPWX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 11:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236558AbhGZPWW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jul 2021 11:22:22 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB4DC061760;
        Mon, 26 Jul 2021 09:02:49 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id z18so15625889ybg.8;
        Mon, 26 Jul 2021 09:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/vdCwKqpYs5uKHu1FuyczQq7cYQsTzNkCH7uKUuocFI=;
        b=Ccwppfqdag4Y2Dt+znmPsPo/79r7J8pR7XbyuJVbv1BOJacE/wy3mijdcYafdP9pUb
         /c0AA2xeuqCilvKD9mpEmCCjjmCtCAsCh/Up20j/E2x4Qa0BbGNylOUw1uIeLkrhOG6O
         aA8P+35pFNosgQSzwfaW5RLoK8VdXdD+wDC+8s/eXxMY38Wt4u+oj6Jq0+MrfHI5W8B1
         sF+RIwR4Ug4eK1C0x4UhwZuYXAIJc4VWC83bWYG106bXV+cjrmmMImIQ8hg3PMFp9Xll
         ohz8SVUkb1aUI3jBRi0+uLFCoKHE97Kb2AeAZHQGxIKt3ZvyMxN22QdbI6Hojv/rlC/m
         AyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/vdCwKqpYs5uKHu1FuyczQq7cYQsTzNkCH7uKUuocFI=;
        b=Vfj58xHndOP6eq9dRXYDGhZV8E2NW8au1bwJ57Uo+F3b71aTdTryMQgMWwa/7SNYiw
         kjo/J/9S2tcN0YLdtaPlyI02cIuL7Y6DOUkknoKVXtxcub3DvwHMBW88B/ByNFWDAK2b
         NTFV1/fW7LnP+H48Zh9tP2/qSn5cNPRyY+VfFE78FW0iPqlxZFdZO4CnivAxoChhOQaq
         2LLDLSEK7cWMadXNqySe5Glguz8soBaX+VaxrEEFaHD+KelZxdbRY9IrDRn/i9A9yvXE
         WUOo3egzNk6bVqeu40siLFhiRldbntCAs6qDH1y7ZJp42eWecHuB6OTDF1hlvrHhXUyW
         UrGA==
X-Gm-Message-State: AOAM533EGi8S9sgv9lIEjGR8blFfuaDhbMIN9JvjTGnBfuhBRLPSVeX4
        lM9bKgTuKCUXiwT4av/b8nGLe3SnmeiiSOOwM98=
X-Google-Smtp-Source: ABdhPJysmaJMplTVwB1scGNstcAWZRe4sNDtyS++LO5nZ2c5Sb5uZWE7wJb4nytjMk2b5fLBqNqGTTqezIozOSTzZsw=
X-Received: by 2002:a5b:403:: with SMTP id m3mr25971799ybp.62.1627315369061;
 Mon, 26 Jul 2021 09:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210721191558.22484-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210721191558.22484-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWD+p7w2_KSsM-sYoZfK-7z4BM7yXAOf+5amxkmq4xvPg@mail.gmail.com>
In-Reply-To: <CAMuHMdWD+p7w2_KSsM-sYoZfK-7z4BM7yXAOf+5amxkmq4xvPg@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 26 Jul 2021 17:02:22 +0100
Message-ID: <CA+V-a8tb+F_CfbzUYoQBka0c2WptA+GpirxWSSoGYMgR6KpTMA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] pinctrl: renesas: Add RZ/G2L pin and gpio
 controller driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thank you for the review.

On Mon, Jul 26, 2021 at 2:25 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Jul 21, 2021 at 9:16 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add support for pin and gpio controller driver for RZ/G2L SoC.
> >
> > Based on a patch in the BSP by Hien Huynh <hien.huynh.px@renesas.com>.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for the update!
>
> > --- /dev/null
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>
> > +#define RZG2L_MPXED_PIN_FUNCS          (PIN_CFG_IOLH | \
> > +                                        PIN_CFG_SR | \
> > +                                        PIN_CFG_PUPD | \
> > +                                        PIN_CFG_FILONOFF | \
> > +                                        PIN_CFG_FILNUM | \
> > +                                        PIN_CFG_FILCLKSEL)
> > +
> > +#define RZG2L_MPXED_ETH_PIN_FUNCS(x)   ((x) | \
> > +                                        PIN_CFG_FILONOFF | \
> > +                                        PIN_CFG_FILNUM | \
> > +                                        PIN_CFG_FILCLKSEL)
>
> I thought you were going for MULTI? ;-)
>
I renamed it to _MULTI but it didn't sound good so renamed it to the
other suggested alternative "MPXED".

> > +
> > +/*
> > + * n indicates number of pins in the port, a is the register index
> > + * and f is pin configuration capabilities supported.
> > + */
> > +#define RZG2L_GPIO_PORT_PACK(n, a, f)  (((n) << 28) | ((a) << 20) | (f))
> > +#define RZG2L_GPIO_PORT_GET_PINCNT(x)  (((x) >> 28) & 0x7)
> > +#define RZG2L_GPIO_PORT_GET_INDEX(x)   ((((x) & GENMASK(27, 20)) >> 20) & 0x7f)
>
> Actually the "& 0x7f" can be removed, too, if you adjust the mask:
>
>     (((x) & GENMASK(26, 20)) >> 20)
>
Agreed.

> > +#define RZG2L_GPIO_PORT_GET_CFGS(x)    ((x) & GENMASK(19, 0))
> > +
> > +/*
> > + * BIT(31) indicates dedicated pin, p is the register index while
> > + * referencing to SR/IEN/IOLH/FILxx registers, b is the register bits
> > + * (b * 8) and f is the pin configuration capabilities supported.
> > + */
> > +#define RZG2L_SINGLE_PIN               BIT(31)
> > +#define RZG2L_SINGLE_PIN_PACK(p, b, f) (RZG2L_SINGLE_PIN | \
> > +                                        ((p) << 24) | ((b) << 20) | (f))
> > +#define RZG2L_SINGLE_PIN_GET_PORT(x)   (((x) >> 24) & 0x7f)
> > +#define RZG2L_SINGLE_PIN_GET_BIT(x)    ((((x) & GENMASK(23, 20)) >> 20) & 0x7)
>
> Likewise:
>
>     (((x) & GENMASK(22, 20)) >> 20)
>
Agreed.

> > +#define RZG2L_SINGLE_PIN_GET_CFGS(x)   ((x) & GENMASK(19, 0))
>
> > +       struct rzg2l_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> > +       struct function_desc *func;
> > +       unsigned int i, *psel_val;
> > +       struct group_desc *group;
> > +       unsigned long data;
> > +       int *pins;
> > +
> > +       func = pinmux_generic_get_function(pctldev, func_selector);
> > +       if (!func)
> > +               return -EINVAL;
> > +       group = pinctrl_generic_get_group(pctldev, group_selector);
> > +       if (!group)
> > +               return -EINVAL;
> > +
> > +       psel_val = func->data;
> > +       pins = group->pins;
> > +       data = (unsigned long)group->data;
>
> Lkp reports data is unused.
> Which matches with passing NULL as the last parameter of
> pinctrl_generic_add_group().
>
Will drop this variable.

Cheers,
Prabhakar
> > +
> > +       for (i = 0; i < group->num_pins; i++) {
> > +               dev_dbg(pctrl->dev, "port:%u pin: %u PSEL:%u\n",
> > +                       RZG2L_PIN_ID_TO_PORT(pins[i]), RZG2L_PIN_ID_TO_PIN(pins[i]),
> > +                       psel_val[i]);
> > +               rzg2l_pinctrl_set_pfc_mode(pctrl, RZG2L_PIN_ID_TO_PORT(pins[i]),
> > +                                          RZG2L_PIN_ID_TO_PIN(pins[i]), psel_val[i]);
> > +       }
> > +
> > +       return 0;
> > +};
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
