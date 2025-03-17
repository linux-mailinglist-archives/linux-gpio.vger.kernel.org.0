Return-Path: <linux-gpio+bounces-17704-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE66A65A71
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 18:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67D74888035
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 17:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB8E1D5ADD;
	Mon, 17 Mar 2025 17:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhzRHRg4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A671A255C;
	Mon, 17 Mar 2025 17:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231418; cv=none; b=k3P+2jYSN45TEZ/MuvdNI4jHN7bw25XX637Eg+Rj/IRUfOe+pArxzXGm9FOfbnHTk4tlZcqdS66XJBSOJTJ5P+n1tmhJcybCgqG8R9gxtkAcVAbQw4vJf3wxr1uLoY79siuAVPWZjpfraeCm8rdosg/nRQ72YbdEA8T7h9+Awjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231418; c=relaxed/simple;
	bh=XemDQhZsfOwWrwHljvfFmLDX3tk2oTPd5CaJUyQ5yuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgMfJnpy26ZCs+dCn6yB4VuMVfzwBSTYMtB+2n+2QFN93cPBrrhRjI8Uxouo7HyeVvFljZaXLhEr+nB77m/26Nwz3Hbi3Hplgm2v7UiZwg/x9oKit4dvoO3GLjispUFfIVqb+232UN9dhq+BgR+6+X/DBm2wW+Q/7w/u+IsB2LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lhzRHRg4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742231416; x=1773767416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XemDQhZsfOwWrwHljvfFmLDX3tk2oTPd5CaJUyQ5yuY=;
  b=lhzRHRg4FCBQ8OqI9QPcmOmH/B+qj1PZTg0GMaHqWUytxjZmjCQxN/Ch
   tvlHFEjtyi+sxvc5wdJJfAs6djlXI9cRxkSaX/q/EjDPCtUE+1sEb0Aib
   TfoQyWpGIdafyvPcT+kjYUu8DOP2dYcKdhskcOqvqeSRmvAPExrXhOudv
   r84zIRbr4Zq2n2B17aCpcmYMw2gcPGrhWfPlw4kGBJ1zNNrgZqq49qpn7
   td7IdVsQu1m8SYsXCAt+eONL4QyZqBr2e4dwQ8o51OXz0Zj2B7dVs96Fy
   8Ek9IttxYmOA+D21qiWsUb/XY5aRD4qzsXvrvEitrldSSMDmEXme+vL70
   A==;
X-CSE-ConnectionGUID: fSGr9A/JRearKntikVRG8g==
X-CSE-MsgGUID: LCbItL5kRh67NaB+EsW30A==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="30920423"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="30920423"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 10:10:16 -0700
X-CSE-ConnectionGUID: BdXS/elwRqK7KzJGHgVB0A==
X-CSE-MsgGUID: ktlOYsTITUqauYqlicKGSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="121816870"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 10:10:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tuDyc-00000003MoQ-1UJg;
	Mon, 17 Mar 2025 19:10:10 +0200
Date: Mon, 17 Mar 2025 19:10:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH RFC v2 3/6] gpio: aggregator: export symbols of the
 gpio-fwd library
Message-ID: <Z9hXcr_GPhPt_gel@smile.fi.intel.com>
References: <20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com>
 <20250317-aaeon-up-board-pinctrl-support-v2-3-36126e30aa62@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-aaeon-up-board-pinctrl-support-v2-3-36126e30aa62@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 17, 2025 at 04:38:01PM +0100, Thomas Richard wrote:
> Export all symbols and create header file for the gpio-fwd library.

...

>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/gpio/gpio-fwd.h>

Please, name it forwarder.h.

>  #include <linux/gpio/machine.h>

...

> +int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset)
>  {
>  	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
>  
>  	return gpiod_get_direction(fwd->descs[offset]);
>  }
> +EXPORT_SYMBOL_GPL(gpio_fwd_get_direction);

No namespace? Ditto for all exports.

