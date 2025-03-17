Return-Path: <linux-gpio+bounces-17703-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F219CA659E3
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 18:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4F5E19C07BA
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 17:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FB31537CB;
	Mon, 17 Mar 2025 17:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoipQmU1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F313D191F92;
	Mon, 17 Mar 2025 17:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231091; cv=none; b=lXm0xkTlWNSv+HnMMT6uICKiAspyPSMLUKDhd9c0EfWtq23muVtCA3S196WYr6FNF+D6bI93AhB9KexqfqZQedNKAAiV62f24rQSYU2GgNoTwg/PwDYwPJ0tLrKjSCATmGez4akOkgRTkzJiOLdv7+Gp9n5XIqwm+5ahfOm8i0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231091; c=relaxed/simple;
	bh=S7K5tol0k7/0uioJVu6Ej4ugCuis6kd+0UfRokfW3/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xm5kaYOcjWCa1YGrM6eOT0He6HUD2tkEuvno83tWHBxqKwXt/+w5h0Qv4IlagygOePRve8m3EUZqM8gLLBnbBBhwcKMbxRHDu57E+M5g9j+J2AoKgxjQ9M6eMWQt4+7t8zaO96Jy0QgDEcdEw0rLtlxcdWRJ210dL6h31LnKKsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VoipQmU1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742231090; x=1773767090;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S7K5tol0k7/0uioJVu6Ej4ugCuis6kd+0UfRokfW3/M=;
  b=VoipQmU173ny/2d4A7LJWds1XFJFlZid1Rkp9gHaaAqAvs2Fo7TQuk56
   K3RA+dYtYapFJEqcywXoZqzzp2UmXWjlwMO2A0nlZcxZADt5UYu5NMYR9
   5h7SblKb/XSWEhKciKiNMmf2xEXGWitzMvANXXsb65SB45/R8aGOJTuP0
   LQ0yK2ijgeE7AAwjVCWwFw0kX2shOgOa4cB9KyXkyEGikqXznpzrhz1Ny
   IwL8yaldve5QHHl2LiDRly/vwLTQmYL0Gmvei159z/+PcHRLPUrec4078
   LaV8nq8s2QexNv1Gc6t+/dteyMiepbFuKJX3/OF7mEJr4UcBO2gZk1sUy
   g==;
X-CSE-ConnectionGUID: /ZJLPkFPRT2tB8Bp16pSBA==
X-CSE-MsgGUID: Md1X3YTJTj25xxyeu0gHeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="42586218"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="42586218"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 10:04:49 -0700
X-CSE-ConnectionGUID: CzFf9nnuR061A68i6JhRng==
X-CSE-MsgGUID: tYzu9Ls4SV6yENQAJhM3vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="127167782"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 10:04:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tuDtL-00000003Mjc-47u8;
	Mon, 17 Mar 2025 19:04:43 +0200
Date: Mon, 17 Mar 2025 19:04:43 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH RFC v2 2/6] gpio: aggregator: refactor the forwarder part.
Message-ID: <Z9hWKxbcHlhyiCmR@smile.fi.intel.com>
References: <20250317-aaeon-up-board-pinctrl-support-v2-0-36126e30aa62@bootlin.com>
 <20250317-aaeon-up-board-pinctrl-support-v2-2-36126e30aa62@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-aaeon-up-board-pinctrl-support-v2-2-36126e30aa62@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 17, 2025 at 04:38:00PM +0100, Thomas Richard wrote:
> Prepare the code to create a gpio-fwd library. This library will allow to
> create and register a gpiochip forwarder.

...

>  struct gpiochip_fwd {
> +	struct device *dev;
>  	struct gpio_chip chip;

Have you checked the code generation?
Also, is this new pointer the same as chip.parent?

>  	struct gpio_desc **descs;
>  	union {

>  };

...

> +static struct gpiochip_fwd *devm_gpiochip_fwd_alloc(struct device *dev,
> +						    unsigned int ngpios)

I would rather split as

static struct gpiochip_fwd *
devm_gpiochip_fwd_alloc(struct device *dev, unsigned int ngpios)

...

> +	fwd->descs = devm_kcalloc(dev, ngpios, sizeof(*fwd->descs),
> +				  GFP_KERNEL);

One line.

...

> +static int gpiochip_fwd_register(struct gpiochip_fwd *fwd)
> +{
> +	struct gpio_chip *chip = &fwd->chip;
> +	struct device *dev = fwd->dev;
> +	int error;
>  
>  	if (chip->can_sleep)
>  		mutex_init(&fwd->mlock);
>  	else
>  		spin_lock_init(&fwd->slock);
>  
> +	error = devm_gpiochip_add_data(dev, chip, fwd);
> +
> +	return error;

	return devm_...

> +}

...

Overall it looks and feels like this can be split to more simpler logically
isolated changes. At least I see that folding function parameters can be a
separate patch.

-- 
With Best Regards,
Andy Shevchenko



