Return-Path: <linux-gpio+bounces-12476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4669B9A63
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 22:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F42C1C21433
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 21:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDE41F4725;
	Fri,  1 Nov 2024 21:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVjOECtG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDC725634;
	Fri,  1 Nov 2024 21:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730497689; cv=none; b=bgZZ9JUX9topRuHNGyPDTOi57Yw/IqFKVHJBCFikUWg+f8dVcXv/7/kJeUkxeRKDf23yQVy43pSNwAv4lEDqJkt6ebmLRPaRGwONFuPpbsZW7+sfCdaToCAbYhmy5ahK3/AFWa42M3H64wusVm9XQps0gCoeRCHrivz1fo1u6h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730497689; c=relaxed/simple;
	bh=Dwdq9rHIpOh+78kD6lWNmELuBrWSfYZSR/MPnUOKJUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFDhQAfnembHhzhqhBFdWJdnj5cE6C2Y76VybbrHogko2NPd/kIrv2rLNl2dq89MWPtLCcW+bR6q9pztsD8v5VwG3zAoQzTu0ot+kSkumSwdElXXMDjuiJDSJtn11JhkB5FcKdmPbLEY1NFDHrzjV12lV4wj/SWObV8yxNmw8JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YVjOECtG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730497688; x=1762033688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dwdq9rHIpOh+78kD6lWNmELuBrWSfYZSR/MPnUOKJUA=;
  b=YVjOECtGaaiXmxZJkkCRA2bKy++UCudc4u1YiEjD7dA49LdPRKLrGP5c
   KQKw+c/dgTeVjqh9Ynhc6GPJdqMHEvObgiEF/xgGyml1X90vtEwQTk4nj
   Mpln/hXGU1q0NZIWRBiOrhRSOVddRnm5JS4pIiJpC599fWJvhy9Uk9VHw
   3ZdephmLCoivghRBrhRKzC/xkus3lX8yThGzAWF/lz/a9DaQV9lv0/SVk
   4Ayz1f6kBMx3A/tCR30gefTH6KH0vP8ju7ZlfeArxLF2UFAYJBfq3Py08
   V8mqhth1X3Uy6n8aKv3GpNw9bEIOoGigItJDa5gnFVDJuZPSu2v5wX/W1
   Q==;
X-CSE-ConnectionGUID: gfGt6b4ZReSl1CHfVo9GfQ==
X-CSE-MsgGUID: hKh4ICcBQ/aS+N8hq48qNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30229825"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30229825"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 14:48:07 -0700
X-CSE-ConnectionGUID: 9w/56nX/RnCHrAdIl5pDBA==
X-CSE-MsgGUID: yEtcosP4Tc+1RCMNMWkXcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="82613540"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Nov 2024 14:48:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6zUt-000i55-08;
	Fri, 01 Nov 2024 21:47:59 +0000
Date: Sat, 2 Nov 2024 05:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: Re: [PATCH v5 4/7] pinctrl: s32: convert the driver into an mfd cell
Message-ID: <202411020514.qOUrieWa-lkp@intel.com>
References: <20241101080614.1070819-5-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101080614.1070819-5-andrei.stefanescu@oss.nxp.com>

Hi Andrei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next lee-mfd/for-mfd-next shawnguo/for-next linus/master v6.12-rc5 next-20241101]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Stefanescu/dt-bindings-mfd-add-support-for-the-NXP-SIUL2-module/20241101-160940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241101080614.1070819-5-andrei.stefanescu%40oss.nxp.com
patch subject: [PATCH v5 4/7] pinctrl: s32: convert the driver into an mfd cell
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241102/202411020514.qOUrieWa-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020514.qOUrieWa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020514.qOUrieWa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/nxp/pinctrl-s32cc.c:103: warning: Function parameter or struct member 'gpio_configs_lock' not described in 's32_pinctrl'
>> drivers/pinctrl/nxp/pinctrl-s32cc.c:103: warning: Excess struct member 'gpiop_configs_lock' description in 's32_pinctrl'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +103 drivers/pinctrl/nxp/pinctrl-s32cc.c

fd84aaa8173d3f Chester Lin       2023-02-20   82  
157a51f7e5e81e Andrei Stefanescu 2024-11-01   83  /**
157a51f7e5e81e Andrei Stefanescu 2024-11-01   84   * struct s32_pinctrl - private driver data
fd84aaa8173d3f Chester Lin       2023-02-20   85   * @dev: a pointer back to containing device
fd84aaa8173d3f Chester Lin       2023-02-20   86   * @pctl: a pointer to the pinctrl device structure
fd84aaa8173d3f Chester Lin       2023-02-20   87   * @regions: reserved memory regions with start/end pin
fd84aaa8173d3f Chester Lin       2023-02-20   88   * @info: structure containing information about the pin
fd84aaa8173d3f Chester Lin       2023-02-20   89   * @gpio_configs: Saved configurations for GPIO pins
fd84aaa8173d3f Chester Lin       2023-02-20   90   * @gpiop_configs_lock: lock for the `gpio_configs` list
157a51f7e5e81e Andrei Stefanescu 2024-11-01   91   * @saved_context: Configuration saved over system sleep
fd84aaa8173d3f Chester Lin       2023-02-20   92   */
fd84aaa8173d3f Chester Lin       2023-02-20   93  struct s32_pinctrl {
fd84aaa8173d3f Chester Lin       2023-02-20   94  	struct device *dev;
fd84aaa8173d3f Chester Lin       2023-02-20   95  	struct pinctrl_dev *pctl;
fd84aaa8173d3f Chester Lin       2023-02-20   96  	struct s32_pinctrl_mem_region *regions;
fd84aaa8173d3f Chester Lin       2023-02-20   97  	struct s32_pinctrl_soc_info *info;
fd84aaa8173d3f Chester Lin       2023-02-20   98  	struct list_head gpio_configs;
fd84aaa8173d3f Chester Lin       2023-02-20   99  	spinlock_t gpio_configs_lock;
fd84aaa8173d3f Chester Lin       2023-02-20  100  #ifdef CONFIG_PM_SLEEP
fd84aaa8173d3f Chester Lin       2023-02-20  101  	struct s32_pinctrl_context saved_context;
fd84aaa8173d3f Chester Lin       2023-02-20  102  #endif
fd84aaa8173d3f Chester Lin       2023-02-20 @103  };
fd84aaa8173d3f Chester Lin       2023-02-20  104  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

