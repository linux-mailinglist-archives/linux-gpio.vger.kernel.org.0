Return-Path: <linux-gpio+bounces-1461-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E812181323A
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 14:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA6B91C21789
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 13:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE7D5786B;
	Thu, 14 Dec 2023 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gCgpIgK5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8379111B
	for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2023 05:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702562000; x=1734098000;
  h=resent-from:resent-date:resent-message-id:resent-to:date:
   from:to:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=zKPcMKNBLeHW6dwGMo4dXzEnGw5ow/M15/TjNTUWIsw=;
  b=gCgpIgK56/8Yh+t+HWAgsUQrLdPbhIMdwfqPoxcrclfCxUI4aLDTvGWu
   DWoA6pnW50mI/OT1fbM66sZeuMaY6a1KqxfoE/EShA5mnw1V2cUoV97GX
   jdjh3opdwoZEwJebmSjHQCs/Ncvn4ys5KIthTMYulUhnTRnTM/HsGwHff
   y4ayWZm1r+pJDd3wWwUsxxJAZ06gGiNNQnSkOXqE2/jEgQw85qnAeEKtJ
   IcXEDzCchVQFdMp8TxWLPsX+HpFXfSslfiUpdmVo4XljR8HK9/Ncr1E2N
   HMdn9oHmpc1Co1SVBWOzwkgso9qaV1c/G2xewBpVQEexo6dPvGpEuS0Xn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1957331"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1957331"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 05:53:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="947581748"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="947581748"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 05:53:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rDm9K-00000005rDN-3l3s;
	Thu, 14 Dec 2023 15:53:14 +0200
Resent-From: Andy Shevchenko <andriy.shevchenko@intel.com>
Resent-Date: Thu, 14 Dec 2023 15:53:14 +0200
Resent-Message-ID: <ZXsIyn3kZ7W5s64i@smile.fi.intel.com>
Resent-To: brgl@bgdev.pl, linus.walleij@linaro.org, warthog618@gmail.com,
	linux-gpio@vger.kernel.org
Date: Fri, 8 Dec 2023 16:05:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 2/2] gpiolib: use a mutex to protect the list of GPIO
 devices
Message-ID: <ZXMiq3wDOt9zFzuX@smile.fi.intel.com>
References: <20231208102020.36390-1-brgl@bgdev.pl>
 <20231208102020.36390-3-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208102020.36390-3-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 08, 2023 at 11:20:20AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The global list of GPIO devices is never modified or accessed from
> atomic context so it's fine to protect it using a mutex. Add a new
> global lock dedicated to the gpio_devices list and use it whenever
> accessing or modifying it.

...

> While at it: fold the sysfs registering of existing devices into
> gpiolib.c and make gpio_devices static within its compilation unit.

TBH I do not like injecting sysfs (legacy!) code into gpiolib.
It makes things at very least confusing.

That _ugly_ ifdeffery and sysfs in the function name are not okay.

If you want do that, please create a separate change and explain the rationale
behind with answering to the Q "Why do we need all that and why is it better
than any alternatives?".

-- 
With Best Regards,
Andy Shevchenko



