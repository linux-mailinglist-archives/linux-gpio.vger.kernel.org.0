Return-Path: <linux-gpio+bounces-13272-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 391D39D8B1C
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2024 18:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5066B34298
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2024 17:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B225A1B6D1D;
	Mon, 25 Nov 2024 17:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0Dj0zO4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD221B6D06;
	Mon, 25 Nov 2024 17:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732554794; cv=none; b=myygP/qkSYExBHRYViA9z//X4SyKLfoX6Wngat0Xq9BCuExLDxGeyqMLeYqF5KAnOtUwRMNLbb97YAzjzIKNfLKGBNvecomPxkKhg4UcldKDbubDF6qFboN/8oHIvEXUhwtYfVg0hE7/gGGPPpj269Y7ErtRt3FCOOOwtXPChbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732554794; c=relaxed/simple;
	bh=ZWqMEC+4joN3CENBWTrOqZR0K5KxQBhNFHLNJCnu6e8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h49hS+TDbWJNFZ2RHzJ9v+b8PjGYL/jFfmUabRo4PU1/TB+r6OmKWxqcsET8UaOy5mZ6ut1bxB/HA+8ZKIkktmL+rQ+7ZqeRQrc1OpqnGLVrPxibxIuLhGp22628bLdHZytVflZvpoVUFCMz9N2BHs+DCf6ELYiMNaNhQe72vu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0Dj0zO4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732554793; x=1764090793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZWqMEC+4joN3CENBWTrOqZR0K5KxQBhNFHLNJCnu6e8=;
  b=X0Dj0zO4Bxx64vj4CTClNp9RMYPTXLbd8j0botN2rXKVsLfQrNlIpmNf
   84Olh0b0h0Y2HLmXdseuroLRbyYUqAte3I4qDibZUFSVzlzawLPiH2hl9
   vgPVEahXJ3PREM5Sbr2eoVuea573qb5OwywAGypbQRJXrruvgh0sBiuBK
   UPUGmU46cBlVfEB0bgaeFhr6LAuAXIt3km5Lc2Eh4AHe4eRt/OZmpZvWE
   X+YgdkEYtqBz//xpxzKxdJe/oSzcsVOrmrRplR69mNZgCwnJDETsC+eRA
   9KsPQdtJpqeAKnYdaxPQXpO34siXIDCAd1v3Rgj91uMg2KOY5Ys/oZ9za
   Q==;
X-CSE-ConnectionGUID: zuK3m4qSSsKJUwynN6qZuA==
X-CSE-MsgGUID: Er14ZUZISwu/C+GzCJW80A==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="20264922"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="20264922"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 09:13:12 -0800
X-CSE-ConnectionGUID: 2C1+x3T0QB+qi8FUwiRr5A==
X-CSE-MsgGUID: /VNM+sReQ9Cf476AWaOyGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="95424647"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 09:13:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tFce2-00000000z4o-276T;
	Mon, 25 Nov 2024 19:13:06 +0200
Date: Mon, 25 Nov 2024 19:13:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Raag Jadav <raag.jadav@intel.com>, gregkh@linuxfoundation.org,
	linus.walleij@linaro.org, mika.westerberg@linux.intel.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 1/5] devres: Introduce devm_kmemdup_array()
Message-ID: <Z0SwIsmKPlqfRlMB@smile.fi.intel.com>
References: <20241123200527.7830-1-raag.jadav@intel.com>
 <20241123200527.7830-2-raag.jadav@intel.com>
 <Z0LPyMed-4a8cajD@google.com>
 <Z0QsAm3FdZDJ8kY0@smile.fi.intel.com>
 <Z0SS3cO4acfgz0iQ@black.fi.intel.com>
 <Z0Sl1gmYc3y11riD@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0Sl1gmYc3y11riD@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 25, 2024 at 08:29:10AM -0800, Dmitry Torokhov wrote:
> On Mon, Nov 25, 2024 at 05:08:13PM +0200, Raag Jadav wrote:
> > On Mon, Nov 25, 2024 at 09:49:22AM +0200, Andy Shevchenko wrote:
> > > On Sun, Nov 24, 2024 at 07:03:36AM +0000, Dmitry Torokhov wrote:
> > > > On Sun, Nov 24, 2024 at 01:35:23AM +0530, Raag Jadav wrote:

...

> > > > > Introduce '_array' variant of devm_kmemdup() for the users which lack
> > > > > multiplication overflow check.
> > > > 
> > > > I am not sure that this new helper is needed. Unlike allocators for
> > > > brand new objects, such as kmalloc_array(), devm_kmemdup() makes a copy
> > > > of already existing object, which is supposed to be a valid object and
> > > > therefore will have a reasonable size. So there should be no chance for
> > > > hitting this overflow unless the caller is completely confused and calls
> > > > devm_kmemdup() with random arguments (in which case all bets are off).
> > > 
> > > Don't we want to have a code more robust even if all what you say applies?
> > > Also this makes the call consistent with zillions of others from the alloc
> > > family of calls in the Linux kernel.
> 
> Having a clean API is fine, just do not bill it as something that is
> "safer". As I mentioned, unlike other allocators this one is supposed to
> operate with a valid source object and size passed to devm_kmemdup()
> should not exceed the size of the source object. There is no chance of
> overflowing.

Agree.

> > Agree. Although shooting in the foot is never the expectation, it is
> > atleast better than having to debug such unexpected cases.
> 
> Then maybe have a BUG() there instead of returning NULL? I know BUG()s
> are frowned upon, but I think in this case overflow is really an
> indicator of a hard error by the caller which is passing garbage
> arguments to this function.
> 
> Hm, I see we have kmemdup_array() already. Ok. How about making your
> devm_kmemdup_array() be similar to kmemdup_array()?
> 
> static inline void *devm_kmemdup_array(struct device *dev, const void *src,
> 				       size_t n, size_t size, gfp_t flags)
> {
> 	return devm_kmemdup(dev, src, size_mul(size, n), flags);
> }
> 
> This will trigger a warning on a too large order of allocation in
> mm/page_alloc.c::__alloc_pages_noprof().

This is nice! I have overlooked that kmemdup_array() uses size_mul()
instead of a check. Raag, can you rebuild your series on this?

-- 
With Best Regards,
Andy Shevchenko



