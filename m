Return-Path: <linux-gpio+bounces-17031-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1851BA4DCA2
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 12:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40708174BCC
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 11:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4C11FF617;
	Tue,  4 Mar 2025 11:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCn9SkQd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD17C1F03C0;
	Tue,  4 Mar 2025 11:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741087924; cv=none; b=OESUF333XAUyrJXsVLvRkfOyMuf4Nyij1v8t5igSqlVINSux7OtW0I4fUI8SsXPbx83FDyYp8PFa4x54rB5twbBrVj+phuLGyRRi10CaI7xHTYlUiUUreJNHWog6Q7Osjsok5SdNy1wmEehmfjkR0ydJxuVgqKbiC0AYnnNDNyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741087924; c=relaxed/simple;
	bh=dYdrpV4f53Pf15wG9E+IZED7oIKxGdIev63lsDAnZOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIRjhdKlLzhpFGbf1GM1pptsHiA3oCd+rN6YzuR50QU0YzMQnbyL48k3ctxtR7oJCP5GHK/rZj5xsvHIc3EkU9iGuhzXkY/9u1R8EnUa7QglO1h7ZXY/XRhHxzlz7xz5THZROTvmDbzwX6WObyUTTKVCBnyy3dKhAEUTGMpm8So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oCn9SkQd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741087923; x=1772623923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dYdrpV4f53Pf15wG9E+IZED7oIKxGdIev63lsDAnZOc=;
  b=oCn9SkQdNPdlPDV7+4CInkbmmqjtyrp7euzedqMp9a65fG31MnkQjKpN
   6enEJjYQeYxyE85IijNuIwu8tXeLhsttNtpDFU199+XGh2CerrynYEw1E
   VqpAccdnelU3xNVZQP4eJB6xnNHqNHJKg5TMC9pFIam4ipPcjxq/Cw1Rs
   e6QVaBdRThVLoABDCc07/l8r9q7PBKS/iNBTvtFUvNCMmDrkC1WErujD7
   B5O+Z2+39RKPZZDWv6KixxTb9vuEzlw5k2eExr6ZgZl6LfPH6w7gI3G4C
   XMASRErnex3J6C0jS7aUKxjracBQwymr9B8HgfA5OBJx8+VVyU70oMrV4
   g==;
X-CSE-ConnectionGUID: Y5QFx9OvTRuI7GVrqeE1/Q==
X-CSE-MsgGUID: wX+h0pgaTDeiFSQdHSaugw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="42028870"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="42028870"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 03:32:03 -0800
X-CSE-ConnectionGUID: GGOlQ1zvSPCXfVlCT7lhyA==
X-CSE-MsgGUID: 26JKwQYsS4OahLvMW67Pnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="118160113"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 03:32:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tpQVB-0000000H6dK-2uwV;
	Tue, 04 Mar 2025 13:31:57 +0200
Date: Tue, 4 Mar 2025 13:31:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z8bkrZErEa3o_-_1@smile.fi.intel.com>
References: <Z8VmebNcrH6CjHp6@smile.fi.intel.com>
 <Z8WUpzDHbhp0aMoN@black.fi.intel.com>
 <Z8WWNHL1rZKV4c4o@smile.fi.intel.com>
 <Z8Wc73OytMx3khP_@black.fi.intel.com>
 <Z8We4_FJvxTxegpN@smile.fi.intel.com>
 <Z8WkoPVk2SsSj5aR@black.fi.intel.com>
 <Z8WsfXV1vMlRxzLi@smile.fi.intel.com>
 <Z8W2R0DUS6lctU8v@black.fi.intel.com>
 <Z8W6mIl0z1Wxgv4c@smile.fi.intel.com>
 <Z8aOD7qCzp-a0M1A@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8aOD7qCzp-a0M1A@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 04, 2025 at 07:22:23AM +0200, Raag Jadav wrote:
> On Mon, Mar 03, 2025 at 04:20:08PM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 03, 2025 at 04:01:43PM +0200, Raag Jadav wrote:
> > > On Mon, Mar 03, 2025 at 03:19:57PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Mar 03, 2025 at 02:46:24PM +0200, Raag Jadav wrote:
> > > > > On Mon, Mar 03, 2025 at 02:21:55PM +0200, Andy Shevchenko wrote:
> > > > > > On Mon, Mar 03, 2025 at 02:13:35PM +0200, Raag Jadav wrote:
> > > > > > > On Mon, Mar 03, 2025 at 01:44:52PM +0200, Andy Shevchenko wrote:
> > > > > > > > On Mon, Mar 03, 2025 at 01:38:15PM +0200, Raag Jadav wrote:
> > > > > > > > > On Mon, Mar 03, 2025 at 10:21:13AM +0200, Andy Shevchenko wrote:
> > > > > > > > > > On Mon, Mar 03, 2025 at 10:17:42AM +0530, Raag Jadav wrote:

...

> > > > > > > Better CI coverage?
> > > > > > 
> > > > > > How? I do not see the difference, can you elaborate?
> > > > > > (Assuming that CIs are using the merge_config.sh approach or alike)
> > > > > 
> > > > > That is my understanding of it.
> > > > > 
> > > > > config COMPILE_TEST
> > > > >         bool "Compile also drivers which will not load"
> > > > >         depends on HAS_IOMEM
> > > > >         help
> > > > >           Some drivers can be compiled on a different platform than they are
> > > > >           intended to be run on. Despite they cannot be loaded there (or even
> > > > >           when they load they cannot be used due to missing HW support),
> > > > >           developers still, opposing to distributors, might want to build such
> > > > >           drivers to compile-test them.
> > > > 
> > > > Yes, and how does my suggestion prevent from this happening?
> > > 
> > > Nothing's preventing it, but since we have an opportunity to allow
> > > a wider build test (even without arch or mfd dependency), shouldn't
> > > we allow it?
> > 
> > I don't see much benefit out of this. If MFD is not available, the other
> > drivers may be built, but it won't make any practical sense except build for
> > the sake of build. I think when they are all together, it makes real sense
> > to compile test. MFD driver here is like a subsubsystem dependecy, we don't
> > usually compile the drivers without subsystem being enabled.
> 
> I thought the point of COMPILE_TEST is to do exactly that, but sure if
> you insist.

I think it's okay to compile test the whole batch of the related to each other
drivers, they are not many and again, the configuration that MFD is absent and
leaf drivers are built sounds to me impractical, so not really used in the real
life. If the leaf driver makes sense separately on some future HW or HW designs,
then we might reconsider the dependencies.

-- 
With Best Regards,
Andy Shevchenko



