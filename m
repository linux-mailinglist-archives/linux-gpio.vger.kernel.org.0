Return-Path: <linux-gpio+bounces-771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB927FF04B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 14:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2E26B20E63
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 13:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4988A47A77;
	Thu, 30 Nov 2023 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7d27TCt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED7EE6;
	Thu, 30 Nov 2023 05:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701351473; x=1732887473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5rtCX17/k+zofij+xAALMQsx8mdwkuAUwBhFCZtCfjg=;
  b=N7d27TCtAR3rU6j1c+hFtMd+TX4ujpz5hyfoAvRZIDab4Kq4cGNuaTD1
   oRKod6BFpSj/EIo1DJZI/F2vcEiNHhrA/wkSE6/CwbEW5FdgfemVS6Bgg
   5En8H8WIen1xNiXtElhZC8LP+4oOms5QformSMXmXg2JMxjd1EYTEBb5i
   Pk0aH0iY2MsE/Uc2V4k2PomupRvgXeNmB+NYl/PDUtZRRqWWS50eoiLVW
   SLx2RM09Ha4vJh1nPOOKOZ8LypbVx9nweR43FIprzhC8eHYFFlZSnVPYl
   mRvSI0wzoJPBYoELKiv7H6k/HTkpqqe5OtZ+KoqRCbtPKm1CBJ65iqUjI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="396129814"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="396129814"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 05:37:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="887242847"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="887242847"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 05:37:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8hEi-00000000i0k-3FKZ;
	Thu, 30 Nov 2023 15:37:48 +0200
Date: Thu, 30 Nov 2023 15:37:48 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: sim: implement the dbg_show() callback
Message-ID: <ZWiQLEz6P3vbZgx0@smile.fi.intel.com>
References: <20231130104023.11885-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130104023.11885-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 30, 2023 at 11:40:23AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Provide a custom implementation of the dbg_show() callback that prints
> all requested lines together with their label, direction, value and
> bias. This improves the code coverage of GPIOLIB.

...

> +#else
> +#define gpio_sim_dbg_show NULL
> +#endif /* CONFIG_DEBUG_FS */

I;m wondering if you can use PTR_IF() instead of this ugly ifdeffery.

-- 
With Best Regards,
Andy Shevchenko



