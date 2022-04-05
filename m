Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9EA4F40BD
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Apr 2022 23:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240051AbiDEOfA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Apr 2022 10:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349572AbiDENRa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2022 09:17:30 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B748912FFAD
        for <linux-gpio@vger.kernel.org>; Tue,  5 Apr 2022 05:21:54 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id bq8so26269075ejb.10
        for <linux-gpio@vger.kernel.org>; Tue, 05 Apr 2022 05:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hyd/pfrY+6hwqlhuml6mv0gqkwBch+EmlReq/Qln8z4=;
        b=nL1mp9dhQOkmWmGbkOINfE0v3Wjfwsd/cZQ1vukSvyZWGEYB3IJR1Zb2YedevBKc8n
         pW6/1SSl2f9mVKLfvYm/J77tRixq2g3dQv7jgo3rj92Ky1RoG2jlFV6DKEqFk+cj5tSb
         0BETCsQpGAYerpyypnP2McxFuR25X7pfYKq8gxVrsWLcCi2fORW9XszwnJqIvYYdYANl
         g9TD2pJknTz/L4eN3lBqHBO+o41pjRKgYWkeju8w/XA7ABmuzZjEacboST6KSPF8vTkW
         0FxkmiT+Me5Y2duYrDX07cH5cYm8zCLm8PPwg1/QyDnQFkCcJsvYGfrzL7n+Iymrqff1
         HvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hyd/pfrY+6hwqlhuml6mv0gqkwBch+EmlReq/Qln8z4=;
        b=niPICC/FWrLh3ejhQQWIcnRSMRlwttBQFcvQjMwsIdslTtBUS7H0uZCS2DJt6hd3+B
         tBpe3ITeT/dZy2EYl4k3irObGsDnyq/dMmgS/Gs6N8BezwXjIIulccOGPTOVoySahNHl
         yDgVZo1qTqaOE3Eyh2eRP++Q9XjTztOec7aXNAu0feqx4h5+kefm4/D7zkFEfXqdE5JG
         kFsgCT9OpJxXton0+Au4embaiKWIUXYnIxK741dJK8mFizGBYpGBfiJI0kAJD9K2yAh3
         x+ezkgrD/ly0Qtw/1rFKJ3k6OId3vG90wcYegbM2lF+yYauqSlHV+x9yagX72w9B0WhW
         BsoQ==
X-Gm-Message-State: AOAM5327GJLWbN6q10IwdVK0mYzWNI6PlL2K9dcsYveSIZ4lxe6xx00y
        uVJiVH+xzTHPmMGM5uHlMvyuWZ8Eqy0Ba972f+tA8w==
X-Google-Smtp-Source: ABdhPJwHngR0iRaezdjPROigde8WDKR2Bt7Fj5Iw+EvDdD2I+vTb5RSGu7YkbPC6mcuF25QXqCav+lbZ+p6ixycK02M=
X-Received: by 2002:a17:907:97cf:b0:6df:846f:ad0a with SMTP id
 js15-20020a17090797cf00b006df846fad0amr3443415ejc.286.1649161312925; Tue, 05
 Apr 2022 05:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220330145910.1946-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220330145910.1946-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 5 Apr 2022 14:21:42 +0200
Message-ID: <CAMRc=McZihs+aKOGE3M5_BW__CTiyX2u2bdS6xc+uHU9RCAZdw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpiolib: Split out for_each_gpio_desc() macro
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 30, 2022 at 4:59 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> In some cases we want to traverse all GPIO descriptors for given
> chip, let's split out for_each_gpio_desc() macro for such cases.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib.c | 10 +++-------
>  drivers/gpio/gpiolib.h |  7 +++++--
>  2 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e59884cc12a7..723411c13f1c 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -310,15 +310,11 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
>         spin_lock_irqsave(&gpio_lock, flags);
>
>         list_for_each_entry(gdev, &gpio_devices, list) {
> +               struct gpio_desc *desc;
>                 int i;
>
> -               for (i = 0; i != gdev->ngpio; ++i) {
> -                       struct gpio_desc *desc = &gdev->descs[i];
> -
> -                       if (!desc->name)
> -                               continue;
> -
> -                       if (!strcmp(desc->name, name)) {
> +               for_each_gpio_desc(i, gdev->chip, desc) {
> +                       if (desc->name && !strcmp(desc->name, name)) {
>                                 spin_unlock_irqrestore(&gpio_lock, flags);
>                                 return desc;
>                         }
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index 06f3faa9fbef..450fb2fabe43 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -100,10 +100,13 @@ struct gpio_array {
>
>  struct gpio_desc *gpiochip_get_desc(struct gpio_chip *gc, unsigned int hwnum);
>
> -#define for_each_gpio_desc_with_flag(i, gc, desc, flag)                \
> +#define for_each_gpio_desc(i, gc, desc)                                \

While at it: how about declaring the i variable in the loop definition?

Bart

>         for (i = 0, desc = gpiochip_get_desc(gc, i);            \
>              i < gc->ngpio;                                     \
> -            i++, desc = gpiochip_get_desc(gc, i))              \
> +            i++, desc = gpiochip_get_desc(gc, i))
> +
> +#define for_each_gpio_desc_with_flag(i, gc, desc, flag)                \
> +       for_each_gpio_desc(i, gc, desc)                         \
>                 if (!test_bit(flag, &desc->flags)) {} else
>
>  int gpiod_get_array_value_complex(bool raw, bool can_sleep,
> --
> 2.35.1
>
