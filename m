Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F022CEB50
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 10:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387675AbgLDJsL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 04:48:11 -0500
Received: from mail-oo1-f67.google.com ([209.85.161.67]:40826 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387601AbgLDJsL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2020 04:48:11 -0500
Received: by mail-oo1-f67.google.com with SMTP id t142so1221776oot.7
        for <linux-gpio@vger.kernel.org>; Fri, 04 Dec 2020 01:47:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ZX1jfI65gTj/xQ5OlufeN5u2bJGS7aKP6erk1tPrUE=;
        b=OBGLf67ctQIczuP+wC7mPaTYownJ/7YHV38v3crQl6RsNakmJsNA1q3tTicslx8WT9
         4nxZb0lZM2vIcMAx2JhUcLHgDBoRF50kdMR0recRCLiPoGht884MY1M0lbT76VLXCFv3
         lqgOJJp9sdpnn1OWN3wtvMVMjbtSwoi8/axnui8rN0zlb7/Yb/XxObe0y5WL8xFYOvui
         UZyBSe1s7N5RAHCV1WKBRs5MCTQO+uNhRI7EFj8ptS54+UgN3jpvoRSswmE05qsiJvIk
         cuXee1jGHhyu3rpUGEPt3iWxT7fwjGi3mgV4HVHygS4Kp0+84giyTTr+p6+RkX3OAlli
         ZDtA==
X-Gm-Message-State: AOAM533dw7QWYNvqV4dTPumS1wbWfQBArafiGzmflhfBz4zG83whesRq
        zoCBFyCGiS7AYrYsKqXgIL1Q7YKCOTtgyUxv9Lk=
X-Google-Smtp-Source: ABdhPJy0QoZkwNCNXEa3N/IquOt7UFDwBUfJLxWPJV2IXSHphl2OUMfjU5sNEgWks4aEMy9XhUOBuu2xU8ZcdTnYo/0=
X-Received: by 2002:a4a:274b:: with SMTP id w11mr2790624oow.11.1607075244161;
 Fri, 04 Dec 2020 01:47:24 -0800 (PST)
MIME-Version: 1.0
References: <20201204083533.65830-1-linus.walleij@linaro.org>
In-Reply-To: <20201204083533.65830-1-linus.walleij@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Dec 2020 10:47:12 +0100
Message-ID: <CAMuHMdWyz-j7F+jGJt0SqLAiSA9xiaycK5kvznB9xmh7HxO4qg@mail.gmail.com>
Subject: Re: [PATCH] gpio: Add TODO item for debugfs interface
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Fri, Dec 4, 2020 at 9:37 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> The idea to create a debugfs to replace the aging and
> dangerous sysfs ABI for hacking and tinkering came up
> on the list.
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/gpio/TODO
> +++ b/drivers/gpio/TODO
> @@ -142,3 +142,39 @@ use of the global GPIO numbers. Once the above is complete, it may
>  make sense to simply join the subsystems into one and make pin
>  multiplexing, pin configuration, GPIO, etc selectable options in one
>  and the same pin control and GPIO subsystem.
> +
> +
> +Debugfs in place of sysfs
> +
> +The old sysfs code that enables simple uses of GPIOs from the
> +command line is still popular despite the existance of the proper
> +character device. The reason is that it is simple to use on
> +root filesystems where you only have a minimal set of tools such
> +as "cat", "echo" etc.
> +
> +The old sysfs still need to be strongly deprecated and removed
> +as it relies on the global GPIO numberspace that assume a strict
> +order of global GPIO numbers that do not change between boots
> +and is independent of probe order.
> +
> +To solve this and provide an ABI that people can use for hacks
> +and development, implement a debugfs interface to manipulate
> +GPIO lines that can do everything that sysfs can do today: one
> +directory per gpiochip and one file entry per line:
> +
> +/sys/kernel/debug/gpiochip/gpiochip0
> +/sys/kernel/debug/gpiochip/gpiochip0/0

.../gpio0?

Might be a better name, if you ever want to create a symlink
to this virtual file (e.g. from the line-name)?

> +/sys/kernel/debug/gpiochip/gpiochip0/1
> +/sys/kernel/debug/gpiochip/gpiochip0/2
> +/sys/kernel/debug/gpiochip/gpiochip0/3

Plus a symlink to the device backing this gpiochip.

> +...
> +/sys/kernel/debug/gpiochip/gpiochip1
> +/sys/kernel/debug/gpiochip/gpiochip1/0
> +/sys/kernel/debug/gpiochip/gpiochip1/1
> +...
> +
> +The exact files and design of the debugfs interface can be
> +discussed but the idea is to provide a low-level access point
> +for debugging and hacking and to expose all lines without the
> +need of any exporting. Also provide ample ammunition to shoot
> +oneself in the foot, because this is debugfs after all.

(let the bikeshedding begin ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
