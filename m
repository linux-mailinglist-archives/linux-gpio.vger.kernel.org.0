Return-Path: <linux-gpio+bounces-8470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A531D942518
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 05:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B46D1F23791
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 03:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781D6182D8;
	Wed, 31 Jul 2024 03:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwKQr8tB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C413125D6;
	Wed, 31 Jul 2024 03:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722396920; cv=none; b=lyWo+BPne/nWbSgEguQXxRXFoGQedZd5SiTmmTuwglevnL0/2aBmWDUgviw9LhqBZBGQ7iXlIvyvpzqmswcuk11yQC+JQWfSQ7sb4a/ivW2p9siyib1W+HBhorm63oD4fRez0Oo8uGSTeZgNAovGuGqPi3KfhGmz8dDDpY9tfRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722396920; c=relaxed/simple;
	bh=AryltjAf6AGkg7qjk0xdwvpOG3hQp506KMvJGysEHmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kcq9CJ4rzCqVTNCxq0wta0lfCrkyJOnDQKm/92J0AO3wYYvpOM1JXqiFToGL1gDOfAFVwVQ4VOJQYUj7MkbVfKQeElu39kPR8gpHSFLAOK+9hQattEJhIL/QerjqgAw6hP6ikURDWk1y/R9Mv/RG3dQt3AdhQIpv8UTf0t8QnDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwKQr8tB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722396918; x=1753932918;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AryltjAf6AGkg7qjk0xdwvpOG3hQp506KMvJGysEHmg=;
  b=YwKQr8tBXBtseikbzjx/S+otCMsiMP3oriukruMdZSCeUkBSCc3q/Yrj
   3Ccbrmba+Wz/HwiBrFjTeWK2jeTjaJNazZ6qzhFrbF1RqN16RBrjFyOgV
   tN14zVjVk6vs67HNIabUWqKpJc7NWoDcZ2IAuZMZPFkqC3Wne+/Uco/e4
   /WvXm3HpoVXpt4aFkmm2aGgkiKu3NVbOrNBGauMvgPd1cmLDy6I5LJTPl
   L4Lk3rpK3Y2TC30/6MllQ+aQ51AmV6izKDLrctJaRiEgg3nE93DqaA3pU
   JxO4i8Rp19OOqOdWpSr/m6y1MQLsFk39JMzdNMvLwBHxwecaUKKgLNMPp
   w==;
X-CSE-ConnectionGUID: aispFCZaTqOovRDsQSTi/Q==
X-CSE-MsgGUID: yV1zb7o8RCOU03UgBUJUeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="24119544"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="24119544"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 20:35:17 -0700
X-CSE-ConnectionGUID: TYyhdOYMRgyXjyH984EsNQ==
X-CSE-MsgGUID: xnU9NzGRQ1+M9L8pQNfsBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="54588641"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jul 2024 20:35:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ07K-000thk-04;
	Wed, 31 Jul 2024 03:35:10 +0000
Date: Wed, 31 Jul 2024 11:34:51 +0800
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
Subject: Re: [PATCH v11 10/12] arm64: Kconfig.platforms: Add config for
 Marvell PXA1908 platform
Message-ID: <202407311123.I2HGcXOK-lkp@intel.com>
References: <20240730-pxa1908-lkml-v11-10-21dbb3e28793@skole.hr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730-pxa1908-lkml-v11-10-21dbb3e28793@skole.hr>

Hi Duje,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8400291e289ee6b2bf9779ff1c83a291501f017b]

url:    https://github.com/intel-lab-lkp/linux/commits/Duje-Mihanovi-via-B4-Relay/clk-mmp-Switch-to-use-struct-u32_fract-instead-of-custom-one/20240730-204129
base:   8400291e289ee6b2bf9779ff1c83a291501f017b
patch link:    https://lore.kernel.org/r/20240730-pxa1908-lkml-v11-10-21dbb3e28793%40skole.hr
patch subject: [PATCH v11 10/12] arm64: Kconfig.platforms: Add config for Marvell PXA1908 platform
config: arm64-kismet-CONFIG_I2C_GPIO-CONFIG_VIDEO_MMP_CAMERA-0-0 (https://download.01.org/0day-ci/archive/20240731/202407311123.I2HGcXOK-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240731/202407311123.I2HGcXOK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407311123.I2HGcXOK-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_GPIO when selected by VIDEO_MMP_CAMERA
   WARNING: unmet direct dependencies detected for I2C_GPIO
     Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (GPIOLIB [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - VIDEO_MMP_CAMERA [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && I2C [=y] && VIDEO_DEV [=y] && (ARCH_MMP [=y] || COMPILE_TEST [=n]) && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

