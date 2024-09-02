Return-Path: <linux-gpio+bounces-9560-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98981968517
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA4021C227B7
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05B8185929;
	Mon,  2 Sep 2024 10:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMZM73cP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE50184531;
	Mon,  2 Sep 2024 10:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725273974; cv=none; b=qYBj+M6IfK7KUaMm4w7uv9SgJEYRGbsZsfxdOTJoZhwPDpo5XVfFNX+goSXC2s+Cf6BVVAVU8JMJ2xMnMQooRJVFJUSfFg10sfH0v0phf3UMyFymMYokFu1XK/oXMdcGXkwDXgFWeLKjELOWg8rLwfAjRdUvXuHlhm38ZG5jroM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725273974; c=relaxed/simple;
	bh=bZkng4mXiygiiT22/n5K2YMDGgQe85+QACIfHdscwC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqH92xBxFCWZLF66UAbNeZrHT4MvhQpCfyP6+HGPPu5eXm/owHYfw6BYK+/YoiV+VQbT2Rqr7Kd7L00GHXdJWy2fotEbmhNfWfJ6vOpP4mDO1QaS2ZTui5DoJskEB9Q0Nk4yDZR4oo8wSA8xL2iIg828uqtEgbGAwWgY7ubrLPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMZM73cP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725273972; x=1756809972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bZkng4mXiygiiT22/n5K2YMDGgQe85+QACIfHdscwC8=;
  b=XMZM73cP9ehZL0zOr28GlqoyE+8Hag9chZPZ2+DQ+8h7MADxP49XPX8Q
   Gw/bYatHlnNa4sIjZtdY5pCiHTC5nlq4FTqpD9EflinzOEh+jsvnSYqE6
   oDdMzGXyf1DUBPuSuh0daKIZAmmowu3eI4FTAGJ2c9KvrBBduuJTQVN27
   l7ui8mq06vdiVxeBJII5Q6AuakDYWuYxssd8uW/G1nyFzkKvVxAsZK/GY
   15EjmZGVoSIG39HTRDvKdUu/AIpb35MOL3VxojZG17cp11nB5ky75GftT
   ybvMPl5fLUOoc/PPUNS5nF0+M0EghCx6zwXItt5D2QZBmoNlitlgVCUnR
   Q==;
X-CSE-ConnectionGUID: 33LTC2KSQ/+dITc4hfW7Qg==
X-CSE-MsgGUID: alyDXASqSTOxI+bYN3iwIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="41349770"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="41349770"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 03:46:11 -0700
X-CSE-ConnectionGUID: DT0h7GmkTGOhCgCyr3mDzg==
X-CSE-MsgGUID: DdtrjTPwRiGhfizJEil8mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="69444479"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 03:46:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sl4ZT-00000004KQa-2FRa;
	Mon, 02 Sep 2024 13:46:07 +0300
Date: Mon, 2 Sep 2024 13:46:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/5] pinctrl: intel: High impedance impl. and cleanups
Message-ID: <ZtWXb_vkzUL8U7-F@smile.fi.intel.com>
References: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
 <Zs-B9m4jO9x3wX4d@smile.fi.intel.com>
 <e46d7c57-4534-41fb-a274-5e96a93488d1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e46d7c57-4534-41fb-a274-5e96a93488d1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 30, 2024 at 11:24:06PM +0200, Heiner Kallweit wrote:
> On 28.08.2024 22:00, Andy Shevchenko wrote:
> > On Wed, Aug 28, 2024 at 09:38:33PM +0300, Andy Shevchenko wrote:
> >> We would need a high impedance implementation for a quirk, so here it
> >> is. While doing this series I also noticed a couple of opportunities
> >> to clean up, hence two more patches (1st and 5th).
> > 
> > Sorry it took a while to actually start implementing the quirk for your case.
> > Here I'm asking for the following things:
> > 
> > 1) what is the marketing name of the device you have problems with?
> > (I believe it's available on the free market, correct?);
> > 
> > 2) does it have any BIOS updates and, if it has, does it fix the issue?
> > 
> > 3) can you apply patches 2,3,4,5 from this series (the first one is buggy and
> > not needed for you) and replace the hack I mentioned earlier with
> > 
> > 	ret = intel_gpio_set_high_impedance(pctrl, 3);
> > 	if (ret)
> > 		return ret;
> > 
> > somewhere at the end of intel_pinctrl_probe()?
> > 
> > Does it still work as expected?
> > 
> > 
> In latest series the return value of intel_gpio_set_high_impedance()
> has been removed. With the call to intel_gpio_set_high_impedance()
> changed accordingly this fixes the problem on my system.
> Thanks a lot for your efforts!

Thank you! I will think now, how to make the real quirk (which I may ask you to
test in the future, when it will be ready) that looks and feels not as an ugly
hack.

-- 
With Best Regards,
Andy Shevchenko



