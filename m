Return-Path: <linux-gpio+bounces-9324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D96296398B
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 06:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3EA51F2575C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 04:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7B97E59A;
	Thu, 29 Aug 2024 04:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izLNEnIm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF837581F;
	Thu, 29 Aug 2024 04:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724907219; cv=none; b=Q/mqIusm01+CvhFRz2PhsR/y3GicUc+y5FanmzQsvSy8j2F0vh5yxmMX0/bkK8O8YP1gi3Qdjbxq12fLOhW19/Gp5ZODERtvTpa8Vhan86vvu2oW0WJc3dHjTGN256TIfIy/cS9nMUIBIW6TxVFehfhgDYjOnDUWE0L+L6k7ZVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724907219; c=relaxed/simple;
	bh=wq7DPPLk7nngyt0hvwNuPlICbo0xw8q4UGtB8+9a2EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKF1v+mjtc5/iTB7qP1UaC3LQYeutTWXM1kxh20C2F+Pn4qnFPrHZRvUVRx/aqwIElJabadhc7Rdm847u5oBtPT+WQvwZlja5Yqx52IT9H59gTfdtKE9pnQZjstB5S8uUbnZvc0x/YnBeF2HSKv8JEerF5yfw7A6zjpNv+rTbU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izLNEnIm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724907218; x=1756443218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wq7DPPLk7nngyt0hvwNuPlICbo0xw8q4UGtB8+9a2EM=;
  b=izLNEnImRSlIaZfCl9GXRDxZtrEbBNPImLNPn7B7dCjX1wff4/iqwfY0
   drDDgLJEevHc2M6k8PnmKmu0N+szixs2gKbIG2KKijSZ5IpBGJ0T6DbEi
   tO+IoCHxu4ADcorE2lPxDpYMJBrQO1D9SO8nmG6okzWfRcaBkiiXMVbeh
   2GH8ye6eFujNULPzVEMLWW5CEOYnjSrX2pQhP4ntLMMvKlpg1JZeuLgCX
   Zq9+UECbKbqtmKr/YL4YlhSpL/MrSkM3YsHP0Nyuvg+QEWL6XKvyuqP97
   r+PrAviHGCaC+HpDc8FXt8Herg/a7LJqPGCAYbterjbzoi3bLgKj2AyYW
   w==;
X-CSE-ConnectionGUID: cOzliJMJRnCdAF2JCzO6Kw==
X-CSE-MsgGUID: QliaKqdzQ32BdgCld8OOxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23278190"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="23278190"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 21:53:38 -0700
X-CSE-ConnectionGUID: Dx4V0AnlRnqVALcYuJRMiw==
X-CSE-MsgGUID: 9OErZNxDTIuZGNzby+7/og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="68285071"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 28 Aug 2024 21:53:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id EC4FC118; Thu, 29 Aug 2024 07:53:34 +0300 (EEST)
Date: Thu, 29 Aug 2024 07:53:34 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 5/5] pinctrl: intel: Introduce
 for_each_intel_gpio_group() helper
Message-ID: <20240829045334.GT1532424@black.fi.intel.com>
References: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
 <20240828184018.3097386-6-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828184018.3097386-6-andriy.shevchenko@linux.intel.com>

On Wed, Aug 28, 2024 at 09:38:38PM +0300, Andy Shevchenko wrote:
> Introduce a helper macro for_each_intel_gpio_group().
> With that in place, update users.
> 
> It reduces the C code base as well as shrinks the binary:
> 
>   add/remove: 0/0 grow/shrink: 1/8 up/down: 37/-106 (-69)
>   Total: Before=15611, After=15542, chg -0.44%
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 89 +++++++++------------------
>  1 file changed, 29 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index ae30969b2dee..143174abda32 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -931,6 +931,15 @@ static const struct pinctrl_desc intel_pinctrl_desc = {
>  	.owner = THIS_MODULE,
>  };
>  
> +#define for_each_intel_gpio_group(pctrl, community, grp)				\
> +	for (unsigned int __i = 0;							\
> +	     __i < pctrl->ncommunities && (community = &pctrl->communities[__i]);	\
> +	     __i++)									\
> +		for (unsigned int __j = 0;						\
> +		     __j < community->ngpps && (grp = &community->gpps[__j]);		\
> +		     __j++)								\
> +			if (grp->gpio_base == INTEL_GPIO_BASE_NOMAP) {} else
> +

This looks absolutely grotesque. I hope that you can debug this still
after couple of months has passed because I cannot ;-)

I wonder if there is a way to make it more readable by adding some sort
of helpers? Or perhaps we don't need to make the whole thing as macro
and just provide helpers we can use in the otherwise open-coded callers.

>  /**
>   * intel_gpio_to_pin() - Translate from GPIO offset to pin number
>   * @pctrl: Pinctrl structure
> @@ -949,30 +958,17 @@ static int intel_gpio_to_pin(struct intel_pinctrl *pctrl, unsigned int offset,
>  			     const struct intel_community **community,
>  			     const struct intel_padgroup **padgrp)
>  {
> -	int i;
> +	const struct intel_community *c;
> +	const struct intel_padgroup *gpp;
>  
> -	for (i = 0; i < pctrl->ncommunities; i++) {
> -		const struct intel_community *comm = &pctrl->communities[i];
> -		int j;
> +	for_each_intel_gpio_group(pctrl, c, gpp) {
> +		if (offset >= gpp->gpio_base && offset < gpp->gpio_base + gpp->size) {
> +			if (community)
> +				*community = c;
> +			if (padgrp)
> +				*padgrp = gpp;
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

Because I think this open-coded one is still at least readable. Of
course if there is duplication we should try to get rid of it but not in
expense of readability IMHO.

> +			return gpp->base + offset - gpp->gpio_base;
>  		}
>  	}
>  
> @@ -1348,36 +1344,17 @@ static int intel_gpio_irq_init_hw(struct gpio_chip *gc)
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
> +	struct intel_community *community;
> +	const struct intel_padgroup *gpp;
> +	int ret;
>  
> -	for (i = 0; i < pctrl->ncommunities; i++) {
> -		struct intel_community *community = &pctrl->communities[i];
> -
> -		ret = intel_gpio_add_community_ranges(pctrl, community);
> +	for_each_intel_gpio_group(pctrl, community, gpp) {
> +		ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev),
> +					     gpp->gpio_base, gpp->base,
> +					     gpp->size);
>  		if (ret) {
>  			dev_err(pctrl->dev, "failed to add GPIO pin range\n");
>  			return ret;
> @@ -1390,20 +1367,12 @@ static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
>  static unsigned int intel_gpio_ngpio(const struct intel_pinctrl *pctrl)
>  {
>  	const struct intel_community *community;
> +	const struct intel_padgroup *gpp;
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
> +	for_each_intel_gpio_group(pctrl, community, gpp) {
> +		if (gpp->gpio_base + gpp->size > ngpio)
> +			ngpio = gpp->gpio_base + gpp->size;
>  	}
>  
>  	return ngpio;
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac

