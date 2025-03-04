Return-Path: <linux-gpio+bounces-16983-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A2EA4D2EB
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 06:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF17D1710DC
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 05:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34041F3FE8;
	Tue,  4 Mar 2025 05:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lo0xFvW8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FCD1DC985;
	Tue,  4 Mar 2025 05:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741065751; cv=none; b=o35E9xkGL7O2GK3Z7/Gs8vmr0vt9BHqGgkBpt+V+rjjoSVakWRvSLhs2OM0A2oTxm6AOtMNsaxTmQYic1BMzCo9MA8Eec0Y40UeSr9L7icCpLQrjGt7FJ0spqSWGdXvTDl5ijKnGIH1nxiNigIZhQURzNBj7s5gjxUQXa+tKoTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741065751; c=relaxed/simple;
	bh=IPlsvJ/wH9LhkF368ELMZRmGKbIn1DHgRW3ZtwACyUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jpx877jjGTZx5o6i4r5nRGz+cQFH16L5c5p8P/nnhmObt4MfdNb5A/oh5RaPY9lVq8cBsDkc3767cCpeMTktyCDFDx26R0CUp7MYq8kT1huMJpB4Ob/KlcAu/0b1+sTE3MiDU6Bsk1xrUU0OYxzEdxlUK/oowRCoJwhXnFUM6To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lo0xFvW8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741065750; x=1772601750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IPlsvJ/wH9LhkF368ELMZRmGKbIn1DHgRW3ZtwACyUE=;
  b=Lo0xFvW8EuY9D29ayoO57zXzmls7PjJmPqDj9AiXLJUt6P0nQ0q4nYY+
   YR3pBYNXoTqHCjW+jbXidM6OCtbXmqa1yx5Nl6BaLtfu4gabaIXfwCJk1
   liXNrto1F+1deW0zOCZp3HyDyIalw/7xjyJDd2o0Kp6LzeS1eFvU2wBzh
   OnIZhiVOKF7LXid4TrajkgXo418UwhUzN8Kfm3S0gCZthkej0Fg8neOhk
   2GPkuzZ+7ofJBMcc2fyd1HZpe0yWXmnQj4PoUsmdpE/e3bahmnRvV0y/A
   iMlN80Eadds9cKRmADcVusYht2AtT2j61StbT+vuM2/VdGqlf9bDfUEmU
   Q==;
X-CSE-ConnectionGUID: GDwkOwZcSkCjMuGelBmyfA==
X-CSE-MsgGUID: 7gWZBclsRw6uZT/6GiPy9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="53360406"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="53360406"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 21:22:29 -0800
X-CSE-ConnectionGUID: t+siOAbfRHeUJ73VGNlfzw==
X-CSE-MsgGUID: 6TSrAiS8TEeque2+44l3dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="118279260"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 21:22:27 -0800
Date: Tue, 4 Mar 2025 07:22:23 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z8aOD7qCzp-a0M1A@black.fi.intel.com>
References: <20250303044745.268964-3-raag.jadav@intel.com>
 <Z8VmebNcrH6CjHp6@smile.fi.intel.com>
 <Z8WUpzDHbhp0aMoN@black.fi.intel.com>
 <Z8WWNHL1rZKV4c4o@smile.fi.intel.com>
 <Z8Wc73OytMx3khP_@black.fi.intel.com>
 <Z8We4_FJvxTxegpN@smile.fi.intel.com>
 <Z8WkoPVk2SsSj5aR@black.fi.intel.com>
 <Z8WsfXV1vMlRxzLi@smile.fi.intel.com>
 <Z8W2R0DUS6lctU8v@black.fi.intel.com>
 <Z8W6mIl0z1Wxgv4c@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8W6mIl0z1Wxgv4c@smile.fi.intel.com>

On Mon, Mar 03, 2025 at 04:20:08PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 03, 2025 at 04:01:43PM +0200, Raag Jadav wrote:
> > On Mon, Mar 03, 2025 at 03:19:57PM +0200, Andy Shevchenko wrote:
> > > On Mon, Mar 03, 2025 at 02:46:24PM +0200, Raag Jadav wrote:
> > > > On Mon, Mar 03, 2025 at 02:21:55PM +0200, Andy Shevchenko wrote:
> > > > > On Mon, Mar 03, 2025 at 02:13:35PM +0200, Raag Jadav wrote:
> > > > > > On Mon, Mar 03, 2025 at 01:44:52PM +0200, Andy Shevchenko wrote:
> > > > > > > On Mon, Mar 03, 2025 at 01:38:15PM +0200, Raag Jadav wrote:
> > > > > > > > On Mon, Mar 03, 2025 at 10:21:13AM +0200, Andy Shevchenko wrote:
> > > > > > > > > On Mon, Mar 03, 2025 at 10:17:42AM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > > > > Better CI coverage?
> > > > > 
> > > > > How? I do not see the difference, can you elaborate?
> > > > > (Assuming that CIs are using the merge_config.sh approach or alike)
> > > > 
> > > > That is my understanding of it.
> > > > 
> > > > config COMPILE_TEST
> > > >         bool "Compile also drivers which will not load"
> > > >         depends on HAS_IOMEM
> > > >         help
> > > >           Some drivers can be compiled on a different platform than they are
> > > >           intended to be run on. Despite they cannot be loaded there (or even
> > > >           when they load they cannot be used due to missing HW support),
> > > >           developers still, opposing to distributors, might want to build such
> > > >           drivers to compile-test them.
> > > 
> > > Yes, and how does my suggestion prevent from this happening?
> > 
> > Nothing's preventing it, but since we have an opportunity to allow
> > a wider build test (even without arch or mfd dependency), shouldn't
> > we allow it?
> 
> I don't see much benefit out of this. If MFD is not available, the other
> drivers may be built, but it won't make any practical sense except build for
> the sake of build. I think when they are all together, it makes real sense
> to compile test. MFD driver here is like a subsubsystem dependecy, we don't
> usually compile the drivers without subsystem being enabled.

I thought the point of COMPILE_TEST is to do exactly that, but sure if
you insist.

Raag

