Return-Path: <linux-gpio+bounces-29965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FDECE550E
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 18:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F37B0300818E
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 17:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B7522259A;
	Sun, 28 Dec 2025 17:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Liun7KJg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC681DFF7;
	Sun, 28 Dec 2025 17:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766943891; cv=none; b=Qsu+x8T5FQ2FKku1bgQa/PwKyNiwvH5eAilna6jvu3BHAciZJz7AyCyprCYV8i880PcrHZ2jHHfE/jDG5WvL3V4RavHSZC04JsJsO/ALdQ2dsdxtrrj51QAqegiwyKUz99Sj4Iq4Tkj3tFBInvyOK2Xvm8GTc66Po223WkR/GC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766943891; c=relaxed/simple;
	bh=lVCT868+b5Yv/36wL1GYb/GagoOO5OQEjqztNz7NjDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/ZaOZ6DBouxdKpXj1/n2K5mAqBPXlmtfvX99ymum+o7i19hbv2kQh+kQcJbARir3DPoY3mykZ4qxOD+fFkCusunwjdgZehDTn29dazCrvrT2Trg/diqOkGrQS+PcH+8h0Xl2UtB/FN6GLg8qgJ2TQ3B3j2pG3QHeLBbPr7JBxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Liun7KJg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766943890; x=1798479890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lVCT868+b5Yv/36wL1GYb/GagoOO5OQEjqztNz7NjDI=;
  b=Liun7KJgY2hNYw5i0C7hIrK2xbhVeuoN9RnoXIluMtLTdTcD8SUTAEE+
   AztWGnyyqBYyFlZnlibwfRZAN9NgHDeeifxjAjMQ3mb9/9s6Xr163k7jz
   gM2whKYwhTvE+PMORgxy6sBrjABACaqtI8G89ND5nP3krhET6Fmox5+r8
   j4SmXigaDj0xgRwwOm2jjq2jGW+Fhc8/zol8RTZm2lIwD7PuihhfMBnm/
   8r3SjRMBPa+NclKRIZHcJ8a+Z0OgWnUfSOdVMGZ+jS+kVjvbMDAm9p3dH
   1Quhq8ETvMHXhcKPeNUZBiXitV4ppzMceCWvNF0wYvHpu63kvN3tWhOxM
   g==;
X-CSE-ConnectionGUID: Dyi1RC+sQFSi1V64Hchg7A==
X-CSE-MsgGUID: ebgJevNVSCmroAzDcSHLGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="71165506"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="71165506"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 09:44:49 -0800
X-CSE-ConnectionGUID: Pat6iosFQLesDUJRgOWptw==
X-CSE-MsgGUID: iQKxVv0bSg6CmaUMGshgLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="200380387"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 09:44:47 -0800
Date: Sun, 28 Dec 2025 19:44:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: swnode: compare the "undefined" swnode by its
 address, not name
Message-ID: <aVFsjSIwrBw7tFLU@smile.fi.intel.com>
References: <20251215154624.67099-1-bartosz.golaszewski@oss.qualcomm.com>
 <176605722909.59758.15745157789443891085.b4-ty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176605722909.59758.15745157789443891085.b4-ty@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Dec 18, 2025 at 12:27:11PM +0100, Bartosz Golaszewski wrote:
> 
> On Mon, 15 Dec 2025 16:46:24 +0100, Bartosz Golaszewski wrote:
> > We know the address of the underlying remote software node referenced by
> > the GPIO property (if it is a software node). We don't need to compare
> > its name, we can compare its address which is more precise anyway.
> 
> Applied, thanks!
> 
> [1/1] gpio: swnode: compare the "undefined" swnode by its address, not name
>       commit: 6774a66d0e103d0e3e4c0f37dbd61946ec83edf0

Okay, but still consider returning the name. The idea of comparing with
the address I agree with.

-- 
With Best Regards,
Andy Shevchenko



