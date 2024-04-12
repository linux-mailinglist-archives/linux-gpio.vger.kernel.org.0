Return-Path: <linux-gpio+bounces-5443-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3660C8A366E
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 21:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67E801C2309C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 19:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5CB150984;
	Fri, 12 Apr 2024 19:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="T4KNrlAX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5D914F124
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 19:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712950683; cv=none; b=hJv7BipKw6ucLEzjtIGlRrN8wXcivBLG+0S6et9mdoZMdwmvZpVpzZImO/u0y98VpW5dehn109yi/e1X6E1Uy4RCTbBt+mlTXrv+ZJEOTN80VzYShmY+mvy4XBaPIpZdAIp8jkJJcWtoZSxtheLHauOlRg02JR6m5hKz+Dxx9ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712950683; c=relaxed/simple;
	bh=gsfELytgY5x4hQcFZxJ/77pYZa6JSOFnKqDvqYK9T2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PTaCwcLiym0u+yhnvINu1Ovjf/Z2LDdVG1egMBK2/R1LZ45C2EkHmfMVAcS63B1OlnkeZ59j6nc0MleHOzVT+kjPyI8894vuaYQ9blM6RcyS9xS/5mz2zdtEiyKu0ydRLfKpQvz1z+dsdNAn3awWjZS6G6U0JCqBIeHl1FZDoLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=T4KNrlAX; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d88a869ce6so14605611fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 12:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712950680; x=1713555480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2cNkGqcGx7IBGriRb2f5XVGGwlgEQtCfumu0ixlvO0=;
        b=T4KNrlAXLK2P4KRlSbaVQ2WLTqvo3eV0de0UdCHDOEMwOPGBom3T0voRkvmDkrI9j6
         HOy4SySsDlyxi6Yqj8KG5DDbFVPwOx3/Bup2wZoy06bTE/QZJo1LApSuM6vHkagWUmxZ
         tnu46ZxWihyTALrj1MX+Y12BXu8bRhBXAJJZjYAV5g977EkujYAuNAVNEWC6ALfvLW+H
         15YkIJbKkhKRJznzeg25gua/oB4xB0X0QJVjkYkaE9azhuXsoCvNygYlc3srocna4B9L
         aSUk5ECd7MniZiC/io27+V1J6CmQE7gxkicse/3gbYRTivU47Gm4kp6pwrE8rdUc63ON
         2G5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712950680; x=1713555480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2cNkGqcGx7IBGriRb2f5XVGGwlgEQtCfumu0ixlvO0=;
        b=ifkFrW5hmDVHCKJpG4FAY28Gv8vkobPht67ioJky7XaKGcgatf4Jf82fH5vDtJveTj
         iStRU6zqW4knZVkFgH6hnRP1p/qMIk4RCuUrO3M62jlT5agnWfZpI36WZU9FypOgd+A5
         o8UfFnf5aEvQUihHik3nuyW/LoritTtozzgYD6N2Cp5N5xe8E88sqCwHpJlLvEE8+ZEe
         rsWJSxjB8wiGHhWli3jmqzq8sWAWmPfcyoTKzdB345RsRMt0MoFYocA8Up7/ZkFtb8n8
         IaAR2qDPTxQtvI5b6ZORtjTbBYmPlhc+YLGmt+mEeytKIF+kKA5/UvbpgpTFiNdwYTNo
         20BQ==
X-Gm-Message-State: AOJu0YymFqe08z6sx496jIkCPvxseZPI4LwqF1IxBMHw3rHGM5asHeO+
	/IqgQECrURrOkqWswj9xX7nCAP3wLK5ZltMSAjjLQ3tpAQz6A2Td6P1SirBHueX4BhM+XXRtm0m
	DCaUIdxmsruJ0YqcN5YJZCwCRwBVgNRALcZ4omA==
X-Google-Smtp-Source: AGHT+IH+jEq8r7U4FkjCa87gOw/vXf0vhISfuOxofd2v8isSrRxKMHv7GbZRCJF16KXpRHCaofniXvLINhCq+pVuZp4=
X-Received: by 2002:a2e:9984:0:b0:2d7:17e0:ff56 with SMTP id
 w4-20020a2e9984000000b002d717e0ff56mr2760451lji.18.1712950680140; Fri, 12 Apr
 2024 12:38:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410063930.1199355-1-andy.shevchenko@gmail.com>
In-Reply-To: <20240410063930.1199355-1-andy.shevchenko@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 12 Apr 2024 21:37:49 +0200
Message-ID: <CAMRc=McnSbPOTAUMSx6iH_0VAsX0yteofgAyvxQB5sUcV5ni8w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: regmap: Use -ENOTSUPP consistently
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael Walle <mwalle@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 8:39=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> The GPIO library expects the drivers to return -ENOTSUPP in some cases
> and not using analogue POSIX code. Make the driver to follow this.
>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>  drivers/gpio/gpio-regmap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index c08c8e528867e..71684dee2ca5d 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -129,7 +129,7 @@ static int gpio_regmap_get_direction(struct gpio_chip=
 *chip,
>                 base =3D gpio_regmap_addr(gpio->reg_dir_in_base);
>                 invert =3D 1;
>         } else {
> -               return -EOPNOTSUPP;
> +               return -ENOTSUPP;
>         }
>
>         ret =3D gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
> @@ -160,7 +160,7 @@ static int gpio_regmap_set_direction(struct gpio_chip=
 *chip,
>                 base =3D gpio_regmap_addr(gpio->reg_dir_in_base);
>                 invert =3D 1;
>         } else {
> -               return -EOPNOTSUPP;
> +               return -ENOTSUPP;
>         }
>
>         ret =3D gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
> --
> 2.44.0
>

Applied, thanks!

Bart

