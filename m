Return-Path: <linux-gpio+bounces-19037-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 453ECA9242D
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 19:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34AEC16659E
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 17:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686702561B7;
	Thu, 17 Apr 2025 17:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EApIwmRK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D37253928;
	Thu, 17 Apr 2025 17:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744911521; cv=none; b=W4ikuh3CPzNzi7PwQ4LxwwNaU6CUmDnIbHLV6Vdqk3ouFMXny7cPARxQrekul6mxdheeMaQ7U6sB10FWrh7KDILwz+ynQVm0AZVEOLgOp5tBJKfTXClxTNGD1O3AGiaos4FnWR0hFVfuztrkmsCKSxqoShiXyQaWn9U1vjuXpmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744911521; c=relaxed/simple;
	bh=aBBES7qWAwrLY1U9W4TcOgMEondA+0Z/D1I4wcYL/K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnUQ/dYtpPdf8gpO89oBCujfzj48f/FnIfAZdzDtYWAd9e61ccSwP5GpGVlod1wn2tSH5BvqpgkJMrcTMMOE2XjVkzBBZ4DSLi2xrqMY0I9TyNkSYPwSbKN2eN8RZceAAe4A5yDY0ckEgCsS4GMmdB+alI8GME9vKZXkz0hu2K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EApIwmRK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744911519; x=1776447519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aBBES7qWAwrLY1U9W4TcOgMEondA+0Z/D1I4wcYL/K4=;
  b=EApIwmRKKUnAtQluYonLqYjb6PvDWSyu3KlksdrFEXk0z52nTLQx/TdX
   iFcdCGk0BA0bIG/NKpFTIOdn/5wj3NTAl5WIBkYn0aYxxCGIb446uqs43
   rJcqbo8dXUXOVCDUtmvgaxqtmepbZMcInu0k5zen+xtQ2T2lJwXH/J3iA
   C/v5i93JFyx4+v/4k+HpATJav0c8is6S9tZfqttNgcO1l0XrPfpT3S9Lj
   axo18WpZgiMj3sI66tRGb+6aG2Oi8sts26Z3iBTM6FwTnvUqJLInDUjdL
   ET5SVr/tjgh2EhvQUhZVYX39RwEDXK2Lfq7h0QsquDDTwy71PrbGIFP7m
   w==;
X-CSE-ConnectionGUID: PqujK4iZS7OmObZ4t4eyFg==
X-CSE-MsgGUID: DylYVFxJSxCbkwDf1yuWyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57185898"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57185898"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:38:39 -0700
X-CSE-ConnectionGUID: /Jww+DIbQQCwjuaWkg/lCA==
X-CSE-MsgGUID: 0uzxvsNNSBGFgt51Y0Nusg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="130827780"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:38:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u5TC5-0000000DGlm-2S6L;
	Thu, 17 Apr 2025 20:38:33 +0300
Date: Thu, 17 Apr 2025 20:38:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH v3 08/10] gpio: aggregator: handle runtime registration
 of gpio_desc in gpiochip_fwd
Message-ID: <aAE8mY2YjWt4PB1o@smile.fi.intel.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-8-f40776bd06ee@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-8-f40776bd06ee@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 04:08:16PM +0200, Thomas Richard wrote:
> Add request() callback to check if the GPIO descriptor was well registered
> in the gpiochip_fwd before to use it. This is done to handle the case
> where GPIO descriptor is added at runtime in the forwarder.
> 
> If at least one GPIO descriptor was not added before the forwarder
> registration, we assume the forwarder can sleep as if a GPIO is added at
> runtime it may sleep.

...

> +int gpio_fwd_request(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
> +
> +	return fwd->descs[offset] ? 0 : -ENODEV;

ENODEV? Hmm... Why has that error code been chosen?

> +}

...

>  int gpio_fwd_register(struct gpiochip_fwd *fwd)
>  {
>  	struct gpio_chip *chip = &fwd->chip;
> +	unsigned int ndescs = 0, i;

Slightly better (from maintenance perspective) to decouple assignment as it's
not a standalone function that just counts them. So it means some code may
appear in between and in long-term someone might screw up with the initial
value for that.

>  	int error;

	ndescs = 0;

> +	for (i = 0; i < chip->ngpio; i++)
> +		if (fwd->descs[i])
> +			ndescs++;
> +
> +	/*
> +	 * Some gpio_desc were not registers. They will be registered at runtime

registered

> +	 * but we have to suppose they can sleep.
> +	 */
> +	if (ndescs != chip->ngpio)
> +		chip->can_sleep = true;

-- 
With Best Regards,
Andy Shevchenko



