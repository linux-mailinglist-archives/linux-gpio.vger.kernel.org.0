Return-Path: <linux-gpio+bounces-13283-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2F79D931E
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 09:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00497283EF7
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 08:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FDC199E92;
	Tue, 26 Nov 2024 08:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZTABdvA+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE951195FEF;
	Tue, 26 Nov 2024 08:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732608881; cv=none; b=tSICNxkfiuEuERh6FVgFhh1UCEnZgZP+6FCLkgKFLury1t5hJWLDjZPU2Ayw6mpKGD2DgIiaocwdKzwGQiOZ27jaobboflBwT5UxC7Y+aceqdU9eGd0252+UUZRyDLjKFWwtdrkRU8dbEAiJe7ANXJWne3Uh5j+QM1nnYaFnKm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732608881; c=relaxed/simple;
	bh=U3PKsbUBinHKAQTY4pSr/DghVg9jFrCovhbN+2xY6tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdxTbWF3oNI7E2suYoGSCYBWpfihpyCaN5BxXLp3BqI+v0VKejIeHweQUwrHXQfhpPQaUGWqQPCktUI1SRpMgll8nixBTW4slrZnSmsBC1JLSzZfa1rMF/XHvgUxVmbqvZ9P3WW9x9LoO4hxf+bY1uZGI3faaRVpeDxhh3Bpa2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZTABdvA+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732608880; x=1764144880;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U3PKsbUBinHKAQTY4pSr/DghVg9jFrCovhbN+2xY6tI=;
  b=ZTABdvA+jkptZ7b8xWFdGWoN+2hNIuDeaZAt65fNiZjYff9lzlJcEki8
   RX1wwePXVRL1blPPNBo+iKG2dcOdrbD+WJk6t35z0CEvsx9LgWOouxpjE
   be8ATaujqR8E1Utm6F69s+UDatIebKukXRjMj4VIitexJD5nSGLy9JPe8
   /YI5ifKfCkPwZgzP7TjO+eYUNwLl+SU5nldaA3M/zquwNtNtxxMhFs9bB
   sqWb1Jx5dLj19skIW3TKFML86T9QK6Bob3LW0kfli3PJpjc829pMaUVCM
   QVFNc7lzlPZw5GnfB1PQcf/um3eYuHHeBht4eYOIj+C2i8J0KhjIzvSni
   Q==;
X-CSE-ConnectionGUID: TVQcmf9ASsO9B3EEN4at4g==
X-CSE-MsgGUID: uuQHz/qfRSqCmBJ1Rewjpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32814613"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="32814613"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 00:14:39 -0800
X-CSE-ConnectionGUID: i5mZsNWdRx2WtllhCE1fHw==
X-CSE-MsgGUID: /aO0CI5ITGScVscyHxtj0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="92349151"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 00:14:37 -0800
Date: Tue, 26 Nov 2024 10:14:33 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, gregkh@linuxfoundation.org,
	linus.walleij@linaro.org, mika.westerberg@linux.intel.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 1/5] devres: Introduce devm_kmemdup_array()
Message-ID: <Z0WDaYEg1yjpNJqH@black.fi.intel.com>
References: <20241123200527.7830-1-raag.jadav@intel.com>
 <20241123200527.7830-2-raag.jadav@intel.com>
 <Z0LPyMed-4a8cajD@google.com>
 <Z0QsAm3FdZDJ8kY0@smile.fi.intel.com>
 <Z0SS3cO4acfgz0iQ@black.fi.intel.com>
 <Z0Sl1gmYc3y11riD@google.com>
 <Z0SwIsmKPlqfRlMB@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0SwIsmKPlqfRlMB@smile.fi.intel.com>

On Mon, Nov 25, 2024 at 07:13:06PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 25, 2024 at 08:29:10AM -0800, Dmitry Torokhov wrote:
> > On Mon, Nov 25, 2024 at 05:08:13PM +0200, Raag Jadav wrote:
> > > On Mon, Nov 25, 2024 at 09:49:22AM +0200, Andy Shevchenko wrote:
> > > > On Sun, Nov 24, 2024 at 07:03:36AM +0000, Dmitry Torokhov wrote:
> > > > > On Sun, Nov 24, 2024 at 01:35:23AM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > > > > Introduce '_array' variant of devm_kmemdup() for the users which lack
> > > > > > multiplication overflow check.
> > > > > 
> > > > > I am not sure that this new helper is needed. Unlike allocators for
> > > > > brand new objects, such as kmalloc_array(), devm_kmemdup() makes a copy
> > > > > of already existing object, which is supposed to be a valid object and
> > > > > therefore will have a reasonable size. So there should be no chance for
> > > > > hitting this overflow unless the caller is completely confused and calls
> > > > > devm_kmemdup() with random arguments (in which case all bets are off).
> > > > 
> > > > Don't we want to have a code more robust even if all what you say applies?
> > > > Also this makes the call consistent with zillions of others from the alloc
> > > > family of calls in the Linux kernel.
> > 
> > Having a clean API is fine, just do not bill it as something that is
> > "safer". As I mentioned, unlike other allocators this one is supposed to
> > operate with a valid source object and size passed to devm_kmemdup()
> > should not exceed the size of the source object. There is no chance of
> > overflowing.
> 
> Agree.
> 
> > > Agree. Although shooting in the foot is never the expectation, it is
> > > atleast better than having to debug such unexpected cases.
> > 
> > Then maybe have a BUG() there instead of returning NULL? I know BUG()s
> > are frowned upon, but I think in this case overflow is really an
> > indicator of a hard error by the caller which is passing garbage
> > arguments to this function.
> > 
> > Hm, I see we have kmemdup_array() already. Ok. How about making your
> > devm_kmemdup_array() be similar to kmemdup_array()?
> > 
> > static inline void *devm_kmemdup_array(struct device *dev, const void *src,
> > 				       size_t n, size_t size, gfp_t flags)
> > {
> > 	return devm_kmemdup(dev, src, size_mul(size, n), flags);
> > }
> > 
> > This will trigger a warning on a too large order of allocation in
> > mm/page_alloc.c::__alloc_pages_noprof().
> 
> This is nice! I have overlooked that kmemdup_array() uses size_mul()
> instead of a check. Raag, can you rebuild your series on this?

Sure.

Raag

