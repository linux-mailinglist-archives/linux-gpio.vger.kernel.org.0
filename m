Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05CFF298FF0
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:51:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782097AbgJZOvN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:51:13 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39275 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782091AbgJZOvN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:51:13 -0400
Received: by mail-pl1-f195.google.com with SMTP id y1so4845595plp.6;
        Mon, 26 Oct 2020 07:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gNikXAjuHkXg4r5DKzPvHVQBXNUEltT2qWS8EWj+E+Y=;
        b=oszyocZQSQTCBhptWS9xTRxvPO6wZRCJk/3at1phwpNfFKGUr7HMFQLuNUpVVSuGoH
         2bOSvc0bIf6ylq1/Zm/b9VtdisXFutfO22LM+OSSMw77QP9emxu+HLTmCnbVuoe6kCvf
         88SC3ViARGNqzTAONi3cOe11zD59exSD46OqwMUpdjr/sagSo7BHkiystWh9Guh7ZDbn
         f3iGbv9Nt3qYo7D0M2n4Ue5JxqPhickNQnYSyRUEYgx0LSBTPGi4Yz7JY8lCGsun/fZU
         ZDpI4uppoENzA2fvfGDBXFKphvL7Thkn39OoQTs3epv1BmHV2+mGUlu2onaedHeld97/
         ck8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gNikXAjuHkXg4r5DKzPvHVQBXNUEltT2qWS8EWj+E+Y=;
        b=NJGHDZ4PaIF+3BWywc9cXSUip1W4nFOk1eJqlJwN3Rwq8kvIIlw/aAluMh0KO1BMJo
         kfNqNUIRhK+HJ9NdBOWSoDT7hcWNuQAxaLqqCd56x5c2M0KzYjkiZeMP526s4cmHiSDR
         WIFvrFhRt2Z38KPbeSjqv40Cl5O4TnEpzjb/h+FU5LGvmK3CAhd8tYbeIFzuGksSNbzD
         qF6m9V36cAd07L8ThkU3GxCTAi7U8+T/IkZtYWUAWzaZw5eVB6sceVS1TUGnsjUbwJqA
         HUHeNOL20uRzZpQ8Y4MyGaV7k5/9fC99SY19Q5B6zEl0xK2n10FPf8q5S0qvHuxIVchE
         j/cg==
X-Gm-Message-State: AOAM531JefGtkbg419bFfF6KGAAF4qnvnxHHUPopm06LTShqI23h+zoE
        JWB1lcvJPsIiZFm3H+r8ises19CuIRZhbRYwM28=
X-Google-Smtp-Source: ABdhPJw464wh5zeUw6bK1uYq90q4/MId3XTpaCzRCQOFOiZ3gzthS/+5KZ54RndlCRVNXiAuXqz3TjTTUFUPDcfoI90=
X-Received: by 2002:a17:90b:305:: with SMTP id ay5mr21641352pjb.129.1603723872066;
 Mon, 26 Oct 2020 07:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201026141839.28536-1-brgl@bgdev.pl> <20201026141839.28536-6-brgl@bgdev.pl>
In-Reply-To: <20201026141839.28536-6-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Oct 2020 16:52:01 +0200
Message-ID: <CAHp75VcQfGFhLX7gp_fSMA4+O2Z3yP1M4FDrp+GVMg7y4N6k=Q@mail.gmail.com>
Subject: Re: [RFT PATCH 5/7] gpio: exar: unduplicate address and offset computation
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 26, 2020 at 4:23 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Provide and use helpers for calculating the register address and bit
> offset instead of hand coding it in every function.

Can you check code generation on x86, for example?

