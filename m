Return-Path: <linux-gpio+bounces-12315-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1629B6B15
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 18:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DA3A1C217CA
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 17:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1BF213150;
	Wed, 30 Oct 2024 17:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2w79DbO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB5321314B;
	Wed, 30 Oct 2024 17:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730309679; cv=none; b=pCU/8nAZ+LFlZSjRY2qYmHuH3sPSzTjqSEFvvR8ebaP3YF9qioRu8M0WDJh2pKsgyIkoSyrr1LF0k+weFnJakK/GemonQIWRvOoQaOXU+iKgHINu7HFbY5/EfPLj49bmVdxbru1rx7+luBLEnk1oGeNWIPwXqTz4toHZabdDssE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730309679; c=relaxed/simple;
	bh=cBd5TgkzQqEHOwZwVLZxCtIcfAbdWndm7ybVSTY1TiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAPiY7MMAF61eNIhbnejZ7ceH702ZJPiBU33BbgT/jOybMnNS1Rf/NRVmKyMZ0B5epIhk98fVoyOIMgMoWS9AZQcdlDypXjWDGCahQBDg2BOI1o9v7KGlDRFBKOxH1lcSfYU3pR2Mnj5ThAZaGZ4OvVApjntgt/UvkhBul1ohWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2w79DbO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730309677; x=1761845677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cBd5TgkzQqEHOwZwVLZxCtIcfAbdWndm7ybVSTY1TiQ=;
  b=e2w79DbORdX3XeC+TH8cjFpCaym/UroEe8x3fdXPBTtFbi1dYLH3vCkF
   1zzPeFv12fsSJJ+MosCGspcxlJgb8skktfFuV9IDl7U05WUDljpillMV7
   Z6yBz/0iUkVpVT3SD0XsEPKt1ssA05F4J1zIPloKxHFG+qjgm//U5L8Wd
   r8uO0TheP0Dr7G+nPxQHwfhftvzeeXuSVsE4d06KMD7YtHk3g2LPrFfS9
   omsl6o6j5F125pyb7vS+QFAEGVVSmsDNHmSbI1bLJ7MoaNGCUNnbgRq5a
   e6IS2Owl25mUPhntnilSXufGLVfn2Py0mc0uYFbv1gL5PJlaGzV4hjzFQ
   w==;
X-CSE-ConnectionGUID: K+0I9KtnS3OPUfvS7nWNdQ==
X-CSE-MsgGUID: S2ov9qh+T3eXWVS30xJ2hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="55429978"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="55429978"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 10:34:30 -0700
X-CSE-ConnectionGUID: mb7h3fMvSp6irmx4ab5+6Q==
X-CSE-MsgGUID: VmDdag91QyyArSfhvxWOMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="86322811"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 10:33:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t6CZJ-000000097N2-41Zn;
	Wed, 30 Oct 2024 19:33:17 +0200
Date: Wed, 30 Oct 2024 19:33:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 1/2] gpio: mpsse: Check for error code from
 devm_mutex_init() call
Message-ID: <ZyJt3U-YTpQYwLrq@smile.fi.intel.com>
References: <20241030153201.2078266-1-andriy.shevchenko@linux.intel.com>
 <20241030153201.2078266-2-andriy.shevchenko@linux.intel.com>
 <ZyJo4dvULIflwhXL@freedom.csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyJo4dvULIflwhXL@freedom.csh.rit.edu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Oct 30, 2024 at 01:12:01PM -0400, Mary Strodl wrote:
> On Wed, Oct 30, 2024 at 05:30:26PM +0200, Andy Shevchenko wrote:

...

> > +	err = devm_mutex_init(dev, &priv->io_mutex);
> > +	if (err)
> > +		return err;
> > +
> > +	ret = devm_mutex_init(dev, &priv->irq_mutex);
> 
> I think this should be `err = `

Oh, I haven't compiled that for sure :-)

> Other than that, it looks good to me (I doubt you need this, but just in case):
> 
> Reviewed-by: Mary Strodl <mstrodl@csh.rit.edu>

Thanks, I will fix that, I dunno how I missed that because I carefully read
the code before adding the checks.

-- 
With Best Regards,
Andy Shevchenko



