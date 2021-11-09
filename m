Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C37B44AFE8
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 16:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbhKIPDF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 10:03:05 -0500
Received: from mail-yb1-f171.google.com ([209.85.219.171]:46711 "EHLO
        mail-yb1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234372AbhKIPDE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 10:03:04 -0500
Received: by mail-yb1-f171.google.com with SMTP id g17so29393316ybe.13;
        Tue, 09 Nov 2021 07:00:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pQs8NuOusvW43yJdvPU7h2JJb+2dPvnVfEafUayKssc=;
        b=gpWIoweDEN0RA7TUcMLj4dcr5fKLGVbCWEnrXW7IJGXr1eJE1TE85vSA8JrGLutgJI
         eks+k1Os/wOmMyJLryWRleXLY89JJ3lFWxAPFDtnorjKCTItvV4ZgGyJRNoKAYnn3M8B
         zW3uqEBhnCdTmOKz/KpfYuMjjM+bIprjMeKHk7Wq+zDC2dvzUzx24lJRB/MnRE6pWdha
         EQkuu8LQbak4brhKL2fpJ4pAyArJ4X17N9jOVUrY8aEBBNnLX1jQjdtoZ3hQX1HQZaEs
         Pox3gClxE4RP6BbjJlcRixg83szqTsmJI17sUlM5e4BSmSYSjWjx2Q1NdIucmkYzd5pK
         ANKA==
X-Gm-Message-State: AOAM530PHEKeBlT/tYdQyttsvgvQAoDCyJi1Ajy+RNaAmKiqecAgcm8X
        Zsxc+W258btGeXkus9vjjo8qR3go2FI7jg==
X-Google-Smtp-Source: ABdhPJwgTs2Eya/VzxmbZ9CRrEiumTi5lozMWnUeYSgdykvLIO6bcFn8FReAafEa3EDFCJFZo2KHpg==
X-Received: by 2002:a25:5003:: with SMTP id e3mr9059823ybb.482.1636470015719;
        Tue, 09 Nov 2021 07:00:15 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 23sm698191vkk.17.2021.11.09.07.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 07:00:15 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id ay21so39000215uab.12;
        Tue, 09 Nov 2021 07:00:15 -0800 (PST)
X-Received: by 2002:a05:6102:1354:: with SMTP id j20mr42333682vsl.41.1636470014854;
 Tue, 09 Nov 2021 07:00:14 -0800 (PST)
MIME-Version: 1.0
References: <20211029124437.20721-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211029124437.20721-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdV+716v3SOLM4Sf6arK5jEPgtc0NSOU6nZXQGXUT+-+3Q@mail.gmail.com> <CA+V-a8t2KZNqCHJQP_bj9+-RKVBBJpz=pnBXzpyy4tjbUe14EA@mail.gmail.com>
In-Reply-To: <CA+V-a8t2KZNqCHJQP_bj9+-RKVBBJpz=pnBXzpyy4tjbUe14EA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 16:00:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW8NeSpv35a7Eq_+NMAE5Uamm_pD+Dp+OeHvCMqd3f2Xw@mail.gmail.com>
Message-ID: <CAMuHMdW8NeSpv35a7Eq_+NMAE5Uamm_pD+Dp+OeHvCMqd3f2Xw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: renesas: pinctrl-rzg2l: Add support to
 get/set pin config for GPIO port pins
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Tue, Nov 9, 2021 at 3:31 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Mon, Nov 8, 2021 at 3:36 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Oct 29, 2021 at 2:44 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Add support to get/set pin config for GPIO port pins.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> >
> > > @@ -495,6 +512,14 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
> > >                 port = RZG2L_SINGLE_PIN_GET_PORT(*pin_data);
> > >                 cfg = RZG2L_SINGLE_PIN_GET_CFGS(*pin_data);
> > >                 bit = RZG2L_SINGLE_PIN_GET_BIT(*pin_data);
> > > +       } else {
> > > +               cfg = RZG2L_GPIO_PORT_GET_CFGS(*pin_data);
> > > +               port = RZG2L_PIN_ID_TO_PORT(_pin);
> > > +               bit = RZG2L_PIN_ID_TO_PIN(_pin);
> > > +               port_pin = true;
> >
> > Instead of setting this flag, perhaps port should be adjusted?
>
> Something like below?
>
> #define RZG2L_PORT_START_OFFSET 0x10
>
> port = RZG2L_PIN_ID_TO_PORT_pin) + RZG2L_PORT_START_OFFSET;
> rzg2l_validate_gpio_pin(pctrl, *pin_data, port - RZG2L_PORT_START_OFFSET, bit)

Or adjust port after the call to rzg2l_validate_gpio_pin(), to avoid adding
the offset first, and subtracting it again for calling the latter?

> and rename port -> port_offset in rzg2l_pinctrl_pinconf_get/set

That makes sense.  Currently "port" has two meanings: it can mean
either the GPIO port index, or the global register index covering both
single function pin groups and GPIO port indices.
RZG2L_SINGLE_PIN_GET_PORT() returns the latter.
RZG2L_PIN_ID_TO_PORT() returns the former, thus needing an extra offset
to convert to the global register index.

> Or
> would you prefer to change the RZG2L_PIN_ID_TO_PORT macro and adjust
> the entire file?

Changing RZG2L_PIN_ID_TO_PORT() would imply changing all macros
accessing GPIO registers, and is thus quite intrusive.

> > Then rzg2l_r{ead,mw}_pin_config() don't have to care about that
> > anymore.
> >
> Agreed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
