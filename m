Return-Path: <linux-gpio+bounces-28643-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BE9C68A77
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 10:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C65A64F2525
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 09:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C8A3164B7;
	Tue, 18 Nov 2025 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrCrcQwG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B9F1DA55;
	Tue, 18 Nov 2025 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763459474; cv=none; b=FizVxbxmghIW6UzkjRMxt+gZAqY1ykB3e2Uo8UZQ8uaS6auITYMr7TybTZBKOiDAxtdsooq7Eq0hmpCz0C0TqMqlAczeYA49Rya/dG2RLV3LuCT7y5gK2smKsF4Yq3f6CNUwaRtSwFp0d/xLRmuFoy4X+NfXbTO0QHOtgpilHb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763459474; c=relaxed/simple;
	bh=ZXQSFl5BaTJGl6C9oFf6wVvGMEbo/moM4dPGMWJ0jUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qj7JKD34Fo4fbPvV5lNGF7V410rEFfabiwUUZCBe5bamqBoqfiH4qxLoFCA23MILUeEz3DkdWK4f2k8t7WEGi1qboONb+5zd7JZ1xIi1/C4p5HW/DrGfwPKsdiZFWTEk73WsiSuVHG+Z8Ck0/h269TZSH+G8dun46couYn1w7Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JrCrcQwG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763459472; x=1794995472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZXQSFl5BaTJGl6C9oFf6wVvGMEbo/moM4dPGMWJ0jUc=;
  b=JrCrcQwGQl+lOPX04mHfEAxSh5JunxjaVa23pizlSigqN/eklHSleGER
   JUDvVbVHIDvpoKSwMRSJmyW/55qB+6Ukj1YLVnFUMMCWD7q4meoAGVw4H
   eIVb/7gjwTgWLb5H6o1ZKGXZWGMDgev+2nKa4xbc6E5RUpRvu34I9IiLY
   hdTkNxKHWkyHs7lyEUeg1Js/V1WpKcH2+h40eGm57yGNPuM8Q+VD7yOOO
   SZUbhgBlxcYXtAErpIMXOF5avJdxmDlmo5PEzEdxkEERGPC7IPLMn/K0J
   iTq4PHIQrK221MhK7nys+8CvOpXzII64tZEk3hNfCZR9YMvQ482f7kZ1D
   Q==;
X-CSE-ConnectionGUID: bQ8f2mDGQs+WdTNn+4rA3Q==
X-CSE-MsgGUID: +PfmwLiTTJGf6Y/KbjcLuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65415310"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65415310"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 01:51:11 -0800
X-CSE-ConnectionGUID: DFaTJ9xsTyGER71f4H5OlA==
X-CSE-MsgGUID: 0iLDqi2eQfWyutmyucYL4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190939502"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Nov 2025 01:51:09 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLIMd-0001ZH-09;
	Tue, 18 Nov 2025 09:51:07 +0000
Date: Tue, 18 Nov 2025 17:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] gpio: fxl6408: Add optional reset gpio control
Message-ID: <202511181705.QWVZhvN1-lkp@intel.com>
References: <20251117001502.12618-2-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117001502.12618-2-jszhang@kernel.org>

Hi Jisheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v6.18-rc6 next-20251118]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/gpio-fxl6408-Add-optional-reset-gpio-control/20251117-083516
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20251117001502.12618-2-jszhang%40kernel.org
patch subject: [PATCH v2 1/2] gpio: fxl6408: Add optional reset gpio control
config: riscv-randconfig-001-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181705.QWVZhvN1-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181705.QWVZhvN1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181705.QWVZhvN1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-fxl6408.c: In function 'fxl6408_probe':
>> drivers/gpio/gpio-fxl6408.c:119:15: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_regulator_get_optional'? [-Werror=implicit-function-declaration]
     119 |  reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
         |               devm_regulator_get_optional
>> drivers/gpio/gpio-fxl6408.c:119:53: error: 'GPIOD_OUT_LOW' undeclared (first use in this function)
     119 |  reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
         |                                                     ^~~~~~~~~~~~~
   drivers/gpio/gpio-fxl6408.c:119:53: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +119 drivers/gpio/gpio-fxl6408.c

   104	
   105	static int fxl6408_probe(struct i2c_client *client)
   106	{
   107		struct device *dev = &client->dev;
   108		struct gpio_desc *reset_gpio;
   109		int ret;
   110		struct gpio_regmap_config gpio_config = {
   111			.parent = dev,
   112			.ngpio = FXL6408_NGPIO,
   113			.reg_dat_base = GPIO_REGMAP_ADDR(FXL6408_REG_INPUT_STATUS),
   114			.reg_set_base = GPIO_REGMAP_ADDR(FXL6408_REG_OUTPUT),
   115			.reg_dir_out_base = GPIO_REGMAP_ADDR(FXL6408_REG_IO_DIR),
   116			.ngpio_per_reg = FXL6408_NGPIO,
   117		};
   118	
 > 119		reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
   120		if (IS_ERR(reset_gpio))
   121			return dev_err_probe(dev, PTR_ERR(reset_gpio), "Failed to get reset gpio\n");
   122	
   123		gpio_config.regmap = devm_regmap_init_i2c(client, &regmap);
   124		if (IS_ERR(gpio_config.regmap))
   125			return dev_err_probe(dev, PTR_ERR(gpio_config.regmap),
   126					     "failed to allocate register map\n");
   127	
   128		ret = fxl6408_identify(dev, gpio_config.regmap);
   129		if (ret)
   130			return ret;
   131	
   132		/* Disable High-Z of outputs, so that our OUTPUT updates actually take effect. */
   133		ret = regmap_write(gpio_config.regmap, FXL6408_REG_OUTPUT_HIGH_Z, 0);
   134		if (ret)
   135			return dev_err_probe(dev, ret, "failed to write 'output high Z' register\n");
   136	
   137		return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_config));
   138	}
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

