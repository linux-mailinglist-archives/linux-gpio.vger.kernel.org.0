Return-Path: <linux-gpio+bounces-16940-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 207CDA4C1C9
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 14:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D234E18972CE
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FEC62116F3;
	Mon,  3 Mar 2025 13:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKKkhAQ0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946DC211A12;
	Mon,  3 Mar 2025 13:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741008005; cv=none; b=TYLQc7c8Rhfh7Ce7vB+xuT132NWKQB8cgUyizw4ROHs+JelpOalsPHlwIaIjO9PhePuPzhwo0bDD+c+t6cguFq08bVFKoC/TloRO/NMoa1z2edgcLbSF6wQZsVXdsLQzj+ROe6FLXjKtt2ctpInaQ1zMzSrfuZZxbloeFhOJBHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741008005; c=relaxed/simple;
	bh=5Bi9tpBvMEy1g7Rwbo21a9D+3xA4lnu7AV5WMJDAtE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LuZg1ELKwOBCZqgJGvCfF9aK51ZFpeb/LzX6BgxMQThJRQD7ON4IL/EsT3vJ82F9BHVs7F9q0cok8Ou9TBcN5DNsB9k8B5jT9uxxHOJsTsIiD4IM28X7DUhAHd1t5jJ4d++/HrkH+jyCnME5Q3/9FskRq4OPjpkfEC8wROAsvXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKKkhAQ0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741008004; x=1772544004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Bi9tpBvMEy1g7Rwbo21a9D+3xA4lnu7AV5WMJDAtE4=;
  b=gKKkhAQ0OVpso8sjXq3+tu3tM6gMT3X7mnnnYdrbyJ9rZNyv59U5JXFZ
   LAjpeLEBH7ulF6f8cW+L1k2MVlrE4V6yKndJIAWn9MT25wBj1E16Ub9sm
   kh053cs3adw3FJjd4jhtZsVdU64zQa8pj/YKbURzXDgGEdREE5q4isi4m
   sBjLL3sfTSc0/9RKVx0Kn+5r31wyE6KqXWoRFWh6OKVBRDjXqOyqI34lI
   hOEewfEwhbDyjt8bRwIg8iisW272qHL+/SESMV+HjP/59+Hjqtvq5Wt2b
   E9oFYUDduif4gVwtSEOc1o8j7u7CGWyzrHUbQOq9raURkX2i6zZcAlGSU
   w==;
X-CSE-ConnectionGUID: 179y/nBESNyazk5PPXHEFQ==
X-CSE-MsgGUID: O82zqH6ST9mW9/roJrjXEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="53286451"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="53286451"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 05:20:03 -0800
X-CSE-ConnectionGUID: ZxPh3uD4Sz2/qZu5rEyOgA==
X-CSE-MsgGUID: LGC71/dNR2yXUyKyZ6Wkkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="141220463"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 05:20:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tp5iA-0000000Gp3Y-1CKW;
	Mon, 03 Mar 2025 15:19:58 +0200
Date: Mon, 3 Mar 2025 15:19:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z8WsfXV1vMlRxzLi@smile.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-3-raag.jadav@intel.com>
 <Z8VmebNcrH6CjHp6@smile.fi.intel.com>
 <Z8WUpzDHbhp0aMoN@black.fi.intel.com>
 <Z8WWNHL1rZKV4c4o@smile.fi.intel.com>
 <Z8Wc73OytMx3khP_@black.fi.intel.com>
 <Z8We4_FJvxTxegpN@smile.fi.intel.com>
 <Z8WkoPVk2SsSj5aR@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8WkoPVk2SsSj5aR@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 03, 2025 at 02:46:24PM +0200, Raag Jadav wrote:
> On Mon, Mar 03, 2025 at 02:21:55PM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 03, 2025 at 02:13:35PM +0200, Raag Jadav wrote:
> > > On Mon, Mar 03, 2025 at 01:44:52PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Mar 03, 2025 at 01:38:15PM +0200, Raag Jadav wrote:
> > > > > On Mon, Mar 03, 2025 at 10:21:13AM +0200, Andy Shevchenko wrote:
> > > > > > On Mon, Mar 03, 2025 at 10:17:42AM +0530, Raag Jadav wrote:

...

> > > > > > >  config GPIO_ELKHARTLAKE
> > > > > > >  	tristate "Intel Elkhart Lake PSE GPIO support"
> > > > > > > -	depends on X86 || COMPILE_TEST
> > > > > > > +	depends on (X86 && MFD_INTEL_EHL_PSE_GPIO) || COMPILE_TEST
> > > > > > >  	select GPIO_TANGIER
> > > > > > 
> > > > > > Looking on how GPIO PMIC drivers are written, I would redo this as
> > > > > > 
> > > > > > 	depends on (X86 || COMPILE_TEST) && MFD_INTEL_EHL_PSE_GPIO
> > > > > 
> > > > > True, but perhaps allow independent COMPILE_TEST where possible?
> > > > 
> > > > It will be tested in all-or-none way. Or you think it has to be tested
> > > > individually? If so, why is it needed?
> > > 
> > > Better CI coverage?
> > 
> > How? I do not see the difference, can you elaborate?
> > (Assuming that CIs are using the merge_config.sh approach or alike)
> 
> That is my understanding of it.
> 
> config COMPILE_TEST
>         bool "Compile also drivers which will not load"
>         depends on HAS_IOMEM
>         help
>           Some drivers can be compiled on a different platform than they are
>           intended to be run on. Despite they cannot be loaded there (or even
>           when they load they cannot be used due to missing HW support),
>           developers still, opposing to distributors, might want to build such
>           drivers to compile-test them.

Yes, and how does my suggestion prevent from this happening?

-- 
With Best Regards,
Andy Shevchenko



