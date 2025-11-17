Return-Path: <linux-gpio+bounces-28581-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B14A4C63D26
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 12:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4AA33A3A37
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 11:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70DA2C3261;
	Mon, 17 Nov 2025 11:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzqTLbhr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBA928727C;
	Mon, 17 Nov 2025 11:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763378827; cv=none; b=JFO8Qan5Lz2bthZ7o7b3k+CpRaAu/wXDoUjkzF4e7lMwUN1EuMoGdp02iDcwwezR2hInuWKe1ZA3ve2ejPvvEZvDsw9U2brjiLSLbXrV4qPkWdX+ZXu/5Sa33yshYsgWanefPAoonVmfq94Nly1HftBM9WbBz9EvDEnnfgN2EFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763378827; c=relaxed/simple;
	bh=mcaYK4m0h/8ScPnNXnnB1zeXT/OTqKwwUB1A+Bp8iTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPLdlqQXihqOK/Yd1gJ/SThxhwHDjQs/rMkOBKVcO6VX+zGfSCkBOhdUWcyQPBlF9BaMQokZsOXVuxvs3xy7rgHsE24Z0/KnPg/qpa4iDPeGP9pPVjEGuB20TcFRGWSw1ODrA7jWnbEbn9c9GbUNiwnZ4cYwz10xl23UJov1aZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzqTLbhr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763378826; x=1794914826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mcaYK4m0h/8ScPnNXnnB1zeXT/OTqKwwUB1A+Bp8iTU=;
  b=VzqTLbhrWci2kDTjM2VEevpI922BABN/ACOReIpxC4cgGznrduU5kOMO
   /lqvQfuUwH72Sgq77T9shgh7zH4pqQ1PhlyGm5vWa3+0hoCd4FD5m0NJU
   sde98uPZ1KFxMo721/fT4EXsnPnI/b6L3YozfWP70nZHUKNjNaODG6vpe
   kaYU3AhymIh8Aj4VX/Jq/9BBkImTTKgNNWTi0xxiFNpdEfF3ALJMtdMiP
   Q+KkDgB4i6QiXaDJ6qte3RZIbuwmwEn7R59XxfeFGDuZazKiSFLHMCP0f
   8tDyc0gDzCLfIbOWquCywGm0dPnAkeUXUZJwov9NDZWoqIT94kDL5ox3p
   A==;
X-CSE-ConnectionGUID: xCPCQ7mTQ0WC8VWNYdZjag==
X-CSE-MsgGUID: Ml+baRsjTIG8xWaBM9QO/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65084967"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="65084967"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 03:27:06 -0800
X-CSE-ConnectionGUID: prcIsAyyTT+tPOiwPXo9ug==
X-CSE-MsgGUID: MoEbtUOaQG60ZQpeXTvHPA==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 17 Nov 2025 03:27:04 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 4C68C96; Mon, 17 Nov 2025 12:27:02 +0100 (CET)
Date: Mon, 17 Nov 2025 12:27:02 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/3] pinctrl: intel: Refactor
 intel_gpio_add_pin_ranges() to make it shorter
Message-ID: <20251117112702.GZ2912318@black.igk.intel.com>
References: <20251117075826.3332299-1-andriy.shevchenko@linux.intel.com>
 <20251117075826.3332299-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117075826.3332299-2-andriy.shevchenko@linux.intel.com>

On Mon, Nov 17, 2025 at 08:56:59AM +0100, Andy Shevchenko wrote:
> Refactor intel_gpio_add_pin_ranges() to make it shorter in binary
> and source formats.
> 
> Function                                     old     new   delta
> intel_gpio_add_pin_ranges                    219     215      -4
> Total: Before=15522, After=15518, chg -0.03%
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 8e067aaf3399..a8b80a24e81f 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1348,16 +1348,15 @@ static int intel_gpio_irq_init_hw(struct gpio_chip *gc)
>  static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
>  {
>  	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
> +	struct device *dev = pctrl->dev;

I prefer this keeping the reverse christmas tree.

Also it can be const.

>  	const struct intel_community *community;
>  	const struct intel_padgroup *grp;
>  	int ret;
>  
>  	for_each_intel_gpio_group(pctrl, community, grp) {
> -		ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev),
> -					     grp->gpio_base, grp->base,
> -					     grp->size);
> +		ret = gpiochip_add_pin_range(gc, dev_name(dev), grp->gpio_base, grp->base, grp->size);
>  		if (ret)
> -			return dev_err_probe(pctrl->dev, ret, "failed to add GPIO pin range\n");
> +			return dev_err_probe(dev, ret, "failed to add GPIO pin range\n");
>  	}
>  
>  	return 0;
> -- 
> 2.50.1

