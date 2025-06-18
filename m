Return-Path: <linux-gpio+bounces-21822-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C23ADF526
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 19:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 482344A3260
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 17:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5050E2F49E8;
	Wed, 18 Jun 2025 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faZ9iWuv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9023085AA;
	Wed, 18 Jun 2025 17:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269231; cv=none; b=KgliT5G5z9w4QMfkcACFYayFKGOkHbZaceyD6rD9YZYWNK4+oWj8MqkQg0gBESw6yw202HPim26+tFfasF/j9ND/NbfOk1RSVn17joDHGl22wyyKg45xk8o3A6sw5fT6AQ6CndWIx5PTq5sQsBjgK1ANxCv/MG/uoeXXkmjmWYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269231; c=relaxed/simple;
	bh=WELV8YgJbvt6iCJoz5AP8I6DHYf0HK+MqHNweU5Vmyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdVJvWKJZtGWHii8kRwvZp/DB/K+r8qClE8awmwHb6N368ZJ30bAXYyT+ayR1/4K1axYLx0eetGctbT3gyzO/BxjFECKtHnOv4tQQISrTlAsbymBQWsfZBY8FNhYa8+gCHIvoTaAUB0X67pkeuS/XQeLsbSPbBzo3FNxfBjWk3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faZ9iWuv; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5534edc646dso7722850e87.1;
        Wed, 18 Jun 2025 10:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750269227; x=1750874027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p84+wxDg4u34Lm55oq6WOvopLTPICI6s2ti0ZOixglA=;
        b=faZ9iWuvmBscANSMtFaZTE9sENYnfXJtQ+bw2MPcejXU5kjf3fUJ4+lYbwrc2OIRFQ
         keaxnEtF/BHttY7J6oy8Y4bV0wZsiosLjdnnDap46Sj2KcPnlwR5zhl3iehb7eQv9P1g
         yC/5d7dSo3gqL4Zg1A4qRVkQ/l3L33MKYZ7/WM7J26bpzoJUkZwN2DahEwVF4qpGqXS5
         vItdM4/oDe4OcXv4n1/GXRsac5ne09t3fQQXIIvIv1tYRC/k7vLNM38Eugzo0+CYKExx
         LEOlVsgPpc1pkKsNanlpX4FrnA6XqjoidVw8Dke+9w25XgzmP9zocu8cC9YZcPx7eCQP
         WCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750269227; x=1750874027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p84+wxDg4u34Lm55oq6WOvopLTPICI6s2ti0ZOixglA=;
        b=UFDZHi0xC72zNIPrT3aAYw7EDF+lKQUfMAm04zCTigWLW+flR+Ous7KV/jetVyw6l8
         3U0asSoaZIwC0jHS0cyFFh2EbIpPnP/ZtWytfZ+xJFw5e1fP1XqAp4eHFosamUt5SlOG
         NVGNN4gGjohbvKwPGDZcaCs0Ms/nIasZo4Axb25adjSHP25sD5rbww/i+zgkKIj+ad1g
         tSEfiMjWFi3PzYg2a/4+w7MXs0842s7d3l241a02LnocpnOmNJn4+YcWL5UyvOjUIWkJ
         ZXE9ULG2VGmSdvnLn0gb3emcl6+V3YPuBloyC3hgvcfXRgWXYocA7HgmjbYvMdNy6yje
         gGBA==
X-Forwarded-Encrypted: i=1; AJvYcCURA34HL4ouOcTtlZYibouYEcO5VxAXKqsg0NfIaAh4vvq+pS8ARfjdCUKPkMNpWdThKrSNxpeTEo4OMWar@vger.kernel.org, AJvYcCV8rLHezivod82P/A7DajNDaKOiqL5JemTItDpEufC0zwYY/XRPwpd8hB7N77HRPmqdUmSsTAQSz5H8@vger.kernel.org
X-Gm-Message-State: AOJu0YyhfHOw9xq34uGLguGeYzgqQdVgNL8fGiPTX22iYygnfwc+l5gT
	kmxLKSl2Mh3aji76imkiNngswlcP2NidA15E47VH8UzbGmXV7YWAXEIc
X-Gm-Gg: ASbGncs64VV6MGrWKViuxx1GVAIdmLngHId5zaMDXhE1Vhi9bj+8jhsESgJl59F5wyV
	CAQntUToiGNy1G+CgMuoWotbqto8dcQp2qytmy3gcpSz0B7ZEXJxD3Gfzd652nbMfgM1P5w4tVo
	ZzSpejSPBvwZRWBRoUnBZ+p0uNwBW5qW9y1oiYpEDQL1oqZpa80MsRe6DUVrYCPOqaZs/dX1lFy
	QG5gV40Qcaw5VI4eelYwlx66Z091+278njhOle4FiR9nlaLfgB4GTsGnmQJGyUgZrbUGpwGDc/E
	yg1mfyv3uUnXP3a7oH/y/b56CsZy+fLLV62BoCIqfqzWyTkKY/FSkIGZt0o53hDBDZFexa2QHpc
	IwA==
