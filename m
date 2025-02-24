Return-Path: <linux-gpio+bounces-16514-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D98A427F2
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 17:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62B3517694B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 16:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E6B262D25;
	Mon, 24 Feb 2025 16:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZDIJCvL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2529B263884;
	Mon, 24 Feb 2025 16:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740414615; cv=none; b=TYWgPvYMU6+fzLPMLUM0H1XgDrLDZEpmYJflWVmyNyHzb6mcfQs59peakWgxa2xZvuk0cdkmITDsC25LOzhm1VAEGZ2bjGb3Dqxurm9wkhdkcTZ1Eckv2qLHNLGR082ub6Zlev0VlfRvtmfYsMKnsqkI9JSGQw8OR4Jn/J9ToaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740414615; c=relaxed/simple;
	bh=ZWTQA+S8jpqY6duodMGUoHQzX2Q2dh2lXsuki/d4xY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1OsMqJKEmtOP3yMYDWPHB+31OttjQVlpQENaDVEivIRA55JiCpCFrABz98WIg6jyY3ggeOfpQrj0obHRY6GIqzE6hJcteCm69+XlKkUWlGsG7K/SXuiZs1yKmqR1nnNGFSb3Wx0Eaxq54kRBkVEoS3/d+jfv0BO+l+7O1tz9cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZDIJCvL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740414614; x=1771950614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZWTQA+S8jpqY6duodMGUoHQzX2Q2dh2lXsuki/d4xY4=;
  b=ZZDIJCvL3rci+VJtfcN1RXqBMEUSL9jObVoYInHBzOmrPXCQnCQmmIce
   APr2vZe44F+UTsOpubzZvOpDKpPFf3o5KI/TpOLs/iSJBEO7Odx0s+GZs
   tRzKaI/NnNc8sasxnd9T6r/lb0bWXNJqShEWJvhrNzzt3knY+h9Q9n8rV
   +h4LTEna1R7x97u7M78n9vjvRNoURQnJDlt0wPDP2orrxGmjbrcKVxYxs
   OHTOUjtqfl7I6NOdp1+Skc/njKRm0JFzl/HrCxiZXuTuqc0eiZQGFiZXs
   eb4w9j63Dgv1kAzommFbkRV+aHvhZ9ed5/WcrQd6uGHO4BDrBKvtERSoY
   A==;
X-CSE-ConnectionGUID: YCEOpoAFQB2OhJKr5RPI9w==
X-CSE-MsgGUID: jBYH0ZynQ+y1INQuZuWwbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41444322"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="41444322"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 08:30:12 -0800
X-CSE-ConnectionGUID: 8XnF1mtdTPuDaF02pSThYA==
X-CSE-MsgGUID: GJwAxVlySC+LthP927c4hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116592366"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 24 Feb 2025 08:30:10 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0DB3B19E; Mon, 24 Feb 2025 18:30:08 +0200 (EET)
Date: Mon, 24 Feb 2025 18:30:08 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 4/8] gpiolib: sanitize the return value of
 gpio_chip::get()
Message-ID: <Z7yekJ8uRh8dphKn@black.fi.intel.com>
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
 <20250210-gpio-sanitize-retvals-v1-4-12ea88506cb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-gpio-sanitize-retvals-v1-4-12ea88506cb2@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 10, 2025 at 11:51:58AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> As per the API contract, the get() callback is only allowed to return 0,
> 1 or a negative error number. Add a wrapper around the callback calls
> that filters out anything else.

...

> +static int gpiochip_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&gc->gpiodev->srcu);
> +
> +	if (!gc->get)
> +		return -EIO;
> +
> +	ret = gc->get(gc, offset);
> +	if (ret > 1)

Perhaps use the respective GPIO macro instead? Otherwise it's not clear what
the meaning of 1 is.

> +		ret = -EBADE;
> +
> +	return ret;
> +}
> +
>  static int gpio_chip_get_value(struct gpio_chip *gc, const struct gpio_desc *desc)
>  {
> -	return gc->get ? gc->get(gc, gpio_chip_hwgpio(desc)) : -EIO;
> +	return gpiochip_get(gc, gpio_chip_hwgpio(desc));
>  }

...

>  		for_each_set_bit(i, mask, gc->ngpio) {
> -			value = gc->get(gc, i);
> +			value = gpiochip_get(gc, i);

This will delay the function for checking every time if the get() exists. Which
must be here.

>  			if (value < 0)
>  				return value;
>  			__assign_bit(i, bits, value);

What I would expect here is something like this:

static int gpio_chip_get_value_nocheck(struct gpio_chip *gc, unsigned int offset)
{
	int ret;

	lockdep_assert_held(&gc->gpiodev->srcu);

	ret = gc->get(gc, offset);
	if (ret > GPIO_LINE_DIRECTION_IN)
		ret = -EBADE;

	return ret;
}

static int gpio_chip_get_value(struct gpio_chip *gc, const struct gpio_desc *desc)
{
	return gc->get ? gpio_chip_get_value_nocheck(gc, gpio_chip_hwgpio(desc)) : -EIO;
}

But I see the downside of it as it might lurk without RCU lock if get is not
defined. So, up to you.

-- 
With Best Regards,
Andy Shevchenko



