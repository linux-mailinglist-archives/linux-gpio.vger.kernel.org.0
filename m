Return-Path: <linux-gpio+bounces-792-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E567FF6B6
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 17:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BC1B281807
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 16:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C518442074;
	Thu, 30 Nov 2023 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fr0cjvmf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4475B1A3;
	Thu, 30 Nov 2023 08:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701362788; x=1732898788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j5Z3BZaa2KzJMDfJc7votNXQvTdpf9ABYw6btdhHDko=;
  b=Fr0cjvmf3JjxHDict5dQdrfhkDN0XYcnCjmVPzJRNd0QnnwTDlPDjIrT
   cARQatiC/EyhP1hxB4HSNHjKSpsTrHdgUQ6dvxjKjtZ3KvppvOkASDzej
   NbAdzgMmMiKPn1sWK+iBFN6gDx2DnjiA1+XAyDS1CscM79zA20a42Ypz3
   T2pMUYVi9AXdlnpbgBmS1dGBTuO/TRGc1HPPJ13dLy5dSwZ7u4+46P5ua
   cl/44TRcDLY1/IBKaocvKMh+aYL/NKVnQ6dGOdWpJe2dHhxxEEyq1HDAE
   VU7HTDsyYLrATQU+ZbNuKz7F99aEPMAXBxSUM+3BJeCJy0jFwtmT2oWRr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="12063772"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="12063772"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 08:46:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="745705348"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="745705348"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 08:46:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8kBD-00000000kVt-24gm;
	Thu, 30 Nov 2023 18:46:23 +0200
Date: Thu, 30 Nov 2023 18:46:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 10/10] gpiolib: remove gpiochip_is_requested()
Message-ID: <ZWi8X7pQpUm-nIpN@smile.fi.intel.com>
References: <20231130134630.18198-1-brgl@bgdev.pl>
 <20231130134630.18198-11-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130134630.18198-11-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 30, 2023 at 02:46:30PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We have no external users of gpiochip_is_requested(). Let's remove it
> and replace its internal calls with direct testing of the REQUESTED flag.

...

> -	cpy = kstrdup(label, GFP_KERNEL);
> -	if (!cpy)
> -		return ERR_PTR(-ENOMEM);
> +	scoped_guard(spinlock_irqsave, &gpio_lock) {
> +		if (!test_bit(FLAG_REQUESTED, &desc->flags))
> +			return NULL;

> +		cpy = kstrdup(desc->label, GFP_KERNEL);
> +		if (!cpy)
> +			return ERR_PTR(-ENOMEM);

You just introduced these lines earlier in the series, and here you moved
them again. With guard() instead it may be kept in a better shape.

> +	}

-- 
With Best Regards,
Andy Shevchenko



