Return-Path: <linux-gpio+bounces-9060-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D1795D04C
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 16:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19E0D285F8B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 14:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30446187FFC;
	Fri, 23 Aug 2024 14:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBADjkRx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E971581E5;
	Fri, 23 Aug 2024 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724424363; cv=none; b=E6OaiZv01F0lPhRauCdGzq+l2aMkAkOYoRyJFiOLLKyy4QUjVGl+mWpRckESLLDM9f1nb/UUFAgqScz0E7gAMHhhk4KXIqHTjQ3TuuzeChJP2LEy9/nt9KWG3uM2oRZ1nTm25OhlLFj2QxZ56oI0GY5KGy7LgvC3ET5OAw5cus0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724424363; c=relaxed/simple;
	bh=KP7pzsC70WkagQf4cPqKhy6qm2cgrVoiu8S8ZLGfn3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6lsqe1oWFVRJlvq9dqNVWYq+GoT4jcD1+KoIknaA8zVVqmu5rRkTnUyXaW60uvwG6JKFMiz6D0oMs+1YsAFtERbDA84UDTaOY6rOVAvPM+l7I+/swqDqv3LOpAhhG+ZswrKaEDKV6RMpeOkbhrLGhoFb3KKm71z9Itu7n9DRp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBADjkRx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724424362; x=1755960362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KP7pzsC70WkagQf4cPqKhy6qm2cgrVoiu8S8ZLGfn3w=;
  b=GBADjkRxkJpsi2d0g1vdspXK2yJYqJkPQmVZDIYqFKuCD/wgG242N5KM
   jcwQcatPRcXiyO+uELFFvXsxa7gEJgppIMTDel4mGbBi251kJ7/ot1+PN
   j9+wGgsU8tF6bRB67SFUR3exwyyaFiXj4G/ogtyNRHiz6mM5zNO+758bb
   RluZpgkUJ6i8mrzuW2PY2Hu5ZEyXLxclMpQsPgf1g74z0rqVj7iF/oogJ
   pCc2k+2G/4pKR03Pvxg5m8w1Fjg184I1OHnGotijQA+7GFMtz3TEtD/XZ
   cqCN2fW0vxgRQDzQ0K2mwOafYhYZ4gn3cvFEFybNkdWr34bzSPlXszFqp
   A==;
X-CSE-ConnectionGUID: JWjqakVTT3qjZvuvclygww==
X-CSE-MsgGUID: PevFm/GvSfOsrETEnEFVDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23065719"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="23065719"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:46:01 -0700
X-CSE-ConnectionGUID: b8WRW3v4R0eSlb7fm7+bEA==
X-CSE-MsgGUID: +5wlqm5bTWG6dtp60iGNtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="66134472"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:45:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shVY3-00000000pBz-0Q58;
	Fri, 23 Aug 2024 17:45:55 +0300
Date: Fri, 23 Aug 2024 17:45:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v2] gpio: rockchip: avoid division by zero
Message-ID: <ZsigomgMVH76ACZH@smile.fi.intel.com>
References: <20240823034314.62305-1-ye.zhang@rock-chips.com>
 <20240823034314.62305-2-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823034314.62305-2-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 11:43:04AM +0800, Ye Zhang wrote:
> If the clk_get_rate return '0', it will happen division by zero.

At the abstraction level this is good to avoid 0 division and return an error,
but...

>  		freq = clk_get_rate(bank->db_clk);
> +		if (!freq)
> +			return -EINVAL;

...do you this the absence of debounce here is a fatal error?
(Yes, I see it's a fatal when it's bigger than maximum.)

>  		max_debounce = (GENMASK(23, 0) + 1) * 2 * 1000000 / freq;
>  		if (debounce > max_debounce)
>  			return -EINVAL;

-- 
With Best Regards,
Andy Shevchenko



