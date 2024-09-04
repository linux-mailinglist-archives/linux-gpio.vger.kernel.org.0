Return-Path: <linux-gpio+bounces-9741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2131696B050
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 07:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCAAD28740E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 05:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3AF84A31;
	Wed,  4 Sep 2024 05:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtykkKLn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2806BB46;
	Wed,  4 Sep 2024 05:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725426415; cv=none; b=jjszWYxPOPKqeM3uKK7cUkWHRhremmnvgprVuvlOVb9VioFAwmO2ni3rHbTgUWX4cSUlfH1uBFhu4OqFtwONfzDjI/YT/4Xqki6KSRon9XPXfy3hUZIP/n3SZ99Z/qHFO9MFVOAN2/xlA85XPjpY5o6CtlvcCpgITMXhXm06KgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725426415; c=relaxed/simple;
	bh=5p0KGoqfo9WjrlXZu7mW5dE24Dm7YVyW28cRL1f6U+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSRHiu1ZjHbEgwHr7cp6j+vZTCM5szMuNGtkdggk6jjY5vDKesh014Xhr3Pim/HbM+9uh+vKLmp2+PHEWhF3Kex+Fzpz0TCadzNLRqAZagqMKDhMD5HlGzIJDtQ1A6fTCME2GLxNZP57jWwM0s3kPacdrrdzfWzJf8JiNrVOk5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtykkKLn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725426415; x=1756962415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5p0KGoqfo9WjrlXZu7mW5dE24Dm7YVyW28cRL1f6U+0=;
  b=BtykkKLnIKj14EQUHW+Hh4z65QSCfUEcQzmE+jWJGiQOrcOG+lzkYam6
   8pRcJ0xX9N3Vx8IQFQ/afh7AEbBcgkjd/2DCFd0hDPnMRc6p87XVv7zCL
   CXT64rk4WcQjZeIm3GU8i1TZV3CzK/q5WPr8kL6MNr7B4dq9mwmHtRW7l
   0TcI5CZP7yI7rZanSxpd0kGf0E3VT7ysCAhSZayA7Clpm3mOAOP1k0Lzk
   S+RRwDTIG9rFNtG7U1GS3rDRDCxAxP8rWD+4xMtG9Fn4MRaka3d2Isxbs
   rRMqK6pV59tuctdU7aD0WaW7+w37qHyKzzE7nC0avN/f4hdX8qpydcWT2
   A==;
X-CSE-ConnectionGUID: oTO1+MMdQ2+KD81CjcsyoQ==
X-CSE-MsgGUID: WV4GqQN1QV6pVwR8cqKbYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24222875"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="24222875"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 22:06:54 -0700
X-CSE-ConnectionGUID: rdhlbZfPS/q2g7Dh4X1gMw==
X-CSE-MsgGUID: TiXl/Fn5QtmQbrH8lrINRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="65205463"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 03 Sep 2024 22:06:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 0088E128; Wed, 04 Sep 2024 08:06:49 +0300 (EEST)
Date: Wed, 4 Sep 2024 08:06:49 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 3/3] pinctrl: cherryview: Replace ifdeffery by
 pm_sleep_ptr() macro
Message-ID: <20240904050649.GD1532424@black.fi.intel.com>
References: <20240903170752.3564538-1-andriy.shevchenko@linux.intel.com>
 <20240903170752.3564538-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903170752.3564538-4-andriy.shevchenko@linux.intel.com>

On Tue, Sep 03, 2024 at 08:04:51PM +0300, Andy Shevchenko wrote:
> Explicit ifdeffery is ugly and theoretically might be not synchronised
> with the rest of functions that are assigned via pm_sleep_ptr() macro.
> Replace ifdeffery by pm_sleep_ptr() macro to improve this.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-cherryview.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index 2f0e29c78dfb..9cdffd73e345 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1608,6 +1608,16 @@ static acpi_status chv_pinctrl_mmio_access_handler(u32 function,
>  	return AE_OK;
>  }
>  
> +static int chv_pinctrl_pm_init(struct intel_pinctrl *pctrl)
> +{
> +	pctrl->context.pads = devm_kcalloc(pctrl->dev, pctrl->soc->npins,
> +					   sizeof(*pctrl->context.pads), GFP_KERNEL);
> +	if (!pctrl->context.pads)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
>  static int chv_pinctrl_probe(struct platform_device *pdev)
>  {
>  	const struct intel_pinctrl_soc_data *soc_data;
> @@ -1648,13 +1658,9 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
>  
>  	community->pad_regs = community->regs + FAMILY_PAD_REGS_OFF;
>  
> -#ifdef CONFIG_PM_SLEEP
> -	pctrl->context.pads = devm_kcalloc(dev, pctrl->soc->npins,
> -					   sizeof(*pctrl->context.pads),
> -					   GFP_KERNEL);
> -	if (!pctrl->context.pads)
> -		return -ENOMEM;
> -#endif
> +	ret = pm_sleep_ptr(chv_pinctrl_pm_init) ? chv_pinctrl_pm_init(pctrl) : 0;

and here

> +	if (ret)
> +		return ret;
>  
>  	pctrl->context.communities = devm_kcalloc(dev, pctrl->soc->ncommunities,
>  						  sizeof(*pctrl->context.communities),
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac

