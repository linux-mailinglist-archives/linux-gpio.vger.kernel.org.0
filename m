Return-Path: <linux-gpio+bounces-16507-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65990A423FE
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 15:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D3A8163650
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 14:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3C623BCE6;
	Mon, 24 Feb 2025 14:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="cJryqr0B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3881993B2
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 14:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740408188; cv=none; b=WtMOsFKtr3JON3dmdeJLaCPUXz3LDElahgWyVIsOkZHo57AJdM0TLWum9CUii4o+4Bou67/vyPrAhcF8Pzse39tuOxPJu1qgi60De94PslioSDP8MSekVJ5NmUNpJKCKJLjnf7XisTPKMGX3Z55A+lJGSy3TomBTuV0gjjfGcw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740408188; c=relaxed/simple;
	bh=lrBQFBxDpVbTC3JFS/HVrtROllRzDr8ShdfLQOg6bwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9cCsGn3rXvmjCY2D4OnvCYlFi9991CUp2MPREtJTNY8vpAil56zyeM+rR2xmF1zDSmWdV6UmKTIGNhsNOGBnBAbsXnDwBrk3nB6/PQd1Zq5MAsFdPt3Z3Zg4T0l6tziMJduxRao4DSM14E4N5673kQUmn5FEXtitpy6XB+oZwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=cJryqr0B; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e6827984b2so53354236d6.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 06:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1740408186; x=1741012986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tLop5NeRWIUcnCB3Js3hWryNfIiaum3LJoPnNZfFKTo=;
        b=cJryqr0BsV4DLrGN6qXGFqfuwUdH+NlI5VKkqC1gP1UIJN2DZnla3IFyZI328DtJdf
         O/twMPH3E2EzruzpBG9l5Wqxvd0NjyatR1Sl6eXj2H4wZKqZNKl5Z+ZQmivPIESXmp4x
         1vRHVcdslwN7+4CXjyZwiepFoaE6am1Q1yhtFGzzyjFvXz3BzHh+Sn8pMno3nalKz7Pg
         RboCVVvSXZJuJDhcehVLyYnwE99vNDlLrodX00ey6Y2MCFSs4xfavgNEnHI7Zzgfvj/Q
         8OtzvUDU+9fS7W4pG5XrdiKAEQ4aB8yHtkMUbWQ7OgUSqLdFvNImwTi3mPlwewmChJup
         tz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740408186; x=1741012986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tLop5NeRWIUcnCB3Js3hWryNfIiaum3LJoPnNZfFKTo=;
        b=LPFVD6owudETrzhXJDM9/vD+9ypCwZJj5cD/MeS7J3EZz+fQRIqGosbGd5qDyZ/GLB
         kjYPrq1W787npkemI6QGpJLqx6jyD3xXZwDyuTV7ICrMkp44Fj0QC9dEBJ420MNl2OvZ
         omw3pa1bPEcsa+jhy7zfRGEKZf7GN0kkVKlaCwByGyiyl6mNi+bw29K/6dc6nqqk9EwC
         y2o7FgTGEJVDScnRyoH9V4mfuVQi/mCmPUEyCra5PU9hWt5n3CWwKOjj8NBN5bpo6rU+
         Wwt0T3+9U0Rg+XWGPG9q3isMv0a0M2VIVUlwIbeJKNOEFOKN6MZGgcUX5O52NrXAvHEE
         8N3w==
X-Forwarded-Encrypted: i=1; AJvYcCWlmlR4YeO6sB8runRbvSL1n36D3V6baV9dMVBUoQFpkJo5XcM7KlWEkGGlgQxsd0GgrMtIcRpwhC4J@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7movEFUCPnr7aGh96rrtZ6RGZjD+5M9lXXFUxByN7K3f4G52z
	Zjwe52RXL9a3Ad+LR98AixLgtz5t7pCi9a0vWfV/QCXVus9J4lwz7tSyHcGlCd0=
X-Gm-Gg: ASbGncvigHrQ8167EC39q51S2haaGafaF9HLHZC6A83dereeNvvQL0Jh4qC15ioHvf/
	dn3kPb6pmGLYk46Ebt2FbZL4Rhnk8OBAGyTJfvjoEK35NTgphslZ2yL6xOXiQyVip5bisHeAMpD
	Qt2kmBAjdQaZ7ajv967Pcy/exKk0dK/ez5tlo/AgLknUpw+OxVE4/cQs7yrprTRavZHKaQswKaN
	PQnYfKlsKhTEAlxsB3m7g9f+mb/4x/HfYMX5dAUhukyTFuzwMmBwW5u6lWC03bPQ1wtoqS7FAow
	mhVQWQOdcUj6ZS9w9SFINquBcM1BDayt8k3z7CW4CuKWacLdvr9D40iopLWHZRx0Ig==
X-Google-Smtp-Source: AGHT+IEIY9d9/Gd3x6EwQKngzXdvqK6ZGlzw9x0KDsK2WFPvev0nb/3QA6RQFxaBIRFmlFsQaFohdA==
X-Received: by 2002:a05:6214:daa:b0:6e4:2dcb:33c8 with SMTP id 6a1803df08f44-6e6ae967928mr128257536d6.29.1740408185646;
        Mon, 24 Feb 2025 06:43:05 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d7a40b2sm134040816d6.58.2025.02.24.06.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 06:43:05 -0800 (PST)
