Return-Path: <linux-gpio+bounces-9740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EFA96B04E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 07:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 708A11C20B05
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 05:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AB084A27;
	Wed,  4 Sep 2024 05:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2FicxHS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76DE84A21;
	Wed,  4 Sep 2024 05:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725426395; cv=none; b=rVavdK/NvQr7ZwfK1zy4XE0nzFd4KScyYS44Ckx03FDk7gZI4623iaeOKuW4CE3ZJwFNdRFqqUTRdZTt4sMoR7lAjmYUnfYxFWgCPG45BfqC/4vuSpy0uc0dcDvWyIggbondU8nWER3MPdT0sSSUq43BMSUwivj/gPleu3njaTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725426395; c=relaxed/simple;
	bh=h5yQBYDg69bRJu++2q14/L1RZeItXGC/rllTsxzzdoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNMraQU/n5w2ZDor1e1WLVc+8fG3QfaTAQC//65drFXFfG7kY3+sP8BAUquMSjMEodKFr3q1bC6tMPS2XgE/UBEXLhEqWm/psNS+WxGlpFlvMIchePN98lACC22s8vWa9w8UGgA63uBfJRF67aFvW7hscioP8MlDsr5SFXUsqcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2FicxHS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725426394; x=1756962394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h5yQBYDg69bRJu++2q14/L1RZeItXGC/rllTsxzzdoM=;
  b=k2FicxHS3fB+zVaO6Kpmtt537GenKBB/fN3K/Snm6oTG7KU6C0CuHvCg
   XRly88+BLxwerc33AjLYif9eG390l6WXtIOVpHIi3hoRx3Q6oYFL1pEIE
   oFCrn2dJ86MVDTOjTuWC5Zk6jbM77txBCaKrMClD0oNvhAX6GZknh2mYz
   BIDjvhYYufP8vDb/U4Si+FbOyV7IuIyL5DCQ/qP6GolKtnMEFhTZ3/rem
   ZPljOw80alCKg8nKi+2BKD4khw4PKEo28FA7x/cSw4bM/XEAr/1laZylr
   fOYTdKmw5VKNNOQ4gFKhtiNN5Cxnw7MH5OLYF3O6tTRJJgOZfCRmso5R9
   A==;
X-CSE-ConnectionGUID: ubwq/8sMT2q1zEufPancOg==
X-CSE-MsgGUID: 1c0QB6dkQc6LA2fAQf37kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24172490"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="24172490"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 22:06:33 -0700
X-CSE-ConnectionGUID: Qxzc6O2PQNenq2ZOeBau4g==
X-CSE-MsgGUID: TCa2Jf3cStGH6mDjMxSLoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="95944123"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 03 Sep 2024 22:06:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id F188C128; Wed, 04 Sep 2024 08:06:30 +0300 (EEST)
Date: Wed, 4 Sep 2024 08:06:30 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/3] pinctrl: baytrail: Replace ifdeffery by
 pm_sleep_ptr() macro
Message-ID: <20240904050630.GC1532424@black.fi.intel.com>
References: <20240903170752.3564538-1-andriy.shevchenko@linux.intel.com>
 <20240903170752.3564538-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903170752.3564538-3-andriy.shevchenko@linux.intel.com>

On Tue, Sep 03, 2024 at 08:04:50PM +0300, Andy Shevchenko wrote:
> Explicit ifdeffery is ugly and theoretically might be not synchronised
> with the rest of functions that are assigned via pm_sleep_ptr() macro.
> Replace ifdeffery by pm_sleep_ptr() macro to improve this.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index 4533c4d0a9e7..7aa0ddca7a59 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -1514,13 +1514,6 @@ static int byt_gpio_probe(struct intel_pinctrl *vg)
>  	gc->parent	= vg->dev;
>  	gc->ngpio	= vg->soc->npins;
>  
> -#ifdef CONFIG_PM_SLEEP
> -	vg->context.pads = devm_kcalloc(vg->dev, gc->ngpio, sizeof(*vg->context.pads),
> -					GFP_KERNEL);
> -	if (!vg->context.pads)
> -		return -ENOMEM;
> -#endif
> -
>  	/* set up interrupts  */
>  	irq = platform_get_irq_optional(pdev, 0);
>  	if (irq > 0) {
> @@ -1581,6 +1574,16 @@ static const struct acpi_device_id byt_gpio_acpi_match[] = {
>  	{ }
>  };
>  
> +static int byt_pinctrl_pm_init(struct intel_pinctrl *vg)
> +{
> +	vg->context.pads = devm_kcalloc(vg->dev, vg->soc->npins,
> +					sizeof(*vg->context.pads), GFP_KERNEL);
> +	if (!vg->context.pads)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
>  static int byt_pinctrl_probe(struct platform_device *pdev)
>  {
>  	const struct intel_pinctrl_soc_data *soc_data;
> @@ -1603,6 +1606,10 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	ret = pm_sleep_ptr(byt_pinctrl_pm_init) ? byt_pinctrl_pm_init(vg) : 0;

Same here.

> +	if (ret)
> +		return ret;
> +
>  	vg->pctldesc		= byt_pinctrl_desc;
>  	vg->pctldesc.name	= dev_name(dev);
>  	vg->pctldesc.pins	= vg->soc->pins;
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac

