Return-Path: <linux-gpio+bounces-30213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2F8CFCDD3
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 10:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC9C83041CE7
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 09:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAD72C3242;
	Wed,  7 Jan 2026 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbsFPiIU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527452FFDE6
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 09:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767777907; cv=none; b=aIoi0EfBpSeOjp7mh57Alr6N/ePF8atimqJgb8RDjCpn6JzthReIIuIx1c5GMKTyXc2qwvBvHkIyNxtjFuIxkMzTLTI4YYFq1kwUDU5uziTeG5MXz4qosw2c7m/UBNakXDVeuLYxKj3lFOi1HRroTMmo6HeD09qZumO0+dtdNLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767777907; c=relaxed/simple;
	bh=fjMVFlQNfF/Tvn6vpOODNhh+o9dtyfiwpzpLCeB2lrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xpzr8Vr7DYi0IyiO+FADlyJCyzEOn60nuW1HMIoSJzndJVTdb85/Y7DtwInkVIrTvI702mUQfURWd43akv/VMC5g5rWLFmk5JoIwZkJXrrJFknQ9GNyxPhKHqXJAEHB6GRAgWEu2ZSevOx6FhrqAl9wTThv54rGo9Yjeh/1yjbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbsFPiIU; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64ba9a00b5aso2582916a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 01:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767777902; x=1768382702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CwkMJv5FJ6wM0SfVxDZ1sKMFmxmOc2HwY8yL49JvVEk=;
        b=lbsFPiIUP8Dho7KCeHizotFwXEuwpoMny6wuOaOqLT6UNrmb+dfhjkoxjrNdTLYntu
         2B4WCIvOASHlHBIkqI+o8nazE4HWp6WgSoHbD9Hd1hBX1N7QlTaGNGlvo7PLNTT9WqTy
         B5eBFTGo36GLQBgPkgj9ET/1CSEf2+JbsMjgzyToq5baS884FulGPodWxUH1tO8qj1CI
         V85HLkvrW/RD7i83wikM0s/IAOa3TglDIq7ncBgMuRuFgeuoxX/iXIvzaHxGMnyyZQlP
         oFthOpXQG7jY7SDzJ1rsYMJ+Jmtt/kS38tio98QeAkgBi/MkLGEEdbsuUymuDKkyoila
         802Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767777902; x=1768382702;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwkMJv5FJ6wM0SfVxDZ1sKMFmxmOc2HwY8yL49JvVEk=;
        b=qlqRwPpWp2kycXT7824yVIX0p0XTGZFuWDnbb6Q7KOvdLgxzsYcur5otduM63YIJV4
         B4nLQzFz7wn4PF0EHu2/9B1yxKjnyCNvjgaSOclEFkp0fNVT0IIhI4/uc/oPqlCc+Zqh
         byDq8h274tChftPuwQ6SCH9aPLXMRZatn4LSOY9L+3FSLKxxYCEGItCXME73DkhBIR4Z
         j5p9Q2mqdEYDDCV3Iq5aw0aiT6l13ZiSm7drPXDUySiHHlbhzzmNOEPZURgzD9d0rpuq
         p7GVQo2zch1ELXKMKCMo4bE4m/T5yfyGKAeCHczV9CVVeIys7mD2tkhjD4nMNohWAR8N
         kBdg==
X-Gm-Message-State: AOJu0YylQcrSLPJ4NGzTO+qWZz1CD3X6ri5AqZxuKACj4IO55+ShCf+V
	cEUWAU1yzDke9JTtVkwFmzop4VQM7Cr6WhmFZrhaFroRVJvf6Em3yA+k
