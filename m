Return-Path: <linux-gpio+bounces-18048-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35701A72BD6
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 09:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 259501897ACF
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 08:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A906920B1FE;
	Thu, 27 Mar 2025 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IqdVU7g1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D500E4C62
	for <linux-gpio@vger.kernel.org>; Thu, 27 Mar 2025 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743065717; cv=none; b=t4byFuDuEmFHSy/1HVecnYawWWLjz0IepcXhjHS8aHNjpufPgdWIz1WUgEBk5LssnSygdsmK+IHaMHQ9aOwKwK6O+gdYbtkRISqoQXwoQUpGtIUUGb7U+H7JKygOq5CV/+slADf+XukJhC9j1Fmq+MjgsWUmQB4V//5xLX654/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743065717; c=relaxed/simple;
	bh=+uDTvw0NAiJshNKjCFWBDchrHudSaZlgESjIlq6pqXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pq0kbv8rDMFmRTsNSv5lJqz8uVSEgez8CmwSlvqS8zugr1TNnDX36Es8PAYmsquiuN779i1VXe/p99IXJvnFa4VH8OgG4FuJ2qw+TnMcCq8CK+pO8DxCFdd/o7M6+K+ePNq+JObawHcVNrUU4uRyV+RTa9m4dUlZ2Lukn1Rl+M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IqdVU7g1; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30613802a6bso7787731fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Mar 2025 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743065714; x=1743670514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xX7zOJmIvIc+c8CVP1kOsZxrERdgtODAYGQ6WCW63GA=;
        b=IqdVU7g1Xz13ZgqO4JK3tYrV8oHwpXhJZ7ooi7U6/PSoq05JIDqIpAM4dapKpQ5+8T
         /tpZpdolEnH4zF+0nT0WBLqr6olcKJrHc/r/j6FlrMmBGY+IVKqRO7qFobJ4opyr5IhM
         v7sTOeRrZbE7n5WPRwEYLlZjfpcrIP+/NsekQJrYM6PlC+vyMRWBa0Xs1M4zGJWm4PZG
         36J45HDizuCsbovrtn/C2XooJuCi2JUPBpJR7tUNsuiWBMVRsVaKlqyShE5kRL7//vLZ
         g/msJu1E7DtiTKQZ3HlUQL5nlRWcZ6xgQyHE1VWgGsIc7ADcIctoU3e6ZmC0fr0fmP2i
         S37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743065714; x=1743670514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xX7zOJmIvIc+c8CVP1kOsZxrERdgtODAYGQ6WCW63GA=;
        b=xSdcYyyRecMJXjk6ldXsxZFAPJJLbf9g+gOOdcFwkG9zbJV0gRDI4Fwt1h9ZOKfFuR
         j6T5gAbBu3wcTpvbATjgvEEu0IYkmmYLPjGnkfYvZcyvEQ9s0EisBlwvFNE50IBJg49+
         mQ7jx0cZE68w+8dNAspyGlazWVY+LNkwGkivTzISxqMmDnfSEffK3HsHJCxt9ot+HYed
         dz/MHFt2paBUxuMbIB/KqSAH9fL2SAPAs17TByTBBUO9ZkPkH+qWvJkf+XKDyqGJfovE
         NTMyYTV+Gtu/ORCJY0fR/8dYxHoogJccfhrnjDcw0I4aRNrnYgLDKNj89PYdx8zy+bTE
         49YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdcEKlbnoSkuLSBt/j27qjK3b5LY1TgW6FJCzO22Z+buC1FxDeBUE0uxPzCMPqWJtS59QoyKapV4MM@vger.kernel.org
X-Gm-Message-State: AOJu0YxDWqE+4xUc8NIz3X8Ln2ao10+OXG7ornf/RW5gr/sGm01feuNL
	NNryAI2U1nl/v1iL43E+K4ihtddb0rA3od68G9Vz442wjjpZ+e2PpIp0Ptbn68W3RYskD+YCdnH
	aouIas/fj8RPZvahiVI6DN5syZ4PGM9fMusb7xA==
X-Gm-Gg: ASbGncsIj51rCf0PlKIPXDNybwrljXGy5lOQoFLPuc4UVPgt+DkgN89F52R9OVSBIpv
	sRBu5iC8cCglkpttjOiqTnd5Apkag/EQCi3VoOqAzXhrhN80fKUnA9VIX4lcHDl7k1d03zXGQd2
	jf225aJW72sLhQXH7GOrYQtAgPlzX+Ik2M0pMRyVx6BkDSAxM5xpvcU1Akhg==
X-Google-Smtp-Source: AGHT+IHuWctoQSNtfRvqowbNw6/p2JfMs654EQsPOQDnh4CHiSDaXjQHp2k71yGY5aW9byJLFzlKPfX/Zmi4wUmU4J0=
X-Received: by 2002:a2e:a548:0:b0:30b:ee81:9622 with SMTP id
 38308e7fff4ca-30dc5f45824mr11654211fa.31.1743065714014; Thu, 27 Mar 2025
 01:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327004945.563765-1-peng.fan@oss.nxp.com>
In-Reply-To: <20250327004945.563765-1-peng.fan@oss.nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 27 Mar 2025 09:55:03 +0100
X-Gm-Features: AQ5f1JrNDKi6eoVNVGn9D2px89ZzGel4NmYjoMJzgLZI_iKwInQJa47frSxKq4I
Message-ID: <CAMRc=Me8YdNcU1CHH23Bsi8yp33OL8a00-MiMNwA7skD7S0Jbw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] gpiolib: of: Add polarity quirk for s5m8767
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, broonie@kernel.org
Cc: linus.walleij@linaro.org, krzk@kernel.org, lgirdwood@gmail.com, 
	andriy.shevchenko@intel.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 1:50=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> This is prepare patch for switching s5m8767 regulator driver to
> use GPIO descriptor. DTS for exynos5250 spring incorrectly specifies
> "active low" polarity for the DVS and DS line. But per datasheet,
> they are actually active high. So add polarity quirk for it.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>
> V2:
>  New patch
>
>  drivers/gpio/gpiolib-of.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index eb667f8f1ead..83559dd24f32 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -222,6 +222,15 @@ static void of_gpio_try_fixup_polarity(const struct =
device_node *np,
>                  */
>                 { "lantiq,pci-xway",    "gpio-reset",   false },
>  #endif
> +#if IS_ENABLED(CONFIG_REGULATOR_S5M8767)
> +               /*
> +                * According to S5M8767, the DVS and DS pin are
> +                * active-high signals. However, exynos5250-spring.dts us=
e
> +                * active-low setting.
> +                */
> +               { "samsung,s5m8767-pmic", "s5m8767,pmic-buck-dvs-gpios", =
true },
> +               { "samsung,s5m8767-pmic", "s5m8767,pmic-buck-ds-gpios", t=
rue },
> +#endif
>  #if IS_ENABLED(CONFIG_TOUCHSCREEN_TSC2005)
>                 /*
>                  * DTS for Nokia N900 incorrectly specified "active high"
> --
> 2.37.1
>

Mark,

Once v6.15-rc1 is tagged, I'd like to pick it up and provide you with
an immutable tag so that you can take the corresponding regulator
patch through your tree, does it sound good to you?

Bartosz

