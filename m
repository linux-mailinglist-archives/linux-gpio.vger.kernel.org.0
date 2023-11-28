Return-Path: <linux-gpio+bounces-594-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4B97FBEF9
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 17:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC720B20E60
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 16:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7839A37D14;
	Tue, 28 Nov 2023 16:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/GbhaiQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B48C1BC;
	Tue, 28 Nov 2023 08:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701187743; x=1732723743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bUDTt3o1DE03wIRYkYueaBcLdCqYQmU2dGzx0wmGR44=;
  b=n/GbhaiQbdnyPWod7LuIbCwAATzIdEUefqGmTkarLRJwivHZTa9W6eb4
   xmZt4Y3qlUAhlx/PBIww5pZmHy1BoXA+hUUAm284WVYUQqTW4cbepGMma
   x34gm27LBfHhqkW4RoncSpL7z46udZftAGtdRGdLpYGxUrs6g7PzbEf1S
   F+Tp8A/fR0zMGXiJPfe0yOaoKusmj0plFu2C9oqLoraxcoGVQi4VNSZDV
   fN4uunE+svXDuEHwB/QIcIGnvbUuzGrfX5g9eNOM2x/t94sVvHECAv19m
   fMBEDnIsENS90UQ9DcDgAZLZEvMO3zunXLLjrQlK8kov8f/kKKwr9Qf14
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="373123836"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="373123836"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 08:09:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="1100152703"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="1100152703"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 08:09:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r80du-00000000ClQ-2Zof;
	Tue, 28 Nov 2023 18:08:58 +0200
Date: Tue, 28 Nov 2023 18:08:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] gpio: use a mutex to protect the list of GPIO devices
Message-ID: <ZWYQmpe7UxnJW0_g@smile.fi.intel.com>
References: <20231127193716.63143-1-brgl@bgdev.pl>
 <20231127193716.63143-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127193716.63143-2-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 27, 2023 at 08:37:16PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The global list of GPIO devices is never modified or accessed from
> atomic context so it's fine to protect it using a mutex. Add a new
> global lock dedicated to the gpio_devices list and use it whenever
> accessing or modifying it.
> 
> While at it: fold the sysfs registering of existing devices into
> gpiolib.c and make gpio_devices static within its compilation unit.

...

> +	scoped_guard(mutex, &gpio_devices_lock) {

This is a lot of churn with this because of switching to RAII.
Can the body be firstly moved to a helper?

> +		/*
> +		 * TODO: this allocates a Linux GPIO number base in the global
> +		 * GPIO numberspace for this chip. In the long run we want to
> +		 * get *rid* of this numberspace and use only descriptors, but
> +		 * it may be a pipe dream. It will not happen before we get rid
> +		 * of the sysfs interface anyways.
> +		 */

...

>  	list_for_each_entry(gdev, &gpio_devices, list)
> +		if (index-- == 0)
>  			return gdev;

I believe this is better with outer {}.

-- 
With Best Regards,
Andy Shevchenko