Sometimes compilers are eager to use idiv assembly instruction which
does simultaneously / and %.
I dunno if a) it's used for / 8 and % 8 since 8 is 2^3, b) splitting
to functions makes the above optimisation impossible.

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpio-exar.c | 40 ++++++++++++++++++++++++++++------------
>  1 file changed, 28 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
> index db366d85b6b4..629f4dad6919 100644
> --- a/drivers/gpio/gpio-exar.c
> +++ b/drivers/gpio/gpio-exar.c
> @@ -33,6 +33,26 @@ struct exar_gpio_chip {
>         unsigned int first_pin;
>  };
>
> +static unsigned int
> +exar_offset_to_sel_addr(struct exar_gpio_chip *exar_gpio, unsigned int offset)
> +{
> +       return (offset + exar_gpio->first_pin) / 8 ? EXAR_OFFSET_MPIOSEL_HI
> +                                                  : EXAR_OFFSET_MPIOSEL_LO;
> +}
> +
> +static unsigned int
> +exar_offset_to_lvl_addr(struct exar_gpio_chip *exar_gpio, unsigned int offset)
> +{
> +       return (offset + exar_gpio->first_pin) / 8 ? EXAR_OFFSET_MPIOLVL_HI
> +                                                  : EXAR_OFFSET_MPIOLVL_LO;
> +}
> +
> +static unsigned int
> +exar_offset_to_bit(struct exar_gpio_chip *exar_gpio, unsigned int offset)
> +{
> +       return (offset + exar_gpio->first_pin) % 8;
> +}
> +
>  static void exar_update(struct gpio_chip *chip, unsigned int reg, int val,
>                         unsigned int offset)
>  {
> @@ -52,9 +72,8 @@ static int exar_set_direction(struct gpio_chip *chip, int direction,
>                               unsigned int offset)
>  {
>         struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
> -       unsigned int addr = (offset + exar_gpio->first_pin) / 8 ?
> -               EXAR_OFFSET_MPIOSEL_HI : EXAR_OFFSET_MPIOSEL_LO;
> -       unsigned int bit  = (offset + exar_gpio->first_pin) % 8;
> +       unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
> +       unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
>
>         exar_update(chip, addr, direction, bit);
>         return 0;
> @@ -75,9 +94,8 @@ static int exar_get(struct gpio_chip *chip, unsigned int reg)
>  static int exar_get_direction(struct gpio_chip *chip, unsigned int offset)
>  {
>         struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
> -       unsigned int addr = (offset + exar_gpio->first_pin) / 8 ?
> -               EXAR_OFFSET_MPIOSEL_HI : EXAR_OFFSET_MPIOSEL_LO;
> -       unsigned int bit  = (offset + exar_gpio->first_pin) % 8;
> +       unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
> +       unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
>
>         if (exar_get(chip, addr) & BIT(bit))
>                 return GPIO_LINE_DIRECTION_IN;
> @@ -88,9 +106,8 @@ static int exar_get_direction(struct gpio_chip *chip, unsigned int offset)
>  static int exar_get_value(struct gpio_chip *chip, unsigned int offset)
>  {
>         struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
> -       unsigned int addr = (offset + exar_gpio->first_pin) / 8 ?
> -               EXAR_OFFSET_MPIOLVL_HI : EXAR_OFFSET_MPIOLVL_LO;
> -       unsigned int bit  = (offset + exar_gpio->first_pin) % 8;
> +       unsigned int addr = exar_offset_to_lvl_addr(exar_gpio, offset);
> +       unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
>
>         return !!(exar_get(chip, addr) & BIT(bit));
>  }
> @@ -99,9 +116,8 @@ static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
>                            int value)
>  {
>         struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
> -       unsigned int addr = (offset + exar_gpio->first_pin) / 8 ?
> -               EXAR_OFFSET_MPIOLVL_HI : EXAR_OFFSET_MPIOLVL_LO;
> -       unsigned int bit  = (offset + exar_gpio->first_pin) % 8;
> +       unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
> +       unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
>
>         exar_update(chip, addr, value, bit);
>  }
> --
> 2.29.1
>


-- 
With Best Regards,
Andy Shevchenko
