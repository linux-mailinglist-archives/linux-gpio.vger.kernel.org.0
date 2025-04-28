Return-Path: <linux-gpio+bounces-19387-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C45FA9EA05
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 09:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1D133A7BD4
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 07:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600A722171D;
	Mon, 28 Apr 2025 07:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LzNAI3XT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9E62139C4;
	Mon, 28 Apr 2025 07:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826691; cv=none; b=L8ZkEeGbunKyD2mC7P+R5EIo0mvqVXLJSbMvXKnATW0GkEFODsUg5f7CXZW8DBgmhSbpT4JaDtagR024z63SO1UMsntKFttmI3cOvrt7g6xuT2ovpDf71GKkYWgLHFQXRv7uWGv/YRvCjX3tztuRSBSxpH0pcll/15AHvfOhCeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826691; c=relaxed/simple;
	bh=htq96Kka9ktOPiYfm0c6EhYpse5R5Zxig3pmgfUBzCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDJ1R+KhX1WpUyzwD3/53R1fNjKqfccY8omimsHnm0P3u6Y68JHmRMivPD9dCRCsofEtB1MIbg4Q3JKmCJq2m/jWMX/sA50Wmkg8DoCi92jFvHMvoPoJvEpKeWwaWDGjp3vx9Bb/8t4W4rP1vsNG+5N7RHmGaJ8ID4HOc0bocEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LzNAI3XT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745826690; x=1777362690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=htq96Kka9ktOPiYfm0c6EhYpse5R5Zxig3pmgfUBzCU=;
  b=LzNAI3XTq031fYTrHKGkgZOesPEV01QVy+LK+1MFIjNS31nlIRIgkpT3
   nWS8Rx0p7pEQPIfWHDEJdpG+phpdWl3l0PZV6xI5MidXJm8s6HZ89OCZx
   /7WZvXrK/PhedqRP3AqIBRJn94XEzxMUVSQFhzFPBC9QYMEPoi3kAC+yQ
   UK+8Slpcz6DedeuXENKTKY+mR3+RULMjYBjYbdQfgNBzbjEDJicg20bCh
   xBVAWQhv/uS+vdLxhWU4ijZlYVx/wQOsI0Mo7y+ObFqOacwebXhcge1AI
   WKbsNdON0h4u/LQQNJd7lackwB8tPCi3vfJwxcF+Ptxiyp9fv5BaO41sb
   w==;
X-CSE-ConnectionGUID: KrFFI59vQXG8QvJ0m3Jzyg==
X-CSE-MsgGUID: rR8jo0YyQCufy7I/1S1itg==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47533727"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="47533727"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 00:51:30 -0700
X-CSE-ConnectionGUID: NK16KXazTV20Bazsv681HQ==
X-CSE-MsgGUID: UriJxhmYSI6h2G1Y9+ZnqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="134411865"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 00:51:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u9JGt-000000011Q0-1ekR;
	Mon, 28 Apr 2025 10:51:23 +0300
Date: Mon, 28 Apr 2025 10:51:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Raag Jadav <raag.jadav@intel.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: (subset) [PATCH v2 0/3] gpiolib: finish conversion to
 devm_*_action*() APIs
Message-ID: <aA8ze4A-SIegVJ15@smile.fi.intel.com>
References: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
 <174582608319.15717.12211907178640999391.b4-ty@linaro.org>
 <aA8ym3GYoAK4lI2y@smile.fi.intel.com>
 <CAMRc=MdeVrgzVKSjbNzBz+Kf2SqqFY7KO=yprU7GF0Nbbcq4ow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdeVrgzVKSjbNzBz+Kf2SqqFY7KO=yprU7GF0Nbbcq4ow@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 28, 2025 at 09:48:37AM +0200, Bartosz Golaszewski wrote:
> On Mon, Apr 28, 2025 at 9:47 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Mon, Apr 28, 2025 at 09:41:52AM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > On Thu, 20 Feb 2025 18:20:25 +0200, Andy Shevchenko wrote:
> > > > GPIOLIB has some open coded stuff that can be folded to the devm_*_action*()
> > > > calls. This mini-series is for that. The necessary prerequisites are here
> > > > as well, namely:
> > > > 1) moving the respective APIs to the devres.h;
> > > > 2) adding a simple helper that GPIOLIB will rely on;
> > > > 3) finishing the GPIOLIB conversion to the device managed action APIs.

[...]

> > > Applied, thanks!
> >
> > Thanks!
> >
> > > [3/3] gpiolib: devres: Finish the conversion to use devm_add_action()
> > >       https://git.kernel.org/brgl/linux/c/d1d52c6622a61a0ae8dd2bd2097b25c0f553d2f3
> >
> > Only one? What about the first two?
> 
> b4 borked with the patches applied to gpio/for-next through an
> immutable tag but all is there, please check the tree.

Yes, yes, sorry for the noise, and thank you!

-- 
With Best Regards,
Andy Shevchenko



