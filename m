Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6D36759415
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jul 2023 13:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjGSLWo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 07:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjGSLWn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 07:22:43 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD7E189
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 04:22:42 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-48133dc9820so1933998e0c.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 04:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689765761; x=1690370561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qh2x+6Go7/GgsSJaAMKr9ut8qXTZ0+aIpVK4YlGb9HU=;
        b=GSGUr//+2uLH3shUvgQ/vwO1OyLu9aDM5+mckYdSDMHPuwpMVq9JNcsBIAjtO6wuph
         y9J9py+nmo2rFc6jgj115klJJKkbwbnhatWr6AVcRU9KQ6cq06SvKVGnpRJkH5INUxi6
         8Zh04FlyPpX4ERGeDrH98pCqPog+BeGQHNdElgRKbofih8XyRHQMxrAMVLjdMrPkM/Mm
         7p8x0uWZmqlwXhRAbsmJa9Fd9qgdY6FvUPyxPAv8aWbycw3tGMmteOC2Kh/phFrAJCXb
         Il1xN1VgoGFUf9lU6aNiE60HLsohltSKIq+27QQvcjPjlN9UNaps+VTRg2aZOLy4Gb5d
         cY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689765761; x=1690370561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qh2x+6Go7/GgsSJaAMKr9ut8qXTZ0+aIpVK4YlGb9HU=;
        b=G3a2otu/pyCssrrQyv0gzp/q6cBdEJv1rf+XVgn5KjFnpPzAKd7BUYOZX46DRhGsgz
         iG20yfvU2J6eatCZsOLrliYYta0OZpw9ZDuNv6RyejCkx53ELwHaz5iKphmUwodqj3Nm
         ExbHCh9ykrVvgBpJMigGliIWuWEEYOfORfpxXr8XqHQQ4UzuP+QqYT8jSYk2ee+LPws1
         nAMvNLMftwdygcGU+tLBPlcw1uUgRxUJibw3djUh/K9seOnfWRU9ngeDhg7nGIK6Q/DQ
         iq/+21u4j/DeTJ1428itRoWezxE11RSRB2NCyWaqtXxZJqKVMXPUI6HRFwvUXL2kr8j0
         To7w==
X-Gm-Message-State: ABy/qLbuF4tfyUcIo0T1Ep5jgoJ671jqs8LoBdemNbvNf2cDXSCrtt0u
        VNc9wbQp537rEHcXfI/LUooJBxwGuumWbDZ8ry534A==
X-Google-Smtp-Source: APBJJlHPqhIWuMmNxi6o+sZ8Aj9vBPt/ocFq8svTiF041bCt8UxgjnAZ7h43paB9j/VbqjzRs7GR0l5AgCsuQUA9T38=
X-Received: by 2002:a1f:5ccb:0:b0:481:4cd1:d61e with SMTP id
 q194-20020a1f5ccb000000b004814cd1d61emr786034vkb.13.1689765761191; Wed, 19
 Jul 2023 04:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230710123425.316943-1-hdegoede@redhat.com>
In-Reply-To: <20230710123425.316943-1-hdegoede@redhat.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 19 Jul 2023 13:22:30 +0200
Message-ID: <CAMRc=MdkFsbyr+BMTPQ2EHwkSJ_5GNHaRMACM0T+efkmphoL-g@mail.gmail.com>
Subject: Re: [PATCH resend v2] gpio: tps68470: Make tps68470_gpio_output()
 always set the initial value
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 10, 2023 at 2:34=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Make tps68470_gpio_output() call tps68470_gpio_set() for output-only pins
> too, so that the initial value passed to gpiod_direction_output() is
> honored for these pins too.
>
> Fixes: 275b13a65547 ("gpio: Add support for TPS68470 GPIOs")
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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
> index aaddcabe9b35..532deaddfd4e 100644
> --- a/drivers/gpio/gpio-tps68470.c
> +++ b/drivers/gpio/gpio-tps68470.c
> @@ -91,13 +91,13 @@ static int tps68470_gpio_output(struct gpio_chip *gc,=
 unsigned int offset,
>         struct tps68470_gpio_data *tps68470_gpio =3D gpiochip_get_data(gc=
);
>         struct regmap *regmap =3D tps68470_gpio->tps68470_regmap;
>
> +       /* Set the initial value */
> +       tps68470_gpio_set(gc, offset, value);
> +
>         /* rest are always outputs */
>         if (offset >=3D TPS68470_N_REGULAR_GPIO)
>                 return 0;
>
> -       /* Set the initial value */
> -       tps68470_gpio_set(gc, offset, value);
> -
>         return regmap_update_bits(regmap, TPS68470_GPIO_CTL_REG_A(offset)=
,
>                                  TPS68470_GPIO_MODE_MASK,
>                                  TPS68470_GPIO_MODE_OUT_CMOS);
> --
> 2.41.0
>

Applied, thanks!

Bart
