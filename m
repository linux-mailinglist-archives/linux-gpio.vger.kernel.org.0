Return-Path: <linux-gpio+bounces-9321-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDC6963978
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 06:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F6C0284EA7
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 04:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F6112F399;
	Thu, 29 Aug 2024 04:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESW1iQoe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B7C1C6A5;
	Thu, 29 Aug 2024 04:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724906820; cv=none; b=tRVd57ixy4z2PFjPwIqtdlX4qL2S+JCHZMA0uOBlmqSgW760GC2fq8lwLtjUMxnVrpIucdYzknMX63Aw/YYEPCm0cTnVpb+KURuAoHafMToi10wJ+d5jw5uTKG2D0gE4IxdSKmxUr9doPZ6OcTouTHrpfD61S2NXxOcH084XSuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724906820; c=relaxed/simple;
	bh=5sWYPQy7sEAZSI9ZuRk1mgK23u8xpfpeSeDYU9LitWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e66Eyu5TnUBVyMwFngA+dw9tCMK0YCKFVw1wFnFQh/8n0IwjkHI2hqQNNHRDO+dg9U9pgh9HUlOgH8gBFVHudFxmqpHVhThysgWKN9HY1gO1YW57j/xSSh8BQKBBQwTXCaKsFkUNSxv/HJodPdpf8GOwJl1EVDyu62nFJXZ68yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESW1iQoe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724906818; x=1756442818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5sWYPQy7sEAZSI9ZuRk1mgK23u8xpfpeSeDYU9LitWc=;
  b=ESW1iQoeC7L32p/ba3z+4eK/lkW9xE5/IrGRCyG21hzG/6waCdGFn3a1
   dEz9F1arGWzj2xoXQvxhDFm5rQl8FpwO2bt8coaFhZ8EQObXOYbGwXlCh
   BZSMcyK1GblSp07lrFmd44ZuVW58ve8Kpdqm7cdTFAdUV9wGHiRGtgV3Y
   1UuG3LcWNuNcokvAwOwv1vRAIonkYzPe/G6yPdsVHie4gwqOUknvARkAa
   Qb3wzJs7iRCB/9Xre6mXmR7QulelKPU2ANfsRZ8+4dQ5HoP6WfeV6seKG
   wdL9lgP9nTMg6lG1DRF9q7HmTS4vMbpmOuf0majMkzhCpgfkLYnmHWh4n
   A==;
X-CSE-ConnectionGUID: FAyIxdIPTvahyWjo9um3Hw==
X-CSE-MsgGUID: u6qfPsT6RWKjHeZQFrVoVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34632546"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="34632546"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 21:46:57 -0700
X-CSE-ConnectionGUID: DfmaGlAlSrqrCFoNJwVcYw==
X-CSE-MsgGUID: u+zwJInJSManvHchCcWbYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="94257077"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 28 Aug 2024 21:46:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id F220E118; Thu, 29 Aug 2024 07:46:53 +0300 (EEST)
Date: Thu, 29 Aug 2024 07:46:53 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 3/5] pinctrl: intel: Add __intel_gpio_get_direction()
 helper
Message-ID: <20240829044653.GR1532424@black.fi.intel.com>
References: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
 <20240828184018.3097386-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828184018.3097386-4-andriy.shevchenko@linux.intel.com>

