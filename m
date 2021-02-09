Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E12A314EAB
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 13:09:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbhBIMG4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 07:06:56 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:35022 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbhBIMFU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 07:05:20 -0500
Received: by mail-oi1-f173.google.com with SMTP id l3so9197867oii.2;
        Tue, 09 Feb 2021 04:05:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0wp24WQB9SPDerk+Iav7mKUoD2JL/GuXUL0SLa8Nm04=;
        b=lfA3M6L837wIdP6xCc1AW7SCKLl9za6XxKTa9JVXV1o5lrN5jXPfYNlv/cMRW7sMM/
         ZGMX2DorUZXby9YMhngAs1lyrWggc8CLr/amlW3fgXc95OP+KTagOCtEMXoHq9McjdgR
         KocC2AgvC6iNchEfLoD1ltr88YnZPMMHO7nI/+lZrdEcn8WNG7qe3c/lEFeUEsic6Ryx
         PPziPd4ZDv6iguOM480JXpQM3AqD9WRRm3LORq5OcWOyNXnLbU/WKD/sh9FpfRMzpvj6
         QuOpUfsuYpd24tsuj4xhx4hosRluP8zw4trARe7SaZo2YmcS24Qoc2lvL0f/PBpUjadu
         a35g==
X-Gm-Message-State: AOAM531OX2QrBkHgK6dL0nbxD8XtcRRAXm1JqW4c+jF4H6dHNXc88Z16
        FihdJMDqG6TtHnN4H/nV7ZDe3aW8o/hL8yOkh+A=
X-Google-Smtp-Source: ABdhPJxD3v66lPnSWqnSfrOMiVJjkb/yr5mLQ0ayFauBkqZyA4XnA454IETfqt54p0nv7XD0IHHpLr88IB/RGzTA2EI=
X-Received: by 2002:aca:d8c6:: with SMTP id p189mr2212557oig.54.1612872279070;
 Tue, 09 Feb 2021 04:04:39 -0800 (PST)
MIME-Version: 1.0
References: <20210205020730.1746354-1-saravanak@google.com>
In-Reply-To: <20210205020730.1746354-1-saravanak@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Feb 2021 13:04:28 +0100
Message-ID: <CAMuHMdVHfx5MtzFe8WGOrQD-yTQaaexbVCFn7UF7cFW1Tu-uTA@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: Don't probe gpio_device if it's not the
 primary device
To:     Saravana Kannan <saravanak@google.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Saravana,

On Fri, Feb 5, 2021 at 3:09 AM Saravana Kannan <saravanak@google.com> wrote:
> Dmitry reported[1] boot error messages caused by
> commit 4731210c09f5 ("gpiolib: Bind gpio_device to a driver to enable fw_devlink=on by default").
>
> gpio-1022 (cpu-pwr-req-hog): hogged as input
> max77620-pinctrl max77620-pinctrl: pin gpio4 already requested by max77620-pinctrl; cannot claim for gpiochip1
> max77620-pinctrl max77620-pinctrl: pin-4 (gpiochip1) status -22
> max77620-pinctrl max77620-pinctrl: could not request pin 4 (gpio4) from group gpio4  on device max77620-pinctrl
> gpio_stub_drv gpiochip1: Error applying setting, reverse things back
> gpio_stub_drv: probe of gpiochip1 failed with error -22

Similar issue on Salvator-XS:

    sh-pfc e6060000.pinctrl: pin GP_2_0 already requested by 7-0030;
cannot claim for gpiochip9
    sh-pfc e6060000.pinctrl: pin-64 (gpiochip9) status -22
    sh-pfc e6060000.pinctrl: could not request pin 64 (GP_2_0) from
group intc_ex_irq0  on device sh-pfc
    gpio_stub_drv gpiochip9: Error applying setting, reverse things back
    gpio_stub_drv: probe of gpiochip9 failed with error -22

> This happens because when we try to probe a device, driver core calls
> into pinctrl to set up the pins. However, if the GPIO DT node already
> has a proper device created and probed, trying to probe the gpio_device
> with a stub driver makes the pins be claimed twice. pinctrl doesn't like
> this and throws an error.
>
> So, this patch makes sure the gpio_stub_drv doesn't match with a
> gpio_device if it's not the primary device for the fwnode.
>
> [1] - https://lore.kernel.org/lkml/544ad0e4-0954-274c-8e77-866aaa5661a8@gmail.com/
> Fixes: 4731210c09f5 ("gpiolib: Bind gpio_device to a driver to enable fw_devlink=on by default")
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
