Return-Path: <linux-gpio+bounces-9682-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B6296A3A4
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 18:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D93E7B27584
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 16:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39652189B8E;
	Tue,  3 Sep 2024 16:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TnOoktQz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917A826AFC;
	Tue,  3 Sep 2024 16:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725379704; cv=none; b=kk5j8LxhNoapxcOp4Q5l0Ql4wWtdJIlCgwgZ0AYFnbo2LrgxubmrfvwvAKkLVrIsgijoyTxrnweT68enhdwXFR8G52C1jwPwsjLU4d/40vaM3rw6/MKQ0MV/s9cxOxbeW3zVgkp0daN+GFbQuphY9r/UGyjAP7D784PZ6kM2/Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725379704; c=relaxed/simple;
	bh=pxnysqxPXUdGKI5yp8EEEzjs8U+bgSELKCdSY0UOul4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsX0zrl5oXJnDw/PTM735xxIwf4JZDKamLEXzEb3h2LidOSLe8+8edyXbHihrQkeU5uOR7fgmlr4raahBVMCjvV8EJGXcP6ttkA6HrMWN640wzREUcqbqz2/nCruO59dvq7WQfJ9odlKqCT0ikUNOkft7tOQ9GhzpYyO+c1+8d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TnOoktQz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725379703; x=1756915703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pxnysqxPXUdGKI5yp8EEEzjs8U+bgSELKCdSY0UOul4=;
  b=TnOoktQzECbYZ6mhyFxyh1E0jzsnaWfMrWQ5Htefwj8Stzjt2fwjQAjr
   cVSiO3bJkKu2DjOZvadYbwABXwnKbib9aOffo3EFpdoYNYUOFXLpbi4Py
   ChYvYw2SRBdpwOrTjNjOX86vWOzcvADeXGid1oGxZc16L9D/VllGzs8bT
   s/XnTC9tEeZRbImD4n3biCOPzqF2yLxthfJbbCKTAsogmtTcpu2F0AJtj
   IcbyTpDkKvws7wCEv+ebd1c2GjR3/JVHqqfUQoNQ9ENaIBOIgvo0+pit9
   iMPspTNiAqdPJayrCT93zFerXXA9PoI+abX8WppDP05lnkL2nicGAJwpV
   A==;
X-CSE-ConnectionGUID: koz2hhYTTkCz9DXZoZhXNg==
X-CSE-MsgGUID: h+od0L9OS/i2h+lpRs/i9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23794859"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23794859"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:08:18 -0700
X-CSE-ConnectionGUID: VjHNdM+QR86DcAMxALbX5g==
X-CSE-MsgGUID: hiim2caBSq2TwGNTiJyVDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="64986606"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:08:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slW4h-00000004lPS-2SUo;
	Tue, 03 Sep 2024 19:08:11 +0300
Date: Tue, 3 Sep 2024 19:08:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v3 11/12] gpio: rockchip: Set input direction when
 request irq
Message-ID: <Ztc0a3uSy7HmUWYJ@smile.fi.intel.com>
References: <20240903073649.237362-1-ye.zhang@rock-chips.com>
 <20240903073649.237362-12-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903073649.237362-12-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 03, 2024 at 03:36:48PM +0800, Ye Zhang wrote:
> Since the GPIO can only generate interrupts when its direction is set to
> input, it is set to input before requesting the interrupt resources.

...

>  static int rockchip_irq_reqres(struct irq_data *d)
>  {

> +	irq_hw_number_t hwirq;
>  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
>  	struct rockchip_pin_bank *bank = gc->private;
>  
> -	return gpiochip_reqres_irq(&bank->gpio_chip, d->hwirq);
> +	hwirq = irqd_to_hwirq(d);
> +	rockchip_gpio_direction_input(&bank->gpio_chip, hwirq);

	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
	struct rockchip_pin_bank *bank = gc->private;
	irq_hw_number_t hwirq = irqd_to_hwirq(d);

	rockchip_gpio_direction_input(&bank->gpio_chip, hwirq);

> +	return gpiochip_reqres_irq(&bank->gpio_chip, hwirq);
>  }

-- 
With Best Regards,
Andy Shevchenko



