Return-Path: <linux-gpio+bounces-319-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EF07F301F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 15:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A705282B6F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 14:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7158254F86;
	Tue, 21 Nov 2023 14:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v+9lvydv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0754ED7B
	for <linux-gpio@vger.kernel.org>; Tue, 21 Nov 2023 06:02:52 -0800 (PST)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-4ac0719457bso3918481e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Nov 2023 06:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700575371; x=1701180171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kuDLXOAe1QyzdDIX4EdIhqwiU+ElVxLRkCe4xLHmOE=;
        b=v+9lvydvQbJPXybPSxqONEmt8yK9yo8l6IOQf1e+3MgIxjewhltTap+Uj6+VvZDtzh
         nNablBUSiSS0usuDU9/Y0jIh6625meMtHILtKr44M6ZrujKUOw0JgA6GAFa0wcnSazLC
         D8LlTIF3Q29bs+tDQsmSvIrM7BsfBWjwrAUCidl4R/p4qeo1VUTT71mBfejRZLyQLFfd
         f1zSWzP/OsCwdvQFdd8cq/F0BiFJMpWvKD4QTEfKWKiBrdH4R1svWgK6BYszFRKnzmLR
         diloeYPzwmcD9TXDDS8m9uBgZFXghGwA0WBvbfpWYREpFMUhKx1QRmIg77ZtMZ8lpD1u
         nWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700575371; x=1701180171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kuDLXOAe1QyzdDIX4EdIhqwiU+ElVxLRkCe4xLHmOE=;
        b=bBfSauWKwnVpVhXrq8J5GGd0yCV+RKs0S3aSZUGKH90F+82TaxlVxZix4hor+JmXjD
         7cPl0evFpsNcTmvbH4Uas+y9LkfyeQpHCiVPSVcT5z5a62FD8aqeh3HAHcg5X8lN5Vuk
         fKnpk0iKyS7LRh+VajIka0QJLGfuf6YsLg8ZrpRxlEPs4hBFh2y5Ke3jmFydhfx+LOq4
         RQrKQqOMuv2FehHmYjQy89jfxLZdxSsAEEG7Tzl21hEvZ3mNjUZm6+u/QuMzmaijFSSk
         KAccdW60m/zsoMJ6eEeoD6Rvb21lKnq8NkIbiJL81kBE5tBC4tfH6posmzf4t7sD6BQd
         udzw==
X-Gm-Message-State: AOJu0YxnMIFTqA9jOhV9cN3ODiY39gxhtlz462p4Wh1wb/PZmvUYbIW+
	6q8Z+0cgCfNdgmgDHrQhAkAnBLcJzyUJUVPkul5zojY/aSuh/4SA
X-Google-Smtp-Source: AGHT+IHFDxHkMTJc+f97H6sbwYWfFNyFHuJn7bJnLxcsGK+ZH5Q1igcrDpDBwRRM9/5Iwlu79DRXWaiXN4TdtHtN7TI=
X-Received: by 2002:a1f:e082:0:b0:4ab:ebf3:e518 with SMTP id
 x124-20020a1fe082000000b004abebf3e518mr2879232vkg.1.1700575371031; Tue, 21
 Nov 2023 06:02:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de> <20231121134901.208535-101-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231121134901.208535-101-u.kleine-koenig@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Nov 2023 15:02:39 +0100
Message-ID: <CAMRc=MdSc3emU+AJpCni6is0qsmR9HcqysSL33gpAmb8JTnjVA@mail.gmail.com>
Subject: Re: [PATCH v3 100/108] gpio: mvebu: Make use of devm_pwmchip_alloc() function
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 2:52=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> This prepares the pwm sub-driver to further changes of the pwm core
> outlined in the commit introducing devm_pwmchip_alloc(). There is no
> intended semantical change and the driver should behave as before.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpio/gpio-mvebu.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index a13f3c18ccd4..02c8382b4dd2 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -99,7 +99,6 @@ struct mvebu_pwm {
>         u32                      offset;
>         unsigned long            clk_rate;
>         struct gpio_desc        *gpiod;
> -       struct pwm_chip          chip;
>         spinlock_t               lock;
>         struct mvebu_gpio_chip  *mvchip;
>
> @@ -615,7 +614,7 @@ static const struct regmap_config mvebu_gpio_regmap_c=
onfig =3D {
>   */
>  static struct mvebu_pwm *to_mvebu_pwm(struct pwm_chip *chip)
>  {
> -       return container_of(chip, struct mvebu_pwm, chip);
> +       return pwmchip_priv(chip);
>  }
>
>  static int mvebu_pwm_request(struct pwm_chip *chip, struct pwm_device *p=
wm)
> @@ -789,6 +788,7 @@ static int mvebu_pwm_probe(struct platform_device *pd=
ev,
>  {
>         struct device *dev =3D &pdev->dev;
>         struct mvebu_pwm *mvpwm;
> +       struct pwm_chip *chip;
>         void __iomem *base;
>         u32 offset;
>         u32 set;
> @@ -813,9 +813,11 @@ static int mvebu_pwm_probe(struct platform_device *p=
dev,
>         if (IS_ERR(mvchip->clk))
>                 return PTR_ERR(mvchip->clk);
>
> -       mvpwm =3D devm_kzalloc(dev, sizeof(struct mvebu_pwm), GFP_KERNEL)=
;
> -       if (!mvpwm)
> -               return -ENOMEM;
> +       chip =3D devm_pwmchip_alloc(dev, mvchip->chip.ngpio, sizeof(struc=
t mvebu_pwm));
> +       if (IS_ERR(chip))
> +               return PTR_ERR(chip);
> +       mvpwm =3D pwmchip_priv(chip);
> +
>         mvchip->mvpwm =3D mvpwm;
>         mvpwm->mvchip =3D mvchip;
>         mvpwm->offset =3D offset;
> @@ -868,13 +870,11 @@ static int mvebu_pwm_probe(struct platform_device *=
pdev,
>                 return -EINVAL;
>         }
>
> -       mvpwm->chip.dev =3D dev;
> -       mvpwm->chip.ops =3D &mvebu_pwm_ops;
> -       mvpwm->chip.npwm =3D mvchip->chip.ngpio;
> +       chip->ops =3D &mvebu_pwm_ops;
>
>         spin_lock_init(&mvpwm->lock);
>
> -       return devm_pwmchip_add(dev, &mvpwm->chip);
> +       return devm_pwmchip_add(dev, chip);
>  }
>
>  #ifdef CONFIG_DEBUG_FS
> --
> 2.42.0
>

Eh... I had a talk at LPC where I explained why I really dislike this
approach but I guess this ship has sailed now and it's not a subsystem
where I have any say anyway.

It's not clear in the cover letter - are these patches supposed to go
through their respective subsystem trees?

Bart

