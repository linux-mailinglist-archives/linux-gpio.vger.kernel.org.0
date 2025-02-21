Return-Path: <linux-gpio+bounces-16397-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9BCA3FBCA
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 17:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02F44880DF0
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 16:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FEFC1F3FF1;
	Fri, 21 Feb 2025 16:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBf+GFvr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BD61F1506;
	Fri, 21 Feb 2025 16:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155638; cv=none; b=DHu/2PARD5UjKE4SK00J6szlrsTlpHiY+KEsYrdpZINaPpCgktm3K5ocCp6COLsR8QpaFRKOgQBbOf8xyVEIuOxa4IxvEou3JAHCmHRQ5SjzXUPnIKn/np97AppX6wMesh/xcKo0DNfW1ENdQ7gRHtjzhS2rddf+dzCbS/4p1vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155638; c=relaxed/simple;
	bh=xDgKUa6FUU/WD8SJVO0id7N2H6JX+s0w4WOQanS2uGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGyLJn8j8Rzmh5OLpkB8soeR5pdXihRjFbJuvMtnq16ABuMue/gieDzCvDPCjJPfn1t+LNZ5IDvrKoCX/WLW9gPAsy8Lf2V//JgtD3hl6zlVDhVuIEGzeUGfyXeYRetJsURSGPaJf6AVJyB86iLYk2WBFXLhKTQKHcVSS36S+0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBf+GFvr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740155637; x=1771691637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xDgKUa6FUU/WD8SJVO0id7N2H6JX+s0w4WOQanS2uGU=;
  b=DBf+GFvrR9Dhml9Vk4PzBQz6fsYa7n5z0zErlZJXV4gqxK/ea285uqLB
   QTwm0lmwISH3ROevWWIdMijSboxxtFHi73K/L9RLh01FvZ1qBhy+sMrOt
   vNHCL5aIEGBLBVAdHs9cOBArlkusTmTTGq6Ct48pRwt2LQo/egMUJOWrU
   M8PES7T3x0ZNTTuKHKL3nD9HkXL2fU5BK6j91hqGZWRWYN2XAbNWzRjMV
   HzNIzYsX8haeBYaVB10KfENbIj1Cnz0qQdoUhd0CQbSEtl9iZ5vzrgk7h
   CtWqfUCL1WyyUoyYsmN4xbsse2i5VLqoaXJ9JUpfnGmlYqj4qaXZi8PkZ
   g==;
X-CSE-ConnectionGUID: LI5X+QDyQOm4DEy9gjPIeA==
X-CSE-MsgGUID: qc60KEu2RSyde/L8qb5eHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44626362"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="44626362"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 08:33:57 -0800
X-CSE-ConnectionGUID: oNN6IyQwQTq6U1o9Tb7ccQ==
X-CSE-MsgGUID: QyU/5dwSS5+VH+NG5P2mTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116324844"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 08:33:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tlVyK-0000000DgxC-0RN6;
	Fri, 21 Feb 2025 18:33:52 +0200
Date: Fri, 21 Feb 2025 18:33:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpiolib: use the required minimum set of headers
Message-ID: <Z7iq74pfOT-4gmIy@smile.fi.intel.com>
References: <20250221123001.95887-1-brgl@bgdev.pl>
 <Z7ijLu5Z9MiW4IAp@smile.fi.intel.com>
 <CAMRc=MeJn4URkXoCTC_tpTKfQ7OL=BjytcY-k4BB2QUwsVXnBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeJn4URkXoCTC_tpTKfQ7OL=BjytcY-k4BB2QUwsVXnBQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 21, 2025 at 05:17:50PM +0100, Bartosz Golaszewski wrote:
> On Fri, Feb 21, 2025 at 5:00 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Fri, Feb 21, 2025 at 01:30:01PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Thanks for taking my suggestion into account!
> >
> > > Andy suggested we should keep a fine-grained scheme for includes and
> > > only pull in stuff required within individual ifdef sections. Let's
> > > revert commit dea69f2d1cc8 ("gpiolib: move all includes to the top of
> > > gpio/consumer.h") and make the headers situation even more fine-grained
> > > by only including the first level headers containing requireded symbols
> > > except for bug.h where checkpatch.pl warns against including asm/bug.h.
> >
> > I'm not sure we should consider the checkpatch.pl in this case.

...

> > This change is definitely an improvement from the current state in your
> > gpio/for-next branch, if you are really strong about linux/bug.h, let me more
> > time to check that header and see if there any potential issues.
> 
> Sure, take your time. For some reason checkpatch does recommend using
> linux/foo.h over asm/foo.h if the former includes the latter but I
> don't know the history of this.

I know the history of this, lately (last year) it was again a discussion result
of which is linux/unaligned.h. But this recommendation is only for the leaf files
or custom (local) headers and code, it doesn't fully applicable to the globally
accessed headers, like gpio/consumer.h. I consider this as false positive by
checkpatch.

Yes, I will check more on the header nevertheless.

-- 
With Best Regards,
Andy Shevchenko



