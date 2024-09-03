Return-Path: <linux-gpio+bounces-9683-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF80E96A3CF
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 18:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B8F0281391
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 16:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4D3189BB8;
	Tue,  3 Sep 2024 16:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJAUHpzR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18381DFFC;
	Tue,  3 Sep 2024 16:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725379871; cv=none; b=Jlt6EOZ548mNGpIcNJ/na0aJGGv336kj0tOkBxHDuEulHKimgXuskygB/U4hYvYfvOIq4cXA6ZP4JfikNcRmraK8PutuWTb2sUQDZ8pnnOEJ5r1mWfgZOPUhbhpB6lw/ejF9KCpmxYSgWTKkzMDC2WyFZf69n7NBaRtqDNxo/wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725379871; c=relaxed/simple;
	bh=23UJof+bw4z17P2EuEFVPPtXB7zf9hg2doA/jFPekec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MrYSD1Us8Ex44vEjlWIhwCTPxUOdLVHhCUTiYvVpHpI/SsKY9SoqwvVrp0/2BH3QRsQskRHyZ/ioQiBypBTVxldUBdwIA/ahv0OykFU15iZCS6/BZ/qNMOp6L46Xzpw1nof1JHIZzjhbzmT1ReT+I7NBb1X0FNYNVbGTAK1IE4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJAUHpzR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725379870; x=1756915870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=23UJof+bw4z17P2EuEFVPPtXB7zf9hg2doA/jFPekec=;
  b=kJAUHpzRVWRyQRpTnMRKlK7y1728IP5prMIjHHNKHtUcohHYrdDJDedP
   KQb0le2OxaMdTexDb0Nqv4gE/1pIoVdIXwfc2p3Uo+7Ti6nm2/jLp4c5I
   /mwPt4pD7fqf+UlMzMwuqCRo7gP4jhERwGK3azUiY2q8WtI/sutSJwMAH
   1+dVPQQ3vh8UoYs2J/jy+ji13T+pzT0lMvIPLUX0cCkhHtbY9ZqQQA+JY
   MWm6xS0ukzK9Zv0tJsY8WYx17fuAoyqtYtW43K19hz/d+3/74wWyLEGxQ
   01+2HROE5h3Kb2Yd0dZ7MYMUwzM3bgRNQ5MzyZSOjbiBzawZ0UFWDZAvZ
   w==;
X-CSE-ConnectionGUID: z+Mi9ddLRHm1uhoDtGjyZg==
X-CSE-MsgGUID: kFtuT8ZOTAGAP1gFM0/MFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="35147602"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="35147602"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:11:09 -0700
X-CSE-ConnectionGUID: iiiYSyOkTkSWL/6RgAW03w==
X-CSE-MsgGUID: xmCnEEbvQOKNkRB36feE1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69585899"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:11:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slW6l-00000004lR0-24Yh;
	Tue, 03 Sep 2024 19:10:19 +0300
Date: Tue, 3 Sep 2024 19:10:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v3 12/12] gpio: rockchip: replace mutex_lock() with
 guard()
Message-ID: <Ztc03cbpPjPZatoL@smile.fi.intel.com>
References: <20240903073649.237362-1-ye.zhang@rock-chips.com>
 <20240903073649.237362-13-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903073649.237362-13-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 03, 2024 at 03:36:49PM +0800, Ye Zhang wrote:
> Replacing mutex_lock with guard() simplifies the code and helps avoid

mutex_lock()

avoiding

> deadlocks.

...

> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c

+ cleanup.h

...

>  	}
> -	mutex_lock(&bank->deferred_lock);
> +	guard(mutex)(&bank->deferred_lock);

Make it surrounded by blank lines.

> +	ret = rockchip_get_bank_data(bank);
> +	if (ret)
> +		goto err_disabled_clk;

-- 
With Best Regards,
Andy Shevchenko



