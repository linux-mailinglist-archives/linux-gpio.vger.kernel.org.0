Return-Path: <linux-gpio+bounces-9069-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F7095D144
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 17:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B6E01C22057
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 15:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3B7188A0C;
	Fri, 23 Aug 2024 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RwiuuZ2t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15651433BD;
	Fri, 23 Aug 2024 15:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724426562; cv=none; b=EzHs5B1znvpVZzPE+Gjl7BiUTPYViOLtcdVdaxeOlBn6HcGZVI66k4B/xpkj4QJhjmWhxM97pEqNc6SGhZYNKV2Sv+046Fj0BPBzwj97WQR85OE6rnd75PCPPr+r7mc02ZJTHR9x1yhPLe/jh848sYA0k/GIVhxrejjwqWrFq/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724426562; c=relaxed/simple;
	bh=3qK4L+r7VH5lFspwqEdMrN+QdtLEFgzsJe1FRuCWHys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=in/b7haGpYBsVI5VtftjPVN+dQnIP3sgaqXXC9E+7Qs7XWTEbZk8+ade5Zw68EMD0z0JZz6cUNOJRCUshV3W2l+GhUDOfvAZRGzfOjqVgIom4Fme8+LFVCVvlj+tdu2NKtxoN59b1GdXExzYUcJiSQhygTcqn0tq/XScF4k16S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RwiuuZ2t; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724426561; x=1755962561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3qK4L+r7VH5lFspwqEdMrN+QdtLEFgzsJe1FRuCWHys=;
  b=RwiuuZ2tbYxr4Niq1Sq3QjDs1MDdG9DZ9tVmgojjXlLbORDGUGDX793f
   ARjjz57lB2Y+Ck4qT5CeyntB3eGUeyUrqr39XHMmIf5+sr+uXHhYcoAJO
   Gk4owdYLhXWPFsT7TSj1sp2HLe2QfdSa/DY48vsvxjbYvq7Ub1TjPJu61
   LCMh7f5+a0q9iDuIbF1u9eX6PJtvJFKNQCSf7EThdY0nnuj/XHlg7+LtD
   jt63BbKPrVBmxq+pYW5zKHjXz4Cbo6cwFEdhA2H8+aaEcaA/hBm8UM9gX
   6+Do6OJCOC1LyiuOkVAkFdnQgZng8ss+3v/ZWnN1/CsMIMLJ8IR+mhPOT
   A==;
X-CSE-ConnectionGUID: Sa0hCwHXQge6pkdgkOVChw==
X-CSE-MsgGUID: ++OI4opRQTyK2f8e3kBDeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23069531"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="23069531"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 08:22:40 -0700
X-CSE-ConnectionGUID: S7lhRkrzTvuFsWFiwB9K5A==
X-CSE-MsgGUID: bRpJZFmSTcCz1uRxOvrExg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="61678428"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 23 Aug 2024 08:22:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AFA42209; Fri, 23 Aug 2024 18:22:37 +0300 (EEST)
Date: Fri, 23 Aug 2024 18:22:37 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: geert+renesas@glider.be, linus.walleij@linaro.org,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] drivers/pinctrl/renesas: Switch to use kmemdup_array()
Message-ID: <ZsipPZz7O0yrOHE9@black.fi.intel.com>
References: <20240822061438.14617-1-shenlichuan@vivo.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822061438.14617-1-shenlichuan@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 22, 2024 at 02:14:38PM +0800, Shen Lichuan wrote:
> Let the kememdup_array() take care about
> multiplication and possible overflows.

> +	cfgs = kmemdup_array(configs, num_configs,
> +				sizeof(*cfgs), GFP_KERNEL);

Geert, don't you want to fix the indentation issues?
Perhaps even combining these to a single line?

...

> +	cfgs = kmemdup_array(configs, num_configs,
> +				sizeof(*cfgs), GFP_KERNEL);
>  	if (!cfgs)
>  		return -ENOMEM;

Ditto.

...

> +	cfgs = kmemdup_array(configs, num_configs,
> +				sizeof(*cfgs), GFP_KERNEL);

Ditto.

-- 
With Best Regards,
Andy Shevchenko



