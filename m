Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1B38FBEE
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2019 09:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbfHPHQv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Aug 2019 03:16:51 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38496 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbfHPHQu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2019 03:16:50 -0400
Received: by mail-ot1-f66.google.com with SMTP id r20so8805178ota.5;
        Fri, 16 Aug 2019 00:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bXpDqfJClvWxOUOcU12TDdqXCxVH2IPM0Zi2QEc01lk=;
        b=OipSLBandzQZqt7D7xb74hPnz6cqH2ZJNJmROyxPoxx41c4en8PJ1PFrUiQ8iNS/xH
         Cx6klZSHntoRUK8m9aqYrT48qID7culJIduhdkFak3eEUxyMLnwWJd0QT8tyTzu7lieI
         uLvqwM6suqsxZBlqUlm+IFctlyF+5TVk4X2kroBAUQ8OvRK2QAWr6nMlgywy37CqggnU
         IxkxEYVeQlkdfRHhZN07+i79R1Cw4t5GqoLGPD1dZFSVczG3LP/tgDKwWN8Uar4Jes17
         bsVbBq1K8OJt0/Q0EzjGze14/gLJ28Word/FBKUSkqBMx4gSlfinoewVIN11Q6BNTmR9
         k3Gg==
X-Gm-Message-State: APjAAAX7BRMdt+I6aJ2sTthm66VqCHVRYgggX7RcJgtlI5tnOVAzvUYR
        bhz2XpcC9c6tDp35xLfSqTpQtLGBfdylHke5b7X2RBWi
X-Google-Smtp-Source: APXvYqyzBK8lbM0XtJlylaIgzwq7el+4ERBBXhXH8xLvH6jCTgbjXceYtri2d9D+gGx37sCMxh0Nu/xlbqgpj1bn0jc=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr6547455otk.145.1565939810078;
 Fri, 16 Aug 2019 00:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190815085341.28088-1-sr@denx.de>
In-Reply-To: <20190815085341.28088-1-sr@denx.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Aug 2019 09:16:39 +0200
Message-ID: <CAMuHMdXYLB1UShMjoZi6gzyxx=uOeLdVsZmhWZO5J+=As-5gdw@mail.gmail.com>
Subject: Re: [PATCH v2] serial: mctrl_gpio: Support all GPIO suffixes (gpios
 vs gpio)
To:     Stefan Roese <sr@denx.de>
Cc:     "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pavel Machek <pavel@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

CC Mika, who reported the initial issue

On Thu, Aug 15, 2019 at 10:53 AM Stefan Roese <sr@denx.de> wrote:
>
> This patch fixes a backward compatibility issue, when boards use the
> old style GPIO suffix "-gpio" instead of the new "-gpios". This
> potential problem has been introduced by commit d99482673f95 ("serial:
> mctrl_gpio: Check if GPIO property exisits before requesting it").
>
> This patch now fixes this issue by using gpiod_count() which iterates
> over all supported GPIO suffixes (thanks to Linus for suggesting this).
>
> With this change, the local string is not needed any more. This way
> we can remove the allocation in the loop.
>
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Pavel Machek <pavel@denx.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v2
> - Use gpiod_count() to check if the GPIO exists (Linus)
> - Remove the now unnecessary malloc in the loop (kasprintf)
>
>  drivers/tty/serial/serial_mctrl_gpio.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/tty/serial/serial_mctrl_gpio.c b/drivers/tty/serial/serial_mctrl_gpio.c
> index 2b400189be91..ce73b142c66b 100644
> --- a/drivers/tty/serial/serial_mctrl_gpio.c
> +++ b/drivers/tty/serial/serial_mctrl_gpio.c
> @@ -117,18 +117,11 @@ struct mctrl_gpios *mctrl_gpio_init_noauto(struct device *dev, unsigned int idx)
>
>         for (i = 0; i < UART_GPIO_MAX; i++) {
>                 enum gpiod_flags flags;
> -               char *gpio_str;
> -               bool present;
> +               int count;
>
>                 /* Check if GPIO property exists and continue if not */
> -               gpio_str = kasprintf(GFP_KERNEL, "%s-gpios",
> -                                    mctrl_gpios_desc[i].name);
> -               if (!gpio_str)
> -                       continue;
> -
> -               present = device_property_present(dev, gpio_str);
> -               kfree(gpio_str);
> -               if (!present)
> +               count = gpiod_count(dev, mctrl_gpios_desc[i].name);
> +               if (count <= 0)
>                         continue;
>
>                 if (mctrl_gpios_desc[i].dir_out)

Seems like both device_property_present() and gpiod_count()
eventually call into acpi_data_get_property().

However, given
commit 6fe9da42f1d98fdb4be1598e230aca97e66cf35d
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Tue May 23 20:03:20 2017 +0300

    gpio: acpi: Synchronize acpi_find_gpio() and acpi_gpio_count()

    If we pass connection ID to the both functions and at the same time
    acpi_can_fallback_to_crs() returns false we will get different results,
    i.e. the number of GPIO resources returned by acpi_gpio_count() might be
    not correct.

    Fix this by calling acpi_can_fallback_to_crs() in acpi_gpio_count()
    before trying to fallback.

acpi_find_gpio() and acpi_gpio_count() are supposed to use the exact
same logic, so this patch is not gonna work as intended?!?

Note that I still find it strange that acpi_find_gpio() falls back to
unnamed gpios if con_id != NULL, causing the problem in the first place.
This is gonna bite us again later...

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
