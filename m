Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6D07194F3
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jun 2023 10:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbjFAIBr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 04:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232077AbjFAIB0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 04:01:26 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1B799
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 01:00:48 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-19f6211d4e1so540103fac.1
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jun 2023 01:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685606446; x=1688198446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VlldwuA6W0Q5lWZSIAfsBP6pN57zaKz/ORnELqXCBc=;
        b=SSjMXVJdU8PVb1PMLTHHUalziecVKNyVPS9KOlsYceNM5WgasKYvYhwiKWfg3dz80c
         Y/+GsBaLjUumgDJ1+SZq90aHzpVUExk98TWAb1eUTPJaYb9lBOr+3q2vYLCJ7ZkQsNbQ
         CWyUsv6JhcxUuf094nxFOQsoHCdWko8tiOXH2PFiPK6tYnoi/Eqz+vP9XZYcJdqHrRU7
         UgQI1qu5Rh3aqNHc4VGX9wXBx15adCCIq0WP4wFwnD/H6cJ5D1O+YCHZ34xOfcrS1ieH
         8viWnV3FqcsX1IujHnKdgDUfS5VNOCKuIhF1J4fSNZ0GGStKjX9XBB2PgLZeeq8P8kAl
         ZHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685606446; x=1688198446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VlldwuA6W0Q5lWZSIAfsBP6pN57zaKz/ORnELqXCBc=;
        b=IutxhCaQViI49H14nSaacx5xh9lZImceAL1w03DSKtTPrA3sYTxpjtSr5UP0nTVm9a
         iBvkuR4k5XY7ImdQickmgrFxLRPuzwRRocRguR7iuaFwVz/t+32xIM6n2gt/r9GKhUnv
         DsZnZampvwp893KoK8bZM+yesTULa7bHbh45VT4UV6xtS2BgDCE+OhUn61HqZSobg3NO
         eD8FX8ic816+dSdj78e8z6QQ0ofHQ+4EnVpKNwDFhV2O0bbKGBXohI9UVYIjGJVWKech
         U7eh+wQ9K8fskvF1nbPaRUPy+6bW6CLGRLn1/JlyKECSuHIFg4kNPBZb+ukR/VafrUcF
         jXqA==
X-Gm-Message-State: AC+VfDyGrsS0lnkXfDG1BdriAiEHPZDXbJk9mDczzzf41bw/WL2CL78h
        /gu7lOOSyy+fihrJH6ABvZRlB+7zTFgTxkjziwYzAg==
X-Google-Smtp-Source: ACHHUZ5B10KFMAOc+mKzFBZ98RVpom36VYR3vLBdPqsLsnkwCd1hG8+Q32AOHn0X+fJXQ6qbKTe6UyQVURP9T+eUDms=
X-Received: by 2002:a05:6808:1983:b0:397:fe89:202c with SMTP id
 bj3-20020a056808198300b00397fe89202cmr6007447oib.42.1685606446177; Thu, 01
 Jun 2023 01:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230527114057.36091-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230527114057.36091-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 1 Jun 2023 10:00:35 +0200
Message-ID: <CAMRc=Md49VF4Ab+hAiK3S1FJ7Nbb2vsyvuj-+zThybgZ5WAoYA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Consolidate the allocated mask freeing APIs
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 27, 2023 at 1:40=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> There is a common API to allocate a mask, but more than one duplicative
> counterparts. Consolidate the latter into a single common API beneath.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e62db4fc85cc..6c8580d2454d 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -466,6 +466,12 @@ static unsigned long *gpiochip_allocate_mask(struct =
gpio_chip *gc)
>         return p;
>  }
>
> +static void gpiochip_free_mask(unsigned long **p)
> +{
> +       bitmap_free(*p);
> +       *p =3D NULL;
> +}
> +
>  static unsigned int gpiochip_count_reserved_ranges(struct gpio_chip *gc)
>  {
>         struct device *dev =3D &gc->gpiodev->dev;
> @@ -545,8 +551,7 @@ static int gpiochip_init_valid_mask(struct gpio_chip =
*gc)
>
>  static void gpiochip_free_valid_mask(struct gpio_chip *gc)
>  {
> -       bitmap_free(gc->valid_mask);
> -       gc->valid_mask =3D NULL;
> +       gpiochip_free_mask(&gc->valid_mask);
>  }
>
>  static int gpiochip_add_pin_ranges(struct gpio_chip *gc)
> @@ -1090,8 +1095,7 @@ static int gpiochip_irqchip_init_valid_mask(struct =
gpio_chip *gc)
>
>  static void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gc)
>  {
> -       bitmap_free(gc->irq.valid_mask);
> -       gc->irq.valid_mask =3D NULL;
> +       gpiochip_free_mask(&gc->irq.valid_mask);
>  }
>
>  bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
> --
> 2.40.0.1.gaa8946217a0b
>

Both applied, thanks!

Bart
