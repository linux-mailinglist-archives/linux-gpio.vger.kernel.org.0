Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A54744AF80
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 15:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238602AbhKIOel (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 09:34:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238509AbhKIOel (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 09:34:41 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5C2C061764;
        Tue,  9 Nov 2021 06:31:55 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id 131so53400647ybc.7;
        Tue, 09 Nov 2021 06:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4bcJJle08L6e5QtuMGaTEx3ozRxrEhWOqTVhLYka+PU=;
        b=F3f+NIxB70MJWpqI563HYI83q16+ZfcmPTY/1/+3Z6cuEwhT3J6RouY04NlzhwGYP+
         U97y0ULmgwEwOpSSDxqXbX1hANCHkmBWUrWLeZAiWuYAYpXSF4wERaYTb0Bfi44+P85a
         PU1bgWf7LlJFTqQK31++W2uTs8OLsFwqMfQ1F0sD9jCtxIjbkwnoq9gBB18NWPqcVrgS
         qvGxBx3Gc+Rm5zCgAtxt488VKO9SVFW1fwATiUZaaPLID2yTFEFlCrRlF/fhtmYRRGn0
         8ChVdrQQxRQxDCk1Eqj/NqP9IuzGm+LlvysNr973zYKjZfGBzYsCMhhPHNUgWRa4Hvh1
         fo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4bcJJle08L6e5QtuMGaTEx3ozRxrEhWOqTVhLYka+PU=;
        b=C72NI3A4ZevMa7lILR50SY+G6p09dLGG3sU68JLdwD0Fq8aK02a+Wy+MbN0UhRzKk2
         jXiGPRFytScG7nJK1E7K6IAIdX/XDCA1O+dz4GJ1Y6gbRNHyUi/vN6X4g8OPaP/8r2hd
         cq10PjFJoizB5PWCoKnNp5iBPzvDvTveNVe+nci0KEi8hC1NWZ+55HZrFejBlowO6vsI
         Y2k2UMKYwcS8zPBHnUi34VHN5zjLGlLA1rKMYqCsv5ZWPpCobf33Dzgr8xj+fwt0g5aa
         RL2ZRukcaI3Fi8kbnW/tUMuGi5wrT08XYnsRnKV2kwxyB+uLZs72HBmPuTPHhcWDAfzF
         qC9g==
X-Gm-Message-State: AOAM530p4304ZU5GLKMQ60xB3C3YGDxLAJEms9orsDZoEcy4/MqxVhFG
        nYOYZa7QjD+j8GO60X2NQ/bfSWR81UsRDZ4rxx9ZPGlHef/2SA==
X-Google-Smtp-Source: ABdhPJxh8/j6/XPcDGbi5wiABlWJ+pkbm2rYJmDqTA1tyVTkv/HuiUtzx9WbeSNDE/R/VDRPSVqXa/oveCz+NI/0GhA=
X-Received: by 2002:a25:c792:: with SMTP id w140mr8817617ybe.131.1636468314448;
 Tue, 09 Nov 2021 06:31:54 -0800 (PST)
MIME-Version: 1.0
References: <20211029124437.20721-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211029124437.20721-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV+716v3SOLM4Sf6arK5jEPgtc0NSOU6nZXQGXUT+-+3Q@mail.gmail.com>
In-Reply-To: <CAMuHMdV+716v3SOLM4Sf6arK5jEPgtc0NSOU6nZXQGXUT+-+3Q@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 9 Nov 2021 14:31:28 +0000
Message-ID: <CA+V-a8t2KZNqCHJQP_bj9+-RKVBBJpz=pnBXzpyy4tjbUe14EA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: renesas: pinctrl-rzg2l: Add support to
 get/set pin config for GPIO port pins
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Mon, Nov 8, 2021 at 3:36 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Oct 29, 2021 at 2:44 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add support to get/set pin config for GPIO port pins.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>
> > @@ -495,6 +512,14 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
> >                 port = RZG2L_SINGLE_PIN_GET_PORT(*pin_data);
> >                 cfg = RZG2L_SINGLE_PIN_GET_CFGS(*pin_data);
> >                 bit = RZG2L_SINGLE_PIN_GET_BIT(*pin_data);
> > +       } else {
> > +               cfg = RZG2L_GPIO_PORT_GET_CFGS(*pin_data);
> > +               port = RZG2L_PIN_ID_TO_PORT(_pin);
> > +               bit = RZG2L_PIN_ID_TO_PIN(_pin);
> > +               port_pin = true;
>
> Instead of setting this flag, perhaps port should be adjusted?

Something like below?

#define RZG2L_PORT_START_OFFSET 0x10

port = RZG2L_PIN_ID_TO_PORT_pin) + RZG2L_PORT_START_OFFSET;
rzg2l_validate_gpio_pin(pctrl, *pin_data, port - RZG2L_PORT_START_OFFSET, bit)

and rename port -> port_offset in rzg2l_pinctrl_pinconf_get/set Or
would you prefer to change the RZG2L_PIN_ID_TO_PORT macro and adjust
the entire file?

> Then rzg2l_r{ead,mw}_pin_config() don't have to care about that
> anymore.
>
Agreed.

Cheers,
Prabhakar

> > +
> > +               if (rzg2l_validate_gpio_pin(pctrl, *pin_data, port, bit))
> > +                       return -EINVAL;
> >         }
> >
> >         switch (param) {
> > @@ -557,6 +582,14 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
> >                 port = RZG2L_SINGLE_PIN_GET_PORT(*pin_data);
> >                 cfg = RZG2L_SINGLE_PIN_GET_CFGS(*pin_data);
> >                 bit = RZG2L_SINGLE_PIN_GET_BIT(*pin_data);
> > +       } else {
> > +               cfg = RZG2L_GPIO_PORT_GET_CFGS(*pin_data);
> > +               port = RZG2L_PIN_ID_TO_PORT(_pin);
> > +               bit = RZG2L_PIN_ID_TO_PIN(_pin);
> > +               port_pin = true;
>
> Likewise.
>
> > +
> > +               if (rzg2l_validate_gpio_pin(pctrl, *pin_data, port, bit))
> > +                       return -EINVAL;
> >         }
> >
> >         for (i = 0; i < num_configs; i++) {
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
