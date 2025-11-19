Return-Path: <linux-gpio+bounces-28757-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AD4C6F1B8
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 641D14F451D
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 13:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779DE3563E0;
	Wed, 19 Nov 2025 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wr0WYZMb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C9834F262
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 13:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763559704; cv=none; b=lpNSIarNi1JFuY1zXtjLqihzqHHZAaueMz2Rqxuj0QIPg+T+kwhPGlrqjZdZiEdPcPjREQB6PKahvji43txR1vvsO4IZtUyp868Vyp7IFxEAWSNPmO0orCqw41OvKt/hL0eD8Q+7KSFWAoCL+a8Lb/+qhuhTpdhcOpm/kSNEPyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763559704; c=relaxed/simple;
	bh=zghv8sZhWsnolTo7480wNk1G/86bgD4G5e4W5Aw1gGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNwU4GetOkQKgnJo6gsX29Crx0/tJbWWL4Nh1o1UkWgkdAJhQdhXUJlRkQqb8e7ka8wAFFjtJsTzltgWAy5ak+39J3g5ygkmmpMH9w6AC3FIE+rNVyN0gFh/Jbj6AeabfBXyat32rChOfI9cEaGMbOyNAxnXj9Z4oo5mL2o2wgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wr0WYZMb; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5958931c9c7so5436569e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 05:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763559700; x=1764164500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DE3M+R2tWfO+puL9+yor3rLgVKtJoMi0ExEhZeDNPlA=;
        b=wr0WYZMbaHbZUhW00bn51W/WvAMtfAXKN/xFKiZSWB/Cd7+1X56x7HluP6l99oj+0p
         xvwb/B78S8qvVKflKE0cN2HZ/Z/x6WprH9cwo7uxML2yDQnxevIuB5f0yUm+UHjXWMKB
         7DZ1q6Al51Ai7q85JZqiYAx5vOF4HxghxKynJLJsr9ps3Waogh1XyCl1bCDGwGFHXMF3
         A5s0edMrl4/OEu9/LOAVe0VzZuSKM1k5ZBzWIndOdQiVwusAQxt38hfCEQQof7kcW8dK
         Y12OY4n9jD/NqJABSLNm1yIHhkAkCoaj9W7aYJfZaYYYWcMJs0SdRStIYqry9AsRg+zb
         Zjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763559700; x=1764164500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DE3M+R2tWfO+puL9+yor3rLgVKtJoMi0ExEhZeDNPlA=;
        b=NX82kynVFtC9pR3kxgi/VYHk2l6afH5EbyaR6tIZOqsPjl0G4LPYOtKnYFM1d82R/4
         LZp48IxJ1a+52AEJdQbPW1xeb2ahq2YRqFM3zmZgGgdWffthoYaTd7SxdmM4qbtjMrVz
         3qlwbk7SMXO/NaBtry05BsJgVBc7RBNAV9xIs+haRgqGFxQEaoltF2BoT0qLbfoO/ORF
         t3SrS4f3b9rt3J/AQluZackVRbLhH9LHA/g+kXPK3aO3NYa7uEWTyw0SuP/DJvmo0L1O
         kRCoCuN1OAH3K/OE8GxhMTyisWqPG3NAFt96PHRwxIZh3hMVYNWQldudXG0qi5aBrjb9
         U4xw==
X-Forwarded-Encrypted: i=1; AJvYcCU9LOVvjLs3U5CG4thM4lNT6UxCdnAJzyZwb7SsAy3ZM8GWBXhLfqTlVAaanbeRYf/Fo7p+psjKUqYO@vger.kernel.org
X-Gm-Message-State: AOJu0YwVha6tbjf+nu49J8chJTpP7OWwIR0UsGnpKode2/zZVhlqaSpS
	5aNiv8aYUNISa6rzwnEKOZ6iLlR4K6+cUnZQ+Yk7GPCGSXL5hrBqZ2O5jkLD53O38kDI+ykS6wI
	qYI4fzttxJK3+aqzKRDHujBQsE+kPrfB4AEY2NpjFAw==
X-Gm-Gg: ASbGncuylpKXPI2bxEqPXvLIkKrmci0YALN8cIGs5CRsz1qAEuQFNdf2ifD64Wgr81r
	sdDUXa/CZG5iPKEtnLjmZzyKLOTSTOoRYrV8zSJ8f5RBiPYhpg/RX8dbRqvB7SGeXbCrU4cGqIG
	LZeGrRRrQwyfQ5jvQLg3rhGqf4Y3C/r8u2uu7dLA94XaV75AW1fl+rEhmgO24vjvjXFHp7UQ1kB
	dSjkJkmKoE8UpjSo4TygxbUPrBtaWfzHaicpo2iWC9BRO+6kQdi8ldxzUlaNeS2c1xJebF2CXjA
	9AQ1cr53aInxN5sJCTjHtJIHnHKOBOyIA0w+LQ==
