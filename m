Return-Path: <linux-gpio+bounces-27533-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED09C01439
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 15:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 823AF350A5D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B7C2EE60B;
	Thu, 23 Oct 2025 13:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZW/rQmE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A822DAFDE
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 13:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761224910; cv=none; b=DvCz5QAWmrBptzWk0DU1Ku/NxtcoYj8WCK4Ir6vdFoEUeVAha1rCZUzQ+BAR3R23zCqroUoho+BtXBqJXgb3Nsn/CLX6oXtaEhwkqXEYB8vBWo4GS9SrvCt6J8tKnPTgOIiMG5FJEnKCzRWGuXhmMQ4cwWHkqRF6dsQDuQwAneU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761224910; c=relaxed/simple;
	bh=rZRxnZoiPfM11fgodGAzhTvAF8cwKF/3dUpvAD80g7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eM1BYS1t8Nu5VDPIrU2ML06vASeoj3C6SgBkG0UCWeHqY4OkeqQqRCH2MWQ3HQ2KIAV7Duu0dk4NrvMZKg0h+pqK8igsad/YOd8aDPbvX2UoGvWnc+lPdSFc+AhqMHTaPs6Xv7F0bwGWQd30WEmyMUf/wOq1Onsu9Qq/ASp7Y04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZW/rQmE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92485C4CEFF
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 13:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761224909;
	bh=rZRxnZoiPfM11fgodGAzhTvAF8cwKF/3dUpvAD80g7I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oZW/rQmEUz2YH53qKD7ymYPUPQkUeT129GFlJbzc1r9CRAfWc7NgvwzDimpKJVEuO
	 HaAIXYTD/lVPRDAgJgJtcBP+pI7vwftBj/4ZLNcrC5mWXx66rrzk/ZUt9JczWQWgZf
	 A8ZTK7M9av8BVNnHNC0dxN+VS7blQ9lpMn4rEWCh7S6Nu4LS3Q+3HvNjTgFK2Nfp3N
	 yhihsOCpXTYI09g0yTSUzS+IAXUXC9kJ4YzbtIf5R9ak9qExgRXEmFLwM68mju9rtz
	 Js00DgzYmfJPb2l5lBog1XHiYOs9WcQmFpwHEICYFZ7trIcv0sIA0vguz3BhdP/c87
	 K/XzFPAhQQo7g==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-63c45c11be7so1415597a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 06:08:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8Dkmy05Gv2+fbOCLNenUgSk664zuPTg1B/FWxvE0U0ARi8U7pJGlvddW57hOEo0gPRRCyDGu1Xw9j@vger.kernel.org
X-Gm-Message-State: AOJu0YyzBAJQbbClXFL1xKKmc5rnL9nQvF5uNRtk25JAo7q14eNMrt/H
	nMP2a9X8S22KmD46zYJm+5ftG3+c2J5Ycl1uPCtEq7K9O5eDkqMIwRaZ8ZTKT4bpHX5ZadcZRCA
	rWZd1X4DCHj9mMoFXU8EBcLGlhs4ItQI=
X-Google-Smtp-Source: AGHT+IGgxwrANKKCzMlvCvvxWaKxTknrL+aOM8gkoV8nSDhlCuWQPhGyWc7sQ5zlWA5rMpi547IqAfFwjC3LyiTOuV4=
X-Received: by 2002:a05:6402:5191:b0:63c:4f1e:6d7a with SMTP id
 4fb4d7f45d1cf-63c4f1e734cmr20753748a12.19.1761224908104; Thu, 23 Oct 2025
 06:08:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023090346.1995894-1-zhoubinbin@loongson.cn>
In-Reply-To: <20251023090346.1995894-1-zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 23 Oct 2025 21:08:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H58Cn2LY0Zv3h4_JXdYtg2j0T7ZOhKXpGY2J_dMd5uVvg@mail.gmail.com>
X-Gm-Features: AS18NWCXMckJqVsBdOKHC9RM0y5iw6kxnbNEcILL3LuQzqZ-M_8BOJatx8V83fg
Message-ID: <CAAhV-H58Cn2LY0Zv3h4_JXdYtg2j0T7ZOhKXpGY2J_dMd5uVvg@mail.gmail.com>
Subject: Re: [PATCH] gpio: loongson-64bit: Switch to dynamic allocate GPIO
 base in byte mode
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-gpio@vger.kernel.org, Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 5:04=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> gpiolib want to get completely rid of static gpiobase allocation, so
> switch to dynamic allocate GPIO base in byte mode, also can avoid
> warning message:
>
> [1.529974] gpio gpiochip0: Static allocation of GPIO base is deprecated,
> use dynamic allocation.
>
> Reported-by: Hongliang Wang <wanghongliang@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

> ---
>  drivers/gpio/gpio-loongson-64bit.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loong=
son-64bit.c
> index 02f181cb219e..d4e291b275f0 100644
> --- a/drivers/gpio/gpio-loongson-64bit.c
> +++ b/drivers/gpio/gpio-loongson-64bit.c
> @@ -312,6 +312,7 @@ static int loongson_gpio_init(struct platform_device =
*pdev, struct loongson_gpio
>                 lgpio->chip.gc.direction_output =3D loongson_gpio_directi=
on_output;
>                 lgpio->chip.gc.set =3D loongson_gpio_set;
>                 lgpio->chip.gc.parent =3D &pdev->dev;
> +               lgpio->chip.gc.base =3D -1;
>                 spin_lock_init(&lgpio->lock);
>         }
>
>
> base-commit: d5376026f9269601e239545e2ec4aea0cc62bf2a
> --
> 2.47.3
>

