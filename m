Return-Path: <linux-gpio+bounces-1492-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B58E381354D
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 16:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5973F1F21D6D
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 15:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E305D913;
	Thu, 14 Dec 2023 15:53:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8214D98;
	Thu, 14 Dec 2023 07:53:02 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="385550865"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="385550865"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 07:53:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="724100116"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="724100116"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 07:53:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rDo1C-00000005sv2-0EWE;
	Thu, 14 Dec 2023 17:52:58 +0200
Date: Thu, 14 Dec 2023 17:52:57 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH v2 4/5] gpiolib: cdev: reduce locking in
 gpio_desc_to_lineinfo()
Message-ID: <ZXsk2XPsNppQcQAn@smile.fi.intel.com>
References: <20231214095814.132400-1-warthog618@gmail.com>
 <20231214095814.132400-5-warthog618@gmail.com>
 <ZXsa39xneH6Rh7Gd@smile.fi.intel.com>
 <ZXsc5T1G5Y28lVqw@rigel>
 <ZXse4UDKGlVqzsyD@smile.fi.intel.com>
 <ZXsglIJtK50XYCIV@rigel>
 <ZXsjbvUYJGmGU6bs@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXsjbvUYJGmGU6bs@rigel>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 14, 2023 at 11:46:54PM +0800, Kent Gibson wrote:
> On Thu, Dec 14, 2023 at 11:34:44PM +0800, Kent Gibson wrote:
> > On Thu, Dec 14, 2023 at 05:27:29PM +0200, Andy Shevchenko wrote:
> > > On Thu, Dec 14, 2023 at 11:19:01PM +0800, Kent Gibson wrote:
> > > > On Thu, Dec 14, 2023 at 05:10:23PM +0200, Andy Shevchenko wrote:
> > > > > On Thu, Dec 14, 2023 at 05:58:13PM +0800, Kent Gibson wrote:

...

> > > > > > -	spin_lock_irqsave(&gpio_lock, flags);
> > > > >
> > > > > Shouldn't this be covered by patch 1 (I mean conversion to scoped_guard()
> > > > > instead of spinlock)?
> > > >
> > > > Read the cover letter.
> > > > Doing that made the change larger, as flags gets removed then restored.
> > > > I had also thought the flag tests would get indented then unindented, but
> > > > if we use guard() the indentation should remain unchanged.
> > >
> > > I'm fine with that as I pointed out (have you received that mail? I had
> > > problems with my mail server) the dflags is better semantically, so restoration
> > > with _different_ name is fine.
> >
> > I have noted that some of your replies have been delayed, and I can't be sure
> > of what I might not've received. I can't say I've seen one that mentions the
> > dflags name being preferable.
> >
> > I prefer the plain flags name, if there is only one flag variable in the
> > function.
> >
> > > > Can do it in 1 if you are happy with the flags declaration being
> > > > removed in patch 1 and restored in 4.
> > >
> > > Definitely.
> >
> > Ok will re-arrange in v3.
> 
> Hang on - patch 4 has to use a scoped_guard(), so are you ok for patch 1
> to introduce a guard(), to avoid changing the indentation, only to
> replace it with a scoped_guard(), to perform the tests after releasing
> the lock, in patch 4?

Hmm... If we need to use scoped_guard() at the end, can we introduce it in
patch 1?

-- 
With Best Regards,
Andy Shevchenko



