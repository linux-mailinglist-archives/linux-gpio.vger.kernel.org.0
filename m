Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7961675EDE
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 21:20:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbjATUUZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 15:20:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjATUUY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 15:20:24 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88816125AD
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 12:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674246023; x=1705782023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=euydwKY5ypSK70m2bYx5T8zNYxbGOnhFM1/7qhg253Q=;
  b=Rjt2wsRxW6h7/HFJLnIVghCfyqo5EZZgDftdb4o0cp8ujGtDhYgrGQVI
   p9bpwoD1cr394WhCdZjzmz7FnPZoX340ZDkFiQGsci+GShUSE2zOoh5+o
   F23awvpkRuehvZnXgolyvoFucmdWx6x9GhITCVehSWm+MOrqL9TYd+5QZ
   0i5YdQ04xrbnQQeUOBUwBitockZK39WXvnfSV7UXLJuwafMvxadXkUbup
   p+Cw5kvEDoQ1bK83qEg9hROfVjQYHTRCjdVCc3NMw96m9SYTna7DaorrI
   44qX8aUjY2PNUU2GroIrLqlX4lzePrWR4SMj4R/S8FJzzeNCDK3OT/yua
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="352940303"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="352940303"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 12:20:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="662651639"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="662651639"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jan 2023 12:20:21 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pIxs4-0002tQ-1s;
        Fri, 20 Jan 2023 20:20:20 +0000
Date:   Sat, 21 Jan 2023 04:19:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [brgl:gpio/for-next 43/49] drivers/gpio/gpio-zevio.c:174:33: error:
 incomplete definition of type 'struct platform_device'
