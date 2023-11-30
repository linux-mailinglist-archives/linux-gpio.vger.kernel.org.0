Return-Path: <linux-gpio+bounces-802-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D63D7FF8FB
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 19:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B8BFB20E46
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 18:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE352584F8;
	Thu, 30 Nov 2023 18:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LniPfygC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D55103;
	Thu, 30 Nov 2023 10:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701367304; x=1732903304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6DZD1WAOWgeywojsdbe0NogKW+Ei8+LB7XZhnS+io3A=;
  b=LniPfygC9Wj68jvqETDsf3pCZnNo2oB6Q+eq4v6rhiNJmE30w3pfFV7+
   vkwCItVdBpnO/pxMcR6Ya64nLsykwFkKvBZtzue/dxXmKxwec6NGVraY+
   g+LYO/k5bKH9uTWb8KdrULe1eaeGIF5k1KKm0RlcoBIQyCu2CLdVCtUzq
   6OxYdyKvb9yVzucmdvdmjFH32dQeBkCuKIR6f1BNTEtZ17K06UZA+H9G0
   zkVulLQdFnM5IwRiC6Ue6Uqw4BVWCJCpYJ2za1WDp22qR+dJtHg1NdUt0
   lxKwIT5UhypC12ULJMVron/EcVrNesQ2+9/AqNOotBsK2vSc1FAyvTyk3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="457691441"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="457691441"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 10:01:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913274473"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="913274473"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 10:01:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8lLy-00000000m5B-3gEk;
	Thu, 30 Nov 2023 20:01:34 +0200
Date: Thu, 30 Nov 2023 20:01:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 10/10] gpiolib: remove gpiochip_is_requested()
Message-ID: <ZWjN_oYS3JANyx7u@smile.fi.intel.com>
References: <20231130134630.18198-1-brgl@bgdev.pl>
 <20231130134630.18198-11-brgl@bgdev.pl>
 <ZWi8X7pQpUm-nIpN@smile.fi.intel.com>
 <CAMRc=McpYK9vLA65zdoteUa72_cpwzmv3X_pZt5purocDYBJnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McpYK9vLA65zdoteUa72_cpwzmv3X_pZt5purocDYBJnw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 30, 2023 at 06:46:20PM +0100, Bartosz Golaszewski wrote:
> On Thu, Nov 30, 2023 at 5:46 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Nov 30, 2023 at 02:46:30PM +0100, Bartosz Golaszewski wrote:

...

> > > -     cpy = kstrdup(label, GFP_KERNEL);
> > > -     if (!cpy)
> > > -             return ERR_PTR(-ENOMEM);
> > > +     scoped_guard(spinlock_irqsave, &gpio_lock) {
> > > +             if (!test_bit(FLAG_REQUESTED, &desc->flags))
> > > +                     return NULL;
> >
> > > +             cpy = kstrdup(desc->label, GFP_KERNEL);
> > > +             if (!cpy)
> > > +                     return ERR_PTR(-ENOMEM);
> >
> > You just introduced these lines earlier in the series, and here you moved
> > them again. With guard() instead it may be kept in a better shape.
> >
> 
> I wanted to limit the critical section to a minimum hence scoped
> variant. And this will go away as soon as we have a desc lock so it's
> temporary anyway. What matters to me is how the code looks when
> sending it to Torvalds. On the off chance that we don't get the
> locking rework merged in time for v6.8, I want this to at least be
> under the existing lock.

guard() here is equally scoped, no? And what's wrong with that when gets
to Torvalds? He accepted your guard() cases last time IIRC.

> > > +     }

-- 
With Best Regards,
Andy Shevchenko



