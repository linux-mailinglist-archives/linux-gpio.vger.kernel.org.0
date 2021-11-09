Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4759644B04C
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 16:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234526AbhKIP2B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 10:28:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235782AbhKIP2B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 10:28:01 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F20FCC061764;
        Tue,  9 Nov 2021 07:25:14 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id 131so53835335ybc.7;
        Tue, 09 Nov 2021 07:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1YtPKMAKhh4yr7fG5V9nmBRI32AwNngOJNQ80JUITj4=;
        b=c7paMbIK2hqj6wQ/mm5GGvSBbBPqXannMb3ctv68OXdJsWNoG39Na33zL9sKXHa6aV
         7wEwsjzCULgVq2m+aITEDLuoilL4uN8hPuG9nN4lvN7p4vigwPwk5m3V89ON+CjBCw9/
         MUiikHB93jM4FhWuDcIDkpXYBbIbwszcGJ1D3jpbUR764AQ3V+LLL8kCyx6SZ18BM52G
         vDGY0dUx0hCviLLzfpMOUC+8PpnFmlrMjcVPJ+cvnSM9SvdrYof+EzGSwP/fVPs3UfpP
         v3+QAkN7F7TdEcXRZ3TLnRJeY/ugOlrRJbp/Q0ofpyL5XnksiWaQrZHYTmfNgIMid7QP
         3CKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1YtPKMAKhh4yr7fG5V9nmBRI32AwNngOJNQ80JUITj4=;
        b=TMXAlaBg7IUmNI5WjPfJt2OXMIE3WcM/d0aunaG9Udy7n4+1l5xrDoBTjgxkFGuYP/
         FXe2pklolLU0SIHER+njWQEVS10c0VH7tn9pD98LlsjRYtP5u/Tr77RLtaeEgK+2SMaJ
         DvJlf7Fy7N9WTLLO10G5bNP+RWZJq+JQdoqnzvZWZ2MagAHp7REKTwINCZi+GTLDMyHa
         /SszQ0ys9UWjvCiFth4XkWyES0xXHp+54bXZFDPePLfJF88XzEKyAFvz1j+Ut7kkCp8w
         bE1H5qJ/U6Ohk+yCTokEuRvkJeYT96S/+XUEoCM+UiOIO5qSG6xzbd6mUanqQ4UknDAn
         Uxjg==
X-Gm-Message-State: AOAM530oqT6JJ4NkqAnuuS1xJ0v7VUHAlCP9KtyEWQmT38/TN84C0kAP
        AbADmZ6VBQo5JF93jRj9ewZ/o3gZVfdkkF0f9/2l2PS37llN1Q==
X-Google-Smtp-Source: ABdhPJxpUVbqgyBdPsEoi4i0MlIUmaqMD/K28fOWDIkFYJCv0Xr5XcsO29RbRFKS988n3+xgJVhnsbZ5Ld7mA5yyA/c=
X-Received: by 2002:a5b:783:: with SMTP id b3mr8787410ybq.328.1636471514166;
 Tue, 09 Nov 2021 07:25:14 -0800 (PST)
MIME-Version: 1.0
References: <20211029124437.20721-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211029124437.20721-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdV+716v3SOLM4Sf6arK5jEPgtc0NSOU6nZXQGXUT+-+3Q@mail.gmail.com>
 <CA+V-a8t2KZNqCHJQP_bj9+-RKVBBJpz=pnBXzpyy4tjbUe14EA@mail.gmail.com> <CAMuHMdW8NeSpv35a7Eq_+NMAE5Uamm_pD+Dp+OeHvCMqd3f2Xw@mail.gmail.com>
In-Reply-To: <CAMuHMdW8NeSpv35a7Eq_+NMAE5Uamm_pD+Dp+OeHvCMqd3f2Xw@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 9 Nov 2021 15:24:48 +0000
Message-ID: <CA+V-a8u0CMhoYJB8buZugG4Kd4BEkviv_WpBTgmJr6y2+gb-sg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: renesas: pinctrl-rzg2l: Add support to
 get/set pin config for GPIO port pins
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

On Tue, Nov 9, 2021 at 3:00 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Nov 9, 2021 at 3:31 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Mon, Nov 8, 2021 at 3:36 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Fri, Oct 29, 2021 at 2:44 PM Lad Prabhakar
> > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > Add support to get/set pin config for GPIO port pins.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > > > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > >
> > > > @@ -495,6 +512,14 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
> > > >                 port = RZG2L_SINGLE_PIN_GET_PORT(*pin_data);
> > > >                 cfg = RZG2L_SINGLE_PIN_GET_CFGS(*pin_data);
> > > >                 bit = RZG2L_SINGLE_PIN_GET_BIT(*pin_data);
> > > > +       } else {
> > > > +               cfg = RZG2L_GPIO_PORT_GET_CFGS(*pin_data);
> > > > +               port = RZG2L_PIN_ID_TO_PORT(_pin);
> > > > +               bit = RZG2L_PIN_ID_TO_PIN(_pin);
> > > > +               port_pin = true;
> > >
> > > Instead of setting this flag, perhaps port should be adjusted?
> >
> > Something like below?
> >
> > #define RZG2L_PORT_START_OFFSET 0x10
> >
> > port = RZG2L_PIN_ID_TO_PORT_pin) + RZG2L_PORT_START_OFFSET;
> > rzg2l_validate_gpio_pin(pctrl, *pin_data, port - RZG2L_PORT_START_OFFSET, bit)
>
> Or adjust port after the call to rzg2l_validate_gpio_pin(), to avoid adding
> the offset first, and subtracting it again for calling the latter?
>
> > and rename port -> port_offset in rzg2l_pinctrl_pinconf_get/set
>
> That makes sense.  Currently "port" has two meanings: it can mean
> either the GPIO port index, or the global register index covering both
> single function pin groups and GPIO port indices.
> RZG2L_SINGLE_PIN_GET_PORT() returns the latter.
> RZG2L_PIN_ID_TO_PORT() returns the former, thus needing an extra offset
> to convert to the global register index.
>
for symmetry will rename the below:
RZG2L_SINGLE_PIN_GET_PORT -> RZG2L_SINGLE_PIN_GET_PORT_OFFSET

Introduce a new macros:
#define RZG2L_PORT_START_OFFSET 0x10
#define RZG2L_PIN_ID_TO_PORT_OFFSET(id) (((id) / RZG2L_PINS_PER_PORT)
+ RZG2L_PORT_START_OFFSET)

And use the above two in rzg2l_pinctrl_pinconf_get/set along with
renaming  port -> port_offset

And for rzg2l_validate_gpio_pin() will use below instead:
rzg2l_validate_gpio_pin(pctrl, *pin_data, RZG2L_PIN_ID_TO_PORT(_pin), bit);

> > Or
> > would you prefer to change the RZG2L_PIN_ID_TO_PORT macro and adjust
> > the entire file?
>
> Changing RZG2L_PIN_ID_TO_PORT() would imply changing all macros
> accessing GPIO registers, and is thus quite intrusive.
>
Agreed, I will drop this option.

Cheers,
Prabhakar
> > > Then rzg2l_r{ead,mw}_pin_config() don't have to care about that
> > > anymore.
> > >
> > Agreed.
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
