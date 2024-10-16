Return-Path: <linux-gpio+bounces-11397-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 340C69A008C
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 07:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 727D5B2554C
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 05:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE34C7494;
	Wed, 16 Oct 2024 05:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5JJFmb5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08C11171D;
	Wed, 16 Oct 2024 05:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729055991; cv=none; b=O4BdKwLG08Qc/jj6y5BeaMWK6lodpFBdzXutXQlyLPUioeIMw5OkbSZEiZ3JD0zs6QTn7oAGgMlA3iUYU2sB6aegimzqcIDUEJdBdBW38aVl8fcXVDKG+XpCfPTbo4npFLAXEUDSW/cJEhJu4f5MSrGjUZJKRmfu/TJdUnAcBV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729055991; c=relaxed/simple;
	bh=mwN9QIZIpDjhDT/O6zv7ovgf4Ho/2Qixq3R5yg/agDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9+fkzmbcZrpldNrduz5k5o/VTY399Vbarsq4SHnDzl84fY3nQL6gIXA+4yhdxRs1HLBgTNjSJBGoNpt0JKFcypvZY9DYyVJFMxAasNvMvWr4JvN5rdd8cP9+mPKQAELlroetT4RKrJ9lgMZlf8wNPwfVUBKrXSvrFYDL8UIWj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5JJFmb5; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so383612b3a.1;
        Tue, 15 Oct 2024 22:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729055989; x=1729660789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZA6QAR4YhDmB7+IR1li1SM16gX+YYQxkteYnsvFlEa8=;
        b=m5JJFmb5osTKv+rYY92n1MiWQrArRD3vInACmp6oVcdaWt5GHpHE4mQrR+wBS5yItY
         XROCZI5WS6jzkGHxGYgbY+xWPrA6tN3WFP7fZhMe5k22+2VWKvYlHCdioP2yma41mGEB
         VYeBsXlP8wtZSO6KsGKi7JMgWgf7LOUAYtrrt2nNO29v7ihdbZRqtkOI+hF7tJ4EY4wQ
         pc6nnoUcToUO7cQ1jQZCKcALlmGqxSwC9O4Fy4eB6GMODvs0ubgA4MI9hR5zor6r781r
         15U9k8dT9cPjZliIvG67Tw1rTY/CyxcAV/QpXFnXDGDDEqsIfRoPaxS9HAcN9vNR08na
         CDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729055989; x=1729660789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZA6QAR4YhDmB7+IR1li1SM16gX+YYQxkteYnsvFlEa8=;
        b=ikXNdfpR2nPvryTqWg6Tqk9f5QpP9WFoKZIONXEtGuYell0npjKBaBnBenrqjafJs8
         8XT3eN9foDvRzmxMnrQtOX4G9ZeyPW7sSNyUZ6fZsQ9VnWEeoY2j1N8Ma2WXbGwFns51
         1aT8LLhyhiEdoVyiXqmCYqRiuxOy+6Mrh3UmI9zA2fP0uPH755WU0VJ0dkGnI848apCD
         H80AKb7LxCLnR+yOOjBYZLx8hWV/2/G/bUb8J7Pw/j02XjNqcYR38G5EZevfG8QG97YW
         Ls15rQI2657NyzfUOiMgRPgI6vqIv/VL2V2hJ7P4uK49MUNfCcFP1wVU9br4U5f78wYc
         MiqA==
X-Forwarded-Encrypted: i=1; AJvYcCUdS3WKtN6JcfE4SCjW9Jmwlu2SiwI5L2ryb7FrFHRbzrkCbXHmXYNNWG+tY+AoyC+5P6e4IRmuMkdWb9D0@vger.kernel.org, AJvYcCWNgt+mJySJVVHqGdoz1aZOJIKYBbbcC/MPgweh6TwmWSvast+/wWOlUqb5w0d09hcPLQqQgiiFvcrx@vger.kernel.org
X-Gm-Message-State: AOJu0YxbokG8hYcDBNPj9pzkg+z0znyPXZlX3dFtBzz5mruWMYWZzCu3
	X6+Sl7DWG8bTswxviMVarrcYp95nWNJtAoPQxm5TlG+jStkGa/9H2UFG/g==
