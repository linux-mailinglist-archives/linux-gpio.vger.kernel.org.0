Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EFE12E0822
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 10:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgLVJdF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 04:33:05 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:38080 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgLVJdF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2020 04:33:05 -0500
Received: by mail-ot1-f43.google.com with SMTP id j20so11360944otq.5;
        Tue, 22 Dec 2020 01:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=38MtaZHIDmudmqIZ8gHcMo45fVQIBHSmoA9LJPMdAO4=;
        b=rWM4gABgGtacr2N5/Tati8HS/0Eo0Ri4IliyLJMgbgCGHvVtMIxaTWO5SLSRqXnWDc
         VCJSj2zSKD2tUDlLZaNYrM4hmeLkuOxzlfF+iXAlj9xvvPdlp6Jf1oXo/XNtim+0OBVs
         OHW3thBmxq34j/fdzCx1sMnbU2Wdl2TT7B015NQ3Rsi5ifutHVfwB3FhK7DlJt09/Ji0
         hd74tpY1jd9D1h3N3wGph9bHUzwR3grBx2kLmYWeBeq49RhW/T6+OTiryn1OyvtGoL6e
         2d6tKCsCFVW4P4tpqXgkZBFv6f05//1Ps0IgSRb10pc6Ns1OP4LHoZagk3R1c1bE2GyJ
         Icig==
X-Gm-Message-State: AOAM531DW6T0RBigb2FAXqEuTFXB0jdBNfbytiQBT0Pp8CsgPFvt89a8
        ArQMcd0/7/svTCLsuNhHJ7BRCjZbx//gR+mCp/4=
X-Google-Smtp-Source: ABdhPJydRDEvLH99mFgwELsiqtHRp/UzEEDf0IQthSZGw5hLHZcYYzMAJ6AXeYJJ3hPE4jmiQecVVNsuJ9yFxL/rui0=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr15083149oth.250.1608629544422;
 Tue, 22 Dec 2020 01:32:24 -0800 (PST)
MIME-Version: 1.0
References: <1608519279-13341-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608519279-13341-13-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXkRUbjQk=1mqn0b7PeGX0ir=s4UwbCHfw_2mWaVEVPTg@mail.gmail.com> <TY2PR01MB36920B85DFCE969BF8AF229CD8DF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36920B85DFCE969BF8AF229CD8DF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 10:32:13 +0100
Message-ID: <CAMuHMdU_6hWx21hTr2qguC5dKBJBKGxAiq24MN2vKOpUvghp=A@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] mfd: bd9571mwv: Add support for BD9574MWF
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Shimoda-san,

On Tue, Dec 22, 2020 at 10:23 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Tuesday, December 22, 2020 5:53 PM
> > On Mon, Dec 21, 2020 at 3:56 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> <snip>
> > > --- a/drivers/mfd/bd9571mwv.c
> > > +++ b/drivers/mfd/bd9571mwv.c
> >
> > > @@ -200,12 +277,14 @@ static int bd9571mwv_probe(struct i2c_client *client,
> > >
> > >  static const struct of_device_id bd9571mwv_of_match_table[] = {
> > >         { .compatible = "rohm,bd9571mwv", },
> > > +       { .compatible = "rohm,bd9574mwf", },
> > >         { /* sentinel */ }
> > >  };
> > >  MODULE_DEVICE_TABLE(of, bd9571mwv_of_match_table);
> > >
> > >  static const struct i2c_device_id bd9571mwv_id_table[] = {
> > > -       { "bd9571mwv", 0 },
> > > +       { "bd9571mwv", ROHM_CHIP_TYPE_BD9571 },
> > > +       { "bd9574mwf", ROHM_CHIP_TYPE_BD9574 },
> >
> > Why add the chip types?  These are unused, and the driver uses
> > autodetection of the chip variant anyway.
>
> I just added the chip types in the future use. As you said,
> these are unused and we should not add a future use in general.
> So, I'll remove this change.

OK.

> Also, I think I should remove the following patch.
>
> [PATCH v4 08/12] gpio: bd9571mwv: Add BD9574MWF support

You mean removing the chip types from bd9571mwv_gpio_id_table[]?
You still need the "bd9574mwf-gpio" entry, don't you?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
