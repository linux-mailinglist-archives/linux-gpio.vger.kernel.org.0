Return-Path: <linux-gpio+bounces-1468-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D838813334
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 15:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EABE41F21BB8
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 14:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06EF59E51;
	Thu, 14 Dec 2023 14:35:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 759D1A7;
	Thu, 14 Dec 2023 06:35:14 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="394873872"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="394873872"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 06:35:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="918076811"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="918076811"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 06:35:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rDmnu-00000005rsw-18w9;
	Thu, 14 Dec 2023 16:35:10 +0200
Date: Thu, 14 Dec 2023 16:35:09 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH 1/4] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
Message-ID: <ZXsSnTcnAsopYodl@smile.fi.intel.com>
References: <CAMRc=Mfri8K4ZqcHb_eQY6gi+q_-uBZc2wiMrrb-+a7Tric3FA@mail.gmail.com>
 <ZXnU3tMYCc2Rw8Qv@rigel>
 <ZXnX8jPHxRLW8lhi@smile.fi.intel.com>
 <CAMRc=Mfj_4YvQVP=UWkULBwJniDDjapttU+qSgqfN5ZWNgikKw@mail.gmail.com>
 <ZXnb-ks_noYLWZZ2@smile.fi.intel.com>
 <CAMRc=MfaHKKKNkXW0L1FPjCH4VvG22Vn9q8z9tupZCtCEKZU2g@mail.gmail.com>
 <ZXoO8B0N3S49GnvX@smile.fi.intel.com>
 <ZXpJueTnmtUIecCd@rigel>
 <ZXplMThBSD53UV0s@rigel>
 <CAMRc=MeZg0xg7ASA3x4PxCYymCmCEp0zZbUgGTCCzrjPaPZCag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeZg0xg7ASA3x4PxCYymCmCEp0zZbUgGTCCzrjPaPZCag@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 14, 2023 at 10:40:26AM +0100, Bartosz Golaszewski wrote:
> On Thu, Dec 14, 2023 at 3:15 AM Kent Gibson <warthog618@gmail.com> wrote:
> > On Thu, Dec 14, 2023 at 08:18:01AM +0800, Kent Gibson wrote:
> > > On Wed, Dec 13, 2023 at 10:07:12PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Dec 13, 2023 at 08:03:44PM +0100, Bartosz Golaszewski wrote:

...

> > > > > > - it adds complications for no benefit
> > >
> > > It provides a placeholder for collective documentation and clarifies
> > > scope for the reader.
> >
> > Turns out kernel-doc can't deal with a struct variable declaration - it
> > needs the struct to be named.
> >
> > So this doesn't parse:
> >
> > static struct {
> >         struct rb_root tree;
> >         spinlock_t lock;
> > } supinfo;
> >
> > but this does:
> >
> > static struct supinfo {
> >         struct rb_root tree;
> >         spinlock_t lock;
> > } supinfo;
> >
> > at which point I prefer the separate struct and var declarations as per
> > the patch.
> >
> > Opinions?
> 
> Yeah, don't make it a kernel doc. It's a private structure, no need to
> expose documentation for it in docs. Just use a regular comment - say
> what it is and why it's here.

I agree with Bart, make it plain comment if needed.

-- 
With Best Regards,
Andy Shevchenko



