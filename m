Return-Path: <linux-gpio+bounces-9064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B00D95D078
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 16:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D4C61C21B61
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 14:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49DE1885AB;
	Fri, 23 Aug 2024 14:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QzyL/p7M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317E71CD3D;
	Fri, 23 Aug 2024 14:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724425000; cv=none; b=mSnEiYH165sv4Jnfpc/dyLP/u108tiWdYDPZ2HHZL7cL+JB1jR88f8HQ4//V7vAhbiC7XFE4fo0ojTbo7jZJNLNgj2bWfUskSKWSQBeSkE5wRJnB+kRHlb6seirW5N/p0/ritnygK4Vw2qz7DGzLWhVvv8rZPVTN5ZTCIXlHKaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724425000; c=relaxed/simple;
	bh=HevaHT/6Oz147NSX7L5OG2uheTBQJzmB09UKjKHTvvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZerB4FSQC172K0doRVk0Y5gRay8fgb5jlHpw5UDxw4UW1rqAehTAIJ2X/5R03kklsOxKzT73TacJg8zWnP776k/sOoJMdaQj7LAJpARD4hGYJtVE/jd8OweT8D0s0A5hikNsERY1kQlK2hcKuEix1dmrMKzSxhvf1ospZh//PGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QzyL/p7M; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724424999; x=1755960999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HevaHT/6Oz147NSX7L5OG2uheTBQJzmB09UKjKHTvvg=;
  b=QzyL/p7MVW26JjvEVO0q74S3DZBQ6Gai0C50TqulWKb4LRjgoX+i22CW
   gzYAsfpzERW9pidwZP8LkNDslaQfCpi3ZjW2DV1NfoyHbj9HEa1BtcQku
   7rMDBEDaqGklnwfv+PAdG7I2yLd9X+dJA+aLycP9LxOzzpOG3vei9CQe5
   tW77B0C3ZJrZ3FFyQtV/aVckHEQUeA2Kr5h85fokdTQ2atqJzDCv+uJ0z
   s3lZo/E8p2IM7i00af2Z8jR51uLAYZ4LS6FMo+AuPREGD3r1N8n8VlJt3
   WCHGi+j08B3B7gR6WZ8tCj/Nps/CszbWeELjhplxVrF/1sDHYc3nxfjHA
   w==;
X-CSE-ConnectionGUID: FxltRQemTpuqRSEvlAaftg==
X-CSE-MsgGUID: mMjcPJBSTrWBig6fgOuODQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26766081"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="26766081"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:56:38 -0700
X-CSE-ConnectionGUID: leuh9NUlSzmkTpTNjMCQgQ==
X-CSE-MsgGUID: rn8/pJGJSJ2ds0Am1DxEaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="61497586"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:56:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shViL-00000000pMC-0OSG;
	Fri, 23 Aug 2024 17:56:33 +0300
Date: Fri, 23 Aug 2024 17:56:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v2] gpio: rockchip: support 'clock-names' from dt nodes
Message-ID: <ZsijIGTtHynR_jrm@smile.fi.intel.com>
References: <20240823034314.62305-1-ye.zhang@rock-chips.com>
 <20240823034314.62305-8-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823034314.62305-8-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 11:43:10AM +0800, Ye Zhang wrote:
> Added support for retrieving clocks using 'clock-names' from dt nodes

...

> +	bank->clk = devm_clk_get(dev, "bus");
> +	if (IS_ERR(bank->clk)) {
> +		bank->clk = of_clk_get(dev->of_node, 0);
> +		if (IS_ERR(bank->clk)) {

> +			dev_err(dev, "fail to get apb clock\n");
> +			return PTR_ERR(bank->clk);

			return dev_err_probe(...);

> +		}
> +	}

...

> +	clk_prepare_enable(bank->clk);
> +	clk_prepare_enable(bank->db_clk);

Any of this may fail. You perhaps want

	bank->...clk = devm_clk_get_enabled(dev, "...");

Not sure for the fallback case (of_clk_get() should be killed as we almost done
in GPIO library for GPIO APIs).

...

> +err_unlock:
> +	mutex_unlock(&bank->deferred_lock);

Don't you want to use guard()/scoped_guard() at some point?

-- 
With Best Regards,
Andy Shevchenko



