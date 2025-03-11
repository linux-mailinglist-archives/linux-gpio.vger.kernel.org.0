Return-Path: <linux-gpio+bounces-17408-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CC8A5B94F
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 07:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E10823AAF47
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 06:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CB21F03F2;
	Tue, 11 Mar 2025 06:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzpIgjZk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2947D20B22;
	Tue, 11 Mar 2025 06:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741675054; cv=none; b=s6fa2YDAEFmPEC6r8ZXtWkTdHu83m66FQ57ZaPR9pW755qfUcClklQcKesl1Ce9yVPoAT/DAUuJTb7mc+6XsPEsagXjegU7UD6vsV9JajCu0eSUbaxDeOhizrIj2kxkiP+egkHYnXAnP9SR5izeI0p5rNwFbJS0OA/pOrKx04SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741675054; c=relaxed/simple;
	bh=ElT+BAOxpAUwbci6cH2/IoskBbgd/MKv7IgFu5NltY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyWf1Z+pbYYKyDFhiAeDcmJf6uT8MWVKz3zzPvg942WhQTtf9w8W5gbuTMcjCxMl2lAIs6PnEWB5O9B/Ejiobrt4DzVPB0xPDG3nmLFnR7THoYfS/t69mHnREGxiyEvK266AAYHgkbmKG01P78qSihSHClyjPWRMqEv1hb9ZQJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SzpIgjZk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741675053; x=1773211053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ElT+BAOxpAUwbci6cH2/IoskBbgd/MKv7IgFu5NltY8=;
  b=SzpIgjZk6oROpEtjIlm1NPknobIb7zmZyroZNiH4KWYpU29WAUPT0b2p
   68111WMDKudDa7+Zp1aOPzbGcRWC9E+jiXRLc1qpLJvl6N8t67c1oa1Jf
   aR3l3v057QwT/KsFCZgkzcZFiaaOCTEcBY6ZyMLsb1dKZkhF0517fUlUV
   9apsMHniQmGAXzDJM4FTSWE0m98C/jPXVJ3zmFC5DRPTZ6tdVh6jWn4JY
   lQTgUxbsQxZLiouq8IuyRn3As0DvO2vuAOD2mKR8DHhfdaJ/mJQ8NukR0
   /2UnZCM1OkTXHlYCwFIRA4HbpEmU/vKprFa+4VnNW0Si1dIMPWFlmhVa8
   g==;
X-CSE-ConnectionGUID: nszGvnQTTymjxyKhCh44iQ==
X-CSE-MsgGUID: oJ4LJQ3nSxup3pEpKvE8ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="68057925"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="68057925"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 23:37:32 -0700
X-CSE-ConnectionGUID: wjoxnnKbRd69CEZJBrt4lQ==
X-CSE-MsgGUID: MwmQjN6kRjqvlvrNR6cq+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="124399077"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 23:37:29 -0700
Date: Tue, 11 Mar 2025 08:37:26 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com, raymond.tan@intel.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z8_aJqNKK9AgBnK8@black.fi.intel.com>
References: <20250307052231.551737-1-raag.jadav@intel.com>
 <20250307052231.551737-3-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307052231.551737-3-raag.jadav@intel.com>

On Fri, Mar 07, 2025 at 10:52:28AM +0530, Raag Jadav wrote:
> Now that we have Intel MFD driver for PSE GPIO, depend on it.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---

Andy, any guidance on GPIO?

Raag

>  drivers/gpio/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 98b4d1633b25..232ef211ef38 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1372,7 +1372,7 @@ config HTC_EGPIO
>  
>  config GPIO_ELKHARTLAKE
>  	tristate "Intel Elkhart Lake PSE GPIO support"
> -	depends on X86 || COMPILE_TEST
> +	depends on (X86 || COMPILE_TEST) && MFD_INTEL_EHL_PSE_GPIO
>  	select GPIO_TANGIER
>  	help
>  	  Select this option to enable GPIO support for Intel Elkhart Lake
> -- 
> 2.34.1
> 

