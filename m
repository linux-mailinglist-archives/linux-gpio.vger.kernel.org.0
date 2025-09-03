Return-Path: <linux-gpio+bounces-25526-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1859EB425C6
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 17:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C262F1BA4E02
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE8828726E;
	Wed,  3 Sep 2025 15:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUmjNwYe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD34D287243;
	Wed,  3 Sep 2025 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756914306; cv=none; b=px3SQULzgHM9eFqY3vAy+Z7IzLpScc78bqim73W4kblsGrUDsVSDVSHXIGIW+47+ZSQf36WRFPGn2ak9Bw6TCfVaieSq4E7prjDgQm0/PRsdpdmzniYiJCdFpJYDo95BaNDY04T0CtdcjOdEPk1vcN0xTE3V+qT0FtXLQy72HQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756914306; c=relaxed/simple;
	bh=RmIXgX4EPYbEWf+ZuRyxg8gVS0O/rPn4FNVOhp5P5DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhnLIsEDYDzw1LQlJp152mymDLz7RHlNKWEf+boMBHUJmM2zE0KNlAdr1KhaEW8cl04384Vyb6AUZ0MWtYm0ryApQtDmqubloLdh3u5/2R+SIrSVhZyVEjf8Wt6T/HCoFoSBKjrGLp1pHbo6cuCJqESqAdnQ7IH5mPGIPvZH91E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUmjNwYe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756914305; x=1788450305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RmIXgX4EPYbEWf+ZuRyxg8gVS0O/rPn4FNVOhp5P5DQ=;
  b=HUmjNwYefqozFulfvhzDN4QhVqH6Rc8D/xaqEZerat3IAxge0JcwGhxp
   BvM8AJbl8chb3ji0nPRPsOPtmRjDmQ7r/0Y9oRxHgr4k+jT+KMQlN9MNw
   2ptEobpSm06TE2cEELonEsxOW/4QV3q7YeutEIWkrz6TkW6S03eSeuUxc
   8DseELcQ+NZjewJWuf/j4cz0ughOJoD9y9KeQjpFQxwUV936IRnSJOxz8
   mGUReOj4wCj8+aM4UAY7tZFC4aQsUS4JWn8jQvt/z1MCNjjNQSz3FCTPb
   NwKg3Lj94HDyQf9n3dx6+kB0lHpmpIwr3X3HZWbSOc2q3LO5Zl75xfHGM
   w==;
X-CSE-ConnectionGUID: bE54IqfuTl6Tj+/Ba0Zz+g==
X-CSE-MsgGUID: B3M0HyvcSJaKpKUkZ7BNFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="84662832"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="84662832"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 08:45:04 -0700
X-CSE-ConnectionGUID: iISP29WiSIKcCafvMOGpUw==
X-CSE-MsgGUID: JOSrHn6xRGumw7gqBYMURg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="175985164"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2025 08:45:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id D7E0695; Wed, 03 Sep 2025 17:44:59 +0200 (CEST)
Date: Wed, 3 Sep 2025 17:44:59 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Yang Shen <shenyang39@huawei.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-unisoc@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND 07/14] gpio: ts4800: use new generic GPIO chip API
Message-ID: <aLhie72v1T9Bw1vx@black.igk.intel.com>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
 <20250825-gpio-mmio-gpio-conv-v1-7-356b4b1d5110@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-7-356b4b1d5110@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 25, 2025 at 11:48:48AM +0200, Bartosz Golaszewski wrote:
> 
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.

...

> +	config = (typeof(config)){

First of all, what's wrong with the pattern used in the kernel when we
explicitly show the compound literal? Also we put a space before {.

> +		.dev = dev,
> +		.sz = 2,
> +		.dat = base_addr + INPUT_REG_OFFSET,
> +		.set = base_addr + OUTPUT_REG_OFFSET,
> +		.dirout = base_addr + DIRECTION_REG_OFFSET,
> +	};
> +
> +	retval = gpio_generic_chip_init(chip, &config);
>  	if (retval)
> -		return dev_err_probe(dev, retval, "bgpio_init failed\n");
> +		return dev_err_probe(dev, retval,
> +				     "failed to initialize the generic GPIO chip\n");

Second, can't it all be hidden in the GPIOLIB just by passing the pointer to
the above initialised structure? Yes, it will take a pointer space in GPIO chip
for all, but I think it will reduce the burden.

-- 
With Best Regards,
Andy Shevchenko



