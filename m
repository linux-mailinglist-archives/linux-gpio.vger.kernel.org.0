Return-Path: <linux-gpio+bounces-27898-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B32E6C25170
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 13:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5E7F4350D56
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 12:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CEB33C50B;
	Fri, 31 Oct 2025 12:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PyXZMplB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4FC1DF258;
	Fri, 31 Oct 2025 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761914978; cv=none; b=tLzx2W7iIEmsZLs5nbY9//vOfFLKmV2m6e5aB0dJpdoIGFEmu43woQ1tuD+Wo96gUzl9wYgtBnYGRipVYF2Fcbcw1Kl+6VrmoqCEhcKUZc4lNbhEwyTEezhGdIgKA6tWSWdtvZh90tW2hrWpaYYQS3HHmtJ61x+vW43R8lBEnZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761914978; c=relaxed/simple;
	bh=Z7L6m8wsINOWDCAVOMhW7SBbSW/51fBJ3qOHGI5fHqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ep91X1L5NCndNZHEiPL6Tto9LL/2Dvzq2O2xoS++fDi92cZUVlp8UuP1Y6Y6+LURvlGnKywtXlpJlEYzsofejjKJbCZojdMz0/Fgvo9hE1S/uwKXuGMRzy+adxQQMcwiUBJ1qNJxjJxWhADTnOnr8gZBI7ywgCtfkNJjzHpeRfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PyXZMplB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761914976; x=1793450976;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z7L6m8wsINOWDCAVOMhW7SBbSW/51fBJ3qOHGI5fHqY=;
  b=PyXZMplBh2yC5RN4mgUpKFrfpEH2i6tDtPf37r0MLFIRB3DJIFXS1Moa
   QG9U9LP0Oxh3fiqM8WuSZvbbK9cs63ejTsKXOeQIbYfuUjltvujdJaMtb
   kpvc9NAP7ls85LMR8aYEKV6ZRNM9iEJNTtLQYEw6GUw2zev5X5JBdRViI
   db0DiP+dVtKKro1UeWzvrw79/wx2ZJLuUC6iziBdm4QOfP5rN/9iaLFke
   7pHSxc4yTpFMz2gKwg6XYfcE7u7l3el6r9pMUrjDJZwxpI/9pkYGA8+P5
   L0b/mJ/sExDViQd/84TKTm/CtrXIg+Rt3y9ESLLGqG550XS9DrqRIpG3R
   Q==;
X-CSE-ConnectionGUID: xie/SgGrTMqW38sKaLYPgg==
X-CSE-MsgGUID: YRP7xDc7Q9S/6EnTFO3EFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="66687914"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="66687914"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 05:49:36 -0700
X-CSE-ConnectionGUID: CHxpcvBjQwCzu/7SrInovw==
X-CSE-MsgGUID: KLsAn9VmSaiy00ffU25Gug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186106363"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.66])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 05:49:34 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vEoZN-00000004GS3-1eMG;
	Fri, 31 Oct 2025 14:49:29 +0200
Date: Fri, 31 Oct 2025 14:49:28 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] platform/x86/intel: Introduce Intel Elkhart Lake
 PSE I/O
Message-ID: <aQSwWLVKH_3TthTW@smile.fi.intel.com>
References: <20251029062050.4160517-1-raag.jadav@intel.com>
 <20251029062050.4160517-2-raag.jadav@intel.com>
 <aQHSA6TtCAVGDRNo@smile.fi.intel.com>
 <aQSCpF8aR1lskaPy@black.igk.intel.com>
 <aQSJJv7d2hllsObY@smile.fi.intel.com>
 <aQSknEvFB_HRjwd-@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQSknEvFB_HRjwd-@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 31, 2025 at 12:59:24PM +0100, Raag Jadav wrote:
> On Fri, Oct 31, 2025 at 12:02:14PM +0200, Andy Shevchenko wrote:
> > On Fri, Oct 31, 2025 at 10:34:28AM +0100, Raag Jadav wrote:
> > > On Wed, Oct 29, 2025 at 10:36:19AM +0200, Andy Shevchenko wrote:
> > > > On Wed, Oct 29, 2025 at 11:50:49AM +0530, Raag Jadav wrote:

...

> > > > > +	ret = __auxiliary_device_add(aux_dev, dev->driver->name);
> > > > 
> > > > Hmm... Is it okay to use double underscored variant? Only a single driver uses
> > > > this so far... Care to elaborate?
> > > 
> > > The regular variant uses KBUILD_MODNAME which comes with 'intel' prefix
> > > after commit df7f9acd8646, and with that we overshoot the max id string
> > > length for leaf drivers.
> > 
> > At bare minimum this needs a comment, but I think ideally we need to bump the
> > limit by factor of 2.
> 
> Which will probably require a wider discussion, so perhaps let's pursue it
> separately?

Send a patch starting a discussion. Looking at the history of bumping other
cases it's usually well accepted when properly justified. And since it's now
32, bumping to 40 maybe enough for several more years.

-- 
With Best Regards,
Andy Shevchenko



