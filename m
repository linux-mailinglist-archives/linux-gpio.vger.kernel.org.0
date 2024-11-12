Return-Path: <linux-gpio+bounces-12878-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E149C5BE3
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 16:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A5191F2219F
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 15:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50CF2003CF;
	Tue, 12 Nov 2024 15:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbVCxXdF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C705A1FF604;
	Tue, 12 Nov 2024 15:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731425445; cv=none; b=CiSU1HVYg56i5dmMRFi7BKkLLn0usDMgsqTaXjWV2KJEhwmiSqaXgOvu3wnKduI9Y41oxN2zqskLxcv1ii9t1iMmVQ+e5bkk3/QHJ0Ma1AtiawqGBqReNgta1nIBSTE70xG/YQANt5SqiPNjxp+LM7pZUTFUxQ/H3srj+dAVDzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731425445; c=relaxed/simple;
	bh=/VOzond0xQ7szk6/KKyNiKYHsl8+KcOsCirRMFddYYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSE2+EtcGhcIjsIN2qhh797ya2P4oiNZFi07ezMSnLnENRGqwJLxXqnw8ZhMR8IhnPWFaj968NM7Vx3QDR1N4IoJNkxhZDYuU3una35FEn4esWJaldygtRz3Xk48tKgtrKi/CNuJV+Dg9a6WY+ocwTS8fk+QK41Ez+4AWS7RPzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IbVCxXdF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731425444; x=1762961444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/VOzond0xQ7szk6/KKyNiKYHsl8+KcOsCirRMFddYYc=;
  b=IbVCxXdFK9G7SO07C6XxHGRedl3AD42Vi97Sf0KJ7gX0x0jXOKA24FHj
   4tE0DjH6jcEIactda1ucUqrMTsW7YpIe6WKUSRPNd9qBxpiQP9oz27yai
   NVoW7CVR+zmj/iqDNkLGF4WhL8yPPCnwGYbVHl3v5+mV7Nsf7/CEiq0SG
   J/YuHUo66Pum1Ltvkh56Rmrjec8w4OZYC0NDSpw1ikQQU20Gx+UJ417Mt
   DKHASZG/trskuZYwwJ737KHbEm0huYZLA9h2SlpiImflN70SmozLoZ66X
   Vq8Kab/+awMN7pfhk1ZmEoSN8qRJImqAQkiaBmjdV5CTREDGxbW3O8r7H
   Q==;
X-CSE-ConnectionGUID: FI3ul5MKRNeipOBzTAQZzw==
X-CSE-MsgGUID: Sg0zM4i0TkycvY9kpWPW7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="18876280"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="18876280"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 07:30:42 -0800
X-CSE-ConnectionGUID: UmoYofJpRSiSY5LHAFL43w==
X-CSE-MsgGUID: 50YBXTuWQr2uQRtMlSyfgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="87938433"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 07:30:41 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAsqk-0000000E2iI-3unZ;
	Tue, 12 Nov 2024 17:30:38 +0200
Date: Tue, 12 Nov 2024 17:30:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sai Kumar Cholleti <skmr537@gmail.com>
Cc: bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
	mmcclain@noprivs.com, stable@vger.kernel.org
Subject: Re: [PATCH v3] gpio: exar: set value when external pull-up or
 pull-down is present
Message-ID: <ZzN0nn6WFw2J8HTF@smile.fi.intel.com>
References: <ZykY251SaLeksh9T@smile.fi.intel.com>
 <20241105071523.2372032-1-skmr537@gmail.com>
 <ZyouKu8_vfFs20CB@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyouKu8_vfFs20CB@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 05, 2024 at 04:39:38PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 05, 2024 at 12:45:23PM +0530, Sai Kumar Cholleti wrote:
> > Setting GPIO direction = high, sometimes results in GPIO value = 0.
> > 
> > If a GPIO is pulled high, the following construction results in the
> > value being 0 when the desired value is 1:
> > 
> > $ echo "high" > /sys/class/gpio/gpio336/direction
> > $ cat /sys/class/gpio/gpio336/value
> > 0
> > 
> > Before the GPIO direction is changed from an input to an output,
> > exar_set_value() is called with value = 1, but since the GPIO is an
> > input when exar_set_value() is called, _regmap_update_bits() reads a 1
> > due to an external pull-up.  regmap_set_bits() sets force_write =
> > false, so the value (1) is not written.  When the direction is then
> > changed, the GPIO becomes an output with the value of 0 (the hardware
> > default).
> > 
> > regmap_write_bits() sets force_write = true, so the value is always
> > written by exar_set_value() and an external pull-up doesn't affect the
> > outcome of setting direction = high.
> > 
> > 
> > The same can happen when a GPIO is pulled low, but the scenario is a
> > little more complicated.
> > 
> > $ echo high > /sys/class/gpio/gpio351/direction
> > $ cat /sys/class/gpio/gpio351/value
> > 1
> > 
> > $ echo in > /sys/class/gpio/gpio351/direction
> > $ cat /sys/class/gpio/gpio351/value
> > 0
> > 
> > $ echo low > /sys/class/gpio/gpio351/direction
> > $ cat /sys/class/gpio/gpio351/value
> > 1
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Does this need to be applied, Bart?
Seems it is missed in your branches...

-- 
With Best Regards,
Andy Shevchenko



