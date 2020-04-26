Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9781B8E2E
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Apr 2020 11:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgDZJU7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Apr 2020 05:20:59 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35707 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgDZJU7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Apr 2020 05:20:59 -0400
Received: by mail-ot1-f68.google.com with SMTP id e26so20843362otr.2;
        Sun, 26 Apr 2020 02:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6hQ0FsSv9PtPNzLad/ImWLAXQBaBJZp6Df5to0tE7AE=;
        b=aUh1F5DwbU9XkJZlIcIi3D4H/wFjPqyGQIq9InaCKHQsSzGdf+VO3hW1TWoPiVSIJO
         HwTFYKJ4ZRDdeANtt1ajBAmm+rPPnPpw4djzoUKbf+mfkfgIIDWtdBmj8Y+eEV1iS83b
         3Zp2D1bo8pCQDW6DPTzoXMDFWUAagPj4gyY6WpEnOYphg7P6rQ0K4l8HRwWkBZaeV9Rt
         By61noCuG7rHXicRCqpPcBaSn8TgY+IxalCyWcioTA/ceVaehAKclDTczh/2rh3ZmrOs
         cDy/XCHwZPcWysEPcDRPuRDv/RN/S1yXOJe9lAaEW+assCGKwpCCnlVgi47p8AH7Biz6
         5yQg==
X-Gm-Message-State: AGi0PuZwrYZXrRHy6aOe5QKfPm5BCuqORvQdFhRFzUTn4KMgQKzRv16j
        vrcho5Wi6z53t0LUezZ3XgdUb0DA9/qSJButXi8=
X-Google-Smtp-Source: APiQypKQG3K6apgv6LUHl8XSpm0aMLUqsS9zYhTD6QAGXod32cnW+tdIzAk+LKDkdDN1UIHF0UEYKJyiPIrEEv5maY4=
X-Received: by 2002:a9d:7990:: with SMTP id h16mr8510307otm.145.1587892858245;
 Sun, 26 Apr 2020 02:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200425044655.166257-1-davidgow@google.com>
In-Reply-To: <20200425044655.166257-1-davidgow@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 26 Apr 2020 11:20:46 +0200
Message-ID: <CAMuHMdWki-BjeF_SEOV0Lq1vKX1uWyaztj7_jjycyeiyKB4tnw@mail.gmail.com>
Subject: Re: [PATCH] gpio: of: Build fails if CONFIG_OF_DYNAMIC enabled
 without CONFIG_OF_GPIO
To:     David Gow <davidgow@google.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Frank Rowand <frank.rowand@sony.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi David,

On Sat, Apr 25, 2020 at 6:47 AM David Gow <davidgow@google.com> wrote:
> The symbol 'gpio_of_notifier' doesn't exist without both CONFIG_OF_GPIO
> and CONFIG_OF_DYNAMIC enabled, but is referenced when only
> CONFIG_OF_DYNAMIC is enabled.
>
> This broke building with 'make ARCH=um allyesconfig':

Right, so you have CONFIG_OF=y, but CONFIG_OF_GPIO=n, as the latter
depends on HAS_IOMEM, which is not set for UML.

Interestingly, the latter dependency claims to have been added because
gpiolib-of.c uses ioremap()/iounmap(). However, it seems to have never
called ioremap(), only of_iomap() and iounmap().
of_iomap() itself is available, as it depends on OF_ADDRESS, which
depends on HAS_IOMEM || UML.  Interestingly, of_iomap() calls ioremap(),
without a dependency on HAS_IOMEM?

So perhaps the dependency of CONFIG_OF_GPIO on HAS_IOMEM can be
dropped these days, solving this issue as well?

> ---------------
> /usr/bin/ld: drivers/gpio/gpiolib.o: in function `gpiolib_dev_init':
> ./drivers/gpio/gpiolib.c:5293: undefined reference to `gpio_of_notifier'
> collect2: error: ld returned 1 exit status
> ---------------
>
> Fixes: 63636d956c45 ("gpio: of: Add DT overlay support for GPIO hogs")
> Signed-off-by: David Gow <davidgow@google.com>

Anyway:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -5289,8 +5289,9 @@ static int __init gpiolib_dev_init(void)
>         gpiolib_initialized = true;
>         gpiochip_setup_devs();
>
> -       if (IS_ENABLED(CONFIG_OF_DYNAMIC))
> -               WARN_ON(of_reconfig_notifier_register(&gpio_of_notifier));
> +#if IS_ENABLED(CONFIG_OF_DYNAMIC) && IS_ENABLED(CONFIG_OF_GPIO)
> +       WARN_ON(of_reconfig_notifier_register(&gpio_of_notifier));
> +#endif /* CONFIG_OF_DYNAMIC && CONFIG_OF_GPIO */
>
>         return ret;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
