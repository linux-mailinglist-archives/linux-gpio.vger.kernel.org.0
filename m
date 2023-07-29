Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67C20767FF9
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jul 2023 16:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231847AbjG2OJx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jul 2023 10:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbjG2OJw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jul 2023 10:09:52 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2311BDC
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jul 2023 07:09:51 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-56c711a889dso901998eaf.0
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jul 2023 07:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690639791; x=1691244591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RmxcNox/frvpzrwX0/ULtIQgfi+8KX26rxr1Y2GMRc=;
        b=X10af/E8aoHH1Wq1gOdppTIB4huI618dP5ytU8IcpRTzEiyh6S2tOXftjIWDxmMKs9
         ZsPrD+LxZhtWEIc+0UaWF3ldwjsd/wiqzHvIvT7LBa2ub0+Ubwmr7niwVDt5jgtXFw8E
         iZo8FY3kXTHOyF1ZwNcvSsMypwbDRmdAdnYnH44hXujpP+VXLuMvrGCdWKeDQIbEtjCm
         K4bRikY+NdK5V8pNVuKYlG59XiqmtFs9rxtDt4g+1Q+fU3Mz/GnYFtXHQs1/QaYa1WjJ
         xAGrjF3fmOwX14zJ/3Eqqiwjlc0gB5BuhpjRwF40MQYO61c6e3T4WmXg9mQY1iE+xgYy
         ZSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690639791; x=1691244591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RmxcNox/frvpzrwX0/ULtIQgfi+8KX26rxr1Y2GMRc=;
        b=XRx4wUUlBDMeC5Wn5WwFf0KoO8wb1w/kRrqNZVSlYtRklb7x5co9pVnyyhCKrSYgET
         qEk24jetE8wot2tfSDnjLB9ApGszr5/FHHd6sx90SQIghIf14JLcEd1FdDesOP5LwgPi
         GO6/Ruj6bklNTSSSlltwffprupLgbyfIviOZfRiIkdq4SAs7uOj9wVUdApq0JcchOMyc
         9149T6WPOli4fteSHl0TcCc148fOJBARCwxMBV5cjJQhegEP8aWSJv61AsSQO4Vt3euA
         mE6VeNRk+5uP6n9bpV25uQV3Yrirn4oRgxQibw4En73KjOAX1q1b2Mn8AYNdXKHCXL4X
         p8aA==
X-Gm-Message-State: ABy/qLY+PfZR4e9G9AsvWhNbQ1BFtYt0iSqL81TlpGYcjaosv5MhAG4b
        ramLMNlcWLQkuUpAJGTiWaBy+KSZCYkUYCQYlIgLgg==
X-Google-Smtp-Source: APBJJlGib/ZbiUSNOH20y2tKPA0Q5OdrL6i91XiJAXggCbP1Yc23iSZ2j0MmJdG0nN2otE3D8WS2Yod2ItlKMJ1p+pQ=
X-Received: by 2002:a05:6358:918e:b0:135:62de:ff7d with SMTP id
 j14-20020a056358918e00b0013562deff7dmr4740060rwa.8.1690639791048; Sat, 29 Jul
 2023 07:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230718181849.3947851-1-u.kleine-koenig@pengutronix.de> <20230718181849.3947851-19-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230718181849.3947851-19-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 29 Jul 2023 16:09:40 +0200
Message-ID: <CAMRc=MfGWvAGYAh8q7mOenGDMpKS3q7UK7-Yxw5bn1avhoQ-UQ@mail.gmail.com>
Subject: Re: [PATCH 18/18] gpio: mvebu: Make use of devm_pwmchip_alloc() function
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>, linux-pwm@vger.kernel.org,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 18, 2023 at 8:19=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> This prepares the pwm sub-driver to further changes of the pwm core
> outlined in the commit introducing devm_pwmchip_alloc(). There is no
> intended semantical change and the driver should behave as before.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpio/gpio-mvebu.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index a35958e7adf6..9557cac807f9 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -98,7 +98,6 @@ struct mvebu_pwm {
>         u32                      offset;
>         unsigned long            clk_rate;
>         struct gpio_desc        *gpiod;
> -       struct pwm_chip          chip;
>         spinlock_t               lock;
>         struct mvebu_gpio_chip  *mvchip;
>
> @@ -614,7 +613,7 @@ static const struct regmap_config mvebu_gpio_regmap_c=
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
> +       chip =3D devm_pwmchip_alloc(dev, sizeof(struct mvebu_pwm));
> +       if (!chip)
>                 return -ENOMEM;
> +       mvpwm =3D pwmchip_priv(chip);
> +
>         mvchip->mvpwm =3D mvpwm;
>         mvpwm->mvchip =3D mvchip;
>         mvpwm->offset =3D offset;
> @@ -868,13 +870,12 @@ static int mvebu_pwm_probe(struct platform_device *=
pdev,
>                 return -EINVAL;
>         }
>
> -       mvpwm->chip.dev =3D dev;
> -       mvpwm->chip.ops =3D &mvebu_pwm_ops;
> -       mvpwm->chip.npwm =3D mvchip->chip.ngpio;
> +       chip->ops =3D &mvebu_pwm_ops;
> +       chip->npwm =3D mvchip->chip.ngpio;
>
>         spin_lock_init(&mvpwm->lock);
>
> -       return devm_pwmchip_add(dev, &mvpwm->chip);
> +       return devm_pwmchip_add(dev, chip);
>  }
>
>  #ifdef CONFIG_DEBUG_FS
> --
> 2.39.2
>

Looks good to me (although I have my reservations about the concept of
foo_alloc() for subsystems in the kernel...). How do you want this to
go upstream?

Bart
