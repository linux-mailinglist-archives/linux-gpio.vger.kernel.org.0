Return-Path: <linux-gpio+bounces-1073-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B32807CFC
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 01:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C787282573
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 00:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69995376;
	Thu,  7 Dec 2023 00:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZQgv/W9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D0F1A5;
	Wed,  6 Dec 2023 16:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701908235; x=1733444235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fB13dmwJjMECWyaEkSjqxu5l+yl9pd/z0TjHdRhOt2A=;
  b=WZQgv/W9lMqOTwtjhOks0aP5b/hiIRUmd67OTKJBoFWcZvimATlCXl1d
   d7AcwA34AXh5T/4zUyLF59GKI9wfX7euTcmoOzTpDtFj8A/KpsEFM7Fm7
   7djSnfXbo1DigfS6srZlDRJt6NQ97q59oQYoIyPm/v/DCQf60eoOAoFBT
   oxBYDiGKXFlsTCxUo1nuHWhG+t1kEblmDj6V23sQq+soe5FBPEn4T3yvF
   x9N+MdFkihsR6tnw05nHfZOc4x4dZK7nEN6PcsY8AM7Jha6Gn+2DCNWhk
   er1KdMvHlRs6sX5KVVb1hjoR/TadNceihtuOu5ENGXVR455v3I2YS22tc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="393021653"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="393021653"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 16:17:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="944827102"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="944827102"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 06 Dec 2023 16:17:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB24j-000Bcc-14;
	Thu, 07 Dec 2023 00:17:09 +0000
Date: Thu, 7 Dec 2023 08:16:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Liu <jim.t90615@gmail.com>, JJLIU0@nuvoton.com,
	krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org,
	andy@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org,
	KWLIU@nuvoton.com
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v8 3/3] gpio: nuvoton: Add Nuvoton NPCM sgpio driver
Message-ID: <202312070733.GNrG7abU-lkp@intel.com>
References: <20231206014530.1600151-4-jim.t90615@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206014530.1600151-4-jim.t90615@gmail.com>

Hi Jim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on robh/for-next linus/master v6.7-rc4 next-20231206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jim-Liu/dt-bindings-gpio-add-NPCM-sgpio-driver-bindings/20231206-095724
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20231206014530.1600151-4-jim.t90615%40gmail.com
patch subject: [PATCH v8 3/3] gpio: nuvoton: Add Nuvoton NPCM sgpio driver
config: nios2-randconfig-r131-20231207 (https://download.01.org/0day-ci/archive/20231207/202312070733.GNrG7abU-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070733.GNrG7abU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070733.GNrG7abU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-npcm-sgpio.c:150:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct device const *dev @@     got int @@
   drivers/gpio/gpio-npcm-sgpio.c:150:17: sparse:     expected struct device const *dev
   drivers/gpio/gpio-npcm-sgpio.c:150:17: sparse:     got int
>> drivers/gpio/gpio-npcm-sgpio.c:150:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct device const *dev @@     got int @@
   drivers/gpio/gpio-npcm-sgpio.c:150:17: sparse:     expected struct device const *dev
   drivers/gpio/gpio-npcm-sgpio.c:150:17: sparse:     got int
>> drivers/gpio/gpio-npcm-sgpio.c:152:16: sparse: sparse: Using plain integer as NULL pointer
>> drivers/gpio/gpio-npcm-sgpio.c:534:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected unsigned int *sft_clk @@     got unsigned int const * @@
   drivers/gpio/gpio-npcm-sgpio.c:534:20: sparse:     expected unsigned int *sft_clk
   drivers/gpio/gpio-npcm-sgpio.c:534:20: sparse:     got unsigned int const *
>> drivers/gpio/gpio-npcm-sgpio.c:535:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected unsigned int *clk_sel @@     got unsigned int const * @@
   drivers/gpio/gpio-npcm-sgpio.c:535:20: sparse:     expected unsigned int *clk_sel
   drivers/gpio/gpio-npcm-sgpio.c:535:20: sparse:     got unsigned int const *
   drivers/gpio/gpio-npcm-sgpio.c:540:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected unsigned int *sft_clk @@     got unsigned int const * @@
   drivers/gpio/gpio-npcm-sgpio.c:540:20: sparse:     expected unsigned int *sft_clk
   drivers/gpio/gpio-npcm-sgpio.c:540:20: sparse:     got unsigned int const *
   drivers/gpio/gpio-npcm-sgpio.c:541:20: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected unsigned int *clk_sel @@     got unsigned int const * @@
   drivers/gpio/gpio-npcm-sgpio.c:541:20: sparse:     expected unsigned int *clk_sel
   drivers/gpio/gpio-npcm-sgpio.c:541:20: sparse:     got unsigned int const *

vim +150 drivers/gpio/gpio-npcm-sgpio.c

   134	
   135	static void __iomem *bank_reg(struct npcm_sgpio *gpio,
   136				      const struct npcm_sgpio_bank *bank,
   137				      const enum npcm_sgpio_reg reg)
   138	{
   139		switch (reg) {
   140		case READ_DATA:
   141			return gpio->base + bank->rdata_reg;
   142		case WRITE_DATA:
   143			return gpio->base + bank->wdata_reg;
   144		case EVENT_CFG:
   145			return gpio->base + bank->event_config;
   146		case EVENT_STS:
   147			return gpio->base + bank->event_status;
   148		default:
   149			/* actually if code runs to here, it's an error case */
 > 150			dev_WARN(true, "Getting here is an error condition");
   151		}
 > 152		return 0;
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

