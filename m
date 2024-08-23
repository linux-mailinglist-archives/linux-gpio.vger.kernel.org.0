Return-Path: <linux-gpio+bounces-9066-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDB095D0F0
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 17:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEF792833AE
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 15:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E5B188A04;
	Fri, 23 Aug 2024 15:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0mgXezE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040CA188931;
	Fri, 23 Aug 2024 15:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724425518; cv=none; b=E+qhcFFAOhn0sCuDHANuUxgG6TIQ4FZwVf/ESL/m+C2IKfY2W72Nf8o8eeF+gaNrvjWF+wQJ/h/d5woK2N8IxxOjeO2MUr7xrzBYE1YQCQMoWOdNFt93UQRg5Vfdbdk7wh7kyB/ykExAnH4qOkJE9UxFWd0RGmjmQExrbO6dAYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724425518; c=relaxed/simple;
	bh=8HxekA/tIQ3ueiwSzfQMxkCxyPVBq2maRhM23NvBn9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcR+WF8BLqfOzD2SVF2yOWSQFQOodlVfGv5ej682hDGBcrMFfI+kLguxi/J73C4aC9Ix7Sl7SvZKsmErBtMNzfo8gaXAr69BPVYesczkNv0EEH+7w9WGdUYcL7y+3vH0Yh1HAUKXmcPc7VJTf3Bn858faMsnAd556v27S+7+ohg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0mgXezE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724425517; x=1755961517;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8HxekA/tIQ3ueiwSzfQMxkCxyPVBq2maRhM23NvBn9I=;
  b=K0mgXezEBQnzxtNPb5slg090amI60pk6bDPLAE1gBckYo788997qHZH5
   qE22nJ6YilsMxc5Uk8pgKftt7xzJ20aGnUVgCqeBRajBoQm6ey83AStzc
   cgOReiZEfh4bu9nt4XofD/hanf2k8Vc3SCwzB2iusIhFHBPONtYjEg97w
   Y7v0iUKQvxbWNvKd1Ls9b8ZuvgR/9+b8KNAdPNRrX8wsSA0/fCpIA9qdQ
   i3xe0BN8XDoh6VQQdfLX0qzXeBt8BqTU8Gk4C2RBilH3NX+Bb7Ackca0/
   3TQCDX3vymuWNaZAbwrrg9dagLn5mHZRNAcIcf2dRB1RztogjC268Hdhb
   g==;
X-CSE-ConnectionGUID: BMLkCfH+RT6CrkSSxK21Mg==
X-CSE-MsgGUID: NNqfmn2BTuG+/dpULtN6rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26767125"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="26767125"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 08:05:15 -0700
X-CSE-ConnectionGUID: Pdy/4ySgRDmc8rGncZm8qA==
X-CSE-MsgGUID: HeWWgZQGTlGdVZ7/pKQpqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="66141593"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 08:05:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shVqf-00000000pUQ-3d9q;
	Fri, 23 Aug 2024 18:05:09 +0300
Date: Fri, 23 Aug 2024 18:05:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v2] gpio: rockchip: support new version gpio
Message-ID: <ZsilJZS2_Kvyhs1S@smile.fi.intel.com>
References: <20240823034314.62305-1-ye.zhang@rock-chips.com>
 <20240823034314.62305-9-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823034314.62305-9-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 11:43:11AM +0800, Ye Zhang wrote:
> The next version gpio controller on SoCs like rk3576 which support four
> OS operation and four interrupts

...

>  #define GPIO_TYPE_V2		(0x01000C2B)  /* GPIO Version ID 0x01000C2B */
>  #define GPIO_TYPE_V2_1		(0x0101157C)  /* GPIO Version ID 0x0101157C */
> +#define GPIO_TYPE_V2_2		(0x010219C8)  /* GPIO Version ID 0x010219C8 */

These needs a bit of decoding. As far as I can decipher these it's something like

0x01 00 00 00 ???

0x00 xx 00 00 // seems like a subversion, 2.xx

0x00 00 xx xx // seems like a release which is

3115
5500
6600

in decimal representation.

But again, can you make the comments better explaining these cryptic 4-byte
values?

With that done it might be better approach to check the version of the IP.

...

> +	switch (id) {
> +	case GPIO_TYPE_V2:
> +	case GPIO_TYPE_V2_1:
>  		bank->gpio_regs = &gpio_regs_v2;
>  		bank->gpio_type = GPIO_TYPE_V2;
> -	} else {
> +		break;
> +	case GPIO_TYPE_V2_2:
> +		bank->gpio_regs = &gpio_regs_v2;
> +		bank->gpio_type = GPIO_TYPE_V2_2;
> +		break;
> +	default:
>  		bank->gpio_regs = &gpio_regs_v1;
>  		bank->gpio_type = GPIO_TYPE_V1;
> +		pr_info("Note: Use default GPIO_TYPE_V1!\n");

Missed break;

>  	}

-- 
With Best Regards,
Andy Shevchenko



