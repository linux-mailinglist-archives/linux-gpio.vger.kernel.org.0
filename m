Return-Path: <linux-gpio+bounces-18189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B342A79D9F
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 10:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4F411738AF
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 08:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE33241678;
	Thu,  3 Apr 2025 08:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btOCtacp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F10354F81;
	Thu,  3 Apr 2025 08:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743667494; cv=none; b=IxVMRCd3a/r3hHnnhtUCNtupecLMR+MHmEPyirPQ5qD+YaUZx1Dzj3h4ZjeofcCQ6Cn+Jy4/1+Ft/+jQTeGGl364KFx5eah9nD3Ml7aSb4U0D2HUoBo9ZD4fyNUuOE7gKmcvQ+UhemrfU83A2yklmBh7hYtpHDeUF6jQ+pY+G9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743667494; c=relaxed/simple;
	bh=JVbI1Dn54KbuV9qUQjUy7ja97plsdfx1f9OQTp70h2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lIgn9V45jydTaO1EbbDcpO/qKEegzdgVKr8kXKgQDCFAj+1YnXqbOaz+jmgx70EztxxrhQRepgdvq7wDdF/xv0qQZixnHhflLVNm7n99TK64m0ewQpzoGIhuEMSW05uhKAN6oqtu9OdvT1SfdJ5tGXJn2C0kMvkfAifxdsxnbUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btOCtacp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743667493; x=1775203493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JVbI1Dn54KbuV9qUQjUy7ja97plsdfx1f9OQTp70h2g=;
  b=btOCtacpaKDgye0y8FHFEkoQWFY2ivkEYOWFKEdX9ALWRrIiZTslbUp8
   Al13I+R7hSs1q8saeN8TS4bnSZOPEr4xA8am9V4gz0rYW26sgRs8mc6UG
   TX1jniaDKD0iADSM1YdlhZw9n7KUGOR+17Yx7GEPfOPR5I4DOJDiHHXiH
   X4ujdLimmUNbCVoelx2Gq3k0VdUOAHqwq9ptiif12BrVl9VGO3oPsSWEx
   ZuN2wu6ucs6jnPnFbPcmf3tkXVSLm1qQ87Jld90NJAnw+RiPyrhIm3nfD
   Xt2eBn7U6ldR3eBLtcuzvq3FtrLMBPv/fmfToawCsdxd0Z5+kOT3xuLZ8
   w==;
X-CSE-ConnectionGUID: 0fGXLnF5QZ6Ni8hTTcub5Q==
X-CSE-MsgGUID: tP7KPkyBSt6f5v37+01qog==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44211356"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="44211356"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 01:04:52 -0700
X-CSE-ConnectionGUID: JkeVQOk4QEqt+esSEFzL+A==
X-CSE-MsgGUID: XO1EVzt6RLary3QP7TaQZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="157893793"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 01:04:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u0FZ9-00000008jhr-180G;
	Thu, 03 Apr 2025 11:04:47 +0300
Date: Thu, 3 Apr 2025 11:04:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 1/1] gpiolib: Make gpiod_put() error pointer aware
Message-ID: <Z-5BHzTEed607Afz@smile.fi.intel.com>
References: <20250402152000.1572764-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MfzRVy85NR_eSQc3ZX_OmgCRUKuBdd6TqCu=Adwh9drrA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfzRVy85NR_eSQc3ZX_OmgCRUKuBdd6TqCu=Adwh9drrA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 03, 2025 at 08:58:09AM +0200, Bartosz Golaszewski wrote:
> On Wed, Apr 2, 2025 at 5:20 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > When non-optional GPIO is requested and failed, the variable that holds
> > the (invalid) descriptor can contain an error pointer. However, gpiod_put()
> > ignores that fact and tries to cleanup never requested descriptor.
> > Make sure gpiod_put() ignores that as well.
> >
> > While at it, do the same for the gpiod_put_array().
> >
> > Note, it arguable needs to be present in the stubs as those are usually
> > called when CONFIG_GPIOLIB=n and GPIOs are requested using gpiod_get_optional()
> > or similar APIs.

> I'm not a fan of this. Silently ignoring NULL makes sense in the
> context of _optional() calls where we want to do nothing on GPIOs that
> aren't there.

> But this encourages people to get sloppy and just ignore
> error pointers returned from gpiod_get()?

From where did you come to this conclusion, please? We have many subsystems
that ignore invalid resource on the release stage, starting from platform
device driver core.

> Also: all other calls error out on IS_ERR(desc) so why would we make it an
> exception?

Because it's _release_ stage that participates in the cleaning up of
the allocated resources in error paths. It's a common approach in
the kernel. I would rather ask what makes GPIOLIB so special about it?

> If anything, the broadcom SPI driver this is about should store the return
> value of gpiod_get() in a local variable, check it and then assign NULL to
> the actual descriptor stored in the driver data.

Broadcom SPI driver just reveals this disadvantage in GPIOLIB.

> We return errors for a reason, I don't like the idea of just ignoring
> them in gpiod_put().

Yes, how does one links to the other, please?

-- 
With Best Regards,
Andy Shevchenko



