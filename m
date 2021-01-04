Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66EA82E93E9
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 12:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbhADLGN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 06:06:13 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:46683 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbhADLGN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 06:06:13 -0500
Received: by mail-ot1-f46.google.com with SMTP id w3so25626794otp.13;
        Mon, 04 Jan 2021 03:05:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LIpUYrX61nfFsDoXO/L4lmaf9qz5QXsNQIcHRlMJgwY=;
        b=Qze3xvn8y3473oauRuzsSddQu7VL+jdR0WXDRp8lsTWvJc0XHfSxuGjEER5q9OeBct
         u2sOZVsc6O9FCXYbSXFJuPWoQMNbKts+KEdoXfpkR+mg3lhkSKJrhQELp3XnlCFZAbeg
         lsZZgpMcl0Uo2gb2tsOvtOrebop+5d1iMDks3eOGDXha0imAmBxjnh1YPSmE4SgTeWQ7
         aHJElZ8w+Iq/G7wiWuyNBt4llSEP0a7EwIBkl8qV2joomgEWX25yhvvn56qOqYmkxc8Z
         uHnbEMFnEr38t0g6j8ARzr/RyuSdXp3rz3Au5pvPDrYj3GFvI6mgc3SnKTup6PhI5kYS
         8wbg==
X-Gm-Message-State: AOAM533feV4hojqVmOJlnqn0wYoGHTG+qs01wdi4eCI3F5KWnThku0Z1
        dX0hAA/hVKRtiLwZCJ9psZEb0ScckqCwvHtaEKJFz7mudas=
X-Google-Smtp-Source: ABdhPJyX3fUxxR29uM9FkfmYEjAWFurR6x4X2ZT1ujGcW3N/3qakSojQiH6oqMJHjTcpo9rVpuk8vKKxah9Bz9tugkU=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr52447483oth.250.1609758332259;
 Mon, 04 Jan 2021 03:05:32 -0800 (PST)
MIME-Version: 1.0
References: <20201231153842.25782-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TYBPR01MB53095D8BBF8E17AB824243F786D50@TYBPR01MB5309.jpnprd01.prod.outlook.com>
 <CAMpxmJVBAE=mh+ZapJ430sYjnwNh-kyMt0P=FjQ=vqjozb7zVA@mail.gmail.com>
In-Reply-To: <CAMpxmJVBAE=mh+ZapJ430sYjnwNh-kyMt0P=FjQ=vqjozb7zVA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jan 2021 12:05:21 +0100
Message-ID: <CAMuHMdXWCdKu4HwzyCta4fO0+kbG2HmuZ826DiNsMn5M6+2Ojg@mail.gmail.com>
Subject: Re: [PATCH] gpio: Kconfig: Update help description for GPIO_RCAR
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz et al,

On Sun, Jan 3, 2021 at 4:29 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Fri, Jan 1, 2021 at 6:07 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > -----Original Message-----
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Sent: 31 December 2020 15:39
> > > To: Linus Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski
> > > <bgolaszewski@baylibre.com>; Geert Uytterhoeven <geert+renesas@glider.be>
> > > Cc: linux-gpio@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > > renesas-soc@vger.kernel.org; Prabhakar <prabhakar.csengg@gmail.com>;
> > > Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Subject: [PATCH] gpio: Kconfig: Update help description for GPIO_RCAR
> > >
> > > The gpio-rcar driver supports R-Car Gen{1,2,3} and RZ/G{1,2} SoC's, update
> > > the description to reflect this.
> >
> > Not sure we need to make this generic by  dropping {1,2,3}/{1,2} and use R-Car and RZ/G SoC's instead ???
> >
>
> This looks better IMO - if Geert is OK with that, then let's change it.

"R-Car and RZ/G" sounds better to me, as it is present on all known
R-Car and RZ/G SoCs. We can change the help text if that ever changes.

> > > --- a/drivers/gpio/Kconfig
> > > +++ b/drivers/gpio/Kconfig
> > > @@ -486,11 +486,12 @@ config GPIO_PXA
> > >         Say yes here to support the PXA GPIO device
> > >
> > >  config GPIO_RCAR
> > > -     tristate "Renesas R-Car GPIO"
> > > +     tristate "Renesas R-Car Gen{1,2,3} and RZ/G{1,2} GPIO support"
> > >       depends on ARCH_RENESAS || COMPILE_TEST
> > >       select GPIOLIB_IRQCHIP
> > >       help
> > > -       Say yes here to support GPIO on Renesas R-Car SoCs.
> > > +       Say yes here to support GPIO on Renesas R-Car Gen{1,2,3} and
> > > +       RZ/G{1,2} SoCs.
> > >
> > >  config GPIO_RDA
> > >       bool "RDA Micro GPIO controller support"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
