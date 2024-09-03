Return-Path: <linux-gpio+bounces-9687-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B850596A42E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 18:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75FCA285D60
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 16:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4A818BC14;
	Tue,  3 Sep 2024 16:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPWL9DsO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E26186E46;
	Tue,  3 Sep 2024 16:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725380618; cv=none; b=KyLPtfofCjtZf65X1T2uZSykkc/OXnvpchVKDmhtlcHoz1QmgAO4wHo8sjtXMPiwtCzPcwA1b6NHWIcOPR5YqqceDeA/7N25QNahmDh3ku/rGBovDkNxWKSfW0Rs5IRrh28JZj/o/Vq9K9ph8oSxaYQUHu3xZoHTfuhf3MlRqnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725380618; c=relaxed/simple;
	bh=3P6P48E1Svf2IYI/T/2cf8VTgYy8IOvv3Eov6N2ovRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHvaTlXTSJcp/Wz8UdCOxLTgQKrhXZVWqQPsPlMmyksFxvZ9CojjiHCHy56ag+Tp0bgmdnR6hWYP2OkzhPoJsQIZrc4w5V+50EKfF02jq3mtuEvNYOcpo7NKJdHV4cp8C2s0U3Bn7l+lTAlN0TwEtrlTABccqC7vfnTDkHYHs2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPWL9DsO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725380617; x=1756916617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3P6P48E1Svf2IYI/T/2cf8VTgYy8IOvv3Eov6N2ovRg=;
  b=MPWL9DsOI2zB0CCcbg12lK14s8cnj0OwxzH1Di80cecjIxv2aBDOZ3Nk
   /y+oQfMsteKPIRc6q3l1A3hAAYwiniWCt+/ASA47oBigxEIkwBcMYVHal
   Ti+7MGeHPp4IVIAM6E04ULFFdNfjs3ruumwV1KX9dIXGt17jRZQywan0b
   0p5JXIoUM6uonW6a8YJwHMxHCNObgrF7yYAN6dGSAsY9MFdgxlU/84MyD
   6owNQbpDEabU4DZoOsnaE9awpGR1//rDI5eW/t5Vw+O4CRSWB6uIX/+SB
   qTPrU0LIUv3Sfqh+8ZM39Yuk6J7HKVRMrWTKTnEhLVBV/Uuw8p4IP9zNn
   w==;
X-CSE-ConnectionGUID: N8QOmiE/QpCqhWrnAU0UZA==
X-CSE-MsgGUID: COfxqH21R+2mKtnczO/Hxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41464334"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="41464334"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:23:36 -0700
X-CSE-ConnectionGUID: B6ogmTgYTbyMD/vEEl1Lgw==
X-CSE-MsgGUID: b4WFgmczSYuPdhK7kKiu3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65190352"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:23:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1slWJX-00000004lfX-3exp;
	Tue, 03 Sep 2024 19:23:31 +0300
Date: Tue, 3 Sep 2024 19:23:31 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Martyn Welch <martyn.welch@collabora.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] gpio: mpc8xxx: switch to using
 DEFINE_RUNTIME_DEV_PM_OPS()
Message-ID: <Ztc4A0rZE3G1oHo7@smile.fi.intel.com>
References: <20240903154533.101258-1-brgl@bgdev.pl>
 <20240903154533.101258-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903154533.101258-2-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 03, 2024 at 05:45:33PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Use the preferred API for assigning system sleep pm callbacks in drivers.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Hmm... Maybe I should pay more attention when answering emails.
Please, use my @linux.intel.com address for Linux kernel contributions.

...

>  #include <linux/mod_devicetable.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>

You need pm.h as macros defined there.

>  #include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>

...

> +static DEFINE_RUNTIME_DEV_PM_OPS(mpc8xx_pm_ops, mpc8xxx_suspend,
> +				 mpc8xxx_resume, NULL);

I would split logically, i.e.

static DEFINE_RUNTIME_DEV_PM_OPS(mpc8xx_pm_ops,
				 mpc8xxx_suspend, mpc8xxx_resume, NULL);

OR

static DEFINE_RUNTIME_DEV_PM_OPS(mpc8xx_pm_ops,
				 mpc8xxx_suspend, mpc8xxx_resume,
				 NULL);

-- 
With Best Regards,
Andy Shevchenko



