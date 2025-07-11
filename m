Return-Path: <linux-gpio+bounces-23153-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABA1B01A02
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 12:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42A183ADCDE
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 10:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D0F288C06;
	Fri, 11 Jul 2025 10:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQUdT5o2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C452877CB;
	Fri, 11 Jul 2025 10:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752231208; cv=none; b=rCL/X1icK3Q41t0XiXeFB4A67mmzMI/A+h6OXXfpsjrh1MK3g+w8cALuw+e1/H4gkLYknhctJ6eG3ukXS/Lw2pgn7EKYuNJj/SC7dHxVCp/vP6FXTBrpq64/HV6dbH8x1TVQZsFZW4nkeIOJAvMgM12xH/r6Gr8ffr9QO5dwfOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752231208; c=relaxed/simple;
	bh=NKjZXYzGtEShTrNsUOMFTyUQto5qPC0hnUCpk+UVNUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuy1jLiC4nxwlJYZ3HiXPwo+rzzEPyaGRs4GNJf06yklgRRGulZ9Xl+VanzpX3ubP7Du5sKC0mBL3UTS7QK0+G7HJG84LyksHiDl7vY0d7SttVhraZx91CEJjhCAcZNIX9fT/TSzzqG/3MfdSkH+Uufne5HXHtn82Juxh7V7czc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQUdT5o2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752231207; x=1783767207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NKjZXYzGtEShTrNsUOMFTyUQto5qPC0hnUCpk+UVNUM=;
  b=iQUdT5o2Ukri/F7Xrbot3Nbzi3lvI4gRbPWi1rej/gzwcNMmLwTfQzsd
   pcSG7crgkUhIusRSw+b62fTWSr+GNKeEl1kEl8B1GULqVQE3kwWKlxghh
   492PVo4Ju0GAQXFomNUkG3E8xj2+gOwqiQ+pSwDHQz7HaVE9O06YadNy0
   CLhWrIlmo7zNefleZyIriPB59CMB5We/fRPudhMMd2m3scVAWaXqDx9p7
   zxHLhbH9pQ79MUpy6t1rZxm6ZrjqZV8Jujt3Y+WioOPKDDRn6vGh8+IGf
   NKj+eYnbEul/KxSfNezcIiGtTRvgXKgOLRh2+4EzaJgrjgzWL71bsjoY4
   A==;
X-CSE-ConnectionGUID: uH7Bh7i5QD27arbYvaXhVQ==
X-CSE-MsgGUID: MOqXYoGeTXmUJodIReTYRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65878121"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="65878121"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 03:53:26 -0700
X-CSE-ConnectionGUID: uDkLSuGCQA2GbayCqIqCZg==
X-CSE-MsgGUID: hiHa3BqjQUOBkOIVrGFYfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="180040729"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jul 2025 03:53:19 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaBNU-0006HL-32;
	Fri, 11 Jul 2025 10:53:16 +0000
Date: Fri, 11 Jul 2025 18:52:33 +0800
From: kernel test robot <lkp@intel.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, chester62515@gmail.com,
	mbrugger@suse.com, Ghennadi.Procopciuc@nxp.com,
	larisa.grigore@nxp.com, lee@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
	ping.bai@nxp.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	srini@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, s32@nxp.com,
	clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com,
	echanude@redhat.com, kernel@pengutronix.de, imx@lists.linux.dev,
	vincent.guittot@linaro.org
Subject: Re: [PATCH v7 07/12] pinctrl: s32g2: change the driver to also be
 probed as an MFD cell
Message-ID: <202507111841.QdQ2DVpT-lkp@intel.com>
References: <20250710142038.1986052-8-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710142038.1986052-8-andrei.stefanescu@oss.nxp.com>

