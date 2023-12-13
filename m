Return-Path: <linux-gpio+bounces-1377-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEE68115BA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 16:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5666C1F2172F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 15:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944ED30D06;
	Wed, 13 Dec 2023 15:05:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20B5410F6;
	Wed, 13 Dec 2023 07:05:29 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="379968534"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="379968534"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 07:05:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="947207377"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="947207377"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 07:05:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rDQnc-00000005YR1-0fDw;
	Wed, 13 Dec 2023 17:05:24 +0200
Date: Wed, 13 Dec 2023 17:05:23 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl,
	linus.walleij@linaro.org
Subject: Re: [PATCH 3/4] gpiolib: cdev: reduce locking in
 gpio_desc_to_lineinfo()
Message-ID: <ZXnIM5lBGqmg9ssK@smile.fi.intel.com>
References: <20231212054253.50094-1-warthog618@gmail.com>
 <20231212054253.50094-4-warthog618@gmail.com>
 <ZXm4C7KVkMwL4_sX@smile.fi.intel.com>
 <ZXm6oHjb7CRZ8-0f@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXm6oHjb7CRZ8-0f@rigel>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Dec 13, 2023 at 10:07:28PM +0800, Kent Gibson wrote:
> On Wed, Dec 13, 2023 at 03:56:27PM +0200, Andy Shevchenko wrote:
> > On Tue, Dec 12, 2023 at 01:42:52PM +0800, Kent Gibson wrote:

...

> > > -	unsigned long flags;
> > > +	unsigned long iflags, dflags;
> >
> > With a preliminary conversion to cleanup.h this whole change becomes cleaner,
> > no?
> 
> You mean the scoped guards?  Dunno - haven't used them.
> Care to provide more detail?

Yes.

With use of those the flags will gone and you won't need iflags,
which is non-standard name for the spin lock flags variable anyway,
at all. Only new dflags will come here.

-- 
With Best Regards,
Andy Shevchenko