X-Google-Smtp-Source: AGHT+IEw2MUxlg+9z0zOxwI2HIbA//xXYjnaeyhIQ0EYOe7raQRMF7DADSBZ+e1Qc+mzPINdbbw/jg==
X-Received: by 2002:a05:6512:1193:b0:553:a272:4d18 with SMTP id 2adb3069b0e04-553b6ee2b8cmr5915844e87.20.1750269227022;
        Wed, 18 Jun 2025 10:53:47 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-553ac11ff75sm2315299e87.26.2025.06.18.10.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:53:46 -0700 (PDT)
Date: Wed, 18 Jun 2025 19:53:46 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] gpio: mmio: don't use legacy GPIO chip setters
Message-ID: <twqaezumdhalpivd46xkevzbfkwouwfrpr7wbw7yjeqcxberzv@sp36opkfttne>
References: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
 <20250618-gpio-mmio-fix-setter-v1-2-2578ffb77019@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-gpio-mmio-fix-setter-v1-2-2578ffb77019@linaro.org>

On 2025-06-18 15:02:07 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We've converted this driver to using the new GPIO line value setters but
> missed the instances where the legacy callback is accessed directly using
> the function pointer. This will lead to a NULL-pointer dereference as
> this pointer is no longer populated. The issue needs fixing locally as
> well as in the already converted previously users of gpio-mmio.
> 
> Fixes: b908d35d0003 ("gpio: mmio: use new GPIO line value setter callbacks")
> Reported-by: Klara Modin <klarasmodin@gmail.com>
> Closes: https://lore.kernel.org/all/2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-74xx-mmio.c | 2 +-
>  drivers/gpio/gpio-en7523.c    | 2 +-
>  drivers/gpio/gpio-mmio.c      | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
> index c7ac5a9ffb1fd1cc9439e3320d54574bf0cebbf6..3ba21add3a1c669171578ceaf9cc1728c060d401 100644
> --- a/drivers/gpio/gpio-74xx-mmio.c
> +++ b/drivers/gpio/gpio-74xx-mmio.c
> @@ -100,7 +100,7 @@ static int mmio_74xx_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>  	struct mmio_74xx_gpio_priv *priv = gpiochip_get_data(gc);
>  
>  	if (priv->flags & MMIO_74XX_DIR_OUT) {
> -		gc->set(gc, gpio, val);
> +		gc->set_rv(gc, gpio, val);
>  		return 0;
>  	}
>  
> diff --git a/drivers/gpio/gpio-en7523.c b/drivers/gpio/gpio-en7523.c
> index 69834db2c1cf26be379c0deca38dda889202f706..c08069d0d1045e9df4a76cad4600bf25d4e3a7c5 100644
> --- a/drivers/gpio/gpio-en7523.c
> +++ b/drivers/gpio/gpio-en7523.c
> @@ -50,7 +50,7 @@ static int airoha_dir_set(struct gpio_chip *gc, unsigned int gpio,
>  	iowrite32(dir, ctrl->dir[gpio / 16]);
>  
>  	if (out)
> -		gc->set(gc, gpio, val);
> +		gc->set_rv(gc, gpio, val);
>  
>  	iowrite32(output, ctrl->output);
>  
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index 9169eccadb238efe944d494054b1e009f16eee7f..57622f45d33e0695f97c7e0fa40e64f9fd5df1e0 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -362,7 +362,7 @@ static int bgpio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
>  static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
>  				int val)
>  {
> -	gc->set(gc, gpio, val);
> +	gc->set_rv(gc, gpio, val);
>  
>  	return bgpio_dir_return(gc, gpio, true);
>  }
> @@ -427,14 +427,14 @@ static int bgpio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
>  				   int val)
>  {
>  	bgpio_dir_out(gc, gpio, val);
> -	gc->set(gc, gpio, val);
> +	gc->set_rv(gc, gpio, val);
>  	return bgpio_dir_return(gc, gpio, true);
>  }
>  
>  static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
>  				   int val)
>  {
> -	gc->set(gc, gpio, val);
> +	gc->set_rv(gc, gpio, val);
>  	bgpio_dir_out(gc, gpio, val);
>  	return bgpio_dir_return(gc, gpio, true);
>  }
> 
> -- 
> 2.48.1
> 

This also fixes the null pointer dereference for me on the Banana Pi
BPI-F3 from my report.

Thanks,
Tested-by: Klara Modin <klarasmodin@gmail.com>

