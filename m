Return-Path: <linux-gpio+bounces-30548-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E705FD1E6DA
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 12:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 169F1301397A
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED43395D8A;
	Wed, 14 Jan 2026 11:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YP7uOVTt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488FB394488;
	Wed, 14 Jan 2026 11:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768390237; cv=none; b=ZCEqzJBxLhCPi26btis6Vxx8KoZm4t8Aneim+5YTq43zCuAMxmmX6rAqwR+caULn9kWmZkQ3DkYewAlZlSMyjmIADxZgSqDcKh21oGdDs2c8qnsMJ/uq42QgzXTuOnJOUXTCxOsv425sDKFUlQ5JKTZ+a45eobJZqaZaokSp0lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768390237; c=relaxed/simple;
	bh=EFCBNwT2ckrdxH3mRzf2DgYuCR5gZqtMmo+z6MwtU5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CyYF9LXdNxCh2hMnSytkz1e+0xWMvzNxRyqOZ1BwSBi5uBvnIjQeZ4XFoaPFSBNCV6JR28MkYGuptuV4zxJUKs09dhK9IExGrfhd7IIAgTU2pTF0RR40fAgqkmcRXoOKXdYIknm+Mqo0af0XrkTRKgGMWbbnTsOdkdt7p12oO2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YP7uOVTt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768390235; x=1799926235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EFCBNwT2ckrdxH3mRzf2DgYuCR5gZqtMmo+z6MwtU5A=;
  b=YP7uOVTtQ0c8r14ymLJ5RKId8iaoMiNM1fKsr0k0y0kb675fFEj1NuZw
   nYCgUGJV0bYJ/DkxaaxZZshtCFf5xfkmTEmA6cBV1thiyI4q0cfcvTlZ8
   ZQoTIduAh0QASn/Jtpfdc3p05f3A6O848G7sVgrUK4zvlHphNLIIV5LxZ
   eSQcf17fdtxKt/VGIiUlAoZC+UWrRWY1kZ5iyCNrGdBxgwG572ZG3hiMZ
   M8UoLTTyslz/wAeHs3qKohVEVne2DIgLFWPKemr8pCKoezVr7kGfz9228
   OKKNzRNpyEMo+I6q7hu1sn4ym1Rk1F/KmAl2K5xB3FnD158A47FoGAZui
   A==;
X-CSE-ConnectionGUID: cfmuRDroS/yuERkx42qFHw==
X-CSE-MsgGUID: NUWSYT0+QGuo3CfCL9mHPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="95161097"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="95161097"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 03:30:35 -0800
X-CSE-ConnectionGUID: DipLkjhRRLiDmRnbxpR6Gw==
X-CSE-MsgGUID: AeNcG5nLRzKHUlX+BGZRfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204547658"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 03:30:33 -0800
Date: Wed, 14 Jan 2026 12:30:30 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: platform: Add Nova Lake to the
 list of supported
Message-ID: <aWd-VlNabg7m0iJX@black.igk.intel.com>
References: <20260114100555.277960-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114100555.277960-1-andriy.shevchenko@linux.intel.com>

On Wed, Jan 14, 2026 at 11:05:55AM +0100, Andy Shevchenko wrote:
> Intel Nova Lake is supported by the generic platform driver,
> so add it to the list of supported in Kconfig.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
> index 248c2e558ff3..e4dc9ba899bd 100644
> --- a/drivers/pinctrl/intel/Kconfig
> +++ b/drivers/pinctrl/intel/Kconfig
> @@ -45,6 +45,7 @@ config PINCTRL_INTEL_PLATFORM
>  	  of Intel PCH pins and using them as GPIOs. Currently the following
>  	  Intel SoCs / platforms require this to be functional:
>  	  - Lunar Lake
> +	  - Nova Lake

I'm lazy and I would hope for such information to also be available in
the driver. But in any case,

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

>  	  - Panther Lake
>  
>  config PINCTRL_ALDERLAKE
> -- 
> 2.50.1
> 

