Return-Path: <linux-gpio+bounces-791-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 922627FF657
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 17:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BBC528176C
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 16:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDED4482E6;
	Thu, 30 Nov 2023 16:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VGekmoV8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A581510F1;
	Thu, 30 Nov 2023 08:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701362434; x=1732898434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xs55vRQmulcqUyGyX4R2MZh0xpaZmiwWD8Qq17sNE+0=;
  b=VGekmoV8BCKzpntOHOMSXys/vXLF46HfjWAe1FQIaaaRjgNv2AnEfe1Y
   pcjLHRTgGFzTL79OLUiC/Bt8yZJgRtao5GINcDmEnH4UksnNR3xoU3zqF
   RL4NYR+P0Fe2LxlpY+OKMbYYLO+Sy5AMX9bsh847FIywOtnMOhdz7Sju/
   iKG097ZICzc/fzHSVmaSoOVYSl0a8c/bal0RqLlqhj/gyeFun84Q8FaZO
   nsno7+8+KneXKvTXRXybbarbMI2pYJWV32Smf0VTPvawf9/eDCbwktNi1
   DA0T0lSG7fmIN9XDhi6Gz4h2ifF9Rm8K8D1vkS1WrCJxRRGamraHZv+zS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="392217598"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="392217598"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 08:40:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="1100992449"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="1100992449"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 08:40:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8k5W-00000000kQi-0Viy;
	Thu, 30 Nov 2023 18:40:30 +0200
Date: Thu, 30 Nov 2023 18:40:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 09/10] gpiolib: use gpiochip_dup_line_label() in
 for_each helpers
Message-ID: <ZWi6_WnOQZB0vgPL@smile.fi.intel.com>
References: <20231130134630.18198-1-brgl@bgdev.pl>
 <20231130134630.18198-10-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130134630.18198-10-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 30, 2023 at 02:46:29PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Rework for_each_requested_gpio_in_range() to use the new helper to
> retrieve a dynamically allocated copy of the descriptor label and free
> it at the end of each iteration. We need to leverage the CLASS()'
> destructor to make sure that the label is freed even when breaking out
> of the loop.

...

>  const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int offset);
>  char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset);
>  
> +

One blank line is enough.

> +struct _gpiochip_for_each_data {
> +	const char **label;
> +	int *i;

Why is this a signed?

> +};

...

> +DEFINE_CLASS(_gpiochip_for_each_data,
> +	     struct _gpiochip_for_each_data,
> +	     if (*_T.label) kfree(*_T.label),
> +	     ({ struct _gpiochip_for_each_data _data = { label, i };
> +	        *_data.i = 0;
> +		_data; }),

To me indentation of ({}) is quite weird. Where is this style being used
instead of more readable

	({
	   ...
	})

?

-- 
With Best Regards,
Andy Shevchenko



