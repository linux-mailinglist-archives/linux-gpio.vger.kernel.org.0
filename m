Return-Path: <linux-gpio+bounces-1380-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E30B481178A
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 16:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFF971C20B85
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 15:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8ACF33074;
	Wed, 13 Dec 2023 15:31:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18293856;
	Wed, 13 Dec 2023 07:30:55 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="2061516"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="2061516"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 07:28:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="917691498"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="917691498"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 07:28:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rDRA5-00000005YiE-1JVP;
	Wed, 13 Dec 2023 17:28:37 +0200
Date: Wed, 13 Dec 2023 17:28:36 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH 3/4] gpiolib: cdev: reduce locking in
 gpio_desc_to_lineinfo()
Message-ID: <ZXnNpH9tc7p5gwW7@smile.fi.intel.com>
References: <20231212054253.50094-1-warthog618@gmail.com>
 <20231212054253.50094-4-warthog618@gmail.com>
 <ZXm4C7KVkMwL4_sX@smile.fi.intel.com>
 <ZXm6oHjb7CRZ8-0f@rigel>
 <ZXnJply1tPnTN_-O@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXnJply1tPnTN_-O@rigel>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Dec 13, 2023 at 11:11:34PM +0800, Kent Gibson wrote:
> On Wed, Dec 13, 2023 at 10:07:28PM +0800, Kent Gibson wrote:
> > On Wed, Dec 13, 2023 at 03:56:27PM +0200, Andy Shevchenko wrote:
> > > On Tue, Dec 12, 2023 at 01:42:52PM +0800, Kent Gibson wrote:

...

> > > > -	unsigned long flags;
> > > > +	unsigned long iflags, dflags;
> > >
> > > With a preliminary conversion to cleanup.h this whole change becomes cleaner,
> > > no?
> >
> > You mean the scoped guards?  Dunno - haven't used them.
> > Care to provide more detail?
> 
> Ok, so changing the spin_lock/unlock to
> 
>        scoped_guard(spinlock_irqsave, &gpio_lock) {
>        ...
>        }
> 
> you no longer need the iflags at all, and can rename dflags to flags.

Yes, but I prefer still dflags as it is a distinction from the lock flags
and we use lflags/dflags a lot in GPIO library, so reading the code will
give a hint about the semantics.

> Got it.

-- 
With Best Regards,
Andy Shevchenko



