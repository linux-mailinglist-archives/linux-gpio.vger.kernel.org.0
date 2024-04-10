Return-Path: <linux-gpio+bounces-5314-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E68E8A0106
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 22:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25D412853E8
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 20:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B115181B91;
	Wed, 10 Apr 2024 20:06:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D11181338;
	Wed, 10 Apr 2024 20:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712779580; cv=none; b=UlgigIHvuB57Dw3vY7WYDWnFKYQ74Og3OE5+M+WTPn6wj+7LpOwx41EGGwEUNBH4JoJKRPSHZYQk78xZHPHoA1TxsxQy4F7kMGTdmTv1p/tMe+UQkh1UpUCTWUyk+1OL5NCprVPWCHnpw/MjwbaaCbUOXONQ10UZTQ3L0b070Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712779580; c=relaxed/simple;
	bh=zElH8+uz719yHiM/COLRyHQi8EqVqkkYa+bgnBOewE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKRUOf1Eo5ipf1qaqnxl3fN+eNl36xJLtsplG0MKou2BOz8m92zKVahdP7zXQBD3ay8nl5+IC2lTPwty0bhg3R82F/7CSbUPfrHM0q8ER+hjYoJDCT7WJJ9yjepEe6bx6hiIbfTA6Oz+MrUljdDlLBW3MDG3mZvjnkSPfkedMmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: 4HYhqGL2Qm+met2mY1jHgQ==
X-CSE-MsgGUID: yfoRDY3kQb6Wvm1CpJUs7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8024249"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8024249"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 13:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="915441864"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="915441864"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 13:06:16 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rueCz-00000003B5A-3D2A;
	Wed, 10 Apr 2024 23:06:13 +0300
Date: Wed, 10 Apr 2024 23:06:13 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Subject: Re: [PATCH v3 6/6] mmc: sdhci-acpi: Add quirk to enable pull-up on
 the card-detect GPIO on Asus T100TA
Message-ID: <ZhbxNdf0mGB4zbzA@smile.fi.intel.com>
References: <20240410191639.526324-1-hdegoede@redhat.com>
 <20240410191639.526324-7-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410191639.526324-7-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 10, 2024 at 09:16:39PM +0200, Hans de Goede wrote:
> The card-detect GPIO for the microSD slot on Asus T100TA / T100TAM models
> stopped working under Linux after commit 6fd03f024828 ("gpiolib: acpi:
> support bias pull disable").
> 
> The GPIO in question is connected to a mechanical switch in the slot
> which shorts the pin to GND when a card is inserted.
> 
> The GPIO pin correctly gets configured with a 20K pull-up by the BIOS,
> but there is a bug in the DSDT where the GpioInt for the card-detect is
> configured with a PullNone setting:
> 
>     GpioInt (Edge, ActiveBoth, SharedAndWake, PullNone, 0x2710,
>         "\\_SB.GPO0", 0x00, ResourceConsumer, ,
>         )
>         {   // Pin list
>         0x0026
>         }
> 
> Linux now actually honors the PullNone setting and disables the 20K pull-up
> configured by the BIOS.
> 
> Add a new DMI_QUIRK_SD_CD_ENABLE_PULL_UP quirk which when set calls
> mmc_gpiod_set_cd_config() to re-enable the pull-up and set this for
> the Asus T100TA models to fix this.

...

> +			mmc_gpiod_set_cd_config(host->mmc,
> +						PIN_CONF_PACKED(PIN_CONFIG_BIAS_PULL_UP, 20000));


Just noticed, the PIN_CONF_PACKED() is a helper for pinconf-generic.h. It seems
unusual to use it directly, and AFAIU documentation, it's for static
initialisations, however it's not explicitly said.

Hence, I suggest to use pinconf_to_config_packed() as others do for
the run-time code.

-- 
With Best Regards,
Andy Shevchenko



