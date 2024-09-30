Return-Path: <linux-gpio+bounces-10564-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1277C98A0BA
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 13:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D6BD1C25D6F
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 11:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D09319047D;
	Mon, 30 Sep 2024 11:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="X5VXd/mH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD13418E041
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 11:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727695743; cv=none; b=ZRFXsnz+8OnG6Zgis2mnobHQAOKx++1ZRxkscORygUGYyvDFjdexiyQjnekMmcUUsZ+zeO0+CgHfc99dgXXs8Ji09lyiqkaSwaKQSFPRZJUfvoYKXuEww6hBnHiHuZOcqwlF+FG/rz0x/dEWcsEbB5BQx1HOczSGNsAafXWUjfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727695743; c=relaxed/simple;
	bh=GTATx1ZjgRAIeRb4gVhlCtdMSImGj/h83r+eF+k6xOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=clsbxR8DMrAm/oFee7lrdeE+mY3cUJqmKAqGilTsm6APXNbrWj/TG9UttKybijRD+n+oj2NryTKagqxpJEZHfJFXvPjT/fGhU1l/AAUc0ASZ5KyEHED9mEfQf/ml/3rkmtmPYqvlLYDLG/jQ+fMnWsqESyNA3oA+UVRtYnHKT8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=X5VXd/mH; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3e042f4636dso2776151b6e.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 04:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727695740; x=1728300540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESV9e65f4opp3oYhgp6rCKPns7ySl2JgdhTmlcbTiZU=;
        b=X5VXd/mHV7Dm6OJ7MXNbeLSGpHHFdF1OxtD8B+rBt50P6C6O95q3/kQ2LUzABFax6O
         RRLGAVvJe40ZrXGKXjJ0NBg19T6Lezjy4BTbipgmmwJRvn5qG2U/mNBl5GfCRSrHohbc
         mKf8yQDZeLYr1Ufh+xYcdM3sG7L01TFkVeTyxcdL+ti/l21cOCGDmh4j/cP86slxGthJ
         grZptFAhCUsIwoxU1vtJN02cCjR/3By8YWg7MrL2yia+itOMezd5+TreFFJJY/FFxlFc
         ckRnDVBt+fqFvmrlt+PBYAG/GDRJjjtY0XRXr+v7vp38tK1BCFK1VWFCzYMJoR0gDGwh
         ebeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727695740; x=1728300540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESV9e65f4opp3oYhgp6rCKPns7ySl2JgdhTmlcbTiZU=;
        b=FLgnr/YCudEdTphX3ItL4JKqyK3L2HTXj7nCS2G6OXVr2JeO4fn4KjLi8ZpYVno7vp
         II4TmaXSAFZNfX1fvdY/WEQ3iRnuePySx96UJcFNZaytnHNCz+f06xRcUTLwwnDKqxd/
         e/hufcWNxeGCBrlgoNDPv7onZPGBDQZGU7q03P0jOsK8t5/eLnDdeHEzewjRf+yjQucj
         V4au2B29L0ljd6bgLcFaSSQlXXQd69Yr6fuX5D1ogV0vC3uQaihjERGtRc3HJ4LjaAWc
         QaIHO407oirtRkpaWANrVo1bgXU1iwYIL7QGTOc4BxlVdu3BzoTjuXXHpRPv6SW0dZij
         P1Xg==
X-Gm-Message-State: AOJu0YzC+bNMXp6Bnc1/ad2BXqClDEa9LGTEmkzU8Q6K7hIBDyYXrx2Z
	34K39eSMekCWQVZ4UPgQvAy9wT0NZNR6jL0Szr3CAYj/+FhtpPlLYs1JJvTLf+sq45xkL0pMhiM
	rTHgNGDlAaHL0Dy8T8LNAc7xJreyaQZomJxM/RA==
X-Google-Smtp-Source: AGHT+IHlrk+6ylJNPNwIsyMeU+6MgSCPdtd1Tld1jqABl45ABUDHKKwEQnK828Pbh+a/oWL/55rN02vH87DWZloHkoc=
X-Received: by 2002:a05:6808:3387:b0:3e2:9e00:5a16 with SMTP id
 5614622812f47-3e3939600f3mr6239921b6e.11.1727695739914; Mon, 30 Sep 2024
 04:28:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930103157.49259-1-brgl@bgdev.pl> <20240930103157.49259-2-brgl@bgdev.pl>
In-Reply-To: <20240930103157.49259-2-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 30 Sep 2024 13:28:46 +0200
Message-ID: <CAMRc=MfCOuTweTVObh5qP0CftUM_W9cduT2R=r+LP3FKrS=8ww@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: syscon: use generic device properties
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 12:32=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> OF-specific routines should not be used unless necessary. Generic device
> properties are preferred so switch to using them in the driver code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-syscon.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
> index 638095d5f459..06c07085feb8 100644
> --- a/drivers/gpio/gpio-syscon.c
> +++ b/drivers/gpio/gpio-syscon.c
> @@ -9,7 +9,6 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> -#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>
> @@ -208,12 +207,13 @@ static int syscon_gpio_probe(struct platform_device=
 *pdev)
>         struct device_node *np =3D dev->of_node;
>         int ret;
>         bool use_parent_regmap =3D false;
> +       unsigned int props[] =3D { 0, 0 };
>
>         priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;
>
> -       priv->data =3D of_device_get_match_data(dev);
> +       priv->data =3D device_get_match_data(dev);
>
>         priv->syscon =3D syscon_regmap_lookup_by_phandle(np, "gpio,syscon=
-dev");
>         if (IS_ERR(priv->syscon) && np->parent) {
> @@ -224,19 +224,15 @@ static int syscon_gpio_probe(struct platform_device=
 *pdev)
>                 return PTR_ERR(priv->syscon);
>
>         if (!use_parent_regmap) {
> -               ret =3D of_property_read_u32_index(np, "gpio,syscon-dev",=
 1,
> -                                                &priv->dreg_offset);
> -               if (ret)
> +               ret =3D device_property_read_u32_array(dev, "gpio,syscon-=
dev",
> +                                                    props, 2);
> +               if (ret < 0)
>                         dev_err(dev, "can't read the data register offset=
!\n");
> -
> -               priv->dreg_offset <<=3D 3;
> -
> -               ret =3D of_property_read_u32_index(np, "gpio,syscon-dev",=
 2,
> -                                                &priv->dir_reg_offset);
> -               if (ret)
> +               if (ret !=3D 2)

Sorry, this is wrong, it doesn't return the prop count unless val is NULL.

I'll send a better version.

Bart

>                         dev_dbg(dev, "can't read the dir register offset!=
\n");
>
> -               priv->dir_reg_offset <<=3D 3;
> +               priv->dreg_offset =3D props[0] << 3;
> +               priv->dir_reg_offset =3D props[1] << 3;
>         }
>
>         priv->chip.parent =3D dev;
> --
> 2.43.0
>