X-Gm-Gg: AY/fxX7aQRbU5ql6Md0FyhkMJpu74Ikh4GiPSxr8ygS4Et+BdLm30+kB3YojtWJH2v7
	WdzRd8/KMUpY3WAnhi0Jj6rc6kqUXAVdhjZpmTaerJ3Yne4SPuu9tkEVZroUJN8pFzMkrAMZTvo
	Obw0Tg7nFY09V9TeJcdZdNor84G9wXKAWGW4go2LWahy9yOVLaSDof1c5Ceni/eGQWe5EihL635
	LC0rFAdoE8nF/dtNxmhnIJpOc8wX50/2DrG855BXa7iU6Z6aIBx7Gdr+pGhtufjpgsdBd/5LTt0
	WjgZAUJYo5V/VDMAJX21CTRpMjKnMejqyyRYUctB7isO9MV/Rae+dgD3GL2IfVaqIvyf+doPke5
	kTekGlPWbpDCk9kQFD7reV/eHXqtz2ES6+7Ze5cb+YE0DaEtmvuEzm4NJN9yvsqrzpolLS5TP20
	N/omxPP/uIovvLODdP1/rhKrWZDacGEfLcHLtjaqvCrTEUKQHpvMwqUCTpGDCAU15rv68yhmTht
	FCDTfHsgAU=
X-Google-Smtp-Source: AGHT+IF5gTus43KHKJqt0E1pJCWbD2HwdQLbrkpZB5Dk88YTCWkkUkxD5wZuqMwRfHjHfPeR5J7n1A==
X-Received: by 2002:a17:907:9812:b0:b73:792c:6326 with SMTP id a640c23a62f3a-b8444c59fc3mr185201266b.11.1767777902136;
        Wed, 07 Jan 2026 01:25:02 -0800 (PST)
Received: from ?IPV6:2001:9e8:f10a:a01:d0b3:d625:5f5a:710a? ([2001:9e8:f10a:a01:d0b3:d625:5f5a:710a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4cfe60sm455098866b.45.2026.01.07.01.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 01:25:01 -0800 (PST)
Message-ID: <75d3d4ed-2288-4189-a027-05c5e9021a37@gmail.com>
Date: Wed, 7 Jan 2026 10:25:00 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: line-mux: remove bits already handled by GPIO core
Content-Language: en-US
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Thomas Richard <thomas.richard@bootlin.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20260107085833.17338-1-bartosz.golaszewski@oss.qualcomm.com>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20260107085833.17338-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bartosz,

On 07.01.26 09:58, Bartosz Golaszewski wrote:
> GPIO core already handles checking the offset against the number of
> GPIOs as well as missing any of the GPIO chip callbacks. Remove the
> unnecessary bits.
>
> Also, the offset check was off-by-one as reported by Dan.
>
> Fixes: 2b03d9a40cd1 ("gpio: add gpio-line-mux driver")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aV4b6GAGz1zyf8Xy@stanley.mountain/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/gpio/gpio-line-mux.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/gpio/gpio-line-mux.c b/drivers/gpio/gpio-line-mux.c
> index a4f384306218..62548fbd3ca0 100644
> --- a/drivers/gpio/gpio-line-mux.c
> +++ b/drivers/gpio/gpio-line-mux.c
> @@ -29,9 +29,6 @@ static int gpio_lmux_gpio_get(struct gpio_chip *gc, unsigned int offset)
>  	struct gpio_lmux *glm = gpiochip_get_data(gc);
>  	int ret;
>  
> -	if (offset > gc->ngpio)
> -		return -EINVAL;
> -
>  	ret = mux_control_select_delay(glm->mux, glm->gpio_mux_states[offset],
>  				       MUX_SELECT_DELAY_US);
>  	if (ret < 0)
> @@ -42,12 +39,6 @@ static int gpio_lmux_gpio_get(struct gpio_chip *gc, unsigned int offset)
>  	return ret;
>  }
>  
> -static int gpio_lmux_gpio_set(struct gpio_chip *gc, unsigned int offset,
> -			      int value)
> -{
> -	return -EOPNOTSUPP;
> -}
> -
>  static int gpio_lmux_gpio_get_direction(struct gpio_chip *gc,
>  					unsigned int offset)
>  {
> @@ -80,7 +71,6 @@ static int gpio_lmux_probe(struct platform_device *pdev)
>  	glm->gc.parent = dev;
>  
>  	glm->gc.get = gpio_lmux_gpio_get;
> -	glm->gc.set = gpio_lmux_gpio_set;
>  	glm->gc.get_direction = gpio_lmux_gpio_get_direction;
>  
>  	glm->mux = devm_mux_control_get(dev, NULL);

Thanks a lot for taking care of that!

Tested-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Reviewed-by: Jonas Jelonek <jelonek.jonas@gmail.com>

Best,
Jonas

