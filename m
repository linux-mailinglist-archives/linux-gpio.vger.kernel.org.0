Return-Path: <linux-gpio+bounces-28150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DCBC396CA
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 08:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F3A83B07D0
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 07:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB8B29C338;
	Thu,  6 Nov 2025 07:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXR00yiB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8F0221DAD;
	Thu,  6 Nov 2025 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762414857; cv=none; b=NfyRehZ5sbbv1TESR+OoEtCgNsQqrU0SXaq+wbzUkcY1P2eZf2TE0PiXFHrg/+WTkb6q480X2ojsi1ea2guyRSR4klcous9kieRfktcjJTQe6+p0XR3Bgyy/tnOTW6TI2qA9KmYM3emOSCHaM+aAVdeYpqyqtSMDl/M8OIeXHuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762414857; c=relaxed/simple;
	bh=l54FqTT8+G2I20BWvp4G3THSGvmDym14v4+4abueHe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhxLatKvfhOD36+IF42RfdHwfYpvOiZwcw/mU3DRjY5o2ycARokIYtECuutZPxiF6/A7/qA0MXUHv4pM/gPOcmlBRK+6LGljqCFYqi/8zhXbHUb0NFFJyXF9AgzhSWL86QPgOCW/y8Pvv/LMGlfvxqABE0yR4eCEoHjlphqJ9bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXR00yiB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762414856; x=1793950856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l54FqTT8+G2I20BWvp4G3THSGvmDym14v4+4abueHe4=;
  b=iXR00yiBlVGlxATB8ZTfXNAVVih+yq9X76sjXsbHafgJHZrm+QlPlgEj
   oPIq8X2De69dOQl2xDEapiHhOcfpgq8Aeck2DTrPQBMa4RvFV7PYJV+ig
   wtT7YXvzpO1otNMdUdNYBlVnEF6tUCKm84ypEOb/ZY+WbDpu9ihYpPlgE
   Q4jDt7B3s2tRliVMBWnbzEiCtfZO9G8q8hq8a2ACC9p4wrhVPzYaMC3VX
   KsiQpX0BdZLHGsqX7KdE1EuJMRIKWwu3GXKF5jj85tZl04kRQGXHALN88
   SJ96gTL2sogNfpFKt//AAT5/mCST2UAMq6cdrOh9nlmkiG8N03rqRCMX/
   g==;
X-CSE-ConnectionGUID: LdLkZN5mRJaqGOVFRXNvUg==
X-CSE-MsgGUID: HNCU9iQGRxGdVihtdF3cBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64695217"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="64695217"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 23:40:56 -0800
X-CSE-ConnectionGUID: nsiaQgEeT4K/OWpx4RaWgA==
X-CSE-MsgGUID: OXLDFMmSTYizPHwtzBxCjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="187634823"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.221.229])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 23:40:52 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vGubv-000000061OU-13on;
	Thu, 06 Nov 2025 09:40:47 +0200
Date: Thu, 6 Nov 2025 09:40:46 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: kees@kernel.org, broonie@kernel.org, gregkh@linuxfoundation.org,
	arnd@arndb.de, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mod_devicetable: Bump auxiliary_device_id name size
Message-ID: <aQxQ_orRY1ceokdU@smile.fi.intel.com>
References: <20251106052838.433673-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106052838.433673-1-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 06, 2025 at 10:58:38AM +0530, Raag Jadav wrote:
> We have an upcoming driver named "intel_ehl_pse_io". This creates an
> auxiliary child device for it's GPIO sub-functionality, which matches
> against "intel_ehl_pse_io.gpio-elkhartlake" and overshoots the current

Looking at the name there is another question: Why do we need 'elkhartlake in
the GPIO driver's name now? It's a dup to 'ehl' in the first part.

> maximum limit of 32 bytes for auxiliary device id string. Bump the size
> to 40 bytes to satisfy such cases.

> ---
> v2: Describe the use case (Greg, Andy)

Thanks for the update!


-- 
With Best Regards,
Andy Shevchenko



