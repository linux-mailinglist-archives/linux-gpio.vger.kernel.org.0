Return-Path: <linux-gpio+bounces-9322-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 041F896397A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 06:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A10AD283685
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 04:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8E482D94;
	Thu, 29 Aug 2024 04:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OywprU2j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40791C6A5;
	Thu, 29 Aug 2024 04:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724906904; cv=none; b=SMigwM8WxdeCTAlaxSAa7GmtVcyG3Z3jcZCS+LV5JPx6wqx2y7avn0WAXn4nnSXcIK+sjdi1U+z3Juh3IT6TZ/lYSOm0U3z8PjBwNB/nsogb+91n3YEJCGU8ujuyzMfO6Ngjw4iNwwAb63DuEg2YCFTUQyaMr4NEPfCi6vhC2ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724906904; c=relaxed/simple;
	bh=weceMGYeHFR3IGSSh5MHczayXkO4K73v6X0rVjFnhA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvLrczky81TyKIOqS8MaGAYhVFqDRwzPH4+SoxXoiXtm7WQnnMVtI6dO6oGClU4Pec0nFbTDLsEipHNY0MN7Kw8Y5mNIIq8+G/Cv0G07yfesR2WT8TLz+/La6BRbJk2EPNguZ+AJrCEkBXuFjzRhvXskQJhubfWpBhAv3Or+Tck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OywprU2j; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724906903; x=1756442903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=weceMGYeHFR3IGSSh5MHczayXkO4K73v6X0rVjFnhA8=;
  b=OywprU2jbWQ3KXfBSr+GbOaymHUWAdz/hMv90LUMCjOY1JMLWs+srpvo
   a0yqaoaZ1I0SpgvaYOjKRy4oQim9Fb8W5tVVNt0RqE/jLRK/bHdh+gaaL
   +8663e1CQlmGbiVLCDTu2f7+H8Y73FJoMEGWaB8JHvoKlRUdAP+AwUuXP
   fQtoJOghU9iQhoQxu8xdUsGTJFeel6/TcX+NMz9J/9fIiZF3uegOt8EGq
   FbebuE8mif27ZRVi+gjstv9BWs2QMbRaOsvisWU7QgBobBIWVI2GuaCNP
   R62OROSkJ09kVk8nKCHe1ma7OmSDNlQ26OMGnc9RE6p5fd4Lzhz/dzPmD
   g==;
X-CSE-ConnectionGUID: 0ufiJBdEQVulKNb+0sf7/g==
X-CSE-MsgGUID: 7Vl8IyuRTQuBBzMDm/gpbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23431701"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="23431701"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 21:48:23 -0700
X-CSE-ConnectionGUID: Js1oZAdvTuquBRkON+WO/Q==
X-CSE-MsgGUID: ToMSEdMEQWi3PKOkQmmEeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="100969294"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 28 Aug 2024 21:48:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C42F7118; Thu, 29 Aug 2024 07:48:19 +0300 (EEST)
Date: Thu, 29 Aug 2024 07:48:19 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 4/5] pinctrl: intel: Implement high impedance support
Message-ID: <20240829044819.GS1532424@black.fi.intel.com>
References: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
 <20240828184018.3097386-5-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828184018.3097386-5-andriy.shevchenko@linux.intel.com>

On Wed, Aug 28, 2024 at 09:38:37PM +0300, Andy Shevchenko wrote:
> Implement high impedance support for Intel pin control hardware.
> It allows to set high impedance and check it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 46 +++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 3a135cfe435f..ae30969b2dee 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -78,6 +78,7 @@
>  #define PADCFG0_GPIODIS_FULL		3
>  #define PADCFG0_GPIORXDIS		BIT(9)
>  #define PADCFG0_GPIOTXDIS		BIT(8)
> +#define PADCFG0_GPIODIS			(BIT(9) | BIT(8))
>  #define PADCFG0_GPIORXSTATE		BIT(1)
>  #define PADCFG0_GPIOTXSTATE		BIT(0)
>  
> @@ -654,6 +655,23 @@ static int intel_config_get_pull(struct intel_pinctrl *pctrl, unsigned int pin,
>  	return 0;
>  }
>  
> +static int intel_config_get_high_impedance(struct intel_pinctrl *pctrl, unsigned int pin,
> +					   enum pin_config_param param, u32 *arg)
> +{
> +	void __iomem *padcfg0;
> +	u32 value;
> +
> +	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
> +
> +	scoped_guard(raw_spinlock_irqsave, &pctrl->lock)
> +		value = readl(padcfg0);
> +
> +	if (__intel_gpio_get_direction(value) != PAD_CONNECT_NONE)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>  static int intel_config_get_debounce(struct intel_pinctrl *pctrl, unsigned int pin,
>  				     enum pin_config_param param, u32 *arg)
>  {
> @@ -697,6 +715,12 @@ static int intel_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
>  			return ret;
>  		break;
>  
> +	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
> +		ret = intel_config_get_high_impedance(pctrl, pin, param, &arg);
> +		if (ret)
> +			return ret;
> +		break;
> +
>  	case PIN_CONFIG_INPUT_DEBOUNCE:
>  		ret = intel_config_get_debounce(pctrl, pin, param, &arg);
>  		if (ret)
> @@ -795,6 +819,22 @@ static int intel_config_set_pull(struct intel_pinctrl *pctrl, unsigned int pin,
>  	return 0;
>  }
>  
> +static int intel_gpio_set_high_impedance(struct intel_pinctrl *pctrl, unsigned int pin)
> +{
> +	void __iomem *padcfg0;
> +	u32 value;
> +
> +	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
> +
> +	guard(raw_spinlock_irqsave)(&pctrl->lock);
> +
> +	value = readl(padcfg0);
> +	value = __intel_gpio_set_direction(value, false, false);
> +	writel(value, padcfg0);
> +
> +	return 0;

Why not make this return void?

> +}
> +
>  static int intel_config_set_debounce(struct intel_pinctrl *pctrl,
>  				     unsigned int pin, unsigned int debounce)
>  {
> @@ -857,6 +897,12 @@ static int intel_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
>  				return ret;
>  			break;
>  
> +		case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
> +			ret = intel_gpio_set_high_impedance(pctrl, pin);
> +			if (ret)
> +				return ret;

Then this becomes simpler too.

> +			break;
> +
>  		case PIN_CONFIG_INPUT_DEBOUNCE:
>  			ret = intel_config_set_debounce(pctrl, pin,
>  				pinconf_to_config_argument(configs[i]));
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac

