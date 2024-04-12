Return-Path: <linux-gpio+bounces-5438-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A69F8A3485
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 19:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FD201F23454
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 17:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081F514C584;
	Fri, 12 Apr 2024 17:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhH8Bgsq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D1914C587;
	Fri, 12 Apr 2024 17:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712941998; cv=none; b=CcXnUgu0scB0Qo3cxjHUErN1GQa0NXYvfpifzCA2jfCzjwTm1gTgpqUUrrGh4xXzLjARAhbnVxzm5aUgwXptUxUCLbrKd8V6pbt/hyMMA099mgHeVvLoAg2YVG0t3l/AAnroxdkkQubGD4aX9sdI8na3CW3s+UCU+wQC36Mutzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712941998; c=relaxed/simple;
	bh=4UoIP/1W3kW58dM139lhbm7r21YqNAAgoi4JWZnZCAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVsi5J7TiF1tDWnxgcwx5crVfQ8KZakU3piYIyxkovEeW3YvJz6SemLNy+p4ORECzfs3wbI5YXZN8gaI8v0UAR41XSkvw8KcVYTfqxotl7HWnF284iBaGOHjPiojRJ1yaBJDJUp3rbaM1YrUzs8+bTQbu1P4ldhEWQ4Wa9AmKwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhH8Bgsq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712941997; x=1744477997;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4UoIP/1W3kW58dM139lhbm7r21YqNAAgoi4JWZnZCAo=;
  b=YhH8BgsqTx7UYMdqjRXeMjruzU8tLFXz9aKf3PW94xKyl4qsJm6ADnug
   92wd0FuLDwxebSuH2kWSvqS+/ebIEAPHYVKjmDOv4Vfc0PmmDI2Kl7nzw
   urC5otZfibEBYrWnPSan3jJI0Zj3t21IrKCAfoDdpQa99+iWkxFmySCeK
   OuadC19afCqZ9vXwRwkHy9wLbiaVoNuMb8Isvn9yt8Mk8hGW1q/LBxJ7i
   WW3UpZH6gzcvmUqEEXvcS5acCFW86RHOtlsZ1ZpJ+lritZNbsiWJOjCzS
   gE6JR2VpvVMoxINOuMTCPCs1UMgmGsxy5EWuSP1lCmgZ3p0x0Xivfqizt
   w==;
X-CSE-ConnectionGUID: pS0ex5w8QxCpQVlwl+TB9Q==
X-CSE-MsgGUID: MaQFp8enT3Sii3mTp8RTMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="12255781"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="12255781"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 10:13:16 -0700
X-CSE-ConnectionGUID: Rht0oWlqT06azeRvHQjy8A==
X-CSE-MsgGUID: bWwS+aMMSCS7WI9M9p3kyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="21359946"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.251.215.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 10:13:14 -0700
Message-ID: <ee5ef043-289d-4cb3-b125-30f7d92543ad@intel.com>
Date: Fri, 12 Apr 2024 20:13:08 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] mmc: sdhci-acpi: Add some DMI quirks to fix
 various issues on Bay Trail devices
To: Hans de Goede <hdegoede@redhat.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Andy Shevchenko <andy@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20240410191639.526324-1-hdegoede@redhat.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20240410191639.526324-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/04/24 22:16, Hans de Goede wrote:
> Hi All,
> 
> Here is v3 of my series adding DMI quirks to fix various issues on Intel
> Bay Trail tablets.
> 
> Changes in v3:
> - Replace "mmc: sdhci-acpi: Disable UHS/1.8V modes on Lenovo Yoga
>   Tablet 2 series sdcard slot" with a new patch from Adrian which
>   actually fixes these modes:
>   "[PATCH v3 2/6] mmc: sdhci: Add support for "Tuning Error" interrupts"
> 
>   Note this is missing a Signed-off-by from Adrian since this started out
>   as a quick test patch from Adrian.
>   Adrian, can you provide your S-o-b for this patch?
> 
> Changes in v2:
> - Address a few small remarks from Andy and adds Andy's Reviewed-by
>   to the patches
> 
> Regards,
> 
> Hans
> 
> 
> Adrian Hunter (1):
>   mmc: sdhci: Add support for "Tuning Error" interrupts
> 
> Hans de Goede (5):
>   mmc: core: Add mmc_gpiod_set_cd_config() function
>   mmc: sdhci-acpi: Sort DMI quirks alphabetically
>   mmc: sdhci-acpi: Fix Lenovo Yoga Tablet 2 Pro 1380 sdcard slot not
>     working
>   mmc: sdhci-acpi: Disable write protect detection on Toshiba WT10-A
>   mmc: sdhci-acpi: Add quirk to enable pull-up on the card-detect GPIO
>     on Asus T100TA
> 
>  drivers/mmc/core/slot-gpio.c  | 20 ++++++++++++
>  drivers/mmc/host/sdhci-acpi.c | 61 +++++++++++++++++++++++++++++++----
>  drivers/mmc/host/sdhci.c      | 10 ++++--
>  drivers/mmc/host/sdhci.h      |  3 +-
>  include/linux/mmc/slot-gpio.h |  1 +
>  5 files changed, 86 insertions(+), 9 deletions(-)
> 

For all:

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Note also patch 2 needs my Signed-off-by


