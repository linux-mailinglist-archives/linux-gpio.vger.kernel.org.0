Return-Path: <linux-gpio+bounces-17525-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B1EA5EF68
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 10:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 014FF17154E
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 09:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B259262D27;
	Thu, 13 Mar 2025 09:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eSypLThQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3491EA7F4
	for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 09:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741857510; cv=none; b=WvejZE/viTyeZ8YgkQC+xGlj2JODhOJ2It5QVDWUEDZPvyoAt71AtRzsroK09FJFjPqaZQetGD4hSAWlegm+00RFxGf67fVzlyNW9lIGp9Fwy/gkvv9iF5orfpfKO5hney1zhbCudtlCrNo1mAJeMDV728vBBKiFjCtGj5Bf+zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741857510; c=relaxed/simple;
	bh=VXoyx5oBf4Ipbs7qEz66c84LPkwFtWBK42XK/+WfJdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFvRD5VLRvtNSMThBhlqFixhElZOYVxnmoCCaPL9QLDezCDDUNKogBJoAHnxp7UnsFp2HXd99PEXzZR9FzLFsrXZzNhD/RIyEE1cGpW76BqYtFPTyPbk/BjaN8DXgf/vHBtWZyJbc4jI4SxIdaqeEfTj7RaPUPXfZi3OxYxZDUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eSypLThQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741857508; x=1773393508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VXoyx5oBf4Ipbs7qEz66c84LPkwFtWBK42XK/+WfJdA=;
  b=eSypLThQw3F2GwS1n7VYHbXEu5G35K/5+xZiQomSbev6H7lB1eScakIh
   Kj1spEQhVj3/Ms5vNLwVucOv2r0wvzAO4VcJ0ChuuJNwHf3I8yfsOjqnK
   vuBba/b11tcFK3uDOfCBRWGtBkKxYKBpQfU3FqO9C+ibgXmECnXOuWV24
   gVJbm7wb7jtY7nzJnFVXHsa8T3RAd1aVXYVRr5eVdPWwDGtq7d9GkCG6V
   7uuOqnpOGhEKoxQj9V19FxR3kCUcM6eveolaH7Gw4Dt1LUGnCcOqNyJOB
   u8Z7fz0vB+hzDh3htFi2ZaSCFBkhNEEuNV4HjdHCGQetSZkGx8DTm+FIN
   g==;
X-CSE-ConnectionGUID: qZU6g0nfTBmXXkV/OCO3SA==
X-CSE-MsgGUID: aQ18FDNDQsWMk3mtSecvDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42134464"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="42134464"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 02:18:27 -0700
X-CSE-ConnectionGUID: EbqBr3qdSjudOFEBAbhbtA==
X-CSE-MsgGUID: WAmBmoKmQ6iQZhcUAUkt1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="158060309"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 02:18:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tsehs-0000000281E-0A4x;
	Thu, 13 Mar 2025 11:18:24 +0200
Date: Thu, 13 Mar 2025 11:18:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.15-1
Message-ID: <Z9Ki3yAY0w_wdGwP@smile.fi.intel.com>
References: <Z9FXo5qO8RCZCKzk@black.fi.intel.com>
 <CACRpkdbyoUt39Mw+eifc5yX5Uq81E_Bs6pRtjXV_GmaOZ9nRkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbyoUt39Mw+eifc5yX5Uq81E_Bs6pRtjXV_GmaOZ9nRkg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Mar 13, 2025 at 10:00:06AM +0100, Linus Walleij wrote:
> On Wed, Mar 12, 2025 at 10:45 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > A batch of the updates to the Intel pin control driver. Due to driver core
> > changes some other subsystem drivers were touched and the respective
> > maintainers provided needed tags. The changes were in Linux Next for a few
> > weeks without any problems reported. Please, pull for v6.15-rc1.
> 
> Pulled in, thanks!
> 
> I assume the devm_kmemdup_array() comes from an immutable
> branch that also go into other trees?

Yes. It was pulled into Intel pin control tree as most of the conversions
happened for the drivers in there.

> Just thinking about what to tell Torvalds when I send this upstream.

-- 
With Best Regards,
Andy Shevchenko



