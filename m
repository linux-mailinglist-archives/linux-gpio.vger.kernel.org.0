Return-Path: <linux-gpio+bounces-22402-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B07E8AED951
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 12:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A70BC3B0E88
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 10:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628902505BE;
	Mon, 30 Jun 2025 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+sC/Taw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACB924DD14;
	Mon, 30 Jun 2025 10:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277927; cv=none; b=LmPVo0tIS0lALk2ncJWa+Zu/lHkGiSNA5kEmzG8E2brATbVc/0QMZM+6fq8PV8JT2ur7TlcdEm749cf2ZHcisX+65lRMUkPPKkjNRQ5ZjKV4qR1mxQxIghibfs9/g/C3H7SUhTDPkTYkHgAmPGyzT0Cr44mWX9FPUitvLt6/xVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277927; c=relaxed/simple;
	bh=ZkxpKL7HyuHwZc3WHtxTqeW1UtBpp9vPfi99JxpA4x0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUQMFXIlNIWDYY0mHfQfUJLGgE0NRbzUqzptFnSHcuDG2gBXpM3vHT/sw4Lr5PKAxSWYPRVjmcVK5j8zHxoDFWrD+RE9m2IuFlniz6D+NKh1XM21Rzt8miu1LMPdaXvkwnhiv7RLFy3l+RxRCDwloHOfX7LZfyfinGDuQeLE9y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+sC/Taw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751277926; x=1782813926;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZkxpKL7HyuHwZc3WHtxTqeW1UtBpp9vPfi99JxpA4x0=;
  b=L+sC/TawAgQeNPkPK8y7kFW34JEVuxri6mWomA6oUq68M63BjbcKl1Hx
   7CHCgA/LyFALobNqfbqVtHJjir4ElMO9XMOErj6zybCpPxO9wt193yLNA
   +KjehdyJ73enhYeB6fh2FCqI4Qv9v4VkS8s9hctdIeqibP6jhhihBqw6h
   nV+o8Gc7oxj/9CC7X4ruUGrsl/qLA/sTYioYV2UQgkfVVdsZ8p4m0KmAG
   faGTCOQAdcWBJauvfQnaznXLerubQahQ3ae5nH1cfcjmxAJ8Ip5iA+7mO
   tmePRRq42G9LbmYVBU9u+WiT/35j2BzEykkYKhx2KQxsMmKdiT2JzvvVa
   A==;
X-CSE-ConnectionGUID: +T8jNg4cQ3iYTn9SCZfdLA==
X-CSE-MsgGUID: rBIyA9HNQNGFFHgtynfa5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="57277759"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="57277759"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:05:25 -0700
X-CSE-ConnectionGUID: 1fuKA7zuRaCBuxOw1I0PTQ==
X-CSE-MsgGUID: gduxAuPNSU6vx8Op17+ALA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="190588077"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:05:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uWBO3-0000000BGrq-1AeU;
	Mon, 30 Jun 2025 13:05:19 +0300
Date: Mon, 30 Jun 2025 13:05:19 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Kent Gibson <warthog618@gmail.com>,
	Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 4/9] gpio: sysfs: don't use driver data in sysfs
 callbacks for line attributes
Message-ID: <aGJhX9MhFAIopdwy@smile.fi.intel.com>
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
 <20250623-gpio-sysfs-chip-export-v2-4-d592793f8964@linaro.org>
 <aF67oAqLmRJzy4Zt@black.fi.intel.com>
 <CAMRc=MfXVTqncPsJ3QKqsGDi36gK4weWX1iygpqg1C-XinCEGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfXVTqncPsJ3QKqsGDi36gK4weWX1iygpqg1C-XinCEGg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 30, 2025 at 10:57:06AM +0200, Bartosz Golaszewski wrote:
> On Fri, Jun 27, 2025 at 5:41 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Mon, Jun 23, 2025 at 10:59:52AM +0200, Bartosz Golaszewski wrote:

...

> > Defining once something like
> >
> > #define to_gpiod_data() ...
> >
> > we may leave this and others as one-liners.
> 
> We'd need one per every attribute. Look closer, we do get a different
> attr address in every pair of callbacks.

I see, thanks for pointing that out.

...

> > > +     attrs[GPIO_SYSFS_LINE_ATTR_ACTIVE_LOW] =
> > > +                                             &data->active_low_attr.attr;
> >
> > What's the point of two lines here?
> >
> 
> I tend to stick with the 80 chars limit even though it was lifted.

The above looks just ugly. Saving one character on the line here doesn't
justify readability loss.


-- 
With Best Regards,
Andy Shevchenko



