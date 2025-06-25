Return-Path: <linux-gpio+bounces-22181-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A14AE8224
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 13:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 305881647ED
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 11:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2C325F998;
	Wed, 25 Jun 2025 11:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="x9ey9EOE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C70E25D8FB
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750852446; cv=none; b=q1vQlpWSXjfPgi5Qc/z67pJSnaRuWeCICtEeKKxSgo5roVp1oq2sHOfSSb/K8p8dN93B/GDUOMU+9ol0azmhV5l5U8NY2fZdV6+7ruNmlQqiOuCF0Su+XOui+P15ul367FTClhOdBKicXdtvVp43ty3B1joYfX4Vb44UQFGjboo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750852446; c=relaxed/simple;
	bh=KhjX0z/51Fw3l+Xei6RSm8mmvRTHdgxdtyEdZ0C+96o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dnNtpw8tjCcugfu5CDm2L2AQl9NEaSWvs3o39vcvgxbISlOy6m6IH5bh5EyfrRvbsiJSqWn0RqpivF5/0n3ngGSEFZXOwzTunn7Oc95wNVotqlj/7ZRb5O0rWAlviMqtv3+3GeRckHD6AgF1kGFYYjZuiV+MzrhVtWLxi3Z2xPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=x9ey9EOE; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553dceb342fso1310913e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 04:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750852443; x=1751457243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjmCX0VZd6PcKfJiZ+sWk0vCJKxEzzMlbheiZOncprA=;
        b=x9ey9EOEKPSc6si0NmjpDEogROldI/ReqUrke4YFpkrGwKmVvq9mzW29mN6QMP43VI
         CATd4MCmoqBDUdchAdWwIQj+EcmWG1Brj+b19lqnYLHPAsXcr2arvANBSAXhJcFHx15J
         szurGdjO0FDKaMv4+W/WIXKMTMTo7jWel9Wk2kBTp8EsfpCuOzxsuQoLXBS17m2sYiFv
         UfTzSl/Jv43J6N9OtnzJKNP3YbmdwR9f7Sw8lFUhBlga+1wxA/Y66Y3rCI3vDm0DaqjK
         icZuhfYUjHrPMnyD9GS7N51vYJ2KSo2F/Ok/mXL9UELms0s6hD9hJLyLFLWLdGh3Hn6k
         aUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852443; x=1751457243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjmCX0VZd6PcKfJiZ+sWk0vCJKxEzzMlbheiZOncprA=;
        b=GDa6JKatzgZRs2PWOzOlg03imMxYTBPT5JkwkK4he9ULu61OxphTxS5VgdYoXYA5nM
         cuLBbh0WrrDc7uQstFM+qTvy4QQI3oMqNh3anwGsAhJ8MkoNKTe+wYvq9MqqQQ2ej854
         1yM1t7CZ5aX0DwwLUipv4e+yYO47ItKD++Bxwbeoak2Be5enSZP5/gcZH2Ri33R6M3EP
         KBWMfQm1xOwbSDnx5ypHfBuuvI64SATo3xVmsXu113a/u/QvssHALhVqWAidQDby8/hf
         zSb559s/MPbke47k91wlkg3cdqzRZ7m+JQHs5zXkFc9Lrp0WSBDJkh6ng2A59Nw66DbT
         hykw==
X-Gm-Message-State: AOJu0Yz3vmO9vMzjlfsmSftEltiq7D7L87ce31QiEd9wN5+890EUnKDZ
	jKJ9vpScKIYLJu6cHPwBHJkVq/NMKNszm0sRYcTlTFkGVX886z2VurdylrVfmL1SsIgISlncZWn
	tefLonC3TwsaKh7m0yaxNUt6UWbc+w0cemW96ur18KA+WZfxniPSJxyA=
X-Gm-Gg: ASbGncsvbslLnanZOExOkQRLGbX8IfJlRfppDNQry1rSvNRK/6PYtcqwZ9XiyXKiAxX
	zFiYusEHWvMOZEwRpWCou8PTB3aTYAu6CHsZA04lb85cdcCvCXZt/BL/aW/dG4CzLw9LE7FroVP
	PnEFbz5OVTSsoT/ZCO0CF45zxxvWdI+d6iINquGhSvTLqSw21kUTmQRpDHKwJhkCe/0KB5fAeci
	6lI7t6L5kFGJw==
