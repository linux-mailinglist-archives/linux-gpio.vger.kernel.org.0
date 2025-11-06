Return-Path: <linux-gpio+bounces-28154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCCBC3982E
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 09:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A86AD4F01E6
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 08:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E2F3002C5;
	Thu,  6 Nov 2025 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bq19iDIg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A127C2FFFAE;
	Thu,  6 Nov 2025 08:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762416362; cv=none; b=JYMiM4jvZfmT8sl3myZ8mGjoeWqfYvHyHampJv4tf0pycZKUMaWS6fx/1naHIXyU/MWqYh0Sb1w0l1vJRou/mcKde5Ynu6oCqVxX41CC90OplLgFrnXSihdASAql3zGogQcowDQlpSFFyztNbsvimPAFG3K0Gyx3HwJ2IUraKF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762416362; c=relaxed/simple;
	bh=uVqVXZUR67NNPkwo9qiOYoNMmfx2LmmoT4g8A9ZBGng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVlOTQ7+xJwfhhvJNLjdvwfrrEvSdlKogUaMMhX/2rEcCEAuY6oq0y/AxLSXq/X+mUyzDRZANiDo24VG7V+88b8OPSQVOq7Zb1OhzmMX8D4W6QtaZXocRaa5XB2mtenh58fNiyKZPTphTLKDfUzfn+H1jZFz+SPnPnSGGR/0HQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bq19iDIg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762416361; x=1793952361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uVqVXZUR67NNPkwo9qiOYoNMmfx2LmmoT4g8A9ZBGng=;
  b=Bq19iDIgimFXY/rJfkdtciSdTmSCwOj2J1gEvxfrQG5oQVpJMC04q5DO
   U8wQ9yvjklw5/ZA7MQ7XmH8fz8Qg9Xsl2zmHwrKxqhrVcf8/B/Wn29F69
   WhX5u5pWf72n29V/yO3ah3vYqUqmbOh5VpOMqiZGq1laqilM7ipbRFbdH
   88gNMYBLhc2zr+WNKjFAExRK2f84fw8ewc0SMvXwOAcCN+3XYglmGSbAC
   Ng9cIF43McX+FKO8cgxFeObWBmV2VYFwwmKiGUoyDx7ev1Avncj3L4zWr
   N9gQqXNs7N+mna8Qgv9GtVd9Ii2OvJA1Wl6/AhsHb6LcG+FuiUf9ZY8eX
   w==;
X-CSE-ConnectionGUID: 9+a+u9WNR5q27wUZe37wpQ==
X-CSE-MsgGUID: 5VEDWqBrSJqk8Z+j0qph/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64473974"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64473974"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 00:06:00 -0800
X-CSE-ConnectionGUID: jFcDbg5gSG6oCosQh+7eNA==
X-CSE-MsgGUID: vKEmR9g+RmiveyTvEdi8yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="192743038"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.221.229])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 00:05:57 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vGv0B-000000061kZ-408q;
	Thu, 06 Nov 2025 10:05:51 +0200
Date: Thu, 6 Nov 2025 10:05:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: kees@kernel.org, broonie@kernel.org, gregkh@linuxfoundation.org,
	arnd@arndb.de, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mod_devicetable: Bump auxiliary_device_id name size
Message-ID: <aQxW3-M-B6OlusEg@smile.fi.intel.com>
References: <20251106052838.433673-1-raag.jadav@intel.com>
 <aQxQ_orRY1ceokdU@smile.fi.intel.com>
 <aQxVNPRVdJvbqkiz@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQxVNPRVdJvbqkiz@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 06, 2025 at 08:58:44AM +0100, Raag Jadav wrote:
> On Thu, Nov 06, 2025 at 09:40:46AM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 06, 2025 at 10:58:38AM +0530, Raag Jadav wrote:
> > > We have an upcoming driver named "intel_ehl_pse_io". This creates an
> > > auxiliary child device for it's GPIO sub-functionality, which matches
> > > against "intel_ehl_pse_io.gpio-elkhartlake" and overshoots the current
> > 
> > Looking at the name there is another question: Why do we need 'elkhartlake in
> > the GPIO driver's name now? It's a dup to 'ehl' in the first part.
> 
> Just kept it for historic consistency and I'm a bit terrible at naming.

I am afraid this alone wouldn't be enough to justify the bump.

> Perhaps "gpio-aux"? But that's too generic from subsystem POV.

From the above the simple 'gpio' would suffice (as long as this driver won't be
used by name directly, also makes sense to check the sysfs file / folder list
to see where it may appear and may or may not clash with the similar driver
from other AUX bucket).

> Open to suggestions.

-- 
With Best Regards,
Andy Shevchenko



