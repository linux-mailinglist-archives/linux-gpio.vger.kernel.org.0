Return-Path: <linux-gpio+bounces-18204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F689A7A398
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 15:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF055174DA0
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 13:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117F724E01A;
	Thu,  3 Apr 2025 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ozb8z4Ec"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E48C24E005;
	Thu,  3 Apr 2025 13:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686562; cv=none; b=m/g+41jC673/O+JerOSqZD2QODJBnwiSSMv+zBLUqg6gzRTcUnBc98seMQSpaODDy8xEulFxX0+VT4hbhPMTQ50tqtvk1kPPlNEgdaY2IOa59X/VXkBMVQ1p+OXAhjGGhaNOZQT3rXrjbMWsfKOMzc0Qyw/SgkaPQdEa48QmvyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686562; c=relaxed/simple;
	bh=C7VRYWzNddoca4acdBZIqel7jkmqkVFDiHMafrNdhuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhePYMQbyZOUHWkvGWzeVK1ynprefq0A2qoKVkGae4eKwWbllujRqhfYgGiN/U77L7zjEZ/6uySOLmBggMGO8uN60Pnn9M5ynUm/Wb7apZ3tPdu+obcNwED+qk5Wg/y9gxF/zIzoZT5z+8QWH++/oUhqXoedG+Jzdx+AvXXfjl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ozb8z4Ec; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743686561; x=1775222561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=C7VRYWzNddoca4acdBZIqel7jkmqkVFDiHMafrNdhuk=;
  b=Ozb8z4EcPp5C0VnqeFSKHc1o4A331wl+M6Ek3U7nhceFOch2mYFQMMe8
   cp9w2iopoiEaf1Dh/uFyfWOA+k5bJdhGJ/KK1ZtPOpj4yGNzb4ea4pE1d
   SjDJ/lI9HMml6yrTtO5ZCh2lZd4s7jPBDEuy4tTpX6kI+inRfkYHtw9dY
   LyU94Yss62s+KHt+uOjimZFWgkaGFkasDW1E07zsEh0hzk8xJLggC91Xs
   6MdUtBrjjq/XN3Z/disbkydoJYU0UXVwyREljaerLP2x5KkWniiy5c+xD
   okSeegIsuAY/ml/CvuQa3PrQNE+AeD3eifLYA0d08RtmtBO6/gKloh/i4
   Q==;
X-CSE-ConnectionGUID: NCXc2+WQRAKPL7AVve7Kpg==
X-CSE-MsgGUID: 6W/kTf+fQ7S6zXcpUJZHZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55724061"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="55724061"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 06:22:40 -0700
X-CSE-ConnectionGUID: ckQIc8n/TdaResf7qN80oA==
X-CSE-MsgGUID: aCmbkv+OR7mtEzQdZbPIpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="126913377"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 06:22:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u0KWh-00000008ot5-2Iob;
	Thu, 03 Apr 2025 16:22:35 +0300
Date: Thu, 3 Apr 2025 16:22:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 1/1] gpiolib: Make gpiod_put() error pointer aware
Message-ID: <Z-6Lm_Aqe3-LS4lj@smile.fi.intel.com>
References: <20250402152000.1572764-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MfzRVy85NR_eSQc3ZX_OmgCRUKuBdd6TqCu=Adwh9drrA@mail.gmail.com>
 <Z-5BHzTEed607Afz@smile.fi.intel.com>
 <CAMRc=Mc12B-b-w6bJeOgwFvzbmaqzL+uT7vJssVYN4tMu3YpaQ@mail.gmail.com>
 <Z-5uJxij4jmhint3@smile.fi.intel.com>
 <CAMRc=MdPiz_YD451Arrm4mT-SwU_OdK1U-WozPxsvt11mHsLZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdPiz_YD451Arrm4mT-SwU_OdK1U-WozPxsvt11mHsLZQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 03, 2025 at 02:23:24PM +0200, Bartosz Golaszewski wrote:
> On Thu, Apr 3, 2025 at 1:17 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > > But this encourages people to get sloppy and just ignore
> > > > > error pointers returned from gpiod_get()?
> > > >
> > > > From where did you come to this conclusion, please? We have many subsystems
> > > > that ignore invalid resource on the release stage, starting from platform
> > > > device driver core.
> > >
> > > The fact that many people do something does not mean it's correct.
> >
> > And it doesn't tell it is incorrect either. We are going to conclude that there
> > are pros and cons on each of the approaches, but I don't see much a point in
> > yours, sorry.
> 
> My point is:

I understand your point, but I disagree with the omni appliance of 3.

> You get a descriptor with gpiod_get_optional(). You can get three
> types of a pointer back:
> 
> 1. Valid descriptor: you can use it in all GPIO consumer functions.
> 2. NULL-pointer: you can still use it in all GPIO consumer functions.
> They will act as if they succeeded. This is expected as this is how
> the "optional" functionality is implemented. Had it been written in
> rust, we'd do it better but we use the tools we have. It's very much a
> "valid" value to pass to gpiod routines.
> 3. IS_ERR() value. If you try to pass it to any of the GPIO consumer
> functions, they will return it back to you and print a warning. Why?
> Because it's an invalid object. And there's no reason to make
> gpiod_put() an exemption.

No, the release is special as it's used in error paths and there often
it is simpler for all just to ignore invalid pointers rather then put
a burden on the driver developers. The gpiod_set_*() and gpiod_get_*() over
_assumed requested_ descriptor of course should fail any attempt to be supplied
with an invalid pointer.

> You never could have used an IS_ERR()
> correctly. Look at what devres does - if it got an IS_ERR(), it never
> schedules a release action.

This is again unrelated. devres is an upper layer and we don't care about its
implementation which is logically correct since we assume to put on the list
only _valid_ resources.


> > > Many other subsystem scream loudly when that happens, so I would be ok
> > > with adding a big WARN_ON(IS_ERR(desc)).
> >
> > I disagree. This is not that case where passing an error pointer should be
> > an issue.
> >
> > > > > Also: all other calls error out on IS_ERR(desc) so why would we make it an
> > > > > exception?
> > > >
> > > > Because it's _release_ stage that participates in the cleaning up of
> > > > the allocated resources in error paths. It's a common approach in
> > > > the kernel. I would rather ask what makes GPIOLIB so special about it?
> > >
> > > Just because it's the release stage, does not mean you shouldn't care
> > > about the correctness of the consumer code. Passing an IS_ERR(descr)
> > > to any of the GPIO APIs can happen if the user ignores an error
> > > returned by gpiod_get(). That's not alright.
> >
> > Have you ever seen such a code in the cases when it's okay (like in platform
> > device driver users)? I do not. So, the above is based on the hypothetical
> > assumption that somebody will make silly things. If you _really_ care about
> > checking the error, add __must_check to the respective functions.
> 
> They already have but people do the following (like in the affected SPI driver):
> 
> struct driver_data *data = kzalloc();
> 
> Then elsewhere:
> 
> data->gpiod = gpiod_get();
> if (IS_ERR(data->gpiod))
>     return PTR_ERR(data->gpiod);
> 
> The data struct now contains the IS_ERR() value. I don't think it
> makes any sense for it to carry it around and I don't want to enable
> it.

It's up to the driver developer.

Again, if you want the result of gpiod_get() to be tested, mark it so.
That's why I think your initial point is mistargetting.

Ask yourself, why we don't fail kfree() on a NULL object? (from kfree() p.o.v.
it's an invalid one) Or if you want to be more precise in analogue with the
gpiod_get_optional(), consider

	p = kmalloc(0);
	kfree(p);

and this is valid code despite p being not NULL!

-- 
With Best Regards,
Andy Shevchenko