X-Google-Smtp-Source: AGHT+IG7vJ6YkF8QoC86ukAvRHZZSW1pd7N0dFNcJmYfYNXgLyGFwTscyXL7CfcB+VIo/tRZI5deZqZrhh6EwIWpdDY=
X-Received: by 2002:a05:6512:10c6:b0:54e:81ec:2c83 with SMTP id
 2adb3069b0e04-554fdd1922bmr791851e87.18.1750852442530; Wed, 25 Jun 2025
 04:54:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617204402.33656-1-mariagarcia7293@gmail.com> <20250617204402.33656-3-mariagarcia7293@gmail.com>
In-Reply-To: <20250617204402.33656-3-mariagarcia7293@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 13:53:51 +0200
X-Gm-Features: Ac12FXz26V1TlzuQHhzVNzW3ioRsrkP7zJrftKmu_1mlzVnvngnceRHvxPQKwoc
Message-ID: <CAMRc=Mftput7DO+nmOA0yMcB0SvtsDf5U25ukkMVuOnV4XfX=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: pca953x: Add support for TI TCA6418
To: Maria Garcia <mariagarcia7293@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maria Garcia <mgarcia@qblox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 10:44=E2=80=AFPM Maria Garcia <mariagarcia7293@gmai=
l.com> wrote:
>
> The TI TCA6418 is a 18-channel I2C I/O expander. It is slightly
> different to other models from the same family, such as TCA6416,
> but has enough in common with them to make it work with just a
> few tweaks, which are explained in the code's documentation.
>
> Signed-off-by: Maria Garcia <mariagarcia7293@gmail.com>
> ---

Thanks, looks good overall. Just a few nits below.

>
> +/* Helper function to get the correct bit mask for a given offset and ch=
ip type.
> + * The TCA6418's input, output, and direction banks have a peculiar bit =
order:
> + * the first byte uses reversed bit order, while the second byte uses st=
andard order.
> + */
> +static inline u8 pca953x_get_bit_mask(struct pca953x_chip *chip, unsigne=
d int offset)
> +{
> +       unsigned int bit_pos_in_bank =3D offset % BANK_SZ;
> +       int msb =3D BANK_SZ - 1;
> +
> +       if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA6418_TYPE && offse=
t <=3D msb)
> +               return BIT(msb - bit_pos_in_bank);
> +       else
> +               return BIT(bit_pos_in_bank);

No need for else.

