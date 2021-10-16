Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A5443056D
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Oct 2021 00:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236657AbhJPWkG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Oct 2021 18:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235339AbhJPWkG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Oct 2021 18:40:06 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6B6C061765
        for <linux-gpio@vger.kernel.org>; Sat, 16 Oct 2021 15:37:57 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x192so22632763lff.12
        for <linux-gpio@vger.kernel.org>; Sat, 16 Oct 2021 15:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HIn9fXswaPOFkEp5r6mPDGSH5cXVQzTMb+9xQaqAYCk=;
        b=ZJBK6fch2LR7J5S+Tm5RjoueSldPH7z//t69/VqsG6ZEsRLsg8YiWU0K2cM3hpAZAw
         J9FbmMb8thnH2jmvHVa2djXnl9cpItdp6PFFBE+qUI6ubPogIYPlN/MOxa+virwPb36/
         kEZwLQBcPzmLQjvaHz5Rr1xeGHRQgt9uhyggiSAEdJOkcgpT4ldkmhlZPbnNnnijAcfP
         4MFjXn62S9QCa+NqE4qdgleuLCFAlqdCxxcOgTTEiuIWBCEO6vjARYbQoS1VhUTHsOuY
         X/4l5UKdSL1TqBSjTMKtxwS4IKms0VbfvBot0RkyyyIvFsdKScNS6vIxKOf2aRKIg57/
         vsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HIn9fXswaPOFkEp5r6mPDGSH5cXVQzTMb+9xQaqAYCk=;
        b=MPo2gOP5Z4GdQbtO3eq1NlpOoNffBvR7+k4KvpV1QD/zmqBWKM+5lgIvCW0ThHWy5Y
         G47dCc52hI22GieWaDiE9J00jvdWd7T5ZPLUzIn/uTuIxPd3ZlHIxxF/MGWSeZyyIWLY
         cItHLrhW3v9k6YV98r+iH8SucJdAq4CEn3VCSVXUVdPMs3UNExY9YONKNktezzba057b
         CbDuJ86Db+TrpgGiKSz4VvJ7xncsFOi+pfOEHcb/oH/Tgvka/QmKZksopsOWLddUXyNE
         ahze2XpsvI7WITBe4upavqDoLnhigdGDTy7KN81fXKF2DcjgoDj/gaOHsH2qxnBW0DGy
         f7kQ==
X-Gm-Message-State: AOAM530rS35MJ0JRfBq04YWTgGYDzRktY3gnFSoM4CqcPb8scpbRvlw9
        cb+2Mhw9EO1SvbP8OmvVtge6QVUbK3qm4lPAkFl2Pg==
X-Google-Smtp-Source: ABdhPJwJVfVbGLWN6Cfk6r/5D+jG7hdkK7FsQWfHxu2/axd8FNdH07TaAiF4xxObMWITHxtrLF4Vk51vM07n8vA0ih8=
X-Received: by 2002:ac2:5d4a:: with SMTP id w10mr19928988lfd.584.1634423875834;
 Sat, 16 Oct 2021 15:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211016141839.45460-1-joey.gouly@arm.com> <20211016141839.45460-2-joey.gouly@arm.com>
In-Reply-To: <20211016141839.45460-2-joey.gouly@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 17 Oct 2021 00:37:44 +0200
Message-ID: <CACRpkdac+NYMSHg_KCb2xQpnFaJMBfGT_7Mk+Kst1WrK9As_ZA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] gpio: Allow per-parent interrupt data
To:     Joey Gouly <joey.gouly@arm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Top-posting because I need a nod from Bartosz that I can
merge this patch with the rest in the pinctrl tree.

Bartosz: I can also offer this one patch in an immutable branch
as well so you can pull it in as well.

Yours,
Linus Walleij

On Sat, Oct 16, 2021 at 4:19 PM Joey Gouly <joey.gouly@arm.com> wrote:

> From: Marc Zyngier <maz@kernel.org>
>
> The core gpiolib code is able to deal with multiple interrupt parents
> for a single gpio irqchip. It however only allows a single piece
> of data to be conveyed to all flow handlers (either the gpio_chip
> or some other, driver-specific data).
>
> This means that drivers have to go through some interesting dance
> to find the correct context, something that isn't great in interrupt
> context (see aebdc8abc9db86e2bd33070fc2f961012fff74b4 for a prime
> example).
>
> Instead, offer an optional way for a pinctrl/gpio driver to provide
> an array of pointers which gets used to provide the correct context
> to the flow handler.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib.c      |  9 +++++++--
>  include/linux/gpio/driver.h | 19 +++++++++++++++++--
>  2 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index d1b9b721218f..abfbf546d159 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1534,9 +1534,14 @@ static int gpiochip_add_irqchip(struct gpio_chip *gc,
>         }
>
>         if (gc->irq.parent_handler) {
> -               void *data = gc->irq.parent_handler_data ?: gc;
> -
>                 for (i = 0; i < gc->irq.num_parents; i++) {
> +                       void *data;
> +
> +                       if (gc->irq.per_parent_data)
> +                               data = gc->irq.parent_handler_data_array[i];
> +                       else
> +                               data = gc->irq.parent_handler_data ?: gc;
> +
>                         /*
>                          * The parent IRQ chip is already using the chip_data
>                          * for this IRQ chip, so our callbacks simply use the
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index a0f9901dcae6..a673a359e20b 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -168,11 +168,18 @@ struct gpio_irq_chip {
>
>         /**
>          * @parent_handler_data:
> +        * @parent_handler_data_array:
>          *
>          * Data associated, and passed to, the handler for the parent
> -        * interrupt.
> +        * interrupt. Can either be a single pointer if @per_parent_data
> +        * is false, or an array of @num_parents pointers otherwise.  If
> +        * @per_parent_data is true, @parent_handler_data_array cannot be
> +        * NULL.
>          */
> -       void *parent_handler_data;
> +       union {
> +               void *parent_handler_data;
> +               void **parent_handler_data_array;
> +       };
>
>         /**
>          * @num_parents:
> @@ -203,6 +210,14 @@ struct gpio_irq_chip {
>          */
>         bool threaded;
>
> +       /**
> +        * @per_parent_data:
> +        *
> +        * True if parent_handler_data_array describes a @num_parents
> +        * sized array to be used as parent data.
> +        */
> +       bool per_parent_data;
> +
>         /**
>          * @init_hw: optional routine to initialize hardware before
>          * an IRQ chip will be added. This is quite useful when
> --
> 2.17.1
>
