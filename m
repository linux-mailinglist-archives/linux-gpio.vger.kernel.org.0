Return-Path: <linux-gpio+bounces-6824-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDE88D3550
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 13:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0145F1F23CBE
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 11:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81EEA1802AB;
	Wed, 29 May 2024 11:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qkxEt2P3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0603178CCD
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 11:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716981480; cv=none; b=LDko1+YsKI9liKtz0n8y/ClN0Dsp69naevKGTxrLNvYJIgVMegdipMc7B0Sc8HugH02J9FxCRBs0AYBOq/0biQ4MU4CgXGP/rLT0TbW0AmseqglZ+abIYPyq0gW+iUlFqFy7h/ADHIijaueRMEux6fTzQXrIEvYIHjwvSK/4WcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716981480; c=relaxed/simple;
	bh=ap8WB7zJyNfSEZFkt5CFPXf10NgEIEKXQoueXOl5NTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=QWqQnSygtVZWqECJ3HCbb0vd83z0W7MnDP9PJ2j3h/lDTV5NnnTXFRzQstPudWkXwCmTctdsOyZ1FHhT0fuk8R2zxaILqmIsugzpX8pqzM5Si2uuB+tzVHxtxA5dNzMP46KPQNI8J9DC9K0qE2P5lsq5vd2f26hKfHc/O9fL7Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qkxEt2P3; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e96f29884dso19481681fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 04:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716981475; x=1717586275; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MhVoCfE1qgvS+Rea5BqmdotkpaOmhiJt3ApwJZvK6g=;
        b=qkxEt2P3adFTJtuzDLbIH6SSwFOKrVl0HEgTksvLXSvkR4tg+zI5ZkxIx9XHu6uAjM
         DH+n7UiG4OGtN/zujP/a0j8uhNvp/HI14tB7QtFNc7C1u6CzY5jgGX6FNOm2P7fDZrbQ
         o2L6QvapdtLaq7LEraFDR6PtshcphQbsyy+o1JedpZF2ZtglfDO2lX0hTzxe9BGiqpu2
         PzEdWto9gV68S2FQl39wX5RY6V6BnYwWuMui2f++Po4oWtBqQZTvl2YDqXbxhimYRtyv
         xHLoCbTpVeohICTMaFX6XjxDi76Mt+K6UGg9bRCBXDlByFnTgo15ynOZrZliCTMIFsSz
         0M6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716981475; x=1717586275;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MhVoCfE1qgvS+Rea5BqmdotkpaOmhiJt3ApwJZvK6g=;
        b=sdNvkw5CT2Kks7h+mCJQ/4q99JMoV84qxB8qq6yKtTlygDRTOo4nsSFFr0tM8xuBLx
         ZA1r3LRPKjVoUZL8UmaxJ2Pn83p6rxZufyWfNNl2dq4WYsM2zZWkju6reIltr8pmeiwX
         3M1Kl1RBrJcGdmV7nZ5ZhYVXQUb5FAtFnswJzbbKx1DsT+nLwOX+v6hSh0JQJulAifdY
         4gNnq/xMhLdr8iMrSLyKqk8j1p6OYFc9TjRLDDIodGSmKghApJeahDp4L9RHcty1YB7W
         k3M7nTltWBs8FxSqIPxyvnhKXidO5u619NJ22Qga0rCV9VTHwvptraUqAMGMPZS8zMr3
         8zfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX45375vLM86kUMPcqvjhF7AAP1ZFA9oWaPWrn4uFsTZTt7ahgdlTc1X9tKYGVWk3OH/50eNVBZRZOEHiGq4I8myQHlzfWop5RBnw==
X-Gm-Message-State: AOJu0YyL9aA5I/7T09jyYT3iFbysMxaWzOnBkJpOq90MOfTByqXke2gQ
	LdDGYSNhJ9e23olPRJPCj7hidZMdtiANT8H7ACVoLF6Ho08cq5RdaZsuAErBfRXloOQYrQzJxgL
	6g/4lsLNVrARVGqHVRCdyeQbnq/wVUGlZ1WLmj5bXeGjYomyg
