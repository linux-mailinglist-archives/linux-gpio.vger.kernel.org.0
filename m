Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A12BF18CC0D
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2020 11:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbgCTK7I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Mar 2020 06:59:08 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34541 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbgCTK7H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Mar 2020 06:59:07 -0400
Received: by mail-oi1-f196.google.com with SMTP id j5so6050111oij.1;
        Fri, 20 Mar 2020 03:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JBGzd1fiCYIMs0yXGqTi6J4Cg8iQgyHBNWCz5d+cCxM=;
        b=QSRMgd5q/1n7036elxXzPGURwccLrpWQkNYkFlA9lyisF9PSvlcz9R7uwdz0BFQiSn
         MpMIiIDwykmOFZXeD9scfzwBVtr04YsRSuxqxpAO9daTwH8r6Yk5QK2aK6cq7+OVoNIf
         8Bic8lYRjii0Dny8UpwZguzX5Ri36+lYgdW8rByMzk4HSG65coiHbjVKYOipiIywaixL
         gyBoGgWPEsHz4eQIPnUkA/QyLsiUhA/7a6qY93BMH7Dvky/11fwkslxtwuFh273J9Sas
         v0aYMxaA0ESGXnKyot81MqZxIzto/mhMUReAZO5/YqBnLRDESncjkU4m5msC4njEeLm2
         BSDA==
X-Gm-Message-State: ANhLgQ2pdLZMd1sR17D3QPWTwN6m5Kk3JCnlA33jd/8U77t/xA5wnZhM
        m4xkxI3VRJFTq0lDvwSmBlqLkgz+giSv7I0Rq18=
X-Google-Smtp-Source: ADFU+vuzusGltxXm39xTf3vqPlxbTHXIt6qTneJTbhVKaOcT9tMW2LW4pSYh6Pfa0gbq7YWeA+51D7+gwN7Lhc0efL4=
X-Received: by 2002:aca:ad93:: with SMTP id w141mr6082546oie.54.1584701944814;
 Fri, 20 Mar 2020 03:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200320093125.23092-1-brgl@bgdev.pl>
In-Reply-To: <20200320093125.23092-1-brgl@bgdev.pl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Mar 2020 11:58:53 +0100
Message-ID: <CAMuHMdXWrK3QjGmAPC0aPtQ_62buiQLopyRKB-qro6HBK5bDyg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: don't call sleeping functions with a spinlock taken
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Fri, Mar 20, 2020 at 10:31 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> We must not call pinctrl_gpio_can_use_line() with the gpio_lock taken
> as it takes a mutex internally. Let's move the call before taking the
> spinlock and store the return value.
>
> This isn't perfect - there's a moment between calling
> pinctrl_gpio_can_use_line() and taking the spinlock where the situation
> can change but it isn't a regression either: previously this part wasn't
> protected at all and it only affects the information user-space is
> seeing.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: d2ac25798208 ("gpiolib: provide a dedicated function for setting lineinfo")
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Thanks for your patch!

> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1154,8 +1154,19 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>                                   struct gpioline_info *info)
>  {
>         struct gpio_chip *chip = desc->gdev->chip;
> +       bool ok_for_pinctrl;
>         unsigned long flags;
>
> +       /*
> +        * This function takes a mutex so we must check this before taking
> +        * the spinlock.
> +        *
> +        * FIXME: find a non-racy way to retrieve this information. Maybe a
> +        * lock common to both frameworks?
> +        */
> +       ok_for_pinctrl = pinctrl_gpio_can_use_line(
> +                               chip->base + info->line_offset);

Note that this is now called unconditionally, while before it was only called
if all previous steps in the ||-pipeline failed.

> +
>         spin_lock_irqsave(&gpio_lock, flags);
>
>         if (desc->name) {
> @@ -1182,7 +1193,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>             test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
>             test_bit(FLAG_EXPORT, &desc->flags) ||
>             test_bit(FLAG_SYSFS, &desc->flags) ||
> -           !pinctrl_gpio_can_use_line(chip->base + info->line_offset))
> +           !ok_for_pinctrl)
>                 info->flags |= GPIOLINE_FLAG_KERNEL;
>         if (test_bit(FLAG_IS_OUT, &desc->flags))
>                 info->flags |= GPIOLINE_FLAG_IS_OUT;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
