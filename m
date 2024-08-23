Return-Path: <linux-gpio+bounces-9063-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA8995D065
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 16:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D9EF1F23252
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 14:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FDD1885AB;
	Fri, 23 Aug 2024 14:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4wZ3Uay"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C69E1DA5E;
	Fri, 23 Aug 2024 14:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724424672; cv=none; b=oPaaEQlgq9FVIkKZZ55nEWlXg0mPqAcGMtEIRnJAfr3CEXFrsuUDISa+aO8zDW0ninyQrtk039Ro9st+odWpZYFbcxJD20V9sekxtaV7wksn+rPR569oiD22jH1t8mPZz4KeySeW9DxpXFPBQQtOIP9HgV55VFQa+M2c/PXoL3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724424672; c=relaxed/simple;
	bh=2XbOOhKkWPqZCcSXIvvSuHpiha9ebAQ8MRQe2Eu+/jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVCMV7Tsd/TgXc0fde85lteiXw8TkwFFtlG96AcgFq3VxAwZPeXi13NVxoBUh/WwxkLMFM4gbhZcQ/Irqe85XGGaGF9OHCAevf7FXzFClmgMTzFGKpe1zOf/9N8GsGnooLAQxUm2r3XHG6Oi33rh5/8AiBpIL0FpsJgnkXTMg8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4wZ3Uay; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724424672; x=1755960672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2XbOOhKkWPqZCcSXIvvSuHpiha9ebAQ8MRQe2Eu+/jA=;
  b=d4wZ3Uayh9h0yMM2Mxyh/x7fxCNQAUUnQKpvkLN0qPv2Z3yo0UQf+cd1
   iCZCG/tM3NsI27hMymAfW3BIXbHg/DyzIVztnMANNUADx7FEVmvBBHeae
   y3QIsfDw0Z8d2gX4OfAV/G9415GnOWyvqlj876m3Pq/yYMjbvQNT+UE6C
   gMob2Cum4sw/ejqwQVmUNUkUtgD7d5jTrkj5coqOfuD+LXlpaLbbPW81j
   DQrpUmEXPAEtwzbBMR3K2oTWA1UlEcnLDrineNxF/Bojb45NMIVtdb3Ii
   BsCqIAF5m8tXogj9kB7pJlqUrc5Yx1V4cLi+N9u4he9LH7pUMovc/3LpB
   g==;
X-CSE-ConnectionGUID: x3Wef78tRnGpc+eE5t8ZxQ==
X-CSE-MsgGUID: KJV7moIbRsac5uQza1N7Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23021622"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="23021622"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:51:11 -0700
X-CSE-ConnectionGUID: NIMEP4FaT4ikO66N0Qq0Cg==
X-CSE-MsgGUID: /5WbCK3IRxKW1rnmuNnjLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="66634754"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:51:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shVd3-00000000pH1-0nRR;
	Fri, 23 Aug 2024 17:51:05 +0300
Date: Fri, 23 Aug 2024 17:51:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v2] gpio: rockchip: resolve underflow issue
Message-ID: <Zsih2NggJXRF6YhI@smile.fi.intel.com>
References: <20240823034314.62305-1-ye.zhang@rock-chips.com>
 <20240823034314.62305-5-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823034314.62305-5-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 11:43:07AM +0800, Ye Zhang wrote:
> div_reg may be < 0 if debounce is zero, causing the unsigned int to
> overflow.

...

> -	if (bank->gpio_type == GPIO_TYPE_V2 && !IS_ERR(bank->db_clk)) {
> -		div_debounce_support = true;

Wouldn't be cleaner (from the patch perspective) to simply move else branch here?

	else
		div_debounce_support = false;

> +	div_debounce_support = (bank->gpio_type == GPIO_TYPE_V2) && !IS_ERR(bank->db_clk);
> +	if (debounce && div_debounce_support) {
>  		freq = clk_get_rate(bank->db_clk);
>  		if (!freq)
>  			return -EINVAL;
> @@ -216,8 +216,6 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
>  
>  		div = (u64)debounce * freq;
>  		div_reg = DIV_ROUND_CLOSEST_ULL(div, 2 * USEC_PER_SEC) - 1;
> -	} else {
> -		div_debounce_support = false;
>  	}

-- 
With Best Regards,
Andy Shevchenko



