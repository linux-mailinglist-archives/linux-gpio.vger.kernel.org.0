Return-Path: <linux-gpio+bounces-17530-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B6BA5F71F
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 15:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC90B19C21A6
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 14:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F5911CA9;
	Thu, 13 Mar 2025 14:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZJJeY8A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00C426770E;
	Thu, 13 Mar 2025 14:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741874408; cv=none; b=kpYTei+y2ea8wkgNaBqGbvXZ72M7mGO5c+skQIgS/Y2MLXysJIzeMRXs9yY7QMGKdChM3xqtstYVkHkrQZDHxI9VNC3yKcDANyErOllfl3eydgUFtJk/Sy3QfRU9UWSwXxJ1WvNkjP4mLqjlJ+q85T+mCK2FNTEpz4Uvc/yzMuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741874408; c=relaxed/simple;
	bh=sUVQ7XZyhgDlaxx4SkEh499D6uLm9wuMV2Qxd21NbIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ekc9tDYKAj5//rC2cBS2krkTRUwxp+CK12e/V3Hsd8xZByxA75tbMiPAsuDs7qtSSmraGhPumx3oxDUTJ7y9FGYsBDlcodO0TfqbXgIBjBzgCKM4AXXNqfm4V5yYsN8dVc473L92dIB08thX/wBg7P2EYb26edAIC19uNUX7tjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZJJeY8A; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741874407; x=1773410407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sUVQ7XZyhgDlaxx4SkEh499D6uLm9wuMV2Qxd21NbIY=;
  b=nZJJeY8AwXAC3tJ9QerQsJX9XSUpP5mp11wnGZ7WLc0grvWbWG0/Ah4a
   g/mhyD7W46DTnkGcsaCB5lFy+ILijTibzShKHhlZh3zSdtioOZfOL8xts
   OVRKxIe9MC1Lz1ffQsMpMCwa0/KkrTNRUN15OW7LGFZJqZBChNUrEugKP
   m+XGy32qaeySQRZ7EhmnW2yfkpb2muRaLd89z+bYVU8tipVdwMabyW7E/
   vAfT4RDU4VFnAzO28KZ4JaPqvQQmvlqFfW3ekRbKuVjIRV19ZnduJVoQG
   cdjSrZKRXHhJ0QX2VFRTHaBBsQgxi8fAjMQGFY0PLrH2UZMLeH629trMn
   A==;
X-CSE-ConnectionGUID: 7OYyNStwT82I0BFGz3Xpnw==
X-CSE-MsgGUID: Rh5ebv9oTAuApUXZVjQG7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="42241543"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="42241543"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 07:00:06 -0700
X-CSE-ConnectionGUID: XsgXMK46TvO1CDi73/STDg==
X-CSE-MsgGUID: lFO0idrySbibY47t/qecbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="120953904"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 07:00:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tsj6P-00000002C2v-2hJi;
	Thu, 13 Mar 2025 16:00:01 +0200
Date: Thu, 13 Mar 2025 16:00:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z9Lk4e_09UbGFnid@smile.fi.intel.com>
References: <20250307052231.551737-1-raag.jadav@intel.com>
 <20250307052231.551737-3-raag.jadav@intel.com>
 <Z8_aJqNKK9AgBnK8@black.fi.intel.com>
 <Z9FpU0Ik_4yCU9XB@smile.fi.intel.com>
 <Z9G-RSfcRmALtgJe@black.fi.intel.com>
 <Z9HTU2BlXIa95S0V@smile.fi.intel.com>
 <Z9KjIAMfRIegA2vI@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9KjIAMfRIegA2vI@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Mar 13, 2025 at 11:19:28AM +0200, Raag Jadav wrote:
> On Wed, Mar 12, 2025 at 08:32:51PM +0200, Andy Shevchenko wrote:
> > On Wed, Mar 12, 2025 at 07:03:01PM +0200, Raag Jadav wrote:
> > > On Wed, Mar 12, 2025 at 01:00:35PM +0200, Andy Shevchenko wrote:
> > > > On Tue, Mar 11, 2025 at 08:37:26AM +0200, Raag Jadav wrote:
> > > > > On Fri, Mar 07, 2025 at 10:52:28AM +0530, Raag Jadav wrote:
> > > > > > Now that we have Intel MFD driver for PSE GPIO, depend on it.
> > > > 
> > > > > Andy, any guidance on GPIO?
> > > > 
> > > > I'm not sure what we are waiting here from me. Hadn't I reviewed your GPIO
> > > > part already?
> > > 
> > > Ah, I added MFD dependency for leaf drivers after your v1 review.
> > > So this one seems missing the tag. Can I add it?
> > 
> > I see, but this can be added later on.
> > And on the second thought, do we accept the configurations
> > when user wants to have GPIO on EHL, and doesn't care about TIO?
> 
> Yes, here we're making the leaf driver (GPIO) depend on MFD regardless
> of what TIO config is.
> 
> > Maybe this patch is not needed after all?
> 
> My understanding is that GPIO should depend on MFD. Not much point in
> adding a standalone leaf driver right?

Ah, indeed, we have no other means to enumerate it (as we don't have any board
file that does direct creation of the device), this patch is correct.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



