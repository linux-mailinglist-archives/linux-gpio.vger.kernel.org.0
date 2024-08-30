Return-Path: <linux-gpio+bounces-9419-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D8396568E
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 06:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65FA31C22C72
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 04:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3934D136327;
	Fri, 30 Aug 2024 04:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="enQVekBa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE5F1D1308;
	Fri, 30 Aug 2024 04:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724993445; cv=none; b=qKdJQ0IGok1+TpSuu1i238bnWPNk2gE+lV82Viyn17kzov0MMpfiYBNywQc4csdwnGvvAJswr5BkVFjZpOdppdeWXuYowJYFvfO9jWvOFyD+D2KLBcVP3pyzIacXID6YMrYcT6r5/6+rqoxkYqW1KXP/JjkeWHKD1Wa2mpx1iIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724993445; c=relaxed/simple;
	bh=Ihnlsw267bzJ+EP52khp0GkOm7bVOKPPqD11oLSh4DM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNuR4XyvSXdC+AlbiJFuQkYujiPrh58Y0qQM3LCHM+A+C1j/6sLGHblAYTEbcIsvpU0ejFSpsnXUN1AQHbFgR8RjBkg2oRHf7uJnGn5yb1birkgVCRSX8k8dvS9dcZyWbvHrCbQ7XyI9/IYSmNgRBwHxmFcUvXylk5FOTObeVpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=enQVekBa; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724993443; x=1756529443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ihnlsw267bzJ+EP52khp0GkOm7bVOKPPqD11oLSh4DM=;
  b=enQVekBam4qCuhjzNSuEXwhOrueE/JwUAi8jzS0uDvaiLR/IGwa0s0AI
   u7pYxggzy7FbTJtq2wBK+xMn4LEWLnK9TCInQROFfmL9QYE0IJiXOwhZG
   CJj9dMFQyrxDOJ+NsYlKu6Q8ij1UnMs0jf5NayfCju6p6kSb+cN5SrzDU
   nULHklJK3UiyX6r+cUpn+UPc+wLEHVi1ieR/wKReg8mk061z7ON5waq9E
   mk8OKY9eqADBxOomup4SazURyeueb0987qAal699sHz0VpbV/6Tb82jWs
   MsAaSP/DO1E9HywVwURLGy0psvfg7cvj6HZ6v+vEZvbYCO8QK1HrU7edG
   g==;
X-CSE-ConnectionGUID: VezJXZneSaiJeqT2OtRYIQ==
X-CSE-MsgGUID: qFXNHdAXQbq9BGLdn50znw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23808180"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="23808180"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 21:50:43 -0700
X-CSE-ConnectionGUID: nWaU11vHRmi6iASXzgpMLQ==
X-CSE-MsgGUID: 7RwYCFWiQ9ywVpQIlLZDDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="94529492"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 29 Aug 2024 21:50:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 8FBB0142; Fri, 30 Aug 2024 07:50:39 +0300 (EEST)
Date: Fri, 30 Aug 2024 07:50:39 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 6/6] pinctrl: intel: Introduce
 for_each_intel_gpio_group() helper et al.
Message-ID: <20240830045039.GU1532424@black.fi.intel.com>
References: <20240829140406.357612-1-andriy.shevchenko@linux.intel.com>
 <20240829140406.357612-7-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240829140406.357612-7-andriy.shevchenko@linux.intel.com>