X-Google-Smtp-Source: AGHT+IFDvKi+fywboPfW1mg41wUDzIJJk2ii8/GksATXflJNxXalp3qxaeyONEJx9rALX0Uw/MHHiVkcBz7VcYUYTj4=
X-Received: by 2002:a05:6512:114f:b0:595:81c1:c55 with SMTP id
 2adb3069b0e04-5958419f6e1mr7724347e87.8.1763559700513; Wed, 19 Nov 2025
 05:41:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119130914.7431-1-jszhang@kernel.org>
In-Reply-To: <20251119130914.7431-1-jszhang@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 14:41:28 +0100
X-Gm-Features: AWmQ_bmpNOQNSC8HIIBfHofH5dx_DvIm0PLBHKs-if2Em_Jh9HG1jrAm0vl2E04
Message-ID: <CAMRc=McxjLYDWzKFm4FzNkDR_Com=8ODc7DuvXihtbOR8mEFag@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: fxl6408: Add suspend/resume support
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 2:27=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Currently, during suspend, do nothing; during resume, just sync the
> regmap cache to hw regs.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>
> since v2:
>   - drop the reset pin support patch since no users now
>
> since v1:
>   -fix W=3D1 build error on nios2 platform
>
>  drivers/gpio/gpio-fxl6408.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
> index 86ebc66b1104..165c48e9cb9c 100644
> --- a/drivers/gpio/gpio-fxl6408.c
> +++ b/drivers/gpio/gpio-fxl6408.c
> @@ -43,6 +43,10 @@
>
>  #define FXL6408_NGPIO                  8
>
> +struct fxl6408_chip {
> +       struct regmap *regmap;
> +};

I would simplify the patch by roughly 50% by dropping this wrapper
structure. I know it's less future-proof but it doesn't seem that
we'll need more fields here anytime soon. We can cross that bridge
when we get there.

> +
>  static const struct regmap_range rd_range[] =3D {
>         { FXL6408_REG_DEVICE_ID, FXL6408_REG_DEVICE_ID },
>         { FXL6408_REG_IO_DIR, FXL6408_REG_OUTPUT },
> @@ -104,6 +108,7 @@ static int fxl6408_identify(struct device *dev, struc=
t regmap *regmap)
>  static int fxl6408_probe(struct i2c_client *client)
>  {
>         struct device *dev =3D &client->dev;
> +       struct fxl6408_chip *chip;
>         int ret;
>         struct gpio_regmap_config gpio_config =3D {
>                 .parent =3D dev,
> @@ -114,6 +119,10 @@ static int fxl6408_probe(struct i2c_client *client)
>                 .ngpio_per_reg =3D FXL6408_NGPIO,
>         };
>
> +       chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +       if (!chip)
> +               return -ENOMEM;

That would go away.

> +
>         gpio_config.regmap =3D devm_regmap_init_i2c(client, &regmap);
>         if (IS_ERR(gpio_config.regmap))
>                 return dev_err_probe(dev, PTR_ERR(gpio_config.regmap),
> @@ -123,6 +132,9 @@ static int fxl6408_probe(struct i2c_client *client)
>         if (ret)
>                 return ret;
>
> +       chip->regmap =3D gpio_config.regmap;

That too.

> +       i2c_set_clientdata(client, chip);

You'd just do i2c_set_clientdata(client, gpio_config.regmap) here.

> +
>         /* Disable High-Z of outputs, so that our OUTPUT updates actually=
 take effect. */
>         ret =3D regmap_write(gpio_config.regmap, FXL6408_REG_OUTPUT_HIGH_=
Z, 0);
>         if (ret)
> @@ -131,6 +143,16 @@ static int fxl6408_probe(struct i2c_client *client)
>         return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_confi=
g));
>  }
>
> +static int fxl6408_resume(struct device *dev)
> +{
> +       struct fxl6408_chip *chip =3D dev_get_drvdata(dev);
> +
> +       regcache_mark_dirty(chip->regmap);
> +       return regcache_sync(chip->regmap);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(fxl6408_pm_ops, NULL, fxl6408_resume);
> +
>  static const __maybe_unused struct of_device_id fxl6408_dt_ids[] =3D {
>         { .compatible =3D "fcs,fxl6408" },
>         { }
> @@ -146,6 +168,7 @@ MODULE_DEVICE_TABLE(i2c, fxl6408_id);
>  static struct i2c_driver fxl6408_driver =3D {
>         .driver =3D {
>                 .name   =3D "fxl6408",
> +               .pm     =3D pm_sleep_ptr(&fxl6408_pm_ops),
>                 .of_match_table =3D fxl6408_dt_ids,
>         },
>         .probe          =3D fxl6408_probe,
> --
> 2.51.0
>

Bart

