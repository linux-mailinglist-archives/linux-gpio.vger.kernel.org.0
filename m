Return-Path: <linux-gpio+bounces-2218-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC0882D6CC
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 11:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2291282427
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 10:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A445EF9C2;
	Mon, 15 Jan 2024 10:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BwZ5vyuh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFA6F501
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 10:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4b7e0f53437so1328586e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 02:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705313304; x=1705918104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efODqsh/Wl08N/goCwZasLOsqyP/O3Ymn4r3aDCKE3g=;
        b=BwZ5vyuhFfCRgjLFHnALuvJInkFjQSaHaU2lfG0HlcK61zwCaCAjSlH0PVAPFZ2WM+
         ObDpwfiTzIxnzBwj97H0RWvaZpX8HbQgD3o0kYddYMXVBZSHJiq1FC6Wj5prTrQxSmbB
         h/GHvmX9lTnTNprvv0MEXB5EY3/sYJ/X9mzBBc98xBpcLqdRLRbO7Xt8qUlC7A804UlM
         LztxhRsIDpZt9RV6AAOsToIGY+/R1i4bTkuo1m9N3NWkz7b2M0o9SpDCzRcNBl78Dpnr
         IIgcgnGYqsxwX3uHDKBg4hQIpn2x2EpAuAvnuaT3PSDshZSVAP7YtMQhfR4ithUl4Ml8
         q2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705313304; x=1705918104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efODqsh/Wl08N/goCwZasLOsqyP/O3Ymn4r3aDCKE3g=;
        b=TeJLgUTEu4roF3Gao40yVzots/zlREJvcA9XAL/MMPE3P8GdJ0EYEKMjxGT52iq8EP
         yY+gEdMMcGBI60fg8YnOJyVZuCCtgfqCAn6ePrSsnNGN3OgQoSw+MGh8ugB0s9QYYvXt
         1ReLWAc3+VUGiPi0JK43NLnxmoSCFwUh+NAQ2CpPvWHRx+Glui/D+tw+Om3KieWDtl0j
         i5IePBNxXFuGEbjGw06hNSe82HAeJQVZ4Z9BpzYYdEdYQs9dHUDUnFpMWnecmpCWUP1F
         qNia2MZDL/lqqN9goL633lPRb1jrmLNp/fSLJv2rHNGQE1XTsKbzbYcxhNQCIr136jDw
         tKQw==
X-Gm-Message-State: AOJu0Yyu/zr1If71e7Tn1gBF+WWC26hv0/mBJX4dS30A9T3T6UY0l/Ue
	FTAnVOP+JD0nRFXWyllWi4pw6n8wOimlsPSbm8YB8OqDw7EmWlpNJiFNEVer
X-Google-Smtp-Source: AGHT+IETlR4T5bCqb5OYA+dXN5zKz34DkovXoN/ieCB58XwGeJaG3G1kreKuWxdb7fvxB3tN+vfWOFMBughb34hu0kc=
X-Received: by 2002:a05:6122:1988:b0:4b7:8794:17cf with SMTP id
 bv8-20020a056122198800b004b7879417cfmr1557938vkb.18.1705313303911; Mon, 15
 Jan 2024 02:08:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <46566e85-4afa-4c55-93b2-0d0b71d76b12@moroto.mountain>
In-Reply-To: <46566e85-4afa-4c55-93b2-0d0b71d76b12@moroto.mountain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 15 Jan 2024 11:08:12 +0100
Message-ID: <CAMRc=McCVRNpWjifPC=LTW7icF9SkbaQ9jEryM=TcHFy-tQ7dQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: rtd: Fix signedness bug in probe
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tzuyi Chang <tychang@realtek.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 7:55=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The "data->irqs[]" array holds unsigned int so this error handling will
> not work correctly.
>
> Fixes: eee636bff0dc ("gpio: rtd: Add support for Realtek DHC(Digital Home=
 Center) RTD SoCs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpio/gpio-rtd.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-rtd.c b/drivers/gpio/gpio-rtd.c
> index a7939bd0aa56..bf7f008f58d7 100644
> --- a/drivers/gpio/gpio-rtd.c
> +++ b/drivers/gpio/gpio-rtd.c
> @@ -525,18 +525,21 @@ static int rtd_gpio_probe(struct platform_device *p=
dev)
>         struct device *dev =3D &pdev->dev;
>         struct gpio_irq_chip *irq_chip;
>         struct rtd_gpio *data;
> +       int ret;
>
>         data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>         if (!data)
>                 return -ENOMEM;
>
> -       data->irqs[0] =3D platform_get_irq(pdev, 0);
> -       if (data->irqs[0] < 0)
> -               return data->irqs[0];
> +       ret =3D platform_get_irq(pdev, 0);
> +       if (ret < 0)
> +               return ret;
> +       data->irqs[0] =3D ret;
>
> -       data->irqs[1] =3D platform_get_irq(pdev, 1);
> -       if (data->irqs[1] < 0)
> -               return data->irqs[1];
> +       ret =3D platform_get_irq(pdev, 1);
> +       if (ret < 0)
> +               return ret;
> +       data->irqs[1] =3D ret;
>
>         data->info =3D device_get_match_data(dev);
>         if (!data->info)
> --
> 2.43.0
>

Applied, thanks!

Bartosz

