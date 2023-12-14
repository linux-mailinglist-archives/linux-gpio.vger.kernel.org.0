Return-Path: <linux-gpio+bounces-1499-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE16813687
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 17:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BAB52818FA
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 16:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF5660B9B;
	Thu, 14 Dec 2023 16:41:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF4C3112;
	Thu, 14 Dec 2023 08:41:45 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="8504528"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="8504528"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 08:41:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="774432692"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="774432692"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 08:41:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rDomK-00000005tgs-3qwS;
	Thu, 14 Dec 2023 18:41:40 +0200
Date: Thu, 14 Dec 2023 18:41:40 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH v2 2/5] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
Message-ID: <ZXswRCsT0OYwHe3N@smile.fi.intel.com>
References: <20231214095814.132400-1-warthog618@gmail.com>
 <20231214095814.132400-3-warthog618@gmail.com>
 <ZXsZJ9z7iln8uMf8@smile.fi.intel.com>
 <ZXsajZoQRw7HgHl1@smile.fi.intel.com>
 <ZXsp8QjxsUMPlZIR@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXsp8QjxsUMPlZIR@rigel>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 15, 2023 at 12:14:41AM +0800, Kent Gibson wrote:
> On Thu, Dec 14, 2023 at 05:09:01PM +0200, Andy Shevchenko wrote:
> > On Thu, Dec 14, 2023 at 05:03:03PM +0200, Andy Shevchenko wrote:
> > > On Thu, Dec 14, 2023 at 05:58:11PM +0800, Kent Gibson wrote:

...

> > > > +static void supinfo_init(void)
> > > > +{
> > > > +	supinfo.tree = RB_ROOT;
> > > > +	spin_lock_init(&supinfo.lock);
> > > > +}
> > >
> > > Can it be done statically?
> > >
> > > supinfo = {
> > > 	.tree = RB_ROOT,
> > > 	.lock = __SPIN_LOCK_UNLOCKED(supinfo.lock),
> >
> > I even checked the current tree, we have 32 users of this pattern in drivers/.
> 
> Ah, that is what you meant.  Yeah sure can - the supinfo_init() is
> another hangover from when I was trying to create the supinfo per chip,
> but now it is a global a static initialiser makes sense.

Yep, the DEFINE_MUTEX() / DEFINE_SPINLOCK() / etc looks better naturally
than above.

> And I still haven't received the email you quote there.

:-( I'm not sure we will get it, it most likely that I removed it already
and it has disappeared due to problems with email server...

-- 
With Best Regards,
Andy Shevchenko



