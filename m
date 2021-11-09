Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90DED44B8F3
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 23:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241500AbhKIWup (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 17:50:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:39744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238765AbhKIWt6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 17:49:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55C8861037;
        Tue,  9 Nov 2021 22:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636498031;
        bh=dj/hPXX+AHLkoauaxECz0N9X/FMkI8WgcbGv80nhji8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Hs8sA/XzH5TZ/M3mgzYtarz6IoUW3ma0tnyhQu/0IiqUurY4kJ5tDtBEZD9Q+J8mO
         wZI9MyMUg/S8EwQS208g64wFyWqnvVZUzY8nPVZjeb7mpD01ZB0F1N9NMM+l1g+nG5
         WLA9xgH/rUDQ6NPFtbWqp0K3PIHheaYFna/vt+aA3ESvUWjNGWTJTV03hBgeuBXPLQ
         gbnuiFdG1rFN9jQIGFWHtXwwnsLs+mVkT1j5iCO+65ok5UoOAbilWdzkthiQABtbJi
         Kno1jkAVddxPVIFVf9/r+PYxRJuIfv0e14zejULp9u7vohKdQdu1/1UVA2hVzft8AL
         YJYjE9qMYGX/w==
Received: by mail-wr1-f43.google.com with SMTP id r8so572209wra.7;
        Tue, 09 Nov 2021 14:47:11 -0800 (PST)
X-Gm-Message-State: AOAM530PcD3J6LyT8RiWv2pOxouGWvf+/G9oKb+JM0Jglcug7Cz276xL
        x4I3Ue15NrcU+1DfPRvlJO6QEI44ayVvL0xfJd4=
X-Google-Smtp-Source: ABdhPJx0GUEf3uOG+qkjpPk74fgc8++Hq6oUSi1Roc6a6psjzTRzuwUhL0VdmvUAt8cnsK8rQJt77hQolV20uELO4a4=
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr13808947wrd.369.1636498029782;
 Tue, 09 Nov 2021 14:47:09 -0800 (PST)
MIME-Version: 1.0
References: <20211109100207.2474024-1-arnd@kernel.org> <20211109100207.2474024-7-arnd@kernel.org>
 <YYpN3LzXz638l6FG@smile.fi.intel.com> <CAK8P3a24wkBEAnWG8=LYoVR1oiTo0VKZ3iME+FYbDuHXJDjMOw@mail.gmail.com>
 <CACRpkdZaJQqwyosnXhaOc=mF5jJxaDKDKAQxJGJvQAWpU7MNQQ@mail.gmail.com>
In-Reply-To: <CACRpkdZaJQqwyosnXhaOc=mF5jJxaDKDKAQxJGJvQAWpU7MNQQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 9 Nov 2021 23:46:53 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0J1f9+o6Uqdn4QeQ=30oW6p+fOaFU7-5L0cW-zihfNxg@mail.gmail.com>
Message-ID: <CAK8P3a0J1f9+o6Uqdn4QeQ=30oW6p+fOaFU7-5L0cW-zihfNxg@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] gpiolib: remove legacy gpio_export
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 9, 2021 at 9:42 PM Linus Walleij <linus.walleij@linaro.org> wro=
te:
> On Tue, Nov 9, 2021 at 11:50 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> > I think the TODO list is in Linus' head,
>
> Oh no, drivers/gpio/TODO
>
> > but it would include all the files
> > that use one of the interfaces in linux/gpio.h. I found about 350 of th=
em,
> > so there is little point in listing them one at a time. IIRC Linus is g=
oing
> > through those one subsystem at a time.
>
> Yeah but if it's just me I doubt that I will manage to do it by the
> time I retire in 2037 or so... So the TODO is there to inspire others
> to step in and help out.

I think at the current rate, it should only take about another ten years: ;=
-)

$ for i in v3.18 v4.1 v4.4 v4.9 v4.14 v4.19 v5.4 v5.10 v5.15 ; do echo
-n $i\  ;  git grep -wl
'\<\(gpio_direction_input\|gpio_direction_output\|gpio_get_value_cansleep\|=
gpio_set_value_cansleep\|gpio_get_value\|gpio_set_value\|gpio_to_irq\|gpio_=
request\|gpio_request_one\|gpio_request_array\)\>\|\<\(ARCH_NR_GPIOS\|GPIOF=
_DIR_\|GPIOF_INIT\|GPIOF_EXPORT\|GPIOF_OPEN\|GPIOF_IN\|GPIOF_OUT\|gpio_is_v=
alid\\|gpio_free\|devm_gpio_\)'
$i | wc -l ; done
v3.18 676
v4.1 669
v4.4 646
v4.9 639
v4.14 614
v4.19 553
v5.4 465
v5.10 381
v5.15 354

I'm a fan of deconstruction interfaces one function call at a time, which
is different from your one-subsystem at a time approach, but these can
obviously be done at the same time. This 8-patch series is hopefully a good
step in that direction, removing some of the more obscure interfaces
and making the rest a little more obvious.

I've also started a patch series to remove some of the less common
of_gpio portions, which gets rid of of_get_gpio(), of_get_gpio_flags()
and of_get_named_gpio_flags() but leaves of_get_named_gpio() in
place for now. I'm much less confident about that work though, so I
haven't posted that. I think killing off the of_gpio consumer-side
interfaces entirely would likely make the biggest impact, as those
appear to still be used a lot in relatively modern drivers, while the
traditional gpio_request() interfaces are mainly used in drivers for
legacy boards that don't have a long future ahead of them unless
they get converted to DT.

        Arnd
