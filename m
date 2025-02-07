Return-Path: <linux-gpio+bounces-15536-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5779EA2C3B4
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 14:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 588EF7A11D7
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 13:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6081F75A6;
	Fri,  7 Feb 2025 13:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEHttn8i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552371F7547;
	Fri,  7 Feb 2025 13:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738935317; cv=none; b=jF6kYB+t9nhW7th3NbypXi4OzPDWKdu5bMXntHadCRvTXJUrBjwgC3JcxtZxRSgwDb7P2p5iM/muEN3hdRHOMHSxtNJsIXiBEue3MatIOtBDIdm5mykAK1I2WsQr0shOcj4zcGAZNn923UmrEdtMGxZUJdpyAd3K3kBHgiIRoIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738935317; c=relaxed/simple;
	bh=ldm0khIcCzqlvD4DK/wkAAXFa/WOkw2pidwTPBpaRIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=auzxbqjpyBtJfq/kBZqychSpvBzN3hmbY594MwjM9XGcVqjyPwWnXvD/wY3XlCq7CDzyMXYvhZ54YaZwsLIH0e8AGXHv13c6GiHFSvItCyP9RYTsBW3pu8t2u7+HvQethuPFprKWklCLzKi9jpJzEEO9hu4Mu1qY/RltL5uMo2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEHttn8i; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738935315; x=1770471315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ldm0khIcCzqlvD4DK/wkAAXFa/WOkw2pidwTPBpaRIg=;
  b=EEHttn8i2fslPjpmB9k1kY/KKRQzS4zTrCQXjj7hWH82aausRQjG9qYC
   AiY6wGmb0S4PIcvYf4fQE3gXT/ScLr9MGFfQkjSR7p0lIU+hUT1T6LlMF
   vm99CrB2occOALWuxvD4NRr3OdFcrX09DorVYV5S9/o5txxj5k1ENnYGj
   ycJ+C7ki8wVIGaLdFlF7fkybmRxPL14PJYbAzEDabLQELxI7YL87vfrxc
   gfeGLATt5ZbL5DMvxS6TyLlkN5e7Ei649d0CFsAG2JBYvtYTLcQYFlnO7
   RydKV7y1haWFl+vDOEETBC/ZYg8XJTjDjkbJDXs7MNzGyGJFtu5JSHELi
   w==;
X-CSE-ConnectionGUID: kfycEA1AQl6s4m/7xdsVSg==
X-CSE-MsgGUID: Xanp0swgQTifK9V8/1G5gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39482012"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="39482012"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 05:35:14 -0800
X-CSE-ConnectionGUID: Hk2PtjhES/qeZ9OVgqI4jA==
X-CSE-MsgGUID: rfx6e87mS7S9chGmmY8A1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="112155528"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 05:35:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tgOVj-000000095pi-0ydy;
	Fri, 07 Feb 2025 15:35:11 +0200
Date: Fri, 7 Feb 2025 15:35:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpiolib: Deduplicate some code in
 for_each_requested_gpio_in_range()
Message-ID: <Z6YMDwflaxCFdnoc@smile.fi.intel.com>
References: <20250204175659.150617-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MeS1gCP2aNKs9xydqLQQnVbWHbVoSqTyLzVcENDFZYM=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeS1gCP2aNKs9xydqLQQnVbWHbVoSqTyLzVcENDFZYM=g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 07, 2025 at 09:46:31AM +0100, Bartosz Golaszewski wrote:
> On Tue, Feb 4, 2025 at 6:57 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> >  /**
> > - * for_each_hwgpio - Iterates over all GPIOs for given chip.
> > + * for_each_hwgpio_in_range - Iterates over all GPIOs in a given range
> >   * @_chip: Chip to iterate over.
> >   * @_i: Loop counter.
> > + * @_base: First GPIO in the ranger.
> > + * @_size: Amount of GPIOs to check starting from @base.
> >   * @_label: Place to store the address of the label if the GPIO is requested.
> >   *          Set to NULL for unused GPIOs.
> >   */
> > -#define for_each_hwgpio(_chip, _i, _label) \
> > +#define for_each_hwgpio_in_range(_chip, _i, _base, _size, _label)                      \
> >         for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i); \
> > -            *_data.i < _chip->ngpio; \
> > +            *_data.i < _size;                                                          \
> >              (*_data.i)++, kfree(*(_data.label)), *_data.label = NULL) \
> >                 if (IS_ERR(*_data.label = \
> > -                       gpiochip_dup_line_label(_chip, *_data.i))) {} \
> > +                       gpiochip_dup_line_label(_chip, _base + *_data.i))) {}           \
> >                 else
> 
> Can you add a kerneldoc here as well, please?

Sure, but it will duplicate the above.

> > +#define for_each_hwgpio(_chip, _i, _label)                                             \
> > +       for_each_hwgpio_in_range(_chip, _i, 0, _chip->ngpio, _label)

-- 
With Best Regards,
Andy Shevchenko



