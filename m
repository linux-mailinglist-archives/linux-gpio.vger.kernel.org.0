Return-Path: <linux-gpio+bounces-15538-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 661E1A2C4B0
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 15:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C78A1188A58A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 14:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3941D89E3;
	Fri,  7 Feb 2025 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNtLzOgv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42F914B06C;
	Fri,  7 Feb 2025 14:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738937179; cv=none; b=azHNiZOP26DhW2zI8nw3hBIATMHOT9y3g5zZpX6yO+6jv8i5bT5Av39I+g2V0Or4M5y55wo4KDhW6VZMXP3MHgXZADiFN9sFStiy8971kN4JnLiwgEcphT/cCay4Qo22NLHlJC21hvSxgz3MDNw7W+7XYBtCJMVVRknyZjrToVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738937179; c=relaxed/simple;
	bh=0/tipEzfWBT37O57TIU2pWxZAmUOiCfelggbZOOjntc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6UURetbuJa2WBDr7kmIBz+jSO/h0uM1BJZmVVGMUSGUvqe9fIvdXfW0NKHu3CnR6Cc1LTeXRai/ka3X0SNw8rniaBMQOiOSPem79QfFNEj6YTVjJAJkFi9+04aBqZSM4Ccb0KtsvqNuFAcgEhiLKlGUMIsOuzdWr4xfVLdonMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNtLzOgv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738937178; x=1770473178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0/tipEzfWBT37O57TIU2pWxZAmUOiCfelggbZOOjntc=;
  b=PNtLzOgvyxDCV5QVbfC6v2r+6rRbTMO4cGnhm9k8NB70ofPthDhexsb3
   TZ9tAVoEDk9Tk/YtFpRkis/gtpB8pJJ+mzeLKHWNfPBG5ztWc32v0GT2U
   NAv6AMlv5e0NxIqmm8cgSbxHyGN91zc9U1jW8qZ/jr6ZR0iiyd4IVd1LT
   YPSGlkRQnKSswxsBTBbU3QmFgcwyuxLkl5CLlBUwyFXqvxITUEvY394ZR
   91BKq8F42evEzJAhnxhqMyxdhnoB/bs3SyQv9Ov5fUA6ZGtfdvZtjKC+A
   1jY15E7VGtp7NAqcfIn4D5/X3m5oUg8iwWF6yzmMwQW4SOQrrQsP8OMgi
   A==;
X-CSE-ConnectionGUID: oI7FYp2zTUWmYETcrTeEIg==
X-CSE-MsgGUID: nPpupGTjTZW1Dnd8zFcd4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="56993050"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="56993050"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 06:06:17 -0800
X-CSE-ConnectionGUID: MH5e9lriSB2KbNqVO9/pbA==
X-CSE-MsgGUID: ug/xwKDNQJKviczLM8hj0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="111452296"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 06:06:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tgOzl-000000096GZ-0y21;
	Fri, 07 Feb 2025 16:06:13 +0200
Date: Fri, 7 Feb 2025 16:06:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpiolib: Deduplicate some code in
 for_each_requested_gpio_in_range()
Message-ID: <Z6YTVMdfbWA57qTo@smile.fi.intel.com>
References: <20250204175659.150617-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MeS1gCP2aNKs9xydqLQQnVbWHbVoSqTyLzVcENDFZYM=g@mail.gmail.com>
 <Z6YMDwflaxCFdnoc@smile.fi.intel.com>
 <CAMRc=McATQEVKrh=Pi6u8tSgQac85YoT=U8X6WrdRW8mXgUSyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McATQEVKrh=Pi6u8tSgQac85YoT=U8X6WrdRW8mXgUSyw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 07, 2025 at 02:43:21PM +0100, Bartosz Golaszewski wrote:
> On Fri, Feb 7, 2025 at 2:35 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Feb 07, 2025 at 09:46:31AM +0100, Bartosz Golaszewski wrote:
> > > On Tue, Feb 4, 2025 at 6:57 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:

...

> > > >  /**
> > > > - * for_each_hwgpio - Iterates over all GPIOs for given chip.
> > > > + * for_each_hwgpio_in_range - Iterates over all GPIOs in a given range
> > > >   * @_chip: Chip to iterate over.
> > > >   * @_i: Loop counter.
> > > > + * @_base: First GPIO in the ranger.
> > > > + * @_size: Amount of GPIOs to check starting from @base.
> > > >   * @_label: Place to store the address of the label if the GPIO is requested.
> > > >   *          Set to NULL for unused GPIOs.
> > > >   */
> > > > -#define for_each_hwgpio(_chip, _i, _label) \
> > > > +#define for_each_hwgpio_in_range(_chip, _i, _base, _size, _label)                      \
> > > >         for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i); \
> > > > -            *_data.i < _chip->ngpio; \
> > > > +            *_data.i < _size;                                                          \
> > > >              (*_data.i)++, kfree(*(_data.label)), *_data.label = NULL) \
> > > >                 if (IS_ERR(*_data.label = \
> > > > -                       gpiochip_dup_line_label(_chip, *_data.i))) {} \
> > > > +                       gpiochip_dup_line_label(_chip, _base + *_data.i))) {}           \
> > > >                 else
> > >
> > > Can you add a kerneldoc here as well, please?
> >
> > Sure, but it will duplicate the above.
> 
> Will it though? It's a separate macro with different semantics.

With 80%+. Whatever, I'll add it.

-- 
With Best Regards,
Andy Shevchenko



