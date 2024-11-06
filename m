Return-Path: <linux-gpio+bounces-12618-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB779BE33D
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 10:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4649C1F2315B
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 09:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B612E1DD533;
	Wed,  6 Nov 2024 09:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBIWBSwt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617E81DACAF;
	Wed,  6 Nov 2024 09:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730886926; cv=none; b=DbcHRrBWSYYytGAfLBCv1mB+YXOEgv4un0Q4D8TtlqP3BKHZ40ZusKXkNTjtSnYMtzAppN/8LTNZvEt9lwcYxJAICsxnpn3b3xo3f/Xk4N9up3/9kfrN6BhZihGfDVF1zsiKssX8zuKV6d0T3BYr8KrUJQpMLIDJ450dR2zGRBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730886926; c=relaxed/simple;
	bh=RZivVHsX1p8dULP9mNC1LUxwiEF+L/SLxiNfZZN1qRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9E45YGWo/eCO5s55pI12B0eNOnpZ8Ge9tsKpyydTPEPG8qTiP55HBaz8fxzUPoWp1MZFJJJJ0xZSfGP9cYDfDESrkSRH9xEFbetTPrC2D8YgKUOvYmnQPY2VezP02NBZXNJIFzejhVXSf/Qoy+GORoDa2IJUgdSBf8eLOktYmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBIWBSwt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AA9C4CED0;
	Wed,  6 Nov 2024 09:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730886926;
	bh=RZivVHsX1p8dULP9mNC1LUxwiEF+L/SLxiNfZZN1qRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JBIWBSwtMF1lHVxk8kFv5Ld+3FgvQU+Up3RYG+nPrJeI/7oWIsTpH3o1OKU+Q0qqh
	 vsMy90fYuiQWNfhssG0Rx9/yYjW7pD0Tv3uMuO0zU9KilM7TJbeEaq5wkI7Ql+kWIi
	 4uegJ1Az4kcKGYXINFG2SoB6DPzEaEj/iL+E4UdImwZdlt22kUwGGFu54ut7HBl3sc
	 inlNY4wajw6+u43BLb15PKxBapCMh4TnVptbaEbkxrZXdnKXcyw/NuMF5jCunwOKLJ
	 8+PleglAX7gZs3yWnHS8UMAlmH518P7zcXhaZOgXrEhgpfyNmAx06ZpLLgup08EAQu
	 V0AY4hi5o/INA==
Date: Wed, 6 Nov 2024 09:55:20 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 3/6] leds: gpio: Avoid using GPIOF_ACTIVE_LOW
Message-ID: <20241106095520.GM1807686@google.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
 <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>

On Mon, 04 Nov 2024, Andy Shevchenko wrote:

> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/leds/leds-gpio.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Acked-by: Lee Jones <lee@kernel.org>

> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 0d59b0bbc002..a3428b22de3a 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -212,7 +212,6 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
>  					    const struct gpio_led *template)
>  {
>  	struct gpio_desc *gpiod;
> -	unsigned long flags = GPIOF_OUT_INIT_LOW;
>  	int ret;
>  
>  	/*
> @@ -239,10 +238,7 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
>  	if (!gpio_is_valid(template->gpio))
>  		return ERR_PTR(-ENOENT);
>  
> -	if (template->active_low)
> -		flags |= GPIOF_ACTIVE_LOW;
> -
> -	ret = devm_gpio_request_one(dev, template->gpio, flags,
> +	ret = devm_gpio_request_one(dev, template->gpio, GPIOF_OUT_INIT_LOW,
>  				    template->name);
>  	if (ret < 0)
>  		return ERR_PTR(ret);
> @@ -251,6 +247,9 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
>  	if (!gpiod)
>  		return ERR_PTR(-EINVAL);
>  
> +	if (template->active_low ^ gpiod_is_active_low(gpiod))
> +		gpiod_toggle_active_low(gpiod);
> +
>  	return gpiod;
>  }
>  
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 

-- 
Lee Jones [李琼斯]

