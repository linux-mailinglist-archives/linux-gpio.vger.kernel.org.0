Return-Path: <linux-gpio+bounces-22347-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6CCAEBB8D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 17:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC78C16ED8D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 15:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4762E92AD;
	Fri, 27 Jun 2025 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csDq/cJc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55839443;
	Fri, 27 Jun 2025 15:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037684; cv=none; b=UWw29pijqYL5na24EJneTIskjJwq+ijjWT6PhR8nv+j69IhX3s49g++j+5FX5rpno9FXl+/aAXlBOFOFQStoDZ7jxF8q6kMbI62Bj0wf9yDJI/+OfEEOFUhOQSv4CuToquMyAcxDqsKv5rmh0jZluOtVneLkS0uXodu2Lgaxxj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037684; c=relaxed/simple;
	bh=Oeioom8uEThUTCOqsqu9wyR90HbhY5yThWPiJTHUTek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHJqMNET5Z4T/83T05IAQVY1e5YJ1GrsDjcaNh0Kne908jmrLQLn9DBz2th/XLRzO7ClZpyAozxlvSpZ9h8Mv0syZScqU9RuvQTGHsUGjgzV+dc3+ZcQsAiuVOy5AGOq9teFPu6o9rRbEIKUfYjLj6JW/V3jI5Cy64QeGkvi9Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csDq/cJc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751037683; x=1782573683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oeioom8uEThUTCOqsqu9wyR90HbhY5yThWPiJTHUTek=;
  b=csDq/cJcsDiakKf6H0kiYMifzSFQr3GEsq/N45GzfHwumb9SCfEii8ND
   5gbOxK4vzqLW/IfdJ/eQSKOs1yl397T/Tq4dnAwGT2ruCtFJW/fDWcoJA
   V2KYhvE0sktkorSK5kjDOs3L4T4jn1H1UKO6ZHVJqmeatHompFMTTndPe
   Eg1RjfaMn0nL9FJj8R9mITVCb/+9dpMemAYhSrF9steZN8C2iceh78GsE
   ZO2/BSPOjZ+LajVLOhyHd97IMwO9va9DpkstJJmXbJKvHXhupJJ8Wkg9n
   Eg/ibiefMrH8gbvAS/g0OFrpZA4EN+zua2Oq9PF4PCv4BTzmtv4rK7ysG
   Q==;
X-CSE-ConnectionGUID: JgeWv5FQRY+ENCaVifgGzA==
X-CSE-MsgGUID: QBoS87tPS+CzFCPQh9gd6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="70923537"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="70923537"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 08:21:22 -0700
X-CSE-ConnectionGUID: HXFfjP5OQEK7L4RYdRckZw==
X-CSE-MsgGUID: 9lsc+j9+RRuvpddqsrMlCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153544157"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jun 2025 08:21:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 417D92BA; Fri, 27 Jun 2025 18:21:17 +0300 (EEST)
Date: Fri, 27 Jun 2025 18:21:17 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Kent Gibson <warthog618@gmail.com>,
	Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/9] gpio: sysfs: add a parallel class device for each
 GPIO chip using device IDs
Message-ID: <aF627RVZ8GFZ_S_x@black.fi.intel.com>
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
 <20250623-gpio-sysfs-chip-export-v2-1-d592793f8964@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-1-d592793f8964@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 23, 2025 at 10:59:49AM +0200, Bartosz Golaszewski wrote:
> 
> In order to enable moving away from the global GPIO numberspace-based
> exporting of lines over sysfs: add a parallel, per-chip entry under
> /sys/class/gpio/ for every registered GPIO chip, denoted by device ID
> in the file name and not its base GPIO number.
> 
> Compared to the existing chip group: it does not contain the "base"
> attribute as the goal of this change is to not refer to GPIOs by their
> global number from user-space anymore. It also contains its own,
> per-chip export/unexport attribute pair which allow to export lines by
> their hardware offset within the chip.
> 
> Caveat #1: the new device cannot be a link to (or be linked to by) the
> existing "gpiochip<BASE>" entry as we cannot create links in
> /sys/class/xyz/.
> 
> Caveat #2: the new entry cannot be named "gpiochipX" as it could
> conflict with devices whose base is statically defined to a low number.
> Let's go with "chipX" instead.
> 
> While at it: the chip label is unique so update the untrue statement
> when extending the docs.

...

>  struct gpiodev_data {
>  	struct gpio_device *gdev;
>  	struct device *cdev_base; /* Class device by GPIO base */
> +	struct device *cdev_id; /* Class device by GPIO device ID */

I would add it in the middle in a way of the possible drop or conditional
compiling of the legacy access in the future.

>  };

...

> +static int export_gpio_desc(struct gpio_desc *desc)
> +{
> +	int offset, ret;

Why offset is signed?

> +	CLASS(gpio_chip_guard, guard)(desc);
> +	if (!guard.gc)
> +		return -ENODEV;
> +
> +	offset = gpio_chip_hwgpio(desc);
> +	if (!gpiochip_line_is_valid(guard.gc, offset)) {
> +		pr_debug_ratelimited("%s: GPIO %d masked\n", __func__,
> +				     gpio_chip_hwgpio(desc));

Can we use gdev here? (IIRC we can't due to some legacy corner cases)

> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * No extra locking here; FLAG_SYSFS just signifies that the
> +	 * request and export were done by on behalf of userspace, so
> +	 * they may be undone on its behalf too.
> +	 */
> +
> +	ret = gpiod_request_user(desc, "sysfs");
> +	if (ret)
> +		return ret;
> +
> +	ret = gpiod_set_transitory(desc, false);
> +	if (ret) {
> +		gpiod_free(desc);
> +		return ret;
> +	}
> +
> +	ret = gpiod_export(desc, true);
> +	if (ret < 0) {
> +		gpiod_free(desc);
> +	} else {
> +		set_bit(FLAG_SYSFS, &desc->flags);
> +		gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
> +	}
> +
> +	return ret;
> +}

...

> +static struct device_attribute dev_attr_export = __ATTR(export, 0200, NULL,
> +							chip_export_store);

__ATTR_WO()

...

> +static struct device_attribute dev_attr_unexport = __ATTR(unexport, 0200,
> +							  NULL,
> +							  chip_unexport_store);

Ditto.

...

> +static struct attribute *gpiochip_ext_attrs[] = {
> +	&dev_attr_label.attr,
> +	&dev_attr_ngpio.attr,
> +	&dev_attr_export.attr,
> +	&dev_attr_unexport.attr,
> +	NULL,

No comma for the terminator, please.

> +};

...

> +	data->cdev_id = device_create_with_groups(&gpio_class, parent,
> +						  MKDEV(0, 0), data,
> +						  gpiochip_ext_groups,
> +						  "chip%d", gdev->id);
> +	if (IS_ERR(data->cdev_id)) {
> +		device_unregister(data->cdev_base);
> +		kfree(data);

UAF

> +		return PTR_ERR(data->cdev_id);
> +	}

-- 
With Best Regards,
Andy Shevchenko



