Return-Path: <linux-gpio+bounces-12543-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FA09BBD8F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 19:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23B71B2187C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 18:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE5E1CB9F2;
	Mon,  4 Nov 2024 18:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIAiVhLd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1519C18622;
	Mon,  4 Nov 2024 18:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730746594; cv=none; b=njtsqEkDUt0KspR1m9ja1xcHsLHNm+F0wWHGyLnFqrVFcqL0AtAEkRZIKnPwXSnovXtGhhiHaqe3L/qnjWIPwxbpggUHt4xEjvwSbEsIqp5WLTozpWZd63ASpM5RfWYUWWmWYyBcwqN6Xcs9rY3EeZfZXB0rWBggCuwhPfPR/wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730746594; c=relaxed/simple;
	bh=dlpq+duPJ1CG+pBCveN6MNdRaH65rC9NIL0YlV5Jrnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACIJ/r55WAcrzhg6fkf+DWs5MnXFB+i15x+refllj/idCV11QUbs3HMbNcNw4LTHcCGqLtWAS+vF6K9ngGMY9/x7FK9WZZRb0WBV4bzp1tdgZwrHDXHdto+VrGkt94Jzpx87mmsHlmcq5RrM+IUIMhj/djnSRsp0unha2nF7qd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIAiVhLd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730746592; x=1762282592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dlpq+duPJ1CG+pBCveN6MNdRaH65rC9NIL0YlV5Jrnw=;
  b=oIAiVhLd+a3llMQlgjLJTIRetFUtjeJZA+IgZPDFB8HJxEY9UEbaZheO
   j2nWqKvkGjRUA/sJoADC/qYOkgkJgKQI9mtVthHen9b1ww2A+ODFyix7k
   80ooafI47lXBwwtxH3gkXkyC72Uu3P8oRRq0AcG5pSEmlR2lPomGUYN0n
   dlSVbgfkfhUjT6/U6unmNWuDrVC74+1gnT8DRyMgZjFuTTXldMaX1D6OO
   voelV9Zk5BNLjGmvpwzsz4vMkB2n1OyZrHsxl5OTBDO6/m4oWTOptSqnO
   QosvumnpMWvxT13O9kqxUG6mrDzshy59K7j1eS1cn7BN0aUT/uEa35jFP
   Q==;
X-CSE-ConnectionGUID: lkM3/3HsS9+Sh22v9GwCIw==
X-CSE-MsgGUID: dOisr6NtS9i/6totQecOJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41836003"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="41836003"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 10:56:32 -0800
X-CSE-ConnectionGUID: w40dMfBSREWe78G09dc0jw==
X-CSE-MsgGUID: eoY99VQZSmKKbmD/2pxLDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="84560952"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 10:56:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t82FX-0000000B9xn-1q9Q;
	Mon, 04 Nov 2024 20:56:27 +0200
Date: Mon, 4 Nov 2024 20:56:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sai Kumar Cholleti <skmr537@gmail.com>
Cc: bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
	mmcclain@noprivs.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: exar: set value when external pull-up or
 pull-down is present
Message-ID: <ZykY251SaLeksh9T@smile.fi.intel.com>
References: <ZyjLSmtwyPiD9-r5@black.fi.intel.com>
 <20241104154757.2306076-1-skmr537@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104154757.2306076-1-skmr537@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 04, 2024 at 09:17:57PM +0530, Sai Kumar Cholleti wrote:
> Setting GPIO direction = high, sometimes results in GPIO value = 0.
> 
> If a GPIO is pulled high, the following construction results in the
> value being 0 when the desired value is 1:
> 
> $ echo "high" > /sys/class/gpio/gpio336/direction
> $ cat /sys/class/gpio/gpio336/value
> 0
> 
> Before the GPIO direction is changed from an input to an output,
> exar_set_value() is called with value = 1, but since the GPIO is an
> input when exar_set_value() is called, _regmap_update_bits() reads a 1
> due to an external pull-up.  regmap_set_bits() sets force_write =
> false, so the value (1) is not written.  When the direction is then
> changed, the GPIO becomes an output with the value of 0 (the hardware
> default).
> 
> regmap_write_bits() sets force_write = true, so the value is always
> written by exar_set_value() and an external pull-up doesn't affect the
> outcome of setting direction = high.
> 
> 
> The same can happen when a GPIO is pulled low, but the scenario is a
> little more complicated.
> 

> $ echo high > /sys/class/gpio/gpio351/direction 

This...

> $ cat /sys/class/gpio/gpio351/value
> 1
> 
> $ echo in > /sys/class/gpio/gpio351/direction 

...this...

> $ cat /sys/class/gpio/gpio351/value
> 0
> 
> $ echo low > /sys/class/gpio/gpio351/direction 

...this...

> $ cat /sys/class/gpio/gpio351/value
> 1

> Fixes: 36fb7218e878 ("gpio: exar: switch to using regmap") 

...and this lines have a trailing space.

> Signed-off-by: Sai Kumar Cholleti <skmr537@gmail.com>
> Signed-off-by: Matthew McClain <mmcclain@noprivs.com>

Hmm... Missing Co-developed-by?
This SoB chain puzzles me a bit, the committer should go last AFAIR.

...

> +	/*
> +	 * regmap_write_bits forces value to be written when an external

regmap_write_bits()


> +	 * pull up/down might otherwise indicate value was already set

Missing period at the end.

> +	 */

...

Other than above LGTM.

-- 
With Best Regards,
Andy Shevchenko



