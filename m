Return-Path: <linux-gpio+bounces-17032-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A8EA4DCA6
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 12:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 000431689DE
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 11:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095F6200BA9;
	Tue,  4 Mar 2025 11:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXT054dV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A5F1FFC57;
	Tue,  4 Mar 2025 11:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741088031; cv=none; b=Zm5UpToWaroNyHL7BpIjLQ2sIepKyR55xxnXvhEvixMem7+j6BdQHQ/iy3z78FNiNHVxx5ufcHwJCeJTJfiqXQKjwKJ84iWDh3mzeCNSq+OYsCleSMXtpZmMirPSKfMiqOct2t/U/bONjCzR/2q4cgUuECHKXUD2eqpK9za9hSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741088031; c=relaxed/simple;
	bh=AlVvqupBjLUFUNHeQrtdwO6ytHutgypqaPMAgkdVlkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqTcygUgi84nocizT68fEQ+almxwLpcBMQOGC5BraILNm+HZau09gGoKW9ROO9N9KCjDAUpTmSigrklNnlRF4W+AZw8XZQBq9qYYa8UVVAyeOUEIsDnq7U8bQfpAANjcGmcfQbTxxjJ2Ls6sqxQpgkf7rUUlx9UIugO8J4tbqLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXT054dV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741088030; x=1772624030;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AlVvqupBjLUFUNHeQrtdwO6ytHutgypqaPMAgkdVlkE=;
  b=jXT054dVloeCjfia4JvxHfkrk9oZajdzT81IBnQWCcot8bJfVa7d5++M
   XFTXiRfY70Qlt4U//KqurvJFRnDhoPbQ4YyAoKvImOtsI33cWBOoJj/BU
   c+Oxdnq0ka+3fgzNuxY7FNobh2WkPfyfme3UbKo9ALk8Vb/RcBiqjKphp
   Rytsd/+nj+dBUPm7hXrrmAGu6Fkd9giK90i7qfPf4ejd4wOtm7VVfW5qp
   iKSYDBdn35z8/1NA34tr+RL4bRzuwnxuCiYlfKPtb+Aw87l67B2Ze5qZS
   pOsArJ+ErYdSMgkXWPgpJs65V0+jLB8rQGlFhPzh7k87TkGWtuBQO/cW3
   w==;
X-CSE-ConnectionGUID: MICvpKShQM2WjKxI1EM5Rg==
X-CSE-MsgGUID: f+QTQ+HEQeipL64newu45Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="45776053"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="45776053"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 03:33:50 -0800
X-CSE-ConnectionGUID: y+ozsxSPSlyfLnTkPmkARw==
X-CSE-MsgGUID: o4KH4gMITYa5wQNDgw+DzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123551302"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 03:33:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tpQWv-0000000H6f6-0idu;
	Tue, 04 Mar 2025 13:33:45 +0200
Date: Tue, 4 Mar 2025 13:33:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <Z8blGAwKDhmgpBK0@smile.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-2-raag.jadav@intel.com>
 <Z8VnSyH_DBuJpW2o@smile.fi.intel.com>
 <Z8WU5NiIsu34Gz-Z@black.fi.intel.com>
 <Z8WWXxTrd1e5V3qb@smile.fi.intel.com>
 <Z8WdK7wkNnAerkCO@black.fi.intel.com>
 <Z8WfESNmu4MjEbcx@smile.fi.intel.com>
 <Z8Wk4dj7MvrW1-Ou@black.fi.intel.com>
 <Z8WsjP-cuE2CAbjg@smile.fi.intel.com>
 <Z8aOrCmmfm4rn0k3@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8aOrCmmfm4rn0k3@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 04, 2025 at 07:25:00AM +0200, Raag Jadav wrote:
> On Mon, Mar 03, 2025 at 03:20:12PM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 03, 2025 at 02:47:29PM +0200, Raag Jadav wrote:
> > > On Mon, Mar 03, 2025 at 02:22:41PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Mar 03, 2025 at 02:14:35PM +0200, Raag Jadav wrote:
> > > > > On Mon, Mar 03, 2025 at 01:45:35PM +0200, Andy Shevchenko wrote:
> > > > > > On Mon, Mar 03, 2025 at 01:39:16PM +0200, Raag Jadav wrote:
> > > > > > > On Mon, Mar 03, 2025 at 10:24:43AM +0200, Andy Shevchenko wrote:
> > > > > > > > On Mon, Mar 03, 2025 at 10:17:41AM +0530, Raag Jadav wrote:

...

> > > > > > > > > +INTEL GPIO MFD DRIVER
> > > > > > > > 
> > > > > > > > This also needs to be more precise and follow the name. We have more Intel GPIO
> > > > > > > > drivers, and MFD doesn't ring any bell about the platform or so. Are you going
> > > > > > > > to support all of them (existing and comining)?
> > > > > > > 
> > > > > > > Not that it is planned as of now but I wouldn't mind :)
> > > > > > 
> > > > > > It sounds like solving the problem that even might never appear :-)
> > > > > 
> > > > > Right, somehow that sounds familiar :D
> > > > 
> > > > So, can we rename the MAINTAINERS record as the result of our discussion?
> > > 
> > > Yep, but perhaps wait a few days for review comments.
> > 
> > Sure.
> 
> Or can we just add it under INTEL GPIO DRIVERS?

But it's not a GPIO driver. It's a glue between GPIO and PPS drivers to support
such a hardware on some platforms.

> With that I think it'll be in much better hands.

So, I don't think so.

-- 
With Best Regards,
Andy Shevchenko