>  static bool pca953x_readable_register(struct device *dev, unsigned int r=
eg)
>  {
>         struct pca953x_chip *chip =3D dev_get_drvdata(dev);
> @@ -362,6 +407,9 @@ static bool pca953x_readable_register(struct device *=
dev, unsigned int reg)
>                 bank =3D PCA957x_BANK_INPUT | PCA957x_BANK_OUTPUT |
>                        PCA957x_BANK_POLARITY | PCA957x_BANK_CONFIG |
>                        PCA957x_BANK_BUSHOLD;
> +       } else if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA6418_TYPE) =
{
> +               /* BIT(0) to indicate read access */
> +               return tca6418_check_register(chip, reg, BIT(0));
>         } else {
>                 bank =3D PCA953x_BANK_INPUT | PCA953x_BANK_OUTPUT |
>                        PCA953x_BANK_POLARITY | PCA953x_BANK_CONFIG;
> @@ -384,6 +432,9 @@ static bool pca953x_writeable_register(struct device =
*dev, unsigned int reg)
>         if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D PCA957X_TYPE) {
>                 bank =3D PCA957x_BANK_OUTPUT | PCA957x_BANK_POLARITY |
>                         PCA957x_BANK_CONFIG | PCA957x_BANK_BUSHOLD;
> +       } else if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA6418_TYPE) =
{
> +               /* BIT(1) for write access */
> +               return tca6418_check_register(chip, reg, BIT(1));
>         } else {
>                 bank =3D PCA953x_BANK_OUTPUT | PCA953x_BANK_POLARITY |
>                         PCA953x_BANK_CONFIG;

Can you convert these to a switch statement for better readability? I
have a slight preference for cases over ifelserry.

> @@ -403,6 +454,9 @@ static bool pca953x_volatile_register(struct device *=
dev, unsigned int reg)
>
>         if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D PCA957X_TYPE)
>                 bank =3D PCA957x_BANK_INPUT;
> +       else if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA6418_TYPE)
> +               /* BIT(2) for volatile access */
> +               return tca6418_check_register(chip, reg, BIT(2));
>         else
>                 bank =3D PCA953x_BANK_INPUT;
>
> @@ -489,6 +543,15 @@ static u8 pcal6534_recalc_addr(struct pca953x_chip *=
chip, int reg, int off)
>         return pinctrl + addr + (off / BANK_SZ);
>  }
>
> +static u8 tca6418_recalc_addr(struct pca953x_chip *chip, int reg_base, i=
nt offset)
> +{
> +       /* reg_base will be TCA6418_INPUT, TCA6418_OUTPUT, or TCA6418_DIR=
ECTION
> +        * offset is the global GPIO line offset (0-17)
> +        * BANK_SZ is 8 for TCA6418 (8 bits per register bank)
> +        */

Please use regular kernel comments, not the networking style.

> +       return reg_base + (offset / BANK_SZ);
> +}
> +
>  static int pca953x_write_regs(struct pca953x_chip *chip, int reg, unsign=
ed long *val)
>  {
>         u8 regaddr =3D chip->recalc_addr(chip, reg, 0);
> @@ -529,11 +592,14 @@ static int pca953x_gpio_direction_input(struct gpio=
_chip *gc, unsigned off)
>  {
>         struct pca953x_chip *chip =3D gpiochip_get_data(gc);
>         u8 dirreg =3D chip->recalc_addr(chip, chip->regs->direction, off)=
;
> -       u8 bit =3D BIT(off % BANK_SZ);
> +       u8 bit =3D pca953x_get_bit_mask(chip, off);
>
>         guard(mutex)(&chip->i2c_lock);
>
> -       return regmap_write_bits(chip->regmap, dirreg, bit, bit);
> +       if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA6418_TYPE)
> +               return regmap_write_bits(chip->regmap, dirreg, bit, 0);
> +       else
> +               return regmap_write_bits(chip->regmap, dirreg, bit, bit);
>  }
>

No need for else.

