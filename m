Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F34722EA46
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 12:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbgG0KqJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 06:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbgG0KqJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 06:46:09 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D310CC061794;
        Mon, 27 Jul 2020 03:46:08 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 74so601041pfx.13;
        Mon, 27 Jul 2020 03:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jehCRQy4uteJUibhA5g6SvLtbbkzD6OrShUTGziy44Y=;
        b=H/t/Lm9EVRJCHbyAZRHNnxp5CKCfMrjjFipcuA989cdtwBpmZ0UzpYQ+UF0fmggqsM
         m2FeAY4WwCjGlIHssqoC6wz1u3mHA8JbjyvCS8+KkKUi2RQPPf7kOJZ6HBq1OIXyz2Ac
         uYEBSzSpBtRzNUaByG/YDzZhiiHJ8yacOxSL2FDsvwohGZXuhiWU5Rcva24iluHg0Uma
         J2zcFW/ldzghcB6I6Ridf1HMI52oHiGuzCfV4B1FinW/nsZA4Mnhq3OGU+pSfNJBiZql
         IMGC72eevTE5LlMlCMhJZYNx9dP/xWbepgXuTzlvCTSwt/7Ym1QIRkcTP5Jv7ISMiqgj
         yHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jehCRQy4uteJUibhA5g6SvLtbbkzD6OrShUTGziy44Y=;
        b=DMGTc3v11K7FP1pSjgV946ZxKkdYLFkN+5nLTB6uNAehH/GBfAwzCWTuK2ZTMVmP3G
         3ejEpBtn/vnWdsMdACH9IY80jWZQVhCVVLBB4S7V/ZCMDjoQv2cg6IxibV8tkxoys4qi
         CVqHjhVVgGF99XuV0pLo/+1pQ3v58eDxgVbIvGOeM9Z/oxk9WXVUMfnww63cIzQ+H+1k
         haerEc1HXGmi0M8T14Oc0aFc1GTzmO8qwVBfJnectkoJ2TX7CDxH3XIpj2IOCPB8r2YU
         lvuzYW/scskVk4zrUSVtnzizKDqlG0DUhCb7lPAsT+T6qvZFoKxMI1HR9mavaNSAcxDM
         o7GA==
X-Gm-Message-State: AOAM530I008Rrrg21q906dIbYkJ7NspEA6h3QALdHrPWpssTR/rxY4OI
        Wfhwix+VtF1INgQt7a3N2Y+ptFz3xhq/Pd7dlXM=
X-Google-Smtp-Source: ABdhPJxinAkri9d0U/zmjJcwDKaQgpT7048GkpzAB9qsugKzkqTcCybOpIyFiFYvrqx8zHllcsYu5vo7AtuUQN1dSw0=
X-Received: by 2002:a62:7b4e:: with SMTP id w75mr6458851pfc.130.1595846768426;
 Mon, 27 Jul 2020 03:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200727080019.286172-1-linus.walleij@linaro.org>
In-Reply-To: <20200727080019.286172-1-linus.walleij@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 27 Jul 2020 13:45:53 +0300
Message-ID: <CAHp75VfZk-6WrbppbBeBzCj+g=56hF0ip+HdVtOxLVaFF3J+Gg@mail.gmail.com>
Subject: Re: [PATCH] x86/platform/geode: Convert LED to GPIO machine descriptor
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andres Salomon <dilinger@queued.net>,
        linux-geode@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 27, 2020 at 11:02 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This makes the machine look up the LED from a GPIO machine
> descriptor table. The Geode LEDs should be on the CS5535
> companion chip.

Comments (rather nit-picks) below for all three.

In any case this version is okay
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

I'm not sure the prefix shouldn't be .../geode: for all of them
followed by mentioning the name in the subject line.

> Cc: linux-gpio@vger.kernel.org
> Cc: Andres Salomon <dilinger@queued.net>
> Cc: linux-geode@lists.infradead.org
> Cc: Andy Shevchenko <andy@infradead.org>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: platform-driver-x86@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/x86/platform/geode/net5501.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/platform/geode/net5501.c b/arch/x86/platform/geode/net5501.c
> index 163e1b545517..d4e6c57b9c87 100644
> --- a/arch/x86/platform/geode/net5501.c
> +++ b/arch/x86/platform/geode/net5501.c
> @@ -20,6 +20,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/input.h>
>  #include <linux/gpio_keys.h>
> +#include <linux/gpio/machine.h>
>
>  #include <asm/geode.h>
>
> @@ -55,9 +56,7 @@ static struct platform_device net5501_buttons_dev = {
>  static struct gpio_led net5501_leds[] = {
>         {
>                 .name = "net5501:1",
> -               .gpio = 6,
>                 .default_trigger = "default-on",
> -               .active_low = 0,
>         },
>  };
>
> @@ -66,6 +65,15 @@ static struct gpio_led_platform_data net5501_leds_data = {
>         .leds = net5501_leds,
>  };
>
> +static struct gpiod_lookup_table net5501_leds_gpio_table = {
> +       .dev_id = "leds-gpio",
> +       .table = {
> +               /* The Geode GPIOs should be on the CS5535 companion chip */
> +               GPIO_LOOKUP_IDX("cs5535-gpio", 6, NULL, 0, GPIO_ACTIVE_HIGH),

> +               { },

It will be good if we don't put commas in the terminator line (to
avoid copy'n'paste practice of this).

> +       },
> +};

...

>  static void __init register_net5501(void)
>  {
>         /* Setup LED control through leds-gpio driver */
> +       gpiod_add_lookup_table(&net5501_leds_gpio_table);
>         platform_add_devices(net5501_devs, ARRAY_SIZE(net5501_devs));
>  }

The cleanest way is also to provide an __exitcall function, but I
guess it may be too much.

-- 
With Best Regards,
Andy Shevchenko