On Thu, Aug 29, 2024 at 04:59:20PM +0300, Andy Shevchenko wrote:
> Introduce a helper macro for_each_intel_gpio_group() et al.
> With those in place, update the users.
> 
> It reduces the C code base as well as shrinks the binary:
> 
>   add/remove: 0/0 grow/shrink: 4/21 up/down: 39/-621 (-582)
>   Total: Before=15942, After=15360, chg -3.65%
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 125 ++++++++++----------------
>  1 file changed, 46 insertions(+), 79 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index e8dbaf3964dc..75201d5c52a1 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -114,13 +114,16 @@ struct intel_community_context {
>  #define pin_to_padno(c, p)	((p) - (c)->pin_base)
>  #define padgroup_offset(g, p)	((p) - (g)->base)
>  
> +#define for_each_intel_pin_community(pctrl, community)					\
> +	for (unsigned int __ci = 0;							\
> +	     __ci < pctrl->ncommunities && (community = &pctrl->communities[__ci]);	\
> +	     __ci++)									\
> +

These look more readable, thanks. Just one comment. Can you move all
them here at the top of the file so all the variants are close to each
other? You can do that while applying.

>  const struct intel_community *intel_get_community(struct intel_pinctrl *pctrl, unsigned int pin)
>  {
>  	const struct intel_community *community;
> -	int i;
>  
> -	for (i = 0; i < pctrl->ncommunities; i++) {
> -		community = &pctrl->communities[i];
> +	for_each_intel_pin_community(pctrl, community) {
>  		if (pin >= community->pin_base &&
>  		    pin < community->pin_base + community->npins)
>  			return community;
> @@ -131,15 +134,18 @@ const struct intel_community *intel_get_community(struct intel_pinctrl *pctrl, u
>  }
>  EXPORT_SYMBOL_NS_GPL(intel_get_community, PINCTRL_INTEL);
>  
> +#define for_each_intel_community_pad_group(community, grp)			\
> +	for (unsigned int __gi = 0;						\
> +	     __gi < community->ngpps && (grp = &community->gpps[__gi]);		\
> +	     __gi++)								\
> +
>  static const struct intel_padgroup *
>  intel_community_get_padgroup(const struct intel_community *community,
>  			     unsigned int pin)
>  {
> -	int i;
> -
> -	for (i = 0; i < community->ngpps; i++) {
> -		const struct intel_padgroup *padgrp = &community->gpps[i];
> +	const struct intel_padgroup *padgrp;
>  
> +	for_each_intel_community_pad_group(community, padgrp) {
>  		if (pin >= padgrp->base && pin < padgrp->base + padgrp->size)
>  			return padgrp;
>  	}
> @@ -924,6 +930,14 @@ static const struct pinctrl_desc intel_pinctrl_desc = {
>  	.owner = THIS_MODULE,
>  };
>  
> +#define for_each_intel_pad_group(pctrl, community, grp)			\
> +	for_each_intel_pin_community(pctrl, community)			\
> +		for_each_intel_community_pad_group(community, grp)
> +
> +#define for_each_intel_gpio_group(pctrl, community, grp)		\
> +	for_each_intel_pad_group(pctrl, community, grp)			\
> +		if (grp->gpio_base == INTEL_GPIO_BASE_NOMAP) {} else
> +
>  /**
>   * intel_gpio_to_pin() - Translate from GPIO offset to pin number
>   * @pctrl: Pinctrl structure
> @@ -942,30 +956,17 @@ static int intel_gpio_to_pin(struct intel_pinctrl *pctrl, unsigned int offset,
>  			     const struct intel_community **community,
>  			     const struct intel_padgroup **padgrp)
>  {
> -	int i;
> +	const struct intel_community *comm;
> +	const struct intel_padgroup *grp;
>  
> -	for (i = 0; i < pctrl->ncommunities; i++) {
> -		const struct intel_community *comm = &pctrl->communities[i];
> -		int j;
> +	for_each_intel_gpio_group(pctrl, comm, grp) {
> +		if (offset >= grp->gpio_base && offset < grp->gpio_base + grp->size) {
> +			if (community)
> +				*community = comm;
> +			if (padgrp)
> +				*padgrp = grp;
>  
> -		for (j = 0; j < comm->ngpps; j++) {
> -			const struct intel_padgroup *pgrp = &comm->gpps[j];
> -
> -			if (pgrp->gpio_base == INTEL_GPIO_BASE_NOMAP)
> -				continue;
> -
> -			if (offset >= pgrp->gpio_base &&
> -			    offset < pgrp->gpio_base + pgrp->size) {
> -				int pin;
> -
> -				pin = pgrp->base + offset - pgrp->gpio_base;
> -				if (community)
> -					*community = comm;
> -				if (padgrp)
> -					*padgrp = pgrp;
> -
> -				return pin;
> -			}
> +			return grp->base + offset - grp->gpio_base;
>  		}
>  	}
>  
> @@ -1258,12 +1259,11 @@ static const struct irq_chip intel_gpio_irq_chip = {
>  static int intel_gpio_community_irq_handler(struct intel_pinctrl *pctrl,
>  					    const struct intel_community *community)
>  {
> +	const struct intel_padgroup *padgrp;
>  	struct gpio_chip *gc = &pctrl->chip;
> -	unsigned int gpp;
>  	int ret = 0;
>  
> -	for (gpp = 0; gpp < community->ngpps; gpp++) {
> -		const struct intel_padgroup *padgrp = &community->gpps[gpp];
> +	for_each_intel_community_pad_group(community, padgrp) {
>  		unsigned long pending, enabled;
>  		unsigned int gpp, gpp_offset;
>  		void __iomem *reg, *is;
> @@ -1294,29 +1294,23 @@ static irqreturn_t intel_gpio_irq(int irq, void *data)
>  {
>  	const struct intel_community *community;
>  	struct intel_pinctrl *pctrl = data;
> -	unsigned int i;
>  	int ret = 0;
>  
>  	/* Need to check all communities for pending interrupts */
> -	for (i = 0; i < pctrl->ncommunities; i++) {
> -		community = &pctrl->communities[i];
> +	for_each_intel_pin_community(pctrl, community)
>  		ret += intel_gpio_community_irq_handler(pctrl, community);
> -	}
>  
>  	return IRQ_RETVAL(ret);
>  }
>  
>  static void intel_gpio_irq_init(struct intel_pinctrl *pctrl)
>  {
> -	int i;
> +	const struct intel_community *community;
>  
> -	for (i = 0; i < pctrl->ncommunities; i++) {
> -		const struct intel_community *community;
> +	for_each_intel_pin_community(pctrl, community) {
>  		void __iomem *reg, *is;
>  		unsigned int gpp;
>  
> -		community = &pctrl->communities[i];
> -
>  		for (gpp = 0; gpp < community->ngpps; gpp++) {
>  			reg = community->regs + community->ie_offset + gpp * 4;
>  			is = community->regs + community->is_offset + gpp * 4;
> @@ -1341,36 +1335,17 @@ static int intel_gpio_irq_init_hw(struct gpio_chip *gc)
>  	return 0;
>  }
>  
> -static int intel_gpio_add_community_ranges(struct intel_pinctrl *pctrl,
> -				const struct intel_community *community)
> -{
> -	int ret = 0, i;
> -
> -	for (i = 0; i < community->ngpps; i++) {
> -		const struct intel_padgroup *gpp = &community->gpps[i];
> -
> -		if (gpp->gpio_base == INTEL_GPIO_BASE_NOMAP)
> -			continue;
> -
> -		ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev),
> -					     gpp->gpio_base, gpp->base,
> -					     gpp->size);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return ret;
> -}
> -
>  static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
>  {
>  	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
> -	int ret, i;
> +	const struct intel_community *community;
> +	const struct intel_padgroup *grp;
> +	int ret;
>  
> -	for (i = 0; i < pctrl->ncommunities; i++) {
> -		const struct intel_community *community = &pctrl->communities[i];
> -
> -		ret = intel_gpio_add_community_ranges(pctrl, community);
> +	for_each_intel_gpio_group(pctrl, community, grp) {
> +		ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev),
> +					     grp->gpio_base, grp->base,
> +					     grp->size);
>  		if (ret) {
>  			dev_err(pctrl->dev, "failed to add GPIO pin range\n");
>  			return ret;
> @@ -1383,20 +1358,12 @@ static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
>  static unsigned int intel_gpio_ngpio(const struct intel_pinctrl *pctrl)
>  {
>  	const struct intel_community *community;
> +	const struct intel_padgroup *grp;
>  	unsigned int ngpio = 0;
> -	int i, j;
>  
> -	for (i = 0; i < pctrl->ncommunities; i++) {
> -		community = &pctrl->communities[i];
> -		for (j = 0; j < community->ngpps; j++) {
> -			const struct intel_padgroup *gpp = &community->gpps[j];
> -
> -			if (gpp->gpio_base == INTEL_GPIO_BASE_NOMAP)
> -				continue;
> -
> -			if (gpp->gpio_base + gpp->size > ngpio)
> -				ngpio = gpp->gpio_base + gpp->size;
> -		}
> +	for_each_intel_gpio_group(pctrl, community, grp) {
> +		if (grp->gpio_base + grp->size > ngpio)
> +			ngpio = grp->gpio_base + grp->size;
>  	}
>  
>  	return ngpio;
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac

