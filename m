Return-Path: <linux-gpio+bounces-1479-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC557813412
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 16:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EA2F2832F2
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 15:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CCF5C076;
	Thu, 14 Dec 2023 15:09:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8438E;
	Thu, 14 Dec 2023 07:09:07 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2217992"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="2217992"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 07:09:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="844740792"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="844740792"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 07:09:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rDnKg-00000005sHL-1OEJ;
	Thu, 14 Dec 2023 17:09:02 +0200
Date: Thu, 14 Dec 2023 17:09:01 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH v2 2/5] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
Message-ID: <ZXsajZoQRw7HgHl1@smile.fi.intel.com>
References: <20231214095814.132400-1-warthog618@gmail.com>
 <20231214095814.132400-3-warthog618@gmail.com>
 <ZXsZJ9z7iln8uMf8@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXsZJ9z7iln8uMf8@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 14, 2023 at 05:03:03PM +0200, Andy Shevchenko wrote:
> On Thu, Dec 14, 2023 at 05:58:11PM +0800, Kent Gibson wrote:

...

> > +/*
> > + * Used to populate gpio_v2_line_info with cdev specific fields not contained
> > + * in the struct gpio_desc.
> > + * A line is determined to contain supplemental information by
> > + * line_is_supplemental().
> > + */
> > +static struct {
> > +	/* a rbtree of the struct lines containing the supplemental info */
> > +	struct rb_root tree;
> > +	/* covers tree */
> > +	spinlock_t lock;
> > +} supinfo;

Hmm... If I read the kernel-doc script it should support anonymous structs
and unions...

...

> > +static void supinfo_init(void)
> > +{
> > +	supinfo.tree = RB_ROOT;
> > +	spin_lock_init(&supinfo.lock);
> > +}
> 
> Can it be done statically?
> 
> supinfo = {
> 	.tree = RB_ROOT,
> 	.lock = __SPIN_LOCK_UNLOCKED(supinfo.lock),

I even checked the current tree, we have 32 users of this pattern in drivers/.

> };

-- 
With Best Regards,
Andy Shevchenko



