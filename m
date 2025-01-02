Return-Path: <linux-gpio+bounces-14409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D6C9FF9A9
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 14:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F92B7A1A55
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 13:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22171AC453;
	Thu,  2 Jan 2025 13:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="unj4czxx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53DF17996
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jan 2025 13:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735823371; cv=none; b=sYUBU0FEHOTt5Vv2zHPP8NZQT62ey4okuZTHmHvzGtzrszVsMwJ6amJPgpDdoCpcPuwedGGibX7JC+6jO7jPexJJ/kH8M7a9/2g2uxUFDuXlBZ5kOF8o7Ab11Pp3IEeK15SigA3Zs6ZSW33tJnvycUtDJxm9aroODtA792Sn7fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735823371; c=relaxed/simple;
	bh=dE92OnHX5S1ui/n3eT4Y9ZcmhMoUykyiUCHwXyI4cXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QjQTdvW2QzADFCuB1VON4KxO1JuDjm3laRkQWrDLBSiTCC34+x+bRtCOtcNz0GQT9p0p6vChyWsqg4JyKSSO5ke8boQmhP884GRhK5dwBXtqwHCRk24TxLzUR+l367MNz58XJmGwZa37plk4z5lHLdRgS6LBBPKJwncx4w2629M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=unj4czxx; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54024aa9febso12737697e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2025 05:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1735823368; x=1736428168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WLgz5kxC6bt2VqLpem97LlGhhdbJBpCaME7jurWBVk=;
        b=unj4czxxz61xxJMx4d774F06jwfHMdFAjUZ2auA3tmzgrwRE8MfkHJ9b7xyfE3GvJ6
         gWFviKIZK75PV4A82cGInkcAHFHhzR3R0KV9HC2MKu7gCpW7fWolWbHaJFfq4yac4m0h
         iujzkVSCRI1KSUVP7gbdcZtT06+VqYvPxEiEaCJ9U8QoYxt8t6TbsK1Y8NS3LuV34/A+
         AE5E5N0WcyqELR2yoSl1xyaTxhVaUCkfsyDUIaObGc0XRR8W3XBIU+AzV+TQVbpwWqc+
         o16w0DJ9SWzjv6Tvjw7wcB9rw4/j3RhB7U9TLciSF0GhV/iiMrEBSt6m0fl0oiLExrGm
         /x/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735823368; x=1736428168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WLgz5kxC6bt2VqLpem97LlGhhdbJBpCaME7jurWBVk=;
        b=vaYzlem13zW+AnM+2iUtHipFvXzrjeJQsc9gGDnAKT2Iuv5l+Yavw5mNUJH7o3EAeB
         coojgatQLq3H+H7azI8h30r4SX8/AuL0x6ELc4C4Pctyhg/WtBPX3lDVaWTiabC+wOKN
         XmqVkroRGB3EXoF0syddpAIxGlP7pHsoUBlkE0f+YHyWzwejAWjpGbAq8lbBokp6oP0+
         TJaTIFJx0kuJbWA5HCp/uJpdt6fPVYOqXcv0zAznY5oFfPO7mHYMfpX0RdBkQDFIvIFw
         3MTJ1QH2hvtOaVHEt43vLq24YurV9D9ZTMgQubRKVLPfkHs6aLRvCyzemKMlSEwM3Ks1
         ttTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfJJiPjkyqG9+8IeWr0kmFdresFAGRg7/pinVENLwNHVIC2LTMqnoAw7bHhlHZ9mX96vjG3JHanp6s@vger.kernel.org
X-Gm-Message-State: AOJu0Yx54WLy4nIhQlxzSEpMO9tsyARMwrqO9c6dqWZNoXPx6Lvjx2Gq
	KtL9APPms5i/h99gAjcFr3nVDg2wGYnPSlFedfVkLlhypsSjTwCmNaHW/4ML9gE1k8lW5ZWtJ+r
	fJjY2VD0OcPta0aslbBJhl9F0lM3wW6jGDFx8Og==
X-Gm-Gg: ASbGncsjg2ryJvyAtE8K0GMGqPFtN6w16TDElN/eIGPepAK/UF6cOmwd4BVuVruQVUa
	uahDJPyDNdXgDSskxznorH+q73TVwHbP+jApyJ/h4G5BS3ByB54x6APkVbfUu+dMAgsEM4g==
