Return-Path: <linux-gpio+bounces-19033-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5029CA923CD
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 19:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BD843A5138
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 17:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBAF255240;
	Thu, 17 Apr 2025 17:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="imhKxBZC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8D42550D2;
	Thu, 17 Apr 2025 17:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744910217; cv=none; b=J1oTw/FvhcvB5Ynl/yFLurObra9OMNpqQmIN8dK3qCNYXxsVVKdf0mdcZIfVN3hw4VLYktS7C1PXpKd1ZQ7RIJaFU0egJA+SxAZNYgSoHjCtyHMJCwmiPbjGmMK5z06/fMl7AyoSIgZ5pv0QUbcHhy7gQonj+wuyBghevg3/tBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744910217; c=relaxed/simple;
	bh=+G1rBLGmLoEg80EjAe3XaAfK5omvCAbji4Of0r0raAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XE68BHh8B+FI/WE2t6ds9M82MbTAPnAZ8ssM+3be5k9dCx1IuNRDTJPlKxm1VNcpRpHzCwrWV7JF4m+nKP4IMU0JtKOUv7cNOktja0f9gneVrHCHC/GvXRWvjUlNgLQ6HNS7h4qGKk/ddAHj033zZr0FhnsI5TtF2bgl4xC42uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=imhKxBZC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744910215; x=1776446215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+G1rBLGmLoEg80EjAe3XaAfK5omvCAbji4Of0r0raAc=;
  b=imhKxBZCy/rbKzVBbGWjCccxOOORtdBfubMblbqBD/H7RB19tTUqDe3m
   qYgS+RQd8PCi3FjP6vkKUEE542tlvprLWXu5jzjLEUH68MZ54Rixd+pah
   +bpqOdCcnxF04WpP71aRv1ltMXD5kPmATbQFC5g4ebgDXWNxWT0dYUiO7
   Z0gXsJI10ghVGq0lOHl3oOx/ikrF0qs1S6nCe/t1EIz6F2Qzn1fbAY+HO
   LMffky8aXEklNChfLZWhmJrFKIrhS4bd+mb3zhqg538qNAbgbP+ivV7XF
   4gRL+350fQNbxpNqOv5X7YpXKC9I0FNpMHxLHAk6fUMjMBjNHm0dlsHK7
   Q==;
X-CSE-ConnectionGUID: blEKMaehSg+Ji4ZNRMniKg==
X-CSE-MsgGUID: 5+SfsDKlScKcllgE/J+PVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46400598"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46400598"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:16:54 -0700
X-CSE-ConnectionGUID: XGjjEqOLTduXzoGcm2sSQw==
X-CSE-MsgGUID: bI2PSBsWTuizGJo6TcVgDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="161915738"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:16:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u5Sr3-0000000DGRV-3aqp;
	Thu, 17 Apr 2025 20:16:49 +0300
Date: Thu, 17 Apr 2025 20:16:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH v3 04/10] gpio: aggregator: refactor the code to add GPIO
 desc in the forwarder
Message-ID: <aAE3gRH08WuuIFai@smile.fi.intel.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-4-f40776bd06ee@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-4-f40776bd06ee@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 04:08:12PM +0200, Thomas Richard wrote:
> Create a dedicated function to add a GPIO desc in the forwarder. Instead of
> passing an array of GPIO desc, now the GPIO desc are passed on by one to
> the forwarder.

...

> +static int gpiochip_fwd_add_gpio_desc(struct gpiochip_fwd *fwd,
> +				      struct gpio_desc *desc,
> +				      unsigned int offset)
> +{
> +	struct gpio_chip *parent = gpiod_to_chip(desc);
> +	struct gpio_chip *chip = &fwd->chip;
> +
> +	if (offset > chip->ngpio)

>= ?

> +		return -EINVAL;

> +	if (fwd->descs[offset])
> +		return -EEXIST;

Not sure we need this. I would rather think that something inside struct
gpiochip_fwd should track this. OTOH, I understand that you want to have
sparse lists perhaps. I;m wondering why GPIO valid mask can't be used for
this purposes?

> +	/*
> +	 * If any of the GPIO lines are sleeping, then the entire forwarder
> +	 * will be sleeping.
> +	 * If any of the chips support .set_config(), then the forwarder will
> +	 * support setting configs.
> +	 */
> +	if (gpiod_cansleep(desc))
> +		chip->can_sleep = true;
> +
> +	if (parent && parent->set_config)
> +		chip->set_config = gpio_fwd_set_config;
> +
> +	fwd->descs[offset] = desc;
> +
> +	dev_dbg(chip->parent, "%u => gpio %d irq %d\n", offset,
> +		desc_to_gpio(desc), gpiod_to_irq(desc));
> +
> +	return 0;
> +}

The bottom line is that I'm fine with this change without additional checks,
add them when function will be used not only in the original loop.

-- 
With Best Regards,
Andy Shevchenko