On Wed, Aug 28, 2024 at 09:38:36PM +0300, Andy Shevchenko wrote:
> Add __intel_gpio_get_direction() helper which provides all possible
> physical states of the pad.
> 
> With that done, update current users and make the respective checks
> consistent.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 48 ++++++++++++++++++++++++---
>  1 file changed, 43 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 2a3d44f35348..3a135cfe435f 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -70,6 +70,12 @@
>  #define PADCFG0_PMODE_SHIFT		10
>  #define PADCFG0_PMODE_MASK		GENMASK(13, 10)
>  #define PADCFG0_PMODE_GPIO		0
> +#define PADCFG0_GPIODIS_SHIFT		8
> +#define PADCFG0_GPIODIS_MASK		GENMASK(9, 8)
> +#define PADCFG0_GPIODIS_NONE		0
> +#define PADCFG0_GPIODIS_OUTPUT		1
> +#define PADCFG0_GPIODIS_INPUT		2
> +#define PADCFG0_GPIODIS_FULL		3
>  #define PADCFG0_GPIORXDIS		BIT(9)
>  #define PADCFG0_GPIOTXDIS		BIT(8)
>  #define PADCFG0_GPIORXSTATE		BIT(1)
> @@ -429,6 +435,37 @@ static int intel_pinmux_set_mux(struct pinctrl_dev *pctldev,
>  	return 0;
>  }
>  
> +/**
> + * enum - possible pad physical configurations
> + *

Start with capital letter as others:

enum - Possible..

Also I think we should follow the structs and drop the empty line here
(well and for other enums, I don't know how they got there ;-) but it
looks better without.

Other than this, looks good to me.

> + * @PAD_CONNECT_NONE:	pad is fully disconnected
> + * @PAD_CONNECT_INPUT:	pad is in input only mode
> + * @PAD_CONNECT_OUTPUT:	pad is in output only mode
> + * @PAD_CONNECT_FULL:	pad is fully connected
> + */
> +enum {
> +	PAD_CONNECT_NONE	= 0,
> +	PAD_CONNECT_INPUT	= 1,
> +	PAD_CONNECT_OUTPUT	= 2,
> +	PAD_CONNECT_FULL	= PAD_CONNECT_INPUT | PAD_CONNECT_OUTPUT,
> +};
> +
> +static int __intel_gpio_get_direction(u32 value)
> +{
> +	switch ((value & PADCFG0_GPIODIS_MASK) >> PADCFG0_GPIODIS_SHIFT) {
> +	case PADCFG0_GPIODIS_FULL:
> +		return PAD_CONNECT_NONE;
> +	case PADCFG0_GPIODIS_OUTPUT:
> +		return PAD_CONNECT_INPUT;
> +	case PADCFG0_GPIODIS_INPUT:
> +		return PAD_CONNECT_OUTPUT;
> +	case PADCFG0_GPIODIS_NONE:
> +		return PAD_CONNECT_FULL;
> +	default:
> +		return PAD_CONNECT_FULL;
> +	};
> +}
> +
>  static u32 __intel_gpio_set_direction(u32 value, bool input, bool output)
>  {
>  	if (input)
> @@ -937,7 +974,7 @@ static int intel_gpio_get(struct gpio_chip *chip, unsigned int offset)
>  		return -EINVAL;
>  
>  	padcfg0 = readl(reg);
> -	if (!(padcfg0 & PADCFG0_GPIOTXDIS))
> +	if (__intel_gpio_get_direction(padcfg0) & PAD_CONNECT_OUTPUT)
>  		return !!(padcfg0 & PADCFG0_GPIOTXSTATE);
>  
>  	return !!(padcfg0 & PADCFG0_GPIORXSTATE);
> @@ -990,10 +1027,10 @@ static int intel_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
>  	if (padcfg0 & PADCFG0_PMODE_MASK)
>  		return -EINVAL;
>  
> -	if (padcfg0 & PADCFG0_GPIOTXDIS)
> -		return GPIO_LINE_DIRECTION_IN;
> +	if (__intel_gpio_get_direction(padcfg0) & PAD_CONNECT_OUTPUT)
> +		return GPIO_LINE_DIRECTION_OUT;
>  
> -	return GPIO_LINE_DIRECTION_OUT;
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>  
>  static int intel_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
> @@ -1690,7 +1727,8 @@ EXPORT_SYMBOL_NS_GPL(intel_pinctrl_get_soc_data, PINCTRL_INTEL);
>  
>  static bool __intel_gpio_is_direct_irq(u32 value)
>  {
> -	return (value & PADCFG0_GPIROUTIOXAPIC) && (value & PADCFG0_GPIOTXDIS) &&
> +	return (value & PADCFG0_GPIROUTIOXAPIC) &&
> +	       (__intel_gpio_get_direction(value) == PAD_CONNECT_INPUT) &&
>  	       (__intel_gpio_get_gpio_mode(value) == PADCFG0_PMODE_GPIO);
>  }
>  
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac

