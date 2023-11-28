Return-Path: <linux-gpio+bounces-593-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A66A7FBEEF
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 17:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7D012827BB
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 16:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB554D127;
	Tue, 28 Nov 2023 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fW/qwdbm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8587D12A;
	Tue, 28 Nov 2023 08:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701187588; x=1732723588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bwo7ggHdQ8ZPC43AT1LI2aW1ivPm7/3+xNO0T21w5Gs=;
  b=fW/qwdbmdT3sqiqU2yOcJ8Ei/gaeuWTQGnFvCYBMH+ed/JSfPzvx5Ujj
   CwhID1jQFnWVZU8xm9uWSyoS11WHIC8UOid2BnlXcSEfUUUoCtxzj0rWh
   OH1r+WBKpYduXi2v62Fsr3/IHXMXDCBhEb3RHaqJeCaVbTvopnCzcD3/0
   JMiLcRX7p0nwFNlSp8je331mM2k3c3PNy6/u56GvaRoggWQPvwb8zFNnj
   R7xRWRJlxtUoNmk5czySFVCXOaNOYKirfhk2V4jGqUr6BAu89ZLY4Fls5
   xGkZp/sag/4RxqnuhHaP0lxIEjfKGTr5MDVJD+IyZ8JE4Nrn87miSwx42
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="457281923"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="457281923"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 08:06:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="839104227"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="839104227"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 08:06:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r80bO-00000000CjM-2Wuh;
	Tue, 28 Nov 2023 18:06:22 +0200
Date: Tue, 28 Nov 2023 18:06:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] gpio: sysfs: fix forward declaration of struct
 gpio_device
Message-ID: <ZWYP_uRWps9W0cVn@smile.fi.intel.com>
References: <20231127193716.63143-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127193716.63143-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 27, 2023 at 08:37:15PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The forward declaration for struct gpio_device should be provided for
> both branches of the #ifdef.

Oh, right.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



