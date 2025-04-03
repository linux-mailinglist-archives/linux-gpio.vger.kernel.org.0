Return-Path: <linux-gpio+bounces-18196-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 207C1A7A1BF
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 13:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A99997A6819
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 11:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6912459FB;
	Thu,  3 Apr 2025 11:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQ7MUWZO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C996481B6;
	Thu,  3 Apr 2025 11:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743679022; cv=none; b=GE++nZvXgq3Aj0pmuLY2UrfBvpDWia6mP3nMAJzSWKCUkEZ4oWfCnjWv+o9V7FEe5H236M2wNajhoAqDd8JllLQvFhrq9cHWYiNQaFW09u3cP8J5BXrQj1QYx5Jp+74C7yAgK9JrS/Z1JmHkrD5JDniy14b1KfU8cbZHZPQQqk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743679022; c=relaxed/simple;
	bh=ur1JgpihFBqY1SpsszuYB5RYiGBwwmdeY8pW4WTMuuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RiULUHAXfjR57JwIV6HUCoVKupW07l6U81oVYTUf6sd1Tm9Rq9c/Bycf+HhiHwVtKP1QPqRisbNuMj/DI0+jHtnVy3XaVAxjB35N6m2mOFKZVF8gkZaLKLQyLgSfspeMrqTjq4VRjOs67cS6HD78X2dLDVHhaxDX48TIrsssn5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQ7MUWZO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743679021; x=1775215021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ur1JgpihFBqY1SpsszuYB5RYiGBwwmdeY8pW4WTMuuU=;
  b=VQ7MUWZO+Q9U3NQxzc5yfShT/Uv8Vq6qA20q/Ma8P7G74fO0yFUlEXQE
   MOC/7hnYjMhM3C2Z74Jrkvs+1Y4KdrvnD0cXebkOv0ESq0xcB8W25ueUB
   ewVH8HwOi6FqtB77r/70KMQwt/akwobcv59M/wfCTsGheHXocpdvef3Px
   pGn+I2syxVdy0IWBhvIZrOU9FaUfy0wN1Shd8+i6ylRlPZAagFERSVYve
   OXttl3TnfUG8SHtcOjfCOCGDj3Br+hNCuMcHhiIihsMMYKSLDyAV5Vz+F
   BTl5BUM52C/aNuoJ+XaC7WHKQcI/0yyy0xl0btoXnaatBJ6W2ZZPE13j+
   g==;
X-CSE-ConnectionGUID: r+p0dxpsS7O46aTusSuc7Q==
X-CSE-MsgGUID: mB+HAcSdS5Gs4noCHzIF+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56447289"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="56447289"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 04:17:00 -0700
X-CSE-ConnectionGUID: ys+iyngxQxScXHcVzoAzDw==
X-CSE-MsgGUID: UpXelSBlRMimi/ZDSfaJlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="150179467"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 04:16:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u0IZ5-00000008mk0-1lar;
	Thu, 03 Apr 2025 14:16:55 +0300
Date: Thu, 3 Apr 2025 14:16:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 1/1] gpiolib: Make gpiod_put() error pointer aware
Message-ID: <Z-5uJxij4jmhint3@smile.fi.intel.com>
References: <20250402152000.1572764-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MfzRVy85NR_eSQc3ZX_OmgCRUKuBdd6TqCu=Adwh9drrA@mail.gmail.com>
 <Z-5BHzTEed607Afz@smile.fi.intel.com>
 <CAMRc=Mc12B-b-w6bJeOgwFvzbmaqzL+uT7vJssVYN4tMu3YpaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mc12B-b-w6bJeOgwFvzbmaqzL+uT7vJssVYN4tMu3YpaQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 03, 2025 at 10:20:08AM +0200, Bartosz Golaszewski wrote:
> On Thu, Apr 3, 2025 at 10:04 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Apr 03, 2025 at 08:58:09AM +0200, Bartosz Golaszewski wrote:
> > > On Wed, Apr 2, 2025 at 5:20 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:

> > > > When non-optional GPIO is requested and failed, the variable that holds
> > > > the (invalid) descriptor can contain an error pointer. However, gpiod_put()
> > > > ignores that fact and tries to cleanup never requested descriptor.
> > > > Make sure gpiod_put() ignores that as well.
> > > >
> > > > While at it, do the same for the gpiod_put_array().
> > > >
> > > > Note, it arguable needs to be present in the stubs as those are usually
> > > > called when CONFIG_GPIOLIB=n and GPIOs are requested using gpiod_get_optional()
> > > > or similar APIs.
> >
> > > I'm not a fan of this. Silently ignoring NULL makes sense in the
> > > context of _optional() calls where we want to do nothing on GPIOs that
> > > aren't there.
> >
> > > But this encourages people to get sloppy and just ignore
> > > error pointers returned from gpiod_get()?
> >
> > From where did you come to this conclusion, please? We have many subsystems
> > that ignore invalid resource on the release stage, starting from platform
> > device driver core.
> 
> The fact that many people do something does not mean it's correct.

And it doesn't tell it is incorrect either. We are going to conclude that there
are pros and cons on each of the approaches, but I don't see much a point in
yours, sorry.

> Many other subsystem scream loudly when that happens, so I would be ok
> with adding a big WARN_ON(IS_ERR(desc)).

I disagree. This is not that case where passing an error pointer should be
an issue.

> > > Also: all other calls error out on IS_ERR(desc) so why would we make it an
> > > exception?
> >
> > Because it's _release_ stage that participates in the cleaning up of
> > the allocated resources in error paths. It's a common approach in
> > the kernel. I would rather ask what makes GPIOLIB so special about it?
> 
> Just because it's the release stage, does not mean you shouldn't care
> about the correctness of the consumer code. Passing an IS_ERR(descr)
> to any of the GPIO APIs can happen if the user ignores an error
> returned by gpiod_get(). That's not alright.

Have you ever seen such a code in the cases when it's okay (like in platform
device driver users)? I do not. So, the above is based on the hypothetical
assumption that somebody will make silly things. If you _really_ care about
checking the error, add __must_check to the respective functions.

-- 
With Best Regards,
Andy Shevchenko



