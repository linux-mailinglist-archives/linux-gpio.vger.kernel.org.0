Return-Path: <linux-gpio+bounces-491-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 509F27F7A58
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 18:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2418B20D6A
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 17:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C203F381BE;
	Fri, 24 Nov 2023 17:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJZcelt1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B991718
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 09:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700846878; x=1732382878;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PQQVAuF8nbBIzi/oZUwt/Sc0LNOctNioGSffhZiIMyU=;
  b=YJZcelt1wzghWtPU5jir8CWKd+1eVwkrf1/PyivAVXiCLcSTLWuxigav
   1IDN4N6vH349v0ctkyG55RgemRndx8C0xG0hqX44ANF/LaSvK7xtQwAAl
   i2G02S/8Y/7pVt5P578xxlzgysferFqxjQh68iKU3rtnPcBsfaUa/lwjS
   teePRQoU9JWGLdKtyyczZGh3T3Kge+jYTIvDFmvnhRm2rtz5HtkIHn3qL
   p/H8j34E8YhVq6hefyPKC1RpLAhlLzGomnojM57MTkzLlGfZIr7+g+y/a
   bVslIUNjEPRbr+gN0AMnvymdnyLI8n4MZ+5UfSkQg1Id/kXHfDtvd1LnR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="478662089"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="478662089"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 09:27:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="838133776"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="838133776"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 09:27:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r6Zy5-0000000GmzU-4BJm;
	Fri, 24 Nov 2023 19:27:54 +0200
Date: Fri, 24 Nov 2023 19:27:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Kent Gibson <warthog618@gmail.com>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: GPIOLIB locking is broken and how to fix it
Message-ID: <ZWDdGa-Zf06bteld@smile.fi.intel.com>
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 24, 2023 at 05:00:36PM +0100, Bartosz Golaszewski wrote:
> Hi!
> 
> I've been scratching my head over it for a couple days and I wanted to
> pick your brains a bit.
> 
> The existing locking in GPIOLIB is utterly broken. We have a global
> spinlock that "protects" the list of GPIO devices but also the
> descriptor objects (and who knows what else). I put "protects" in
> quotation marks because the spinlock is released and re-acquired in
> several places where the code needs to call functions that can
> possibly sleep. I don't have to tell you it makes the spinlock useless
> and doesn't protect anything.
> 
> An example of that is gpiod_request_commit() where in the time between
> releasing the lock in order to call gc->request() and acquiring it
> again, gpiod_free_commit() can be called, thus undoing a part of the
> changes we just introduced in the first part of this function. We'd
> then return from gc->request() and continue acting like we've just
> requested the GPIO leading to undefined behavior.
> 
> There are more instances of this pattern. This seems to be a way to
> work around the fact that we have GPIO API functions that can be
> called from atomic context (gpiod_set/get_value(),
> gpiod_direction_input/output(), etc.) that in their implementation
> call driver callbacks that may as well sleep (gc->set(),
> gc->direction_output(), etc.).
> 
> Protecting the list of GPIO devices is simple. It should be a mutex as
> the list should never be modified from atomic context. This can be
> easily factored out right now. Protecting GPIO descriptors is
> trickier. If we use a spinlock for that, we'll run into problems with
> GPIO drivers that can sleep. If we use a mutex, we'll have a problem
> with users calling GPIO functions from atomic context.
> 
> One idea I have is introducing a strict limit on which functions can
> be used from atomic context (we don't enforce anything ATM in
> functions that don't have the _cansleep suffix in their names) and
> check which parts of the descriptor struct they modify. Then protect
> these parts with a spinlock in very limited critical sections. Have a
> mutex for everything else that can only be accessed from process
> context.
> 
> Another one is introducing strict APIs like gpiod_set_value_atomic()
> that'll be designed to be called from atomic context exclusively and
> be able to handle it. Everything else must only be called from process
> context. This of course would be a treewide change as we'd need to
> modify all GPIO calls in interrupt handlers.
> 
> I'd like to hear your ideas as this change is vital before we start
> protecting gdev->chip with SRCU in all API calls.

Brief side note: If we can really fix something (partially) right now,
do it, otherwise technical debt kills us.

(Most likely I refer to the list of the GPIO devices.)

-- 
With Best Regards,
Andy Shevchenko



