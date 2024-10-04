Return-Path: <linux-gpio+bounces-10814-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAC698FDF4
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 09:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6572A283CFE
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 07:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0159B13B59A;
	Fri,  4 Oct 2024 07:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyVjzgjr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F19A13AD2A;
	Fri,  4 Oct 2024 07:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728027621; cv=none; b=P+5tAizxKz4vwr5z7VSY8FHpfKCTG14vPPTnCXUzMdXEEISpRRTS95zNSr10BMxKTztfSl9/um66ZEcUmtJjmvlQJW3mhHYg/p2js2b/TXmOZY4QumIYx/iyMIEDOfk8LaN35nfUnIff7gYd+Zvnut/INy3GSG/ddzf6Nt8C2NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728027621; c=relaxed/simple;
	bh=jeuOprsNrHYvDhtbr8K1Fr4rBYGsHng5OzWZolAVMD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kK3QJlZ7lc0wTkRVw8n4f7ZkXSfQDSDcqsa0S/5gUQki1t7pcnHMgdLpwmTmESD+rK058OlBnIOmT+CegWJxUAhr2XxAPRbGVUJjEo6lELxuyAXuUg9jYUdZfOQz2oqnVLbziFzG+K5DA0+da+yV/6HONfDyln+AtwUMEaRhrqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hyVjzgjr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728027620; x=1759563620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jeuOprsNrHYvDhtbr8K1Fr4rBYGsHng5OzWZolAVMD0=;
  b=hyVjzgjrhOq2s07v10OyPeB2ZqvGKMWsEJbFOmlr6BJvU5u3JQifYHju
   1tDLhQBVw/imqmuyt/Jgr0izIBjaQ4fOVIYA//gb/05wEe6oYSTnwsGb+
   WPENJe99KOLykQklEDeaTesFOrOhC1MakqdrH9DBXvhXajmSU/CuNNQoe
   t8Jh4iEJrL/ZMzfvjjDRs6idhuQF4nxC9EgB5G1+cfgcdven0qPeGRD8m
   lGbQtUTOCAiJPMBgm6GRypNrft+o5b39PNOX4H+wPYVudhmyiLqDCqG3V
   sIkns2IPwFDkIp7qVsnjbW/B8wcc66gUR4/QC1wCzLtzVAx9g8CkZUDJC
   Q==;
X-CSE-ConnectionGUID: z+2r0mhWSDu33Gm0Z3+UhA==
X-CSE-MsgGUID: DYgDRTGxTVanCS0NWhBIvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="49773667"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="49773667"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 00:40:19 -0700
X-CSE-ConnectionGUID: X57WiVEhQPqNeRPsnrVrMQ==
X-CSE-MsgGUID: oupDzxnnRnqC/EiV8myw8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="105368585"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Oct 2024 00:40:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swcv0-0001Ku-0l;
	Fri, 04 Oct 2024 07:40:06 +0000
Date: Fri, 4 Oct 2024 15:39:21 +0800
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
Subject: Re: [PATCH v13 10/12] arm64: Kconfig.platforms: Add config for
 Marvell PXA1908 platform
Message-ID: <202410041521.flkiRLrV-lkp@intel.com>
References: <20241001-pxa1908-lkml-v13-10-6b9a7f64f9ae@skole.hr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001-pxa1908-lkml-v13-10-6b9a7f64f9ae@skole.hr>

Hi Duje,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Duje-Mihanovi-via-B4-Relay/clk-mmp-Switch-to-use-struct-u32_fract-instead-of-custom-one/20241001-224233
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241001-pxa1908-lkml-v13-10-6b9a7f64f9ae%40skole.hr
patch subject: [PATCH v13 10/12] arm64: Kconfig.platforms: Add config for Marvell PXA1908 platform
config: arm64-kismet-CONFIG_I2C_GPIO-CONFIG_VIDEO_MMP_CAMERA-0-0 (https://download.01.org/0day-ci/archive/20241004/202410041521.flkiRLrV-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241004/202410041521.flkiRLrV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410041521.flkiRLrV-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_GPIO when selected by VIDEO_MMP_CAMERA
   WARNING: unmet direct dependencies detected for I2C_GPIO
     Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (GPIOLIB [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - VIDEO_MMP_CAMERA [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && I2C [=y] && VIDEO_DEV [=y] && (ARCH_MMP [=y] || COMPILE_TEST [=n]) && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

