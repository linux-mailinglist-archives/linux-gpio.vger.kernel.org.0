Return-Path: <linux-gpio+bounces-22401-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8FEAED854
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 11:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8903176787
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 09:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63C02367B6;
	Mon, 30 Jun 2025 09:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehvij6iy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED7317A2FC;
	Mon, 30 Jun 2025 09:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751274983; cv=none; b=mNEJooCyothrhowgJ//bblhfeRMSHETFvFNydQlqxfDvjWyioOKtHNPvVd9HU7MiStrTS07DyVIcI3pgReaRYaRkg1sI3OyhpNnzCu9MOL2CGeELZZV4wpUfxkFWxOMd87yOVJJ8AoyelEOgpkVPvlIh8YU3oAdyhZmfgZLJQ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751274983; c=relaxed/simple;
	bh=hIF4DF7VIC131YOfiv8wb+VyxCwoXmZfuDNsCoEXrmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XimVl8cKQxtCuNjhKM5JohjYvTZOhmVb+LAphZ+nHe3/xdF0pj8pq/F/eY5EzZDstqcTY5rtZ/sRLhd+YeeDYtENkJ+mUafGrpDtBsQJeKCrZ+2chdOhlCHYWu+/VFeZC1DJuzWzAluMP9BdP3Z1pu/gtAzetqyR1R2/SB83uTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ehvij6iy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751274982; x=1782810982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hIF4DF7VIC131YOfiv8wb+VyxCwoXmZfuDNsCoEXrmA=;
  b=ehvij6iyVicmrxlX4xbE0hjbFuT5aNM9jVe7iPQL66HUQv88QPe0mSkZ
   nkroL7UmkajEqYElVcCQmMkDMzk7chbGROUO4EUMkGcnlos6HM6GBI34e
   KhW5GJE3LWlCdhYLrm7SpPMhteFCjpkgHBc5od0a6Pv7COK+0VJotM0Lp
   uTA0mKtfKtYvzpmbn9flXe8yDHnHP1vcXX2x9bpWltHfKNYFnfYqYXJRH
   IvXgS8c6PTXGccifOz8yvfhrdEkllaW4X3Z9pghQXervw2CehX7MKbHiw
   k2gVYYGtizh1KwIi0b+Tt1qWI/aRXsYq0iaIxKFeNb3G0GMutw74wW87D
   w==;
X-CSE-ConnectionGUID: WbgP1acDQsiwhQRYFDBnWw==
X-CSE-MsgGUID: uY8xco08S7KRGHtJog0Xtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53369753"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53369753"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:16:20 -0700
X-CSE-ConnectionGUID: vgpnXkQESpib0RBqEXahuw==
X-CSE-MsgGUID: 8U4qTSUCQ1KOQB2aSzWAJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="157794187"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:16:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uWAcY-0000000BG2u-2D3F;
	Mon, 30 Jun 2025 12:16:14 +0300
Date: Mon, 30 Jun 2025 12:16:14 +0300
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
Subject: Re: [PATCH v2 1/9] gpio: sysfs: add a parallel class device for each
 GPIO chip using device IDs
Message-ID: <aGJV3uvuFV4rrOUa@smile.fi.intel.com>
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
 <20250623-gpio-sysfs-chip-export-v2-1-d592793f8964@linaro.org>
 <aF627RVZ8GFZ_S_x@black.fi.intel.com>
 <CAMRc=Mci_q8PsJT2A33KtsPfSoO1BiDhB854M9__0KSv9YcB9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mci_q8PsJT2A33KtsPfSoO1BiDhB854M9__0KSv9YcB9w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 30, 2025 at 10:34:52AM +0200, Bartosz Golaszewski wrote:
> On Fri, Jun 27, 2025 at 5:21 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Mon, Jun 23, 2025 at 10:59:49AM +0200, Bartosz Golaszewski wrote:

...

> > >  struct gpiodev_data {
> > >       struct gpio_device *gdev;
> > >       struct device *cdev_base; /* Class device by GPIO base */
> > > +     struct device *cdev_id; /* Class device by GPIO device ID */
> >
> > I would add it in the middle in a way of the possible drop or conditional
> > compiling of the legacy access in the future.
> 
> I'm not sure what difference it makes?

It collects optional (which you do with ifdeffery later on) at the end of the
structure. Maybe there is no effect now, but it might be in the future.

> > >  };

...

> > > +static struct device_attribute dev_attr_export = __ATTR(export, 0200, NULL,
> > > +                                                     chip_export_store);
> >
> > __ATTR_WO()
> >
> 
> No can do, the attribute would have to be called "chip_export". A
> function called export_store() already exists in this file.

I didn't get, we have two "export" nodes implemented in the same file?

...

> > > +static struct device_attribute dev_attr_unexport = __ATTR(unexport, 0200,
> > > +                                                       NULL,
> > > +                                                       chip_unexport_store);
> >
> > Ditto.

Ditto.

-- 
With Best Regards,
Andy Shevchenko



