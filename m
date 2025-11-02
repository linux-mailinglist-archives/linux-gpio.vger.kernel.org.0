Return-Path: <linux-gpio+bounces-27931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00834C2987D
	for <lists+linux-gpio@lfdr.de>; Sun, 02 Nov 2025 23:25:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A44CE3AE2B1
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Nov 2025 22:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33741C5D57;
	Sun,  2 Nov 2025 22:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnUpJAlr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A5E3596D;
	Sun,  2 Nov 2025 22:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762122332; cv=none; b=Ydsl7IiVOgUOHMMwOI0MGSTcn2RieOcLfDRqwPAn3t/hD/dKJG4TffMuiP4VWUGnp3+zPrdX9x8r6oHmFYDURSpo89L558pYqWmzEKouFEcGnN7gvKa9Z+YgtLpW9aLwJLNP6GmmZ2+GcHHpN/GUR9YzexforGFPxvZrtoiGIX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762122332; c=relaxed/simple;
	bh=aj4ZU6dGkP8IXw+6Yaivgjk5KBZTjb34K9IlQ48u1CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqSADHRAE4khEPrV5DSBDxEzQ+IdjMZ56PNOFaRcqYRScLDtnsz1MZEbRBqDwPOJi6kSkOsiMrkBNOLRKHslr6XjVpMMV+S10A4eUynw2jHTg/yllvwNihoEvaI5Z+HUJvcERssyrQ/cpadCsAKUe4qrKt+JKF8jsgGuFBIXm+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnUpJAlr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762122330; x=1793658330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aj4ZU6dGkP8IXw+6Yaivgjk5KBZTjb34K9IlQ48u1CI=;
  b=GnUpJAlrqZLJKeCTACJjYjoTawDJdwbiednZG0/KB7s9ZuVagrXRjc54
   2sGN5KpdcoKPTX/8ROq2xZCoW4Sp2oIBb7QE7S083KM7YQJ7ZY94Pg6PI
   8JQsa9c91GH4cGZrnfG5st/Lw2RkUydtkI6ftXe+DU1dqTgWAlVYIc1yh
   HZWhKonE5pTQ05mcmx/CbqY2lsH52CIMC4KUPjpuAEhI4PKhYFrCd/SL2
   7fJXX/bww2TjlpP6uK46p588HI2pQjbI7uws9iFh9upvvnes2sWWZ6+9B
   HnseZG5YEwe7Xxg2UTS6DXAa5TGtHCdFQsj2+mxARj9UeURzjMSIuWLAP
   Q==;
X-CSE-ConnectionGUID: 3f58kgdMS/yXXNuMpvZXgw==
X-CSE-MsgGUID: NghvOyk1TbuFV5u2Y+sdow==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68040406"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68040406"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 14:25:30 -0800
X-CSE-ConnectionGUID: Br4R5owcSMCxLDLUuwg8/Q==
X-CSE-MsgGUID: obhFepZHRT2sL05n+W+J3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="187031376"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Nov 2025 14:25:29 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFgVq-000Pc8-1h;
	Sun, 02 Nov 2025 22:25:26 +0000
Date: Mon, 3 Nov 2025 06:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: fxl6408: Add optional reset gpio control
Message-ID: <202511030610.aGFTnmCc-lkp@intel.com>
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
config: nios2-randconfig-r073-20251103 (https://download.01.org/0day-ci/archive/20251103/202511030610.aGFTnmCc-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030610.aGFTnmCc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030610.aGFTnmCc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-fxl6408.c: In function 'fxl6408_probe':
>> drivers/gpio/gpio-fxl6408.c:118:15: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_regulator_get_optional'? [-Werror=implicit-function-declaration]
     reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
                  ^~~~~~~~~~~~~~~~~~~~~~~
                  devm_regulator_get_optional
>> drivers/gpio/gpio-fxl6408.c:118:53: error: 'GPIOD_OUT_LOW' undeclared (first use in this function)
     reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
                                                        ^~~~~~~~~~~~~
   drivers/gpio/gpio-fxl6408.c:118:53: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +118 drivers/gpio/gpio-fxl6408.c

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

