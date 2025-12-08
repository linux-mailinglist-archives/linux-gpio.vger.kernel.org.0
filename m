Return-Path: <linux-gpio+bounces-29357-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC84CAC092
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Dec 2025 05:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8566D3017F09
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Dec 2025 04:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5FC1E0B86;
	Mon,  8 Dec 2025 04:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/3KtXR8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16783B8D6B
	for <linux-gpio@vger.kernel.org>; Mon,  8 Dec 2025 04:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765169310; cv=none; b=nWa3DWhgN2cGHrgXkZ+j29D9scj03zf1PFwz0TywUucMFcDNM3KgLOaRs6lZBJagVUqhoTGWesa4PA4rSabd6EkltLTHYOMF8HvphHoHN0bgTolvRidc6BZQ2k4kmY9SD2Ud3odowflYB9wNjTVaw6hhw9xYJ1xAzk/5YuvTMNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765169310; c=relaxed/simple;
	bh=U06QhChZKx2bmiQF6RRhzFFQ87RA67jPMdsGmcOeeHk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6hNj2Q8dUbUv0DhekgO7Kh8b1NbmUdtjlXrVEm+gWB/UarycqD48JZ1T8XcuTf/Ya0Z9qVIkMF1WO4QrjQAYfvA5zHAdcK54cxYDD5YKENZJ9bOw101MobtbhYsfRMTVgMA3/GDhASpC3/h6KqRy8GPS/1L8v0KwY8/o8xffaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/3KtXR8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765F5C19424
	for <linux-gpio@vger.kernel.org>; Mon,  8 Dec 2025 04:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765169310;
	bh=U06QhChZKx2bmiQF6RRhzFFQ87RA67jPMdsGmcOeeHk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=Z/3KtXR8Jn/g0jn4+4yj5OZn0qxEU5Q9+QJR98nWmt/9sliuC9kiqjQuaj/Qwnd/a
	 0+4Zy1EJjfCYU9tjO2t3gJ39sJnGfJZeyjszwqW3DJPQcdaqX1lPT0YVxUx4zMr746
	 bKJwBbYhulfByjqc+2MVtIj9Nkz+Rg6HVH7AEdR/6I2HXznNv+e6uv5XWCcCPF61pi
	 35tZmHZvEjjpVHP60nCejMxkkMkVYfMxC+4dlgmha+i0Fje/ipy/9bJOrw5egqFFKP
	 AckrqJ/irnBQgM+HF8hnz8pidiweKGclusDvMS4iei1AHLU4utXaL9YyHT6YdiUEmr
	 TUz/WKcq29EJw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59428d2d975so4102965e87.3
        for <linux-gpio@vger.kernel.org>; Sun, 07 Dec 2025 20:48:30 -0800 (PST)
X-Gm-Message-State: AOJu0YwMeA0MWwLbxHi06ibG8piILSPjNN8nyTOF697yZKs/R7e3eAZQ
	RV9yK9rh0CErUUKissFQXkvfWdGPxrpURLDcD+gyaa6zWmiDH+Ge+jl4+drEBFoNGMrmXu7Yi5t
	zBcAopEUQs9vQEVMstWDUuhG9fEhwBalsgF6E3CHhQA==
X-Google-Smtp-Source: AGHT+IEglGMTw/0NIB7BymKkmsEWMWY4xqrTd3qO2i8xPTS8cVfEcd3bVjNGV/6cnaEWU/XMsQTyEXZXDOOqglr6C0s=
X-Received: by 2002:a05:6512:10c3:b0:594:51ac:13e with SMTP id
 2adb3069b0e04-5987e8be763mr1426456e87.17.1765169309059; Sun, 07 Dec 2025
 20:48:29 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 7 Dec 2025 20:48:27 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 7 Dec 2025 20:48:27 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <bd0a00e3-9b8c-43e8-8772-e67b91f4c71e@gibson.sh>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
 <20250423-gpiochip-set-rv-gpio-part2-v1-5-b22245cde81a@linaro.org> <bd0a00e3-9b8c-43e8-8772-e67b91f4c71e@gibson.sh>
Date: Sun, 7 Dec 2025 20:48:27 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mc8ViSPyTn9Brr-us2V+D7Jv3u+B8Ek2nuzF36yH70RAw@mail.gmail.com>
X-Gm-Features: AQt7F2oGzDmTWNj9eMqY6ksExRm8PgQHZKXZzR2EdaLKtTkgpmQR6QdZ6gL8zes
Message-ID: <CAMRc=Mc8ViSPyTn9Brr-us2V+D7Jv3u+B8Ek2nuzF36yH70RAw@mail.gmail.com>
Subject: Re: [PATCH 05/12] gpio: it87: use new line value setter callbacks
To: Daniel Gibson <daniel@gibson.sh>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

On Sun, 7 Dec 2025 05:55:15 +0100, Daniel Gibson <daniel@gibson.sh> said:
> Hi,
> I got one nitpick/question about this, see below
>
> On 4/23/25 09:15, Bartosz Golaszewski wrote:
>> @@ -249,7 +250,9 @@ static int it87_gpio_direction_out(struct gpio_chip *chip,
>>  	/* set the output enable bit */
>>  	superio_set_mask(mask, group + it87_gpio->output_base);
>>
>> -	it87_gpio_set(chip, gpio_num, val);
>> +	rc = it87_gpio_set(chip, gpio_num, val);
>> +	if (rc)
>> +		goto exit;
>>  >  	superio_exit();
>
> Are you sure that superio_exit() should be skipped (with goto exit) in
> case it87_gpio_set() fails?
> After all, superio_enter() above (not visible here) succeeded,
> only the it87_gpio_set() call failed.
>
> Of course this is kinda academic because currently it87_gpio_set()
> always returns 0, but if it ever doesn't, this might become a bug?
>

Thanks for bringing it to my attention, you're probably right and thats's
just an unintentional omission on my part. Do you want to send a patch that
will fix it or do you prefer me to do it?

Bart

