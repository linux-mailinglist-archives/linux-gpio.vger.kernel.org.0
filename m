Return-Path: <linux-gpio+bounces-22605-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F956AF14AA
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFF4C1C409D5
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 11:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D211926D4D8;
	Wed,  2 Jul 2025 11:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XkHRZmA5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A776C26B747;
	Wed,  2 Jul 2025 11:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751457357; cv=none; b=U/ouRaowwLE1/Utdh8G5mJ7upreIUElqZeZkl5S3JfOgzQyVjWZHZNXIZAd/hxAFYbwpjya5TLMUX2DCQ3wE8wgClM39qhGVCe1ZuAU24Vi64iWuGIXPNUh3DXO6yGr+E5l4icOUx9wpIY9it5cit4bp+MhPj7OPJMQGNzU+o2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751457357; c=relaxed/simple;
	bh=g03WbLNZnymRJkzgiUNFPnT4bm9PVGkM7Z/dtaddMEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkKDPqWthRE1CdHsbtkovYtTfCOc8fyf1vmv3YBzlmauOM1YxoEevBmUuuLoI9NWT51I4L1mHkM1qupLJGWmpmm4bp2B+VKmtT33bz+EGMH9ZKLRE6Go/BiMhUvbB8JQGPLvSuADV1dNLYeOxO5cvVgRy2DbllThcZ73cctGsG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XkHRZmA5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751457355; x=1782993355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=g03WbLNZnymRJkzgiUNFPnT4bm9PVGkM7Z/dtaddMEo=;
  b=XkHRZmA5Gd7NI5HeZJ0A4WWx3ND1EVY2065gBgO2vCdKNlHWaQJLKXQR
   yylttb33tiO8zU8vKitWLxkZB1NXhRxJtBMLkQNhz19D3gCgBKzm+/y68
   leQCKPZZhKN/tpaoTep07AKM5CUd0Dj8/z8Cxc8rzY0CPY6CaK5HgzvK3
   /qA6uUKau9FmsbIb08eNFKP1xcn0uYjPDxy+TjDUhLTGOG41XVVHjVU+6
   O8dAtDwUL3KtjeqamN/6IhtWYyG6r23akoCmR1sIypFeTyHQKjk6adgOW
   yaiCepsEHe8rDV5SKR+qiVKtcc7uIQPwFdo/rZgSGxDidm4ZH6ttuMaoK
   g==;
X-CSE-ConnectionGUID: Gk+RLseAR7KMiehQlFqHjA==
X-CSE-MsgGUID: 9bTgAnmFSWSmRfy1XYI9/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="52864650"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="52864650"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:55:54 -0700
X-CSE-ConnectionGUID: +2gLogIhRPGSmh5F8ZHXcw==
X-CSE-MsgGUID: a67MzHEfTO2IY6hGuxzJ7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="177731054"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:55:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uWw45-0000000BuPh-20ff;
	Wed, 02 Jul 2025 14:55:49 +0300
Date: Wed, 2 Jul 2025 14:55:49 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
Message-ID: <aGUeRczCNJLg-KON@smile.fi.intel.com>
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
 <aGPrFnDxG4W7S9Ym@smile.fi.intel.com>
 <20250702035439.GA20273@rigel>
 <CAMRc=MftawBB4rtj4EKS_OwMCU9h53sA8QxcFq_ZY0MRg2OLag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MftawBB4rtj4EKS_OwMCU9h53sA8QxcFq_ZY0MRg2OLag@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 02, 2025 at 11:45:02AM +0200, Bartosz Golaszewski wrote:
> On Wed, Jul 2, 2025 at 5:54 AM Kent Gibson <warthog618@gmail.com> wrote:
> > On Tue, Jul 01, 2025 at 05:05:10PM +0300, Andy Shevchenko wrote:
> > > It seems I never expressed my overall opinion about this. I think the poking
> > > sysfs and making it working with a new schema won't solve the issues that
> > > character device was developed to target. If so, doing this just brings yet
> > > another broken interface. I would be happy to be mistaken!
> > >
> > > If I am mistaken, I would like to see a summary here that explains that clearly
> > > that the new sysfs approach does not inherit design flaws of the original
> > > implementation.
> 
> You cut out the link to the discussion that preceded this series where
> a good summary is in the very first email. Anyway: the gist is: people
> need to do some basic GPIO fiddling early on from initramfs that may
> not have any tools other than basic shell utils from busybox. This
> series is not about improving or extending the sysfs interface - it's
> about removing its reliance on global GPIO numbers. And that's about
> it. We don't add any new features really, just move the GPIO line
> groups into their respective chip directories and make exporting use
> the hardware offsets, not global numbers.

I see it differently. This adds the second variant of how sysfs can be handled
and it needs to be rotten in the same way as the original sysfs. I really don't
see a point to prolonging the life of the broken interface in such a way. If somebody
wants to check the GPIO without accessing character device interface, they probably
are simply lazy to think of how to do that on early stages properly. The desire
sounds like a workaround against proper thinking.

> > Indeed.  I've already expressed my reservations about supporting the whole
> > of the existing sysfs capabilties, but I've otherwise tried to remain out
> > of the discussion.
> >
> > To reiterate my position:
> > While I am all for maintaining sysfs in some form to cater for those
> > rare cases where cdev is too heavyweight, IMHO it is a mistake to
> > support the existing sysfs capabilities in toto.  Take the opportunity to
> > remove the parts of the sysfs interface that don't work well.
> 
> Doesn't the last patch do it? We cannot remove it without giving
> user-space some time to switch.

Famous Last Words. How many years the sysfs is being rotten?! This just makes
it a Frankenstein.

> This series does everything in a
> backward compatible way and then isolates the old bits under ifdefs so
> that when the time comes it's just a matter of removing everything
> guarded by them.
> 
> > The new sysfs should only provide the features required by those rare use
> > cases, which IIUC would be basic sets and gets, and exclude those features
> > not required, particularly warts like edges.
> >
> > If you need more advanced features then use cdev.
> > If all you need is basic sets and gets then sysfs is probably fine.
> >
> > If that isn't the case then there should be some explanation as to why those
> > sysfs features are being maintained.  Treat this as a new interface.
> 
> I tend to not interpret it as adding new features. We really just
> *move* what exists under a slightly different path when you think
> about it.
> 
> So what are you suggesting, remove the `edge` attribute and polling
> features from the new `value` attribute?

-- 
With Best Regards,
Andy Shevchenko



