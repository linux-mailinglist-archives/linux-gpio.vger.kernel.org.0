Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 644EA5ABD74
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Sep 2022 08:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232313AbiICGaB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Sep 2022 02:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232291AbiICGaA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Sep 2022 02:30:00 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03EC2CE36
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 23:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662186597; x=1693722597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J69HhJXWk459Ez703eX3EtSDdKHP1wMJ+Q9eE95qWUY=;
  b=MMALc2nK1YtElmNtnQ7WsPzZDb42JbdkSdZFdk23FO8MeWCwD5kiyyWQ
   FuwKj7VaPXgtBVZzRXnjp5xv+SDZcEhj0e40aY7A5SSzUQMjzUYzpQNKm
   NSKaxZZnbQDrDz2eA+nxqqw5e0terysIn1LLF0Q/tSrie7+rUcvuvFAJQ
   udFi2v1BwCcSRJOurV9YFHn2kQ1Num/mDtz/Ejmzz7c+2zX4OKhGMnNWa
   9pPWFjQZSXNAVOAyfqUE20AU0ftNdhVJ5GGo55XmrpbC7YbHRo+fJbU6d
   h4rSVUY1f7dxlA0NRJNXs9VZP/98f4Esxod3ZTnd0wFmiq8S1CwqP+OOX
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="276534385"
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="276534385"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 23:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="564195677"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 02 Sep 2022 23:29:54 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oUMfB-0001B2-24;
        Sat, 03 Sep 2022 06:29:53 +0000
Date:   Sat, 3 Sep 2022 14:29:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jianqun Xu <jay.xu@rock-chips.com>, heiko@sntech.de,
        linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.or,
        huangtao@rock-chips.com, Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH] gpio: rockchip: support acpi
