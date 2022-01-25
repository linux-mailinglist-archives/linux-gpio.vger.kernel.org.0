Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 957DF49AB04
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jan 2022 05:44:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347168AbiAYD4Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jan 2022 22:56:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354884AbiAYCAS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jan 2022 21:00:18 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A62C045903
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jan 2022 16:27:55 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id m6so56651696ybc.9
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jan 2022 16:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U2rFvwJKwGTdhtCDsPbP5t7DQVmpuMrmgVS+l6w2SlQ=;
        b=dm1S2uiPxbJT/3BSBWFT3g+1JcCOILvolWWLrDXgdFXCg2kpbk3UTbqxUOjEma4feQ
         gJC7rT37qXuUCCIcNLpFsJycZljQurxPAP74ZTBqBwYTI2v1s9hvaFYFEIHN+tqmjCHB
         JXhQ89ONtIhfRmR6VZm63SQI2XEO5k3buiiQGXHFuswA0RxhV7VpPiCWpoMA7AQcrGHX
         hZBCu0Dao9moUDqaY/1jNLkl4dTkFQGwgqy4p5dDqB8hycRIlviqJwGCTSpsTK/04ijW
         0s20DUyNy/q5h+XguzaPeoBIlL6RFSvOVZitp/MYzLxbnxfOL2YS72jNrDMHsWvs0zff
         M4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U2rFvwJKwGTdhtCDsPbP5t7DQVmpuMrmgVS+l6w2SlQ=;
        b=hcJ/pwGILRTKvZXdO+d41EMgt3q1cE8aIoLm5DzpLhKR4Sg5HUVvDKTnxB0xnow7+H
         OR28vYin/WB+2TYshmX27jqbcF55NcF3K4Hm+UKaex+snNKHhINP7MR6pPnC/azWQzEl
         VxgVOlRzSHfDl05wp7iH14ZHGAUlTCO9WjaZuVHTO1nE1RcZXRMDhfOI+ij9LAgZvLtH
         Y6wbF6uAO2kwc+hulO2QDnqSo33OGaVleaNwIIfGxfowjXdYGmyGRh3Rjeqtg1xX3Rks
         KyaTOANd/fMHPsMvFkjy7Oz/hufXwIqE/8+FVPFwNUo6t7HXN2SUA1r7LHJNbtCKE3ya
         woyg==
X-Gm-Message-State: AOAM533eAYQ764Z/37gg5IKcojo1+FDdOtSkj/SEGNO2X8CMPZWevlUl
        NEVqPJGVoLKJraSwMHCNykjil72w5q5HGzxrxSfLyg==
X-Google-Smtp-Source: ABdhPJyIo7z2RbbHNWijnOWvau213u/Ey5jNSWbVIYnOaN2nSYx2U1Fsu8iK4UYwe9iZhXe3spuepmu8KBRIcoZFqoE=
X-Received: by 2002:a25:c3c4:: with SMTP id t187mr24502063ybf.634.1643070474167;
 Mon, 24 Jan 2022 16:27:54 -0800 (PST)
MIME-Version: 1.0
References: <20210715151625.394960-1-linus.walleij@linaro.org> <YPE6d4WWYAWgnsCH@google.com>
In-Reply-To: <YPE6d4WWYAWgnsCH@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jan 2022 01:27:43 +0100
Message-ID: <CACRpkda3oaEguO5VgvMdVuLGpSU9rZbwCyT_cFj066NOCO4hcA@mail.gmail.com>
Subject: Re: [PATCH] ARM/pxa/mfd/power/sound: Switch Tosa to GPIO descriptors
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
        Dirk Opfer <dirk@opfer-online.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lee,

On Fri, Jul 16, 2021 at 9:51 AM Lee Jones <lee.jones@linaro.org> wrote:

Sorry for taking halfyears to get back to patches... cleanup tends
to get low prio. :/

Fixed most review comments.

> > +#define TOSA_GPIO_TG_ON                      0
> > +#define TOSA_GPIO_L_MUTE             1
> > +#define TOSA_GPIO_BL_C20MA           3
> > +#define TOSA_GPIO_CARD_VCC_ON                4
> > +#define TOSA_GPIO_CHARGE_OFF         6
> > +#define TOSA_GPIO_CHARGE_OFF_JC              7
> > +#define TOSA_GPIO_BAT0_V_ON          9
> > +#define TOSA_GPIO_BAT1_V_ON          10
> > +#define TOSA_GPIO_BU_CHRG_ON         11
> > +#define TOSA_GPIO_BAT_SW_ON          12
> > +#define TOSA_GPIO_BAT0_TH_ON         14
> > +#define TOSA_GPIO_BAT1_TH_ON         15
>
> Okay, I have to ask - what are 5, 8 and 13?

