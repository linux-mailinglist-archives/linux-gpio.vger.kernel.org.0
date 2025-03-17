Return-Path: <linux-gpio+bounces-17702-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E31A659A5
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 18:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF04319A431B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 17:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7B61C5F2C;
	Mon, 17 Mar 2025 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMbJ7lXc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454321A9B4C;
	Mon, 17 Mar 2025 16:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742230752; cv=none; b=WCxLSljpGdLU8kcQEaShl6KYXap/A53EOTG+FN+sX1z1JsifLdque+fdSZm5NgPAKYFj2rI+x+AL3vS+SMNN6HrAMRvtSX1G96xv+FqdJsBGhHvFIhQDW4r6o2Ua0C7s14NHfjIg4NwNs6JtsvigBntyQMJaA99hsw08MBa2gHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742230752; c=relaxed/simple;
	bh=RT5CLmtP9m9EPMpj+Oc1RB1oipcYH6qslhkN94+rY+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjxwmsxR4hLA0HJJZDGjMBWl9KqE10pde4chmrf2iyuEI+a4LS7UaRiR3YqbmEjsaigEKz+B6/yFOh5rAXu8W0V/KVfsgGo/UI2tuMV/WXltM+Us4pCTuoYOMpY3/WJZcv5RCY+h7bUnpPvHwkrUxAnZjMcmdvdQ7RpdlS5XsUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMbJ7lXc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742230751; x=1773766751;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RT5CLmtP9m9EPMpj+Oc1RB1oipcYH6qslhkN94+rY+8=;
  b=LMbJ7lXc6FBRsl08k+3vNtUUPGdcoPl9K1uadwgZMz/YmjWi4oFhs9PY
   k2Y6vOI/YGtAeCHx7eJxSWSzLceYxTwabwTeetd5Bk5OxxsmongJ149Bt
   X4XXMk+yIyOTmkNnWzBYnekr8QURjsIaq2eKAetuDKmAstWH6adMm/D8S
   s5I5sNABcbpABaZn13zMW45QDWwQPpRgaGcGKfBRiCRx9/Z39EK+Nmzx5
   6wBKAmanqe+/ICU7P+8eYykU8KuNwLshWSD1rihIixcV2NCxxMJ93bQXm
   wW4kde3xnb1199ILm4P4BqbA5UTJPYbKnhbLtKfU2S6U2I7DM6a1JN+ji
   g==;
X-CSE-ConnectionGUID: rXGOEBlDT8C5l66zloWibQ==
X-CSE-MsgGUID: Yl9w10JURmGgDWqmhqf9fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54332077"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="54332077"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 09:59:10 -0700
X-CSE-ConnectionGUID: fSeYsFYXTPeZqPO2aJOgRA==
X-CSE-MsgGUID: NyW8BtEuTKCeRbmGXxUM3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="121951734"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 09:59:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tuDnr-00000003Mew-2nXC;
	Mon, 17 Mar 2025 18:59:03 +0200
Date: Mon, 17 Mar 2025 18:59:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC v2 1/6] gpiolib: add gpiochip_add_pin_range_sparse()
 function
Message-ID: <Z9hU11aHeIB2VZPN@smile.fi.intel.com>
References: <20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com>
 <20250317-aaeon-up-board-pinctrl-support-v2-1-36126e30aa62@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-aaeon-up-board-pinctrl-support-v2-1-36126e30aa62@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 17, 2025 at 04:37:59PM +0100, Thomas Richard wrote:
> Add gpiochip_add_pin_range_sparse() function to add a range for GPIO<->pin
> mapping, using a list of non consecutive pins.
> Previously, it was only possible to add range of consecutive pins using
> gpiochip_add_pin_range_sparse().
> 
> The struct pinctrl_gpio_range has a 'pins' member which allows to set a
> list of pins (which can be non consecutive).
> gpiochip_add_pin_range_sparse() is identical to gpiochip_add_pin_range(),
> except it set 'pins' member instead of 'pin_base' member.

...

> +static int __gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
> +				    unsigned int gpio_offset, unsigned int pin_offset,
> +				    unsigned int const *pins, unsigned int npins)

I really do not like the __ naming here.
Can we rather create a better one? E.g., gpiochip_add_pin_range_with_pins().

...

> +/**
> + * gpiochip_add_pin_range_sparse() - add a range for GPIO <-> pin mapping
> + * @gc: the gpiochip to add the range for
> + * @pinctl_name: the dev_name() of the pin controller to map to
> + * @gpio_offset: the start offset in the current gpio_chip number space
> + * @pin_list: the list of pins to accumulate in this range
> + * @npins: the number of pins to accumulate in this range

> + * Calling this function directly from a DeviceTree-supported
> + * pinctrl driver is DEPRECATED. Please see Section 2.1 of
> + * Documentation/devicetree/bindings/gpio/gpio.txt on how to
> + * bind pinctrl and gpio drivers via the "gpio-ranges" property.

New API can't be deprecated. You probably want to say
"NOTE, this API is not supposed to be used on DeviceTree-supported platforms."
or something like that.

Also it's not clear which function should be used to clean up this. I would
clarify that: "When tearing down the driver don't forget to remove added ranges
with help of gpiochip_remove_pin_ranges()."

> + * Returns:
> + * 0 on success, or a negative errno on failure.
> + */
> +int gpiochip_add_pin_range_sparse(struct gpio_chip *gc, const char *pinctl_name,
> +				  unsigned int gpio_offset, unsigned int const *pins,
> +				  unsigned int npins)
> +{
> +	return __gpiochip_add_pin_range(gc, pinctl_name, gpio_offset, 0, pins,
> +					npins);
> +}
> +EXPORT_SYMBOL_GPL(gpiochip_add_pin_range_sparse);

To me the gpiochip_add_sparse_pin_range() name sounds better.

...

>  int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name,
>  			   unsigned int gpio_offset, unsigned int pin_offset,
>  			   unsigned int npins);
> +int gpiochip_add_pin_range_sparse(struct gpio_chip *gc, const char *pinctl_name,
> +				  unsigned int gpio_offset, unsigned int const *pins,
> +				  unsigned int npins);
>  int gpiochip_add_pingroup_range(struct gpio_chip *gc,
>  			struct pinctrl_dev *pctldev,
>  			unsigned int gpio_offset, const char *pin_group);

> +static inline int
> +gpiochip_add_pin_range_sparse(struct gpio_chip *gc, const char *pinctl_name,
> +			      unsigned int gpio_offset, unsigned int const *pins,
> +			      unsigned int npins)
> +{
> +	return 0;
> +}

Yeah, two stubs, two almost identical doc sections, no explanations of pins in
the core function...

I would rather refactor this to just rename the current function while adding
parameter to it, but leave it is being exported, just add a description to the
new parameter into the kernel doc. Make two new out of it as static inline:rs.

-- 
With Best Regards,
Andy Shevchenko



