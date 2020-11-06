Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8D22A950C
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 12:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgKFLOH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 06:14:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgKFLOH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 06:14:07 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E474C0613D2
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 03:14:07 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id x20so734705ilj.8
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2020 03:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w8a1upKSyJsPGVzuU5IN6i36I64t828kPxr9upOicnM=;
        b=1EuUN0czyTPDYTi9sVXXTjT4k256QgMFVJXmCcJ0mSKUiRBP7oZzpdqhD0moKzlDWK
         2l5OwqU5A0x1FouM93C4/8SJ+ZSzb/x0TIHuzUxJ+wLjb79oA7Tf+UYTAXF+cFdG29n2
         IplDWuC917jdyrUHZ4FrRFYmUOx+hQivBefljcKG/VQVLweUEwkvIWyboX31+ThRH9g/
         25jFSaDBN0CdyDEvdnntdw1Bjx1LpItwXW+dkWumJJM+pzmsWXgTGW80ydskHnKfaC6r
         sg1gYwmES4dLcyDY08erTWZWKNmsOfVtRNx9EMVEpnoA85yNSoM2krq+u0RHPfhfVBDS
         d6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w8a1upKSyJsPGVzuU5IN6i36I64t828kPxr9upOicnM=;
        b=Cp87kGfhNJprStbarWGWmDmcqY+hclkZMXrOCPXj2JVPBFtwCbDmebHt9ldqvFkYu1
         zwpndwswCXvdMsV2ALbj63E5iEyUbmitkZsNwPM8+LXkq0BUYhs8A7ystnyMIa0v+bLU
         xOCns2PDIKxTLcykXtOGkG88hxmEr3rV67JMAg9g9bAUJJPqvh06e4KkQ3Om0WXtsTrc
         SiC3t8Lw+r5zYs/73eopK0GAzO2QhSaAyOApWia1d4AT4tfviTO95ug+cPhzFYSPH6kX
         jm13NPgvrYOVLUT1tajT1k9FFXuPeOZSihik/nxnbfZo/p3WOit2aRaU6Z16UqGtPlTV
         Atpg==
X-Gm-Message-State: AOAM531JBhXi+b57TOhDgc9HfljvetrpmSrLfdet8R0aKm4886rKw028
        TVKnN1/LK8SuCMgsrguKLm61MEpjM5t4+ij7vxP6+w==
X-Google-Smtp-Source: ABdhPJy49Vaa21v22z31f5LBJC2NCI46UXnba4eVKhPaxl4LwcmLJRMVveFhCa2CDOshHrznA9rOax7FQiK3Daysr44=
X-Received: by 2002:a92:dccb:: with SMTP id b11mr1074102ilr.6.1604661246534;
 Fri, 06 Nov 2020 03:14:06 -0800 (PST)
MIME-Version: 1.0
References: <20201104193051.32236-1-brgl@bgdev.pl> <20201104193051.32236-8-brgl@bgdev.pl>
 <20201105174057.GG4856@sirena.org.uk>
In-Reply-To: <20201105174057.GG4856@sirena.org.uk>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 6 Nov 2020 12:13:55 +0100
Message-ID: <CAMRc=Mffr4pn+mnuO6WVP9p3JT-G_t8buJBZMBBRFjQDsfLeuw@mail.gmail.com>
Subject: Re: [RFT PATCH v2 7/8] gpio: exar: switch to using regmap
To:     Mark Brown <broonie@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 5, 2020 at 6:41 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Nov 04, 2020 at 08:30:50PM +0100, Bartosz Golaszewski wrote:
>
> > @@ -119,21 +81,39 @@ static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
> >       unsigned int addr = exar_offset_to_lvl_addr(exar_gpio, offset);
> >       unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
> >
> > -     exar_update(chip, addr, value, bit);
> > +     regmap_assign_bits(exar_gpio->regs, addr, BIT(bit), value);
> >  }
>
> This appears to be the use of _assign_bits() and TBH I'm still both
> having a hard time understanding the motivation for it and liking the
> name, especially since AFAICT it's only setting a single bit here.  The
> above is just
>
>         regmap_update_bits(exar_gpio->regs, addr, 1 << bit, value << bit);
>
> AFAICT (and indeed now I dig around assign_bit() only works on a single
> bit and does both shifts which makes the correspondance with that
> interface super unclear, we're not mirroring that interface here).  If
> you're trying to clone the bitops function it should probably be an
> actual clone of the bitops function not something different, that would
> be clearer and it'd be easier to understand why someone would want the
> API in the first place.  But perhaps I'm missing something here?

It's true that bitops set/clear/assign bit macros work on single bits
and take their offsets as arguments. However all regmap helpers
operate on masks. Two release cycles back we added two helpers
regmap_set_bits() and regmap_clear_bits() which are just wrappers
around regmap_update_bits(). The naming was inspired by bitops
(because how would one name these operations differently anyway?) but
it was supposed to be able to clear/set multiple bits at once - at
least this was my use-case in mtk-star-emac driver I was writing at
the time and for which I wrote these helpers.

Now the regmap_assign_bits() helper is just an extension to these two
which allows users to use one line instead of four. I'm not trying to
clone bitops - it's just that I don't have a better idea for the
naming.

Bartosz
