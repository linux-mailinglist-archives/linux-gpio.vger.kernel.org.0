Return-Path: <linux-gpio+bounces-14924-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CD1A15833
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 20:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1754F3A1E79
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 19:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1991ABEA5;
	Fri, 17 Jan 2025 19:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eC5A9R7g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70D31A3AAD;
	Fri, 17 Jan 2025 19:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737142471; cv=none; b=QAWbCshijzH6K5yD6ze1eXPz7uVz6yyGxw5jHEkjoJvMNDWZUeRUgklA9Ws2DlZIv68C/tmds2qlPdi2gNMa60ejz57Hy+P6V467I3qUKc2kHvC+lRC8zQHtXm14IBOooeHZRS1Krdm3xFuOCJ/PicPcWyltr5DzrHWWMGovAGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737142471; c=relaxed/simple;
	bh=qj+7zKyUQZ3jtYnNPOfg2MZHOlQZVmMNN3lONRCAmUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tP/WxonoYgidR/gbbfh3NtPCRcEhdyJEgtYupUcAqcg1RqL+LDPKxbKs1nQ3y9R533pHw1In0NtrHp/ecwHFzt0oT2N/TKqGZysF03G/HLQGNcovG4bAsqZ/w46chWyFBxQmkl8oSC6F0hyel3qw2RqeClnck7WGQD8hkVwD4e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eC5A9R7g; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737142470; x=1768678470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qj+7zKyUQZ3jtYnNPOfg2MZHOlQZVmMNN3lONRCAmUs=;
  b=eC5A9R7gX4RSImgw1DVxiZEquBvYaTRxkJwGPgytD997gesVWRhGF8Wk
   k5M8wkRhXBloI/mA88cQ7h/BDJBCuITSZkbyqdENWy7I8y7xzG3+Ty071
   pEGGT3VQGbe6cRLDbbzpGyntQvp+oRo0atn0UwRyfCwtTTUCxHt+zorAK
   adNdRFl1mshMtos9yDd4a7pmjsecegNBVSuMjN4e2+MrEjQ8UhMJZiysC
   DcV02+TmSuh1qSMm926wiDqqRB2G/XCW/Tkwsue9gsHWyAY0S3CVefqPP
   RWgmnpjsow3y9/a79nnH89sRgLNLlq6HAeLJJkS/w2uiO2+fHWQ7LUgP2
   w==;
X-CSE-ConnectionGUID: 8ZvLAutpTgeex4BpRd6UdQ==
X-CSE-MsgGUID: k3A8rNdeRxeNmHBajxv/ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37609631"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="37609631"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 11:34:29 -0800
X-CSE-ConnectionGUID: 6R4Ap22pRtGUhgsywJ3Sgw==
X-CSE-MsgGUID: fFQtGEPERaO0kGv7U5TW8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136781080"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jan 2025 11:34:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYs6p-000TdV-2D;
	Fri, 17 Jan 2025 19:34:23 +0000
Date: Sat, 18 Jan 2025 03:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi,
	andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org,
	tony@atomide.com, linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, m-leonard@ti.com,
	praneeth@ti.com, christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v3 3/3] gpio tps65215: Add support for varying
 gpio/offset values
Message-ID: <202501180331.d5V1SdDH-lkp@intel.com>
References: <20250113225530.124213-4-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113225530.124213-4-s-ramamoorthy@ti.com>

Hi Shree,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250113]
[cannot apply to tmlind-omap/for-next v6.13-rc7 v6.13-rc6 v6.13-rc5 linus/master v6.13-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shree-Ramamoorthy/gpio-tps65215-Add-TPS65215-to-platform_device_id-table/20250114-065813
base:   next-20250113
patch link:    https://lore.kernel.org/r/20250113225530.124213-4-s-ramamoorthy%40ti.com
patch subject: [PATCH v3 3/3] gpio tps65215: Add support for varying gpio/offset values
config: i386-randconfig-004-20250117 (https://download.01.org/0day-ci/archive/20250118/202501180331.d5V1SdDH-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180331.d5V1SdDH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180331.d5V1SdDH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-tps65219.c:159:3: error: use of undeclared identifier 'TPS65215'
     159 |         [TPS65215] = {
         |          ^
>> drivers/gpio/gpio-tps65219.c:175:15: error: variable has incomplete type 'enum pmic_id'
     175 |         enum pmic_id chip = platform_get_device_id(pdev)->driver_data;
         |                      ^
   drivers/gpio/gpio-tps65219.c:175:7: note: forward declaration of 'enum pmic_id'
     175 |         enum pmic_id chip = platform_get_device_id(pdev)->driver_data;
         |              ^
   drivers/gpio/gpio-tps65219.c:193:21: error: use of undeclared identifier 'TPS65215'
     193 |         { "tps65215-gpio", TPS65215 },
         |                            ^
   drivers/gpio/gpio-tps65219.c:197:1: error: definition of variable with array type needs an explicit size or an initializer
     197 | MODULE_DEVICE_TABLE(platform, tps6521x_gpio_id_table);
         | ^
   include/linux/module.h:250:21: note: expanded from macro 'MODULE_DEVICE_TABLE'
     250 | extern typeof(name) __mod_device_table__##type##__##name                \
         |                     ^
   <scratch space>:249:1: note: expanded from here
     249 | __mod_device_table__platform__tps6521x_gpio_id_table
         | ^
   4 errors generated.


vim +175 drivers/gpio/gpio-tps65219.c

   168	
   169	static int tps65219_gpio_probe(struct platform_device *pdev)
   170	{
   171		struct tps65219_gpio *gpio;
   172		const struct tps65219_chip_data *pmic;
   173	
   174		struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
 > 175		enum pmic_id chip = platform_get_device_id(pdev)->driver_data;
   176		pmic = &chip_info_table[chip];
   177	
   178		gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
   179		if (!gpio)
   180			return -ENOMEM;
   181	
   182		gpio->tps = tps;
   183		gpio->gpio_chip = tps65219_template_chip;
   184		gpio->gpio_chip.label = dev_name(&pdev->dev);
   185		gpio->gpio_chip.ngpio =  pmic->ngpio;
   186		gpio->gpio_chip.offset = pmic->offset;
   187		gpio->gpio_chip.parent = tps->dev;
   188	
   189		return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip, gpio);
   190	}
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

