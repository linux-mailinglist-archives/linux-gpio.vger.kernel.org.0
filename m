Return-Path: <linux-gpio+bounces-9893-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5E196F3E8
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 14:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12E5F1F22EA8
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 12:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FB51CBE89;
	Fri,  6 Sep 2024 12:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVqBFTue"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD32722315;
	Fri,  6 Sep 2024 12:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725624130; cv=none; b=fHU6hcGIHOuQ0DrMUVzcub9fYnTJheyfqAgfU59kbn+8Q5TLoS38axBhhwoHBSYn+Fvp3irIdbYkl3MThL1SqnkhpdcW8xG95xjxkz/+LBVVLcOOU7wAvaG78FDQiAvIsI2W2xA0UJS2BHzg9JbTNj90fYqnUR7IcSaU6kc2+TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725624130; c=relaxed/simple;
	bh=vEE1MOLnoAFGtMmRyecmuLNulPXNIP+QTrINs35oqPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YpRiC7Xwrt/TkbeyOQ6ZOGk6jbeCHkj60urO+7LS2dkabS3HtAR+zwSYVDMDm4H0Lz5wjsfU/dKlrpcV50Pwov7mrrj3DAUcg6PkBKGTSBhyL0z0DxqYyaff0yQTYzeMiAvYlxSkqjIFone+LBPg/5tlBkPq38HXs65dY7x4Kaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVqBFTue; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725624129; x=1757160129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vEE1MOLnoAFGtMmRyecmuLNulPXNIP+QTrINs35oqPo=;
  b=HVqBFTueJVzBgwmNPZXFKEwdcElrxSruTI59sSUDMA10eM2bZ+poh95t
   HcnwLd1SQ1YRVdtrw1vv67bG/ESase+gWWCAv12wFvXXzdsXLWvihk111
   itwA/0VCl1A+SsBbhbC+lC+Mfma/9DWxBkqa4MDVPyCeLlyP8J1SSxUfU
   0gCKwkT9Vt6bcRMQGSjby4x1Yw6WQPdcYs+Q47bbt6/+Qsv4ShBMB/nRI
   d9JlGRg9XZVbwPB5N8PD413qFWgYJ4G2JMwcMF0PmKEjMvBt6rmhAIrmH
   HY/4GxdOTyhPg72vCkUmWPlB+1HfgtS/2v4dYdHqHReDJ8vYyDBhYl6al
   w==;
X-CSE-ConnectionGUID: cwRbXU8wRaS3N1JePNFdIw==
X-CSE-MsgGUID: gpGC/HhqQiWRo5Uagsk9IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="41861688"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="41861688"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 05:02:08 -0700
X-CSE-ConnectionGUID: s1KtiPQkREG9ECreWY/xxg==
X-CSE-MsgGUID: YdkD4i+4Q8q9xxa/mKgkbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="70727937"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 06 Sep 2024 05:02:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C9D7C197; Fri, 06 Sep 2024 15:02:05 +0300 (EEST)
Date: Fri, 6 Sep 2024 15:02:05 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] pinctrl: intel: Replace ifdeffery by
 pm_sleep_ptr() macro
Message-ID: <20240906120205.GF275077@black.fi.intel.com>
References: <20240906113710.467716-1-andriy.shevchenko@linux.intel.com>
 <20240906113710.467716-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240906113710.467716-2-andriy.shevchenko@linux.intel.com>

On Fri, Sep 06, 2024 at 02:36:06PM +0300, Andy Shevchenko wrote:
> Explicit ifdeffery is ugly and theoretically might be not synchronised
> with the rest of functions that are assigned via pm_sleep_ptr() macro.
> Replace ifdeffery by pm_sleep_ptr() macro to improve this.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c |  5 +----
>  drivers/pinctrl/intel/pinctrl-intel.h | 14 ++++++++++++++
>  2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index f6f6d3970d5d..e3f9d4d9667c 100644
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
>  
>  	return 0;
>  }
> @@ -1649,7 +1646,7 @@ int intel_pinctrl_probe(struct platform_device *pdev,
>  	if (irq < 0)
>  		return irq;
>  
> -	ret = intel_pinctrl_pm_init(pctrl);
> +	ret = intel_pinctrl_context_alloc(pctrl, intel_pinctrl_pm_init);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
> index 4d4e1257afdf..7d8d1c5668d3 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.h
> +++ b/drivers/pinctrl/intel/pinctrl-intel.h
> @@ -256,6 +256,20 @@ struct intel_pinctrl {
>  	int irq;
>  };
>  
> +typedef int (*intel_pinctrl_context_alloc_fn)(struct intel_pinctrl *pctrl);
> +
> +static inline int intel_pinctrl_context_alloc(struct intel_pinctrl *pctrl,
> +					      intel_pinctrl_context_alloc_fn alloc_fn)
> +{
> +	intel_pinctrl_context_alloc_fn fn;
> +
> +	fn = pm_sleep_ptr(alloc_fn);
> +	if (fn)
> +		return fn(pctrl);
> +
> +	return 0;
> +}

No way, this looks even worse :(

Let's not do this change please.