X-Google-Smtp-Source: AGHT+IH7RDpTyldZR2M5fiRewUF/K3XAyT/cXYU7hGVSjxMGzZXtsRaW57q3QD1NeU2EzaGp9mnFycCtv9NmYr69LsQ=
X-Received: by 2002:a05:6512:12d1:b0:540:263a:131f with SMTP id
 2adb3069b0e04-5422957ae4bmr13168824e87.50.1735823367662; Thu, 02 Jan 2025
 05:09:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226215858.397054-1-s-ramamoorthy@ti.com> <20241226215858.397054-4-s-ramamoorthy@ti.com>
In-Reply-To: <20241226215858.397054-4-s-ramamoorthy@ti.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 2 Jan 2025 14:09:16 +0100
Message-ID: <CAMRc=Mf3-yY+Vg7WwfbcWfA=y0avJ=Q8joWUfXcdYm+a6KSZsQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] gpio tps65215: Add support for varying gpio/offset values
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, linus.walleij@linaro.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 10:59=E2=80=AFPM Shree Ramamoorthy <s-ramamoorthy@t=
i.com> wrote:
>
> Add device-specific structs to select the different PMIC .npgio and .offs=
et
> values. With the chip_data struct values selected based on the match data=
,
> having a separate GPIO0_OFFSET macro is no longer needed.
>
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> ---
>  drivers/gpio/gpio-tps65219.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
> index 7adc1274d80e..18055c2dd35c 100644
> --- a/drivers/gpio/gpio-tps65219.c
> +++ b/drivers/gpio/gpio-tps65219.c
> @@ -13,7 +13,6 @@
>  #include <linux/regmap.h>
>
>  #define TPS65219_GPIO0_DIR_MASK                BIT(3)
> -#define TPS65219_GPIO0_OFFSET          2
>  #define TPS6521X_GPIO0_IDX                     0
>
>  struct tps65219_gpio {
> @@ -21,6 +20,11 @@ struct tps65219_gpio {
>         struct tps65219 *tps;
>  };
>
> +struct chip_data {

Please use the driver prefix here.

Bart

> +       int ngpio;
> +       int offset;
> +};
> +
>  static int tps65219_gpio_get_direction(struct gpio_chip *gc, unsigned in=
t offset)
>  {
>         struct tps65219_gpio *gpio =3D gpiochip_get_data(gc);
> @@ -71,7 +75,7 @@ static void tps65219_gpio_set(struct gpio_chip *gc, uns=
igned int offset, int val
>         struct device *dev =3D gpio->tps->dev;
>         int v, mask, bit;
>
> -       bit =3D (offset =3D=3D TPS6521X_GPIO0_IDX) ? TPS65219_GPIO0_OFFSE=
T : offset - 1;
> +       bit =3D (offset =3D=3D TPS6521X_GPIO0_IDX) ? (gpio->gpio_chip.ngp=
io - 1) : offset - 1;
>
>         mask =3D BIT(bit);
>         v =3D value ? mask : 0;
> @@ -148,14 +152,29 @@ static const struct gpio_chip tps65219_template_chi=
p =3D {
>         .get                    =3D tps65219_gpio_get,
>         .set                    =3D tps65219_gpio_set,
>         .base                   =3D -1,
> -       .ngpio                  =3D 3,
>         .can_sleep              =3D true,
>  };
>
> +static const struct chip_data chip_info_table[] =3D {
> +       [TPS65219] =3D {
> +               .ngpio =3D 3,
> +               .offset =3D 2,
> +       },
> +       [TPS65215] =3D {
> +               .ngpio =3D 2,
> +               .offset =3D 1,
> +       },
> +};
> +
>  static int tps65219_gpio_probe(struct platform_device *pdev)
>  {
>         struct tps65219 *tps =3D dev_get_drvdata(pdev->dev.parent);
>         struct tps65219_gpio *gpio;
> +       const struct chip_data *pmic;
> +
> +       enum pmic_id chip =3D platform_get_device_id(pdev)->driver_data;
> +
> +       pmic =3D &chip_info_table[chip];
>
>         gpio =3D devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>         if (!gpio)
> @@ -164,6 +183,8 @@ static int tps65219_gpio_probe(struct platform_device=
 *pdev)
>         gpio->tps =3D tps;
>         gpio->gpio_chip =3D tps65219_template_chip;
>         gpio->gpio_chip.label =3D dev_name(&pdev->dev);
> +       gpio->gpio_chip.ngpio =3D  pmic->ngpio;
> +       gpio->gpio_chip.offset =3D pmic->offset;
>         gpio->gpio_chip.parent =3D tps->dev;
>
>         return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip, gpio)=
;
> --
> 2.34.1
>

