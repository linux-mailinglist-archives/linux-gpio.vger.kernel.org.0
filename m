Return-Path: <linux-gpio+bounces-12399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8E09B83C1
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 20:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DE4BB21F7D
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 19:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183551CCB36;
	Thu, 31 Oct 2024 19:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWtif+PV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2271CC17C;
	Thu, 31 Oct 2024 19:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730404490; cv=none; b=FNkaM5zMykpB+GC9X04+TVNVYO1P0TMW5No4oXE1foc5enT3t7aBGuz6o34nA74MRq76EPgtVd8Kl8V6UTjrXP3i/YYfSnf8yZ/7T7pKNE2zQIBf1tH+KgalVMDwSf4YAa7dMMhjfo+RDpEZZildKpxa4WZGZsCdIVgj/XBqqcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730404490; c=relaxed/simple;
	bh=KnSzt9xuE3qtUYHDtDz9U4wDHY4P9xuTpGWQTrIpGfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IzLKEsXK5XUrok1LMZA7ghWr+zISe004t2BCtIuuGl080wIIS+PYf2bSLebaDuOeUGGk6drXfxjt15MM003IxF4niRCtSrQqXRYf0uW6z1h3GVeDxzFE+Sy2XAm4JfTKB0BPuVrgcYRcFnPQO8+wHBxNV6o9ZzgNRVfM1AWFW5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWtif+PV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730404487; x=1761940487;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KnSzt9xuE3qtUYHDtDz9U4wDHY4P9xuTpGWQTrIpGfs=;
  b=UWtif+PV86/1XpCdPKH30t5uHYzoyZ+p6UZsAJ76kdmiXV3FaXAM2uq4
   ewX97QZz0467QiKJ52VfU31OXYGAhM6jHOX8oWdBKlTs84NgWyZoY1RWM
   xpcTB2/FgAPUIRIwI0DlHHYf9EJDZoIn3RtG9NLRHbsYuENocFufef4HX
   jO2G0INpOwuexXj45+H41n4PF63rQcgUUBoMv8iBakZgm2vUUjTcu6B1G
   ybA4qvMBIhGYStctc24atWeL3FubXmrDcrTO78qHfI01NrzuBDyZo/hsu
   5lID8GbGTjgKe1oHwzgMCTa6Fwg50lM0geGBqUvO9ou0qUfC7bbgFdA6o
   A==;
X-CSE-ConnectionGUID: t5WrZ75/RQC2qpJMm00C7g==
X-CSE-MsgGUID: hawRFDoEQgu9yhcZIFgUiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="40789083"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="40789083"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 12:54:46 -0700
X-CSE-ConnectionGUID: 5wuo6YCEQm2xFzjNKJ44VQ==
X-CSE-MsgGUID: auzeOhfdTpGdj+vo0lxPfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87864516"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Oct 2024 12:54:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6bFh-000gey-1t;
	Thu, 31 Oct 2024 19:54:41 +0000
