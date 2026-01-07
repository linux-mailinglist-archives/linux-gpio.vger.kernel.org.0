Return-Path: <linux-gpio+bounces-30230-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB382CFED0B
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 17:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B68D731DB562
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 16:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADE638A9A3;
	Wed,  7 Jan 2026 15:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNz+b4Se"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D3F393DF3;
	Wed,  7 Jan 2026 15:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799608; cv=none; b=LZ8+HzbqdXDeF1qcCK5Ij4J+fbCe850l6ODDQ9f5xSUHvI6iU6+R2RTksG5sK6NVR/eZXpl7sYSA5TzdjvuiGYANXYR0wuZLlM8I7QcxEMKNmh5JWrVWowrgxlyh8k5R56yfpPKBPzcMUta7d94Vw9zbJPGfo3JYml+sjlO54g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799608; c=relaxed/simple;
	bh=n6PcZJY7Lvkm3lRaURitn6eK5YZSj5t9OMlFct10suA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGaAphyp2b0wvgy8WrejkL5yZov0kDTPVoCd9Cw23ngEB4UvLPN6ROqrv0JC7a+zRdhHz7AD2W17hE3Nv1gGuvllKIXbWaRKG9N1pFcEWrPpm5gmN8rrBg6IsJJ66vMURf9gIVn9mE02Wvx/Gd1BN0hZVRVVG0xerC269eLEs+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TNz+b4Se; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767799606; x=1799335606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n6PcZJY7Lvkm3lRaURitn6eK5YZSj5t9OMlFct10suA=;
  b=TNz+b4SesmYfxfwNGd4tlYgtUsLtl9+8GzvyUpsYZndS03n63irfbDFY
   lvVQgBNpLruwIZMF/NgI1pcmt/xRC9TBO/++xJPk+GaHkuMWu585bkyL/
   wBMusgXoqHQ4EXpZap8RtxLbxFKBHhxoPFdkulqQNlD5i2LSLbVjflkYI
   ckDyBOos+o1x2FyZwmU+qrUTlIa6Tk47H/Ihms7wcmtgQaI1stJK9S/gk
   gVg6uMHj5a3RyOmL1dxojqgYtCrVTO4ilqbCdsn034GW1kFJ1NcDuNPGX
   +PvBesZKE8oygkjuI731H4QE+kXw3HMYjYpHXTbGQ/s24VHM0XNRZzEf/
   A==;
X-CSE-ConnectionGUID: 0iU12czKR4ab6m4hdZzQPg==
X-CSE-MsgGUID: NZBt4+IQS8uXKWcUfn2ZJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69220500"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="69220500"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 07:26:45 -0800
X-CSE-ConnectionGUID: Q6lv6evHQeuuW6tRIXsnSg==
X-CSE-MsgGUID: 4d2NKxfYQuezNnwAzMShRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="207480452"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.168])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 07:26:43 -0800
Date: Wed, 7 Jan 2026 17:26:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Documentation: gpio: pca953x: clarify interrupt
 source detection
Message-ID: <aV57MPlhm53SapP6@smile.fi.intel.com>
References: <20260107093125.4053468-1-ernestvanhoecke@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107093125.4053468-1-ernestvanhoecke@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jan 07, 2026 at 10:31:22AM +0100, Ernest Van Hoecke wrote:

> There are multiple design tradeoffs and considerations in how the
> PCA953x driver detects the source(s) of an interrupt. This driver
> supports PCAL variants with input latching, a feature that is
> constrained by the fact that the interrupt status and input port
> registers cannot be read atomically. These limits and the design
> decisions deserve an in-depth explanation.
> 
> Update the documentation to clarify these hardware limits and describe
> how the driver determines pending interrupts, and how it makes use of
> the PCAL input latching.

Thank you very much for this piece!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



