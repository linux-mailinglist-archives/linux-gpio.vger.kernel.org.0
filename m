Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25FCF3794A5
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 18:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbhEJQz4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 12:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231803AbhEJQzz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 May 2021 12:55:55 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523D8C061574
        for <linux-gpio@vger.kernel.org>; Mon, 10 May 2021 09:54:50 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id h127so14014268pfe.9
        for <linux-gpio@vger.kernel.org>; Mon, 10 May 2021 09:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=57mg3zH0eIQBO65yckp+A5dcmn8vdqmIT/QkQbRlpsY=;
        b=sIAHsBuBzRq0dRqHSzAyFu7IYZx4oPK9Hixdv7siYzH2NUGtRKHgl7XBMuRrSmnkrR
         U8H/ltrhUmKQghvjTT/atCL99f4jWZRFvHnKrh3F9rWkbthCaaZNo32YKUX5wNqo0WzE
         PLI/J2z/X87px6ZK9ZF2ICgPOzLbdN7z5BFIUWVn3opRD4KvwtFgJq/hG/N6lvxfQ+oc
         u66fldXUsQKv3d3bqk+dcUgqZLb1giqx0gI4JbKTGLY3ZClEKP8HHcwbjPHvc5HwSWGh
         irE/AQbiHvm2ay6A/aNCMJp6aZsGxd8aK/CPt9i9dKOnaReWh4/KaD4ECYYoRKwyhbjB
         VgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=57mg3zH0eIQBO65yckp+A5dcmn8vdqmIT/QkQbRlpsY=;
        b=WpLLUsnGPSEGrX9gf3ytc5WDUuzTo9Fuc3Z46lYJFnmY687w+UL7OlwHFFEw2g5N5J
         1e4TfgCp6oWU17+HL8rAQrultUoOiwB0ebcRI2MONiKZWu494gn0np+638TTpHx2pDKS
         Y6rM0wJfgbeH1Dd0eufH9TG9Q/tJJ9u67z/NmVL8hHwT9CwHOZJZoXG0KGIT42XtAERm
         T5ZNDN9dHVaAmujiPr1co7i062keAYWe4FKBpTQMj8aCCEdgDh7bg+tHUrLPh0MUtQsX
         uBA/2055FnoTA0q+8ls7GbJ1iIZAhakTTRDQDihbtdSEoh50dT9Yw0RMlHyQoKYSkTFi
         Ph7g==
X-Gm-Message-State: AOAM530JQUmGgU1ugXJ+L8MgX4EDQm62zo4btcsQHqXcLBz9+iQa9wRP
        Oa0HTYmw6xa6yTPvDAdFahhS7UArAhK4RqwwiVE=
X-Google-Smtp-Source: ABdhPJztrE7CgWbK4RT79wkaSCaUPQM/e6VL27/NZdn2DZDuik0xvuHWHd33ILnJDeQZsT1+JCDep9vWVtjHWnlB54Q=
X-Received: by 2002:a63:cd11:: with SMTP id i17mr25806600pgg.74.1620665689707;
 Mon, 10 May 2021 09:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
 <b2164e5965218f270e17bf29e00ad5c5a0b54bcf.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
 <CACRpkdZnrkiYGaOTZLvCnp72WYiV0+YhCe+TbMjN_3CLyJHvgA@mail.gmail.com>
 <c5a4ef7341b5b0b56d1ad950867828463cfdb7fc.camel@fi.rohmeurope.com> <c4faac648d3e0c7f3dcb50f7e24c8b322e8c6974.camel@fi.rohmeurope.com>
In-Reply-To: <c4faac648d3e0c7f3dcb50f7e24c8b322e8c6974.camel@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 10 May 2021 19:54:33 +0300
Message-ID: <CAHp75VcUva-1cv6xaU0-RADVS=GR1VMk50cqR5NPU1LCFX2N5A@mail.gmail.com>
Subject: Re: regmap-gpio: Support set_config and other not quite so standard ICs?
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>,
        =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 10, 2021 at 4:41 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> Hi Linus, All,
>
> On Thu, 2021-03-25 at 12:32 +0200, Matti Vaittinen wrote:
> > On Thu, 2021-03-25 at 10:35 +0100, Linus Walleij wrote:
>
> snip
>
> > > It could potentially (like the other Rohm GPIO MFD PMIC drivers)
> > > make some use of the gpio regmap library, but we have some
> > > pending changes for that so look into it after the next merge
> > > window.
> > >
> > > I.e. for your TODO: look at the GPIO_REGMAP helper.
> >
> > I just took a quick peek at gpio_regmap and it looks pretty good to
> > me!
> >
> > Any particular reason why gpio_regmap is not just part of gpio_chip?
> > I
> > guess providing the 'gpio_regmap_direction_*()', 'gpio_regmap_get()',
> > 'gpio_regmap_set()' as exported helpers and leaving calling the
> > (devm_)gpiochip_add_data() to IC driver would have allowed more
> > flexibility. Drivers could then use the gpio_regamap features which
> > fit
> > the IC (by providing pointers to helper functions in gpio_chip) - and
> > handle potential oddball-features by using pointers to some
> > customized
> > functions in gpio_chip.
>
> So, v5.13-rc1 is out. I started wondering the gpio_regamap - and same
> question persists. Why hiding the gpio_chip from gpio_regmap users?

In general to me this sounds like opening a window for
non-controllable changes vs. controllable. Besides that, struct
gpio_chip has more than a few callbacks. On top of that, opening this
wide window means you won't be able to stop or refactoring become a
burden. I would be on the stricter side here.

> Current IF makes it very hard (impossible?) for driver to override any
> of the regmap_gpio functions (or provide own alternatives) for cases
> which do not fit the generic regmap_gpio model.
>
> My first obstacle is providing gpio_chip.set_config for BD71815.
>
> 1) I guess the method fitting current design would be adding drive-mode
> register/mask(s) to the gpio_regmap_config. Certainly doable - but I
> have a bad feeling of this approach. I am afraid this leads to bloating
> the gpio_regmap_config with all kinds of IC specific workarounds (when
> HW designers have invented new cool control registers setups) - or then
> just not using the regmap_gpio for any ICs which have any quirks - even
> if 90% of regmap_gpio logic would fit...
>
> 2) Other possibility is allowing IC driver to provide function pointers
> for some operations (in my case for example for the set_config) - if
> the default operation the regmap_gpio provides does not fit the IC.
> This would require the regmap_gpio to be visible to IC drivers so that
> IC drivers can access the regmap, device & register information - or
> some way to convert the gpio_chip pointer to IC specific private data
> pointer. Doable but still slightly bloat.
>
> 3) The last option would be adding pointer to regmap_gpio to gpio_chip
> - and exporting the regmap_gpio functions as helpers - leaving the gpio
> registration to be done by the IC driver. That would allow IC driver to
> use the regmap_gpio helpers which suit the IC and write own functions
> for rest of the stuff.
>
> I'd like to hear opinions - should I draft some changes according to
> these proposals (which one, 1,2,3 or something else?) - or as this all
> been already discussed and am I just missing something?
>
> Best Regards
>         Matti Vaittinen



-- 
With Best Regards,
Andy Shevchenko
