Return-Path: <linux-gpio+bounces-18933-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 47509A8B508
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 11:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E50177AD4B8
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 09:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE046233151;
	Wed, 16 Apr 2025 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUly/3SX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57BD224B15;
	Wed, 16 Apr 2025 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795038; cv=none; b=eoIVBZgYPpNtj/nkXk8jMdEwi+9ASBLr37yitJhnJhJwTkU/7rC3iwPRMTIOUVitF22rqxtKqbUtH8Erau0Qwl7GR9rSuhT/e5o9OihxGlIOLanUpjxrBGuPSGg3cV8C64fjKeZOliJg2V8MWBALjjSbog6aUOnUUdSNYraGnVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795038; c=relaxed/simple;
	bh=I0RocmFlcpEhgi1iSI9eoPZDakfaDss2uB6SLfrAKvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnXZfuK6rw+6i+bru36L3/AWnFwBLbrO3lQM/5fj5YT8iTFmqOxnR/kRuZfkpKq/OfGZLwg4YtCwc6xUx4AM20sPQc1xwkM+eGMLyZST2bHwU30M4NAS8cfvScCXNZy1cYltkBsOY2JbjOYg8V94M4bCznprX7qW08KlSHhdjBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUly/3SX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744795037; x=1776331037;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=I0RocmFlcpEhgi1iSI9eoPZDakfaDss2uB6SLfrAKvk=;
  b=FUly/3SXKNmoRDcQ1wKccQ7JtF4V3bFAwSv++ho1dKIyslB7eVfIA2eB
   uPrVA+gP4Vans4SFfJog/9uk/LiHNp8Mr52oPg/cs10kkOwns9yBNywJX
   yQJO8BbFDsSmAurW9WqY2THwkvwfxNuE01vE6GokcG+tS8Dpn4O2GbbI6
   UEk3bBc0Mzr1JPxPPXEBrvq+9wsDBagNRW4lDat5n25dXfbb04e7QLIBM
   wPqS4EfIkqqXkPXVkhOFdooY1iDz3Yy9c3O3ZOjs//guv+R+mpazzKjfu
   uCMB2vo25hathuX4ajQzSYlaGLTLc1kmrERi2g8Lk4MKjBJHhPBe64kBu
   g==;
X-CSE-ConnectionGUID: 693Go8iqSX+uxjq7ifzsjw==
X-CSE-MsgGUID: 9bj1cHDIT72Sp+NE/kxUgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="63872024"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="63872024"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:17:15 -0700
X-CSE-ConnectionGUID: TY0vKfVxTbeP9/SHvcYEjg==
X-CSE-MsgGUID: JgeAl70GQvqV/aWPGEui5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="134486580"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:17:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4ytL-0000000Co1F-0PUN;
	Wed, 16 Apr 2025 12:17:11 +0300
Date: Wed, 16 Apr 2025 12:17:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 4/7] gpiolib: Call validate_desc() when
 VALIDATE_DESC() can't be used
Message-ID: <Z_91lpPIjtXvYbap@smile.fi.intel.com>
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com>
 <20250415111124.1539366-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdbvnL0z1x0An2Bhv1TdQxaz4vtBpVBDXUe+LCK68FM=dA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbvnL0z1x0An2Bhv1TdQxaz4vtBpVBDXUe+LCK68FM=dA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 10:44:18AM +0200, Linus Walleij wrote:
> On Tue, Apr 15, 2025 at 1:11 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Call validate_desc() directly when VALIDATE_DESC() can't be used.
> > It will print additional information useful for debugging.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thank you!

...

> >         if (gc->to_irq) {
> > -               int retirq = gc->to_irq(gc, offset);
> > +               ret = gc->to_irq(gc, offset);
> > +               if (ret)
> > +                       return ret;
> >
> >                 /* Zero means NO_IRQ */
> > -               if (!retirq)
> > -                       return -ENXIO;
> > -
> > -               return retirq;
> > +               return -ENXIO;
> 
> Totally unrelated change - but I'm fine with that :D

It's not totally (it's a reuse of the same variable), but I can split it.
Bart, what do you prefer?

-- 
With Best Regards,
Andy Shevchenko