>  static int pca953x_gpio_direction_output(struct gpio_chip *gc,
> @@ -542,7 +608,7 @@ static int pca953x_gpio_direction_output(struct gpio_=
chip *gc,
>         struct pca953x_chip *chip =3D gpiochip_get_data(gc);
>         u8 dirreg =3D chip->recalc_addr(chip, chip->regs->direction, off)=
;
>         u8 outreg =3D chip->recalc_addr(chip, chip->regs->output, off);
> -       u8 bit =3D BIT(off % BANK_SZ);
> +       u8 bit =3D pca953x_get_bit_mask(chip, off);
>         int ret;
>
>         guard(mutex)(&chip->i2c_lock);
> @@ -552,15 +618,20 @@ static int pca953x_gpio_direction_output(struct gpi=
o_chip *gc,
>         if (ret)
>                 return ret;
>
> -       /* then direction */
> -       return regmap_write_bits(chip->regmap, dirreg, bit, 0);
> +       /* then direction
> +        * (in/out logic is inverted on TCA6418)
> +        */
> +       if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA6418_TYPE)
> +               return regmap_write_bits(chip->regmap, dirreg, bit, bit);
> +       else
> +               return regmap_write_bits(chip->regmap, dirreg, bit, 0);
>  }

Same here.

>
>  static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
>  {
>         struct pca953x_chip *chip =3D gpiochip_get_data(gc);
>         u8 inreg =3D chip->recalc_addr(chip, chip->regs->input, off);
> -       u8 bit =3D BIT(off % BANK_SZ);
> +       u8 bit =3D pca953x_get_bit_mask(chip, off);
>         u32 reg_val;
>         int ret;
>
> @@ -577,7 +648,7 @@ static int pca953x_gpio_set_value(struct gpio_chip *g=
c, unsigned int off,
>  {
>         struct pca953x_chip *chip =3D gpiochip_get_data(gc);
>         u8 outreg =3D chip->recalc_addr(chip, chip->regs->output, off);
> -       u8 bit =3D BIT(off % BANK_SZ);
> +       u8 bit =3D pca953x_get_bit_mask(chip, off);
>
>         guard(mutex)(&chip->i2c_lock);
>
> @@ -588,7 +659,7 @@ static int pca953x_gpio_get_direction(struct gpio_chi=
p *gc, unsigned off)
>  {
>         struct pca953x_chip *chip =3D gpiochip_get_data(gc);
>         u8 dirreg =3D chip->recalc_addr(chip, chip->regs->direction, off)=
;
> -       u8 bit =3D BIT(off % BANK_SZ);
> +       u8 bit =3D pca953x_get_bit_mask(chip, off);
>         u32 reg_val;
>         int ret;
>
> @@ -597,10 +668,17 @@ static int pca953x_gpio_get_direction(struct gpio_c=
hip *gc, unsigned off)
>         if (ret < 0)
>                 return ret;
>
> -       if (reg_val & bit)
> +       /* (in/out logic is inverted on TCA6418) */
> +       if (reg_val & bit) {
> +               if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA6418_TYPE)
> +                       return GPIO_LINE_DIRECTION_OUT;
> +               else
> +                       return GPIO_LINE_DIRECTION_IN;

Same here.

> +       }
> +       if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA6418_TYPE)
>                 return GPIO_LINE_DIRECTION_IN;
> -
> -       return GPIO_LINE_DIRECTION_OUT;
> +       else
> +               return GPIO_LINE_DIRECTION_OUT;


And here.

>  }
>
>  static int pca953x_gpio_get_multiple(struct gpio_chip *gc,
> @@ -1120,6 +1198,11 @@ static int pca953x_probe(struct i2c_client *client=
)
>         if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D PCAL653X_TYPE) {
>                 chip->recalc_addr =3D pcal6534_recalc_addr;
>                 chip->check_reg =3D pcal6534_check_register;
> +       }  else if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA6418_TYPE)=
 {
> +               chip->recalc_addr =3D tca6418_recalc_addr;
> +               /* We don't assign chip->check_reg =3D tca6418_check_regi=
ster directly here.
> +                * Instead, the wrappers handle the dispatch based on PCA=
_CHIP_TYPE.
> +                */
>         } else {
>                 chip->recalc_addr =3D pca953x_recalc_addr;
>                 chip->check_reg =3D pca953x_check_register;
> @@ -1157,6 +1240,8 @@ static int pca953x_probe(struct i2c_client *client)
>         if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D PCA957X_TYPE) {
>                 chip->regs =3D &pca957x_regs;
>                 ret =3D device_pca957x_init(chip);
> +       } else if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA6418_TYPE) =
{
> +               chip->regs =3D &tca6418_regs;
>         } else {

Same thing about if-elses.

>                 chip->regs =3D &pca953x_regs;
>                 ret =3D device_pca95xx_init(chip);
> @@ -1325,6 +1410,7 @@ static const struct of_device_id pca953x_dt_ids[] =
=3D {
>         { .compatible =3D "ti,pca9536", .data =3D OF_953X( 4, 0), },
>         { .compatible =3D "ti,tca6408", .data =3D OF_953X( 8, PCA_INT), }=
,
>         { .compatible =3D "ti,tca6416", .data =3D OF_953X(16, PCA_INT), }=
,
> +       { .compatible =3D "ti,tca6418", .data =3D (void *)(18 | TCA6418_T=
YPE | PCA_INT), },
>         { .compatible =3D "ti,tca6424", .data =3D OF_953X(24, PCA_INT), }=
,
>         { .compatible =3D "ti,tca9535", .data =3D OF_953X(16, PCA_INT), }=
,
>         { .compatible =3D "ti,tca9538", .data =3D OF_953X( 8, PCA_INT), }=
,
> --
> 2.43.0
>

Bartosz