Date: Fri, 1 Nov 2024 03:54:07 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Subject: Re: [rft, PATCH v2 1/1] gpio: Drop unused inclusions from of_gpio.h
Message-ID: <202411010328.dd4VPGlr-lkp@intel.com>
References: <20241031105314.2463446-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031105314.2463446-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v6.12-rc5 next-20241031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/gpio-Drop-unused-inclusions-from-of_gpio-h/20241031-185405
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20241031105314.2463446-1-andriy.shevchenko%40linux.intel.com
patch subject: [rft, PATCH v2 1/1] gpio: Drop unused inclusions from of_gpio.h
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241101/202411010328.dd4VPGlr-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010328.dd4VPGlr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010328.dd4VPGlr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/regulator/s5m8767.c: In function 's5m8767_set_high':
   drivers/regulator/s5m8767.c:275:9: error: implicit declaration of function 'gpio_set_value'; did you mean 'gpiod_set_value'? [-Wimplicit-function-declaration]
     275 |         gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
         |         ^~~~~~~~~~~~~~
         |         gpiod_set_value
   drivers/regulator/s5m8767.c: In function 's5m8767_pmic_dt_parse_dvs_gpio':
   drivers/regulator/s5m8767.c:494:22: error: implicit declaration of function 'gpio_is_valid'; did you mean 'uuid_is_valid'? [-Wimplicit-function-declaration]
     494 |                 if (!gpio_is_valid(gpio)) {
         |                      ^~~~~~~~~~~~~
         |                      uuid_is_valid
   drivers/regulator/s5m8767.c: In function 's5m8767_pmic_dt_parse_pdata':
   drivers/regulator/s5m8767.c:536:16: error: cleanup argument not a function
     536 |         struct device_node *regulators_np __free(device_node) = of_get_child_by_name(pmic_np,
         |                ^~~~~~~~~~~
   drivers/regulator/s5m8767.c:536:65: error: implicit declaration of function 'of_get_child_by_name' [-Wimplicit-function-declaration]
     536 |         struct device_node *regulators_np __free(device_node) = of_get_child_by_name(pmic_np,
         |                                                                 ^~~~~~~~~~~~~~~~~~~~
>> drivers/regulator/s5m8767.c:536:65: error: initialization of 'struct device_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/regulator/s5m8767.c:544:33: error: implicit declaration of function 'of_get_child_count' [-Wimplicit-function-declaration]
     544 |         pdata->num_regulators = of_get_child_count(regulators_np);
         |                                 ^~~~~~~~~~~~~~~~~~
   drivers/regulator/s5m8767.c:560:9: error: implicit declaration of function 'for_each_child_of_node'; did you mean 'for_each_online_node'? [-Wimplicit-function-declaration]
     560 |         for_each_child_of_node(regulators_np, reg_np) {
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         for_each_online_node
   drivers/regulator/s5m8767.c:560:54: error: expected ';' before '{' token
     560 |         for_each_child_of_node(regulators_np, reg_np) {
         |                                                      ^~
         |                                                      ;
   drivers/regulator/s5m8767.c:659:36: error: implicit declaration of function 'of_property_read_bool' [-Wimplicit-function-declaration]
     659 |         pdata->buck2_ramp_enable = of_property_read_bool(pmic_np, "s5m8767,pmic-buck2-ramp-enable");
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/s5m8767.c:665:21: error: implicit declaration of function 'of_property_read_u32' [-Wimplicit-function-declaration]
     665 |                 if (of_property_read_u32(pmic_np, "s5m8767,pmic-buck-ramp-delay",
         |                     ^~~~~~~~~~~~~~~~~~~~
   drivers/regulator/s5m8767.c:528:25: warning: unused variable 'dvs_voltage_nr' [-Wunused-variable]
     528 |         unsigned int i, dvs_voltage_nr = 8, ret;
         |                         ^~~~~~~~~~~~~~
   drivers/regulator/s5m8767.c:528:22: warning: unused variable 'i' [-Wunused-variable]
     528 |         unsigned int i, dvs_voltage_nr = 8, ret;
         |                      ^
   drivers/regulator/s5m8767.c: In function 's5m8767_pmic_probe':
   drivers/regulator/s5m8767.c:798:23: error: implicit declaration of function 'devm_gpio_request'; did you mean 'devm_gpiod_put'? [-Wimplicit-function-declaration]
     798 |                 ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[0],
         |                       ^~~~~~~~~~~~~~~~~
         |                       devm_gpiod_put
   drivers/regulator/s5m8767.c:814:17: error: implicit declaration of function 'gpio_direction_output'; did you mean 'gpiod_direction_output'? [-Wimplicit-function-declaration]
     814 |                 gpio_direction_output(pdata->buck_gpios[0],
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 gpiod_direction_output
   drivers/regulator/s5m8767.c: At top level:
   drivers/regulator/s5m8767.c:988:40: error: array type has incomplete element type 'struct platform_device_id'
     988 | static const struct platform_device_id s5m8767_pmic_id[] = {
         |                                        ^~~~~~~~~~~~~~~
   drivers/regulator/s5m8767.c:503:12: warning: 's5m8767_pmic_dt_parse_ds_gpio' defined but not used [-Wunused-function]
     503 | static int s5m8767_pmic_dt_parse_ds_gpio(struct sec_pmic_dev *iodev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/s5m8767.c:485:12: warning: 's5m8767_pmic_dt_parse_dvs_gpio' defined but not used [-Wunused-function]
     485 | static int s5m8767_pmic_dt_parse_dvs_gpio(struct sec_pmic_dev *iodev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/nfc/nfcmrvl/uart.c: In function 'nfcmrvl_uart_parse_dt':
   drivers/nfc/nfcmrvl/uart.c:65:24: error: implicit declaration of function 'of_get_compatible_child' [-Wimplicit-function-declaration]
      65 |         matched_node = of_get_compatible_child(node, "marvell,nfc-uart");
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/nfc/nfcmrvl/uart.c:65:22: error: assignment to 'struct device_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      65 |         matched_node = of_get_compatible_child(node, "marvell,nfc-uart");
         |                      ^
   drivers/nfc/nfcmrvl/uart.c:67:30: error: assignment to 'struct device_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      67 |                 matched_node = of_get_compatible_child(node, "mrvl,nfc-uart");
         |                              ^
   drivers/nfc/nfcmrvl/uart.c:75:17: error: implicit declaration of function 'of_node_put' [-Wimplicit-function-declaration]
      75 |                 of_node_put(matched_node);
         |                 ^~~~~~~~~~~
   drivers/nfc/nfcmrvl/uart.c:79:31: error: implicit declaration of function 'of_property_read_bool' [-Wimplicit-function-declaration]
      79 |         pdata->flow_control = of_property_read_bool(matched_node, "flow-control");
         |                               ^~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +536 drivers/regulator/s5m8767.c

26aec009f6b61c Amit Daniel Kachhap      2013-02-03  520  
cbb0ed495ca165 Axel Lin                 2013-02-13  521  static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  522  					struct sec_platform_data *pdata)
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  523  {
cbb0ed495ca165 Axel Lin                 2013-02-13  524  	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
34a3f95941e0df Krzysztof Kozlowski      2024-08-14  525  	struct device_node *pmic_np, *reg_np;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  526  	struct sec_regulator_data *rdata;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  527  	struct sec_opmode_data *rmode;
04f9f068a619cc Chanwoo Choi             2013-10-10  528  	unsigned int i, dvs_voltage_nr = 8, ret;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  529  
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  530  	pmic_np = iodev->dev->of_node;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  531  	if (!pmic_np) {
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  532  		dev_err(iodev->dev, "could not find pmic sub-node\n");
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  533  		return -ENODEV;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  534  	}
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  535  
34a3f95941e0df Krzysztof Kozlowski      2024-08-14 @536  	struct device_node *regulators_np __free(device_node) = of_get_child_by_name(pmic_np,
34a3f95941e0df Krzysztof Kozlowski      2024-08-14  537  										     "regulators");
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  538  	if (!regulators_np) {
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  539  		dev_err(iodev->dev, "could not find regulators sub-node\n");
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  540  		return -EINVAL;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  541  	}
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  542  
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  543  	/* count the number of regulators to be supported in pmic */
1f91b6f6c747d3 Axel Lin                 2013-02-06  544  	pdata->num_regulators = of_get_child_count(regulators_np);
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  545  
a86854d0c599b3 Kees Cook                2018-06-12  546  	rdata = devm_kcalloc(&pdev->dev,
a86854d0c599b3 Kees Cook                2018-06-12  547  			     pdata->num_regulators, sizeof(*rdata),
a86854d0c599b3 Kees Cook                2018-06-12  548  			     GFP_KERNEL);
34a3f95941e0df Krzysztof Kozlowski      2024-08-14  549  	if (!rdata)
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  550  		return -ENOMEM;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  551  
a86854d0c599b3 Kees Cook                2018-06-12  552  	rmode = devm_kcalloc(&pdev->dev,
a86854d0c599b3 Kees Cook                2018-06-12  553  			     pdata->num_regulators, sizeof(*rmode),
a86854d0c599b3 Kees Cook                2018-06-12  554  			     GFP_KERNEL);
34a3f95941e0df Krzysztof Kozlowski      2024-08-14  555  	if (!rmode)
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  556  		return -ENOMEM;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  557  
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  558  	pdata->regulators = rdata;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  559  	pdata->opmode = rmode;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  560  	for_each_child_of_node(regulators_np, reg_np) {
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  561  		for (i = 0; i < ARRAY_SIZE(regulators); i++)
c32569e358adea Rob Herring              2018-12-05  562  			if (of_node_name_eq(reg_np, regulators[i].name))
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  563  				break;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  564  
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  565  		if (i == ARRAY_SIZE(regulators)) {
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  566  			dev_warn(iodev->dev,
0c9721a5d1dea7 Rob Herring              2018-08-27  567  			"don't know how to configure regulator %pOFn\n",
0c9721a5d1dea7 Rob Herring              2018-08-27  568  			reg_np);
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  569  			continue;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  570  		}
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  571  
5be0e549e18f8a Dmitry Torokhov          2019-10-04  572  		rdata->ext_control_gpiod = devm_fwnode_gpiod_get(
63239e4bf7eff3 Linus Walleij            2018-10-15  573  			&pdev->dev,
5be0e549e18f8a Dmitry Torokhov          2019-10-04  574  			of_fwnode_handle(reg_np),
5be0e549e18f8a Dmitry Torokhov          2019-10-04  575  			"s5m8767,pmic-ext-control",
63239e4bf7eff3 Linus Walleij            2018-10-15  576  			GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
9ae5cc75ceaacf Linus Walleij            2018-05-14  577  			"s5m8767");
dea6dd2ba63f8c Pan Bian                 2021-01-20  578  		if (PTR_ERR(rdata->ext_control_gpiod) == -ENOENT) {
025bf37725f192 Waibel Georg             2019-06-20  579  			rdata->ext_control_gpiod = NULL;
dea6dd2ba63f8c Pan Bian                 2021-01-20  580  		} else if (IS_ERR(rdata->ext_control_gpiod)) {
dea6dd2ba63f8c Pan Bian                 2021-01-20  581  			of_node_put(reg_np);
9ae5cc75ceaacf Linus Walleij            2018-05-14  582  			return PTR_ERR(rdata->ext_control_gpiod);
dea6dd2ba63f8c Pan Bian                 2021-01-20  583  		}
ee1e0994ab1bd3 Krzysztof Kozlowski      2014-01-24  584  
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  585  		rdata->id = i;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  586  		rdata->initdata = of_get_regulator_init_data(
072e78b12bf518 Javier Martinez Canillas 2014-11-10  587  						&pdev->dev, reg_np,
072e78b12bf518 Javier Martinez Canillas 2014-11-10  588  						&regulators[i]);
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  589  		rdata->reg_node = reg_np;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  590  		rdata++;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  591  		rmode->id = i;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  592  		if (of_property_read_u32(reg_np, "op_mode",
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  593  				&rmode->mode)) {
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  594  			dev_warn(iodev->dev,
f3c7f7b636ef50 Christophe JAILLET       2019-12-03  595  				"no op_mode property at %pOF\n",
7799167b7a14fe Rob Herring              2017-07-18  596  				reg_np);
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  597  
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  598  			rmode->mode = S5M8767_OPMODE_NORMAL_MODE;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  599  		}
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  600  		rmode++;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  601  	}
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  602  
5bd73a162bc881 Rob Herring              2023-03-10  603  	if (of_property_read_bool(pmic_np, "s5m8767,pmic-buck2-uses-gpio-dvs")) {
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  604  		pdata->buck2_gpiodvs = true;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  605  
04f9f068a619cc Chanwoo Choi             2013-10-10  606  		if (of_property_read_u32_array(pmic_np,
04f9f068a619cc Chanwoo Choi             2013-10-10  607  				"s5m8767,pmic-buck2-dvs-voltage",
04f9f068a619cc Chanwoo Choi             2013-10-10  608  				pdata->buck2_voltage, dvs_voltage_nr)) {
04f9f068a619cc Chanwoo Choi             2013-10-10  609  			dev_err(iodev->dev, "buck2 voltages not specified\n");
04f9f068a619cc Chanwoo Choi             2013-10-10  610  			return -EINVAL;
04f9f068a619cc Chanwoo Choi             2013-10-10  611  		}
04f9f068a619cc Chanwoo Choi             2013-10-10  612  	}
04f9f068a619cc Chanwoo Choi             2013-10-10  613  
5bd73a162bc881 Rob Herring              2023-03-10  614  	if (of_property_read_bool(pmic_np, "s5m8767,pmic-buck3-uses-gpio-dvs")) {
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  615  		pdata->buck3_gpiodvs = true;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  616  
04f9f068a619cc Chanwoo Choi             2013-10-10  617  		if (of_property_read_u32_array(pmic_np,
04f9f068a619cc Chanwoo Choi             2013-10-10  618  				"s5m8767,pmic-buck3-dvs-voltage",
04f9f068a619cc Chanwoo Choi             2013-10-10  619  				pdata->buck3_voltage, dvs_voltage_nr)) {
04f9f068a619cc Chanwoo Choi             2013-10-10  620  			dev_err(iodev->dev, "buck3 voltages not specified\n");
04f9f068a619cc Chanwoo Choi             2013-10-10  621  			return -EINVAL;
04f9f068a619cc Chanwoo Choi             2013-10-10  622  		}
04f9f068a619cc Chanwoo Choi             2013-10-10  623  	}
04f9f068a619cc Chanwoo Choi             2013-10-10  624  
5bd73a162bc881 Rob Herring              2023-03-10  625  	if (of_property_read_bool(pmic_np, "s5m8767,pmic-buck4-uses-gpio-dvs")) {
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  626  		pdata->buck4_gpiodvs = true;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  627  
04f9f068a619cc Chanwoo Choi             2013-10-10  628  		if (of_property_read_u32_array(pmic_np,
04f9f068a619cc Chanwoo Choi             2013-10-10  629  				"s5m8767,pmic-buck4-dvs-voltage",
04f9f068a619cc Chanwoo Choi             2013-10-10  630  				pdata->buck4_voltage, dvs_voltage_nr)) {
04f9f068a619cc Chanwoo Choi             2013-10-10  631  			dev_err(iodev->dev, "buck4 voltages not specified\n");
04f9f068a619cc Chanwoo Choi             2013-10-10  632  			return -EINVAL;
04f9f068a619cc Chanwoo Choi             2013-10-10  633  		}
04f9f068a619cc Chanwoo Choi             2013-10-10  634  	}
04f9f068a619cc Chanwoo Choi             2013-10-10  635  
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  636  	if (pdata->buck2_gpiodvs || pdata->buck3_gpiodvs ||
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  637  						pdata->buck4_gpiodvs) {
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  638  		ret = s5m8767_pmic_dt_parse_dvs_gpio(iodev, pdata, pmic_np);
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  639  		if (ret)
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  640  			return -EINVAL;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  641  
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  642  		if (of_property_read_u32(pmic_np,
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  643  				"s5m8767,pmic-buck-default-dvs-idx",
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  644  				&pdata->buck_default_idx)) {
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  645  			pdata->buck_default_idx = 0;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  646  		} else {
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  647  			if (pdata->buck_default_idx >= 8) {
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  648  				pdata->buck_default_idx = 0;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  649  				dev_info(iodev->dev,
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  650  				"invalid value for default dvs index, use 0\n");
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  651  			}
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  652  		}
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  653  	}
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  654  
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  655  	ret = s5m8767_pmic_dt_parse_ds_gpio(iodev, pdata, pmic_np);
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  656  	if (ret)
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  657  		return -EINVAL;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  658  
5bd73a162bc881 Rob Herring              2023-03-10  659  	pdata->buck2_ramp_enable = of_property_read_bool(pmic_np, "s5m8767,pmic-buck2-ramp-enable");
5bd73a162bc881 Rob Herring              2023-03-10  660  	pdata->buck3_ramp_enable = of_property_read_bool(pmic_np, "s5m8767,pmic-buck3-ramp-enable");
5bd73a162bc881 Rob Herring              2023-03-10  661  	pdata->buck4_ramp_enable = of_property_read_bool(pmic_np, "s5m8767,pmic-buck4-ramp-enable");
033054e8603036 Chanwoo Choi             2013-10-10  662  
033054e8603036 Chanwoo Choi             2013-10-10  663  	if (pdata->buck2_ramp_enable || pdata->buck3_ramp_enable
033054e8603036 Chanwoo Choi             2013-10-10  664  			|| pdata->buck4_ramp_enable) {
033054e8603036 Chanwoo Choi             2013-10-10  665  		if (of_property_read_u32(pmic_np, "s5m8767,pmic-buck-ramp-delay",
033054e8603036 Chanwoo Choi             2013-10-10  666  				&pdata->buck_ramp_delay))
033054e8603036 Chanwoo Choi             2013-10-10  667  			pdata->buck_ramp_delay = 0;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  668  	}
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  669  
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  670  	return 0;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  671  }
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  672  #else
cbb0ed495ca165 Axel Lin                 2013-02-13  673  static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  674  					struct sec_platform_data *pdata)
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  675  {
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  676  	return 0;
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  677  }
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  678  #endif /* CONFIG_OF */
26aec009f6b61c Amit Daniel Kachhap      2013-02-03  679  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

