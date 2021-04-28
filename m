Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6DC636DACF
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Apr 2021 17:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230141AbhD1PEE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Apr 2021 11:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231628AbhD1PD5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Apr 2021 11:03:57 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A427C061352;
        Wed, 28 Apr 2021 08:02:48 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id x5so13143292wrv.13;
        Wed, 28 Apr 2021 08:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZFEhJ4EAuP9YoeDXAP6FyIrsbINyeDS35gLbA/9242U=;
        b=tSdq8BIskex/7GSoqC84F4OD4VVoT6fI6YdkyBQ3XH0MzNciz7zjJMODzK66aEqGLL
         lFcinPue6YmuUudUfeiG61Y1Oh0aV13SDjpYo6gi9FsaevwPXdmNWmarNv/5MF0F8lP+
         cZSZiGrpLJ5RlNHS/lJ1XbkqlddpYQqtrX4Az4ilnAvEoXC06kPpSepC0DV5bvyNmYpN
         Xk3De+Ni+VacEDV1+ziNXv8MnfRbnTV24cdXW8gcz+WwPxPqbAH0D5YpZVOYwdL/jVUH
         G7ZcScqxMjQSiSHeAH3f9sdeSX84Le01DquxaKG3IEX6+3EFbLGP648bCFif8ugAEoxb
         0oRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZFEhJ4EAuP9YoeDXAP6FyIrsbINyeDS35gLbA/9242U=;
        b=QzG7S2OesftMsXTuGKHNxVqUhZlsLhNoK1po6b+muE/9EQM0hU08Xe3Fg8Hi6htpqV
         tUNF4Tjvlsvsod82dgeQ2Wq106zxbwJC3z0xTJd/TSbtIyKKUGWQIHyhj6IgNTCA9Rg8
         Be3CzlM8eoqLve0kbaArRupWion2LW8pnJSBssq8G5XhEy47G9HzkJ8DtqeGWaUbWlvf
         rzha+c/yPevd+ZV/txdwjqL652pb61qN0RPfnAq/SG0XXlIU4hLUoBSBNSqyZ2vihteQ
         4phOeX7zi8UV67rydeqQDrtHpJSjagv0ULsy9LjoT+qCS9piXrdfLVVato3ZmwI9pk+E
         2OsQ==
X-Gm-Message-State: AOAM53371aCZvq/hw7Kwbsg7g9aqzvmn2KDJFaqS6c7sFtk2vDa/xmuP
        zi/gNJFUuDrUVhrv/Vdok33xSb7hgS1mN8wu4eY=
X-Google-Smtp-Source: ABdhPJzVcatsTGlvKrTbsMMiczlcQBg9MBh5A6cu6eTqlVfSRY/xQE1OSHdqrq0jB1360tdMwAZZG+mANeZhHnfJczM=
X-Received: by 2002:a5d:590b:: with SMTP id v11mr27215074wrd.415.1619622167243;
 Wed, 28 Apr 2021 08:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210426095426.118356-1-tsbogend@alpha.franken.de>
 <CAHp75VdRfPPj2pu4GOBVG4+bGUsCRLXYPsFjMwFOYfUTZuvJaQ@mail.gmail.com>
 <6f6bce2f070998db49acca2f6611727b@walle.cc> <CAHp75VdmTxvQBU4X8s-6csYgwM8ACth9Ao0GYjUH7+0Q0tyFyg@mail.gmail.com>
 <ebbbe74fe638e1a6ab7c1547870f4b31@walle.cc> <CAHp75VcXEu2YGOoL70zueEgARCe8D+Q=CFsN62-vFK5svjJAQA@mail.gmail.com>
 <880011ffd80ae7d1a32e7a17d405b987@walle.cc> <CAHp75Vd41C8K9pNbNF6RYXUiASb1RYdUneoqqRp2f8sJCOAZog@mail.gmail.com>
 <3a23d7e901ac72630aadbd274517f8ec@walle.cc>
In-Reply-To: <3a23d7e901ac72630aadbd274517f8ec@walle.cc>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 28 Apr 2021 18:02:29 +0300
Message-ID: <CAHp75Vef9xMB=boEJitxG5TOanuGLFktj5Pxf8L7et+6BHx00Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] gpio: Add support for IDT 79RC3243x GPIO controller
To:     Michael Walle <michael@walle.cc>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 28, 2021 at 5:48 PM Michael Walle <michael@walle.cc> wrote:
>
> [Adding Mark here, too]
>
> Am 2021-04-28 16:32, schrieb Andy Shevchenko:
> > On Wed, Apr 28, 2021 at 5:04 PM Michael Walle <michael@walle.cc> wrote:
> >> Am 2021-04-28 15:44, schrieb Andy Shevchenko:
> >> > On Wed, Apr 28, 2021 at 2:57 PM Michael Walle <michael@walle.cc> wrote:
> >> >>
> >> >> Am 2021-04-28 13:07, schrieb Andy Shevchenko:
> >> >> > On Wed, Apr 28, 2021 at 1:51 AM Michael Walle <michael@walle.cc> wrote:
> >> >> >> Am 2021-04-26 12:29, schrieb Andy Shevchenko:
> >> >> >> > On Mon, Apr 26, 2021 at 12:55 PM Thomas Bogendoerfer
> >> >> >> > <tsbogend@alpha.franken.de> wrote:
> >> >> >> >
> >> >> >> > 2) there is gpio-regmap generic code, that may be worth
> >> >> >> > considering.
> >> >> >>
> >> >> >> This driver uses memory mapped registers. While that is
> >> >> >> also possible with gpio-regmap, there is one drawback:
> >> >> >> it assumes gpiochip->can_sleep = true for now, see [1].
> >> >> >> Unfortunately, there is no easy way to ask the regmap
> >> >> >> if its mmio/fastio.
> >> >> >
> >> >> > I don't see how it is an impediment.
> >> >>
> >> >> You'd have to use the *_cansleep() variants with the gpios,
> >> >> which cannot be used everywhere, no?
> >> >
> >> > *can* sleep means that it requires a sleeping context to run, if your
> >> > controller is fine with that, there are no worries. OTOH if you want
> >> > to run this in an atomic context, then consumers can't do with that
> >> > kind of controller.
> >>
> >> Ok, then we are on the same track.
> >>
> >> > What I meant above (and you stripped it here) is
> >> > to add a patch that will fix that and set it based on
> >> > gpio_regmap_config.
> >>
> >> Yes, but ideally, it would ask the regmap. Otherwise that
> >> information is redundant and might mismatch, i.e. gpio_regmap_config
> >> tell can_sleep=false but the regmap is an I2C type for example. Also
> >> if a driver wants to support both regmap types, we are no step
> >> further.
> >
> > Yeah, I agree that is a band aid, but you are free to fix it actually
> > on regmap level.
> > I don't think it will require an enormous amount of work there.
>
> I'd love to fix that, but Mark was against exposing that property
> outside of regmap. So it it what it is for now ;) Maybe he'll change
> his mind or someone has another idea.

Then let's go to ugly variant with duplicating it in gpio-regmap
config. with a FIXME note or so. I don't think we should allow new
drivers be based on bgpio_init().

-- 
With Best Regards,
Andy Shevchenko
