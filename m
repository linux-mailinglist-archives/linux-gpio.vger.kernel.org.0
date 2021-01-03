Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C83C2E8CE2
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Jan 2021 16:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbhACPa0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Jan 2021 10:30:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726949AbhACPa0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Jan 2021 10:30:26 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B4CC0613C1
        for <linux-gpio@vger.kernel.org>; Sun,  3 Jan 2021 07:29:45 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id b9so33654560ejy.0
        for <linux-gpio@vger.kernel.org>; Sun, 03 Jan 2021 07:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QVR3QQVTATVRnPc00Pw9QhaKce8QLhd0JoT9CxmbxsM=;
        b=HjhkAN35KRKoGFBhwvriiUGjdFo7LS0iI/HPw1kkLUmdTbsiaMoWYCGZPVcfqb/MbQ
         0F2la0TeOtNMygS5AGmfq8BFOAVrTSG1SFG8Cvzo0bXm+rLImUsH746SmEtOMuqVkOTY
         8J7FdgY/KWynSrQwthSA3hdeLUA5h3C1nVk3fO+Rtqz3V/brlr+I2D7XqoMF1o08jD3Q
         xQUR9ncKWpLOeBkQC0iA+c+c5lrf7tiNzEM0jTmy7FQaCfUz4AbqagUx+gdZkVTHQTSg
         YkBOGUuM8LjbG8we9ZMcYWGxjS0v5a/GK49CEKd3vNpj6rm/tIDr6sbcMC5T1yern3ni
         5+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QVR3QQVTATVRnPc00Pw9QhaKce8QLhd0JoT9CxmbxsM=;
        b=SLMIkYNmTueXCCWORh/3KTeh5mV3MaS9FiId1FqOU5v18uMeRMC9ZZJAcwQIsfoRZq
         IGyrSoI0jEa7Oc8ZpQP9UbQZUUUuxkHHL+fRMDpqlM1RNybUUCdBwsoPeSmf0YEGFtDg
         gMYBwmNIVCZ8eEe1c+J2A57qfuXCdB15Vq9qNoBhZcBnFiU8TdXprJN8NbEctW0hf4gb
         7nyOfcKuaOnelKJkjDLQnJPuuUvoDt3AP+bxB/CBX2YyVSUnn0cSA8GAqLkD7shpvhIw
         Iq7ActBW2wZTWarxh/hWexSP+//Q2tcj8aOR/9CdSNWXbreyCu5TgK8Feyh26jUwJGNQ
         eMZA==
X-Gm-Message-State: AOAM532g3wj7dLNJr6yJG95lCcQQkxKvB8kJUHlZVCXKTe3T6k17vRBd
        nV9iH4xGuSKJpcPNVU2i08bHbzBeagLBGKYZ4g2v+g==
X-Google-Smtp-Source: ABdhPJyl0A7ZV4rGfkHC/DymAFo+BP1JJQaYfvVG7751yWsFsqOmVR7dK7EkNEmOsd2jjtqTz0M4NPz824sMjzwLroM=
X-Received: by 2002:a17:906:3513:: with SMTP id r19mr62727164eja.445.1609687784668;
 Sun, 03 Jan 2021 07:29:44 -0800 (PST)
MIME-Version: 1.0
References: <20201231153842.25782-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <TYBPR01MB53095D8BBF8E17AB824243F786D50@TYBPR01MB5309.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB53095D8BBF8E17AB824243F786D50@TYBPR01MB5309.jpnprd01.prod.outlook.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sun, 3 Jan 2021 16:29:33 +0100
Message-ID: <CAMpxmJVBAE=mh+ZapJ430sYjnwNh-kyMt0P=FjQ=vqjozb7zVA@mail.gmail.com>
Subject: Re: [PATCH] gpio: Kconfig: Update help description for GPIO_RCAR
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
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

On Fri, Jan 1, 2021 at 6:07 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Sent: 31 December 2020 15:39
> > To: Linus Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski
> > <bgolaszewski@baylibre.com>; Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: linux-gpio@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > renesas-soc@vger.kernel.org; Prabhakar <prabhakar.csengg@gmail.com>;
> > Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Subject: [PATCH] gpio: Kconfig: Update help description for GPIO_RCAR
> >
> > The gpio-rcar driver supports R-Car Gen{1,2,3} and RZ/G{1,2} SoC's, update
> > the description to reflect this.
>
> Not sure we need to make this generic by  dropping {1,2,3}/{1,2} and use R-Car and RZ/G SoC's instead ???
>

This looks better IMO - if Geert is OK with that, then let's change it.

Bart

> Regards,
> Biju
>
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/gpio/Kconfig | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig index
> > c70f46e80a3b..47e545d71df1 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -486,11 +486,12 @@ config GPIO_PXA
> >         Say yes here to support the PXA GPIO device
> >
> >  config GPIO_RCAR
> > -     tristate "Renesas R-Car GPIO"
> > +     tristate "Renesas R-Car Gen{1,2,3} and RZ/G{1,2} GPIO support"
> >       depends on ARCH_RENESAS || COMPILE_TEST
> >       select GPIOLIB_IRQCHIP
> >       help
> > -       Say yes here to support GPIO on Renesas R-Car SoCs.
> > +       Say yes here to support GPIO on Renesas R-Car Gen{1,2,3} and
> > +       RZ/G{1,2} SoCs.
> >
> >  config GPIO_RDA
> >       bool "RDA Micro GPIO controller support"
> > --
> > 2.17.1
>
