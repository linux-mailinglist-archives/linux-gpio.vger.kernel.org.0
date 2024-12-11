Return-Path: <linux-gpio+bounces-13755-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640C9ECDAA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 14:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A05D2831D7
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 13:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2BE22C353;
	Wed, 11 Dec 2024 13:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YPE9oNbU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8526F381AA
	for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2024 13:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733925107; cv=none; b=aiqnBDMQP1tqrefO6FxqwXGlz06Q8AxJ12J9REopZ24yZPWTus6pqjL3r1JlGFlwjfcMcgM5lA15R4PtSlxMbM9VTjvomqREUvKgMeoqw62jsnxkCqkCDZ9EXwLlMmbRdBGXA31lMsoUF+BjceLvrGztiy77INhPeMz2aieT5OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733925107; c=relaxed/simple;
	bh=5RXHiNPW/0Bon8rtfd5Eg2+l7xVOOJj6jcjOeLgJpNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a6T8xyjMfTq6Zep8j1o/GukRuAWDH7OxXkJESv3UZ+FMPBTOKtX3jFDlWdBIPPKP8ME+R7cYji3CYkgisiYfXisjoCjmjHcX7LTZjJ2IV7giXpN34JWvKCuIu5bL2TeBc2YY41Hq9KiMNrRq0ZoI749sctsSvHDv8pdJePBCuws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YPE9oNbU; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3022c61557cso26185881fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2024 05:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733925103; x=1734529903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5u5RmdvUjaZNQ4ypOIRfpbzJHydPCUz5+IqYFCHDO8=;
        b=YPE9oNbUA65hk7nAS3pchPjw+sbtt7XSAI9Z5M/E84v2Loex/AFwmwTSbE8O87uGTo
         Sj0hzfWo2ri42k5WF+qvGjRHpE5HQ476zHaWLvtkE+wn/AtwWt8lliD757nvoZvndmls
         oSljoSmdHy04pTicww/WOu/G1C3u6DZU5oeKubJQCTuQ4Tp09COO/ABU8dVebYMahQs0
         c+YvbyQSNFx9u4o/PaNESgR/+piOlKRn0rk9YsqJ8yb9PS315P5V4l6/oaI70GGlAcOI
         3LKm94zeisZ0uguW7UyjhYuaopmPsWhj+dtGRnPeJNgnf/XeBBtXr8Mk+QnJ/8cSnjCW
         tuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733925103; x=1734529903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5u5RmdvUjaZNQ4ypOIRfpbzJHydPCUz5+IqYFCHDO8=;
        b=Sh747u769cIwv/4D+94BQSmyubHJPwZpl1gXe3ElMX+CT/EvL/rXOceXGBvGJshBTl
         ZkZuxDCz4W0PSuwg23yp+AnICzx/LMvQrvWYGO9jd8B1+RgtNluFPvN/bB+3VTZBMAed
         bM8c+6nSomkzee2BVlob5jIGwAY5j4C2SzrOGVW6LChdJkrZCCJnqOhR7MyvV31mTGrr
         yjnLdSWWm8x2l/g6szugGX1js6gMbZsy0ssBTurUkvk2zAH7Idb+6xE1SAnRG23YdVg0
         CrX79gxvZBiX4H01W52JmVZ9RK8XX2x7DKEJJjeMqGcMpqp5JPzm6HSA1DWfwaMb7u7l
         G9gA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ3pR0TQS+rSEpf1u0K5jhtgeSuV8sWGkEeH/XVebgxNeLP4Jf9HI02hrdC3sdHCA/k6+guRGgPV2G@vger.kernel.org
X-Gm-Message-State: AOJu0YzEUXiGCyVYvBJSo8Zfg3vSxuhO0NjSDA3Gimyz0fAlHhxbZdE4
	mJZih/CBi8gPKAOJDAWWveE/9MBnhbjLFbZ9SfDF7mxXKQU+6LFwa3MK4QFMBGvheg3I4AkL3sV
	FQQB3vvzHR4elRR5iv/UvexbFGtUKRrzJe26cbg==
X-Gm-Gg: ASbGnctunQoi+U3TALhoP+ifY4AJXF7+zNl+zmnEB47IniqxWowfTVSMk2tjzGGLYNu
	gfhUz6C+3BQqDhQhYTEMfsZfhmKNJScTRNhohdfRCFHDJAGCnnLGLW0OtbCdX7mhbCnY=
X-Google-Smtp-Source: AGHT+IGKBM2RHn3r5FHvAN79XFFY0ttT3PZY+kel/8viJybfPo8tUMJz3XMjpyYvMjhuaoWZgYhmLbZS3eutGd3rKdo=
X-Received: by 2002:a05:6512:3e01:b0:540:1fb5:3f9f with SMTP id
 2adb3069b0e04-5402a609ab6mr1031866e87.47.1733925103496; Wed, 11 Dec 2024
 05:51:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211051019.176131-1-chensong_2000@189.cn>
In-Reply-To: <20241211051019.176131-1-chensong_2000@189.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Dec 2024 14:51:32 +0100
Message-ID: <CAMRc=MfpwuMh-MH1UEHKky09iAs4g9=iGFPptARXzoZrVS8hdQ@mail.gmail.com>
Subject: Re: [PATCH v2] regulator:s5m8767: Fully convert to GPIO descriptors
To: Song Chen <chensong_2000@189.cn>
Cc: krzk@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, lee@kernel.org, 
	linus.walleij@linaro.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 6:10=E2=80=AFAM Song Chen <chensong_2000@189.cn> wr=
ote:
>
> This converts s5m8767 regulator driver to use GPIO descriptors.
>
> ---
> v1 - v2:
> 1, reedit commit message.
> 2, remove development code.
> 3, print error msg in dev_err_probe.
> 4, doesn't set gpiod directions until successfully requesting
>    all gpiods. It's pretty much equivalent with original code.
>
> Signed-off-by: Song Chen <chensong_2000@189.cn>
> ---
>  drivers/regulator/s5m8767.c      | 106 ++++++++++++++-----------------
>  include/linux/mfd/samsung/core.h |   4 +-
>  2 files changed, 48 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
> index d25cd81e3f36..b23df037336b 100644
> --- a/drivers/regulator/s5m8767.c
> +++ b/drivers/regulator/s5m8767.c
> @@ -5,7 +5,7 @@
>
>  #include <linux/cleanup.h>
>  #include <linux/err.h>
> -#include <linux/of_gpio.h>
> +#include <linux/of.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> @@ -35,8 +35,8 @@ struct s5m8767_info {
>         u8 buck2_vol[8];
>         u8 buck3_vol[8];
>         u8 buck4_vol[8];
> -       int buck_gpios[3];
> -       int buck_ds[3];
> +       struct gpio_desc *buck_gpios[3];
> +       struct gpio_desc *buck_ds[3];
>         int buck_gpioindex;
>  };
>
> @@ -272,9 +272,9 @@ static inline int s5m8767_set_high(struct s5m8767_inf=
o *s5m8767)
>  {
>         int temp_index =3D s5m8767->buck_gpioindex;
>
> -       gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
> -       gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
> -       gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
> +       gpiod_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
> +       gpiod_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
> +       gpiod_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
>

It seems to me that these GPIOs are always manipulated at once. Maybe
consider adding fwnode_gpiod_get_index_array() to GPIO core and using
it here to shrink the code a bit more?

Bart

