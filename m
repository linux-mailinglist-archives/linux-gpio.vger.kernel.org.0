Return-Path: <linux-gpio+bounces-17049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C21CDA4E0DD
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 15:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57EAA1797FF
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 14:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6CC20766E;
	Tue,  4 Mar 2025 14:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i29LHU8q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761482066CE;
	Tue,  4 Mar 2025 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741098293; cv=none; b=ubC9PbjuGK1S5yIyCy9u/sq91gh8YyHAZFmszO+pnEvraFDVFcScQ15yg7XzwxlHN3pLW5VP9rXLh2nZHjCegyfcJxRvqyhYc4pb6vCXbW4Pj5eZHFX7gaq0Yxg972R/lgu06SMYlpHb0dq+XKRqZYACp4xsJTwaADZIOWjRVSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741098293; c=relaxed/simple;
	bh=wg2HTDH+GhCY1HuZynJsDoXu0dgUu5HmFEb9Fd89oeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDxUDdF1tb5JQ6bxAkPn7tcbC9RKajk612ZM3KAtIgXxH8ljxePLmx9K4I8el/I2P2aINOsJRN2JmC3AfXI7h/0zHGXxbbxO3RoahdevjamxoW1y3lzsrwGIVpqn+pMEc8DlFsudaLpal6uR0fRrO8/F0Z1dA28bExIoMznw8qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i29LHU8q; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741098291; x=1772634291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wg2HTDH+GhCY1HuZynJsDoXu0dgUu5HmFEb9Fd89oeE=;
  b=i29LHU8qL0SMz46b3EgvfaVjvUv4U2c9qlOPDVyTocT1fl47aY8T6eSL
   ofttRDmLmRvKQMUqG2lkRtWLGVe0IMhg54tSy7vkiHjVtCzbbZyHKkyjE
   v9GeauMjGaO9cNmwZEpv4UiEJUTgMbsmZMUYUuHWv+uiLaNMVJ+k0VxGY
   RSEyRi5GhO2rkQFUDOUaevfvYErJQJ7N4AiyIXPvAAWJfaza4gEI9QE1V
   +sXKGd02ihySw+YMNS5ABQMPPI387+DZWqzwCJgUL/YtGucmbE+O8eBEM
   W+re3YsJnkGJav1gAU+c6F98IhyjfrxUgaPoj9ouNFIS0pzR6aImHpRAI
   Q==;
X-CSE-ConnectionGUID: rgpIGLpuQYSO3iv84PvzOQ==
X-CSE-MsgGUID: B+0h+9NJTT6DAMcRmPuvUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53419577"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="53419577"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 06:24:50 -0800
X-CSE-ConnectionGUID: mkkJ+bYxQyKCGZikjCSwgA==
X-CSE-MsgGUID: yrH2c8RtT1CBUnM+5PEMSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123587289"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 06:24:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tpTCP-0000000H9Du-4B7m;
	Tue, 04 Mar 2025 16:24:45 +0200
Date: Tue, 4 Mar 2025 16:24:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z8cNLcTIrPZ6AoRd@smile.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-3-raag.jadav@intel.com>
 <Z8VmebNcrH6CjHp6@smile.fi.intel.com>
 <Z8WUpzDHbhp0aMoN@black.fi.intel.com>
 <Z8WWNHL1rZKV4c4o@smile.fi.intel.com>
 <Z8Wc73OytMx3khP_@black.fi.intel.com>
 <Z8We4_FJvxTxegpN@smile.fi.intel.com>
 <Z8WkoPVk2SsSj5aR@black.fi.intel.com>
 <Z8WsfXV1vMlRxzLi@smile.fi.intel.com>
 <Z8W2R0DUS6lctU8v@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8W2R0DUS6lctU8v@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 03, 2025 at 04:01:43PM +0200, Raag Jadav wrote:
> On Mon, Mar 03, 2025 at 03:19:57PM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 03, 2025 at 02:46:24PM +0200, Raag Jadav wrote:
> > > On Mon, Mar 03, 2025 at 02:21:55PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Mar 03, 2025 at 02:13:35PM +0200, Raag Jadav wrote:
> > > > > On Mon, Mar 03, 2025 at 01:44:52PM +0200, Andy Shevchenko wrote:
> > > > > > On Mon, Mar 03, 2025 at 01:38:15PM +0200, Raag Jadav wrote:
> > > > > > > On Mon, Mar 03, 2025 at 10:21:13AM +0200, Andy Shevchenko wrote:
> > > > > > > > On Mon, Mar 03, 2025 at 10:17:42AM +0530, Raag Jadav wrote:

...

> > > > > Better CI coverage?
> > > > 
> > > > How? I do not see the difference, can you elaborate?
> > > > (Assuming that CIs are using the merge_config.sh approach or alike)
> > > 
> > > That is my understanding of it.
> > > 
> > > config COMPILE_TEST
> > >         bool "Compile also drivers which will not load"
> > >         depends on HAS_IOMEM
> > >         help
> > >           Some drivers can be compiled on a different platform than they are
> > >           intended to be run on. Despite they cannot be loaded there (or even
> > >           when they load they cannot be used due to missing HW support),
> > >           developers still, opposing to distributors, might want to build such
> > >           drivers to compile-test them.
> > 
> > Yes, and how does my suggestion prevent from this happening?
> 
> Nothing's preventing it, but since we have an opportunity to allow
> a wider build test (even without arch or mfd dependency), shouldn't
> we allow it?

We are going circles here. My point that there is a little sense to do that
without MFD as it's impractical. On top of that this is inconsistent to other
drivers with similar design.

-- 
With Best Regards,
Andy Shevchenko



