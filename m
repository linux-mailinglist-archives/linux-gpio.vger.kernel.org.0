Return-Path: <linux-gpio+bounces-9202-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D710A960060
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 06:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 651751F2279B
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 04:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E4E5F873;
	Tue, 27 Aug 2024 04:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FA1cd8pp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF6034CDD;
	Tue, 27 Aug 2024 04:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724733596; cv=none; b=VmPsQ8HIRo5EvUuDCyxz4gOxxexT3zlTxWTn+/2u0bQL+pq5KHyVYj7BivZwwy+6M0q+75V74VESJvc9fSHD+9QFybJK+rbEG/ghUc2WJnenqm1IKyStFXfmxD14Lw1ag4C2wVGr0iMgQ7Yhh1YCBT5hhVLTP5gRFUNipwZ05Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724733596; c=relaxed/simple;
	bh=IvHgAsD2Jsl0yIxPJmOkQqE9LY3kZsEaCrqs+DYIQno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQ2JzglDJsdsbdKu+AFUbMKkDxm11gr/O8J1AVkS7f1fV+padz1qpQQebXeNAhHb/GByeebYLFCd14upGfx04lbqPjP+pwdeTyhDKYDzMW1Ucn6LCGhm/EXz5H28kE1fQb22bkI+7IMaBAXpPXg7Dp3Y6+De7VzOvme++O0jgEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FA1cd8pp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724733593; x=1756269593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IvHgAsD2Jsl0yIxPJmOkQqE9LY3kZsEaCrqs+DYIQno=;
  b=FA1cd8pp9Hk1a9m1CMOcyudnaCmAmBc/gW+LOlgIv5ECKY2xNlbg2H0n
   kaPRaqyWb4+1rFHW7BI5ZTB9F8WdodgaY93gBGcuWrTkj/YTO/s2SpUO9
   2WIZgTlgh11RLDZeoXlBnTkAhQN+7X3BVBIUw+hLkJSCiLcCvo3+tYEZR
   lAvv/Q6I/P+AA63mkID6uKlhk4IFRItvpiFw5UN2Fm7pXLZ56UblZvQpg
   3GQZNBj01gHX6tzuf9JWcNRiTrHe2wVFLmPcnRsswM7mlfStghZ9VvBFg
   obR+pZECuTWRXPE45kCF64A43Q0N5lXG8nLDYxpVzPHoZEQmGVsDDUKTy
   w==;
X-CSE-ConnectionGUID: st3TF315TYGvQ5cCbWMOkw==
X-CSE-MsgGUID: /TF5Q//2SXC3OQQPz++szg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23315944"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="23315944"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 21:39:53 -0700
X-CSE-ConnectionGUID: cfd7qcZ3SoanNwlFt9l3RA==
X-CSE-MsgGUID: 4C2CmRAaQ0Kx0udHm7tlww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="62433427"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Aug 2024 21:39:49 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sinze-000Hw6-1V;
	Tue, 27 Aug 2024 04:39:46 +0000
Date: Tue, 27 Aug 2024 12:38:56 +0800
From: kernel test robot <lkp@intel.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: Re: [PATCH 2/3] drivers: gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
Message-ID: <202408271250.W4HQp7ZZ-lkp@intel.com>
References: <20240826084214.2368673-3-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826084214.2368673-3-andrei.stefanescu@oss.nxp.com>

Hi Andrei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on robh/for-next linus/master v6.11-rc5 next-20240826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Stefanescu/dt-bindings-gpio-add-schema-for-NXP-S32G2-S32G3-SoCs/20240826-164853
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20240826084214.2368673-3-andrei.stefanescu%40oss.nxp.com
patch subject: [PATCH 2/3] drivers: gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs support
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20240827/202408271250.W4HQp7ZZ-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408271250.W4HQp7ZZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408271250.W4HQp7ZZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/gpio/gpio-siul2-s32g2.c:13:
   drivers/gpio/gpio-siul2-s32g2.c: In function 'siul2_gpio_pads_init':
>> drivers/gpio/gpio-siul2-s32g2.c:341:33: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     341 |                                 "Failed to initialize opad2%lu regmap config\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/gpio/gpio-siul2-s32g2.c:340:25: note: in expansion of macro 'dev_err'
     340 |                         dev_err(dev,
         |                         ^~~~~~~
   drivers/gpio/gpio-siul2-s32g2.c:341:62: note: format string is defined here
     341 |                                 "Failed to initialize opad2%lu regmap config\n",
         |                                                            ~~^
         |                                                              |
         |                                                              long unsigned int
         |                                                            %u
   drivers/gpio/gpio-siul2-s32g2.c:350:33: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     350 |                                 "Failed to initialize ipad2%lu regmap config\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/gpio/gpio-siul2-s32g2.c:349:25: note: in expansion of macro 'dev_err'
     349 |                         dev_err(dev,
         |                         ^~~~~~~
   drivers/gpio/gpio-siul2-s32g2.c:350:62: note: format string is defined here
     350 |                                 "Failed to initialize ipad2%lu regmap config\n",
         |                                                            ~~^
         |                                                              |
         |                                                              long unsigned int
         |                                                            %u
   drivers/gpio/gpio-siul2-s32g2.c: In function 'siul2_gpio_probe':
   drivers/gpio/gpio-siul2-s32g2.c:498:33: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     498 |                                 "unable to get pinspec %lu from device tree\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/gpio/gpio-siul2-s32g2.c:497:25: note: in expansion of macro 'dev_err'
     497 |                         dev_err(dev,
         |                         ^~~~~~~
   drivers/gpio/gpio-siul2-s32g2.c:498:58: note: format string is defined here
     498 |                                 "unable to get pinspec %lu from device tree\n",
         |                                                        ~~^
         |                                                          |
         |                                                          long unsigned int
         |                                                        %u


vim +341 drivers/gpio/gpio-siul2-s32g2.c

   329	
   330	static int siul2_gpio_pads_init(struct platform_device *pdev,
   331					struct siul2_gpio_dev *gpio_dev)
   332	{
   333		struct device *dev = &pdev->dev;
   334		size_t i;
   335	
   336		for (i = 0; i < ARRAY_SIZE(gpio_dev->siul2); i++) {
   337			gpio_dev->siul2[i].opadmap = init_padregmap(pdev, gpio_dev, i,
   338								    false);
   339			if (IS_ERR(gpio_dev->siul2[i].opadmap)) {
   340				dev_err(dev,
 > 341					"Failed to initialize opad2%lu regmap config\n",
   342					i);
   343				return PTR_ERR(gpio_dev->siul2[i].opadmap);
   344			}
   345	
   346			gpio_dev->siul2[i].ipadmap = init_padregmap(pdev, gpio_dev, i,
   347								    true);
   348			if (IS_ERR(gpio_dev->siul2[i].ipadmap)) {
   349				dev_err(dev,
   350					"Failed to initialize ipad2%lu regmap config\n",
   351					i);
   352				return PTR_ERR(gpio_dev->siul2[i].ipadmap);
   353			}
   354		}
   355	
   356		return 0;
   357	}
   358	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

