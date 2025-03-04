Return-Path: <linux-gpio+bounces-16984-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4A1A4D2F3
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 06:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BD6A18972F2
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 05:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E8B1F4617;
	Tue,  4 Mar 2025 05:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkdgDOLL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463551DC985;
	Tue,  4 Mar 2025 05:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741065908; cv=none; b=HBUw8/VtzMMJZEmrZ9jNBT8HKJa70GqqTsDvs544UcYuqouUiIAEihuRj9UbOWlChwyKy1oZdmXCSrYzhLOdxJL0/18xs/KPizGBBVWm9kbSFxyiqpGvlxGtXa62uY1AwXZalLsi42M8y79GpLdRIMxJjyCsS9EjftX+cvJnLkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741065908; c=relaxed/simple;
	bh=Nuj/rRdVlqjzVrQJ/x7RSKV21fO+f6WegxjKPVLjjAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNtjzai6P8j5oqgMVPllejhdyl4Vd0/3QGHr+Y/LgVEYTqrGMY44Vv8u+TMcep/rYU1euubyjh9Jhkojn1Hlod3/lhE6sECJMpswN+Ma9DIgKJloAApGm5N+kt63tKm14zDSCOv82WzCI2Q5zPIGichRvZjBwR8s19epp1WXgRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkdgDOLL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741065906; x=1772601906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nuj/rRdVlqjzVrQJ/x7RSKV21fO+f6WegxjKPVLjjAA=;
  b=ZkdgDOLLzZlCeEW8rPeSk5J6+C40gJ+AsJAppW5zx+t/fKIU5pC7iVLj
   flRfBiTczCL1fytD5XYOIeN/pA/yfCXJd2YbRll0I0WxHEFPknUXgaqnq
   thdxDfkl+lCyNIoLeK1yKKg+CifPbR+TmEuhH0EIZyBVcwNfRg5emIN+1
   L0bA4FQT86mUk8be7rU/xuVfTz7O+FeUwUQ5WWXVAuaO6ISLoiAEXKBHm
   To/cwC7gAobNb/3H9stOYw+au0+S/VZmdL9bnTgdoxJVMvpvbthcvzqz9
   9fbmg2gsslweE2U/lBtkxCsHRs8wLOTA+Hp9soo3E+w5ESG6Rw1VmRGEJ
   A==;
X-CSE-ConnectionGUID: w9nFod3ZSCiGsw13NjgiWw==
X-CSE-MsgGUID: WzjKGnmMTMmPbbg0X16ZTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="53360665"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="53360665"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 21:25:06 -0800
X-CSE-ConnectionGUID: //lqGTv2Q+qRq25W1Oq2Fw==
X-CSE-MsgGUID: p5Z1iYeZQ/WiPbghYtBB0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="118279700"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 21:25:04 -0800
Date: Tue, 4 Mar 2025 07:25:00 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <Z8aOrCmmfm4rn0k3@black.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-2-raag.jadav@intel.com>
 <Z8VnSyH_DBuJpW2o@smile.fi.intel.com>
 <Z8WU5NiIsu34Gz-Z@black.fi.intel.com>
 <Z8WWXxTrd1e5V3qb@smile.fi.intel.com>
 <Z8WdK7wkNnAerkCO@black.fi.intel.com>
 <Z8WfESNmu4MjEbcx@smile.fi.intel.com>
 <Z8Wk4dj7MvrW1-Ou@black.fi.intel.com>
 <Z8WsjP-cuE2CAbjg@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8WsjP-cuE2CAbjg@smile.fi.intel.com>

On Mon, Mar 03, 2025 at 03:20:12PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 03, 2025 at 02:47:29PM +0200, Raag Jadav wrote:
> > On Mon, Mar 03, 2025 at 02:22:41PM +0200, Andy Shevchenko wrote:
> > > On Mon, Mar 03, 2025 at 02:14:35PM +0200, Raag Jadav wrote:
> > > > On Mon, Mar 03, 2025 at 01:45:35PM +0200, Andy Shevchenko wrote:
> > > > > On Mon, Mar 03, 2025 at 01:39:16PM +0200, Raag Jadav wrote:
> > > > > > On Mon, Mar 03, 2025 at 10:24:43AM +0200, Andy Shevchenko wrote:
> > > > > > > On Mon, Mar 03, 2025 at 10:17:41AM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > > > > > > +INTEL GPIO MFD DRIVER
> > > > > > > 
> > > > > > > This also needs to be more precise and follow the name. We have more Intel GPIO
> > > > > > > drivers, and MFD doesn't ring any bell about the platform or so. Are you going
> > > > > > > to support all of them (existing and comining)?
> > > > > > 
> > > > > > Not that it is planned as of now but I wouldn't mind :)
> > > > > 
> > > > > It sounds like solving the problem that even might never appear :-)
> > > > 
> > > > Right, somehow that sounds familiar :D
> > > 
> > > So, can we rename the MAINTAINERS record as the result of our discussion?
> > 
> > Yep, but perhaps wait a few days for review comments.
> 
> Sure.

Or can we just add it under INTEL GPIO DRIVERS? With that I think it'll
be in much better hands.

Raag

