Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8E343BACC
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 21:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238735AbhJZTbz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 15:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238731AbhJZTbw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Oct 2021 15:31:52 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3DB2C061570;
        Tue, 26 Oct 2021 12:29:26 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id m63so274669ybf.7;
        Tue, 26 Oct 2021 12:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+NelDXF27zh376nuZKTht06HRFY8IAGB5HDrOTlHXaU=;
        b=jXd7KptoyXQebe9euhlvXUw0kli2jFKQEjBo/no0TC4HLIc9XAIO6c4Squkj3pcBSd
         sGCRDCEygq0GD9ZWnNSh3Z5tLH4YR9/JnI+WJkIbu0Mbo2nZTd9FN6cngpYUai/HsLEZ
         Xv4WIK18iPAUU0TZc/mk5DerZmIVcgg2OlJYc7a6c9zOJUmmnYMptqpZWk8n9oYe91Yz
         0KiZxEb+oP6iHe7xKFbqKUVcSDr9i0V/z7rZ1AIxLfbjjm97/KCRLXXZ8mU80VErmDBz
         k2v+nNOXeB1jr2jUeINBm45OX2HdShgihZunviaaJqx09DdFmIdTu4vGpvnfFTEBi7yc
         6yJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+NelDXF27zh376nuZKTht06HRFY8IAGB5HDrOTlHXaU=;
        b=2kOZv1LvopDems+jd/ad0E3xhkxnnzrrocViMHKtbkcB16pbvMzBuKaHGbxdB4L8LL
         XvODtF5jMww7pwPGpedfFihkjaWl00QsHLCqj/UUDQQ8+6giTY5k0TbW/rxIaBalkMR9
         OUpUw+mayOXbRcVFlp3AZAYCVNwLa7Tvem+DiOAAn32IuFF8slDPALe+MMsIZkN9ysVZ
         9a2TAgEOzZPQNq8+T1FWLquDir1HADQo0/bzhKZWSs4Pr+BUm1peBbUWP/h0eCiDt0aX
         n0w42rIqdtbUZjp1joNc3cb8Uop+DxuP5c+YznitP8auFzPE+zByPVZqGR/6CDg5F1sm
         UtfA==
X-Gm-Message-State: AOAM533I+S2ILWDA3K0sANHuplkqbVDbK9pEyCZTGqz15k5OxeS16kow
        2m6oU1NRu4nDe+TNizcP9RliAiDKLar/CtRsCR4=
X-Google-Smtp-Source: ABdhPJy4NFRKzLqvuv9b+W3fNFaE1Fm82be22RqumcVLw1PBA8BZyoXRB9Ni/1GP8Dy1EK+diD3+iJ4+XDoIJz/G06g=
X-Received: by 2002:a5b:783:: with SMTP id b3mr25063420ybq.328.1635276566184;
 Tue, 26 Oct 2021 12:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210930121630.17449-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210930121630.17449-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVd8nhWX9__bo9oxE44_+FNYs3RhxmJNbz-kKnRzKJZYA@mail.gmail.com>
In-Reply-To: <CAMuHMdVd8nhWX9__bo9oxE44_+FNYs3RhxmJNbz-kKnRzKJZYA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 26 Oct 2021 20:29:00 +0100
Message-ID: <CA+V-a8sq_Pp+9yv1Yu5z_OnUyBgan3FHOk8iMVTSdVSO6B5DjA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] pinctrl: pinconf-generic: Add support for
 "output-impedance" to be extracted from DT files
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

On Thu, Oct 7, 2021 at 6:02 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Sep 30, 2021 at 2:17 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add "output-impedance" property to generic options used for DT parsing
> > files. This enables drivers, which use generic pin configurations, to
> > get the value passed to this property.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/pinconf-generic.c
> > +++ b/drivers/pinctrl/pinconf-generic.c
> > @@ -46,6 +46,7 @@ static const struct pin_config_item conf_items[] = {
> >         PCONFDUMP(PIN_CONFIG_MODE_LOW_POWER, "pin low power", "mode", true),
> >         PCONFDUMP(PIN_CONFIG_OUTPUT_ENABLE, "output enabled", NULL, false),
> >         PCONFDUMP(PIN_CONFIG_OUTPUT, "pin output", "level", true),
> > +       PCONFDUMP(PIN_CONFIG_OUTPUT_IMPEDANCE, "output impedance", "ohm", true),
> >         PCONFDUMP(PIN_CONFIG_POWER_SOURCE, "pin power source", "selector", true),
> >         PCONFDUMP(PIN_CONFIG_SLEEP_HARDWARE_STATE, "sleep hardware state", NULL, false),
> >         PCONFDUMP(PIN_CONFIG_SLEW_RATE, "slew rate", NULL, true),
> > @@ -179,6 +180,7 @@ static const struct pinconf_generic_params dt_params[] = {
> >         { "output-disable", PIN_CONFIG_OUTPUT_ENABLE, 0 },
> >         { "output-enable", PIN_CONFIG_OUTPUT_ENABLE, 1 },
> >         { "output-high", PIN_CONFIG_OUTPUT, 1, },
> > +       { "output-impedance", PIN_CONFIG_OUTPUT_IMPEDANCE, 0 },
>
> "output-impedance-ohms", as per DT standardized property units.
>
Sure will replace that with output-impedance-ohms and to chime in Ill
re-name the macro to PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS

Cheers,
Prabhakar

> >         { "output-low", PIN_CONFIG_OUTPUT, 0, },
> >         { "power-source", PIN_CONFIG_POWER_SOURCE, 0 },
> >         { "sleep-hardware-state", PIN_CONFIG_SLEEP_HARDWARE_STATE, 0 },
>
> With the above fixed:
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
