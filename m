Return-Path: <linux-gpio+bounces-12551-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DCF9BC4D4
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 06:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 257EF1C212D8
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 05:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B4932C85;
	Tue,  5 Nov 2024 05:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aG2LproR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B477189B80;
	Tue,  5 Nov 2024 05:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730785522; cv=none; b=WpQbis/Qh7XNcJxhSMg8ncQhelsIVzVsnCqvYjaFUGCWkI/zC+3fuet7A08wJtg4d0Ga9DA4JarCMvN5ncLeREpyq69gAgLuIcWWv0MUDphOnqOavzfEVQURJP8BLVAWrqVwgjzAP2hbJvn3o2IP8vElLm7NlsQxpPaCMtC8Odc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730785522; c=relaxed/simple;
	bh=pj4DDAoUIGokaC2yqQD6Sx1d6qPlmvPZHoKG6fJYE7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQGsvdlkq++iV6oWhaVLqBjPfXggrt5gGDuCRTXuRtzljY1QCgY4qGaXpYI5jpwCLNIwzH+zCwJJzgasBo7ppmmnbDvnwgGOZAUexXNETJe7RNZfRvOsIVqY6+c8HOMdv6FaBhx/2UzuE0mhlLMppumgrMF3Nwtkx548Id+/sA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aG2LproR; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7ede6803585so4354416a12.0;
        Mon, 04 Nov 2024 21:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730785521; x=1731390321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/RDLe17+douEMkUYt4Wjjg5zMXictGIxgKdWzTriDi8=;
        b=aG2LproRaL31sInjzNNpyyKMbtxVhzaI1F7RS/rmaP8OloFzi1OM+A8L+tPYY1DF6t
         f2iBSG/P31nOUnr/3bB/Jcek500N/lvZQ+YEpo+c+Q5+Yhyg8drLrLjGAwzqoH8Nrg+h
         2Lgp2GiH69LB1JdkWY9RNSd/gQyXgNqYPmHcJo0wO2iIsLcJQLG2ysDA5HVnXtdb+p1Y
         PyRoRxDZEfOUnYDPHoRR7AdeG7Z5nhxuyI6AR4k7Sec88G97txMEaG4xd1G/+9Ja40LC
         RONELe+eaWYa5evlSQ9ueJtW/vRCBW4qnfd0k4/owCk5o6vJgAuKFQr7GJwX1CV1EHkA
         732Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730785521; x=1731390321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RDLe17+douEMkUYt4Wjjg5zMXictGIxgKdWzTriDi8=;
        b=uTJdMg+IaTz1CzSL8CpcbmQgZR2kNOTQchs81AVKnfvSVg4bC/kuxo4M5fwnn5lcfm
         Wr0+JYw3hLwlXY5D7qLSUnIB/WF0WZK/MHdwhYrpoOMFzpGX04dztClzWWTI3x0ph1dC
         vff3cS7EC8bZ96qoHHAORWTYwiESP8+fkvUqtMgjQE9MhETPZEeMpFnTQCmwOwwFyNIA
         JMA4t3kUl8Ktvt6/G20NO5M4AONn9V/MV1sq0Dg98rnb5Kc8kDjJ7cjl73egDOblMgbD
         1yoVOAz7P1WOKo6sHNtYd5AXtcBC8/vNSWjRPIu7nfx/CRMiNtHTcpkAsER6N0fXhf+Z
         oYzw==
X-Forwarded-Encrypted: i=1; AJvYcCU11TfIgSzBPepy/vflvTiVXXhS49+kr901Q3YhTE3jaNf7oq4z12oey3oL2R5zfiMW8BDZvy46aFAY0A==@vger.kernel.org, AJvYcCU58bPnXMIfEaPIfxoYoPV0PYB/mthlLaH4nYaEPvS1RdAwb04wQaeBFebq6OCCys4TsHRE1WBi4y8S@vger.kernel.org, AJvYcCUxNP5VvY+SWqZnbueEGUZ3rXDMYvJRhHF6Rg4KPmZLEIdIO3lCxQBTMeprmcU6B4qGqrOp6dU90LxEbDQ=@vger.kernel.org, AJvYcCVdhX793hSuwuMtwQHLNd+oyy0EbtKwyuJFOcipxZdggQ8lcg74Eo5s4/NYA5fmCWZmT/ocuDdHnsyL@vger.kernel.org, AJvYcCXBVpEg2QQ35bYlJLKrFMTRO1RNQhn0uZ6GX/dPlKojBqTj4HCi6waBnHzAwzhkLmVBeEIiJYdHAlwaaO2u@vger.kernel.org
X-Gm-Message-State: AOJu0YzuU0XIlm3lkkGomHF1jgbFf+zFOGyiuBAHY0r7NKHxGYuRy9EW
	IjuQUNM6W3ltSsIQRitaaGtoy1D8vRc0l4ncboKUn9OEaisl2BkT
X-Google-Smtp-Source: AGHT+IGc+nG1wt+DMP+moaC/TTecbd98DJcbFy/BYzWTbFGMHiYt+g49EqO/yY9xHvXO/9A1wYjT9g==
X-Received: by 2002:a17:90b:3ec9:b0:2d8:b510:170f with SMTP id 98e67ed59e1d1-2e94c23344emr19375465a91.20.1730785520437;
        Mon, 04 Nov 2024 21:45:20 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:1bb4:1f23:1031:ac0e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057a60d6sm69822985ad.124.2024.11.04.21.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:45:20 -0800 (PST)
Date: Mon, 4 Nov 2024 21:45:17 -0800
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
Subject: Re: [PATCH v1 2/6] Input: gpio_keys_polled - avoid using
 GPIOF_ACTIVE_LOW
Message-ID: <Zymw7fduuSyCCdeS@google.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
 <20241104093609.156059-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104093609.156059-3-andriy.shevchenko@linux.intel.com>

On Mon, Nov 04, 2024 at 11:34:20AM +0200, Andy Shevchenko wrote:
> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
>  drivers/input/keyboard/gpio_keys_polled.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
> index 41ca0d3c9098..e6707d72210e 100644
> --- a/drivers/input/keyboard/gpio_keys_polled.c
> +++ b/drivers/input/keyboard/gpio_keys_polled.c
> @@ -306,13 +306,8 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
>  			 * Legacy GPIO number so request the GPIO here and
>  			 * convert it to descriptor.
>  			 */
> -			unsigned flags = GPIOF_IN;
> -
> -			if (button->active_low)
> -				flags |= GPIOF_ACTIVE_LOW;
> -
> -			error = devm_gpio_request_one(dev, button->gpio,
> -					flags, button->desc ? : DRV_NAME);
> +			error = devm_gpio_request_one(dev, button->gpio, GPIOF_IN,
> +						      button->desc ? : DRV_NAME);
>  			if (error)
>  				return dev_err_probe(dev, error,
>  						     "unable to claim gpio %u\n",
> @@ -325,6 +320,9 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
>  					button->gpio);
>  				return -EINVAL;
>  			}
> +
> +			if (button->active_low ^ gpiod_is_active_low(bdata->gpiod))
> +				gpiod_toggle_active_low(bdata->gpiod);
>  		}
>  
>  		bdata->last_state = -1;
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 

-- 
Dmitry

