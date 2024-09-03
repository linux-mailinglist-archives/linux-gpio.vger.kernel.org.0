Return-Path: <linux-gpio+bounces-9677-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7852296A374
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 17:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB5E41C23A90
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 15:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A7A189508;
	Tue,  3 Sep 2024 15:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PH197dF8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B12188900;
	Tue,  3 Sep 2024 15:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725379150; cv=none; b=kd5l7UHbaq7+vg/5fKStioB04CilHTQ1U2yC++jY8Fsrq6gJKBumwjP0tk0gjCvG28TEgc/fhuawNF8FKh4HNRDK77mbAcBoHhoTPMSSRghpqIeOV/xdCn3ud8I2ctVLM7to9SwoCOyjTPkmtYrsBMEVpBQB6EVvU/hoV1Rd7YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725379150; c=relaxed/simple;
	bh=vOK+++yJ0RJTyLTSn/NI8o5s2jAK0dW4Rm5HGwb5yNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrCtx2OAbaCmdupTSjCgJv6E7CfqEUUevEGjvVYldSFBDfa6+2nl1suKTWg/pwuvpym9d1Y7homzlvFsuebRJqV2DdIM1CVHodcz/X8GNg2XzoEn8oI2YWx6SxPfuqmKtclVIfUEBrNPUjQlVyggsZmZOei3HTHlb4f0tym51Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PH197dF8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725379148; x=1756915148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vOK+++yJ0RJTyLTSn/NI8o5s2jAK0dW4Rm5HGwb5yNs=;
  b=PH197dF8paZFFvLzNzaK4DNFpF0AEUv2DzgAHGVBcEGhdQfIyYtYIE/v
   SpmRqNNniO98lCRkCZn7a7YYpNfA0sYjxr/B5dZPDV67bHz8uX1crDjva
   5KZAiJ9aTuzFjglwqr0e+yjCeyHASI+KXrkiLqK1Y+NiwfjMQ9z18ysHC
   ufrLKclvmRoYMCDDzaHJlExbznAD1350YJn6o/cJKMiUkTdgsANU846DT
   Fh8D1klysWETjuhCnQL9HV8mNuuK8H0pu0ZpLpAnBzBW1y/Ovu28M4tzC
   gr/tt2lDE0NMGYPzt86Z3tIu527itzc/fKjQzljtWjEh4DUMwiyw5+ZxH
   w==;
X-CSE-ConnectionGUID: F1kfVwZCSuiD6rtdDR+RZQ==
X-CSE-MsgGUID: e5SVU3Y3RsG0/+/3IuOW7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="46515112"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="46515112"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 08:59:07 -0700
X-CSE-ConnectionGUID: YriTU1rPSySkmJHW3m32YA==
X-CSE-MsgGUID: tEJqILLiSGiurvUXY69HeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69757154"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 08:59:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slVvp-00000004lGb-0yhf;
	Tue, 03 Sep 2024 18:59:01 +0300
Date: Tue, 3 Sep 2024 18:59:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v3 07/12] gpio: rockchip: support 'clock-names' from dt
 nodes
Message-ID: <ZtcyRD3u_C-a27MF@smile.fi.intel.com>
References: <20240903073649.237362-1-ye.zhang@rock-chips.com>
 <20240903073649.237362-8-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903073649.237362-8-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 03, 2024 at 03:36:44PM +0800, Ye Zhang wrote:
> Added support for retrieving clocks using 'clock-names' from dt nodes

...

> +	bank->clk = devm_clk_get_enabled(dev, "bus");

I would use _optional() variant.

> +	if (IS_ERR(bank->clk)) {
> +		bank->clk = of_clk_get(dev->of_node, 0);
> +		if (IS_ERR(bank->clk)) {
> +			dev_err(dev, "fail to get apb clock\n");
> +			return PTR_ERR(bank->clk);
> +		}

> +		clk_prepare_enable(bank->clk);

Why? How was it tested?

> +		bank->manual_clk_release = true;
> +	}

It seems you need to unnest the conditionals and think through the logic.

> +	bank->db_clk = devm_clk_get_enabled(dev, "db");
> +	if (IS_ERR(bank->db_clk)) {
> +		bank->db_clk = of_clk_get(dev->of_node, 1);
> +		if (IS_ERR(bank->db_clk)) {
> +			bank->db_clk = NULL;
> +		} else {
> +			clk_prepare_enable(bank->db_clk);

Ditto.

> +			bank->manual_dbclk_release = true;
> +		}
> +	}

...

>  	ret = rockchip_get_bank_data(bank);
>  	if (ret)
> -		return ret;
> +		goto err_disabled_clk;

No, just make sure it's properly wrapped by devm.

...

> +	bool				manual_clk_release;
> +	bool				manual_dbclk_release;

Why do you need them?

-- 
With Best Regards,
Andy Shevchenko



