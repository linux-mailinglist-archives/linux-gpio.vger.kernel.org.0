Return-Path: <linux-gpio+bounces-9688-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC9696A438
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 18:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC160282439
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 16:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6C418BB8C;
	Tue,  3 Sep 2024 16:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbKR3BRf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDB92868D;
	Tue,  3 Sep 2024 16:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725380741; cv=none; b=MqY25RmTipgWAKaLA56XqDVeHRXnLonLQih00vDsNhGUSM79UHjgYdXzrA9os5aMbxJxxILpVPLtzXE+4dx9yn/Nu4XfVXKoH0pXqcxK+S0BK8Yony/1k8p70mWCoKc7z0Lu72vCIukACilPZkuWgVSVeEpERhFTAleTLCjkbxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725380741; c=relaxed/simple;
	bh=iwVYy+FZcEnwamNnd1vJnvqP66l4y5FfFkqW4IaQGp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISPNVJ53sX+adW80j41Z3g3F+VaXGZsgG4uh8s5qBFVI4+W19wHVloIzmkjRgstd8OdWcM8meBCJA7eBFfQtL9m5s13q0uhxs9KCvIcAmsh0+S6anKNo6QnKrTT2aSJNJ1D3+SvJDzelE33uI9YB+0ngLPMNrkbLF8NsPp5rDkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbKR3BRf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725380740; x=1756916740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iwVYy+FZcEnwamNnd1vJnvqP66l4y5FfFkqW4IaQGp8=;
  b=gbKR3BRf2Pv+VlboqWSmqQeWENJcRR1fkX0dsobZ5k/0Y9dLTpwdKgeT
   c8MxuHBfgeDXwi8hqzJS+Ft/A7uJ7EY7kGSqe0Lo3EPjdCt98Jx/DisVa
   sdJriDUsk9jxsC1tjf4dQky4jOjopPdd+8JcQERrzkT6eaS1QqDEW2S1g
   esKl4X6krN4Yi6n4RvjAb6euxMNR32pI77RW9WJY6fQx69TbyGyUQZ1XC
   kNY02qu8ivfu3Gcmi/5TVS6YPCOSGuV5XSm9tS3s4fKDWAJ1Txi0741X5
   6mo5zrUDHRQx71Olm4/jOC22bCGeC/vSEblMAHOUt4QxUE/YEDjUABvI8
   g==;
X-CSE-ConnectionGUID: AVUG4qSGQou3NEpgPc+few==
X-CSE-MsgGUID: Fke+bkRyRuiO0wf4puurhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23508962"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23508962"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:25:39 -0700
X-CSE-ConnectionGUID: kucaFSwRT82RxDPCY77u+w==
X-CSE-MsgGUID: PtjElxBiQDa+4O7YZtcsoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69755552"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:25:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1slWLX-00000004liQ-1cpy;
	Tue, 03 Sep 2024 19:25:35 +0300
Date: Tue, 3 Sep 2024 19:25:35 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Martyn Welch <martyn.welch@collabora.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] gpio: mpc8xxx: switch to using
 DEFINE_RUNTIME_DEV_PM_OPS()
Message-ID: <Ztc4f3AOpppiL4Dt@smile.fi.intel.com>
References: <20240903154533.101258-1-brgl@bgdev.pl>
 <20240903154533.101258-2-brgl@bgdev.pl>
 <Ztc4A0rZE3G1oHo7@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ztc4A0rZE3G1oHo7@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 03, 2024 at 07:23:31PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 03, 2024 at 05:45:33PM +0200, Bartosz Golaszewski wrote:

...

> >  #include <linux/mod_devicetable.h>
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> 
> You need pm.h as macros defined there.

...or both...

> >  #include <linux/property.h>
> >  #include <linux/slab.h>
> >  #include <linux/spinlock.h>

...

> > +static DEFINE_RUNTIME_DEV_PM_OPS(mpc8xx_pm_ops, mpc8xxx_suspend,
> > +				 mpc8xxx_resume, NULL);

This one comes from pm_runtime.h, but pm*_ptr() ones from pm.h.

And it seems you wanted pm_ptr().

-- 
With Best Regards,
Andy Shevchenko



