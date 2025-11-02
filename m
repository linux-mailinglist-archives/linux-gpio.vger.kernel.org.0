Return-Path: <linux-gpio+bounces-27932-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D722CC29895
	for <lists+linux-gpio@lfdr.de>; Sun, 02 Nov 2025 23:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 908D63AEA38
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Nov 2025 22:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76871E51E1;
	Sun,  2 Nov 2025 22:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaUNwA+e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C41F19F12D;
	Sun,  2 Nov 2025 22:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762122995; cv=none; b=Bm71ZFSv0Y7bHNjWsIih7axmd84NpoNxoqALnudkNfsyWAky4j6kjHp3TUzMId+6cZdg8dQf51gDwb+eCm1AagYWvJZWtAhrtAUlREuvxspudltTlbVtfj+hWIJx1/qnmFveug6ec/D1Z9QOaq0m1Qx5ClI7LfY9zDg+GRlzOeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762122995; c=relaxed/simple;
	bh=iq1XjN1uIbCOZ40g5V9sS6uD1iDH7HWDpQxEZoG8uD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNod/lo9tJiXDTaNVcMa0PuoL5bbExvMcHkYjX4hgxAhZTKJ9ZORba58W2hTJ4suzxJLfgxlaX1v2tyqySegz/ssVUVlcoWmGIx+c6vmlYN/ELepYnAL3I8Uu3qFgOZgAVA0koJvmso1F6WuZ6RDHJGuMkRTrGcvvITvTkrbsno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaUNwA+e; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762122993; x=1793658993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iq1XjN1uIbCOZ40g5V9sS6uD1iDH7HWDpQxEZoG8uD8=;
  b=LaUNwA+ew8GikvLw/oyFA9stsjtJIItDKE2Pnn26aFX4ik1nV/VUmPxq
   zFamNL3FaVY0PiA82eFlOEU8wwWUXw03RFz0jXWQHwLK/kE974k3OAvHW
   0e8ifAv8zIqnPOt0VXitt7IqWHE4Awja1LKr1nfMevXiO2llqcmAelCmd
   P958P2EEQRF74Y52GRGw/vSZrhUr4V8Zq3Z42nnduHioPKU7aGbIf6+ld
   57sGBQi2UG1m/bb6NTdT5w1G3zcxfdLbYSPYkEqtcYUjWC4l/lDmE/poB
   a/xxXSMtFESvgDze57xC1jxnLkX+sGAoarqCdYdrsPNNFni8rs1v9zuFl
   g==;
X-CSE-ConnectionGUID: eM6BkLIdSHaXe9w6wgyThw==
X-CSE-MsgGUID: QgNPIP3OTDyh3P8Z9Wh8pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="75552523"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="75552523"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 14:36:32 -0800
X-CSE-ConnectionGUID: /dCbar9yStSnUxO7aVokZw==
X-CSE-MsgGUID: Tl1sQCR2Rai6Szb1MJT+qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="191873979"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 02 Nov 2025 14:36:30 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFggW-000Pci-0n;
	Sun, 02 Nov 2025 22:36:28 +0000
Date: Mon, 3 Nov 2025 06:35:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: fxl6408: Add optional reset gpio control
Message-ID: <202511030655.OCHXbHnE-lkp@intel.com>
References: <20251102100515.9506-2-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102100515.9506-2-jszhang@kernel.org>

Hi Jisheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v6.18-rc4 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/gpio-fxl6408-Add-optional-reset-gpio-control/20251102-182544
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20251102100515.9506-2-jszhang%40kernel.org
patch subject: [PATCH 1/2] gpio: fxl6408: Add optional reset gpio control
config: arm-randconfig-001-20251103 (https://download.01.org/0day-ci/archive/20251103/202511030655.OCHXbHnE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030655.OCHXbHnE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030655.OCHXbHnE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-fxl6408.c:118:15: error: call to undeclared function 'devm_gpiod_get_optional'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     118 |         reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
         |                      ^
   drivers/gpio/gpio-fxl6408.c:118:15: note: did you mean 'devm_regulator_get_optional'?
   include/linux/regulator/consumer.h:163:32: note: 'devm_regulator_get_optional' declared here
     163 | struct regulator *__must_check devm_regulator_get_optional(struct device *dev,
         |                                ^
>> drivers/gpio/gpio-fxl6408.c:118:53: error: use of undeclared identifier 'GPIOD_OUT_LOW'
     118 |         reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
         |                                                            ^~~~~~~~~~~~~
   2 errors generated.


vim +/devm_gpiod_get_optional +118 drivers/gpio/gpio-fxl6408.c

   103	
   104	static int fxl6408_probe(struct i2c_client *client)
   105	{
   106		struct device *dev = &client->dev;
   107		struct gpio_desc *reset_gpio;
   108		int ret;
   109		struct gpio_regmap_config gpio_config = {
   110			.parent = dev,
   111			.ngpio = FXL6408_NGPIO,
   112			.reg_dat_base = GPIO_REGMAP_ADDR(FXL6408_REG_INPUT_STATUS),
   113			.reg_set_base = GPIO_REGMAP_ADDR(FXL6408_REG_OUTPUT),
   114			.reg_dir_out_base = GPIO_REGMAP_ADDR(FXL6408_REG_IO_DIR),
   115			.ngpio_per_reg = FXL6408_NGPIO,
   116		};
   117	
 > 118		reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
   119		if (IS_ERR(reset_gpio))
   120			return dev_err_probe(dev, PTR_ERR(reset_gpio), "Failed to get reset gpio\n");
   121	
   122		gpio_config.regmap = devm_regmap_init_i2c(client, &regmap);
   123		if (IS_ERR(gpio_config.regmap))
   124			return dev_err_probe(dev, PTR_ERR(gpio_config.regmap),
   125					     "failed to allocate register map\n");
   126	
   127		ret = fxl6408_identify(dev, gpio_config.regmap);
   128		if (ret)
   129			return ret;
   130	
   131		/* Disable High-Z of outputs, so that our OUTPUT updates actually take effect. */
   132		ret = regmap_write(gpio_config.regmap, FXL6408_REG_OUTPUT_HIGH_Z, 0);
   133		if (ret)
   134			return dev_err_probe(dev, ret, "failed to write 'output high Z' register\n");
   135	
   136		return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_config));
   137	}
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

