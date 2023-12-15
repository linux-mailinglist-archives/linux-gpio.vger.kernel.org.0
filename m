Return-Path: <linux-gpio+bounces-1602-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C28816A89
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 11:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CB70B20C51
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 10:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BF612B92;
	Mon, 18 Dec 2023 10:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVS2dyX4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A31212B8D
	for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 10:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702894116; x=1734430116;
  h=resent-from:resent-date:resent-message-id:resent-to:date:
   from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NQVXUOqwzxLj0eqfz1P6sNQP+i2ia+SaPVQO/yRBZek=;
  b=IVS2dyX4eS4brNjqR0o/GE91DBPz2aRS1OWJrmS1W+08cuFspt3uhg9b
   aKgSehTreFLZ2BVWbuPoG06iZRrmLPvVnR7VWd2YMFqfkpZcYvsVlbWeV
   tuhcyQ3fPsb4I3PgO6nrGNVouUOBXOx+W20FPY3QoCxOA+TGZ2M2rCndP
   L8ssh1EJUEV75oTWLNCNNCaU0oLIWoozImgvp34SMd/cYnl4kK63S14xK
   4gw4JoFyioLZk1pK7DWTPyAmy2d9k9wRh0fVWW4RA9Er2T7043RQDvUAK
   O/64b+K3SJzeGfnO82v2uvw2n+UZWALX6AMkoLXKIRcVLj7DXx6wjL+6Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="2691378"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="2691378"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 02:08:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="841423053"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="841423053"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 02:08:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rFAXz-00000006t0O-3n2P;
	Mon, 18 Dec 2023 12:08:27 +0200
Resent-From: Andy Shevchenko <andriy.shevchenko@intel.com>
Resent-Date: Mon, 18 Dec 2023 12:08:27 +0200
Resent-Message-ID: <ZYAaG5LDgT-Er03t@smile.fi.intel.com>
Resent-To: brgl@bgdev.pl, linux-gpio@vger.kernel.org, warthog618@gmail.com,
	linus.walleij@linaro.org
Date: Fri, 15 Dec 2023 22:23:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH v2 2/5] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
Message-ID: <ZXy1tWOX-y4MJq69@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 14, 2023 at 10:06:14PM +0100, Bartosz Golaszewski wrote:
> On Thu, Dec 14, 2023 at 5:41 PM Andy Shevchenko <andy@kernel.org> wrote:
> > On Fri, Dec 15, 2023 at 12:14:41AM +0800, Kent Gibson wrote:
> > > On Thu, Dec 14, 2023 at 05:09:01PM +0200, Andy Shevchenko wrote:
> > > > On Thu, Dec 14, 2023 at 05:03:03PM +0200, Andy Shevchenko wrote:
> > > > > On Thu, Dec 14, 2023 at 05:58:11PM +0800, Kent Gibson wrote:

...

> > > > > > +static void supinfo_init(void)
> > > > > > +{
> > > > > > +       supinfo.tree = RB_ROOT;
> > > > > > +       spin_lock_init(&supinfo.lock);
> > > > > > +}
> > > > >
> > > > > Can it be done statically?
> > > > >
> > > > > supinfo = {
> > > > >   .tree = RB_ROOT,
> > > > >   .lock = __SPIN_LOCK_UNLOCKED(supinfo.lock),
> 
> Double underscore typically means it's private and shouldn't be used.

Right, but when you have a struct you have no other means to initialize this
directly.

> > > > I even checked the current tree, we have 32 users of this pattern in drivers/.

See, there are users of the __ initializers.

> > > Ah, that is what you meant.  Yeah sure can - the supinfo_init() is
> > > another hangover from when I was trying to create the supinfo per chip,
> > > but now it is a global a static initialiser makes sense.
> >
> > Yep, the DEFINE_MUTEX() / DEFINE_SPINLOCK() / etc looks better naturally
> > than above.
> 
> Yeah, so maybe we should use non-struct, global variables after all.

At least this will allow to get rid of (questionable) initcall.

> > > And I still haven't received the email you quote there.
> >
> > :-( I'm not sure we will get it, it most likely that I removed it already
> > and it has disappeared due to problems with email server...

-- 
With Best Regards,
Andy Shevchenko


