Return-Path: <linux-gpio+bounces-9361-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0AC964239
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 12:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C76791F2611A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 10:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A38118E358;
	Thu, 29 Aug 2024 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSskkTUg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6860918E042;
	Thu, 29 Aug 2024 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724928663; cv=none; b=Uns+cVBU+u+P6+azVrNVmopRfHV4ty2M91lD77RJ1aXA9FT99HzXMjbowbvAeWmudvyWkezZQA96CbZkZmbjrnF9BbgGDG10wZ5/aUYc7dPYZY2DnaYgIK5dK+Gn2QssWm/ZVvjSt0CVyGITJREelRKuLqGJcYW6GE8Rp3R+xkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724928663; c=relaxed/simple;
	bh=SOecWgG7lXa41JUzcQzuoKgDaNVt+3pQXXhcyuebcPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWMV+DL98FFywrS2U0w8GyTluIfm5HOFCfeD2GKEUStTjFUljLj+f1+ZkG8DbpJppGna3Gp9K9UyPe1jeH6oom5cyTO4OPDj05hYs0dOSwra8JfJcfROzWHEC6PfBaWGkWtsZc1poqBmP7GWwYYe9MU379xiThmozOgNKo5l3Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HSskkTUg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724928661; x=1756464661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SOecWgG7lXa41JUzcQzuoKgDaNVt+3pQXXhcyuebcPk=;
  b=HSskkTUgHyfnBgZxOSg9ry06DyWLOmrkzj9jMcUjziBrODfReyFZ+Hh1
   LuGsN4g46JyarfLlrG/mHz51qKmg2pQ4axj11q8I2qGipq3x1pp6viTtV
   2fDxXDT8tUgkVQqcJxy3EOnV5/WKU5dV7/KwMuNs2U1DhBKffR3Cnk3Ge
   afAlbZSYIOojacPUNcs5DONZ0gXXuA8lbKRnICnoPfdurZlNNej6f52sf
   Lj89Ic35+FTX8ZcPOUm5I9SndupiRcKw0mHq6/bPEF7rPGQOqaTeGsmf+
   7kOegAa6RuPe48rLMRXmJ+OCvvD6RBN2YufbSor6UrxD0bpFXvuDOLf8M
   g==;
X-CSE-ConnectionGUID: tS+f8O/0TPyIjGLK+oIFEg==
X-CSE-MsgGUID: PH2d5p94S6GoVZ+7AJ4JNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23027121"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="23027121"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 03:51:01 -0700
X-CSE-ConnectionGUID: 1fTcilEfRXusrHhto5sj7w==
X-CSE-MsgGUID: PHa4419XRRad/GHa0IArzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="63220790"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 03:51:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sjcjx-00000002y6S-1xB3;
	Thu, 29 Aug 2024 13:50:57 +0300
Date: Thu, 29 Aug 2024 13:50:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 3/5] pinctrl: intel: Add __intel_gpio_get_direction()
 helper
Message-ID: <ZtBSkWzU9bYxtOPG@smile.fi.intel.com>
References: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
 <20240828184018.3097386-4-andriy.shevchenko@linux.intel.com>
 <20240829044653.GR1532424@black.fi.intel.com>
 <ZtBSQVlEPgKtfkij@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtBSQVlEPgKtfkij@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 29, 2024 at 01:49:38PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 29, 2024 at 07:46:53AM +0300, Mika Westerberg wrote:
> > On Wed, Aug 28, 2024 at 09:38:36PM +0300, Andy Shevchenko wrote:

...

> > > + * enum - possible pad physical configurations
> > > + *
> > 
> > Start with capital letter as others:
> > 
> > enum - Possible..
> 
> Fixed!
> 
> > Also I think we should follow the structs and drop the empty line here
> > (well and for other enums, I don't know how they got there ;-) but it
> > looks better without.
> 
> We have the other enum with a blank line. Perhaps removing them in a separate
> patch?

Or I can do it "while at it", it seems to be quite small and likely never
conflicting change...

-- 
With Best Regards,
Andy Shevchenko



