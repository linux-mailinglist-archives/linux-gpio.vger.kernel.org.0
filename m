Return-Path: <linux-gpio+bounces-9675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C63296A35C
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 17:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A3A62824CA
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 15:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFDC188921;
	Tue,  3 Sep 2024 15:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HmnMCrzN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3897C1DA3D;
	Tue,  3 Sep 2024 15:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725378809; cv=none; b=iAEcDCDWcJzkLYR9Co1hXFbnp4VMuSPBKEa/xxvxKpkwNWG1h/dntrCN9jlfUfTaYl+wU8i1UnsJImsbAX7J+cwQNjIoPKxUaxDtj+OViY9f/jFo+Vu00RInJgFXQsD65YNrmBG1mrre5E6DcF9N6eUYMaMb+BQKYB3DC66vKWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725378809; c=relaxed/simple;
	bh=4zLPYlOz3SmkFEgQEXONt+k9D+7ivOmLVWbo2jhWKiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bwl7ZdpNmv3iuSPHLFv1Utq5/yr4OhDxdoi/HfGM+QwOgyQ6ovana5V8WTzYV19535NhHJGToagPpToslar/ff0l0sL5QvnOLG1ZdGoNT5JZudcOGqtCzDdtuJIEZhzkKDlx+Lbar5o49H/WLE0RcsMTg98xnAGwHFvjjYSbsVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HmnMCrzN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725378808; x=1756914808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4zLPYlOz3SmkFEgQEXONt+k9D+7ivOmLVWbo2jhWKiA=;
  b=HmnMCrzNE112x8APFbahWo/ujaCIK9D60o3MaoAKR7IRqnq0OIdj8vWR
   6EpU5cdFbsdsL1zzcmrtFBItp8skFnrxkSmpdj3KudOck7hnX3hxqgDvt
   xVtxxXJz3cyCa7D6MKL6M+r0+TodA+Zjv3QdOgky4w7rfwD3MtEdlPCTe
   veT3V2olNAc3wD8+MDkkgBPVy0SJ1E60jmh2B/DHPYBEml91ZgnGPpRGX
   b4KnmsrQIfGTDi7U5qyNixaW+S28dm5v0USJVU08Z6e47E/py5bcbgGoF
   r1hn2cDbQOBCqZ/JTBcz7sX1mAUNLvZD+TcFkSULldyyE/v5rU3x9yYH6
   w==;
X-CSE-ConnectionGUID: c3pwrCI0R3qBxKAZSFar+g==
X-CSE-MsgGUID: vhFVfl6eTYCW9xMd3QLP1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34597550"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="34597550"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 08:53:27 -0700
X-CSE-ConnectionGUID: Tky17SirTAi1swVxu6r4cA==
X-CSE-MsgGUID: 3Sbh+5ppRvi2X3wDrJQbsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69104664"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 08:53:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slVqL-00000004l8R-2IOs;
	Tue, 03 Sep 2024 18:53:21 +0300
Date: Tue, 3 Sep 2024 18:53:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v3 01/12] gpio: rockchip: avoid division by zero
Message-ID: <Ztcw4wVHsQkYkjhr@smile.fi.intel.com>
References: <20240903073649.237362-1-ye.zhang@rock-chips.com>
 <20240903073649.237362-2-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903073649.237362-2-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 03, 2024 at 03:36:38PM +0800, Ye Zhang wrote:
> If the clk_get_rate return '0', it will happen division by zero.

I don't understand the circumstances when it may happen.

> Fixes: 3bcbd1a85b68 ("gpio/rockchip: support next version gpio controller")

Not sure that this actually fixes anything. See below why I think so.

...

>  	if (bank->gpio_type == GPIO_TYPE_V2 && !IS_ERR(bank->db_clk)) {

Here you explicitly checked that the clock is provided by DT.

...

>  		freq = clk_get_rate(bank->db_clk);

Here you read the frequency which may be 0 in two cases:
1) in DT explicitly set to 0;
2) CCF is disabled.

So, wrong DTs have to be validated / fixed beforehand, correct?

But if the CCF is disabled, the db_clk is NULL. Moreover I don't see
how the db_clk may contain error pointer as you have it filtered out
at _get_bank_data(). So, maybe what you need is to have NULL check
in the conditional and explaining more in the commit message why it
is currently a problematic code?

> +		if (!freq)
> +			return -EINVAL;

-- 
With Best Regards,
Andy Shevchenko



