Return-Path: <linux-gpio+bounces-23165-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78175B02003
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 17:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03FA43ACACC
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 15:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED69E2EA48D;
	Fri, 11 Jul 2025 15:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRJ1fIcG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAE62EA48B;
	Fri, 11 Jul 2025 15:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752246119; cv=none; b=rfJCFuuWVdez/t0hzo+OG6zMou5QD/cH64pvVbmzDvBECro5bTqd/8EMdBxRFDJ4szh7jvGy/xJEjZVnhUu8YZuIlnuO0hqPIRat/9OIHiDeKc6lOQMhhiGx3rvInpnN1GL0n27+uCC6+uCUCV2/Y03oJeH1lpTQjzDa2uEo4xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752246119; c=relaxed/simple;
	bh=j3OVLr0LSiuE4TUBEpAGHAdIT/3phHQ2DKa4B07s1ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfielyfT4cbp1XscNDbEDf9BgJ6R+Ak3N7buHMS0TQLMmVSLfWh8kKO6CKAVcnRW6FebGuWia1nv06tcR57qq2vBaBmqDDD86xTXhW+B41onLT70XNVZ4GNvgMFOSmq1bABoyhf5tM0ij+6R3lVGz3KaED/oYMiExGJnXeOu1ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRJ1fIcG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752246118; x=1783782118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=j3OVLr0LSiuE4TUBEpAGHAdIT/3phHQ2DKa4B07s1ww=;
  b=cRJ1fIcGlq3EXlIxX9k7htrJZsRK/tkLu0qJVnIiidqmBzgTMboqAlFU
   /YapM6XwBqsimAgcCsIE8wdC/5Pf2TIjPAvHLe89+xRub1uM8/aurVl4y
   CnWtZQ5FvV0oVmXVmYWgnXZJodkkoJtpJalSq+mTkPztyvVPpgcT7uS/Q
   RFdMjjigsEw8A9yWxLYd2b0pZ9yMOHE6h9BEnAtRob6W+mk93q0rCVnbf
   iXEzHysd97fhihwuhvMJQ2I4Nz6wQVyaXh9TzXdN9QH3e6FKA45xfuNyH
   K8tpeUoVPc1oy7gBMT82/DzppwFbv036+T9I0YiiszGVDFkZuHHFVqeBf
   w==;
X-CSE-ConnectionGUID: Z9hy3DgdSCSLjMIaLyoalA==
X-CSE-MsgGUID: /MVB0G+YRu+SuDIDnXCJHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58209323"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="58209323"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 08:01:46 -0700
X-CSE-ConnectionGUID: p2dciu18Qk+nmDx+m/ru6w==
X-CSE-MsgGUID: Uh59VyliR7WkBwn4IzQo0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="156173112"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 08:01:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uaFFu-0000000EYjo-0ASJ;
	Fri, 11 Jul 2025 18:01:42 +0300
Date: Fri, 11 Jul 2025 18:01:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marcos Del Sol Vives <marcos@orca.pet>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpio: vortex: add new GPIO device driver
Message-ID: <aHEnVTCSwfdijvzQ@smile.fi.intel.com>
References: <20250709091542.968968-1-marcos@orca.pet>
 <CAMRc=MdLXP=DgHEh6hoNYhDgB4aESmC29VH6hsH=AONNgsjXQQ@mail.gmail.com>
 <e00c97c2-04f4-4683-9c56-8894617998fa@orca.pet>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e00c97c2-04f4-4683-9c56-8894617998fa@orca.pet>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 11, 2025 at 04:24:41PM +0200, Marcos Del Sol Vives wrote:
> El 11/07/2025 a las 12:19, Bartosz Golaszewski escribió:

> > This looks better but I admit I'm not an expert in x86 platforms so
> > I'll allow myself to Cc Andy. Is this how it's typically done in x86?
> > Is this module visible in ACPI in any way that would allow us to
> > leverage the platform device core? Or do we need to try to register
> > the device unconditionally on all Vortex platforms?
> 
> Again I want to point out I am not an expert by any means. This is my first
> kernel driver and I am writting it as a hobbyst, not as a company employee.

Oh, I see. Sorry that I'm asking too much (do I?) Unfortunately the review
might be not well appreciated process by the author, but we are all for
having the better solutions. That's the part of learning and R&D process.

As for this discussion it seems you already committed into enormous work
to gather all pieces and knowledge, but we need more.

> Regarding ACPI: I have just now decompiled the DSDT for the Vortex86DX3
> machine and I do not see any Device() claiming ownership of 0x78 or 0x98,
> or mentioning GPIO at all:
> 
> root@vdx3:/home/marcos/acpi# ls -l *.dsl
> -rw-r--r-- 1 root root   3459 Jul 11 16:05 APIC.dsl
> -rw-r--r-- 1 root root 196800 Jul 11 16:05 DSDT.dsl
> -rw-r--r-- 1 root root   9211 Jul 11 16:22 FACP.dsl
> -rw-r--r-- 1 root root   1364 Jul 11 16:22 FACS.dsl
> -rw-r--r-- 1 root root   1552 Jul 11 16:23 MSDM.dsl
> -rw-r--r-- 1 root root      0 Jul 11 16:07 OEMB.dsl
> -rw-r--r-- 1 root root   3957 Jul 11 16:07 SLIC.dsl
> root@vdx3:/home/marcos/acpi# grep -Ri gpio *.dsl
> root@vdx3:/home/marcos/acpi# grep -Ri 0x0078 *.dsl

Oh, it's not as easy as grepping. One need to read and understand the ACPI
language for that.

> Manually skimming through DSDT does not yield anything useful either.
> 
> This kinda confirms what the company told me: the machine does not properly
> support ACPI, it has a set of fake tables enough to convince Windows 7 into
> booting.

Let's see! As I asked in the previous mail, please share some information in
full.

> The Vortex86MX board does not even have those, and has no ACPI tables
> whatsoever.

Yeah, but you can create them from scratch if you wish. I once have done
this for Intel Merrifield (in U-Boot) and it went pretty well. From that
time we use that board as regular PC.

> And regarding something I forgot to answer on the previous email about the
> future of these machines: the Vortex86MX is a i586 processor, and this
> Vortex86DX3 is a dual-core i686 processor with SSE1 support that I myself
> bought brand new from the manufacturer, indicating they are still making
> and supporting them.

Would be nice to get the updated documentation... But it might be not available
or at best under NDA.

> The company is seemingly launching next year also a Vortex86EX3 with proper
> i686 and SSE2 support, I guess because Intel's patents have finally expired.
> 
> So I do not think removing i486 support is gonna be an issue except for
> very ancient processors that the company is not making anymore anyway.

Thanks for clarifications here!

And thank you for your efforts, I would like to help as much as I can.
Again, sorry, if my first messages looked a bit rejecting. I do not mean
that, it's just a professional deformation due to tons of reviews I have
done in the past.

-- 
With Best Regards,
Andy Shevchenko



