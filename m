Return-Path: <linux-gpio+bounces-25852-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C15CB50C3A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 05:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4AD54618F2
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 03:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD2725BEFD;
	Wed, 10 Sep 2025 03:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwKQHOgc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038E5247299;
	Wed, 10 Sep 2025 03:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757474007; cv=none; b=HRLBQ/E72xmAPGVnjxGmSJFrbT3IA72blI5lVipZh4jtXyz2h6Yz7j6xys2OE1DW9JWsv5DMnHnQH7YullHVQmAuDvsMdKYyRtKU1WXSiwOkL9nslPqHR9i1hwigZUkxQJGHeGdT4MAaPV8GsCvmfM6n3OTGFe4GQDw/Q3SpYmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757474007; c=relaxed/simple;
	bh=Pm+tVoUwjsA1EAA14sQc9PYEDvzSFjODCNF1ByORv/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ECaCIZxnhppatosIB5q5/6WXqQzpqVW33Gy5SnxRcluwysJ9rzp1ddCxJD7Nc3662fTwmlSzocbGBPVoiAcI3ZoDwgQGOfcbMQbwAkA1kLOSIlJzDNwJu0ce+fIoJdtpQvTlDxeg6LaYVJRgWVxLrR3+YQhJJLCtXYmXP0rEWIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwKQHOgc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B71C4CEFD;
	Wed, 10 Sep 2025 03:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757474006;
	bh=Pm+tVoUwjsA1EAA14sQc9PYEDvzSFjODCNF1ByORv/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JwKQHOgcf777aQEPMWA1WrboOrS0WJ9xBNTk2ujVU3wGr7PX/oCNY6p85pH8BM3dS
	 xClDgmz0qxYktDS+4GM25/Dg0eXG8Z20zfzVPhFEUmlp4O3IFzCugO84lFN8oqyoao
	 daCL+WnYpZNQUPfeHgrthGVuS1BtaQTQUk2epgIgJxgZ+4KPIH7kVvOcuCXXCFaipu
	 6jukJhwClmjWrs4Q1AcDjVd513AM+Rhy7Y2aAg8ApyQwyMDZiiTisR6K6k5Ve8+llU
	 Ix7RAD6kX6KXknMl9Rhth46PUafNDNVcomFE4y6kfVFpcpiIDqSXh7Y//3mqrc1YI9
	 zojDG9vU3zEyw==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-621b8b0893bso7946130a12.2;
        Tue, 09 Sep 2025 20:13:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJuPIpZedBLwdYNhf9GhvRk2vMW3ysmRZOsnnNlNV55KTm2SVpfLQnXh2r8VgLvurT6gmCGM4DPywbp4XgftQ=@vger.kernel.org, AJvYcCWkFzTEwgeNU5NU8Xmt0vY8j/2/Z9JtmE8jLVLMFVwXc+KtlMa/x+v+R1xIOqvbU/inOx54KftickdXHrx6@vger.kernel.org, AJvYcCX8IL1uZJ/sHfJGUs5tBirBNHDTMQfCM9IxNKcKgzg1PBdoxNj+lNZw6qwcZc1XHemNTy5vFoqIM20K3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyEZxyi773tuHyIx1YCbQ9/aQb7zb1cNXvTJV+TcMYhivOLvDl
	ic89En0XTbMB/EUxOXgUDseFcp9XgOsFNyZwCvTzLmihLdAI2CnJFEKvNCizpXUnlmiRwZp4gc6
	RHXkeU4krZ4FxdRoOcZ0KfebYdrxQQgM=
X-Google-Smtp-Source: AGHT+IHqycEiu4p+jBhCmy7YhtpJP/ZZ92m6j6qfjhy5tcYiXfH2wUPch79IEIxrqACD0IcLf1ov3Yg9ClqN+2u50j4=
X-Received: by 2002:a05:6402:24cd:b0:61c:9852:bbb0 with SMTP id
 4fb4d7f45d1cf-6237ebc6f49mr11799208a12.19.1757474005005; Tue, 09 Sep 2025
 20:13:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909190356.870000-1-colin.i.king@gmail.com>
In-Reply-To: <20250909190356.870000-1-colin.i.king@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 10 Sep 2025 11:13:13 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6C9BdQ3uXaKpasLTPFQqNRuA8JTsCE6ONF07fshVJMYQ@mail.gmail.com>
X-Gm-Features: Ac12FXw581urdYIvQB1ULdc6-tFqmQR-SAoJRKh5X4BecvRc9gtCLNy2ySC10Cc
Message-ID: <CAAhV-H6C9BdQ3uXaKpasLTPFQqNRuA8JTsCE6ONF07fshVJMYQ@mail.gmail.com>
Subject: Re: [PATCH][next] gpio: loongson-64bit: Fix a less than zero check on
 an unsigned int struct field
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Yao Zi <ziyao@disroot.org>, linux-gpio@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Colin,

On Wed, Sep 10, 2025 at 3:04=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> Currently the error check from the call to platform_get_irq is always
> false because an unsigned int chip->irq.parents[i] is being used to
> to perform the less than zero error check. Fix this by using the int
> variable ret to perform the check.
>
> Fixes: 03c146cb6cd1 ("gpio: loongson-64bit: Add support for Loongson-2K03=
00 SoC")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpio/gpio-loongson-64bit.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loong=
son-64bit.c
> index f84f8c537249..24b7219db34a 100644
> --- a/drivers/gpio/gpio-loongson-64bit.c
> +++ b/drivers/gpio/gpio-loongson-64bit.c
> @@ -267,10 +267,13 @@ static int loongson_gpio_init_irqchip(struct platfo=
rm_device *pdev,
>                 return -ENOMEM;
>
>         for (i =3D 0; i < data->intr_num; i++) {
> -               chip->irq.parents[i] =3D platform_get_irq(pdev, i);
> -               if (chip->irq.parents[i] < 0)
> -                       return dev_err_probe(&pdev->dev, chip->irq.parent=
s[i],
> +               int ret;
> +
> +               ret =3D platform_get_irq(pdev, i);
> +               if (ret < 0)
> +                       return dev_err_probe(&pdev->dev, ret,
Then this line becomes short enough, and the "return ..." can be in one lin=
e.
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

>                                              "failed to get IRQ %d\n", i)=
;
> +               chip->irq.parents[i] =3D ret;
>         }
>
>         for (i =3D 0; i < data->intr_num; i++) {
> --
> 2.51.0
>

