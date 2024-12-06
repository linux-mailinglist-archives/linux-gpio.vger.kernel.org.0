Return-Path: <linux-gpio+bounces-13584-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF679E7490
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 16:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F65D2872A4
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 15:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA3520B80F;
	Fri,  6 Dec 2024 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzS0b4cg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3B5203710
	for <linux-gpio@vger.kernel.org>; Fri,  6 Dec 2024 15:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733499616; cv=none; b=M7brbS5B2v3gY2INMkX+YP7hLM654dfS7UEUVLSquUrgajbXITvZ+BYYDEr2C47IfxdpdBbSzjxQhMdbbmtAYHCmlgzUnOy01cLYUGw5WK17razW0w0XHt5Pjox+O4ZkiPXrBnSnzfacHvHFI9AFZO8ClOdT7WSf19rVqZTpP9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733499616; c=relaxed/simple;
	bh=kHu+0cc5Z7W4wo+rOxq7Uwo8DJsSNeig+Y64PM6eb2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jzmTiTGSLM3Ycb4ren4W6Nqo2/+ZHpMspGxVpS7uZT0NPeU1CXcmMQ2rTx61LB0BZoz5Tdjmj24Gl2Z1dmmwtr88lbn1Amcefu/lWuefWPpcvLZ1ime20sv53QIdYqXX4h6dIt2r6uzGNMwQE3sGFBauAxQU3FJtkm1txE44VI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzS0b4cg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733499615; x=1765035615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kHu+0cc5Z7W4wo+rOxq7Uwo8DJsSNeig+Y64PM6eb2o=;
  b=XzS0b4cgqoG9mExGLN3DFez5Rjsz3QqOhu7296IjDhGM8iA7OzyrL9BW
   ZdXTXdIfWLSeTaHiyhdoVev2N0dggZ3NoMggQsl/AiltxoUmCtJqEk1vm
   OrjWAviHlbZOZ5j+vs/SOEL3aZIqPFO5U9sElkt1I3bLYuOjvZ+1FRmN5
   plEijnNRJLSUG4Ih+vWWFWGaEpJ6WLzWg5nfM2dNo/9PJRCRJpAK+yDU+
   RGEO6SzgI1Ritb+ioyGAlpypgF7wBUx1SybtGaDDqcA6DKcaRQCegrEKO
   AiPvlvEoRtxl56JRNbIwa+86thg0kDhEmMqZofA7LoPIJ5vxxmskxavNv
   Q==;
X-CSE-ConnectionGUID: 36IthgkvSk2x4nVQ4gXQ2Q==
X-CSE-MsgGUID: ArBYxbN1T72NWVMkXa1L2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="51392393"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="51392393"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 07:40:14 -0800
X-CSE-ConnectionGUID: 7GNErL3jRBybr51rd4gABA==
X-CSE-MsgGUID: +u74lSh0RSqkchd2tN9DAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="117690175"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 07:40:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1tJaR8-00000004YVI-0HxX;
	Fri, 06 Dec 2024 17:40:10 +0200
Date: Fri, 6 Dec 2024 17:40:09 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: gpiolib: fix refcount imbalance in
 gpiochip_setup_dev()
Message-ID: <Z1Ma2WvvnQqzcKVh@smile.fi.intel.com>
References: <20241204122152.1312051-1-joe@pf.is.s.u-tokyo.ac.jp>
 <Z1GoskmQH0_FhxID@black.fi.intel.com>
 <CAMRc=Me004KgVZDVVCD1r_yDfpRjVsw2TAJCGiHd+TEiQ4xW6A@mail.gmail.com>
 <1cbec5a7-6c83-4abe-8532-041dbf891e16@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cbec5a7-6c83-4abe-8532-041dbf891e16@pf.is.s.u-tokyo.ac.jp>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 06, 2024 at 05:53:25PM +0900, Joe Hattori wrote:
> Thank you for the review. And yes, I should have paid more attention to the
> code, sorry. I have reflected the reviewed points in the V2 patch, so please
> take a look at it.

I can't look at something I haven't received.

> On 12/5/24 22:20, Andy Shevchenko wrote:
> > On Wed, Dec 04, 2024 at 09:21:52PM +0900, Joe Hattori wrote:
> >> In gpiochip_setup_dev(), the refcount incremented in device_initialize()
> >> is not decremented in the error path. Fix it by calling put_device().
> >
> > First of all, we have gpio_put_device().
> 
> Fixed in the V2 patch.
> 
> > Second, what the problem do you have in practice? Can you show any
> backtrace?
> > Third, how had this change been tested?
> 
> I am building a static analysis tool, and it reported this reference leak. I
> overlooked that it still reported the same error after this patch, and it is
> fixed in the V2 patch. If a backtrace is needed, I will try.

You missed the guidelines / rules about static analysis tools:
Documentation/process/researcher-guidelines.rst.

> > Looking at the current code I noticed the following:
> > 1) gpiochip_add_data_with_key() has already that call;
> 
> Thank you for pointing out, the call has been removed in the V2 patch.
> > 2) gpiochip_setup_devs() misses that call.
> 
> I was not sure if the gpiochip_setup_devs() should have an error path to
> remove all the registered GPIO devices when a single registration fails,

I don't think so. But that failed device should be put. It's the only issue
I see with the current code. If I'm wrong, prove it and elaborate in the commit
message (backtraces will be very helpful).

> thus it is not addressed in the V2 patch. If such a cleanup path is needed,
> please let me know.
> 
> > This effectively means that you inroduce a regression while fixing a bug.
> >
> > The GPIO device initialisation is non-trivial, please pay more attention
> to the
> > code.
> >
> > Bart, can this be removed or reverted before it poisons stable?

-- 
With Best Regards,
Andy Shevchenko