Apparently unused, just picked from:
arch/arm/mach-pxa/include/mach/tosa.h

Put there in commit 8459c159f7de832eaf888398d2abf466c388dfa6
"[ARM] 3088/1: PXA: Add machine support for the Sharp SL-6000x series of PDAs"
Dirk who authored the commit is on CC so maybe he can say.
I suppose he has access to the board documentation.
(I couldn't find any.)

> > +static struct gpiod_lookup_table tosa_audio_gpio_lookup = {
> > +     .dev_id = "tosa-audio",
> > +     .table = {
> > +             GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_L_MUTE, NULL, GPIO_ACTIVE_HIGH),
> > +             { },
> > +     },
> > +};
>
> Are these structures going to be peppered all over the kernel now?

Yeah well for legacy systems, for the reasons given in
drivers/gpio/TODO

It's not millions of occurences, just hundreds.
$ git grep GPIO_LOOKUP|wc -l
507

> Maybe a helper can be added to make these single line entries one line
> each?

Hmmm I will try to sketch something out for v2!

> > +             GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_CHARGE_OFF,
> > +                         "main charge off", GPIO_ACTIVE_HIGH),
> > +             GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_CHARGE_OFF_JC,
> > +                         "jacket charge off", GPIO_ACTIVE_HIGH),
> > +             GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_BAT0_V_ON,
> > +                         "main battery", GPIO_ACTIVE_HIGH),
> > +             GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_BAT1_V_ON,
> > +                         "jacket battery", GPIO_ACTIVE_HIGH),
> > +             GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_BU_CHRG_ON,
> > +                         "backup battery", GPIO_ACTIVE_HIGH),
> > +             /* BAT1 and BAT0 thermistors appear to be swapped */
> > +             GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_BAT1_TH_ON,
> > +                         "main battery temp", GPIO_ACTIVE_HIGH),
> > +             GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_BAT0_TH_ON,
> > +                         "jacket battery temp", GPIO_ACTIVE_HIGH),
> > +             GPIO_LOOKUP(TOSA_GC_NAME, TOSA_GPIO_BAT_SW_ON,
> > +                         "battery switch", GPIO_ACTIVE_HIGH),
>
> These are soooo close to being <100 chars.
>
> What does Checkpatch currently warn on?  Is it 100 or 120?

100...

WARNING: line length of 104 exceeds 100 columns
#283: FILE: drivers/mfd/tc6393xb.c:532:
+        GPIO_LOOKUP("tc6393xb", TOSA_GPIO_CHARGE_OFF_JC, "jacket
charge off", GPIO_ACTIVE_HIGH),

WARNING: line length of 101 exceeds 100 columns
#288: FILE: drivers/mfd/tc6393xb.c:537:
+        GPIO_LOOKUP("tc6393xb", TOSA_GPIO_BAT1_TH_ON, "main battery
temp", GPIO_ACTIVE_HIGH),

(...)

If you want to, we can ignore it of course. Just tell me what to do.

> > +     gc->ngpio = 16;
> > +     gc->set = tc6393xb_gpio_set;
> > +     gc->get = tc6393xb_gpio_get;
> > +     gc->direction_input = tc6393xb_gpio_direction_input;
> > +     gc->direction_output = tc6393xb_gpio_direction_output;
> > +
> > +     ret = devm_gpiochip_add_data(dev, gc, tc6393xb);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to add GPIO chip\n");
> > +
> > +     /* Register descriptor look-ups for consumers */
> > +     gpiod_add_lookup_tables(tc6393xb_gpio_lookups, ARRAY_SIZE(tc6393xb_gpio_lookups));
> > +
> > +     /* Request some of our own GPIOs */
> > +     tc6393xb->vcc_on = gpiochip_request_own_desc(gc, TOSA_GPIO_CARD_VCC_ON, "VCC ON",
> > +                                                  GPIO_ACTIVE_HIGH, GPIOD_OUT_HIGH);
> > +     if (IS_ERR(tc6393xb->vcc_on))
> > +             return dev_err_probe(dev, PTR_ERR(tc6393xb->vcc_on),
> > +                                  "failed to request VCC ON GPIO\n");
> > +
>
> So much more code to do the same thing?

Not quite the same thing.

The old code does not report any errors from gpiochip_add_data()
(hence all the dev_err_probe()).

The added gpiochip_request_own_desc() call moves the similar code out
of arch/arm
to here where the gpiochip is and is actually using fewer lines now.
(See higher up the patch.)

> > +     tc6393xb->dev = &dev->dev;
>
> That confused me at first.
>
> Please consider changing the platform_device to pdev (separately).

OK I can follow up with that once this looks like we want it,
this problem is a bit all over the kernel actually, especially
in legacy code from the early 2000s.

Have a look at v2 and see what you think!

Yours,
Linus Walleij
