Return-Path: <linux-gpio+bounces-24550-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 375E0B2C377
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 14:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 508E6563599
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 12:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6359F33CE87;
	Tue, 19 Aug 2025 12:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5bsTs5N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A46333CE80;
	Tue, 19 Aug 2025 12:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605954; cv=none; b=Ex65xhFkNerDjwHhrIUyK+oOcDkJtWE+fEAGXFbLTAEmUjVtGYxh2PnkeovkUhiOgbaDk9Iv0K0m1CM4+3VyuBx+kGzpAnHs96QDjWZWvnaBqpHyBGdpY7QmxDvA4Bv8ErXAIz2iWbQ7kbqccnlyNf99GO/kEAP0BFP/LC/FTOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605954; c=relaxed/simple;
	bh=ZnRUmRVVGkmS7UY8myey8qrazbdPpSvr6DsYsxMhx/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twmEd604pNci6A3DONvG1M6AbxUis9Du6V0z8qphPiGKjk5jYGA+IraNzREFxTivoQGyX+9696nctC2RBSu1sf1euUoZCfPQSXVlz7XFb/qV+r8jLTNfa2USk0p0h1Sw0zUKB6wTFNY1ag9AlQD06iNE7vJ/5mSNRv22q6Ga6QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5bsTs5N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59600C4CEF1;
	Tue, 19 Aug 2025 12:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755605953;
	bh=ZnRUmRVVGkmS7UY8myey8qrazbdPpSvr6DsYsxMhx/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K5bsTs5N/8lF6M/ljp6RvKs5cgFjxa/J2Spqi40KYATAreNu8+LNyK7fqu19vxXjS
	 AJgfNrJURUcVXaLUjetFrgfXHQJKC1Mc+J1n8ORbJ/AmywI5A8kBZg75aEwV/Xbogc
	 ViDFsFY/pbYrw8cSbTz4h5Yha/uJGWJ0ZZH+c4jgphUd9Jua+NFbWqwl9xVAYh1C6P
	 d5qn8udyL+SioNcIoRXIXG/H4lZl+k2GRIrxMzFE3xFPwF16+P4YgtHnZp9pbz6pjT
	 GCCtX0YJJbYrDYK8dQ3758q08B1YGDlBzd4K/l1WXjSanDmD/tl6gDBGLZbYaXtcvK
	 4TM3oI1/oSwQg==
Date: Tue, 19 Aug 2025 13:19:07 +0100
From: Lee Jones <lee@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kees Cook <kees@kernel.org>, Anish Kumar <yesanishhere@gmail.com>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Rokosov <ddrokosov@salutedevices.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/21] leds: gpio: make legacy gpiolib interface optional
Message-ID: <20250819121907.GA7508@google.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-11-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250808151822.536879-11-arnd@kernel.org>

On Fri, 08 Aug 2025, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> There are still a handful of ancient mips/armv5/sh boards that use the
> gpio_led:gpio member to pass an old-style gpio number, but all modern
> users have been converted to gpio descriptors.
> 
> Make the code that deals with this optional so the legacy interfaces
> can be left out for all normal builds.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/leds/leds-gpio.c | 8 ++++++--
>  include/linux/leds.h     | 2 ++
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index a3428b22de3a..e43accfa78e9 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -212,7 +212,9 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
>  					    const struct gpio_led *template)
>  {
>  	struct gpio_desc *gpiod;
> +#ifdef CONFIG_GPIOLIB_LEGACY
>  	int ret;
> +#endif

Isn't there another way to do his that doesn't entail sprinkling #ifery
around C-files?

>  	/*
>  	 * This means the LED does not come from the device tree
> @@ -228,6 +230,7 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
>  		return gpiod;
>  	}
>  
> +#ifdef CONFIG_GPIOLIB_LEGACY
>  	/*
>  	 * This is the legacy code path for platform code that
>  	 * still uses GPIO numbers. Ultimately we would like to get
> @@ -244,6 +247,7 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
>  		return ERR_PTR(ret);
>  
>  	gpiod = gpio_to_desc(template->gpio);
> +#endif
>  	if (!gpiod)
>  		return ERR_PTR(-EINVAL);
>  
> @@ -276,8 +280,8 @@ static int gpio_led_probe(struct platform_device *pdev)
>  				led_dat->gpiod =
>  					gpio_led_get_gpiod(dev, i, template);
>  			if (IS_ERR(led_dat->gpiod)) {
> -				dev_info(dev, "Skipping unavailable LED gpio %d (%s)\n",
> -					 template->gpio, template->name);
> +				dev_info(dev, "Skipping unavailable LED gpio %s\n",
> +					 template->name);
>  				continue;
>  			}
>  
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index b16b803cc1ac..034643f40152 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -676,7 +676,9 @@ typedef int (*gpio_blink_set_t)(struct gpio_desc *desc, int state,
>  struct gpio_led {
>  	const char *name;
>  	const char *default_trigger;
> +#ifdef CONFIG_GPIOLIB_LEGACY
>  	unsigned 	gpio;
> +#endif
>  	unsigned	active_low : 1;
>  	unsigned	retain_state_suspended : 1;
>  	unsigned	panic_indicator : 1;
> -- 
> 2.39.5
> 

-- 
Lee Jones [李琼斯]

