Return-Path: <linux-gpio+bounces-9739-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B310F96B045
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 07:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7643C283988
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 05:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0902C82486;
	Wed,  4 Sep 2024 05:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6xp+GUN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D3B823AC;
	Wed,  4 Sep 2024 05:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725426355; cv=none; b=r8pJ/51kX9Fl1LxLD1gFkbzKw+qFVTcQaC2E7hwL8jDe4ynON91F+OWI/hsi2pRS0kBEGmkKrNAP3Im17nF/Zg1PfFLBOB5N9+TlPMrtxECuLiBv9FoHsRYvXLH2NOVSy5soRskNsTt/R1LqJ3dlcBQrSsfZgEdCNlwYmP+AZMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725426355; c=relaxed/simple;
	bh=EW5G/XbqUYX+e5tpLOAtqeq+z9wxUmGBSVQzr4loBYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zt8b6HcA45eFcZBM0efcHwFMoN3rSEWjdQFxI/m9+3AS31CRYdvqqpGTkhjne5LTQUazYR3O1tJgviUlV8InFqZBRvY+GBxV592oGy8QEzJ6EpoHxnZk9hSjnrDUZ5sC3HMEteHx9rjfVbrdT0EamWjVinxS/dd5xoFflaePnjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6xp+GUN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725426354; x=1756962354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EW5G/XbqUYX+e5tpLOAtqeq+z9wxUmGBSVQzr4loBYA=;
  b=L6xp+GUNVDYuwGzPDqOPynH0h8Vrzw+OMz/oEr6NIY0Jj4P5Dvs9sl9d
   Ad96/MbcXS+sETrdAlhXXb5Q0O3zrpW7LRa0rkOo/sf8iL6+R0Uw7gkEV
   j9yQNUYuA32o4AQhJZqqF3twidUEtA75b+iWbVgsCgrUP9Kez6pWC1OT0
   MaQhqU3x0sppPtMcZuK1OE832ELNI34x25YiwgC4ggw3JXLRL4vjV1WE7
   uOjsmoU2dB6OoIE935OUgU1sSUKs7bp8T8sDcmrgru29C55vMx/a8kEAk
   4DIFKhyPrBxYA0FBpc4euvOVO1JT2mthHv1a26pTYGDaMhsiJQJn5bfiL
   w==;
X-CSE-ConnectionGUID: QmEAXQY+Scalm/n1HsH+vA==
X-CSE-MsgGUID: l1uTjhSYQ7SWgFVmbn9WyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="35449161"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="35449161"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 22:05:53 -0700
X-CSE-ConnectionGUID: VWxVcqmAQkOOxsi5HRflfg==
X-CSE-MsgGUID: MepIRCW9TJOfqWXcVOFICw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="69530223"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 03 Sep 2024 22:05:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 554BA128; Wed, 04 Sep 2024 08:05:51 +0300 (EEST)
Date: Wed, 4 Sep 2024 08:05:51 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/3] pinctrl: intel: Replace ifdeffery by
 pm_sleep_ptr() macro
Message-ID: <20240904050551.GB1532424@black.fi.intel.com>
References: <20240903170752.3564538-1-andriy.shevchenko@linux.intel.com>
 <20240903170752.3564538-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903170752.3564538-2-andriy.shevchenko@linux.intel.com>

On Tue, Sep 03, 2024 at 08:04:49PM +0300, Andy Shevchenko wrote:
> Explicit ifdeffery is ugly and theoretically might be not synchronised
> with the rest of functions that are assigned via pm_sleep_ptr() macro.
> Replace ifdeffery by pm_sleep_ptr() macro to improve this.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 7a790c437f68..bfe891522044 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1482,7 +1482,6 @@ static int intel_pinctrl_add_padgroups_by_size(struct intel_pinctrl *pctrl,
>  
>  static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
>  {
> -#ifdef CONFIG_PM_SLEEP
>  	const struct intel_pinctrl_soc_data *soc = pctrl->soc;
>  	struct intel_community_context *communities;
>  	struct intel_pad_context *pads;
> @@ -1497,7 +1496,6 @@ static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
>  	if (!communities)
>  		return -ENOMEM;
>  
> -
>  	for (i = 0; i < pctrl->ncommunities; i++) {
>  		struct intel_community *community = &pctrl->communities[i];
>  		u32 *intmask, *hostown;
> @@ -1519,7 +1517,6 @@ static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
>  
>  	pctrl->context.pads = pads;
>  	pctrl->context.communities = communities;
> -#endif

Can't we make this a stub when !PM_SLEEP?

#ifdef CONFIG_PM_SLEEP
static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
{
...
}
#else
static inline int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
{
	return 0;
}
#endif

>  
>  	return 0;
>  }
> @@ -1649,7 +1646,7 @@ int intel_pinctrl_probe(struct platform_device *pdev,
>  	if (irq < 0)
>  		return irq;
>  
> -	ret = intel_pinctrl_pm_init(pctrl);
> +	ret = pm_sleep_ptr(intel_pinctrl_pm_init) ? intel_pinctrl_pm_init(pctrl) : 0;

Then this still looks like a function call and not like some weird
conditional.

>  	if (ret)
>  		return ret;
>  
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac

