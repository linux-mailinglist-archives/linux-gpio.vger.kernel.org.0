Return-Path: <linux-gpio+bounces-16235-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C16AA3C381
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 16:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0761189D949
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 15:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1231F30BE;
	Wed, 19 Feb 2025 15:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HhtHuPg8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ECA1F3FEC;
	Wed, 19 Feb 2025 15:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739978336; cv=none; b=KLOWpRYJrFbrs7egaH+Lcr1k8CuUBB7o2vXIRCKbjtl0J/9R+U7puuxl6YaCwjoH13gbf4slWF9VZwEpfMTTfecKCpu71Wt/dVgyg7d5WJI8n1S+zzvHPx+h3pQw1vaX/VT2kmADLCHu0Cz5KfRm4AAWxUIhI9vL4+GLWeQR0BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739978336; c=relaxed/simple;
	bh=Nl0GYuXHmj901hRqk+t7mBIs3Q4QkEavHk7DxpHU934=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aaGLiNS/FshgJaZrVsUCuAC7Qc7CTRa8IxBBvZhwHvvR1AWg3Dk5H1ZItG4FqWGxYzD8eSyZd53YWnmkjA+v6gGd6AiPiTTBV04LXdw8DttZJoeRk5yNUzI8DlXqW/brOk9RbCkofTv69wzYqx+z0JXzo1Y8ezJzt+ql7B/xlYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HhtHuPg8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739978335; x=1771514335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nl0GYuXHmj901hRqk+t7mBIs3Q4QkEavHk7DxpHU934=;
  b=HhtHuPg80kVwdX8XOYVD4dJsnK23uiwYyLcX83awvPv2lIYfI8veP4L1
   9qKorsHaphmJce+71Xi+xnNibd+SZ2kxWTac5Qc8JWML1RY6+FhUiSY5o
   HeMiF1FXb3j4W1a+tccJDLTWMV6A+AC+WtJq8/sjKooVBkmPIq/bxdfZI
   BVZ51TUbYv+aT3iewGP8Ilg7d6osaS0svUp3CiZO24wSIh12GbiIMzv+8
   /k+KCsHeUGIQEiN9vWmpslWyaxWRM/NtKmUNujnhA6iLYHTn1Nymf5yij
   z6H+MPsIt4JOTJfmbe6iTnqqQbkwMePsvNB4s/i/GrW8r8hu8LqK0yfGc
   A==;
X-CSE-ConnectionGUID: oABPzg6ARyCPgGtFaQJouA==
X-CSE-MsgGUID: xKlHXqeiT7eB8LOiaG3qXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="39952990"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="39952990"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 07:18:55 -0800
X-CSE-ConnectionGUID: friYgSNASTqrno0slJwQmg==
X-CSE-MsgGUID: ltJHHssXQRGvIrWxAC+Svg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="114724670"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 07:18:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1tklqc-0000000D3fS-1FQh;
	Wed, 19 Feb 2025 17:18:50 +0200
Date: Wed, 19 Feb 2025 17:18:49 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dipen Patel <dipenp@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	timestamp@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 1/2] gpiolib: move all includes to the top of
 gpio/consumer.h
Message-ID: <Z7X2We_IB2oShJ5w@smile.fi.intel.com>
References: <20250217103922.151047-1-brgl@bgdev.pl>
 <Z7XPcYtaA4COHDYj@smile.fi.intel.com>
 <CAMRc=Mf6HLoORvth1O=DLGXcSvq75-mbmPR0zXg6cm6VV-LVWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf6HLoORvth1O=DLGXcSvq75-mbmPR0zXg6cm6VV-LVWA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 19, 2025 at 06:35:59AM -0800, Bartosz Golaszewski wrote:
> On Wed, 19 Feb 2025 13:32:49 +0100, Andy Shevchenko
> <andriy.shevchenko@intel.com> said:
> > On Mon, Feb 17, 2025 at 11:39:21AM +0100, Bartosz Golaszewski wrote:
> >> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>
> >> We have several conditional includes depending on !CONFIG_GPIOLIB. This
> >> is supposed to reduce compilation time with CONFIG_GPIOLIB=y but in
> >> practice there's no difference on modern machines.
> >
> > It's not about modern machines. If every maintainer will think this way,
> > we end up in the complete and utter dead end with the headers.
> >
> > I believe you at least had read the cover letter for the infamous Ingo's series
> > about headers and how it speeds up the build (in some cases up to 70% on as you
> > said "modern machines").
> >
> >> It makes adding new stubs that depend on more than just GPIOLIB harder so
> >> move them all to the top, unduplicate them and replace asm/ with preferred
> >> linux/ alternatives.
> >
> > NAK.
> >
> > This makes dependency hell things much worse and this is a step back on the
> > untangling the current situation along with the slowing down the speed of the
> > build. Please. consider to revert or discard this patch.
> >
> > ...
> >
> >>  #include <linux/bits.h>
> >> +#include <linux/bug.h>
> >
> > Okay to replace, but not okay to move.
> >
> >>  #include <linux/err.h>
> >> +#include <linux/errno.h>
> >
> > Please, double check that it uses error codes from it, otherwise err.h includes
> > asm/errno.h with basic codes already.
> >
> >> +#include <linux/kernel.h>
> >
> > This is definitely no. Please, read what's written in the top of that file and
> > here is just a proxy for should come in the future a kind of might_sleep.h.
> > Do not move this one at all, please.
> >
> >>  #include <linux/types.h>


Fair enough. Does this look right to you?

For kernel.h definitely, for err.h you proved your point (but which was unclear
to me as the repetitions are already being in a number).

For bug.h looks also good. But I prefer to use asm/bug.h as it's the one that
provides the APIs. Note, the reference to the recommended linux/* headers
rather than asm/* applies to the C code or custom headers which are not under
include/*. The latter should be optimized to what it uses exactly.

So, summarizing the above I would return kernel.h to where it belongs and
move back to asm/bug.h.

-- 
With Best Regards,
Andy Shevchenko



