Return-Path: <linux-gpio+bounces-8681-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE0394CFDF
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 14:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98467B21071
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 12:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE86C193064;
	Fri,  9 Aug 2024 12:13:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E9B14D6EB;
	Fri,  9 Aug 2024 12:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723205623; cv=none; b=IdrR3Yp+UbD/1w3n8qev2K1XsGpanwo7SBltl+SZ0pUlPxXMdXA6kU56+uZTZVqoaLWCBeFc02dX+SouwGyagN0vUvYRQtdcYP9SqyQ1zpFVz6BPNNcG+PDYvlGeRusl5LyOIrcfZGqAyogXLJlwiGvDUbx8v1clgPP4uJncBWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723205623; c=relaxed/simple;
	bh=z8pPxxe5+sUgW2txaKcPpeE/9tVGTXEKCkekAJkX7T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQ9e/1pwONh6Kk6TR/FrFrsaLmc9eHWAxLLcxwFrBa1cGbFSWar8K7HH2Pf7kB4CkwQfofTAH+QU3iNB+ye/y7RzAo2g5oWQfD41+C3TVJw0WWoe0zadZOBhDMJrQRqv/Suph8ndS4swI517Li7WTSKccQor4J8xLoWRi/cspww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=black.fi.intel.com; spf=pass smtp.mailfrom=intel.com; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=black.fi.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
X-CSE-ConnectionGUID: 2M2ulDqUQe2GvOZAWf15Yg==
X-CSE-MsgGUID: 8NP+xgmBR5e+C8+E6mApoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="20938710"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="20938710"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 05:13:40 -0700
X-CSE-ConnectionGUID: AIoKGcdxSOad023RGIx5JA==
X-CSE-MsgGUID: Bg5UV5YSTXemO0VHC9jYpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="62504414"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 09 Aug 2024 05:13:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 40956538; Fri, 09 Aug 2024 15:13:37 +0300 (EEST)
Date: Fri, 9 Aug 2024 15:13:37 +0300
From: Andy Shevchenko <andy@black.fi.intel.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, naresh.solanki@9elements.com,
	andy.shevchenko@gmail.com, broonie@kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: cy8c95x0: Use regmap ranges
Message-ID: <ZrYH8QlXH5Gfvnz_@black.fi.intel.com>
References: <20240521152602.1097764-1-patrick.rudolph@9elements.com>
 <20240521152602.1097764-2-patrick.rudolph@9elements.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521152602.1097764-2-patrick.rudolph@9elements.com>

On Tue, May 21, 2024 at 05:25:58PM +0200, Patrick Rudolph wrote:
> Instead of implementing a custom register paging mechanism in
> the driver use the existing regmap ranges feature.

...

> +#define MUXED_STRIDE		(CY8C95X0_DRV_HIZ - CY8C95X0_INTMASK)

> +#define CY8C95X0_MUX_REGMAP_TO_OFFSET(x, p) \
> +	(CY8C95X0_VIRTUAL + (x) - CY8C95X0_INTMASK + (p) * MUXED_STRIDE)

> +static const struct regmap_range_cfg cy8c95x0_ranges[] = {
> +	{
> +		.range_min = CY8C95X0_VIRTUAL,
> +		.range_max = 0,		/* Updated at runtime */
> +		.selector_reg = CY8C95X0_PORTSEL,
> +		.selector_mask = 0x07,
> +		.selector_shift = 0x0,
> +		.window_start = CY8C95X0_INTMASK,
> +		.window_len = MUXED_STRIDE,

Looking at this again, are you sure you have no off-by-one error in
MUXED_STRIDE value?

Also a comment in the regmap core suggests that we may include selector
in each of the window.

With this, we probably should simply use PORTSEL as window start with a
fixed window len of 16, having a few more (reserved) registers in the
dump seems not a big deal to me, but it will be much easier to decipher
a port number based on (virtual) offset.

Besides above, why virtual start is not well aligned? I would expect not
0x31, but 0x40 or alike. It might explain some bugs with cache you have
seen.

P.S. It might still be bugs in regmap core, if it is the case, they
need to be addressed.

> +	}
>  };

-- 
With Best Regards,
Andy Shevchenko



