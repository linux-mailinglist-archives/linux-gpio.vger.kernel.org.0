Return-Path: <linux-gpio+bounces-18057-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA91DA72FBD
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 12:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1AF1189AA22
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 11:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF48213256;
	Thu, 27 Mar 2025 11:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UiVmGCvC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E987F29D05;
	Thu, 27 Mar 2025 11:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743075444; cv=none; b=AvpyUMHMJRNQK8nGyuqgmEgY5BDllkRv/9ZCaqwSrF4mA7mrmgz/r40Uqqz4dYASFq7k6Doc7P4RU4xt+THtGKi4O+wBEJQ8Et1OwzhlbRdMKU3Daib4tI8lo0H6EvOjtTAkY93NPmWoiU7MhgUVIKH4M/Iq+spHRTAa/PPv7/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743075444; c=relaxed/simple;
	bh=MfNXBis9/wnf5w4MMG/EnNPLVzJjdRrhYhZVj4270NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMWdeJUA441QzhoirUGZ9u7/aiKgprvwFj1KlSwnDi/p77CCZS7gSOtShII1YDbIuPwSauKmcR3K+gjFOLzd198Xn6Wxuhtplh4fbg/oxmi0mLjVE7YG7v8TycNp86l7rmr1ZHpExM7/Ve96U3IH0RFtp/FzRFhAlLonqw/Pu04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UiVmGCvC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743075444; x=1774611444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MfNXBis9/wnf5w4MMG/EnNPLVzJjdRrhYhZVj4270NU=;
  b=UiVmGCvCNLW3BnoJxMnbMP3Ezd3+z7n7B5606eDSmVKWpqcgmaQKfl1c
   mq+mb1nMrWFYheuAMnaJMR3heez5rQ5UVgu54hYxZhlgRAlDqrLq0gYot
   BFHLmzvzLjxxGUz2xmljU1YW5t3jPs8YwpAQ+XSF42qqdKhgMc/ahBWty
   qaux6h1v63i+C4lSfDy0BG+ZFQbHYi1Lu4nIABwzXqGpqzivOqMwRUwk+
   htheHGcbJKSrPVX4ToB17Rzs18mUAnlWuBIhf5YFQVIAQaEjMncxQS2ki
   X5oC+ah5L/zfl9J1qceAi+JnIFev/R/CFEiUVHJDuvRBzxRD11rdZ2xMp
   Q==;
X-CSE-ConnectionGUID: sNXL1/c4SvaHO6fFvwHWig==
X-CSE-MsgGUID: Gxlvzel4RpagHEzspKrI3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44559373"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="44559373"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 04:37:23 -0700
X-CSE-ConnectionGUID: rVqOZ5o+RkKLqN2e1zBF/w==
X-CSE-MsgGUID: S7E5ImbxR5GzUQ5kSHiJ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="129799606"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 04:37:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1txlXx-00000006QIe-09ie;
	Thu, 27 Mar 2025 13:37:17 +0200
Date: Thu, 27 Mar 2025 13:37:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, krzk@kernel.org,
	lgirdwood@gmail.com, broonie@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2 2/2] regulator: s5m8767: Convert to GPIO descriptors
Message-ID: <Z-U4bAMt82SipwuY@smile.fi.intel.com>
References: <20250327004945.563765-1-peng.fan@oss.nxp.com>
 <20250327004945.563765-2-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327004945.563765-2-peng.fan@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Mar 27, 2025 at 08:49:45AM +0800, Peng Fan (OSS) wrote:

> Update the driver to fetch buck_gpio and buck_ds as GPIO descriptors.
> Then drop the usage of 'of_gpio.h' which should be deprecated.
> Based on commit 84618d5e31cf ("regulator: max8997:
> Convert to GPIO descriptors") as a reference to make the changes.
> 
> With the quirk fix for s5m8767 in of_gpio_try_fixup_polarity,
> the polarity will be active-high, even if exynos5250 spring DTS
> wrongly use active-low polarity. So using GPIO descriptors,
> it should work as before.

I was a bit trapped by the set_low and set_high callback implementation,
but I think I understood the idea behind and this code does not change
the original logic.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



