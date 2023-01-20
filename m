Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1083B675539
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 14:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjATNFB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 08:05:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbjATNFA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 08:05:00 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2955BCE06
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 05:04:47 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id k4so5575345vsc.4
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 05:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x0UVlooH4Nmx4Qpl2XF4U0wwI13fACAvTGf+QlSLzJU=;
        b=TwPNwR1dr260tGCDyKD65k+L4srRnIi4u7cRTqKbG5Fe9My1r5B/YbonQBXxhpXRx+
         yfV7hVu4pvtIDIogECkAj5nBO2tR6IWXmJ63qMG7Bgf//tzHY+yTwhweARC0TDHU+ha4
         xKOplBQlhkOYgMpYpx7+7qSVfWZEQIHoudjtssV1a5kHfmkGZbM/nKBkoY6tnbLXz3UO
         wPEz6yKRIHex/H3J1hjXmF6oTo0GlrZ53OPgdchsqZBiTttP+UfQt+k0cTwBuAXsYL9C
         UFPKU7LwxWMAqxCVZFhIcKj73fsChlYnhyUiTewX8t3PtQrVxy5I28L8eFY8t7Kh0l3J
         7GhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0UVlooH4Nmx4Qpl2XF4U0wwI13fACAvTGf+QlSLzJU=;
        b=i/DZQbJUvDq55yQlFaX7pOQTSa2lvsuA2dSBxOfzK3tR7HSgABGP2k/F09d1yn1doW
         kfF+xqzY2gxmbETy2MOb4BoU6gaMgZUbCKO4uwivhrY14LDphI95J8WqlDsPhUd4GMab
         /KTktpTf+Y2e13TQH3KhBIqy3q4pmaw1NdPe5JFo6GqyEyCzfKYCKbHo35Y8AEggpUZD
         anr/OmItwpqas4x1L9RSZIn2BsZ0FZVnF+Y9wmw/4u1L8ugwb2gEknjZ5RGiCSi3bqXS
         jxgGdztTpPz7xWLt7T5K+blVl2aP8KRmy0rBG8RMsUz4mpIDugAr9Depaxue4w6U4Sli
         Jcug==
X-Gm-Message-State: AFqh2kpTwHNvGDUeyJDc998/UqTFM8Euc+/UA9yrhlOkO8i1WigqZxhO
        uKGeV45ps40LFo0nSagCH+EAgniQXVW5jut6kYteMtvXgDDB6A==
X-Google-Smtp-Source: AMrXdXucGsl4cj+xAqDHtU06Tm08zXVknieWAYmns7ScOPpq6S5heCpvAtvOYyJoFQTO1kRM9qcIB/ZhDubSaPytM/g=
X-Received: by 2002:a67:f2da:0:b0:3d3:d90c:5ef2 with SMTP id
 a26-20020a67f2da000000b003d3d90c5ef2mr2463321vsn.17.1674219886905; Fri, 20
 Jan 2023 05:04:46 -0800 (PST)
MIME-Version: 1.0
References: <20230120093800.653126-1-linus.walleij@linaro.org>
In-Reply-To: <20230120093800.653126-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 20 Jan 2023 14:04:35 +0100
Message-ID: <CAMRc=McKKjR0T5svYRpqnHo1CwYB9bPbMLmjF_1X4fzzx-X94Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: Get rid of gpio_to_chip()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 20, 2023 at 10:38 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The gpio_to_chip() function refers to the global GPIO numberspace
> which is a problem we want to get rid of. Get this function out
> of the header and open code it into gpiolib with appropriate FIXME
> notices so no new users appear in the kernel.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/core.c     | 14 ++++++++++++--
>  include/asm-generic/gpio.h |  6 ------
>  2 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 41fd84738707..d6e6c751255f 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -325,7 +325,12 @@ static bool pinctrl_ready_for_gpio_range(unsigned gpio)
>  {
>         struct pinctrl_dev *pctldev;
>         struct pinctrl_gpio_range *range = NULL;
> -       struct gpio_chip *chip = gpio_to_chip(gpio);
> +       /*
> +        * FIXME: "gpio" here is a number in the global GPIO numberspace.
> +        * get rid of this from the ranges eventually and get the GPIO
> +        * descriptor from the gpio_chip.
> +        */
> +       struct gpio_chip *chip = gpiod_to_chip(gpio_to_desc(gpio));
>
>         if (WARN(!chip, "no gpio_chip for gpio%i?", gpio))
>                 return false;
> @@ -1657,7 +1662,12 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
>                         }
>                 }
>                 if (gpio_num >= 0)
> -                       chip = gpio_to_chip(gpio_num);
> +                       /*
> +                        * FIXME: gpio_num comes from the global GPIO numberspace.
> +                        * we need to get rid of the range->base eventually and
> +                        * get the descriptor directly from the gpio_chip.
> +                        */
> +                       chip = gpiod_to_chip(gpio_to_desc(gpio_num));
>                 else
>                         chip = NULL;
>                 if (chip)
> diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
> index a7752cf152ce..21437fc96835 100644
> --- a/include/asm-generic/gpio.h
> +++ b/include/asm-generic/gpio.h
> @@ -31,12 +31,6 @@ struct module;
>  struct device_node;
>  struct gpio_desc;
>
> -/* caller holds gpio_lock *OR* gpio is marked as requested */
> -static inline struct gpio_chip *gpio_to_chip(unsigned gpio)
> -{
> -       return gpiod_to_chip(gpio_to_desc(gpio));
> -}
> -
>  /* Always use the library code for GPIO management calls,
>   * or when sleeping may be involved.
>   */
> --
> 2.34.1
>

Yes please! Applied, thanks!

Bart
