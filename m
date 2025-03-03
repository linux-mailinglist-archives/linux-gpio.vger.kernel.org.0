Return-Path: <linux-gpio+bounces-16920-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F4AA4C048
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 128457A9304
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 12:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5370120F093;
	Mon,  3 Mar 2025 12:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkFSxw9H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5851CF96;
	Mon,  3 Mar 2025 12:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741004568; cv=none; b=RnXXvL5uMAfL5pEcsDh7P/N/GJDe/G+rE0KbhfHzNK+mFJUW3NIkNOsSXKu5n56rSR6Ozzxq40DmY2CZmn9Za/sDWfO+eY4XZS+LJ8jV3uPBj/1Iw2ArV5ncHNcvnjCibF+Pqkjs0NIWpaKogsmA9gwf1HLaR/KCisNhFDvjiN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741004568; c=relaxed/simple;
	bh=LdAb8B+A2aIRRqA7TGNbZE49m+hpZy1lkM63kR3qKqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GphP2pSUBTWl7OCHsx3+V/PgsyUiMT8pA/57i9R7eKIdkvaePTKketHptXVCWvRQoxFRXwbC7KA5nXqoJbMfKeWJBbq7thmdgYPPVfa1MRUklkdQAPoHRdDbFsjEAwd1D8rAxcOCz2zuF4s9jPmIgw/C3GQsWcwsdM2JxhWPKoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkFSxw9H; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741004567; x=1772540567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LdAb8B+A2aIRRqA7TGNbZE49m+hpZy1lkM63kR3qKqU=;
  b=jkFSxw9HrnQ/P+wJObFJiHCzZQanAcgTCvZmAjZx9XzskrTtf5oL1Z3Q
   IhSWsSPp6VvlSruo1x5QwDL61VwdEaBLJsUsFNaKZyo0cuo75KcF8wtFI
   WnxEc23mE9UsNcr5uTobKsRI8WafilU8mJM9EMQ/Q3mFRsgKvZFfwFH6q
   YO5khWdo/8VF2j2wP4UKpttb1vd3M+RR4kxMTNqxiAohvvof2KAvhFjJd
   iUfw8DZTVr06cjG1jvCufgp9C4vYj+StEN57qi6nZ28OqmkeHmWxOjk0T
   DbNO1FhOysSIvEC2WY10hXqQLi+//c7nRv3UhR+cZoHq9FHVtdpymTMz0
   g==;
X-CSE-ConnectionGUID: GoY1AOpwTBGshJ0XtN7cwg==
X-CSE-MsgGUID: SXKEPV6gQGGA/cQW+mvH1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41729753"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41729753"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 04:22:47 -0800
X-CSE-ConnectionGUID: JwvZv7yUQBawHs74UT+2Ag==
X-CSE-MsgGUID: jeZ9L7JYReiks6Snb6yFyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123208067"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 04:22:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tp4oj-0000000GoKS-3Onw;
	Mon, 03 Mar 2025 14:22:41 +0200
Date: Mon, 3 Mar 2025 14:22:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart
 Lake PSE GPIO and TIO
Message-ID: <Z8WfESNmu4MjEbcx@smile.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-2-raag.jadav@intel.com>
 <Z8VnSyH_DBuJpW2o@smile.fi.intel.com>
 <Z8WU5NiIsu34Gz-Z@black.fi.intel.com>
 <Z8WWXxTrd1e5V3qb@smile.fi.intel.com>
 <Z8WdK7wkNnAerkCO@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8WdK7wkNnAerkCO@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 03, 2025 at 02:14:35PM +0200, Raag Jadav wrote:
> On Mon, Mar 03, 2025 at 01:45:35PM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 03, 2025 at 01:39:16PM +0200, Raag Jadav wrote:
> > > On Mon, Mar 03, 2025 at 10:24:43AM +0200, Andy Shevchenko wrote:
> > > > On Mon, Mar 03, 2025 at 10:17:41AM +0530, Raag Jadav wrote:

...

> > > > > +INTEL GPIO MFD DRIVER
> > > > 
> > > > This also needs to be more precise and follow the name. We have more Intel GPIO
> > > > drivers, and MFD doesn't ring any bell about the platform or so. Are you going
> > > > to support all of them (existing and comining)?
> > > 
> > > Not that it is planned as of now but I wouldn't mind :)
> > 
> > It sounds like solving the problem that even might never appear :-)
> 
> Right, somehow that sounds familiar :D

So, can we rename the MAINTAINERS record as the result of our discussion?

-- 
With Best Regards,
Andy Shevchenko



