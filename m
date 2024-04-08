Return-Path: <linux-gpio+bounces-5188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4507B89C819
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 17:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76D901C23FCB
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 15:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D68140380;
	Mon,  8 Apr 2024 15:22:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7098513F45E;
	Mon,  8 Apr 2024 15:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712589761; cv=none; b=DocR+rMrPGfZ/NJabhXABdCTbvRhIzDQuz1/9+iyyTsEym/IzoxvcLArwSCdt+dB5D7T4D1M3jqTlxuJcwupBRSunL3q5yq4drX/LV7Oel5e5JmX63O75hOBi+CCBb5PY3GbBVDlphbAQC0sMWZ0O7t4L7UKYdMBoQZ8aCNn8HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712589761; c=relaxed/simple;
	bh=bTCBhIUimMcMErsIl/Qe/BIupuXYQO4pfO4n26C6K5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpXq4M4+x62Bh7eROClnEcNrl/Wx6HUITWvzswdfg2pN3I2zwrpT0XUP7D+57HaQDcwZUBdeOUy/MZ0ZY8XCtoo6oO/n+AxoA/bohrhtsX3GdUh9zFOac2JJFdFSeuYyWPN5BW/CYvL8N05F5BGgWpbbYYvdIq6mn8vNRYoBNtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: DGwkoQ1PSqmTFlY/ADwWVQ==
X-CSE-MsgGUID: 35mIQrNrRliscoqnJaeUww==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8034018"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="8034018"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 08:22:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="915368474"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="915368474"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 08:22:37 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rtqpP-00000002YrF-0uuH;
	Mon, 08 Apr 2024 18:22:35 +0300
Date: Mon, 8 Apr 2024 18:22:34 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Subject: Re: [PATCH 6/6] mmc: sdhci-acpi: Add quirk to enable pull-up on the
 card-detect GPIO on Asus T100TA
Message-ID: <ZhQLulxlpfJ3R_HM@smile.fi.intel.com>
References: <20240407200453.40829-1-hdegoede@redhat.com>
 <20240407200453.40829-6-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240407200453.40829-6-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Apr 07, 2024 at 10:04:53PM +0200, Hans de Goede wrote:
> The card-detect GPIO for the microSD slot on Asus T100TA / T100TAM models
> stopped working under Linux after commit 6fd03f024828 ("gpiolib: acpi:
> support bias pull disable").
> 
> The GPIO in question is connected to a mechanical switch in the slot
> which shorts the pin to GND when a card is inserted.
> 
> The GPIO pin correctly gets configured with a 20K pull-up by the BIOS,
> but there is a bug in the DSDT where the GpioInt for the card-detect is
> configured with a NoPull setting:

PullNone
(and seems somewhere else, cover letter?, you used the former, non-ACPI terminology)

>                 GpioInt (Edge, ActiveBoth, SharedAndWake, PullNone, 0x2710,
>                     "\\_SB.GPO0", 0x00, ResourceConsumer, ,
>                     )
>                     {   // Pin list
>                         0x0026
>                     }

You can decrease indentation for quite a bit.

> Linux now actually honors the PullNone setting and disables the 20K pull-up
> configured by the BIOS.
> 
> Add a new DMI_QUIRK_SD_CD_ENABLE_PULL_UP quirk which when set calls
> mmc_gpiod_set_cd_config() to re-enable the pull-up and set this for
> the Asus T100TA models to fix this.

...

> Cc: Nuno Sá <nuno.sa@analog.com>

This can be after ---

...

> -		}
> +		} else if (quirks & DMI_QUIRK_SD_CD_ENABLE_PULL_UP)
> +			mmc_gpiod_set_cd_config(host->mmc,
> +						PIN_CONF_PACKED(PIN_CONFIG_BIAS_PULL_UP, 20000));

With {} patch will conform the coding style along with being less noisy.

-- 
With Best Regards,
Andy Shevchenko



