Return-Path: <linux-gpio+bounces-5184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B7E89C7EE
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 17:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84B211F22EA1
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 15:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A5B13F44E;
	Mon,  8 Apr 2024 15:16:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA2C13F446;
	Mon,  8 Apr 2024 15:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712589369; cv=none; b=HaVW4mvoTTKv6c3QoVtvNXcsnfWvo8fbDTv1lne4rxupAQEmf/Xr+vVUgbXaG1jCR7EXpJgTAaKjy5Hc8EY7qDwBBBJbrrRURZkSZhvoCYR9iVjAkMN4avPvu7wTAe/ZtvapeY/G3KPi68Mm+GpZlsq6jDX90l3ce8FAjivhpII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712589369; c=relaxed/simple;
	bh=lVk+Q1lvDS7zarLnrKK/V6327NL8YZU4dQlFqm6aDrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHW/mE377rYqglcOMlyk7sb2Pt4jiztQYn+vsCCZgjkaUdtKhpfDFP8RicKh1grqPg3em5aSQmbn6BJJ7jeTJaJv3chtQMXZGGcl9Y3b67d4p7UbIBUT/akdIjaD3+/OkP7LUb0O6YwntdRhz2fugUfVECjYXREw1S8s590gesI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: 16ynSkJRTx+hw1FLy+OwKg==
X-CSE-MsgGUID: DxeRwom8Snaib5ZJGNAfnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7729263"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7729263"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 08:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="915368328"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="915368328"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 08:16:05 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rtqj5-00000002YkS-0ITa;
	Mon, 08 Apr 2024 18:16:03 +0300
Date: Mon, 8 Apr 2024 18:16:02 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/6] mmc: core: Add mmc_gpiod_set_cd_config() function
Message-ID: <ZhQKMpL3a24o1fjO@smile.fi.intel.com>
References: <20240407200453.40829-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240407200453.40829-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Apr 07, 2024 at 10:04:48PM +0200, Hans de Goede wrote:
> Some mmc host drivers may need to fixup a card-detection GPIO's config
> to e.g. enable the GPIO controllers builtin pull-up resistor on devices
> where the firmware description of the GPIO is broken (e.g. GpioInt with
> PullNone instead of PullUp in ACPI DSDT).
> 
> Since this is the exception rather then the rule adding a config
> parameter to mmc_gpiod_request_cd() seems undesirable, so instead
> add a new mmc_gpiod_set_cd_config() function. This is simply a wrapper
> to call gpiod_set_config() on the card-detect GPIO acquired through
> mmc_gpiod_request_cd().

...

>  int mmc_gpiod_request_cd(struct mmc_host *host, const char *con_id,
>  			 unsigned int idx, bool override_active_level,
>  			 unsigned int debounce);
> +int mmc_gpiod_set_cd_config(struct mmc_host *host, unsigned long config);

A nit, can we group it with...

>  int mmc_gpiod_request_ro(struct mmc_host *host, const char *con_id,
>  			 unsigned int idx, unsigned int debounce);
>  void mmc_gpio_set_cd_isr(struct mmc_host *host,

...this one, as request ops vs. set_cd ones?

-- 
With Best Regards,
Andy Shevchenko



