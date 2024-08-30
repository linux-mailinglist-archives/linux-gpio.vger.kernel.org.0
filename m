Return-Path: <linux-gpio+bounces-9467-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96514966927
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 20:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 247CAB23115
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 18:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35831BBBE8;
	Fri, 30 Aug 2024 18:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yw7cWkYn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A121B9B29;
	Fri, 30 Aug 2024 18:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725043928; cv=none; b=Y7FRWrq7V7DTRbe25lrfGhN3rGCCsTjB83X3O12buBBtWDKAmK21s5kfyMgXAUWTg7QRFBOOYcWQE4HHqVw5MQ874L4jwAKJJccyQ6RiR2ElnzF1ISafiTubKxGJSBpk4BuWepay0XvtrSoqVvOB+QCjshDMiFSHMCTliFKQR4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725043928; c=relaxed/simple;
	bh=1g6UP0+INSxNv+dqvr+NMhr94C5/+d020dTzUB1qIEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjZxtV121aTxwARez6O1ZvXrqI7eyhO5MZ8UT74VfDrwXSikuVsXmkG7FuGjqV+NE4q58acIBb19ZejTAO8UEuv2woAT1UsiaRTHSDfZeTVjI04UvTOavOJSqMWQS/W69G0ywE+8oQ0S0B7pzutZHxvTWDwLL+jR2aAtiqgFcXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yw7cWkYn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725043927; x=1756579927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1g6UP0+INSxNv+dqvr+NMhr94C5/+d020dTzUB1qIEo=;
  b=Yw7cWkYn3AjMSCByO1To2Q36j3kIQcSGLS/f7A4CVEtlrFEPMkDVJ6O/
   qcV+95O/0W0r88C5e5XQAdwa8WlB4Bmceb2ZnZPkjtb2Okv+6U6DZ7K5Q
   wD333/P1vnj2dK1Z9vLdgqCkEvEEXyc1vYyIxNb1RJTIo2YE4TdI7kp4l
   YUtvDptGSvYNz+1I4z8isgWJecIM8gOWOSyv3KMMAWCCURsyAANfwK+KW
   9/xUET/sVOGtSzgSif1IHh9q5AOfxFZCjCSue3IsymGtGkh1xkkTssJ0Q
   zTfqGUKRmM10sLFBJ+RRGlJnWSp8mkxJXEiHvmTaWQrbAZg/0y9FmuBoL
   g==;
X-CSE-ConnectionGUID: 7x9xX5xjRVut5bheWeW0mA==
X-CSE-MsgGUID: 7pz1OywIQ56apQcwkQOGGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="27575243"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="27575243"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 11:52:06 -0700
X-CSE-ConnectionGUID: YhrcxMycTQy8jKRAvPG0BQ==
X-CSE-MsgGUID: R5EoqoN3Sui9gIoRcQwxRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="68375059"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 11:52:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sk6io-00000003Ryp-13LU;
	Fri, 30 Aug 2024 21:51:46 +0300
Date: Fri, 30 Aug 2024 21:51:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/5] pinctrl: intel: High impedance impl. and cleanups
Message-ID: <ZtIUwWavMQRXDOGN@smile.fi.intel.com>
References: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
 <Zs-B9m4jO9x3wX4d@smile.fi.intel.com>
 <974bbb25-3b27-4f53-be35-4bfda17b8c7e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <974bbb25-3b27-4f53-be35-4bfda17b8c7e@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 30, 2024 at 07:56:11AM +0200, Heiner Kallweit wrote:
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
> 
> Device is a dirt-cheap mini pc, marketed as Chatreey T9. It's available
> on the free market, right. Dmesg says:
> DMI: Default string Default string/Default string, BIOS ADLN.M6.SODIMM.ZB.CY.015 08/08/2023
> 
> > 2) does it have any BIOS updates and, if it has, does it fix the issue?
> > 
> No BIOS updates.
> 
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
> I will check.

There is a v2 to test, you can take entire series, or for-next branch of Intel
pin control tree

https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git/log/?h=for-next

Thanks!

-- 
With Best Regards,
Andy Shevchenko



