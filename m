Return-Path: <linux-gpio+bounces-16941-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1FCA4C1CA
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 14:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D508A1651B9
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB522135A4;
	Mon,  3 Mar 2025 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCd9nPEh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231BB213220;
	Mon,  3 Mar 2025 13:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741008020; cv=none; b=vDv6nNzbbZ26lJKQ+/qn72ylyt0il9h9TPOLhYfmxg1aexvOucU5BpV1LxI4xInXXVpH91Zn5xvERqVApvotKi7GAWIKXcuiyOf0rX/M52sJ+SzsjU1QRjHr+8QQjXCg3dTNlhdiBdCnsWmAJRbVmK/kiMCiEY8dkr/V3E5lpAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741008020; c=relaxed/simple;
	bh=DoHtbly6OqQpPsXYB7Yz7N/tBKfbuLKIyWpcMK4CwFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSk7kpZ0s53tasylnwqJ9ocNjMlgHgKzLMtsCtCERzYQbZrIk5/b8ck8FPOhWN3OP4yMy1ZZOWY7DJBDUU0xR2AgG9g+/ye6EmmPWmNQqhlDSTxlZcjVHFEjRN8R6S7tiHdQ0kL5iLmG8UA/kuy/28/U8jClxPjbohTSUpEle84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oCd9nPEh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741008019; x=1772544019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DoHtbly6OqQpPsXYB7Yz7N/tBKfbuLKIyWpcMK4CwFo=;
  b=oCd9nPEhRJCFv5OXapMNZhByEkD7968XXBw7VnHVDJz5zdPqqwcTKYll
   R6gze13L8+LeAd8LNVH32gSUZ32RfozbY670k4zHqmXG1JopKPvHmB7j0
   9GjFRBMkc9s51ZXPYEJbC3fygIVrlwyxLHLgrOLlyP287uPcuGUiuavst
   NN07rC8Fj2Bz4qX9pQs3I4ISacw8XMFsZHzCKk+0JautrO4o6jeQ3qERR
   djogBd1Z2Sb9temkks7XsDsvlxq6RiX6LUTo+IbUx4EP9fEA2elmjJaAS
   EAPkquicDDqnvboy9ux7LzfwksWFIkgiCToX9i3NzR4mSaDOeB291BpKz
   g==;
X-CSE-ConnectionGUID: MF+WoguvRo+mqOLfMH5E7Q==
X-CSE-MsgGUID: f9dNsUKsQxuKwYGvlezqsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="59429830"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="59429830"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 05:20:18 -0800
X-CSE-ConnectionGUID: mt11TYzNRPW/agOzS/uISg==
X-CSE-MsgGUID: uWzCGyk3RKCPxmAOHfa1zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118545925"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 05:20:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tp5iO-0000000Gp3l-1pxj;
	Mon, 03 Mar 2025 15:20:12 +0200
Date: Mon, 3 Mar 2025 15:20:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <Z8WsjP-cuE2CAbjg@smile.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-2-raag.jadav@intel.com>
 <Z8VnSyH_DBuJpW2o@smile.fi.intel.com>
 <Z8WU5NiIsu34Gz-Z@black.fi.intel.com>
 <Z8WWXxTrd1e5V3qb@smile.fi.intel.com>
 <Z8WdK7wkNnAerkCO@black.fi.intel.com>
 <Z8WfESNmu4MjEbcx@smile.fi.intel.com>
 <Z8Wk4dj7MvrW1-Ou@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8Wk4dj7MvrW1-Ou@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 03, 2025 at 02:47:29PM +0200, Raag Jadav wrote:
> On Mon, Mar 03, 2025 at 02:22:41PM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 03, 2025 at 02:14:35PM +0200, Raag Jadav wrote:
> > > On Mon, Mar 03, 2025 at 01:45:35PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Mar 03, 2025 at 01:39:16PM +0200, Raag Jadav wrote:
> > > > > On Mon, Mar 03, 2025 at 10:24:43AM +0200, Andy Shevchenko wrote:
> > > > > > On Mon, Mar 03, 2025 at 10:17:41AM +0530, Raag Jadav wrote:

...

> > > > > > > +INTEL GPIO MFD DRIVER
> > > > > > 
> > > > > > This also needs to be more precise and follow the name. We have more Intel GPIO
> > > > > > drivers, and MFD doesn't ring any bell about the platform or so. Are you going
> > > > > > to support all of them (existing and comining)?
> > > > > 
> > > > > Not that it is planned as of now but I wouldn't mind :)
> > > > 
> > > > It sounds like solving the problem that even might never appear :-)
> > > 
> > > Right, somehow that sounds familiar :D
> > 
> > So, can we rename the MAINTAINERS record as the result of our discussion?
> 
> Yep, but perhaps wait a few days for review comments.

Sure.

-- 
With Best Regards,
Andy Shevchenko



