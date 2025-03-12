Return-Path: <linux-gpio+bounces-17508-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6220A5E3AD
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 19:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A5D03BB558
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 18:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFE91DE3AF;
	Wed, 12 Mar 2025 18:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrqLFWKJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B019A1386DA;
	Wed, 12 Mar 2025 18:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741804378; cv=none; b=TBHR68wn1dMvtBMmhNAa1+tsjjmAr/PLpbcZy+9nM4j+CR8sAafEt57PbHiUrVFum8ju/OiR6yFgPmNatMmZTmQO2R1veTtwrI38/iBrxPt5JLxPGBx/JWNJQ1e6BC4ksvx8y/mLyxiI3rXcRGohDgQuDXzdqvgA8B9o/PC9JwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741804378; c=relaxed/simple;
	bh=Amk2MJ1qHizSFYK6muVFDeoaHdIBjfCUeF/dhRR+z/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KY/8TFTXNu+Zsbh99U5korSglZZzbM7/db6QcG2ipf0Ca298PS2SiIIGRdW8L+vZZL+IFC4IWtT4qeFCNsC/DrR7fGpBT7SO19cxW769WhhhxtMAEMqJHUVmhWEOVVf+BcnZElkkMe/VDZtcoic+7GugvwSjUrOEglj/KZeN3gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HrqLFWKJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741804377; x=1773340377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Amk2MJ1qHizSFYK6muVFDeoaHdIBjfCUeF/dhRR+z/Q=;
  b=HrqLFWKJgemKLoP7NWj/8oyLAIXVHoCgDOBiNq5pJv0Sb1X4aitFRT/t
   4Wn/xGJ/QdY2V4TbjwF/H9INQAG05YbSMeJFQwydbLZbe27wkJ8McJjXb
   lOKvps7jGOwkG3bBkPmEqqbDCUNRY2wVO2Ns7NobLzO436aYkmnsaBUsr
   CSCs7zj+mtcBcm4B1ILkDh6SvGvyw1cFQLTh4f9Fd7UQqFbX5sRYdM3QJ
   6NyV14vQm2+mLFfRlj0JWhHW6o5SQ0aMbxEeZRjEoTAoK4r2t8CCdBbUb
   W0cP59sQITN+jKOBRZXVGWr7D9ZdpMvHUZvDR8kYWgj2KyY+hKDy6h4BP
   w==;
X-CSE-ConnectionGUID: yu9Af2fNSpWGZ+tggcNUvg==
X-CSE-MsgGUID: E+dnm1NNTGiTbw9a/T27bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="60297604"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="60297604"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 11:32:56 -0700
X-CSE-ConnectionGUID: uOVuXGMCS0e0ekUlEPgIbg==
X-CSE-MsgGUID: xqUpE2//RxCXnu1kR9bnlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="120677188"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 11:32:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tsQst-00000001ws8-2jC3;
	Wed, 12 Mar 2025 20:32:51 +0200
Date: Wed, 12 Mar 2025 20:32:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z9HTU2BlXIa95S0V@smile.fi.intel.com>
References: <20250307052231.551737-1-raag.jadav@intel.com>
 <20250307052231.551737-3-raag.jadav@intel.com>
 <Z8_aJqNKK9AgBnK8@black.fi.intel.com>
 <Z9FpU0Ik_4yCU9XB@smile.fi.intel.com>
 <Z9G-RSfcRmALtgJe@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9G-RSfcRmALtgJe@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 12, 2025 at 07:03:01PM +0200, Raag Jadav wrote:
> On Wed, Mar 12, 2025 at 01:00:35PM +0200, Andy Shevchenko wrote:
> > On Tue, Mar 11, 2025 at 08:37:26AM +0200, Raag Jadav wrote:
> > > On Fri, Mar 07, 2025 at 10:52:28AM +0530, Raag Jadav wrote:
> > > > Now that we have Intel MFD driver for PSE GPIO, depend on it.
> > 
> > > Andy, any guidance on GPIO?
> > 
> > I'm not sure what we are waiting here from me. Hadn't I reviewed your GPIO
> > part already?
> 
> Ah, I added MFD dependency for leaf drivers after your v1 review.
> So this one seems missing the tag. Can I add it?

I see, but this can be added later on.
And on the second thought, do we accept the configurations
when user wants to have GPIO on EHL, and doesn't care about TIO?
Maybe this patch is not needed after all?

-- 
With Best Regards,
Andy Shevchenko



