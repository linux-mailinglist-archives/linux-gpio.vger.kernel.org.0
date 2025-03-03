Return-Path: <linux-gpio+bounces-16950-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FA5A4C342
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 15:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 641AA3A6D57
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 14:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AD02116F0;
	Mon,  3 Mar 2025 14:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nk5hNzyo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CDF139579;
	Mon,  3 Mar 2025 14:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741011616; cv=none; b=stnlaY7w8x4LWnXGHFZXp4R5baTXJ/cmB9N4UIw8Xcc3bKTrifOkpCLj+O5Eb6M1PxDogd+rnzlwmsYLenxuk8kcSYGajyHwYr1Xnx3UIDxXegm4fg8eKPbHmz8vPqoc2eGGYGVSZVc//6cKcQnXSMWXnuKMl1I0ftyJDiLjVPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741011616; c=relaxed/simple;
	bh=a8BHr12KoOWLDNlx+Qcgvrp/1G02hHP8vZZD0zSmS/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=leWC3nnp8R7C0vNrdS+hAYuczd6HBXIm3j704gBCF9Cur3NMt15OP+nDbq+pmIlABfnYs5W8uENqr3bS5dUa+Ra8KAcvReWgyJX72/s49ZwJtttYdGljgxznBE8CgI0PkqS+w84jExiAL4GWwaOTi2bjQ+BEEfl1pbKnUDtrFL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nk5hNzyo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741011615; x=1772547615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a8BHr12KoOWLDNlx+Qcgvrp/1G02hHP8vZZD0zSmS/k=;
  b=Nk5hNzyo2JNNHx3mZ12Dw7kbmz3y7Zf0cJP1lAzJTR9eFmmytQBCtUwg
   ijJPx2fpMiOCCU1Q27jKiad9fGOR4maGIfxyqyGTPUZUuM0DUKPQO3NCq
   gFy7nQenDVr6onceCQhGXuG8VGCfYP7aH/KBa27e2wPiZ40UMN1mkzjLE
   b+OgIcJuYpQPiJvIvOqTLPB/UJQfWdPnqQhksS1s1vf8Rf3SZhoT0+lzT
   cbg5frnP86TlPM1nzhwqeIF1ILpoPFbSohY9E8BXZQRGu0xbtdohaKMHt
   /E88uXW4QU0SARB87mLW9ZdwsKyrR4LTFHV8D2+HgpgNt+P5KHfpMjsSZ
   Q==;
X-CSE-ConnectionGUID: O1xrKHdETW6RU37TvyQAbg==
X-CSE-MsgGUID: sh6nB63TSPKpdR/P7MHhaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="45662577"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="45662577"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 06:20:13 -0800
X-CSE-ConnectionGUID: nkB3d6MSTNeO4QYIIC3irQ==
X-CSE-MsgGUID: N9dhJF6KQM+5GDso+IG/Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="123161535"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 06:20:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tp6eP-0000000Gpt5-06qC;
	Mon, 03 Mar 2025 16:20:09 +0200
Date: Mon, 3 Mar 2025 16:20:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z8W6mIl0z1Wxgv4c@smile.fi.intel.com>
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

I don't see much benefit out of this. If MFD is not available, the other
drivers may be built, but it won't make any practical sense except build for
the sake of build. I think when they are all together, it makes real sense
to compile test. MFD driver here is like a subsubsystem dependecy, we don't
usually compile the drivers without subsystem being enabled.

-- 
With Best Regards,
Andy Shevchenko



