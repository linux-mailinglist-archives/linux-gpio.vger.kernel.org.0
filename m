Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC1D2293E4
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 10:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728930AbgGVItC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 04:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgGVItC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 04:49:02 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0131FC0619DC;
        Wed, 22 Jul 2020 01:49:02 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id n5so833517pgf.7;
        Wed, 22 Jul 2020 01:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2KyPHff/Uosyh2rGRRq7zQWY57m8n2yFC/KFH0GE8II=;
        b=s1lKNaJtq7hqWFXwPC1USXb9595sUUEXquCs6mbVMWavi0papiZVIzk3dAeRUROgeO
         9IWlKb8qJma8pYNUB3bUQsaxe/9ua3QrDVk5WLM8CavqckkP462cJt+JZfBOrifnP/+k
         22BZI5+6j309pw3DrYjC331VyK+EmtyM9imDlIuJa9WP1TrDRqnMK3XhiBNSW7UHRVl9
         8maOa3uoMOSOIHVFWpP7R5EPyb3Rz12bzIrfKWVZWYhWhYlXGQgQF4SawZQbr+SgSNK3
         kZzmIOAvuy3vxEDWXJmfQG+hzRsSTWUq/jnMQq39TnMdwi0gDBzK//s1Y2By15VXxfrA
         7qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2KyPHff/Uosyh2rGRRq7zQWY57m8n2yFC/KFH0GE8II=;
        b=tCRt/CsI6lf4sP1ZcWRJLbvaAwXZlXAxzZlXKDaLRiBiL2+AJqfwRG21WtwwiAUAi0
         oAjsnwfLnmXGu0KgpwBQVYBaDwTqeyv98OrLTiA00zm+7ORlPC2J/lx80qSxTzupZJ/L
         I2z3K4DYDoMuCfI4i0UXeks2C1ZyM0YGgfgc/d3dQ3mAgVIApg2L6BEZyaHFyeiuxctc
         ytli3qwzO+Y9eZUFJ/GC6MkeiD/JBl7Zt0dYhIUi/aJqcvr48Fz5SR32JBykRUTWC351
         iwKAKFyQDPGQGPB8dk0D8XxCHGUGEOpT2OqZc//QXRTtHCqVEE5NiWilByE1+34NmT07
         hoog==
X-Gm-Message-State: AOAM530chTxMFT1VBAHBZbrW1COkWblVYC2IPG+KFNk/gnWrgTNnhO+P
        zVlP9L1zKj3Fa+AcNbVRwKMZDpkU8MIYe+rjhvz9KP+ew3Y=
X-Google-Smtp-Source: ABdhPJycJY8Os5gbLzkhFPKkBoH7k04etCMzkKuIR+iuQjyXigdwFEJoM3PDC6WQaA30NM2SX0kd5wL4NZ4DvuoyiXo=
X-Received: by 2002:a63:ce41:: with SMTP id r1mr26560784pgi.203.1595407741419;
 Wed, 22 Jul 2020 01:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200721222851.2075891-1-drew@beagleboard.org>
In-Reply-To: <20200721222851.2075891-1-drew@beagleboard.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 22 Jul 2020 11:48:46 +0300
Message-ID: <CAHp75Vd35n0=hB-K3WjUXD3HPNt6F=MHNafNY55NGfb5ahvLSA@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: core: print gpio in pins debugfs file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 22, 2020 at 1:29 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> If there is a gpio range mapping for the pin, then print out the gpio
> chip and line index for the pin in the debugfs 'pins' file with the
> format: "[line-index]:[gpio-label]"
>
> Here is an example output on the BeagleBoard.org PocketBeagle (AM3358):
> /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins
>
> pin 25 (PIN25) 25:gpio-32-63 44e10864 00000037 pinctrl-single
> pin 26 (PIN26) 26:gpio-32-63 44e10868 00000037 pinctrl-single
> pin 27 (PIN27) 27:gpio-32-63 44e1086c 00000037 pinctrl-single
> pin 28 (PIN28) 0:N/A 44e10870 00000036 pinctrl-single
> pin 29 (PIN29) 0:N/A 44e10874 00000006 pinctrl-single
> pin 30 (PIN30) 28:gpio-32-63 44e10878 00000027 pinctrl-single
> pin 31 (PIN31) 29:gpio-32-63 44e1087c 00000037 pinctrl-single
> pin 32 (PIN32) 30:gpio-32-63 44e10880 00000037 pinctrl-single
> pin 33 (PIN33) 31:gpio-32-63 44e10884 00000037 pinctrl-single
> pin 34 (PIN34) 0:gpio-64-95 44e10888 00000037 pinctrl-single
> pin 35 (PIN35) 1:gpio-64-95 44e1088c 00000037 pinctrl-single
>

This variant looks good enough to me, thanks! FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Suggested-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  drivers/pinctrl/core.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> v4 change:
> - can format to be integer first as Andy suggested it will make parsing
>   easier
>
> v3 change:
> - gpio column is now gpiochip label and line index
>
> v2 changes:
> - print 'NA' if pin does not have a GPIO number
> - change gpio_num from unsigned to unsigned int per checkpatch
>
>
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 821242bb4b16..39e74cdf5c7d 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -27,6 +27,7 @@
>  #include <linux/pinctrl/machine.h>
>
>  #ifdef CONFIG_GPIOLIB
> +#include "../gpio/gpiolib.h"
>  #include <asm-generic/gpio.h>
>  #endif
>
> @@ -1601,6 +1602,9 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
>         struct pinctrl_dev *pctldev = s->private;
>         const struct pinctrl_ops *ops = pctldev->desc->pctlops;
>         unsigned i, pin;
> +       struct pinctrl_gpio_range *range;
> +       unsigned int gpio_num;
> +       struct gpio_chip *chip;
>
>         seq_printf(s, "registered pins: %d\n", pctldev->desc->npins);
>
> @@ -1618,6 +1622,23 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
>
>                 seq_printf(s, "pin %d (%s) ", pin, desc->name);
>
> +#ifdef CONFIG_GPIOLIB
> +               gpio_num = 0;
> +               list_for_each_entry(range, &pctldev->gpio_ranges, node) {
> +                       if ((pin >= range->pin_base) &&
> +                           (pin < (range->pin_base + range->npins))) {
> +                               gpio_num = range->base + (pin - range->pin_base);
> +                               break;
> +                       }
> +               }
> +               chip = gpio_to_chip(gpio_num);
> +               if (chip && chip->gpiodev && chip->gpiodev->base)
> +                       seq_printf(s, "%u:%s ", gpio_num -
> +                               chip->gpiodev->base, chip->label);
> +               else
> +                       seq_puts(s, "0:N/A ");
> +#endif
> +
>                 /* Driver-specific info per pin */
>                 if (ops->pin_dbg_show)
>                         ops->pin_dbg_show(pctldev, s, pin);
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
