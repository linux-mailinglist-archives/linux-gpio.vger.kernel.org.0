Return-Path: <linux-gpio+bounces-12549-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD2B9BC40A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 04:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 368E31F22D71
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 03:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5B11885B4;
	Tue,  5 Nov 2024 03:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFesyRkC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D9217C20F;
	Tue,  5 Nov 2024 03:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730778429; cv=none; b=hM67S6HRiX+azKc3qd8oACdwmWw/Dausvzo5O/af3nv8xr0DYQ/V6zz7kyZMa6T4eNZxOgaq5x50fWJvyI7pxkoM/Tp2J1GA4em4SgSysE22A3gIBd+BFIHybLKReiiFSrzPf5i295zIfVVYMfHY0HjRWxRer0B+7xpgj0lmkKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730778429; c=relaxed/simple;
	bh=8TsvSQbE65UhTUrEuiAcFPCLHnlzDnvn34YkdDVwTWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F63Qp2ghnCobxh41yp9PPwLEVUmEakySjaUAI8uN5tebL8wqKqHc1HvkUkhzIHwh4ueSdcC9JlHOZMCoF8nTb9nC0eozVgmRv1tLE6yTt8dy049HRdc+xoIf7TY8dO/LdpAJcFo7nBWzfTo/NhPnRSSdjOQAlJkDwvL6FQSuG8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFesyRkC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730778427; x=1762314427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8TsvSQbE65UhTUrEuiAcFPCLHnlzDnvn34YkdDVwTWo=;
  b=XFesyRkCCGBAeaTFBgbC3VJ2WEeE9914Hvc8JX2OaAckVtMWGfAv0WkP
   O8YVGIivMTLXf0LqeyhlI1+LaMQjefmfqRetfH/KCcSNeM3PAPwWyA+OQ
   OHnbhN2GBTSeRTDbXTW2rvauTPlwow3i0qyxTfn68uE/8fbs0A9oV/m0a
   6gpBDBGONfDgy2+hXILE9jm2G5Lc71Sma1S+0BglzftxzTViGYg7msoNc
   WbcYbH0HfPwUnuDQYE468SNMY9c//elNihqFJ7Pve67LHZXfe6PjtXAZE
   1CMl0TotytLS4v82gjcBB8JHcBsJheN+JOqaXZsprKki22p61PS6AE07X
   w==;
X-CSE-ConnectionGUID: NnE+rOWGToWER9c0vAnlOg==
X-CSE-MsgGUID: Uwxuq+a8T9elxlzQRnD34w==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29925017"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="29925017"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 19:47:06 -0800
X-CSE-ConnectionGUID: pBn/4mjpR56YEC47o0gLrQ==
X-CSE-MsgGUID: A0enPtwYTPWI2zbCLPgtuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="88366033"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Nov 2024 19:47:01 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8AWx-000lZh-1m;
	Tue, 05 Nov 2024 03:46:59 +0000
Date: Tue, 5 Nov 2024 11:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= via B4 Relay <devnull+duje.mihanovic.skole.hr@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v13 10/12] arm64: Kconfig.platforms: Add config
 for Marvell PXA1908 platform
Message-ID: <202411051124.7S823oLf-lkp@intel.com>
References: <20241104-pxa1908-lkml-v13-10-e050609b8d6c@skole.hr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104-pxa1908-lkml-v13-10-e050609b8d6c@skole.hr>

Hi Duje,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Duje-Mihanovi-via-B4-Relay/clk-mmp-Switch-to-use-struct-u32_fract-instead-of-custom-one/20241105-010102
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241104-pxa1908-lkml-v13-10-e050609b8d6c%40skole.hr
patch subject: [PATCH RESEND v13 10/12] arm64: Kconfig.platforms: Add config for Marvell PXA1908 platform
config: arm64-kismet-CONFIG_I2C_GPIO-CONFIG_VIDEO_MMP_CAMERA-0-0 (https://download.01.org/0day-ci/archive/20241105/202411051124.7S823oLf-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241105/202411051124.7S823oLf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051124.7S823oLf-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_GPIO when selected by VIDEO_MMP_CAMERA
   WARNING: unmet direct dependencies detected for I2C_GPIO
     Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (GPIOLIB [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - VIDEO_MMP_CAMERA [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && I2C [=y] && VIDEO_DEV [=y] && (ARCH_MMP [=y] || COMPILE_TEST [=n]) && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