Message-ID: <4d99f492-191a-450f-8564-31bfab90c5b8@riscstar.com>
Date: Mon, 24 Feb 2025 08:43:04 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RTF 2/2] gpiolib: of: Handle threecell GPIO chips
To: Linus Walleij <linus.walleij@linaro.org>, Yixun Lan <dlan@gentoo.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250218-gpio-ranges-fourcell-v1-0-b1f3db6c8036@linaro.org>
 <20250218-gpio-ranges-fourcell-v1-2-b1f3db6c8036@linaro.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250218-gpio-ranges-fourcell-v1-2-b1f3db6c8036@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/18/25 4:28 AM, Linus Walleij wrote:
> When describing GPIO controllers in the device tree, the ambition
> of device tree to describe the hardware may require a three-cell
> scheme:
> 
> gpios = <&gpio instance offset flags>;
> 
> This implements support for this scheme in the gpiolib OF core.
> 
> Drivers that want to handle multiple gpiochip instances from one
> OF node need to implement a callback similar to this to
> determine if a certain gpio chip is a pointer to the right
> instance (pseudo-code):
> 
> struct my_gpio {
>      struct gpio_chip gcs[MAX_CHIPS];
> };
> 
> static bool my_of_node_instance_match(struct gpio_chip *gc
>                                        unsigned int instance)
> {
>      struct my_gpio *mg = gpiochip_get_data(gc);
> 
>      if (instance >= MAX_CHIPS)
>          return false;
>      return (gc == &mg->gcs[instance];

This is pseudocode, but either "(" not needed, or ")" missing.

> }
> 
> probe() {
>      struct my_gpio *mg;
>      struct gpio_chip *gc;
>      int i, ret;
> 
>      for (i = 0; i++; i < MAX_CHIPS) {
>          gc = &mg->gcs[i];
>          /* This tells gpiolib we have several instances per node */
>          gc->of_gpio_n_cells = 3;
> 	gc->of_node_instance_match = my_of_node_instance_match;
>          gc->base = -1;
>          ...
> 
>          ret = devm_gpiochip_add_data(dev, gc, mg);
>          if (ret)
>              return ret;
>      }
> }
> 
> Rename the "simple" of_xlate function to "twocell" which is closer
> to what it actually does.
> 
> In the device tree bindings, the provide node needs
> to specify #gpio-cells = <3>; where the first cell is the instance
> number:
> 
> gpios = <&gpio instance offset flags>;
> 
> Conversely ranges need to have four cells:
> 
> gpio-ranges = <&pinctrl instance gpio_offset pin_offset count>;

I haven't looked for it, but is a DT binding update forthcoming?

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

This looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/gpio/gpiolib-of.c   | 93 ++++++++++++++++++++++++++++++++++++++++-----
>   include/linux/gpio/driver.h | 24 +++++++++++-
>   2 files changed, 106 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 86405218f4e2ddc951a1a9d168e886400652bf60..614590a5bcd10e5605ecb66ebd956250e4ea1fd8 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -929,7 +929,7 @@ struct notifier_block gpio_of_notifier = {
>   #endif /* CONFIG_OF_DYNAMIC */
>   
>   /**
> - * of_gpio_simple_xlate - translate gpiospec to the GPIO number and flags
> + * of_gpio_twocell_xlate - translate twocell gpiospec to the GPIO number and flags
>    * @gc:		pointer to the gpio_chip structure
>    * @gpiospec:	GPIO specifier as found in the device tree
>    * @flags:	a flags pointer to fill in
> @@ -941,9 +941,9 @@ struct notifier_block gpio_of_notifier = {
>    * Returns:
>    * GPIO number (>= 0) on success, negative errno on failure.
>    */
> -static int of_gpio_simple_xlate(struct gpio_chip *gc,
> -				const struct of_phandle_args *gpiospec,
> -				u32 *flags)
> +static int of_gpio_twocell_xlate(struct gpio_chip *gc,
> +				 const struct of_phandle_args *gpiospec,
> +				 u32 *flags)
>   {
>   	/*
>   	 * We're discouraging gpio_cells < 2, since that way you'll have to
> @@ -968,6 +968,49 @@ static int of_gpio_simple_xlate(struct gpio_chip *gc,
>   	return gpiospec->args[0];
>   }
>   
> +/**
> + * of_gpio_threecell_xlate - translate threecell gpiospec to the GPIO number and flags
> + * @gc:		pointer to the gpio_chip structure
> + * @gpiospec:	GPIO specifier as found in the device tree
> + * @flags:	a flags pointer to fill in
> + *
> + * This is simple translation function, suitable for the most 1:n mapped
> + * GPIO chips, i.e. several GPIO chip instances from one device tree node.
> + * In this case the following binding is implied:
> + *
> + * foo-gpios = <&gpio instance offset flags>;
> + *
> + * Returns:
> + * GPIO number (>= 0) on success, negative errno on failure.
> + */
> +static int of_gpio_threecell_xlate(struct gpio_chip *gc,
> +				   const struct of_phandle_args *gpiospec,
> +				   u32 *flags)
> +{
> +	if (gc->of_gpio_n_cells != 3) {
> +		WARN_ON(1);
> +		return -EINVAL;
> +	}
> +
> +	if (WARN_ON(gpiospec->args_count != 3))
> +		return -EINVAL;
> +
> +	/*
> +	 * Check chip instance number, the driver responds with true if
> +	 * this is the chip we are looking for.
> +	 */
> +	if (!gc->of_node_instance_match(gc, gpiospec->args[0]))
> +		return -EINVAL;
> +
> +	if (gpiospec->args[1] >= gc->ngpio)
> +		return -EINVAL;
> +
> +	if (flags)
> +		*flags = gpiospec->args[2];
> +
> +	return gpiospec->args[1];
> +}
> +
>   #if IS_ENABLED(CONFIG_OF_GPIO_MM_GPIOCHIP)
>   #include <linux/gpio/legacy-of-mm-gpiochip.h>
>   /**
> @@ -1068,7 +1111,15 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
>   	has_group_names = of_property_present(np, group_names_propname);
>   
>   	for (;; index++) {
> -		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
> +		/*
> +		 * Ordinary phandles contain 2-3 cells:
> +		 * gpios = <&gpio [instance] offset flags>;
> +		 * Ranges always contain one more cell:
> +		 * gpio-ranges <&pinctrl [gpio_instance] gpio_offet pin_offet count>;
> +		 * This is why we parse chip->of_gpio_n_cells + 1 cells
> +		 */
> +		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges",
> +				chip->of_gpio_n_cells + 1,
>   				index, &pinspec);
>   		if (ret)
>   			break;
> @@ -1078,9 +1129,25 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
>   		if (!pctldev)
>   			return -EPROBE_DEFER;
>   
> -		offset = pinspec.args[0];
> -		pin = pinspec.args[1];
> -		count = pinspec.args[2];
> +		if (chip->of_gpio_n_cells == 3) {
> +			/* First cell is the gpiochip instance number */
> +			offset = pinspec.args[1];
> +			pin = pinspec.args[2];
> +			count = pinspec.args[3];
> +		} else {
> +			offset = pinspec.args[0];
> +			pin = pinspec.args[1];
> +			count = pinspec.args[2];
> +		}
> +
> +		/*
> +		 * With multiple GPIO chips per node, check that this chip is the
> +		 * right instance.
> +		 */
> +		if (chip->of_node_instance_match &&
> +		    (chip->of_gpio_n_cells == 3) &&
> +		    !chip->of_node_instance_match(chip, pinspec.args[0]))
> +			continue;
>   
>   		/* Ignore ranges outside of this GPIO chip */
>   		if (offset >= (chip->offset + chip->ngpio))
> @@ -1170,8 +1237,14 @@ int of_gpiochip_add(struct gpio_chip *chip)
>   		return 0;
>   
>   	if (!chip->of_xlate) {
> -		chip->of_gpio_n_cells = 2;
> -		chip->of_xlate = of_gpio_simple_xlate;
> +		if (chip->of_gpio_n_cells == 3) {
> +			if (!chip->of_node_instance_match)
> +				return -EINVAL;
> +			chip->of_xlate = of_gpio_threecell_xlate;
> +		} else {
> +			chip->of_gpio_n_cells = 2;
> +			chip->of_xlate = of_gpio_twocell_xlate;
> +		}
>   	}
>   
>   	if (chip->of_gpio_n_cells > MAX_PHANDLE_ARGS)
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 2dd7cb9cc270a68ddedbcdd5d44e0d0f88dfa785..70a361f6aba06d4a11e5ca913ec79411d7a11b3c 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -516,10 +516,32 @@ struct gpio_chip {
>   	/**
>   	 * @of_gpio_n_cells:
>   	 *
> -	 * Number of cells used to form the GPIO specifier.
> +	 * Number of cells used to form the GPIO specifier. The standard i 2

s/standard i /standard is /

> +	 * cells:
> +	 *
> +	 * gpios = <&gpio offset flags>;
> +	 *
> +	 * some complex GPIO controllers instantiate more than one chip per
> +	 * device tree node and have 3 cells:
> +	 *
> +	 * gpios = <&gpio instance offset flags>;
> +	 *
> +	 * Legacy GPIO controllers may even have 1 cell:
> +	 *
> +	 * gpios = <&gpio offset>;
>   	 */
>   	unsigned int of_gpio_n_cells;
>   
> +	/**
> +	 * of_node_instance_match:
> +	 *
> +	 * Determine if a chip is the right instance. Must be implemented by
> +	 * any driver using more than one gpio_chip per device tree node.
> +	 * Returns true if gc is the instance indicated by i (which is the
> +	 * first cell in the phandles for GPIO lines and gpio-ranges).
> +	 */
> +	bool (*of_node_instance_match)(struct gpio_chip *gc, unsigned int i);
> +
>   	/**
>   	 * @of_xlate:
>   	 *
> 