> -static int gpio_fwd_get_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
> -				 unsigned long *bits)
> +static int gpio_fwd_get_multiple_unlocked(struct gpiochip_fwd *fwd,
> +					  unsigned long *mask, unsigned long *bits)
>  {
>  	struct gpio_desc **descs = fwd_tmp_descs(fwd);
>  	unsigned long *values = fwd_tmp_values(fwd);
> @@ -332,8 +320,8 @@ static int gpio_fwd_get_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
>  	return 0;
>  }
>  
> -static int gpio_fwd_get_multiple_locked(struct gpio_chip *chip,
> -					unsigned long *mask, unsigned long *bits)
> +int gpio_fwd_get_multiple(struct gpio_chip *chip, unsigned long *mask,
> +			  unsigned long *bits)
>  {
>  	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
>  	unsigned long flags;
> @@ -341,16 +329,17 @@ static int gpio_fwd_get_multiple_locked(struct gpio_chip *chip,
>  
>  	if (chip->can_sleep) {
>  		mutex_lock(&fwd->mlock);
> -		error = gpio_fwd_get_multiple(fwd, mask, bits);
> +		error = gpio_fwd_get_multiple_unlocked(fwd, mask, bits);
>  		mutex_unlock(&fwd->mlock);
>  	} else {
>  		spin_lock_irqsave(&fwd->slock, flags);
> -		error = gpio_fwd_get_multiple(fwd, mask, bits);
> +		error = gpio_fwd_get_multiple_unlocked(fwd, mask, bits);
>  		spin_unlock_irqrestore(&fwd->slock, flags);
>  	}
>  
>  	return error;
>  }
> +EXPORT_SYMBOL_GPL(gpio_fwd_get_multiple);

These two are nicely named. Instead of touching them, just simply add an
exported wrapper. We can optimize it latter if needed, but it reduces a lot
the churn in this patch.

...

> -static void gpio_fwd_set_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
> -				  unsigned long *bits)
> +static void gpio_fwd_set_multiple_unlocked(struct gpiochip_fwd *fwd,
> +					   unsigned long *mask,
> +					   unsigned long *bits)
>  {
>  	struct gpio_desc **descs = fwd_tmp_descs(fwd);
>  	unsigned long *values = fwd_tmp_values(fwd);
> @@ -404,37 +395,40 @@ static void gpio_fwd_set_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
>  		gpiod_set_array_value(j, descs, NULL, values);
>  }
>  
> -static void gpio_fwd_set_multiple_locked(struct gpio_chip *chip,
> -					 unsigned long *mask, unsigned long *bits)
> +void gpio_fwd_set_multiple(struct gpio_chip *chip, unsigned long *mask,
> +			   unsigned long *bits)
>  {
>  	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
>  	unsigned long flags;
>  
>  	if (chip->can_sleep) {
>  		mutex_lock(&fwd->mlock);
> -		gpio_fwd_set_multiple(fwd, mask, bits);
> +		gpio_fwd_set_multiple_unlocked(fwd, mask, bits);
>  		mutex_unlock(&fwd->mlock);
>  	} else {
>  		spin_lock_irqsave(&fwd->slock, flags);
> -		gpio_fwd_set_multiple(fwd, mask, bits);
> +		gpio_fwd_set_multiple_unlocked(fwd, mask, bits);
>  		spin_unlock_irqrestore(&fwd->slock, flags);
>  	}
>  }
> +EXPORT_SYMBOL_GPL(gpio_fwd_set_multiple);

Ditto.

...

> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __LINUX_GPIO_FWD_H
> +#define __LINUX_GPIO_FWD_H

This header uses something that is defined in other headers. Please follow IWYU
principle.

...

> +struct gpiochip_fwd_timing {
> +	u32 ramp_up_us;
> +	u32 ramp_down_us;

types.h

> +};

...

> +struct gpiochip_fwd {
> +	struct device *dev;

struct device;

// forward declaration is enough.

> +	struct gpio_chip chip;

Where is this being defined?

> +	struct gpio_desc **descs;

> +	union {
> +		struct mutex mlock;	/* protects tmp[] if can_sleep */
> +		spinlock_t slock;	/* protects tmp[] if !can_sleep */

And these?

> +	};
> +	struct gpiochip_fwd_timing *delay_timings;
> +	unsigned long tmp[];		/* values and descs for multiple ops */
> +};

-- 
With Best Regards,
Andy Shevchenko



