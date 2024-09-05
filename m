Return-Path: <linux-gpio+bounces-9833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 068CB96D97C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 14:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AC4EB24B0C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 12:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77E819B5B2;
	Thu,  5 Sep 2024 12:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJTtVrsj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F5519B3FF;
	Thu,  5 Sep 2024 12:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725540998; cv=none; b=K+Yl25eHHd6WPoYz7oGpB2hPlmmXkZhvYLxJry9ijPBXVAeGWI9/QmDo5BiHnPj5PMGYTKCg7R1jpDkkqwS41tx9PUabpnkG1dkBOZ9dA+RUM/RQgzO1KsASiiqV3FPh9167YdusS2OyLkDv5K0lxlHmCFogYI8/uL24VmNyWr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725540998; c=relaxed/simple;
	bh=xYIh/bt8ATiDqQSVPUkjd8FviXEE9vSnRc0D+1k9vd4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LO7LYC0wBp9RRjgfr5Pup0itrrbgX/zJDPmyCvmivH6jumv0gKL7M3Sry3HnjLfb3P8DVnOhgJRX6rX3VhKci2lNQpWqSydED6QNDRRQdwQCB0oFjQ4EYkm1T1spqcgi6e5ccMOzwosG9Hr7/j4FCveqNZkke5RRP/a43e0qzd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJTtVrsj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725540997; x=1757076997;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=xYIh/bt8ATiDqQSVPUkjd8FviXEE9vSnRc0D+1k9vd4=;
  b=ZJTtVrsjzsRUmv7N86h5YUpFDSI/G8h0Hcf6F906YBkpKDmypJ3Eorun
   3twViT2Tw+uXBgUhh7zvAl4Q9VHdwc31aKdVHLUYqS86hkp8uCZnhkydy
   xeY+w1PqcZUSMq6F7iUKAzXe6rbZoW4CwUFJF03y2BGS9UEJAvuGDCiKK
   q3Ttga8RhP26Cav3xlVnt5SRpVIH8FgyHTOfQQKSdP44sJbiL6MlNyiIR
   kkHthlSm6I304Odo4E0mHJ9QNfWGbOh+VFDJNC1nIpXCmL9+ptsQCm697
   SPEx/ctZ/Rh9my/y7UhJaSpfRMXQ2bTd2RUvPrUnANLIguO1kjxp+4C5J
   Q==;
X-CSE-ConnectionGUID: 0+baM3MMS3yvEjuFHsruJA==
X-CSE-MsgGUID: myMQNxpFTiGAqls9Hm5VVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="34824749"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="34824749"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 05:56:24 -0700
X-CSE-ConnectionGUID: Kcq00DTNSRi7kb1B3Ot7/A==
X-CSE-MsgGUID: hGncXF15RLS/t5l/n59BHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="96361175"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 05:56:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1smC28-00000005Omw-36OX;
	Thu, 05 Sep 2024 15:56:20 +0300
Date: Thu, 5 Sep 2024 15:56:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] pinctrl: nomadik: Use string_choices API instead
 of ternary operator
Message-ID: <ZtmqdP6Q92vRWh_I@smile.fi.intel.com>
References: <20240826095723.1421065-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826095723.1421065-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 26, 2024 at 12:57:23PM +0300, Andy Shevchenko wrote:
> Use modern string_choices API instead of manually determining the
> output using ternary operator.

Linus, do you have any comment on this?

I had sent two patches of similar changes (different drivers, thoug),
one got applied and this is not. Anything should I do about it?

-- 
With Best Regards,
Andy Shevchenko



