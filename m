Return-Path: <linux-gpio+bounces-16919-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 846DAA4C030
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B84C1893CF9
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 12:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CA220F091;
	Mon,  3 Mar 2025 12:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A116qQxc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F8320F083;
	Mon,  3 Mar 2025 12:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741004521; cv=none; b=QyKWhJZgSD/0TTP0Kc10GXWFYuoR1R7xtlulFihBhwWTVaIMT2l4V1oZSOpih34dqlYBLXUJKLhQpas6dc/fA6BOzkRPfZTrxJhFYolUJL/goKWEu8NLIOA6tQWzMQQb7yurE0FLiByKb39veadoV0LD2E8lhq/TlRY4kHrK4uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741004521; c=relaxed/simple;
	bh=G+PRDV5mfNwcg2FIzmfIzN2GOCgKDORUlKjOVJveauU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rF2BTkNNf1O4z/EW/iwSv3n8THgr1cRGb4J/1EZIFaHuyOc6PtDpojo3iSxQP/0uaPXsPgmAEzLtEC6wvgvwWriVN7xz5x10Pw61ihzHww6deC9vQb5x5oKddWfktCr52BEs4bh7A7RWNIYTnR8XXWeYkvzmGFF9Qj6+eANoOSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A116qQxc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741004520; x=1772540520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G+PRDV5mfNwcg2FIzmfIzN2GOCgKDORUlKjOVJveauU=;
  b=A116qQxcSolLScuk5T7Hqqv+jfnbrRJEQoNR22Si5f8Bb6v56yoPQqj3
   cN3mWbTSH18Mfj+gQHJCc/MAg2QuM0emgtK1r3YHBEthebOKsWWXJeeCw
   ianGF6lY/F5/k3HgwBBcjeZmBagThwLuNEuc+zF8JnqPmnECaIj0m2Mfu
   4haETE6OhynGhX3CTp6+JwaSgjDhGlfpA2mR122OOpobNsrJXUCIvsFDg
   SQVU/+68KIERlJLKtGTAszjIdNdgCUCYe/uN3PjpEGVCktGVDM21qVa4p
   sRZj0Y7KmahsvY+wpMC9VIFgtSAKIhTbQvoOjuc/mw+3w2KzWpBIjRFAN
   g==;
X-CSE-ConnectionGUID: YoCtPTivRlOv6U5IEg8XyA==
X-CSE-MsgGUID: QI9cS949TkyykwzVtcfSGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41764148"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41764148"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 04:22:00 -0800
X-CSE-ConnectionGUID: OkgzZWZfRvG7oho8rGf9/A==
X-CSE-MsgGUID: tJWSFf8xQbGxJ7yS/srYmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="118690136"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 04:21:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tp4nz-0000000GoJJ-2Ykv;
	Mon, 03 Mar 2025 14:21:55 +0200
Date: Mon, 3 Mar 2025 14:21:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z8We4_FJvxTxegpN@smile.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-3-raag.jadav@intel.com>
 <Z8VmebNcrH6CjHp6@smile.fi.intel.com>
 <Z8WUpzDHbhp0aMoN@black.fi.intel.com>
 <Z8WWNHL1rZKV4c4o@smile.fi.intel.com>
 <Z8Wc73OytMx3khP_@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8Wc73OytMx3khP_@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 03, 2025 at 02:13:35PM +0200, Raag Jadav wrote:
> On Mon, Mar 03, 2025 at 01:44:52PM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 03, 2025 at 01:38:15PM +0200, Raag Jadav wrote:
> > > On Mon, Mar 03, 2025 at 10:21:13AM +0200, Andy Shevchenko wrote:
> > > > On Mon, Mar 03, 2025 at 10:17:42AM +0530, Raag Jadav wrote:

...

> > > > >  config GPIO_ELKHARTLAKE
> > > > >  	tristate "Intel Elkhart Lake PSE GPIO support"
> > > > > -	depends on X86 || COMPILE_TEST
> > > > > +	depends on (X86 && MFD_INTEL_EHL_PSE_GPIO) || COMPILE_TEST
> > > > >  	select GPIO_TANGIER
> > > > 
> > > > Looking on how GPIO PMIC drivers are written, I would redo this as
> > > > 
> > > > 	depends on (X86 || COMPILE_TEST) && MFD_INTEL_EHL_PSE_GPIO
> > > 
> > > True, but perhaps allow independent COMPILE_TEST where possible?
> > 
> > It will be tested in all-or-none way. Or you think it has to be tested
> > individually? If so, why is it needed?
> 
> Better CI coverage?

How? I do not see the difference, can you elaborate?
(Assuming that CIs are using the merge_config.sh approach or alike)

> We also have it for Intel pinctrl drivers.

This is unrelated to Intel pin control drivers.

-- 
With Best Regards,
Andy Shevchenko