Message-ID: <202209031405.ZyrtnKpS-lkp@intel.com>
References: <20220903033800.3266723-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220903033800.3266723-1-jay.xu@rock-chips.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jianqun,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on linus/master v6.0-rc3 next-20220901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianqun-Xu/gpio-rockchip-support-acpi/20220903-113834
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
config: hexagon-randconfig-r041-20220901 (https://download.01.org/0day-ci/archive/20220903/202209031405.ZyrtnKpS-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3d241d2c3b640720fc6a056b26db1ada6fefb15b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jianqun-Xu/gpio-rockchip-support-acpi/20220903-113834
        git checkout 3d241d2c3b640720fc6a056b26db1ada6fefb15b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-rockchip.c:797:7: error: incompatible pointer types assigning to 'struct rockchip_pin_output_deferred *' from 'struct rockchip_pin_deferred *' [-Werror,-Wincompatible-pointer-types]
                   cfg = list_first_entry(&bank->deferred_pins,
                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-rockchip.c:802:16: error: incomplete definition of type 'struct rockchip_pin_output_deferred'
                   list_del(&cfg->head);
                             ~~~^
   drivers/gpio/gpio-rockchip.c:708:9: note: forward declaration of 'struct rockchip_pin_output_deferred'
           struct rockchip_pin_output_deferred *cfg;
                  ^
   drivers/gpio/gpio-rockchip.c:804:14: error: incomplete definition of type 'struct rockchip_pin_output_deferred'
                   switch (cfg->param) {
                           ~~~^
   drivers/gpio/gpio-rockchip.c:708:9: note: forward declaration of 'struct rockchip_pin_output_deferred'
           struct rockchip_pin_output_deferred *cfg;
                  ^
   drivers/gpio/gpio-rockchip.c:806:62: error: incomplete definition of type 'struct rockchip_pin_output_deferred'
                           ret = rockchip_gpio_direction_output(&bank->gpio_chip, cfg->pin, cfg->arg);
                                                                                  ~~~^
   drivers/gpio/gpio-rockchip.c:708:9: note: forward declaration of 'struct rockchip_pin_output_deferred'
           struct rockchip_pin_output_deferred *cfg;
                  ^
   drivers/gpio/gpio-rockchip.c:806:72: error: incomplete definition of type 'struct rockchip_pin_output_deferred'
                           ret = rockchip_gpio_direction_output(&bank->gpio_chip, cfg->pin, cfg->arg);
                                                                                            ~~~^
   drivers/gpio/gpio-rockchip.c:708:9: note: forward declaration of 'struct rockchip_pin_output_deferred'
           struct rockchip_pin_output_deferred *cfg;
                  ^
   drivers/gpio/gpio-rockchip.c:808:62: error: incomplete definition of type 'struct rockchip_pin_output_deferred'
                                   dev_warn(dev, "setting output pin %u to %u failed\n", cfg->pin,
                                                                                         ~~~^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                               ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:708:9: note: forward declaration of 'struct rockchip_pin_output_deferred'
           struct rockchip_pin_output_deferred *cfg;
                  ^
   drivers/gpio/gpio-rockchip.c:809:10: error: incomplete definition of type 'struct rockchip_pin_output_deferred'
                                            cfg->arg);
                                            ~~~^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                               ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:708:9: note: forward declaration of 'struct rockchip_pin_output_deferred'
           struct rockchip_pin_output_deferred *cfg;
                  ^
   drivers/gpio/gpio-rockchip.c:812:61: error: incomplete definition of type 'struct rockchip_pin_output_deferred'
                           ret = rockchip_gpio_direction_input(&bank->gpio_chip, cfg->pin);
                                                                                 ~~~^
   drivers/gpio/gpio-rockchip.c:708:9: note: forward declaration of 'struct rockchip_pin_output_deferred'
           struct rockchip_pin_output_deferred *cfg;
                  ^
   drivers/gpio/gpio-rockchip.c:814:55: error: incomplete definition of type 'struct rockchip_pin_output_deferred'
                                   dev_warn(dev, "setting input pin %u failed\n", cfg->pin);
                                                                                  ~~~^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                               ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:708:9: note: forward declaration of 'struct rockchip_pin_output_deferred'
           struct rockchip_pin_output_deferred *cfg;
                  ^
   drivers/gpio/gpio-rockchip.c:817:59: error: incomplete definition of type 'struct rockchip_pin_output_deferred'
                           dev_warn(dev, "unknown deferred config param %d\n", cfg->param);
                                                                               ~~~^
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                               ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:708:9: note: forward declaration of 'struct rockchip_pin_output_deferred'
           struct rockchip_pin_output_deferred *cfg;
                  ^
   10 errors generated.


vim +797 drivers/gpio/gpio-rockchip.c

3d241d2c3b6407 Jianqun Xu     2022-09-03  702  
936ee2675eee1f Jianqun Xu     2021-08-16  703  static int rockchip_gpio_probe(struct platform_device *pdev)
936ee2675eee1f Jianqun Xu     2021-08-16  704  {
936ee2675eee1f Jianqun Xu     2021-08-16  705  	struct device *dev = &pdev->dev;
936ee2675eee1f Jianqun Xu     2021-08-16  706  	struct pinctrl_dev *pctldev = NULL;
936ee2675eee1f Jianqun Xu     2021-08-16  707  	struct rockchip_pin_bank *bank = NULL;
3d241d2c3b6407 Jianqun Xu     2022-09-03  708  	struct rockchip_pin_output_deferred *cfg;
3d241d2c3b6407 Jianqun Xu     2022-09-03  709  	int bank_id = 0;
3d241d2c3b6407 Jianqun Xu     2022-09-03  710  	int ret;
936ee2675eee1f Jianqun Xu     2021-08-16  711  
3d241d2c3b6407 Jianqun Xu     2022-09-03  712  	bank_id = rockchip_gpio_acpi_get_bank_id(dev);
3d241d2c3b6407 Jianqun Xu     2022-09-03  713  	if (bank_id < 0) {
3d241d2c3b6407 Jianqun Xu     2022-09-03  714  		bank_id = rockchip_gpio_of_get_bank_id(dev);
3d241d2c3b6407 Jianqun Xu     2022-09-03  715  		if (bank_id < 0)
3d241d2c3b6407 Jianqun Xu     2022-09-03  716  			return bank_id;
3d241d2c3b6407 Jianqun Xu     2022-09-03  717  	}
3d241d2c3b6407 Jianqun Xu     2022-09-03  718  
3d241d2c3b6407 Jianqun Xu     2022-09-03  719  	if (!ACPI_COMPANION(dev)) {
3d241d2c3b6407 Jianqun Xu     2022-09-03  720  		struct device_node *pctlnp = of_get_parent(dev->of_node);
936ee2675eee1f Jianqun Xu     2021-08-16  721  
936ee2675eee1f Jianqun Xu     2021-08-16  722  		pctldev = of_pinctrl_get(pctlnp);
936ee2675eee1f Jianqun Xu     2021-08-16  723  		if (!pctldev)
936ee2675eee1f Jianqun Xu     2021-08-16  724  			return -EPROBE_DEFER;
936ee2675eee1f Jianqun Xu     2021-08-16  725  
3d241d2c3b6407 Jianqun Xu     2022-09-03  726  		bank = rockchip_gpio_find_bank(pctldev, bank_id);
3d241d2c3b6407 Jianqun Xu     2022-09-03  727  		if (!bank)
3d241d2c3b6407 Jianqun Xu     2022-09-03  728  			return -ENODEV;
3d241d2c3b6407 Jianqun Xu     2022-09-03  729  	}
936ee2675eee1f Jianqun Xu     2021-08-16  730  
3d241d2c3b6407 Jianqun Xu     2022-09-03  731  	if (!bank) {
3d241d2c3b6407 Jianqun Xu     2022-09-03  732  		bank = devm_kzalloc(dev, sizeof(*bank), GFP_KERNEL);
936ee2675eee1f Jianqun Xu     2021-08-16  733  		if (!bank)
3d241d2c3b6407 Jianqun Xu     2022-09-03  734  			return -ENOMEM;
3d241d2c3b6407 Jianqun Xu     2022-09-03  735  	}
936ee2675eee1f Jianqun Xu     2021-08-16  736  
3d241d2c3b6407 Jianqun Xu     2022-09-03  737  	bank->bank_num = bank_id;
936ee2675eee1f Jianqun Xu     2021-08-16  738  	bank->dev = dev;
3d241d2c3b6407 Jianqun Xu     2022-09-03  739  
3d241d2c3b6407 Jianqun Xu     2022-09-03  740  	bank->reg_base = devm_platform_ioremap_resource(pdev, 0);
3d241d2c3b6407 Jianqun Xu     2022-09-03  741  	if (IS_ERR(bank->reg_base))
3d241d2c3b6407 Jianqun Xu     2022-09-03  742  		return PTR_ERR(bank->reg_base);
3d241d2c3b6407 Jianqun Xu     2022-09-03  743  
3d241d2c3b6407 Jianqun Xu     2022-09-03  744  	bank->irq = platform_get_irq(pdev, 0);
3d241d2c3b6407 Jianqun Xu     2022-09-03  745  	if (bank->irq < 0)
3d241d2c3b6407 Jianqun Xu     2022-09-03  746  		return bank->irq;
936ee2675eee1f Jianqun Xu     2021-08-16  747  
936ee2675eee1f Jianqun Xu     2021-08-16  748  	raw_spin_lock_init(&bank->slock);
936ee2675eee1f Jianqun Xu     2021-08-16  749  
3d241d2c3b6407 Jianqun Xu     2022-09-03  750  	if (!ACPI_COMPANION(dev)) {
3d241d2c3b6407 Jianqun Xu     2022-09-03  751  		bank->clk = devm_clk_get(dev, "bus");
3d241d2c3b6407 Jianqun Xu     2022-09-03  752  		if (IS_ERR(bank->clk)) {
3d241d2c3b6407 Jianqun Xu     2022-09-03  753  			bank->clk = of_clk_get(dev->of_node, 0);
3d241d2c3b6407 Jianqun Xu     2022-09-03  754  			if (IS_ERR(bank->clk)) {
3d241d2c3b6407 Jianqun Xu     2022-09-03  755  				dev_err(dev, "fail to get apb clock\n");
3d241d2c3b6407 Jianqun Xu     2022-09-03  756  				return PTR_ERR(bank->clk);
3d241d2c3b6407 Jianqun Xu     2022-09-03  757  			}
3d241d2c3b6407 Jianqun Xu     2022-09-03  758  		}
3d241d2c3b6407 Jianqun Xu     2022-09-03  759  
3d241d2c3b6407 Jianqun Xu     2022-09-03  760  		bank->db_clk = devm_clk_get(dev, "db");
3d241d2c3b6407 Jianqun Xu     2022-09-03  761  		if (IS_ERR(bank->db_clk)) {
3d241d2c3b6407 Jianqun Xu     2022-09-03  762  			bank->db_clk = of_clk_get(dev->of_node, 1);
3d241d2c3b6407 Jianqun Xu     2022-09-03  763  			if (IS_ERR(bank->db_clk))
3d241d2c3b6407 Jianqun Xu     2022-09-03  764  				bank->db_clk = NULL;
3d241d2c3b6407 Jianqun Xu     2022-09-03  765  		}
3d241d2c3b6407 Jianqun Xu     2022-09-03  766  	}
3d241d2c3b6407 Jianqun Xu     2022-09-03  767  
3d241d2c3b6407 Jianqun Xu     2022-09-03  768  	clk_prepare_enable(bank->clk);
3d241d2c3b6407 Jianqun Xu     2022-09-03  769  	clk_prepare_enable(bank->db_clk);
3d241d2c3b6407 Jianqun Xu     2022-09-03  770  
3d241d2c3b6407 Jianqun Xu     2022-09-03  771  	rockchip_gpio_get_ver(bank);
936ee2675eee1f Jianqun Xu     2021-08-16  772  
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  773  	/*
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  774  	 * Prevent clashes with a deferred output setting
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  775  	 * being added right at this moment.
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  776  	 */
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  777  	mutex_lock(&bank->deferred_lock);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  778  
936ee2675eee1f Jianqun Xu     2021-08-16  779  	ret = rockchip_gpiolib_register(bank);
936ee2675eee1f Jianqun Xu     2021-08-16  780  	if (ret) {
3d241d2c3b6407 Jianqun Xu     2022-09-03  781  		dev_err(bank->dev, "Failed to register gpio %d\n", ret);
3d241d2c3b6407 Jianqun Xu     2022-09-03  782  		goto err_unlock;
3d241d2c3b6407 Jianqun Xu     2022-09-03  783  	}
3d241d2c3b6407 Jianqun Xu     2022-09-03  784  
3d241d2c3b6407 Jianqun Xu     2022-09-03  785  	if (!device_property_read_bool(bank->dev, "gpio-ranges") && pctldev) {
3d241d2c3b6407 Jianqun Xu     2022-09-03  786  		struct gpio_chip *gc = &bank->gpio_chip;
3d241d2c3b6407 Jianqun Xu     2022-09-03  787  
3d241d2c3b6407 Jianqun Xu     2022-09-03  788  		ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
3d241d2c3b6407 Jianqun Xu     2022-09-03  789  					     gc->base, gc->ngpio);
3d241d2c3b6407 Jianqun Xu     2022-09-03  790  		if (ret) {
3d241d2c3b6407 Jianqun Xu     2022-09-03  791  			dev_err(bank->dev, "Failed to add pin range\n");
3d241d2c3b6407 Jianqun Xu     2022-09-03  792  			goto err_unlock;
3d241d2c3b6407 Jianqun Xu     2022-09-03  793  		}
936ee2675eee1f Jianqun Xu     2021-08-16  794  	}
936ee2675eee1f Jianqun Xu     2021-08-16  795  
8ce5ef64546850 Caleb Connolly 2022-03-28  796  	while (!list_empty(&bank->deferred_pins)) {
8ce5ef64546850 Caleb Connolly 2022-03-28 @797  		cfg = list_first_entry(&bank->deferred_pins,
8ce5ef64546850 Caleb Connolly 2022-03-28  798  				       struct rockchip_pin_deferred, head);
3d241d2c3b6407 Jianqun Xu     2022-09-03  799  		if (!cfg)
3d241d2c3b6407 Jianqun Xu     2022-09-03  800  			break;
3d241d2c3b6407 Jianqun Xu     2022-09-03  801  
59dd178e1d7cb6 Heiko Stuebner 2021-09-14 @802  		list_del(&cfg->head);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  803  
8ce5ef64546850 Caleb Connolly 2022-03-28  804  		switch (cfg->param) {
8ce5ef64546850 Caleb Connolly 2022-03-28  805  		case PIN_CONFIG_OUTPUT:
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  806  			ret = rockchip_gpio_direction_output(&bank->gpio_chip, cfg->pin, cfg->arg);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  807  			if (ret)
8ce5ef64546850 Caleb Connolly 2022-03-28  808  				dev_warn(dev, "setting output pin %u to %u failed\n", cfg->pin,
8ce5ef64546850 Caleb Connolly 2022-03-28  809  					 cfg->arg);
8ce5ef64546850 Caleb Connolly 2022-03-28  810  			break;
7ff11357810fd1 Caleb Connolly 2022-03-28  811  		case PIN_CONFIG_INPUT_ENABLE:
7ff11357810fd1 Caleb Connolly 2022-03-28  812  			ret = rockchip_gpio_direction_input(&bank->gpio_chip, cfg->pin);
7ff11357810fd1 Caleb Connolly 2022-03-28  813  			if (ret)
7ff11357810fd1 Caleb Connolly 2022-03-28  814  				dev_warn(dev, "setting input pin %u failed\n", cfg->pin);
7ff11357810fd1 Caleb Connolly 2022-03-28  815  			break;
8ce5ef64546850 Caleb Connolly 2022-03-28  816  		default:
8ce5ef64546850 Caleb Connolly 2022-03-28  817  			dev_warn(dev, "unknown deferred config param %d\n", cfg->param);
8ce5ef64546850 Caleb Connolly 2022-03-28  818  			break;
8ce5ef64546850 Caleb Connolly 2022-03-28  819  		}
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  820  		kfree(cfg);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  821  	}
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  822  
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  823  	mutex_unlock(&bank->deferred_lock);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  824  
936ee2675eee1f Jianqun Xu     2021-08-16  825  	platform_set_drvdata(pdev, bank);
3d241d2c3b6407 Jianqun Xu     2022-09-03  826  	dev_info(dev, "probed %pfw\n", dev_fwnode(dev));
936ee2675eee1f Jianqun Xu     2021-08-16  827  
936ee2675eee1f Jianqun Xu     2021-08-16  828  	return 0;
3d241d2c3b6407 Jianqun Xu     2022-09-03  829  err_unlock:
3d241d2c3b6407 Jianqun Xu     2022-09-03  830  	mutex_unlock(&bank->deferred_lock);
3d241d2c3b6407 Jianqun Xu     2022-09-03  831  	clk_disable_unprepare(bank->clk);
3d241d2c3b6407 Jianqun Xu     2022-09-03  832  	clk_disable_unprepare(bank->db_clk);
3d241d2c3b6407 Jianqun Xu     2022-09-03  833  
3d241d2c3b6407 Jianqun Xu     2022-09-03  834  	return ret;
936ee2675eee1f Jianqun Xu     2021-08-16  835  }
936ee2675eee1f Jianqun Xu     2021-08-16  836  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
