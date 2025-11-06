Return-Path: <linux-gpio+bounces-28216-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DB1C3C758
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 17:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07A763B46E4
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 16:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53BD427E7F0;
	Thu,  6 Nov 2025 16:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wvUD1/C5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC5534E759
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 16:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762446225; cv=none; b=geZQsUjFTM1Gjh2NtgPx+akUAvEXazb2VNRWSecw8L+qXJ0rJD9nE7Vg1mkNs+R3y//yoaIhXTl0WyCyxsiX2WmexPDA1DMr57AIXsctEuGgiRodDR7NBHnIois+ie3gbzNEwYCRP2vr6OteWlUOrHHVQTBMA2aWuHH4gqHoxwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762446225; c=relaxed/simple;
	bh=YTAV673+QrOkXADhUBZe48WytOszJ99DYO3A6ui9NU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SIKqlVZU+ET1ECNEHk0kfHmFCm3NQMfAycD+aOeZ+KxyyeP5xaXdbjyt1r3EalYJAdDNBisFZE9bjH0qhel0RJGRQRDziTSpNV1n8InMz1NffR8hLJrEsjQhEkgmUTIMB866pYhXVPzvshHhJkjG4B6Zn+JTU1tmaUmij+i06yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wvUD1/C5; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-592ff1d80feso1189570e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Nov 2025 08:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762446221; x=1763051021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8aL6w1TYvGrl1UBIVVUpuAsDW/dJzd3vY+/verHnfg=;
        b=wvUD1/C5szuDMw852fL0hAnKRuznr9NNJ7EVIvhBZo/JtgxkuxF/t5/sYI6B2KwEwJ
         DQkqMugr1A5AmOgnnJ/A7O5kMD260h7por/N4xAw8VA9p6TexJwoFRCodOLyc9dM6XBI
         vDgDVPsRlJJbA+XBC94vhifVZFomy43ehGNvhRsjNSa29aQHNH/TVAkC64ArG4jfU1oe
         1hoxxaLT06VucPQXBbGkVJNP19grqS9XNhw27vQ0OW8bn5F1XCvsPNfwdzmyDzclKjSr
         7Z+0LhNXNr39MLXCQO0TY2wC066Vfz4wBy6Ni13l4a8XKH/9bPgdmmGJDN7naYy8hNmI
         20pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446221; x=1763051021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8aL6w1TYvGrl1UBIVVUpuAsDW/dJzd3vY+/verHnfg=;
        b=FVgr1eCOSWlo0rqMa9SAvgRClyjFYwJw4FOjoKpouk2P2DT/LVdasV/QJ5MKRMPjqH
         5wTmTPTpYyKYiH7J5mu+A4w+ta0P2+IymcTkAV3y8VS5kJ1Q3cLbm69z4H5MN9JEE2OD
         x3RtdpOAfifreXJ34QwJUudF4mTQG0MHblpuZsCpq+psopg2jBTFqJTkcImiFE1IbuvZ
         WaAjo4P4XHctvFn2/QKWl7GYSrVgPi2aBbZMAJ8b/tURk2iZOT1hu3LPuvtEqD9Mv3iQ
         ZXSXt/hOGYe02vtGZel+NRlsv4jl9a1WnUmT4GlUOxT9dkyklSlWk66qzmMAm5TKjeTu
         wKUA==
X-Forwarded-Encrypted: i=1; AJvYcCUjp+KQ5Z2RNu4KlfpCGUAIBykciCCjzQbU1MdgGKRDKSkE1vOlcHGGldjeumm2ex+zTm8IyrD6Jh3/@vger.kernel.org
X-Gm-Message-State: AOJu0YztVixwxe8zBvrExs/FTaQwlikb9mooS/sHwpmJo16EKS6NGUtv
	9yYn6Qa+EyIPy5b+oZLSli4n46IrhGnl9xY7qoRi4YLhg0ysGH/Fp5+qmr4nHUWkp83kY7pOmxw
	gk9xBqqPv2OX0wZ8bDGHglwHouXBlvMolNwWilK9C+g==
X-Gm-Gg: ASbGnctDnoPoW8nFVxOVXR/2qZo8ZxKvHco7tartxIdIa4reruMFHOwSVwpUKO4MQsm
	QefsJeIZai88gvIpmUVCiLBi4vIsFb/rumxPF0oq7rZOVlv++XDV46zM7P8oCO60G/ONWyvw7YO
	q8iAFfJFhXoTBi6G4mRH7GKFB9cGFVHU5u/rgmuEI65KiWpVsU5kBkOk3nOOeqcDXUUYUJEJYIv
	+3U8PBW5wyr3PFiNDn8vcpWQO9LgzLoCT3cYBtrjXQ2nDanLkKuN76JcA37uDhKQy5NzYdaFujI
	wY6hKkSvHsGSdDA=
X-Google-Smtp-Source: AGHT+IEE1H2M6E68md2CvbeNASgGUriHWVB9qaOo9QOrW+nmquKWYbcNGDJmBvvG61zzqmoVo8F4qdYMWY0LOpJw9hk=
X-Received: by 2002:a05:6512:10d2:b0:594:35b7:aa7 with SMTP id
 2adb3069b0e04-5943d7ed597mr2555824e87.48.1762446221207; Thu, 06 Nov 2025
 08:23:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org> <20251106-gpio-of-match-v1-2-50c7115a045e@linaro.org>
In-Reply-To: <20251106-gpio-of-match-v1-2-50c7115a045e@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 6 Nov 2025 17:23:29 +0100
X-Gm-Features: AWmQ_ble_VVUCkQMV6BUnht3lKL4n7LMuzlixMmgduve1Vk6OdDcUVcnzGZ5wm0
Message-ID: <CAMRc=Mchtho0yDsSp+wwBt=yBGg1+3i8ifkUrip1MJaq-uk+0g@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpio: aspeed: Simplify with of_device_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 5:16=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Driver's probe function matches against driver's of_device_id table,
> where each entry has non-NULL match data, so of_match_node() can be
> simplified with of_device_get_match_data().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpio/gpio-aspeed.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 2e0ae953dd99..3d675b63936c 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -1305,7 +1305,6 @@ MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
>
>  static int aspeed_gpio_probe(struct platform_device *pdev)
>  {
> -       const struct of_device_id *gpio_id;
>         struct gpio_irq_chip *girq;
>         struct aspeed_gpio *gpio;
>         int rc, irq, i, banks, err;
> @@ -1323,8 +1322,8 @@ static int aspeed_gpio_probe(struct platform_device=
 *pdev)
>
>         raw_spin_lock_init(&gpio->lock);
>
> -       gpio_id =3D of_match_node(aspeed_gpio_of_table, pdev->dev.of_node=
);
> -       if (!gpio_id)
> +       gpio->config =3D of_device_get_match_data(&pdev->dev);

If you're already doing it, just use device_get_match_data() here and
elsewhere in the series.

Bart

> +       if (!gpio->config)
>                 return -EINVAL;
>
>         gpio->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
> @@ -1334,8 +1333,6 @@ static int aspeed_gpio_probe(struct platform_device=
 *pdev)
>                 gpio->clk =3D NULL;
>         }
>
> -       gpio->config =3D gpio_id->data;
> -
>         if (!gpio->config->llops->reg_bit_set || !gpio->config->llops->re=
g_bit_get ||
>             !gpio->config->llops->reg_bank_get)
>                 return -EINVAL;
>
> --
> 2.48.1
>