Hi Andrei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes linus/master v6.16-rc5]
[cannot apply to shawnguo/for-next next-20250710]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Stefanescu/dt-bindings-mfd-add-support-for-the-NXP-SIUL2-module/20250710-222538
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250710142038.1986052-8-andrei.stefanescu%40oss.nxp.com
patch subject: [PATCH v7 07/12] pinctrl: s32g2: change the driver to also be probed as an MFD cell
config: arm64-randconfig-003-20250711 (https://download.01.org/0day-ci/archive/20250711/202507111841.QdQ2DVpT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507111841.QdQ2DVpT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507111841.QdQ2DVpT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:32,
                    from include/linux/bitops.h:6,
                    from drivers/pinctrl/nxp/pinctrl-s32cc.c:10:
   drivers/pinctrl/nxp/pinctrl-s32cc.c: In function 'to_s32_pinctrl':
   include/linux/container_of.h:20:54: error: 'struct s32_pinctrl' has no member named 'gc'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/pinctrl/nxp/pinctrl-s32cc.c:706:16: note: in expansion of macro 'container_of'
     706 |         return container_of(chip, struct s32_pinctrl, gc);
         |                ^~~~~~~~~~~~
   include/linux/compiler_types.h:503:27: error: expression in static assertion is not an integer
     503 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/pinctrl/nxp/pinctrl-s32cc.c:706:16: note: in expansion of macro 'container_of'
     706 |         return container_of(chip, struct s32_pinctrl, gc);
         |                ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from arch/arm64/include/asm/rwonce.h:67,
                    from include/linux/compiler.h:390,
                    from include/linux/build_bug.h:5:
   include/linux/stddef.h:16:33: error: 'struct s32_pinctrl' has no member named 'gc'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   drivers/pinctrl/nxp/pinctrl-s32cc.c:706:16: note: in expansion of macro 'container_of'
     706 |         return container_of(chip, struct s32_pinctrl, gc);
         |                ^~~~~~~~~~~~
   drivers/pinctrl/nxp/pinctrl-s32cc.c: In function 'legacy_s32_pinctrl_regmap_init':
>> drivers/pinctrl/nxp/pinctrl-s32cc.c:873:44: warning: variable 'soc_data' set but not used [-Wunused-but-set-variable]
     873 |         const struct s32_pinctrl_soc_data *soc_data;
         |                                            ^~~~~~~~
   drivers/pinctrl/nxp/pinctrl-s32cc.c: In function 's32_pinctrl_mfd_regmap_init':
   drivers/pinctrl/nxp/pinctrl-s32cc.c:920:44: warning: variable 'soc_data' set but not used [-Wunused-but-set-variable]
     920 |         const struct s32_pinctrl_soc_data *soc_data;
         |                                            ^~~~~~~~
   drivers/pinctrl/nxp/pinctrl-s32cc.c: At top level:
   drivers/pinctrl/nxp/pinctrl-s32cc.c:704:28: warning: 'to_s32_pinctrl' defined but not used [-Wunused-function]
     704 | static struct s32_pinctrl *to_s32_pinctrl(struct gpio_chip *chip)
         |                            ^~~~~~~~~~~~~~


vim +/soc_data +873 drivers/pinctrl/nxp/pinctrl-s32cc.c

   868	
   869	static int legacy_s32_pinctrl_regmap_init(struct platform_device *pdev,
   870						  struct s32_pinctrl *ipctl)
   871	{
   872		struct s32_pinctrl_soc_info *info = ipctl->info;
 > 873		const struct s32_pinctrl_soc_data *soc_data;
   874		unsigned int mem_regions;
   875		struct resource *res;
   876		struct regmap *map;
   877		void __iomem *base;
   878		u32 i = 0;
   879	
   880		soc_data = info->soc_data;
   881	
   882		mem_regions = info->soc_data->mem_regions;
   883		if (mem_regions == 0 || mem_regions >= 10000)
   884			return dev_err_probe(&pdev->dev, -EINVAL,
   885					     "mem_regions is invalid: %u\n",
   886					     mem_regions);
   887	
   888		for (i = 0; i < mem_regions; i++) {
   889			base = devm_platform_get_and_ioremap_resource(pdev, i, &res);
   890			if (IS_ERR(base))
   891				return PTR_ERR(base);
   892	
   893			snprintf(ipctl->regions[i].name,
   894				 sizeof(ipctl->regions[i].name), "map%u", i);
   895	
   896			s32_regmap_config.name = ipctl->regions[i].name;
   897			s32_regmap_config.max_register = resource_size(res) -
   898							 s32_regmap_config.reg_stride;
   899	
   900			map = devm_regmap_init_mmio(&pdev->dev, base,
   901						    &s32_regmap_config);
   902			if (IS_ERR(map)) {
   903				dev_err(&pdev->dev, "Failed to init regmap[%u]\n", i);
   904				return PTR_ERR(map);
   905			}
   906	
   907			ipctl->regions[i].map = map;
   908			ipctl->regions[i].pin_range = &info->soc_data->mem_pin_ranges[i];
   909		}
   910	
   911		return 0;
   912	}
   913	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

