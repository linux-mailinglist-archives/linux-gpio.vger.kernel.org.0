Return-Path: <linux-gpio+bounces-5185-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 238CA89C80A
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 17:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B10B01F218BF
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 15:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B097213F455;
	Mon,  8 Apr 2024 15:19:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69D013F44E;
	Mon,  8 Apr 2024 15:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712589550; cv=none; b=VL6f072K4ZawsAZhBPA4acI+hGyq6YMXWMv8HFGETpj4JBzPO3ema8Z17etMoJj5lGkoI5rHQboXDewCFgawKft9vXHhyx4O5QQ3pxJzr3uE0R9QZuqCrhMJ4BBNsGG7Ww27L4CUElJOfUMWSFYRbPtxL70610LdVisNJgZribg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712589550; c=relaxed/simple;
	bh=WtUaFHh88q8zG6Pg5c4h+XOjPwQLtFJ1MVvJI3y8Ka8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqRTiyE7GJaiq3akz7hvWKrOmT6EIF6izCCco+ZMtqCg4Ihnf8PepM+8hnf2aB/84KQZ9Uuk2CorTJykhnHJhHPcTQqssbjGi8GquhMSutXnu/2w5gTmwqj/N96qWmc0jq0tfmdL7a1XCWOQqNBF56pGZbPyfetPM3GDRBtgrAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: nEsJdItCTtC2qHzDrTfo9g==
X-CSE-MsgGUID: FSDngJ43TLy2pqUvXKp/jw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7729821"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7729821"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 08:19:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="915368411"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="915368411"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 08:19:06 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rtqm0-00000002YmP-1TK0;
	Mon, 08 Apr 2024 18:19:04 +0300
Date: Mon, 8 Apr 2024 18:19:04 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/6] mmc: sdhci-acpi: Disable UHS/1.8V modes on Lenovo
 Yoga Tablet 2 series sdcard slot
Message-ID: <ZhQK6K0OUrXmrtWQ@smile.fi.intel.com>
References: <20240407200453.40829-1-hdegoede@redhat.com>
 <20240407200453.40829-4-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240407200453.40829-4-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Apr 07, 2024 at 10:04:51PM +0200, Hans de Goede wrote:
> Unlike all other Bay Trail devices I have (quite a few) the BIOS on
> the Lenovo Yoga Tablet 2 830 / 1050 and Lenovo Yoga Tablet 2 Pro 1380 (8",
> 10" and 13") models sets the SDHCI_SUPPORT_DDR50 bit in the sdcard slots'
> SDHCI controller's Caps_1 register which causes Linux to try and use
> UHS SDR12 / SDR25 and DDR50 modes on UHS cards.
> 
> These tablets do have 1.8V signalling implemented in the hw level through
> the Bay Trail SoC's SD3_1P8EN pin. But trying to use UHS modes leads to
> lots of errors like these:
> 
> [  225.272001] mmc2: Unexpected interrupt 0x04000000.
> [  225.272024] mmc2: sdhci: ============ SDHCI REGISTER DUMP ===========
> [  225.272034] mmc2: sdhci: Sys addr:  0x0712c400 | Version:  0x0000b502
> [  225.272044] mmc2: sdhci: Blk size:  0x00007200 | Blk cnt:  0x00000007
> [  225.272054] mmc2: sdhci: Argument:  0x00000000 | Trn mode: 0x00000023
> [  225.272064] mmc2: sdhci: Present:   0x01e20002 | Host ctl: 0x00000016
> [  225.272073] mmc2: sdhci: Power:     0x0000000f | Blk gap:  0x00000000
> [  225.272082] mmc2: sdhci: Wake-up:   0x00000000 | Clock:    0x00000107
> [  225.272092] mmc2: sdhci: Timeout:   0x0000000e | Int stat: 0x00000001
> [  225.272101] mmc2: sdhci: Int enab:  0x03ff000b | Sig enab: 0x03ff000b
> [  225.272110] mmc2: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000001
> [  225.272119] mmc2: sdhci: Caps:      0x076864b2 | Caps_1:   0x00000004
> [  225.272129] mmc2: sdhci: Cmd:       0x00000c1b | Max curr: 0x00000000
> [  225.272138] mmc2: sdhci: Resp[0]:   0x00000c00 | Resp[1]:  0x00000000
> [  225.272147] mmc2: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000900
> [  225.272155] mmc2: sdhci: Host ctl2: 0x0000000c
> [  225.272164] mmc2: sdhci: ADMA Err:  0x00000003 | ADMA Ptr: 0x0712c200
> [  225.272172] mmc2: sdhci: ============================================

> Since sdhci_acpi_slot_int_emmc sets SDHCI_QUIRK2_PRESET_VALUE_BROKEN

sdhci_acpi_slot_int_emmc()


> I tried setting that for sdhci_acpi_slot_int_sd too and that does makes

sdhci_acpi_slot_int_sd()

> things mostly work, but the above error still sometimes happen and
> regularly access to the card simply freezes for seconds, which are
> problems which do not happen with the non UHS SDR50 mode.
> 
> Add a new DMI_QUIRK_SD_NO_1_8_V DMI quirk flag and set that for these
> tablets to disable sdcard slot UHS modes by setting SDHCI_QUIRK2_NO_1_8_V
> for the sdcard slot when this quirk is set.

-- 
With Best Regards,
Andy Shevchenko



