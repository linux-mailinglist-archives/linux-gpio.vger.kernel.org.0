Return-Path: <linux-gpio+bounces-12550-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D73A9BC4CF
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 06:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FD531C2121D
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 05:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF091C231D;
	Tue,  5 Nov 2024 05:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOesXvlN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB57183CD6;
	Tue,  5 Nov 2024 05:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730785500; cv=none; b=ptEgEjCt6waozvRHXyMpV5GBSV5f4tT0f/YiZ2rdWGjmmdDocsDFEQQATT9bV7A91kmu9lzIjgIX/2k2BfSugDmfwdGrbeeC1ffRcvsu7oe8GiEoG5BQ8zn5VeAHxlVznFHLmL2WeUpxsvvD0+8U1Xq/G26NQFOYuGZn/FptBUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730785500; c=relaxed/simple;
	bh=addazq6n2l0kd7V2RYOfC/z5VRexbSCbfjbLGPgcVMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvXl8Ii2Hu7oMPdws75bjl+OEqiF6CPKYDE6f/h1rbrkhWy9f8JC5Uw9HKZc/M9aNtVKw3e3rueCJ27/zzxmpczF3W5G4aEqAIQ5CCVoTkXKOrMzrIZvp5ujcJzexI5x49zUR+by1lXEwdyhobRDOIo7xNstIVNptotV4W2Q5yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOesXvlN; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e56750bb0dso3494524a91.0;
        Mon, 04 Nov 2024 21:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730785499; x=1731390299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKFlu1rGSsQukvkT9KeloJW2B0c6Ugz4QlXCY6/YUKw=;
        b=TOesXvlNE29IIyBxwQFnOTcG2Pw14g4cMY3M7m4fCi8S6m6f65S7tQ1jUzuKtfNzkR
         ATONrzUko6zI3eKoDCaFAmNS3YjhItbr5igqeShiV1IK5+KgtuL/RiTsHnkPU+u9I0sz
         ErwJs5J1BkwK9YZVn6YLa7t8IH6RDpp+ZaHFZiw+e9t2lSOEYn4s9L4GivnduFzSqwI2
         H9DZ31NaNLLdZEW6xAzYtAMSpjx0hfRi84uiNFiWzgDYFq2rVM11mifOmj5iqZzJOxm4
         RVtTLD/cOailYg+M9XSzZNJOF9THFRYsNk+mxj1yM0hv3vAHoFLwGTG5Bx5yMxJE2sFc
         EMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730785499; x=1731390299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKFlu1rGSsQukvkT9KeloJW2B0c6Ugz4QlXCY6/YUKw=;
        b=WA/QhSUuIto/+jJ0Rj4W8ITX15FLNzbKEXiIyF3nqW9ObuGHlUY/iBHWtja1JlU5rM
         cvllGiFpek26CaLwbmRgtmY1F+TjgBakSg2E9zamr1l99oWQquLcQ/at3yq4EPZBbYhC
         5XKoYWlRM0b2D+LY8M23jVUjm1RWOZrIa3r5r7w96Ja34KbxNSymQoVLsa9GL3EEK0KB
         Fx39VZUfSw8ajI4d8x9JUrZ+XN6I/9y98UfALKF8gM8pFfkSktXrX7101J2q8e6+r+NA
         F6CzrVueodLI6RPcv+0yYOkYkPHf7TXm9HVkoa4qKZmKn+sKNxdE0KX6TlvzbJPHGZcj
         0Bfw==
X-Forwarded-Encrypted: i=1; AJvYcCVdb4gtoJmtui4gWZOhnsDXCkAHFwiQrd5Loh+03IPGjcDmW/6VZjMlSZKQ0Cy9zLMZNDT2zjEEeTM8rA==@vger.kernel.org, AJvYcCW4VY+LLIm0TJD0AY92wSiS2mJ5lmNhXUlYn24eJiwz8F3/bc4/HDlyGeWlqvHvG7fsBg21AWJJxFUr@vger.kernel.org, AJvYcCWVsImvJ4eDsmDS8yx1kPPuSii9Q4MPD3T6tbCv4O6altFifarAO6c4KIDRMflUtkkDpELKPikjTc+Z@vger.kernel.org, AJvYcCWbtZcak9JWAOzt5QJCh0SHLfmm7/uN1Y6OrcbuFsGp1dIslqm4/1+26F123+CM0r8WQt/+hulyyGn9WdY=@vger.kernel.org, AJvYcCX8d24kfGNiiXaF8mWljkzl8SM85QFKgdTYUEAdrMJ1FL2+RxCNk/RW3bFcEBu/rPv6xbqxJdjik4cVbe/w@vger.kernel.org
X-Gm-Message-State: AOJu0YzJJoH7Wzp//EjTGGK/PoFmghksoFKONHaaEDvQ6orbl3tqrpct
	DnvOnFll9USExY8HBclE0EYzrMlMMPn61ASFGtVbWwDfuT7qF5I0
X-Google-Smtp-Source: AGHT+IFfGfuB66JHWO4NcWfWxC0I2kdjg/uIghAr5FZPGpr7sHO9jl2rgL06JW1h83pKw8joHp3FzQ==
X-Received: by 2002:a17:90b:4a91:b0:2e2:c423:8e17 with SMTP id 98e67ed59e1d1-2e94c295063mr21438945a91.7.1730785498509;
        Mon, 04 Nov 2024 21:44:58 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:1bb4:1f23:1031:ac0e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056ed8c7sm70499875ad.53.2024.11.04.21.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:44:57 -0800 (PST)
Date: Mon, 4 Nov 2024 21:44:55 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/6] Input: gpio_keys - avoid using GPIOF_ACTIVE_LOW
Message-ID: <Zymw17NOSw2zciO9@google.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
 <20241104093609.156059-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104093609.156059-2-andriy.shevchenko@linux.intel.com>

On Mon, Nov 04, 2024 at 11:34:19AM +0200, Andy Shevchenko wrote:
> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
>  drivers/input/keyboard/gpio_keys.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
> index 380fe8dab3b0..5eef66516e37 100644
> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c
> @@ -531,12 +531,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
>  		 * Legacy GPIO number, so request the GPIO here and
>  		 * convert it to descriptor.
>  		 */
> -		unsigned flags = GPIOF_IN;
> -
> -		if (button->active_low)
> -			flags |= GPIOF_ACTIVE_LOW;
> -
> -		error = devm_gpio_request_one(dev, button->gpio, flags, desc);
> +		error = devm_gpio_request_one(dev, button->gpio, GPIOF_IN, desc);
>  		if (error < 0) {
>  			dev_err(dev, "Failed to request GPIO %d, error %d\n",
>  				button->gpio, error);
> @@ -546,6 +541,9 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
>  		bdata->gpiod = gpio_to_desc(button->gpio);
>  		if (!bdata->gpiod)
>  			return -EINVAL;
> +
> +		if (button->active_low ^ gpiod_is_active_low(bdata->gpiod))
> +			gpiod_toggle_active_low(bdata->gpiod);
>  	}
>  
>  	if (bdata->gpiod) {
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 

-- 
Dmitry