X-Google-Smtp-Source: AGHT+IHVmtgkk0BSmSK4ZhfKaIJXflG6xoeXYCmdR9mojyuEQpD/iXjGA7CH85O0CFhG2N3l6VOT7A==
X-Received: by 2002:a05:6a00:2d8c:b0:71e:674b:474 with SMTP id d2e1a72fcca58-71e7d77b2d9mr5402118b3a.8.1729055988906;
        Tue, 15 Oct 2024 22:19:48 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773a2f2asm2258523b3a.51.2024.10.15.22.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 22:19:48 -0700 (PDT)
Date: Wed, 16 Oct 2024 13:19:44 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 6/6] gpiolib: notify user-space about in-kernel line
 state changes
Message-ID: <20241016051944.GA42100@rigel>
References: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
 <20241015-gpio-notify-in-kernel-events-v3-6-9edf05802271@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015-gpio-notify-in-kernel-events-v3-6-9edf05802271@linaro.org>

On Tue, Oct 15, 2024 at 12:56:18PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We currently only notify user-space about line config changes that are
> made from user-space. Any kernel config changes are not signalled.
>
> Let's improve the situation by emitting the events closer to the source.
> To that end let's call the relevant notifier chain from the functions
> setting direction, gpiod_set_config(), gpiod_set_consumer_name() and
> gpiod_toggle_active_low(). This covers all the options that we can
> inform the user-space about. We ignore events which don't have
> corresponding flags exported to user-space on purpose - otherwise the
> user would see a config-changed event but the associated line-info would
> remain unchanged.
>
> gpiod_direction_output/input() can be called from any context.
> Fortunately, we now emit line state events using an atomic notifier
> chain, so it's no longer an issue.
>
> Let's also add non-notifying wrappers around the direction setters in
> order to not emit superfluous reconfigure events when requesting the
> lines as the initial config should be part of the request notification.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpiolib-cdev.c | 12 +++-----
>  drivers/gpio/gpiolib.c      | 71 ++++++++++++++++++++++++++++++++++++++++-----
>  drivers/gpio/gpiolib.h      |  2 ++
>  3 files changed, 70 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index f8c69ef33888..1296e6cbcef7 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -196,8 +196,6 @@ static long linehandle_set_config(struct linehandle_state *lh,
>  			if (ret)
>  				return ret;
>  		}
> -
> -		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
>  	}
>  	return 0;
>  }
> @@ -363,11 +361,11 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
>  		if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
>  			int val = !!handlereq.default_values[i];
>
> -			ret = gpiod_direction_output(desc, val);
> +			ret = gpiod_direction_output_nonotify(desc, val);
>  			if (ret)
>  				goto out_free_lh;
>  		} else if (lflags & GPIOHANDLE_REQUEST_INPUT) {
> -			ret = gpiod_direction_input(desc);
> +			ret = gpiod_direction_input_nonotify(desc);
>  			if (ret)
>  				goto out_free_lh;
>  		}
> @@ -1568,8 +1566,6 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
>  		}
>
>  		WRITE_ONCE(line->edflags, edflags);
> -
> -		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
>  	}
>  	return 0;
>  }
> @@ -1826,11 +1822,11 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>  		if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
>  			int val = gpio_v2_line_config_output_value(lc, i);
>
> -			ret = gpiod_direction_output(desc, val);
> +			ret = gpiod_direction_output_nonotify(desc, val);
>  			if (ret)
>  				goto out_free_linereq;
>  		} else if (flags & GPIO_V2_LINE_FLAG_INPUT) {
> -			ret = gpiod_direction_input(desc);
> +			ret = gpiod_direction_input_nonotify(desc);
>  			if (ret)
>  				goto out_free_linereq;
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index fafa759ce743..4303b6a689af 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2673,6 +2673,18 @@ int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce)
>   * 0 on success, or negative errno on failure.
>   */
>  int gpiod_direction_input(struct gpio_desc *desc)
> +{
> +	int ret;
> +
> +	ret = gpiod_direction_input_nonotify(desc);
> +	if (ret == 0)
> +		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(gpiod_direction_input);
> +
> +int gpiod_direction_input_nonotify(struct gpio_desc *desc)
>  {
>  	int ret = 0;
>
> @@ -2720,7 +2732,6 @@ int gpiod_direction_input(struct gpio_desc *desc)
>
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(gpiod_direction_input);
>
>  static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
>  {
> @@ -2782,8 +2793,15 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
>   */
>  int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
>  {
> +	int ret;
> +
>  	VALIDATE_DESC(desc);
> -	return gpiod_direction_output_raw_commit(desc, value);
> +
> +	ret = gpiod_direction_output_raw_commit(desc, value);
> +	if (ret == 0)
> +		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(gpiod_direction_output_raw);
>
> @@ -2801,6 +2819,18 @@ EXPORT_SYMBOL_GPL(gpiod_direction_output_raw);
>   * 0 on success, or negative errno on failure.
>   */
>  int gpiod_direction_output(struct gpio_desc *desc, int value)
> +{
> +	int ret;
> +
> +	ret = gpiod_direction_output_nonotify(desc, value);
> +	if (ret == 0)
> +		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(gpiod_direction_output);
> +
> +int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
>  {
>  	unsigned long flags;
>  	int ret;
> @@ -2863,7 +2893,6 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
>  		set_bit(FLAG_IS_OUT, &desc->flags);
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(gpiod_direction_output);
>
>  /**
>   * gpiod_enable_hw_timestamp_ns - Enable hardware timestamp in nanoseconds.
> @@ -2942,13 +2971,34 @@ EXPORT_SYMBOL_GPL(gpiod_disable_hw_timestamp_ns);
>   */
>  int gpiod_set_config(struct gpio_desc *desc, unsigned long config)
>  {
> +	int ret;
> +
>  	VALIDATE_DESC(desc);
>
>  	CLASS(gpio_chip_guard, guard)(desc);
>  	if (!guard.gc)
>  		return -ENODEV;
>
> -	return gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), config);
> +	ret = gpio_do_set_config(guard.gc, gpio_chip_hwgpio(desc), config);
> +	if (ret == 0) {
> +		/* These are the only options we notify the userspace about. */
> +		switch (pinconf_to_config_param(config)) {
> +		case PIN_CONFIG_BIAS_DISABLE:
> +		case PIN_CONFIG_BIAS_PULL_DOWN:
> +		case PIN_CONFIG_BIAS_PULL_UP:
> +		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +		case PIN_CONFIG_DRIVE_OPEN_SOURCE:
> +		case PIN_CONFIG_DRIVE_PUSH_PULL:
> +		case PIN_CONFIG_INPUT_DEBOUNCE:
> +			gpiod_line_state_notify(desc,
> +						GPIO_V2_LINE_CHANGED_CONFIG);
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	return ret;
>  }

Ah, the debounce - I forgot about that, and other features that cdev
might emulate.

What happens if userspace requests a line with debounce that is
supported by hardware?  Seems to me we'll see both a LINE_REQUESTED and a
LINE_CONFIG_CHANGED when the line is requested.

Conversely, what if a config change impacts features that don't result in a
notification from gpiod_set_config(), like active low, or emulated
drive or debounce?

Other than those little wrinkles, it all looks good to me.
Though I haven't done any testing on it yet - will do as soon as I can.

Cheers,
Kent.

>  EXPORT_SYMBOL_GPL(gpiod_set_config);
>
> @@ -3015,6 +3065,7 @@ void gpiod_toggle_active_low(struct gpio_desc *desc)
>  {
>  	VALIDATE_DESC_VOID(desc);
>  	change_bit(FLAG_ACTIVE_LOW, &desc->flags);
> +	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
>  }
>  EXPORT_SYMBOL_GPL(gpiod_toggle_active_low);
>
> @@ -3659,9 +3710,15 @@ EXPORT_SYMBOL_GPL(gpiod_cansleep);
>   */
>  int gpiod_set_consumer_name(struct gpio_desc *desc, const char *name)
>  {
> +	int ret;
> +
>  	VALIDATE_DESC(desc);
>
> -	return desc_set_label(desc, name);
> +	ret = desc_set_label(desc, name);
> +	if (ret == 0)
> +		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(gpiod_set_consumer_name);
>
> @@ -4539,10 +4596,10 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
>
>  	/* Process flags */
>  	if (dflags & GPIOD_FLAGS_BIT_DIR_OUT)
> -		ret = gpiod_direction_output(desc,
> +		ret = gpiod_direction_output_nonotify(desc,
>  				!!(dflags & GPIOD_FLAGS_BIT_DIR_VAL));
>  	else
> -		ret = gpiod_direction_input(desc);
> +		ret = gpiod_direction_input_nonotify(desc);
>
>  	return ret;
>  }
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index 2799157a1f6b..fc321d281346 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -155,6 +155,8 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
>  int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
>
>  void gpiod_line_state_notify(struct gpio_desc *desc, unsigned long action);
> +int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value);
> +int gpiod_direction_input_nonotify(struct gpio_desc *desc);
>
>  struct gpio_desc_label {
>  	struct rcu_head rh;
>
> --
> 2.43.0
>

