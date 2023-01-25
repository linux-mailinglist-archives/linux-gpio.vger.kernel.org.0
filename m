Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3D567B11E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jan 2023 12:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235069AbjAYLZL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 06:25:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234997AbjAYLZK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 06:25:10 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA07072A1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 03:25:08 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id z9so9623383qkl.13
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 03:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p0bDfQfwMD8s65d5DFb7iQ0Ix+mcwALUWLkYySrgH8I=;
        b=pESaqB96PN2dTTbYNB9UcGjtyJ0mQL7tWurTd9CzUoiPz9TtP3w5Xufx9bG9sdWl4r
         pCpJkKMwJBHIBM1VVsQoz0yiwiAGzZ7xuxziPahuS1+kW1j6K0GviyObjckVcCJAFl/E
         kE2oMQ+uo2987lS6YigAosdcIKjoihP3arNzjCOpLR+dLnr3QSCrnnYDIdeWRp+mwDAt
         gSejHO6DFVN8z3/pgL7CSJmcRyJhOI/yReykvLGbG8Wqb9ABXDeFbyVaDephI3D/F/2J
         yqCNJAZTodyGKD7Qp5i5gQGcdBtIpB4nhg4tFnzzPRkaIEoBgowa+BtVGxO/LgIX4Zr/
         HIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0bDfQfwMD8s65d5DFb7iQ0Ix+mcwALUWLkYySrgH8I=;
        b=y63ZxLe8QLyVrxH2RQ+IHIjmCSoERtYKgZVnRvwiam/b3Ic3GHkre8eJ/+8POG4lgp
         6Wld34g6ZbJy9Hz6Ob430oSWpXROz2wuSkv1CWl1/UM6W8StH4nAxihA6O8qICR5/seu
         I1K6kxz5sUQTRIR4ygK8UDAn1KjzStf/aRlXkyr+WHaeXWpZn0jJl4r4oi4bBAv8SKTB
         tcqZtTgUyXEv7mLzXGxJuEwTVzNuXy0huaJop0MNkHbQKtzdTgKnumCqvBGEMOzpzslg
         +1Ac3G/MK6rOl03iOt2P3LQ7cQnsQfylT5a8ej9ioFWhHGh/kX3ZM4GNjOyCRlCNVOhS
         5fWw==
X-Gm-Message-State: AFqh2kqTuqgqQt2Yvvyu/pc19DL8ewW+x+1NIWBsbuntNkCCkRFrA/zm
        jjZ6b69xOb0oUnaRCauvLno9ZE4+tWgTUVtoDbI=
X-Google-Smtp-Source: AMrXdXs/9zghqpy4mYkIheQuQEbp67ADhOh5UUD0Ux7sM+qR8NR/1mrnenroRm4B3Lu8oywMCMSW+fM+/GFJgmbKXZI=
X-Received: by 2002:a05:620a:3713:b0:709:1602:bcee with SMTP id
 de19-20020a05620a371300b007091602bceemr1179797qkb.320.1674645907666; Wed, 25
 Jan 2023 03:25:07 -0800 (PST)
MIME-Version: 1.0
References: <20230125110547.18093-1-hdegoede@redhat.com> <20230125110547.18093-3-hdegoede@redhat.com>
In-Reply-To: <20230125110547.18093-3-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 25 Jan 2023 13:24:31 +0200
Message-ID: <CAHp75Vf19PbtE0xaNZ1Zo2U16mfYhrg6UemPUmZFeHYt0TFokg@mail.gmail.com>
Subject: Re: [PATCH v2 resend 2/2] gpio: tps68470: Make tps68470_gpio_output()
 always set the initial value
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-gpio@vger.kernel.org
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

On Wed, Jan 25, 2023 at 1:05 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Make tps68470_gpio_output() call tps68470_gpio_set() for output-only pins
> too, so that the initial value passed to gpiod_direction_output() is
> honored for these pins too.
>
> Fixes: 275b13a65547 ("gpio: Add support for TPS68470 GPIOs")
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Yes, just to confirm that this patch is correct in my opinion.
Thank you!

> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Tested-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Add Fixes tag
> - Add Andy's Reviewed-by
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
> 2.39.0
>


-- 
With Best Regards,
Andy Shevchenko
