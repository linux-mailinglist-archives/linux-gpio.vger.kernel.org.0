Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 460AC36D87C
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Apr 2021 15:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239841AbhD1Np4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Apr 2021 09:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239836AbhD1Npz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Apr 2021 09:45:55 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A1EC06138A;
        Wed, 28 Apr 2021 06:45:10 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id s22so23634152pgk.6;
        Wed, 28 Apr 2021 06:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tW6Jg1hPCefeE4+Q5b9EX/MI8Wk9Qn2Twj5sMLql1/0=;
        b=MnimyphcYUdXSnck5cSXyKGtFL3svaYYHKqt4u4CHuyRoU1LONISHmgfLbIuy3Jx8D
         U10C91iCKgNrJxVKH1s3HL1lN/l4dC0MgqGEhtQNBljcPrZNUfEQwmS/npH3orn2lYbs
         dLeQC3lu4RvXRLUO1whrYSHwY/DUVbF5akWwPq8IzOMBEI9gHDL4j+qz5cp8GYfjaMsn
         81YTsmeNNCl3gWi+ff2s0pQFfHU3rC5CqmekKZMACLzOnBwQA/uF8nWJFDBQ/d4Hb89c
         vhTZiw/9G2y1yqP6FcotT2L3Bs49IodoDp8i0Z+ws2TLyl84937at/5wWnY65eznFktM
         fEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tW6Jg1hPCefeE4+Q5b9EX/MI8Wk9Qn2Twj5sMLql1/0=;
        b=lItoHtIkc0Z1eF/Bdnvsrs7BXed1t+kEPVJH22E8teS7RAIBm/Efu7k0R4r0YsSebd
         j7JDVxAmD9Sqb4x8l+AVKUhLEuJZXg3rkKks3McswK+0fjsP1P4lcr0mRie2enYZ3VrF
         mFNE5OLGjIPQwupYe8EMEuKzaa5q1df+gG44smUBussJuPNQnG3faE9Zc3QvUyTzI75g
         xSE13+b64tramD+bBUFOGCTRG8xfT/kdFO4BOH/BgxvmCVUTbKTaHyQ1XG4KWum6kZ65
         sq0JBzVTh0/7CFjYEnkQifW5pdKIKivkWzU7eg3RGtMDAjY+PpEvdikM4uprHvI97RNZ
         u1Pw==
X-Gm-Message-State: AOAM5307z5ia1XWNqCJ8ejSHqVWx2TA/v7PschnsPvBakKVDf6UIU5wn
        ZTGxOPELXSHJyfhD1abGiXkTDYeZYq3s9teieM+EiA8HqXA=
X-Google-Smtp-Source: ABdhPJyh2zXRbuOdrBqVu7Frq1itIC3qKiVh/qPj4l8gEEzGAANFyUmIw6ldH+/FexEe3bG730Ffn+dolOGZxJJkfmE=
X-Received: by 2002:a63:cd11:: with SMTP id i17mr26641169pgg.74.1619617510313;
 Wed, 28 Apr 2021 06:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210426095426.118356-1-tsbogend@alpha.franken.de>
 <CAHp75VdRfPPj2pu4GOBVG4+bGUsCRLXYPsFjMwFOYfUTZuvJaQ@mail.gmail.com>
 <6f6bce2f070998db49acca2f6611727b@walle.cc> <CAHp75VdmTxvQBU4X8s-6csYgwM8ACth9Ao0GYjUH7+0Q0tyFyg@mail.gmail.com>
 <ebbbe74fe638e1a6ab7c1547870f4b31@walle.cc>
In-Reply-To: <ebbbe74fe638e1a6ab7c1547870f4b31@walle.cc>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 28 Apr 2021 16:44:54 +0300
Message-ID: <CAHp75VcXEu2YGOoL70zueEgARCe8D+Q=CFsN62-vFK5svjJAQA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] gpio: Add support for IDT 79RC3243x GPIO controller
To:     Michael Walle <michael@walle.cc>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 28, 2021 at 2:57 PM Michael Walle <michael@walle.cc> wrote:
>
> Am 2021-04-28 13:07, schrieb Andy Shevchenko:
> > On Wed, Apr 28, 2021 at 1:51 AM Michael Walle <michael@walle.cc> wrote:
> >> Am 2021-04-26 12:29, schrieb Andy Shevchenko:
> >> > On Mon, Apr 26, 2021 at 12:55 PM Thomas Bogendoerfer
> >> > <tsbogend@alpha.franken.de> wrote:
> >> >
> >> > 2) there is gpio-regmap generic code, that may be worth
> >> > considering.
> >>
> >> This driver uses memory mapped registers. While that is
> >> also possible with gpio-regmap, there is one drawback:
> >> it assumes gpiochip->can_sleep = true for now, see [1].
> >> Unfortunately, there is no easy way to ask the regmap
> >> if its mmio/fastio.
> >
> > I don't see how it is an impediment.
>
> You'd have to use the *_cansleep() variants with the gpios,
> which cannot be used everywhere, no?

*can* sleep means that it requires a sleeping context to run, if your
controller is fine with that, there are no worries. OTOH if you want
to run this in an atomic context, then consumers can't do with that
kind of controller. What I meant above (and you stripped it here) is
to add a patch that will fix that and set it based on
gpio_regmap_config.


-- 
With Best Regards,
Andy Shevchenko
