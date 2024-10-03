Return-Path: <linux-gpio+bounces-10766-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F96398E889
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 04:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2AD51C23326
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 02:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0580917C7C;
	Thu,  3 Oct 2024 02:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Raudqgaj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607461FB4;
	Thu,  3 Oct 2024 02:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727923697; cv=none; b=nnFbHSpVgT1V3aVw9pqaTmbeMIRVGyj+kM8MmGrqeY8/ovWoVjy6bLvetcSDfdB3qoRSCOE8S2gEL6823OdlMQo4hfwM/7iYzyenY+KKVTeCLBd39NZvj6uhlU/TW1WOpcc8Q4J73OjL0kvkTxKTGvF4fAHqEcp7q05Vl9dIvIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727923697; c=relaxed/simple;
	bh=C9f59WqREwOy4kUCeO0npoWSlHkM2bqNjO0AyJpvsRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZS0iBj03adoypLeTvVI3MMz8m1GJibq9slDDyTQyg8/xpuqxW409Ov9VVrGwsNfwGBZ+95y5uoEhJA8SdmgXScYFkJK/GcTGoNu5y6a3hFYd0b5F5N/ZFFVCcFBcrkJSPGeNa6X31954xxC2mojAgQfosq7bf7IFkDKxjYSn5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Raudqgaj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727923696; x=1759459696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C9f59WqREwOy4kUCeO0npoWSlHkM2bqNjO0AyJpvsRc=;
  b=Raudqgajdq7XUsiIaeinZ+WDvrm+qbcHj4+MfIZfRzci/V1eh4cP52UK
   tRzOFRI9UJYy/m3C5LkeDk8rrVx1KyaFSG7BarMAsyunUGhfD52/EhGHS
   GIkvDJ7N10Vw8XMmKLkd0ot/GhtOhlnzZzZHlQ7wDc2QwnrWRjoClMino
   qIHUKha0uBE402zr3Y6sjox6VoeW0Rwk4VZgq7sQiRkasUkWnhSkuOCEg
   Qr4QdrtRTZ24Q7xuIR+LMAvzlHWjyJp6aXimPBMgBop53hFBhDkYhUoHM
   qlcs+78QHJIPrKbJGCPIfKe6znsMNkF0VNe5dT09YQ3zxdhDBtGLIBfgH
   g==;
X-CSE-ConnectionGUID: DYjLG8rWTzK0YwVm3On/Dg==
X-CSE-MsgGUID: VbEHzRwlSmS5dZD+HVx01Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26993304"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="26993304"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 19:48:16 -0700
X-CSE-ConnectionGUID: Ij5dl7FwSyS7jelLR9VZoA==
X-CSE-MsgGUID: +Y6awNQ0S4CRrI4m8+iH7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="74631892"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 19:48:13 -0700
Date: Thu, 3 Oct 2024 05:48:10 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: platform: Add Panther Lake to the
 list of supported
Message-ID: <Zv4F6mXLbVhGRU3x@black.fi.intel.com>
References: <20241002150036.3698181-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002150036.3698181-1-andriy.shevchenko@linux.intel.com>

On Wed, Oct 02, 2024 at 06:00:36PM +0300, Andy Shevchenko wrote:
> Intel Panther Lake is supported by the generic platform driver,
> so add it to the list of supported in Kconfig.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
> index 2101d30bd66c..14c26c023590 100644
> --- a/drivers/pinctrl/intel/Kconfig
> +++ b/drivers/pinctrl/intel/Kconfig
> @@ -46,6 +46,7 @@ config PINCTRL_INTEL_PLATFORM
>  	  of Intel PCH pins and using them as GPIOs. Currently the following
>  	  Intel SoCs / platforms require this to be functional:
>  	  - Lunar Lake
> +	  - Panther Lake

Perhaps add a small comment in the driver as well?
It is not quite obvious from the code given the generic name of the driver.

Raag