Message-ID: <202301210447.JPSHmqrO-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   e464c96eae336dd2f81a1926c30523f061469f64
commit: 899f6a9c43644d60dcae381f8cbb1fff3fbcbe64 [43/49] gpio: zevio: Use proper headers and drop OF_GPIO dependency
config: arm-randconfig-c002-20230120 (https://download.01.org/0day-ci/archive/20230121/202301210447.JPSHmqrO-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=899f6a9c43644d60dcae381f8cbb1fff3fbcbe64
        git remote add brgl https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
        git fetch --no-tags brgl gpio/for-next
        git checkout 899f6a9c43644d60dcae381f8cbb1fff3fbcbe64
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-zevio.c:169:36: warning: declaration of 'struct platform_device' will not be visible outside of this function [-Wvisibility]
   static int zevio_gpio_probe(struct platform_device *pdev)
                                      ^
>> drivers/gpio/gpio-zevio.c:174:33: error: incomplete definition of type 'struct platform_device'
           controller = devm_kzalloc(&pdev->dev, sizeof(*controller), GFP_KERNEL);
                                      ~~~~^
   drivers/gpio/gpio-zevio.c:169:36: note: forward declaration of 'struct platform_device'
   static int zevio_gpio_probe(struct platform_device *pdev)
                                      ^
>> drivers/gpio/gpio-zevio.c:178:2: error: call to undeclared function 'platform_set_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           platform_set_drvdata(pdev, controller);
           ^
   drivers/gpio/gpio-zevio.c:182:33: error: incomplete definition of type 'struct platform_device'
           controller->chip.parent = &pdev->dev;
                                      ~~~~^
   drivers/gpio/gpio-zevio.c:169:36: note: forward declaration of 'struct platform_device'
   static int zevio_gpio_probe(struct platform_device *pdev)
                                      ^
>> drivers/gpio/gpio-zevio.c:184:21: error: call to undeclared function 'devm_platform_ioremap_resource'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           controller->regs = devm_platform_ioremap_resource(pdev, 0);
                              ^
   drivers/gpio/gpio-zevio.c:184:21: note: did you mean 'devm_ioremap_resource'?
   include/linux/device.h:236:15: note: 'devm_ioremap_resource' declared here
   void __iomem *devm_ioremap_resource(struct device *dev,
                 ^
>> drivers/gpio/gpio-zevio.c:184:19: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
           controller->regs = devm_platform_ioremap_resource(pdev, 0);
                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-zevio.c:186:29: error: incomplete definition of type 'struct platform_device'
                   return dev_err_probe(&pdev->dev, PTR_ERR(controller->regs),
                                         ~~~~^
   drivers/gpio/gpio-zevio.c:169:36: note: forward declaration of 'struct platform_device'
   static int zevio_gpio_probe(struct platform_device *pdev)
                                      ^
   drivers/gpio/gpio-zevio.c:189:39: error: incomplete definition of type 'struct platform_device'
           status = devm_gpiochip_add_data(&pdev->dev, &controller->chip, controller);
                                            ~~~~^
   include/linux/gpio/driver.h:593:35: note: expanded from macro 'devm_gpiochip_add_data'
                   devm_gpiochip_add_data_with_key(dev, gc, data, &lock_key, \
                                                   ^~~
   drivers/gpio/gpio-zevio.c:169:36: note: forward declaration of 'struct platform_device'
   static int zevio_gpio_probe(struct platform_device *pdev)
                                      ^
   drivers/gpio/gpio-zevio.c:191:16: error: incomplete definition of type 'struct platform_device'
                   dev_err(&pdev->dev, "failed to add gpiochip: %d\n", status);
                            ~~~~^
   include/linux/dev_printk.h:144:44: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                     ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^~~
   drivers/gpio/gpio-zevio.c:169:36: note: forward declaration of 'struct platform_device'
   static int zevio_gpio_probe(struct platform_device *pdev)
                                      ^
>> drivers/gpio/gpio-zevio.c:211:31: error: variable has incomplete type 'struct platform_driver'
   static struct platform_driver zevio_gpio_driver = {
                                 ^
   drivers/gpio/gpio-zevio.c:211:15: note: forward declaration of 'struct platform_driver'
   static struct platform_driver zevio_gpio_driver = {
                 ^
>> drivers/gpio/gpio-zevio.c:219:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   builtin_platform_driver(zevio_gpio_driver);
   ^
   int
>> drivers/gpio/gpio-zevio.c:219:25: error: a parameter list without types is only allowed in a function definition
   builtin_platform_driver(zevio_gpio_driver);
                           ^
   1 warning and 11 errors generated.


vim +174 drivers/gpio/gpio-zevio.c

9af4d80ba566657 Fabian Vogt                   2014-02-24  167  
9af4d80ba566657 Fabian Vogt                   2014-02-24  168  /* Initialization */
9af4d80ba566657 Fabian Vogt                   2014-02-24  169  static int zevio_gpio_probe(struct platform_device *pdev)
9af4d80ba566657 Fabian Vogt                   2014-02-24  170  {
9af4d80ba566657 Fabian Vogt                   2014-02-24  171  	struct zevio_gpio *controller;
9af4d80ba566657 Fabian Vogt                   2014-02-24  172  	int status, i;
9af4d80ba566657 Fabian Vogt                   2014-02-24  173  
9af4d80ba566657 Fabian Vogt                   2014-02-24 @174  	controller = devm_kzalloc(&pdev->dev, sizeof(*controller), GFP_KERNEL);
50908d61ea483e0 Jingoo Han                    2014-04-29  175  	if (!controller)
9af4d80ba566657 Fabian Vogt                   2014-02-24  176  		return -ENOMEM;
9af4d80ba566657 Fabian Vogt                   2014-02-24  177  
ff00be69fd95ea0 Ricardo Ribalda               2015-01-18 @178  	platform_set_drvdata(pdev, controller);
ff00be69fd95ea0 Ricardo Ribalda               2015-01-18  179  
9af4d80ba566657 Fabian Vogt                   2014-02-24  180  	/* Copy our reference */
cf8f4462e5fa6b3 Moses Christopher Bollavarapu 2022-05-12  181  	controller->chip = zevio_gpio_chip;
cf8f4462e5fa6b3 Moses Christopher Bollavarapu 2022-05-12  182  	controller->chip.parent = &pdev->dev;
9af4d80ba566657 Fabian Vogt                   2014-02-24  183  
cf8f4462e5fa6b3 Moses Christopher Bollavarapu 2022-05-12 @184  	controller->regs = devm_platform_ioremap_resource(pdev, 0);
cf8f4462e5fa6b3 Moses Christopher Bollavarapu 2022-05-12  185  	if (IS_ERR(controller->regs))
cf8f4462e5fa6b3 Moses Christopher Bollavarapu 2022-05-12  186  		return dev_err_probe(&pdev->dev, PTR_ERR(controller->regs),
cf8f4462e5fa6b3 Moses Christopher Bollavarapu 2022-05-12  187  				     "failed to ioremap memory resource\n");
cf8f4462e5fa6b3 Moses Christopher Bollavarapu 2022-05-12  188  
cf8f4462e5fa6b3 Moses Christopher Bollavarapu 2022-05-12  189  	status = devm_gpiochip_add_data(&pdev->dev, &controller->chip, controller);
9af4d80ba566657 Fabian Vogt                   2014-02-24  190  	if (status) {
9af4d80ba566657 Fabian Vogt                   2014-02-24  191  		dev_err(&pdev->dev, "failed to add gpiochip: %d\n", status);
9af4d80ba566657 Fabian Vogt                   2014-02-24  192  		return status;
9af4d80ba566657 Fabian Vogt                   2014-02-24  193  	}
9af4d80ba566657 Fabian Vogt                   2014-02-24  194  
9af4d80ba566657 Fabian Vogt                   2014-02-24  195  	spin_lock_init(&controller->lock);
9af4d80ba566657 Fabian Vogt                   2014-02-24  196  
9af4d80ba566657 Fabian Vogt                   2014-02-24  197  	/* Disable interrupts, they only cause errors */
cf8f4462e5fa6b3 Moses Christopher Bollavarapu 2022-05-12  198  	for (i = 0; i < controller->chip.ngpio; i += 8)
9af4d80ba566657 Fabian Vogt                   2014-02-24  199  		zevio_gpio_port_set(controller, i, ZEVIO_GPIO_INT_MASK, 0xFF);
9af4d80ba566657 Fabian Vogt                   2014-02-24  200  
cf8f4462e5fa6b3 Moses Christopher Bollavarapu 2022-05-12  201  	dev_dbg(controller->chip.parent, "ZEVIO GPIO controller set up!\n");
9af4d80ba566657 Fabian Vogt                   2014-02-24  202  
9af4d80ba566657 Fabian Vogt                   2014-02-24  203  	return 0;
9af4d80ba566657 Fabian Vogt                   2014-02-24  204  }
9af4d80ba566657 Fabian Vogt                   2014-02-24  205  
a49f2e748de7b16 Jingoo Han                    2014-05-07  206  static const struct of_device_id zevio_gpio_of_match[] = {
9af4d80ba566657 Fabian Vogt                   2014-02-24  207  	{ .compatible = "lsi,zevio-gpio", },
9af4d80ba566657 Fabian Vogt                   2014-02-24  208  	{ },
9af4d80ba566657 Fabian Vogt                   2014-02-24  209  };
9af4d80ba566657 Fabian Vogt                   2014-02-24  210  
9af4d80ba566657 Fabian Vogt                   2014-02-24 @211  static struct platform_driver zevio_gpio_driver = {
9af4d80ba566657 Fabian Vogt                   2014-02-24  212  	.driver		= {
9af4d80ba566657 Fabian Vogt                   2014-02-24  213  		.name	= "gpio-zevio",
9ea8d8102bbd32d Axel Lin                      2014-04-08  214  		.of_match_table = zevio_gpio_of_match,
a90295b4884f746 Paul Gortmaker                2016-05-09  215  		.suppress_bind_attrs = true,
9af4d80ba566657 Fabian Vogt                   2014-02-24  216  	},
9af4d80ba566657 Fabian Vogt                   2014-02-24  217  	.probe		= zevio_gpio_probe,
9af4d80ba566657 Fabian Vogt                   2014-02-24  218  };
a90295b4884f746 Paul Gortmaker                2016-05-09 @219  builtin_platform_driver(zevio_gpio_driver);

:::::: The code at line 174 was first introduced by commit
:::::: 9af4d80ba5666579944f570e113c5a87444afbde gpio: New driver for LSI ZEVIO SoCs

:::::: TO: Fabian Vogt <fabian@ritter-vogt.de>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
