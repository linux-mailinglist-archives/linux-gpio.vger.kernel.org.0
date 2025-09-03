Return-Path: <linux-gpio+bounces-25527-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E0DB425D1
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 17:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3708F189D364
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDF7283FF9;
	Wed,  3 Sep 2025 15:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P26X69lc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF5C271A9D;
	Wed,  3 Sep 2025 15:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756914494; cv=none; b=rb6xaxIRfKjjnEAh8HBYZsRtb/0Rms/MOEebkRtJuAC3CVi3BvbcSD0efMi3FMzs5R8rlViMOPeDXx+/7s4Up82ScgLbkU5s1u0wh+odcZklR/TvM+fjLJHGHfP0mZ3/YUzOs3U38F5ZOcXa+RUierVFbjgsyjF1j6pVqStmR20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756914494; c=relaxed/simple;
	bh=Ibe9kE7bJQVzmN0iWK+qfrTbPUnPCwHMYJUF1OEdNRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLBbx56wNhsvtAlr11nYIqMA8r8q73wRY3qv3UAHO28tYNhwT27u6H/fOcZVVmMDNFPgiuJFSAWYeZTpNWP2t3/nMyjnQCA8oameVsrPfAb2heHoqMJ2sX0JRJGGNaExEaZD43A2Maq1710OGoOBTADq8/Qr5lSFt+z43FoWl6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P26X69lc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756914494; x=1788450494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ibe9kE7bJQVzmN0iWK+qfrTbPUnPCwHMYJUF1OEdNRc=;
  b=P26X69lcPMH25GGZDSy1cgmAT1yfTFml3mJGa1nC22tao2dZygKAbnZ/
   yyN9jVxU78v+bbchyPCksLE1Pi9Ejcz9Rqg/aJPmr/h2WweErpNBDA8PG
   ZGwdZHWOOklYk5dENOo5NPtyGWd8SneME182VVd+m12mBcnygLQESxdcU
   85WNbiq00X37nUA/0GnGNlDyeMjw3PC4+BE7mznx4E9zYU6cdr+FeQidm
   TOMjD7m1fsggZNEu6mH9kHh/+G9a+OKuPAH5aIxFhiV/93+pD7P4U9nJm
   CJ0v2AsaCWpCfIjxJTXbhimWJagwUtxuokmhYCxLuNj+GhjZyMcjTqhay
   w==;
X-CSE-ConnectionGUID: zFKpMO//Sv2A0tUXQc6Gkg==
X-CSE-MsgGUID: BDa2ETrYR/qI3clIwjKdfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76678524"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="76678524"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 08:48:13 -0700
X-CSE-ConnectionGUID: tJhmELzKQICPQfuLn4iUQg==
X-CSE-MsgGUID: LxeRLip3RROHG4izuv4+mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="171185220"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 03 Sep 2025 08:48:09 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5F61595; Wed, 03 Sep 2025 17:48:08 +0200 (CEST)
Date: Wed, 3 Sep 2025 17:48:08 +0200
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
Message-ID: <aLhjOAttpdT--tW7@black.igk.intel.com>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
 <20250825-gpio-mmio-gpio-conv-v1-7-356b4b1d5110@linaro.org>
 <aLhie72v1T9Bw1vx@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLhie72v1T9Bw1vx@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 03, 2025 at 05:44:59PM +0200, Andy Shevchenko wrote:
> On Mon, Aug 25, 2025 at 11:48:48AM +0200, Bartosz Golaszewski wrote:
> > 
> > Convert the driver to using the new generic GPIO chip interfaces from
> > linux/gpio/generic.h.

...

> > +	config = (typeof(config)){
> 
> First of all, what's wrong with the pattern used in the kernel when we
> explicitly show the compound literal? Also we put a space before {.
> 
> > +		.dev = dev,
> > +		.sz = 2,
> > +		.dat = base_addr + INPUT_REG_OFFSET,
> > +		.set = base_addr + OUTPUT_REG_OFFSET,
> > +		.dirout = base_addr + DIRECTION_REG_OFFSET,
> > +	};
> > +
> > +	retval = gpio_generic_chip_init(chip, &config);
> >  	if (retval)
> > -		return dev_err_probe(dev, retval, "bgpio_init failed\n");
> > +		return dev_err_probe(dev, retval,
> > +				     "failed to initialize the generic GPIO chip\n");
> 
> Second, can't it all be hidden in the GPIOLIB just by passing the pointer to
> the above initialised structure? Yes, it will take a pointer space in GPIO chip
> for all, but I think it will reduce the burden.

Okay, it seems the motivation is to make it in align with, e.g., gpio-regmap.
But why not simply convert the drivers to use gpio-regmap instead?

-- 
With Best Regards,
Andy Shevchenko