X-Google-Smtp-Source: AGHT+IHLzzi26MzrXuTKHQDrvAQBQ126kwDvkstzBaFuSnwmW3mJAe0gxhCqHTcr838fp4HizAyBeHV6zAEkI9sAPJM=
X-Received: by 2002:a05:651c:1a0b:b0:2e5:8685:8b13 with SMTP id
 38308e7fff4ca-2e95b0c22b6mr99628191fa.25.1716981474863; Wed, 29 May 2024
 04:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zktwd4Y8zu6XSGaE@Z926fQmE5jqhFMgp6>
In-Reply-To: <Zktwd4Y8zu6XSGaE@Z926fQmE5jqhFMgp6>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 May 2024 13:17:43 +0200
Message-ID: <CAMRc=Md9osTYohZU_CJkaU8zto5P4v9_Nfp7quqVXm_YM+2Y0Q@mail.gmail.com>
Subject: Re: [PATCH] gpio-syscon: do not report bogus error
To: linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, etienne.buira@free.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2024 at 5:48=E2=80=AFPM Etienne Buira <etienne.buira@free.f=
r> wrote:
>
> Do not issue "can't read the data register offset!" when gpio,syscon-dev
> is not set albeit unneeded.  gpio-syscon is used with rk3328 chip, but
> this iomem region is documented in
> Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml and
> does not require gpio,syscon-dev setting.
>
> v3:
>   - moved from flag to parent regmap detection
>

Don't make the changelog part of the commit message, please.

Bart

> Signed-off-by: Etienne Buira <etienne.buira@free.fr>
> ---
>  drivers/gpio/gpio-syscon.c | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
> index 6e1a2581e6ae..3a90a3a1caea 100644
> --- a/drivers/gpio/gpio-syscon.c
> +++ b/drivers/gpio/gpio-syscon.c
> @@ -208,6 +208,7 @@ static int syscon_gpio_probe(struct platform_device *=
pdev)
>         struct syscon_gpio_priv *priv;
>         struct device_node *np =3D dev->of_node;
>         int ret;
> +       bool use_parent_regmap =3D false;
>
>         priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
> @@ -216,24 +217,28 @@ static int syscon_gpio_probe(struct platform_device=
 *pdev)
>         priv->data =3D of_device_get_match_data(dev);
>
>         priv->syscon =3D syscon_regmap_lookup_by_phandle(np, "gpio,syscon=
-dev");
> -       if (IS_ERR(priv->syscon) && np->parent)
> +       if (IS_ERR(priv->syscon) && np->parent) {
>                 priv->syscon =3D syscon_node_to_regmap(np->parent);
> +               use_parent_regmap =3D true;
> +       }
>         if (IS_ERR(priv->syscon))
>                 return PTR_ERR(priv->syscon);
>
> -       ret =3D of_property_read_u32_index(np, "gpio,syscon-dev", 1,
> -                                        &priv->dreg_offset);
> -       if (ret)
> -               dev_err(dev, "can't read the data register offset!\n");
> +       if (!use_parent_regmap) {
> +               ret =3D of_property_read_u32_index(np, "gpio,syscon-dev",=
 1,
> +                                                &priv->dreg_offset);
> +               if (ret)
> +                       dev_err(dev, "can't read the data register offset=
!\n");
>
> -       priv->dreg_offset <<=3D 3;
> +               priv->dreg_offset <<=3D 3;
>
> -       ret =3D of_property_read_u32_index(np, "gpio,syscon-dev", 2,
> -                                        &priv->dir_reg_offset);
> -       if (ret)
> -               dev_dbg(dev, "can't read the dir register offset!\n");
> +               ret =3D of_property_read_u32_index(np, "gpio,syscon-dev",=
 2,
> +                                                &priv->dir_reg_offset);
> +               if (ret)
> +                       dev_dbg(dev, "can't read the dir register offset!=
\n");
>
> -       priv->dir_reg_offset <<=3D 3;
> +               priv->dir_reg_offset <<=3D 3;
> +       }
>
>         priv->chip.parent =3D dev;
>         priv->chip.owner =3D THIS_MODULE;
>
> base-commit: 4cece764965020c22cff7665b18a012006359095
> --
> 2.43.0
>

