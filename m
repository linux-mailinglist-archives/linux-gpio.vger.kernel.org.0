Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0806863BDEF
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 11:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiK2KZ1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 05:25:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiK2KZ0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 05:25:26 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2AE6464;
        Tue, 29 Nov 2022 02:25:25 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id z1so9338364qkl.9;
        Tue, 29 Nov 2022 02:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oAL8AlKBYgUFWtZVzv9Iail4F4qVLePZC+TwQDfZc34=;
        b=b/NmtlJowU1Ua/KbeSwxovv409oa6qMZX3FDUSWqjP1dLwBUDNMtIHNOBv7JuJUdYU
         hZsECBBl+AgzZ6xv+UMF/XNFI9Wdqe/hpoD7HO4fTTzaSX1ciJgZkLkAr0eTfb7QKqwk
         MzUMzGHtlNwlI9cDpEDQKM+hVK2nsJuFWMvSLsqeofgz18aYamsAZHRXUHmNizqgVG8B
         wCDJS+W+hDmfT6nutXFxgQSl0euDX16brgpVZkiQguc8DkCE4zGjGdCrF2dY/N0/Awvr
         spfNnYrWehWqNmyseKv3+UZb0hvVoyknn08dQufGpbg7L0YD3JSQydxiehqLifyP7MnU
         mc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAL8AlKBYgUFWtZVzv9Iail4F4qVLePZC+TwQDfZc34=;
        b=e68ESwJq1/qeZl4XwiaY+eu2sHI67ZPIZgxMRbr24hy/FXr3eHJ77c9Cug0/uWYzjf
         b9CYCKjpj56z5IjV7oCDUMjlg9WrG4uTdbSPy8dqJBU5r65mtTk/h5p2nVNfEeYPfBW0
         xDgFjds70v2lRa1A47JvHovf265xuANQ4EOoQmyf2wrZJcXWYfRDwOVgYbeHSU8pZ+L7
         O3u7sDoU0A7sML8W1Tc4lAoafCRqyrRvUueK1ULla8IXhD6rAXyMaESlnodOErhbM+2K
         x0MOTBxA/XqzeuLjcoKzNWWEl6uQ6yAjcVu4rbiRf0fkkA+Ok1Ppf93w5VUOeuT9uuFE
         q7vQ==
X-Gm-Message-State: ANoB5plbV6MPHN60PrnIcKWIDWPK2h3ceKgIeWCQnfxImlZqahgF9byX
        u2oGtD0jh6Txynyj7LoIGKAYApmZ0K2F8VWe+pA=
X-Google-Smtp-Source: AA0mqf5VsQQXvf0cIY/BQzUIxW4Lj8C3B3qluGwzXtK1bxDaZt656IZNu2tT39whMK/dL2+cP7Ez1wBjDU+almRbmMo=
X-Received: by 2002:a05:620a:21ce:b0:6fa:d149:6d47 with SMTP id
 h14-20020a05620a21ce00b006fad1496d47mr32956545qka.734.1669717524938; Tue, 29
 Nov 2022 02:25:24 -0800 (PST)
MIME-Version: 1.0
References: <20221128214408.165726-1-hdegoede@redhat.com> <20221128214408.165726-3-hdegoede@redhat.com>
In-Reply-To: <20221128214408.165726-3-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 29 Nov 2022 12:24:48 +0200
Message-ID: <CAHp75Vc=8CqOPURA=ot9UMSOJknM7LJLqqX70Qu_NjmAKs2pig@mail.gmail.com>
Subject: Re: [PATCH 2/5] gpio: tps68470: Make tps68470_gpio_output() always
 set the initial value
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 28, 2022 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Make tps68470_gpio_output() call tps68470_gpio_set() for output-only pins
> too, so that the initial value passed to gpiod_direction_output() is
> honored for these pins too.

This smells like a fix. Shouldn't be the Fixes tag?

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpio/gpio-tps68470.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
> index 778a72cf800c..2ca86fbe1d84 100644
> --- a/drivers/gpio/gpio-tps68470.c
> +++ b/drivers/gpio/gpio-tps68470.c
> @@ -91,13 +91,13 @@ static int tps68470_gpio_output(struct gpio_chip *gc, unsigned int offset,
>         struct tps68470_gpio_data *tps68470_gpio = gpiochip_get_data(gc);
>         struct regmap *regmap = tps68470_gpio->tps68470_regmap;
>
> +       /* Set the initial value */
> +       tps68470_gpio_set(gc, offset, value);
> +
>         /* rest are always outputs */
>         if (offset >= TPS68470_N_REGULAR_GPIO)
>                 return 0;
>
> -       /* Set the initial value */
> -       tps68470_gpio_set(gc, offset, value);
> -
>         return regmap_update_bits(regmap, TPS68470_GPIO_CTL_REG_A(offset),
>                                  TPS68470_GPIO_MODE_MASK,
>                                  TPS68470_GPIO_MODE_OUT_CMOS);
> --
> 2.38.1
>


-- 
With Best Regards,
Andy Shevchenko
