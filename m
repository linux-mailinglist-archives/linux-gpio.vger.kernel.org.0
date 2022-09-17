Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3CB5BB67A
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Sep 2022 07:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiIQFHy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Sep 2022 01:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiIQFHx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Sep 2022 01:07:53 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D69FBA15E
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 22:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663391269; x=1694927269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vGw1n6WUjwu2SuHZWfRiCGd0JDyMVhdw2sL51bNvZ5I=;
  b=Fr4R1izHH6jSB8daPtF6oztpyPpp6lXHOEEIXpAcuw2AnD72mZMZB/XM
   iLHzGeeooo+72UPCJjNw7QigP+v2IsPn0ZDwpUsnrpUd+2GNX9VvaDV/s
   w1bwKF6AthXARlLs//o0xBEQUzOvTuYr0wwKNLN4Xh6G8NAH4UJyNIuAI
   6mS6+CrocEzRGmxGz8Y0D4UGDOAA3dj7bCFc+gjGuX5uzL3TNGzqBk6yZ
   1Yg0/7kAC2SdPkqv/AUkzP9gxhpl3VnFraAWjcEurt4OQgtbARt4D+RRQ
   KuuxjneFo7OMYKBHrJvYk8XLjgqeuu3DA+LengMRqq6r4jR37Tup3g6Uy
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="282152529"
X-IronPort-AV: E=Sophos;i="5.93,322,1654585200"; 
   d="scan'208";a="282152529"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 22:07:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,322,1654585200"; 
   d="scan'208";a="651091176"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Sep 2022 22:07:45 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oZQ3M-00001T-1a;
        Sat, 17 Sep 2022 05:07:44 +0000
Date:   Sat, 17 Sep 2022 13:06:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jianqun Xu <jay.xu@rock-chips.com>, jbx6244@gmail.com,
        heiko@sntech.de, linus.walleij@linaro.org,
        andriy.shevchenko@linux.intel.com
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH] pinctrl: rockchip: find gpiochip by name from gpio module
Message-ID: <202209171210.VctYge6y-lkp@intel.com>
References: <20220916084343.458566-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="eT9GJHl9ZYjniUOt"
Content-Disposition: inline
In-Reply-To: <20220916084343.458566-1-jay.xu@rock-chips.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--eT9GJHl9ZYjniUOt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jianqun,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on linus/master v6.0-rc5 next-20220916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianqun-Xu/pinctrl-rockchip-find-gpiochip-by-name-from-gpio-module/20220916-164429
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
config: arm64-randconfig-r022-20220916
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/3b7aea26a196ae8a452c7283c4a42d98eade1aff
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jianqun-Xu/pinctrl-rockchip-find-gpiochip-by-name-from-gpio-module/20220916-164429
        git checkout 3b7aea26a196ae8a452c7283c4a42d98eade1aff
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-rockchip.c:477:29: error: incompatible pointer types passing 'struct gpio_chip **' to parameter of type 'struct gpio_chip *'; remove & [-Werror,-Wincompatible-pointer-types]
           return gpiochip_reqres_irq(&bank->gpio_chip, d->hwirq);
                                      ^~~~~~~~~~~~~~~~
   include/linux/gpio/driver.h:622:43: note: passing argument to parameter 'gc' here
   int gpiochip_reqres_irq(struct gpio_chip *gc, unsigned int offset);
                                             ^
   drivers/gpio/gpio-rockchip.c:485:22: error: incompatible pointer types passing 'struct gpio_chip **' to parameter of type 'struct gpio_chip *'; remove & [-Werror,-Wincompatible-pointer-types]
           gpiochip_relres_irq(&bank->gpio_chip, d->hwirq);
                               ^~~~~~~~~~~~~~~~
   include/linux/gpio/driver.h:623:44: note: passing argument to parameter 'gc' here
   void gpiochip_relres_irq(struct gpio_chip *gc, unsigned int offset);
                                              ^
>> drivers/gpio/gpio-rockchip.c:584:18: error: assigning to 'struct gpio_chip *' from incompatible type 'const struct gpio_chip'
           bank->gpio_chip = rockchip_gpiolib_chip;
                           ^ ~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-rockchip.c:586:5: error: incompatible pointer types assigning to 'struct gpio_chip *' from 'struct gpio_chip **'; remove & [-Werror,-Wincompatible-pointer-types]
           gc = &bank->gpio_chip;
              ^ ~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:637:18: error: incompatible pointer types passing 'struct gpio_chip **' to parameter of type 'struct gpio_chip *'; remove & [-Werror,-Wincompatible-pointer-types]
           gpiochip_remove(&bank->gpio_chip);
                           ^~~~~~~~~~~~~~~~
   include/linux/gpio/driver.h:613:47: note: passing argument to parameter 'gc' here
   extern void gpiochip_remove(struct gpio_chip *gc);
                                                 ^
   drivers/gpio/gpio-rockchip.c:759:41: error: incompatible pointer types passing 'struct gpio_chip **' to parameter of type 'struct gpio_chip *'; remove & [-Werror,-Wincompatible-pointer-types]
                           ret = rockchip_gpio_direction_output(&bank->gpio_chip, cfg->pin, cfg->arg);
                                                                ^~~~~~~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:256:61: note: passing argument to parameter 'gc' here
   static int rockchip_gpio_direction_output(struct gpio_chip *gc,
                                                               ^
   drivers/gpio/gpio-rockchip.c:765:40: error: incompatible pointer types passing 'struct gpio_chip **' to parameter of type 'struct gpio_chip *'; remove & [-Werror,-Wincompatible-pointer-types]
                           ret = rockchip_gpio_direction_input(&bank->gpio_chip, cfg->pin);
                                                               ^~~~~~~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:250:60: note: passing argument to parameter 'gc' here
   static int rockchip_gpio_direction_input(struct gpio_chip *gc,
                                                              ^
   drivers/gpio/gpio-rockchip.c:789:18: error: incompatible pointer types passing 'struct gpio_chip **' to parameter of type 'struct gpio_chip *'; remove & [-Werror,-Wincompatible-pointer-types]
           gpiochip_remove(&bank->gpio_chip);
                           ^~~~~~~~~~~~~~~~
   include/linux/gpio/driver.h:613:47: note: passing argument to parameter 'gc' here
   extern void gpiochip_remove(struct gpio_chip *gc);
                                                 ^
   8 errors generated.


vim +477 drivers/gpio/gpio-rockchip.c

936ee2675eee1f Jianqun Xu   2021-08-16  471  
adc8b4bf2a7f6f John Keeping 2021-12-02  472  static int rockchip_irq_reqres(struct irq_data *d)
adc8b4bf2a7f6f John Keeping 2021-12-02  473  {
adc8b4bf2a7f6f John Keeping 2021-12-02  474  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
adc8b4bf2a7f6f John Keeping 2021-12-02  475  	struct rockchip_pin_bank *bank = gc->private;
adc8b4bf2a7f6f John Keeping 2021-12-02  476  
adc8b4bf2a7f6f John Keeping 2021-12-02 @477  	return gpiochip_reqres_irq(&bank->gpio_chip, d->hwirq);
adc8b4bf2a7f6f John Keeping 2021-12-02  478  }
adc8b4bf2a7f6f John Keeping 2021-12-02  479  
adc8b4bf2a7f6f John Keeping 2021-12-02  480  static void rockchip_irq_relres(struct irq_data *d)
adc8b4bf2a7f6f John Keeping 2021-12-02  481  {
adc8b4bf2a7f6f John Keeping 2021-12-02  482  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
adc8b4bf2a7f6f John Keeping 2021-12-02  483  	struct rockchip_pin_bank *bank = gc->private;
adc8b4bf2a7f6f John Keeping 2021-12-02  484  
adc8b4bf2a7f6f John Keeping 2021-12-02  485  	gpiochip_relres_irq(&bank->gpio_chip, d->hwirq);
adc8b4bf2a7f6f John Keeping 2021-12-02  486  }
adc8b4bf2a7f6f John Keeping 2021-12-02  487  
936ee2675eee1f Jianqun Xu   2021-08-16  488  static void rockchip_irq_suspend(struct irq_data *d)
936ee2675eee1f Jianqun Xu   2021-08-16  489  {
936ee2675eee1f Jianqun Xu   2021-08-16  490  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
936ee2675eee1f Jianqun Xu   2021-08-16  491  	struct rockchip_pin_bank *bank = gc->private;
936ee2675eee1f Jianqun Xu   2021-08-16  492  
ff96a8c21cdbf4 Jianqun Xu   2021-08-16  493  	bank->saved_masks = irq_reg_readl(gc, bank->gpio_regs->int_mask);
ff96a8c21cdbf4 Jianqun Xu   2021-08-16  494  	irq_reg_writel(gc, ~gc->wake_active, bank->gpio_regs->int_mask);
936ee2675eee1f Jianqun Xu   2021-08-16  495  }
936ee2675eee1f Jianqun Xu   2021-08-16  496  
936ee2675eee1f Jianqun Xu   2021-08-16  497  static void rockchip_irq_resume(struct irq_data *d)
936ee2675eee1f Jianqun Xu   2021-08-16  498  {
936ee2675eee1f Jianqun Xu   2021-08-16  499  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
936ee2675eee1f Jianqun Xu   2021-08-16  500  	struct rockchip_pin_bank *bank = gc->private;
936ee2675eee1f Jianqun Xu   2021-08-16  501  
ff96a8c21cdbf4 Jianqun Xu   2021-08-16  502  	irq_reg_writel(gc, bank->saved_masks, bank->gpio_regs->int_mask);
936ee2675eee1f Jianqun Xu   2021-08-16  503  }
936ee2675eee1f Jianqun Xu   2021-08-16  504  
936ee2675eee1f Jianqun Xu   2021-08-16  505  static void rockchip_irq_enable(struct irq_data *d)
936ee2675eee1f Jianqun Xu   2021-08-16  506  {
936ee2675eee1f Jianqun Xu   2021-08-16  507  	irq_gc_mask_clr_bit(d);
936ee2675eee1f Jianqun Xu   2021-08-16  508  }
936ee2675eee1f Jianqun Xu   2021-08-16  509  
936ee2675eee1f Jianqun Xu   2021-08-16  510  static void rockchip_irq_disable(struct irq_data *d)
936ee2675eee1f Jianqun Xu   2021-08-16  511  {
936ee2675eee1f Jianqun Xu   2021-08-16  512  	irq_gc_mask_set_bit(d);
936ee2675eee1f Jianqun Xu   2021-08-16  513  }
936ee2675eee1f Jianqun Xu   2021-08-16  514  
936ee2675eee1f Jianqun Xu   2021-08-16  515  static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
936ee2675eee1f Jianqun Xu   2021-08-16  516  {
936ee2675eee1f Jianqun Xu   2021-08-16  517  	unsigned int clr = IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN;
936ee2675eee1f Jianqun Xu   2021-08-16  518  	struct irq_chip_generic *gc;
936ee2675eee1f Jianqun Xu   2021-08-16  519  	int ret;
936ee2675eee1f Jianqun Xu   2021-08-16  520  
936ee2675eee1f Jianqun Xu   2021-08-16  521  	bank->domain = irq_domain_add_linear(bank->of_node, 32,
936ee2675eee1f Jianqun Xu   2021-08-16  522  					&irq_generic_chip_ops, NULL);
936ee2675eee1f Jianqun Xu   2021-08-16  523  	if (!bank->domain) {
936ee2675eee1f Jianqun Xu   2021-08-16  524  		dev_warn(bank->dev, "could not init irq domain for bank %s\n",
936ee2675eee1f Jianqun Xu   2021-08-16  525  			 bank->name);
936ee2675eee1f Jianqun Xu   2021-08-16  526  		return -EINVAL;
936ee2675eee1f Jianqun Xu   2021-08-16  527  	}
936ee2675eee1f Jianqun Xu   2021-08-16  528  
936ee2675eee1f Jianqun Xu   2021-08-16  529  	ret = irq_alloc_domain_generic_chips(bank->domain, 32, 1,
936ee2675eee1f Jianqun Xu   2021-08-16  530  					     "rockchip_gpio_irq",
936ee2675eee1f Jianqun Xu   2021-08-16  531  					     handle_level_irq,
936ee2675eee1f Jianqun Xu   2021-08-16  532  					     clr, 0, 0);
936ee2675eee1f Jianqun Xu   2021-08-16  533  	if (ret) {
936ee2675eee1f Jianqun Xu   2021-08-16  534  		dev_err(bank->dev, "could not alloc generic chips for bank %s\n",
936ee2675eee1f Jianqun Xu   2021-08-16  535  			bank->name);
936ee2675eee1f Jianqun Xu   2021-08-16  536  		irq_domain_remove(bank->domain);
936ee2675eee1f Jianqun Xu   2021-08-16  537  		return -EINVAL;
936ee2675eee1f Jianqun Xu   2021-08-16  538  	}
936ee2675eee1f Jianqun Xu   2021-08-16  539  
936ee2675eee1f Jianqun Xu   2021-08-16  540  	gc = irq_get_domain_generic_chip(bank->domain, 0);
3bcbd1a85b68e5 Jianqun Xu   2021-08-16  541  	if (bank->gpio_type == GPIO_TYPE_V2) {
3bcbd1a85b68e5 Jianqun Xu   2021-08-16  542  		gc->reg_writel = gpio_writel_v2;
3bcbd1a85b68e5 Jianqun Xu   2021-08-16  543  		gc->reg_readl = gpio_readl_v2;
3bcbd1a85b68e5 Jianqun Xu   2021-08-16  544  	}
3bcbd1a85b68e5 Jianqun Xu   2021-08-16  545  
936ee2675eee1f Jianqun Xu   2021-08-16  546  	gc->reg_base = bank->reg_base;
936ee2675eee1f Jianqun Xu   2021-08-16  547  	gc->private = bank;
ff96a8c21cdbf4 Jianqun Xu   2021-08-16  548  	gc->chip_types[0].regs.mask = bank->gpio_regs->int_mask;
ff96a8c21cdbf4 Jianqun Xu   2021-08-16  549  	gc->chip_types[0].regs.ack = bank->gpio_regs->port_eoi;
936ee2675eee1f Jianqun Xu   2021-08-16  550  	gc->chip_types[0].chip.irq_ack = irq_gc_ack_set_bit;
936ee2675eee1f Jianqun Xu   2021-08-16  551  	gc->chip_types[0].chip.irq_mask = irq_gc_mask_set_bit;
936ee2675eee1f Jianqun Xu   2021-08-16  552  	gc->chip_types[0].chip.irq_unmask = irq_gc_mask_clr_bit;
936ee2675eee1f Jianqun Xu   2021-08-16  553  	gc->chip_types[0].chip.irq_enable = rockchip_irq_enable;
936ee2675eee1f Jianqun Xu   2021-08-16  554  	gc->chip_types[0].chip.irq_disable = rockchip_irq_disable;
936ee2675eee1f Jianqun Xu   2021-08-16  555  	gc->chip_types[0].chip.irq_set_wake = irq_gc_set_wake;
936ee2675eee1f Jianqun Xu   2021-08-16  556  	gc->chip_types[0].chip.irq_suspend = rockchip_irq_suspend;
936ee2675eee1f Jianqun Xu   2021-08-16  557  	gc->chip_types[0].chip.irq_resume = rockchip_irq_resume;
936ee2675eee1f Jianqun Xu   2021-08-16  558  	gc->chip_types[0].chip.irq_set_type = rockchip_irq_set_type;
adc8b4bf2a7f6f John Keeping 2021-12-02  559  	gc->chip_types[0].chip.irq_request_resources = rockchip_irq_reqres;
adc8b4bf2a7f6f John Keeping 2021-12-02  560  	gc->chip_types[0].chip.irq_release_resources = rockchip_irq_relres;
936ee2675eee1f Jianqun Xu   2021-08-16  561  	gc->wake_enabled = IRQ_MSK(bank->nr_pins);
936ee2675eee1f Jianqun Xu   2021-08-16  562  
936ee2675eee1f Jianqun Xu   2021-08-16  563  	/*
936ee2675eee1f Jianqun Xu   2021-08-16  564  	 * Linux assumes that all interrupts start out disabled/masked.
936ee2675eee1f Jianqun Xu   2021-08-16  565  	 * Our driver only uses the concept of masked and always keeps
936ee2675eee1f Jianqun Xu   2021-08-16  566  	 * things enabled, so for us that's all masked and all enabled.
936ee2675eee1f Jianqun Xu   2021-08-16  567  	 */
3bcbd1a85b68e5 Jianqun Xu   2021-08-16  568  	rockchip_gpio_writel(bank, 0xffffffff, bank->gpio_regs->int_mask);
3bcbd1a85b68e5 Jianqun Xu   2021-08-16  569  	rockchip_gpio_writel(bank, 0xffffffff, bank->gpio_regs->port_eoi);
3bcbd1a85b68e5 Jianqun Xu   2021-08-16  570  	rockchip_gpio_writel(bank, 0xffffffff, bank->gpio_regs->int_en);
936ee2675eee1f Jianqun Xu   2021-08-16  571  	gc->mask_cache = 0xffffffff;
936ee2675eee1f Jianqun Xu   2021-08-16  572  
936ee2675eee1f Jianqun Xu   2021-08-16  573  	irq_set_chained_handler_and_data(bank->irq,
936ee2675eee1f Jianqun Xu   2021-08-16  574  					 rockchip_irq_demux, bank);
936ee2675eee1f Jianqun Xu   2021-08-16  575  
936ee2675eee1f Jianqun Xu   2021-08-16  576  	return 0;
936ee2675eee1f Jianqun Xu   2021-08-16  577  }
936ee2675eee1f Jianqun Xu   2021-08-16  578  
936ee2675eee1f Jianqun Xu   2021-08-16  579  static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
936ee2675eee1f Jianqun Xu   2021-08-16  580  {
936ee2675eee1f Jianqun Xu   2021-08-16  581  	struct gpio_chip *gc;
936ee2675eee1f Jianqun Xu   2021-08-16  582  	int ret;
936ee2675eee1f Jianqun Xu   2021-08-16  583  
936ee2675eee1f Jianqun Xu   2021-08-16 @584  	bank->gpio_chip = rockchip_gpiolib_chip;
936ee2675eee1f Jianqun Xu   2021-08-16  585  
936ee2675eee1f Jianqun Xu   2021-08-16 @586  	gc = &bank->gpio_chip;
936ee2675eee1f Jianqun Xu   2021-08-16  587  	gc->base = bank->pin_base;
936ee2675eee1f Jianqun Xu   2021-08-16  588  	gc->ngpio = bank->nr_pins;
936ee2675eee1f Jianqun Xu   2021-08-16  589  	gc->label = bank->name;
936ee2675eee1f Jianqun Xu   2021-08-16  590  	gc->parent = bank->dev;
936ee2675eee1f Jianqun Xu   2021-08-16  591  
936ee2675eee1f Jianqun Xu   2021-08-16  592  	ret = gpiochip_add_data(gc, bank);
936ee2675eee1f Jianqun Xu   2021-08-16  593  	if (ret) {
936ee2675eee1f Jianqun Xu   2021-08-16  594  		dev_err(bank->dev, "failed to add gpiochip %s, %d\n",
936ee2675eee1f Jianqun Xu   2021-08-16  595  			gc->label, ret);
936ee2675eee1f Jianqun Xu   2021-08-16  596  		return ret;
936ee2675eee1f Jianqun Xu   2021-08-16  597  	}
936ee2675eee1f Jianqun Xu   2021-08-16  598  
936ee2675eee1f Jianqun Xu   2021-08-16  599  	/*
936ee2675eee1f Jianqun Xu   2021-08-16  600  	 * For DeviceTree-supported systems, the gpio core checks the
936ee2675eee1f Jianqun Xu   2021-08-16  601  	 * pinctrl's device node for the "gpio-ranges" property.
936ee2675eee1f Jianqun Xu   2021-08-16  602  	 * If it is present, it takes care of adding the pin ranges
936ee2675eee1f Jianqun Xu   2021-08-16  603  	 * for the driver. In this case the driver can skip ahead.
936ee2675eee1f Jianqun Xu   2021-08-16  604  	 *
936ee2675eee1f Jianqun Xu   2021-08-16  605  	 * In order to remain compatible with older, existing DeviceTree
936ee2675eee1f Jianqun Xu   2021-08-16  606  	 * files which don't set the "gpio-ranges" property or systems that
936ee2675eee1f Jianqun Xu   2021-08-16  607  	 * utilize ACPI the driver has to call gpiochip_add_pin_range().
936ee2675eee1f Jianqun Xu   2021-08-16  608  	 */
936ee2675eee1f Jianqun Xu   2021-08-16  609  	if (!of_property_read_bool(bank->of_node, "gpio-ranges")) {
936ee2675eee1f Jianqun Xu   2021-08-16  610  		struct device_node *pctlnp = of_get_parent(bank->of_node);
936ee2675eee1f Jianqun Xu   2021-08-16  611  		struct pinctrl_dev *pctldev = NULL;
936ee2675eee1f Jianqun Xu   2021-08-16  612  
936ee2675eee1f Jianqun Xu   2021-08-16  613  		if (!pctlnp)
936ee2675eee1f Jianqun Xu   2021-08-16  614  			return -ENODATA;
936ee2675eee1f Jianqun Xu   2021-08-16  615  
936ee2675eee1f Jianqun Xu   2021-08-16  616  		pctldev = of_pinctrl_get(pctlnp);
936ee2675eee1f Jianqun Xu   2021-08-16  617  		if (!pctldev)
936ee2675eee1f Jianqun Xu   2021-08-16  618  			return -ENODEV;
936ee2675eee1f Jianqun Xu   2021-08-16  619  
936ee2675eee1f Jianqun Xu   2021-08-16  620  		ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
936ee2675eee1f Jianqun Xu   2021-08-16  621  					     gc->base, gc->ngpio);
936ee2675eee1f Jianqun Xu   2021-08-16  622  		if (ret) {
936ee2675eee1f Jianqun Xu   2021-08-16  623  			dev_err(bank->dev, "Failed to add pin range\n");
936ee2675eee1f Jianqun Xu   2021-08-16  624  			goto fail;
936ee2675eee1f Jianqun Xu   2021-08-16  625  		}
936ee2675eee1f Jianqun Xu   2021-08-16  626  	}
936ee2675eee1f Jianqun Xu   2021-08-16  627  
936ee2675eee1f Jianqun Xu   2021-08-16  628  	ret = rockchip_interrupts_register(bank);
936ee2675eee1f Jianqun Xu   2021-08-16  629  	if (ret) {
936ee2675eee1f Jianqun Xu   2021-08-16  630  		dev_err(bank->dev, "failed to register interrupt, %d\n", ret);
936ee2675eee1f Jianqun Xu   2021-08-16  631  		goto fail;
936ee2675eee1f Jianqun Xu   2021-08-16  632  	}
936ee2675eee1f Jianqun Xu   2021-08-16  633  
936ee2675eee1f Jianqun Xu   2021-08-16  634  	return 0;
936ee2675eee1f Jianqun Xu   2021-08-16  635  
936ee2675eee1f Jianqun Xu   2021-08-16  636  fail:
936ee2675eee1f Jianqun Xu   2021-08-16  637  	gpiochip_remove(&bank->gpio_chip);
936ee2675eee1f Jianqun Xu   2021-08-16  638  
936ee2675eee1f Jianqun Xu   2021-08-16  639  	return ret;
936ee2675eee1f Jianqun Xu   2021-08-16  640  }
936ee2675eee1f Jianqun Xu   2021-08-16  641  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--eT9GJHl9ZYjniUOt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/arm64 6.0.0-rc2 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="clang version 16.0.0 (git://gitmirror/llvm_project 791a7ae1ba3efd6bca96338e10ffde557ba83920)"
CONFIG_GCC_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_CLANG_VERSION=160000
CONFIG_AS_IS_LLVM=y
CONFIG_AS_VERSION=160000
CONFIG_LD_VERSION=0
CONFIG_LD_IS_LLD=y
CONFIG_LLD_VERSION=160000
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
CONFIG_WATCH_QUEUE=y
# CONFIG_CROSS_MEMORY_ATTACH is not set
# CONFIG_USELIB is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_SHOW_LEVEL=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS=y
CONFIG_GENERIC_IRQ_IPI=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_ARCH_HAS_TICK_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
# CONFIG_NO_HZ_FULL is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
# CONFIG_BPF_SYSCALL is not set
# end of BPF subsystem

CONFIG_PREEMPT_BUILD=y
# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=y
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPTION=y
# CONFIG_PREEMPT_DYNAMIC is not set
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
# CONFIG_IRQ_TIME_ACCOUNTING is not set
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_PSI=y
# CONFIG_PSI_DEFAULT_DISABLED is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_PREEMPT_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
# CONFIG_FORCE_TASKS_RUDE_RCU is not set
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=64
CONFIG_RCU_FANOUT_LEAF=16
CONFIG_RCU_BOOST=y
CONFIG_RCU_BOOST_DELAY=500
CONFIG_RCU_EXP_KTHREAD=y
# CONFIG_RCU_NOCB_CPU is not set
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
# CONFIG_IKHEADERS is not set
CONFIG_GENERIC_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_ARCH_SUPPORTS_INT128=y
# CONFIG_CGROUPS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
CONFIG_SYSFS_DEPRECATED=y
CONFIG_SYSFS_DEPRECATED_V2=y
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
# CONFIG_RD_ZSTD is not set
# CONFIG_BOOT_CONFIG is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_EXPERT=y
# CONFIG_MULTIUSER is not set
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
# CONFIG_FHANDLE is not set
# CONFIG_POSIX_TIMERS is not set
# CONFIG_PRINTK is not set
# CONFIG_BUG is not set
CONFIG_ELF_CORE=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
# CONFIG_TIMERFD is not set
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
CONFIG_DEBUG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
# CONFIG_PERF_EVENTS is not set
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_ARM64=y
CONFIG_CLANG_SUPPORTS_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_64BIT=y
CONFIG_MMU=y
CONFIG_ARM64_PAGE_SHIFT=14
CONFIG_ARM64_CONT_PTE_SHIFT=7
CONFIG_ARM64_CONT_PMD_SHIFT=5
CONFIG_ARCH_MMAP_RND_BITS_MIN=16
CONFIG_ARCH_MMAP_RND_BITS_MAX=19
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=9
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_NO_IOPORT_MAP=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CSUM=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y
CONFIG_SMP=y
CONFIG_KERNEL_MODE_NEON=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=2
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_ARCH_PROC_KCORE_TEXT=y

#
# Platform selection
#
# CONFIG_ARCH_ACTIONS is not set
CONFIG_ARCH_SUNXI=y
CONFIG_ARCH_ALPINE=y
CONFIG_ARCH_APPLE=y
# CONFIG_ARCH_BCM2835 is not set
# CONFIG_ARCH_BCM4908 is not set
# CONFIG_ARCH_BCM_IPROC is not set
# CONFIG_ARCH_BCMBCA is not set
CONFIG_ARCH_BERLIN=y
CONFIG_ARCH_BITMAIN=y
# CONFIG_ARCH_BRCMSTB is not set
# CONFIG_ARCH_EXYNOS is not set
CONFIG_ARCH_SPARX5=y
# CONFIG_ARCH_K3 is not set
# CONFIG_ARCH_LAYERSCAPE is not set
CONFIG_ARCH_LG1K=y
CONFIG_ARCH_HISI=y
# CONFIG_ARCH_KEEMBAY is not set
# CONFIG_ARCH_MEDIATEK is not set
CONFIG_ARCH_MESON=y
CONFIG_ARCH_MVEBU=y
# CONFIG_ARCH_MXC is not set
# CONFIG_ARCH_NPCM is not set
CONFIG_ARCH_QCOM=y
CONFIG_ARCH_REALTEK=y
CONFIG_ARCH_RENESAS=y
# CONFIG_ARCH_ROCKCHIP is not set
# CONFIG_ARCH_S32 is not set
# CONFIG_ARCH_SEATTLE is not set
CONFIG_ARCH_INTEL_SOCFPGA=y
# CONFIG_ARCH_SYNQUACER is not set
CONFIG_ARCH_TEGRA=y
# CONFIG_ARCH_SPRD is not set
# CONFIG_ARCH_THUNDER is not set
# CONFIG_ARCH_THUNDER2 is not set
CONFIG_ARCH_UNIPHIER=y
CONFIG_ARCH_VEXPRESS=y
# CONFIG_ARCH_VISCONTI is not set
# CONFIG_ARCH_XGENE is not set
CONFIG_ARCH_ZYNQMP=y
# end of Platform selection

#
# Kernel Features
#

#
# ARM errata workarounds via the alternatives framework
#
CONFIG_ARM64_WORKAROUND_CLEAN_CACHE=y
CONFIG_ARM64_ERRATUM_826319=y
# CONFIG_ARM64_ERRATUM_827319 is not set
# CONFIG_ARM64_ERRATUM_824069 is not set
CONFIG_ARM64_ERRATUM_819472=y
CONFIG_ARM64_ERRATUM_832075=y
CONFIG_ARM64_ERRATUM_834220=y
# CONFIG_ARM64_ERRATUM_1742098 is not set
CONFIG_ARM64_ERRATUM_845719=y
CONFIG_ARM64_ERRATUM_843419=y
CONFIG_ARM64_LD_HAS_FIX_ERRATUM_843419=y
# CONFIG_ARM64_ERRATUM_1024718 is not set
CONFIG_ARM64_ERRATUM_1418040=y
CONFIG_ARM64_WORKAROUND_SPECULATIVE_AT=y
CONFIG_ARM64_ERRATUM_1165522=y
CONFIG_ARM64_ERRATUM_1319367=y
CONFIG_ARM64_ERRATUM_1530923=y
# CONFIG_ARM64_ERRATUM_1286807 is not set
# CONFIG_ARM64_ERRATUM_1463225 is not set
CONFIG_ARM64_ERRATUM_1542419=y
# CONFIG_ARM64_ERRATUM_1508412 is not set
CONFIG_ARM64_ERRATUM_2051678=y
# CONFIG_ARM64_ERRATUM_2077057 is not set
# CONFIG_ARM64_ERRATUM_2054223 is not set
# CONFIG_ARM64_ERRATUM_2067961 is not set
# CONFIG_ARM64_ERRATUM_2441009 is not set
# CONFIG_CAVIUM_ERRATUM_22375 is not set
CONFIG_CAVIUM_ERRATUM_23154=y
# CONFIG_CAVIUM_ERRATUM_27456 is not set
CONFIG_CAVIUM_ERRATUM_30115=y
CONFIG_CAVIUM_TX2_ERRATUM_219=y
CONFIG_FUJITSU_ERRATUM_010001=y
CONFIG_HISILICON_ERRATUM_161600802=y
CONFIG_QCOM_FALKOR_ERRATUM_1003=y
# CONFIG_QCOM_FALKOR_ERRATUM_1009 is not set
CONFIG_QCOM_QDF2400_ERRATUM_0065=y
CONFIG_QCOM_FALKOR_ERRATUM_E1041=y
# CONFIG_NVIDIA_CARMEL_CNP_ERRATUM is not set
# CONFIG_SOCIONEXT_SYNQUACER_PREITS is not set
# end of ARM errata workarounds via the alternatives framework

# CONFIG_ARM64_4K_PAGES is not set
CONFIG_ARM64_16K_PAGES=y
# CONFIG_ARM64_64K_PAGES is not set
CONFIG_ARM64_VA_BITS_36=y
# CONFIG_ARM64_VA_BITS_47 is not set
# CONFIG_ARM64_VA_BITS_48 is not set
CONFIG_ARM64_VA_BITS=36
CONFIG_ARM64_PA_BITS_48=y
CONFIG_ARM64_PA_BITS=48
# CONFIG_CPU_BIG_ENDIAN is not set
CONFIG_CPU_LITTLE_ENDIAN=y
CONFIG_SCHED_MC=y
# CONFIG_SCHED_CLUSTER is not set
CONFIG_SCHED_SMT=y
CONFIG_NR_CPUS=256
CONFIG_HOTPLUG_CPU=y
# CONFIG_NUMA is not set
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
CONFIG_SCHED_HRTICK=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_CC_HAVE_SHADOW_CALL_STACK=y
CONFIG_PARAVIRT=y
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_KEXEC=y
# CONFIG_KEXEC_FILE is not set
CONFIG_CRASH_DUMP=y
CONFIG_TRANS_TABLE=y
# CONFIG_XEN is not set
CONFIG_FORCE_MAX_ZONEORDER=12
CONFIG_UNMAP_KERNEL_AT_EL0=y
CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY=y
CONFIG_RODATA_FULL_DEFAULT_ENABLED=y
CONFIG_ARM64_SW_TTBR0_PAN=y
CONFIG_ARM64_TAGGED_ADDR_ABI=y
CONFIG_COMPAT=y
# CONFIG_KUSER_HELPERS is not set
# CONFIG_COMPAT_VDSO is not set

#
# ARMv8.1 architectural features
#
# CONFIG_ARM64_HW_AFDBM is not set
CONFIG_ARM64_PAN=y
CONFIG_AS_HAS_LDAPR=y
CONFIG_AS_HAS_LSE_ATOMICS=y
CONFIG_ARM64_LSE_ATOMICS=y
CONFIG_ARM64_USE_LSE_ATOMICS=y
# end of ARMv8.1 architectural features

#
# ARMv8.2 architectural features
#
CONFIG_AS_HAS_ARMV8_2=y
CONFIG_AS_HAS_SHA3=y
CONFIG_ARM64_PMEM=y
CONFIG_ARM64_RAS_EXTN=y
# CONFIG_ARM64_CNP is not set
# end of ARMv8.2 architectural features

#
# ARMv8.3 architectural features
#
CONFIG_ARM64_PTR_AUTH=y
# CONFIG_ARM64_PTR_AUTH_KERNEL is not set
CONFIG_CC_HAS_BRANCH_PROT_PAC_RET=y
CONFIG_CC_HAS_SIGN_RETURN_ADDRESS=y
CONFIG_AS_HAS_PAC=y
CONFIG_AS_HAS_CFI_NEGATE_RA_STATE=y
# end of ARMv8.3 architectural features

#
# ARMv8.4 architectural features
#
# CONFIG_ARM64_AMU_EXTN is not set
CONFIG_AS_HAS_ARMV8_4=y
# CONFIG_ARM64_TLB_RANGE is not set
# end of ARMv8.4 architectural features

#
# ARMv8.5 architectural features
#
CONFIG_AS_HAS_ARMV8_5=y
# CONFIG_ARM64_BTI is not set
CONFIG_CC_HAS_BRANCH_PROT_PAC_RET_BTI=y
# CONFIG_ARM64_E0PD is not set
CONFIG_ARM64_AS_HAS_MTE=y
# CONFIG_ARM64_MTE is not set
# end of ARMv8.5 architectural features

#
# ARMv8.7 architectural features
#
# CONFIG_ARM64_EPAN is not set
# end of ARMv8.7 architectural features

# CONFIG_ARM64_SVE is not set
CONFIG_ARM64_MODULE_PLTS=y
# CONFIG_ARM64_PSEUDO_NMI is not set
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_CC_HAVE_STACKPROTECTOR_SYSREG=y
CONFIG_STACKPROTECTOR_PER_TASK=y
CONFIG_ARCH_NR_GPIO=2048
# end of Kernel Features

#
# Boot options
#
CONFIG_CMDLINE=""
# CONFIG_EFI is not set
# end of Boot options

#
# Power management options
#
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
# CONFIG_SUSPEND_SKIP_SYNC is not set
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
CONFIG_PM_AUTOSLEEP=y
CONFIG_PM_USERSPACE_AUTOSLEEP=y
CONFIG_PM_WAKELOCKS=y
CONFIG_PM_WAKELOCKS_LIMIT=100
CONFIG_PM_WAKELOCKS_GC=y
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_CLK=y
CONFIG_PM_GENERIC_DOMAINS=y
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
CONFIG_PM_GENERIC_DOMAINS_SLEEP=y
CONFIG_PM_GENERIC_DOMAINS_OF=y
CONFIG_CPU_PM=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
# end of Power management options

#
# CPU Power Management
#

#
# CPU Idle
#
# CONFIG_CPU_IDLE is not set
# end of CPU Idle

#
# CPU Frequency scaling
#
# CONFIG_CPU_FREQ is not set
# end of CPU Frequency scaling
# end of CPU Power Management

CONFIG_IRQ_BYPASS_MANAGER=y
CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_VCPU_RUN_PID_CHANGE=y
CONFIG_KVM_XFER_TO_GUEST_WORK=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=y
# CONFIG_NVHE_EL2_DEBUG is not set
CONFIG_ARM64_CRYPTO=y
CONFIG_CRYPTO_SHA256_ARM64=m
# CONFIG_CRYPTO_SHA512_ARM64 is not set
CONFIG_CRYPTO_SHA1_ARM64_CE=y
CONFIG_CRYPTO_SHA2_ARM64_CE=m
# CONFIG_CRYPTO_SHA512_ARM64_CE is not set
# CONFIG_CRYPTO_SHA3_ARM64 is not set
CONFIG_CRYPTO_SM3_ARM64_CE=y
# CONFIG_CRYPTO_SM4_ARM64_CE is not set
# CONFIG_CRYPTO_SM4_ARM64_CE_BLK is not set
# CONFIG_CRYPTO_SM4_ARM64_NEON_BLK is not set
# CONFIG_CRYPTO_GHASH_ARM64_CE is not set
CONFIG_CRYPTO_POLYVAL_ARM64_CE=y
CONFIG_CRYPTO_CRCT10DIF_ARM64_CE=m
CONFIG_CRYPTO_AES_ARM64=y
CONFIG_CRYPTO_AES_ARM64_CE=y
CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
# CONFIG_CRYPTO_AES_ARM64_CE_BLK is not set
CONFIG_CRYPTO_AES_ARM64_NEON_BLK=m
CONFIG_CRYPTO_CHACHA20_NEON=m
CONFIG_CRYPTO_POLY1305_NEON=m
# CONFIG_CRYPTO_NHPOLY1305_NEON is not set
# CONFIG_CRYPTO_AES_ARM64_BS is not set

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
# CONFIG_KPROBES is not set
CONFIG_JUMP_LABEL=y
CONFIG_STATIC_KEYS_SELFTEST=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_GENERIC_IDLE_POLL_SETUP=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_KEEPINITRD=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR_STRONG is not set
CONFIG_ARCH_SUPPORTS_SHADOW_CALL_STACK=y
# CONFIG_SHADOW_CALL_STACK is not set
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_ARCH_SUPPORTS_CFI_CLANG=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_ARCH_MMAP_RND_BITS=16
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=9
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
# CONFIG_COMPAT_32BIT_TIME is not set
CONFIG_HAVE_ARCH_VMAP_STACK=y
# CONFIG_VMAP_STACK is not set
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_COMPILER_H=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_LOCK_EVENT_COUNTS=y
CONFIG_ARCH_HAS_RELR=y
CONFIG_RELR=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_KEY=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
CONFIG_ARCH_HAVE_TRACE_MMIO_ACCESS=y

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
CONFIG_MODULE_FORCE_UNLOAD=y
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
CONFIG_MODVERSIONS=y
CONFIG_ASM_MODVERSIONS=y
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
CONFIG_MODULE_SIG_FORCE=y
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
CONFIG_MODULE_SIG_SHA224=y
# CONFIG_MODULE_SIG_SHA256 is not set
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha224"
# CONFIG_MODULE_COMPRESS_NONE is not set
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
CONFIG_MODULE_COMPRESS_ZSTD=y
CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
# CONFIG_BLOCK is not set
CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
# CONFIG_BINFMT_ELF is not set
CONFIG_ARCH_BINFMT_ELF_STATE=y
CONFIG_ARCH_BINFMT_ELF_EXTRA_PHDRS=y
CONFIG_ARCH_HAVE_ELF_PROT=y
CONFIG_ARCH_USE_GNU_PROPERTY=y
# CONFIG_BINFMT_SCRIPT is not set
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#

#
# SLAB allocator options
#
CONFIG_SLAB=y
# CONFIG_SLUB is not set
# CONFIG_SLOB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
# CONFIG_COMPAT_BRK is not set
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_ARCH_KEEP_MEMBLOCK=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
# CONFIG_MEMORY_HOTPLUG is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_COMPACTION=y
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=7
CONFIG_GENERIC_EARLY_IOREMAP=y
# CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ARCH_HAS_ZONE_DMA_SET=y
# CONFIG_ZONE_DMA is not set
CONFIG_ZONE_DMA32=y
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_PERCPU_STATS=y
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_SECRETMEM=y
CONFIG_USERFAULTFD=y
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

# CONFIG_NET is not set

#
# Device Drivers
#
CONFIG_ARM_AMBA=y
CONFIG_TEGRA_AHB=y
CONFIG_HAVE_PCI=y
# CONFIG_PCI is not set
CONFIG_PCCARD=y
CONFIG_PCMCIA=m
# CONFIG_PCMCIA_LOAD_CIS is not set

#
# PC-card bridges
#

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
# CONFIG_DEVTMPFS_SAFE is not set
# CONFIG_STANDALONE is not set
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
CONFIG_FW_LOADER_COMPRESS=y
CONFIG_FW_LOADER_COMPRESS_XZ=y
# CONFIG_FW_LOADER_COMPRESS_ZSTD is not set
# CONFIG_FW_CACHE is not set
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
CONFIG_TEST_ASYNC_DRIVER_PROBE=m
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=m
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_I3C=y
CONFIG_REGMAP_SPI_AVMM=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
CONFIG_GENERIC_ARCH_TOPOLOGY=y
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_ARM_INTEGRATOR_LM=y
CONFIG_BRCMSTB_GISB_ARB=y
CONFIG_BT1_APB=y
# CONFIG_BT1_AXI is not set
CONFIG_MOXTET=m
CONFIG_HISILICON_LPC=y
CONFIG_INTEL_IXP4XX_EB=y
# CONFIG_QCOM_EBI2 is not set
# CONFIG_QCOM_SSC_BLOCK_BUS is not set
# CONFIG_SUN50I_DE2_BUS is not set
CONFIG_SUNXI_RSB=m
CONFIG_TEGRA_ACONNECT=y
CONFIG_TEGRA_GMI=m
CONFIG_UNIPHIER_SYSTEM_BUS=y
# CONFIG_VEXPRESS_CONFIG is not set
CONFIG_FSL_MC_BUS=y
# CONFIG_FSL_MC_UAPI_SUPPORT is not set
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
CONFIG_ARM_SCMI_PROTOCOL=y
CONFIG_ARM_SCMI_HAVE_TRANSPORT=y
CONFIG_ARM_SCMI_HAVE_SHMEM=y
# CONFIG_ARM_SCMI_TRANSPORT_MAILBOX is not set
CONFIG_ARM_SCMI_TRANSPORT_SMC=y
# CONFIG_ARM_SCMI_TRANSPORT_SMC_ATOMIC_ENABLE is not set
# CONFIG_ARM_SCMI_TRANSPORT_VIRTIO is not set
CONFIG_ARM_SCMI_POWER_DOMAIN=y
CONFIG_ARM_SCMI_POWER_CONTROL=m
# end of ARM System Control and Management Interface Protocol

# CONFIG_ARM_SCPI_PROTOCOL is not set
CONFIG_ARM_SCPI_POWER_DOMAIN=m
# CONFIG_FIRMWARE_MEMMAP is not set
CONFIG_INTEL_STRATIX10_SERVICE=y
# CONFIG_INTEL_STRATIX10_RSU is not set
CONFIG_MTK_ADSP_IPC=m
CONFIG_QCOM_SCM=y
CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT=y
CONFIG_TURRIS_MOX_RWTM=m
# CONFIG_ARM_FFA_TRANSPORT is not set
CONFIG_BCM47XX_NVRAM=y
# CONFIG_BCM47XX_SPROM is not set
# CONFIG_TEE_BNXT_FW is not set
# CONFIG_GOOGLE_FIRMWARE is not set
# CONFIG_IMX_DSP is not set
# CONFIG_IMX_SCU is not set
CONFIG_ARM_PSCI_FW=y
CONFIG_HAVE_ARM_SMCCC=y
CONFIG_HAVE_ARM_SMCCC_DISCOVERY=y
# CONFIG_ARM_SMCCC_SOC_ID is not set

#
# Tegra firmware driver
#
CONFIG_TEGRA_IVC=y
CONFIG_TEGRA_BPMP=y
# end of Tegra firmware driver

#
# Zynq MPSoC Firmware Drivers
#
# CONFIG_ZYNQMP_FIRMWARE is not set
# end of Zynq MPSoC Firmware Drivers
# end of Firmware Drivers

CONFIG_GNSS=y
# CONFIG_GNSS_MTK_SERIAL is not set
# CONFIG_GNSS_SIRF_SERIAL is not set
# CONFIG_GNSS_UBX_SERIAL is not set
CONFIG_GNSS_USB=m
CONFIG_MTD=m
CONFIG_MTD_TESTS=m

#
# Partition parsers
#
CONFIG_MTD_AR7_PARTS=m
CONFIG_MTD_BCM63XX_PARTS=y
CONFIG_MTD_CMDLINE_PARTS=m
CONFIG_MTD_OF_PARTS=m
CONFIG_MTD_OF_PARTS_BCM4908=y
# CONFIG_MTD_OF_PARTS_LINKSYS_NS is not set
CONFIG_MTD_PARSER_IMAGETAG=m
# CONFIG_MTD_AFS_PARTS is not set
CONFIG_MTD_PARSER_TRX=m
# CONFIG_MTD_SHARPSL_PARTS is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_OOPS=m
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=m
CONFIG_MTD_JEDECPROBE=m
CONFIG_MTD_GEN_PROBE=m
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_INTELEXT=m
CONFIG_MTD_CFI_AMDSTD=m
CONFIG_MTD_CFI_STAA=m
CONFIG_MTD_CFI_UTIL=m
CONFIG_MTD_RAM=m
CONFIG_MTD_ROM=m
CONFIG_MTD_ABSENT=m
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
# CONFIG_MTD_PHYSMAP is not set
CONFIG_MTD_SC520CDP=m
CONFIG_MTD_NETSC520=m
CONFIG_MTD_TS5500=m
CONFIG_MTD_PCMCIA=m
# CONFIG_MTD_PCMCIA_ANONYMOUS is not set
CONFIG_MTD_PLATRAM=m
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_DATAFLASH is not set
# CONFIG_MTD_MCHP23K256 is not set
CONFIG_MTD_MCHP48L640=m
CONFIG_MTD_SPEAR_SMI=m
CONFIG_MTD_SST25L=m
CONFIG_MTD_SLRAM=m
# CONFIG_MTD_PHRAM is not set
CONFIG_MTD_MTDRAM=m
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOCG3 is not set
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=m
CONFIG_MTD_ONENAND=m
CONFIG_MTD_ONENAND_VERIFY_WRITE=y
CONFIG_MTD_ONENAND_GENERIC=m
CONFIG_MTD_ONENAND_SAMSUNG=m
CONFIG_MTD_ONENAND_OTP=y
# CONFIG_MTD_ONENAND_2X_PROGRAM is not set
CONFIG_MTD_RAW_NAND=m

#
# Raw/parallel NAND flash controllers
#
CONFIG_MTD_NAND_DENALI=m
CONFIG_MTD_NAND_DENALI_DT=m
CONFIG_MTD_NAND_AMS_DELTA=m
# CONFIG_MTD_NAND_SHARPSL is not set
CONFIG_MTD_NAND_ATMEL=m
CONFIG_MTD_NAND_MARVELL=m
CONFIG_MTD_NAND_SLC_LPC32XX=m
# CONFIG_MTD_NAND_MLC_LPC32XX is not set
# CONFIG_MTD_NAND_BRCMNAND is not set
CONFIG_MTD_NAND_BCM47XXNFLASH=m
CONFIG_MTD_NAND_OXNAS=m
CONFIG_MTD_NAND_FSL_IFC=m
CONFIG_MTD_NAND_VF610_NFC=m
# CONFIG_MTD_NAND_MXC is not set
CONFIG_MTD_NAND_SH_FLCTL=m
# CONFIG_MTD_NAND_DAVINCI is not set
# CONFIG_MTD_NAND_TXX9NDFMC is not set
# CONFIG_MTD_NAND_FSMC is not set
# CONFIG_MTD_NAND_SUNXI is not set
# CONFIG_MTD_NAND_HISI504 is not set
CONFIG_MTD_NAND_QCOM=m
CONFIG_MTD_NAND_MTK=m
CONFIG_MTD_NAND_MXIC=m
CONFIG_MTD_NAND_TEGRA=m
CONFIG_MTD_NAND_STM32_FMC2=m
CONFIG_MTD_NAND_MESON=m
CONFIG_MTD_NAND_GPIO=m
CONFIG_MTD_NAND_PLATFORM=m
CONFIG_MTD_NAND_CADENCE=m
CONFIG_MTD_NAND_ARASAN=m
# CONFIG_MTD_NAND_INTEL_LGM is not set
CONFIG_MTD_NAND_PL35X=m
CONFIG_MTD_NAND_RENESAS=m

#
# Misc
#
CONFIG_MTD_NAND_NANDSIM=m
# CONFIG_MTD_NAND_DISKONCHIP is not set
CONFIG_MTD_SPI_NAND=m

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=y
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
# CONFIG_MTD_NAND_ECC_MXIC is not set
CONFIG_MTD_NAND_ECC_MEDIATEK=m
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
# CONFIG_MTD_LPDDR is not set
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_SPI_NOR=m
CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=y
# CONFIG_MTD_SPI_NOR_SWP_DISABLE is not set
CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE=y
# CONFIG_MTD_SPI_NOR_SWP_KEEP is not set
# CONFIG_SPI_HISI_SFC is not set
CONFIG_SPI_NXP_SPIFI=m
# CONFIG_MTD_UBI is not set
CONFIG_MTD_HYPERBUS=m
# CONFIG_HBMC_AM654 is not set
CONFIG_DTC=y
CONFIG_OF=y
CONFIG_OF_UNITTEST=y
# CONFIG_OF_ALL_DTBS is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_RESERVED_MEM=y
CONFIG_OF_RESOLVE=y
CONFIG_OF_OVERLAY=y
# CONFIG_PARPORT is not set

#
# NVME Support
#
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
CONFIG_ICS932S401=m
CONFIG_ATMEL_SSC=m
CONFIG_ENCLOSURE_SERVICES=m
CONFIG_GEHC_ACHC=m
# CONFIG_HI6421V600_IRQ is not set
CONFIG_QCOM_COINCELL=m
CONFIG_QCOM_FASTRPC=m
CONFIG_APDS9802ALS=m
# CONFIG_ISL29003 is not set
CONFIG_ISL29020=y
# CONFIG_SENSORS_TSL2550 is not set
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=y
CONFIG_HMC6352=m
CONFIG_DS1682=m
CONFIG_LATTICE_ECP3_CONFIG=y
CONFIG_SRAM=y
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=m
CONFIG_HISI_HIKEY_USB=y
CONFIG_OPEN_DICE=y
# CONFIG_VCPU_STALL_DETECTOR is not set
CONFIG_C2PORT=y

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_AT25=y
CONFIG_EEPROM_LEGACY=y
# CONFIG_EEPROM_MAX6875 is not set
# CONFIG_EEPROM_93CX6 is not set
# CONFIG_EEPROM_93XX46 is not set
CONFIG_EEPROM_IDT_89HPESX=m
CONFIG_EEPROM_EE1004=m
# end of EEPROM support

#
# Texas Instruments shared transport line discipline
#
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_SPI=y
CONFIG_SENSORS_LIS3_I2C=y
# CONFIG_ALTERA_STAPL is not set
CONFIG_ECHO=y
CONFIG_MISC_RTSX_USB=m
CONFIG_UACCE=y
CONFIG_PVPANIC=y
CONFIG_PVPANIC_MMIO=m
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# end of SCSI device support

CONFIG_HAVE_PATA_PLATFORM=y

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y
# end of IEEE 1394 (FireWire) support

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_LEDS is not set
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=m
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=m
CONFIG_INPUT_EVBUG=m

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
# CONFIG_INPUT_MOUSE is not set
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_USB_ACECAD=m
# CONFIG_TABLET_USB_AIPTEK is not set
CONFIG_TABLET_USB_HANWANG=y
CONFIG_TABLET_USB_KBTAB=y
CONFIG_TABLET_USB_PEGASUS=y
# CONFIG_TABLET_SERIAL_WACOM4 is not set
CONFIG_INPUT_TOUCHSCREEN=y
CONFIG_TOUCHSCREEN_88PM860X=y
CONFIG_TOUCHSCREEN_ADS7846=m
CONFIG_TOUCHSCREEN_AD7877=y
CONFIG_TOUCHSCREEN_AD7879=m
CONFIG_TOUCHSCREEN_AD7879_I2C=m
# CONFIG_TOUCHSCREEN_AD7879_SPI is not set
CONFIG_TOUCHSCREEN_ADC=m
CONFIG_TOUCHSCREEN_AR1021_I2C=y
# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
# CONFIG_TOUCHSCREEN_BU21013 is not set
CONFIG_TOUCHSCREEN_BU21029=m
CONFIG_TOUCHSCREEN_CHIPONE_ICN8318=m
CONFIG_TOUCHSCREEN_CY8CTMA140=y
CONFIG_TOUCHSCREEN_CY8CTMG110=m
CONFIG_TOUCHSCREEN_CYTTSP_CORE=y
CONFIG_TOUCHSCREEN_CYTTSP_I2C=y
# CONFIG_TOUCHSCREEN_CYTTSP_SPI is not set
# CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
CONFIG_TOUCHSCREEN_DA9052=m
# CONFIG_TOUCHSCREEN_DYNAPRO is not set
CONFIG_TOUCHSCREEN_HAMPSHIRE=y
CONFIG_TOUCHSCREEN_EETI=y
CONFIG_TOUCHSCREEN_EGALAX=y
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=y
CONFIG_TOUCHSCREEN_EXC3000=y
CONFIG_TOUCHSCREEN_FUJITSU=m
CONFIG_TOUCHSCREEN_GOODIX=y
# CONFIG_TOUCHSCREEN_HIDEEP is not set
# CONFIG_TOUCHSCREEN_HYCON_HY46XX is not set
CONFIG_TOUCHSCREEN_ILI210X=m
CONFIG_TOUCHSCREEN_ILITEK=m
CONFIG_TOUCHSCREEN_IPROC=m
# CONFIG_TOUCHSCREEN_S6SY761 is not set
# CONFIG_TOUCHSCREEN_GUNZE is not set
# CONFIG_TOUCHSCREEN_EKTF2127 is not set
CONFIG_TOUCHSCREEN_ELAN=y
# CONFIG_TOUCHSCREEN_ELO is not set
# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
CONFIG_TOUCHSCREEN_WACOM_I2C=y
CONFIG_TOUCHSCREEN_MAX11801=y
# CONFIG_TOUCHSCREEN_MCS5000 is not set
# CONFIG_TOUCHSCREEN_MMS114 is not set
CONFIG_TOUCHSCREEN_MELFAS_MIP4=m
CONFIG_TOUCHSCREEN_MSG2638=y
CONFIG_TOUCHSCREEN_MTOUCH=y
# CONFIG_TOUCHSCREEN_IMAGIS is not set
# CONFIG_TOUCHSCREEN_IMX6UL_TSC is not set
CONFIG_TOUCHSCREEN_INEXIO=y
CONFIG_TOUCHSCREEN_MK712=y
# CONFIG_TOUCHSCREEN_PENMOUNT is not set
# CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
# CONFIG_TOUCHSCREEN_RASPBERRYPI_FW is not set
# CONFIG_TOUCHSCREEN_MIGOR is not set
CONFIG_TOUCHSCREEN_TOUCHRIGHT=m
# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
# CONFIG_TOUCHSCREEN_TI_AM335X_TSC is not set
# CONFIG_TOUCHSCREEN_PIXCIR is not set
# CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
# CONFIG_TOUCHSCREEN_WM831X is not set
CONFIG_TOUCHSCREEN_USB_COMPOSITE=m
# CONFIG_TOUCHSCREEN_MX25 is not set
CONFIG_TOUCHSCREEN_MC13783=m
# CONFIG_TOUCHSCREEN_USB_EGALAX is not set
CONFIG_TOUCHSCREEN_USB_PANJIT=y
# CONFIG_TOUCHSCREEN_USB_3M is not set
CONFIG_TOUCHSCREEN_USB_ITM=y
# CONFIG_TOUCHSCREEN_USB_ETURBO is not set
# CONFIG_TOUCHSCREEN_USB_GUNZE is not set
# CONFIG_TOUCHSCREEN_USB_DMC_TSC10 is not set
CONFIG_TOUCHSCREEN_USB_IRTOUCH=y
CONFIG_TOUCHSCREEN_USB_IDEALTEK=y
# CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH is not set
CONFIG_TOUCHSCREEN_USB_GOTOP=y
CONFIG_TOUCHSCREEN_USB_JASTEC=y
# CONFIG_TOUCHSCREEN_USB_ELO is not set
# CONFIG_TOUCHSCREEN_USB_E2I is not set
# CONFIG_TOUCHSCREEN_USB_ZYTRONIC is not set
# CONFIG_TOUCHSCREEN_USB_ETT_TC45USB is not set
# CONFIG_TOUCHSCREEN_USB_NEXIO is not set
CONFIG_TOUCHSCREEN_USB_EASYTOUCH=y
CONFIG_TOUCHSCREEN_TOUCHIT213=y
CONFIG_TOUCHSCREEN_TS4800=m
# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
CONFIG_TOUCHSCREEN_TSC200X_CORE=y
CONFIG_TOUCHSCREEN_TSC2004=m
CONFIG_TOUCHSCREEN_TSC2005=y
# CONFIG_TOUCHSCREEN_TSC2007 is not set
# CONFIG_TOUCHSCREEN_PCAP is not set
CONFIG_TOUCHSCREEN_RM_TS=y
# CONFIG_TOUCHSCREEN_SILEAD is not set
CONFIG_TOUCHSCREEN_SIS_I2C=m
CONFIG_TOUCHSCREEN_ST1232=m
CONFIG_TOUCHSCREEN_STMFTS=y
# CONFIG_TOUCHSCREEN_SUN4I is not set
CONFIG_TOUCHSCREEN_SURFACE3_SPI=m
CONFIG_TOUCHSCREEN_SX8654=m
CONFIG_TOUCHSCREEN_TPS6507X=y
CONFIG_TOUCHSCREEN_ZET6223=y
CONFIG_TOUCHSCREEN_ZFORCE=m
# CONFIG_TOUCHSCREEN_COLIBRI_VF50 is not set
CONFIG_TOUCHSCREEN_ROHM_BU21023=m
CONFIG_TOUCHSCREEN_IQS5XX=m
# CONFIG_TOUCHSCREEN_ZINITIX is not set
CONFIG_INPUT_MISC=y
CONFIG_INPUT_88PM860X_ONKEY=m
CONFIG_INPUT_AD714X=m
CONFIG_INPUT_AD714X_I2C=m
CONFIG_INPUT_AD714X_SPI=m
# CONFIG_INPUT_ARIEL_PWRBUTTON is not set
CONFIG_INPUT_ATMEL_CAPTOUCH=m
# CONFIG_INPUT_BMA150 is not set
CONFIG_INPUT_E3X0_BUTTON=y
# CONFIG_INPUT_MAX77650_ONKEY is not set
# CONFIG_INPUT_MAX77693_HAPTIC is not set
CONFIG_INPUT_MAX8925_ONKEY=y
# CONFIG_INPUT_MAX8997_HAPTIC is not set
CONFIG_INPUT_MC13783_PWRBUTTON=m
# CONFIG_INPUT_MMA8450 is not set
CONFIG_INPUT_GPIO_BEEPER=y
CONFIG_INPUT_GPIO_DECODER=m
CONFIG_INPUT_GPIO_VIBRA=y
CONFIG_INPUT_ATI_REMOTE2=m
# CONFIG_INPUT_KEYSPAN_REMOTE is not set
CONFIG_INPUT_KXTJ9=m
# CONFIG_INPUT_POWERMATE is not set
CONFIG_INPUT_YEALINK=m
# CONFIG_INPUT_CM109 is not set
CONFIG_INPUT_REGULATOR_HAPTIC=y
# CONFIG_INPUT_RETU_PWRBUTTON is not set
CONFIG_INPUT_TPS65218_PWRBUTTON=y
CONFIG_INPUT_AXP20X_PEK=m
# CONFIG_INPUT_TWL4030_PWRBUTTON is not set
# CONFIG_INPUT_TWL4030_VIBRA is not set
# CONFIG_INPUT_TWL6040_VIBRA is not set
# CONFIG_INPUT_UINPUT is not set
CONFIG_INPUT_PALMAS_PWRBUTTON=y
# CONFIG_INPUT_PCF50633_PMU is not set
CONFIG_INPUT_PCF8574=m
CONFIG_INPUT_PWM_BEEPER=y
CONFIG_INPUT_PWM_VIBRA=y
CONFIG_INPUT_RK805_PWRKEY=m
# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
CONFIG_INPUT_DA7280_HAPTICS=y
# CONFIG_INPUT_DA9052_ONKEY is not set
CONFIG_INPUT_DA9055_ONKEY=y
# CONFIG_INPUT_DA9063_ONKEY is not set
CONFIG_INPUT_WM831X_ON=m
CONFIG_INPUT_PCAP=y
# CONFIG_INPUT_ADXL34X is not set
CONFIG_INPUT_IMS_PCU=m
# CONFIG_INPUT_IQS269A is not set
# CONFIG_INPUT_IQS626A is not set
CONFIG_INPUT_IQS7222=y
# CONFIG_INPUT_CMA3000 is not set
CONFIG_INPUT_DRV260X_HAPTICS=m
# CONFIG_INPUT_DRV2665_HAPTICS is not set
CONFIG_INPUT_DRV2667_HAPTICS=m
CONFIG_INPUT_HISI_POWERKEY=m
CONFIG_INPUT_RAVE_SP_PWRBUTTON=y
# CONFIG_INPUT_SC27XX_VIBRA is not set
CONFIG_INPUT_STPMIC1_ONKEY=y
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=m
CONFIG_RMI4_SMB=y
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
CONFIG_RMI4_F3A=y
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_AMBAKMI=y
# CONFIG_SERIO_LIBPS2 is not set
CONFIG_SERIO_RAW=m
CONFIG_SERIO_ALTERA_PS2=y
CONFIG_SERIO_PS2MULT=y
# CONFIG_SERIO_ARC_PS2 is not set
CONFIG_SERIO_APBPS2=y
# CONFIG_SERIO_OLPC_APSP is not set
CONFIG_SERIO_SUN4I_PS2=m
CONFIG_SERIO_GPIO_PS2=y
CONFIG_USERIO=m
CONFIG_GAMEPORT=m
CONFIG_GAMEPORT_NS558=m
CONFIG_GAMEPORT_L4=m
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
# CONFIG_VT is not set
# CONFIG_UNIX98_PTYS is not set
# CONFIG_LEGACY_PTYS is not set
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_16550A_VARIANTS=y
CONFIG_SERIAL_8250_FINTEK=y
# CONFIG_SERIAL_8250_CONSOLE is not set
CONFIG_SERIAL_8250_CS=m
# CONFIG_SERIAL_8250_MEN_MCB is not set
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
# CONFIG_SERIAL_8250_ASPEED_VUART is not set
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
# CONFIG_SERIAL_8250_RSA is not set
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_BCM2835AUX=y
CONFIG_SERIAL_8250_DW=y
CONFIG_SERIAL_8250_EM=y
CONFIG_SERIAL_8250_IOC3=y
CONFIG_SERIAL_8250_RT288X=y
CONFIG_SERIAL_8250_OMAP=m
CONFIG_SERIAL_8250_LPC18XX=y
# CONFIG_SERIAL_8250_MT6577 is not set
CONFIG_SERIAL_8250_UNIPHIER=y
# CONFIG_SERIAL_8250_INGENIC is not set
CONFIG_SERIAL_8250_PXA=m
CONFIG_SERIAL_8250_TEGRA=m
CONFIG_SERIAL_8250_BCM7271=y
CONFIG_SERIAL_OF_PLATFORM=y

#
# Non-8250 serial port support
#
CONFIG_SERIAL_AMBA_PL010=y
# CONFIG_SERIAL_AMBA_PL010_CONSOLE is not set
CONFIG_SERIAL_AMBA_PL011=m
CONFIG_SERIAL_EARLYCON_ARM_SEMIHOST=y
CONFIG_SERIAL_ATMEL=y
# CONFIG_SERIAL_ATMEL_CONSOLE is not set
CONFIG_SERIAL_ATMEL_PDC=y
# CONFIG_SERIAL_ATMEL_TTYAT is not set
CONFIG_SERIAL_MESON=y
# CONFIG_SERIAL_MESON_CONSOLE is not set
# CONFIG_SERIAL_CLPS711X is not set
# CONFIG_SERIAL_SAMSUNG is not set
# CONFIG_SERIAL_TEGRA is not set
CONFIG_SERIAL_TEGRA_TCU=m
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
CONFIG_SERIAL_IMX=m
# CONFIG_SERIAL_IMX_CONSOLE is not set
# CONFIG_SERIAL_IMX_EARLYCON is not set
CONFIG_SERIAL_UARTLITE=m
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_SH_SCI=m
CONFIG_SERIAL_SH_SCI_NR_UARTS=18
CONFIG_SERIAL_HS_LPC32XX=y
# CONFIG_SERIAL_HS_LPC32XX_CONSOLE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_MSM=m
CONFIG_SERIAL_QCOM_GENI=y
# CONFIG_SERIAL_QCOM_GENI_CONSOLE is not set
# CONFIG_SERIAL_VT8500 is not set
CONFIG_SERIAL_OMAP=y
# CONFIG_SERIAL_OMAP_CONSOLE is not set
# CONFIG_SERIAL_SIFIVE is not set
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
CONFIG_SERIAL_SC16IS7XX_CORE=m
CONFIG_SERIAL_SC16IS7XX=m
CONFIG_SERIAL_SC16IS7XX_I2C=y
# CONFIG_SERIAL_SC16IS7XX_SPI is not set
CONFIG_SERIAL_TIMBERDALE=m
# CONFIG_SERIAL_BCM63XX is not set
CONFIG_SERIAL_ALTERA_JTAGUART=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=y
# CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_MXS_AUART is not set
CONFIG_SERIAL_XILINX_PS_UART=y
# CONFIG_SERIAL_XILINX_PS_UART_CONSOLE is not set
# CONFIG_SERIAL_MPS2_UART is not set
# CONFIG_SERIAL_ARC is not set
CONFIG_SERIAL_FSL_LPUART=m
# CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
# CONFIG_SERIAL_ST_ASC is not set
# CONFIG_SERIAL_MEN_Z135 is not set
# CONFIG_SERIAL_SPRD is not set
CONFIG_SERIAL_STM32=m
CONFIG_SERIAL_MVEBU_UART=y
CONFIG_SERIAL_MVEBU_CONSOLE=y
CONFIG_SERIAL_OWL=m
CONFIG_SERIAL_RDA=y
CONFIG_SERIAL_RDA_CONSOLE=y
CONFIG_SERIAL_MILBEAUT_USIO=y
CONFIG_SERIAL_MILBEAUT_USIO_PORTS=4
CONFIG_SERIAL_MILBEAUT_USIO_CONSOLE=y
CONFIG_SERIAL_LITEUART=m
CONFIG_SERIAL_LITEUART_MAX_PORTS=1
CONFIG_SERIAL_SUNPLUS=m
# CONFIG_SERIAL_SUNPLUS_CONSOLE is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
CONFIG_N_HDLC=m
CONFIG_GOLDFISH_TTY=y
CONFIG_GOLDFISH_TTY_EARLY_CONSOLE=y
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=y
CONFIG_HVC_DCC=y
# CONFIG_HVC_DCC_SERIALIZE_SMP is not set
# CONFIG_RPMSG_TTY is not set
CONFIG_SERIAL_DEV_BUS=y
CONFIG_SERIAL_DEV_CTRL_TTYPORT=y
CONFIG_TTY_PRINTK=m
CONFIG_TTY_PRINTK_LEVEL=6
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
# CONFIG_IPMI_PANIC_STRING is not set
# CONFIG_IPMI_DEVICE_INTERFACE is not set
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_IPMB=m
CONFIG_IPMI_WATCHDOG=m
# CONFIG_IPMI_POWEROFF is not set
CONFIG_IPMI_KCS_BMC=y
CONFIG_ASPEED_KCS_IPMI_BMC=y
CONFIG_NPCM7XX_KCS_IPMI_BMC=y
# CONFIG_IPMI_KCS_BMC_CDEV_IPMI is not set
# CONFIG_IPMI_KCS_BMC_SERIO is not set
# CONFIG_ASPEED_BT_IPMI_BMC is not set
# CONFIG_IPMB_DEVICE_INTERFACE is not set
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=y
CONFIG_HW_RANDOM_ATMEL=m
# CONFIG_HW_RANDOM_BA431 is not set
# CONFIG_HW_RANDOM_BCM2835 is not set
CONFIG_HW_RANDOM_IPROC_RNG200=m
CONFIG_HW_RANDOM_IXP4XX=y
# CONFIG_HW_RANDOM_OMAP is not set
CONFIG_HW_RANDOM_OMAP3_ROM=m
CONFIG_HW_RANDOM_VIRTIO=m
CONFIG_HW_RANDOM_IMX_RNGC=m
CONFIG_HW_RANDOM_NOMADIK=y
# CONFIG_HW_RANDOM_HISI is not set
CONFIG_HW_RANDOM_STM32=y
# CONFIG_HW_RANDOM_MESON is not set
# CONFIG_HW_RANDOM_MTK is not set
CONFIG_HW_RANDOM_EXYNOS=y
CONFIG_HW_RANDOM_NPCM=m
# CONFIG_HW_RANDOM_KEYSTONE is not set
# CONFIG_HW_RANDOM_CCTRNG is not set
# CONFIG_HW_RANDOM_XIPHERA is not set
# CONFIG_HW_RANDOM_ARM_SMCCC_TRNG is not set

#
# PCMCIA character devices
#
CONFIG_SYNCLINK_CS=m
CONFIG_CARDMAN_4000=m
CONFIG_CARDMAN_4040=m
CONFIG_SCR24X=m
# end of PCMCIA character devices

CONFIG_DEVMEM=y
CONFIG_TCG_TPM=m
# CONFIG_HW_RANDOM_TPM is not set
CONFIG_TCG_TIS_CORE=m
CONFIG_TCG_TIS=m
# CONFIG_TCG_TIS_SPI is not set
CONFIG_TCG_TIS_I2C=m
CONFIG_TCG_TIS_SYNQUACER=m
CONFIG_TCG_TIS_I2C_CR50=m
# CONFIG_TCG_TIS_I2C_ATMEL is not set
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_VTPM_PROXY=m
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
CONFIG_TCG_TIS_ST33ZP24_SPI=m
CONFIG_XILLYBUS_CLASS=m
# CONFIG_XILLYBUS is not set
CONFIG_XILLYUSB=m
CONFIG_RANDOM_TRUST_CPU=y
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
# CONFIG_I2C_CHARDEV is not set
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
CONFIG_I2C_MUX_GPIO=m
CONFIG_I2C_MUX_GPMUX=y
CONFIG_I2C_MUX_LTC4306=y
# CONFIG_I2C_MUX_PCA9541 is not set
CONFIG_I2C_MUX_PCA954x=m
CONFIG_I2C_MUX_PINCTRL=m
CONFIG_I2C_MUX_REG=m
# CONFIG_I2C_DEMUX_PINCTRL is not set
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y

#
# I2C Hardware Bus support
#
CONFIG_I2C_HIX5HD2=y

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ALTERA is not set
CONFIG_I2C_ASPEED=y
CONFIG_I2C_AT91=m
CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL=m
# CONFIG_I2C_AXXIA is not set
# CONFIG_I2C_BCM2835 is not set
CONFIG_I2C_BCM_IPROC=y
# CONFIG_I2C_BCM_KONA is not set
# CONFIG_I2C_BRCMSTB is not set
# CONFIG_I2C_CADENCE is not set
CONFIG_I2C_CBUS_GPIO=y
CONFIG_I2C_DAVINCI=y
# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
# CONFIG_I2C_DIGICOLOR is not set
# CONFIG_I2C_EMEV2 is not set
CONFIG_I2C_EXYNOS5=m
CONFIG_I2C_GPIO=m
# CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
# CONFIG_I2C_HIGHLANDER is not set
CONFIG_I2C_HISI=y
CONFIG_I2C_IMG=y
CONFIG_I2C_IMX=m
CONFIG_I2C_IMX_LPI2C=m
CONFIG_I2C_IOP3XX=y
CONFIG_I2C_JZ4780=y
# CONFIG_I2C_KEMPLD is not set
CONFIG_I2C_LPC2K=m
CONFIG_I2C_MLXBF=y
CONFIG_I2C_MESON=y
CONFIG_I2C_MICROCHIP_CORE=y
CONFIG_I2C_MT65XX=m
CONFIG_I2C_MT7621=m
CONFIG_I2C_MV64XXX=m
CONFIG_I2C_MXS=y
CONFIG_I2C_NOMADIK=m
# CONFIG_I2C_NPCM is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_OMAP=m
# CONFIG_I2C_OWL is not set
# CONFIG_I2C_APPLE is not set
# CONFIG_I2C_PCA_PLATFORM is not set
CONFIG_I2C_PNX=m
CONFIG_I2C_PXA=y
# CONFIG_I2C_PXA_SLAVE is not set
# CONFIG_I2C_QCOM_CCI is not set
CONFIG_I2C_QCOM_GENI=m
CONFIG_I2C_QUP=y
CONFIG_I2C_RIIC=y
CONFIG_I2C_RK3X=m
# CONFIG_I2C_RZV2M is not set
CONFIG_I2C_S3C2410=y
# CONFIG_I2C_SH_MOBILE is not set
CONFIG_I2C_SIMTEC=y
CONFIG_I2C_SPRD=m
# CONFIG_I2C_ST is not set
# CONFIG_I2C_STM32F4 is not set
CONFIG_I2C_STM32F7=y
CONFIG_I2C_SUN6I_P2WI=y
# CONFIG_I2C_SYNQUACER is not set
CONFIG_I2C_TEGRA=m
# CONFIG_I2C_TEGRA_BPMP is not set
# CONFIG_I2C_UNIPHIER is not set
# CONFIG_I2C_UNIPHIER_F is not set
# CONFIG_I2C_VERSATILE is not set
CONFIG_I2C_WMT=m
# CONFIG_I2C_XILINX is not set
CONFIG_I2C_XLP9XX=m
CONFIG_I2C_RCAR=y

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=m
CONFIG_I2C_DLN2=y
# CONFIG_I2C_CP2615 is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
# CONFIG_I2C_CROS_EC_TUNNEL is not set
CONFIG_I2C_VIRTIO=y
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=m
CONFIG_I2C_SLAVE_TESTUNIT=y
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=y
CONFIG_CDNS_I3C_MASTER=m
CONFIG_DW_I3C_MASTER=y
CONFIG_SVC_I3C_MASTER=m
CONFIG_MIPI_I3C_HCI=y
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
CONFIG_SPI_MEM=y

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
CONFIG_SPI_ALTERA_CORE=y
# CONFIG_SPI_ALTERA_DFL is not set
# CONFIG_SPI_AR934X is not set
# CONFIG_SPI_ATH79 is not set
CONFIG_SPI_ARMADA_3700=y
CONFIG_SPI_ASPEED_SMC=y
# CONFIG_SPI_ATMEL is not set
# CONFIG_SPI_AT91_USART is not set
# CONFIG_SPI_ATMEL_QUADSPI is not set
CONFIG_SPI_AXI_SPI_ENGINE=m
CONFIG_SPI_BCM2835=m
CONFIG_SPI_BCM2835AUX=y
CONFIG_SPI_BCM63XX=y
# CONFIG_SPI_BCM63XX_HSSPI is not set
# CONFIG_SPI_BCM_QSPI is not set
CONFIG_SPI_BITBANG=y
# CONFIG_SPI_CADENCE is not set
CONFIG_SPI_CADENCE_QUADSPI=y
CONFIG_SPI_CADENCE_XSPI=m
CONFIG_SPI_CLPS711X=m
# CONFIG_SPI_DESIGNWARE is not set
# CONFIG_SPI_DLN2 is not set
CONFIG_SPI_EP93XX=m
CONFIG_SPI_FSL_LPSPI=y
# CONFIG_SPI_FSL_QUADSPI is not set
CONFIG_SPI_GXP=m
CONFIG_SPI_HISI_KUNPENG=m
CONFIG_SPI_HISI_SFC_V3XX=y
CONFIG_SPI_NXP_FLEXSPI=y
# CONFIG_SPI_GPIO is not set
CONFIG_SPI_IMG_SPFI=y
CONFIG_SPI_IMX=m
CONFIG_SPI_INGENIC=m
CONFIG_SPI_INTEL=m
CONFIG_SPI_INTEL_PLATFORM=m
CONFIG_SPI_JCORE=y
# CONFIG_SPI_LP8841_RTC is not set
CONFIG_SPI_FSL_LIB=y
CONFIG_SPI_FSL_SPI=y
CONFIG_SPI_FSL_DSPI=y
CONFIG_SPI_MESON_SPICC=y
CONFIG_SPI_MESON_SPIFC=m
# CONFIG_SPI_MICROCHIP_CORE is not set
CONFIG_SPI_MT65XX=y
CONFIG_SPI_MT7621=m
# CONFIG_SPI_MTK_NOR is not set
CONFIG_SPI_MTK_SNFI=m
# CONFIG_SPI_NPCM_FIU is not set
CONFIG_SPI_NPCM_PSPI=m
# CONFIG_SPI_LANTIQ_SSC is not set
# CONFIG_SPI_OC_TINY is not set
CONFIG_SPI_OMAP24XX=y
CONFIG_SPI_TI_QSPI=m
# CONFIG_SPI_OMAP_100K is not set
# CONFIG_SPI_ORION is not set
CONFIG_SPI_PIC32=y
CONFIG_SPI_PIC32_SQI=m
# CONFIG_SPI_PL022 is not set
CONFIG_SPI_PXA2XX=m
CONFIG_SPI_ROCKCHIP=m
# CONFIG_SPI_ROCKCHIP_SFC is not set
CONFIG_SPI_RPCIF=m
CONFIG_SPI_RSPI=m
CONFIG_SPI_QCOM_QSPI=m
# CONFIG_SPI_QUP is not set
# CONFIG_SPI_QCOM_GENI is not set
# CONFIG_SPI_S3C64XX is not set
# CONFIG_SPI_SC18IS602 is not set
CONFIG_SPI_SH_MSIOF=y
CONFIG_SPI_SH=m
CONFIG_SPI_SH_HSPI=y
CONFIG_SPI_SIFIVE=y
CONFIG_SPI_SLAVE_MT27XX=y
CONFIG_SPI_SPRD=m
CONFIG_SPI_SPRD_ADI=m
CONFIG_SPI_STM32=m
CONFIG_SPI_STM32_QSPI=y
# CONFIG_SPI_ST_SSC4 is not set
# CONFIG_SPI_SUN4I is not set
CONFIG_SPI_SUN6I=m
CONFIG_SPI_SUNPLUS_SP7021=y
# CONFIG_SPI_SYNQUACER is not set
CONFIG_SPI_MXIC=m
# CONFIG_SPI_TEGRA210_QUAD is not set
CONFIG_SPI_TEGRA114=y
# CONFIG_SPI_TEGRA20_SFLASH is not set
CONFIG_SPI_TEGRA20_SLINK=y
CONFIG_SPI_UNIPHIER=m
# CONFIG_SPI_XCOMM is not set
CONFIG_SPI_XILINX=m
CONFIG_SPI_XLP=y
CONFIG_SPI_XTENSA_XTFPGA=m
# CONFIG_SPI_ZYNQ_QSPI is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set
CONFIG_SPI_AMD=m

#
# SPI Multiplexer support
#
# CONFIG_SPI_MUX is not set

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=m
CONFIG_SPI_LOOPBACK_TEST=m
CONFIG_SPI_TLE62X0=m
CONFIG_SPI_SLAVE=y
# CONFIG_SPI_SLAVE_TIME is not set
# CONFIG_SPI_SLAVE_SYSTEM_CONTROL is not set
CONFIG_SPI_DYNAMIC=y
CONFIG_SPMI=y
CONFIG_SPMI_HISI3670=y
CONFIG_SPMI_MSM_PMIC_ARB=y
CONFIG_SPMI_MTK_PMIF=y
CONFIG_HSI=m
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
CONFIG_HSI_CHAR=m
# CONFIG_PPS is not set

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_AMD is not set
CONFIG_PINCTRL_APPLE_GPIO=m
# CONFIG_PINCTRL_AS3722 is not set
CONFIG_PINCTRL_AT91PIO4=y
# CONFIG_PINCTRL_AXP209 is not set
# CONFIG_PINCTRL_BM1880 is not set
CONFIG_PINCTRL_DA850_PUPD=y
CONFIG_PINCTRL_DA9062=m
# CONFIG_PINCTRL_EQUILIBRIUM is not set
# CONFIG_PINCTRL_INGENIC is not set
CONFIG_PINCTRL_KEEMBAY=m
# CONFIG_PINCTRL_LPC18XX is not set
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_MICROCHIP_SGPIO is not set
CONFIG_PINCTRL_OCELOT=y
CONFIG_PINCTRL_PALMAS=y
CONFIG_PINCTRL_PISTACHIO=y
CONFIG_PINCTRL_RK805=m
CONFIG_PINCTRL_ROCKCHIP=y
CONFIG_PINCTRL_SINGLE=m
CONFIG_PINCTRL_STARFIVE=y
CONFIG_PINCTRL_STMFX=y
CONFIG_PINCTRL_SX150X=y
CONFIG_PINCTRL_THUNDERBAY=m
CONFIG_PINCTRL_OWL=y
# CONFIG_PINCTRL_S500 is not set
CONFIG_PINCTRL_S700=y
CONFIG_PINCTRL_S900=y
CONFIG_PINCTRL_ASPEED=y
# CONFIG_PINCTRL_ASPEED_G4 is not set
CONFIG_PINCTRL_ASPEED_G5=y
# CONFIG_PINCTRL_ASPEED_G6 is not set
CONFIG_PINCTRL_BCM281XX=y
CONFIG_PINCTRL_BCM2835=y
# CONFIG_PINCTRL_BCM4908 is not set
CONFIG_PINCTRL_BCM63XX=y
# CONFIG_PINCTRL_BCM6318 is not set
CONFIG_PINCTRL_BCM6328=y
CONFIG_PINCTRL_BCM6358=y
# CONFIG_PINCTRL_BCM6362 is not set
CONFIG_PINCTRL_BCM6368=y
# CONFIG_PINCTRL_BCM63268 is not set
CONFIG_PINCTRL_IPROC_GPIO=y
CONFIG_PINCTRL_CYGNUS_MUX=y
CONFIG_PINCTRL_NS=y
CONFIG_PINCTRL_NSP_GPIO=y
CONFIG_PINCTRL_NS2_MUX=y
# CONFIG_PINCTRL_NSP_MUX is not set
CONFIG_PINCTRL_BERLIN=y
# CONFIG_PINCTRL_AS370 is not set
CONFIG_PINCTRL_BERLIN_BG4CT=y
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L15=y
CONFIG_PINCTRL_CS47L35=y
CONFIG_PINCTRL_CS47L85=y
CONFIG_PINCTRL_CS47L92=y

#
# Intel pinctrl drivers
#
# end of Intel pinctrl drivers

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
CONFIG_PINCTRL_MTK=y
CONFIG_PINCTRL_MTK_V2=y
CONFIG_PINCTRL_MTK_MOORE=y
CONFIG_PINCTRL_MTK_PARIS=y
CONFIG_PINCTRL_MT2701=y
CONFIG_PINCTRL_MT7623=y
CONFIG_PINCTRL_MT7629=y
# CONFIG_PINCTRL_MT8135 is not set
CONFIG_PINCTRL_MT8127=y
# CONFIG_PINCTRL_MT2712 is not set
CONFIG_PINCTRL_MT6765=m
CONFIG_PINCTRL_MT6779=y
CONFIG_PINCTRL_MT6795=y
CONFIG_PINCTRL_MT6797=y
# CONFIG_PINCTRL_MT7622 is not set
# CONFIG_PINCTRL_MT7986 is not set
# CONFIG_PINCTRL_MT8167 is not set
# CONFIG_PINCTRL_MT8173 is not set
CONFIG_PINCTRL_MT8183=y
CONFIG_PINCTRL_MT8186=y
CONFIG_PINCTRL_MT8192=y
# CONFIG_PINCTRL_MT8195 is not set
# CONFIG_PINCTRL_MT8365 is not set
# CONFIG_PINCTRL_MT8516 is not set
# CONFIG_PINCTRL_MT6397 is not set
# end of MediaTek pinctrl drivers

CONFIG_PINCTRL_MESON=y
CONFIG_PINCTRL_MESON_GXBB=m
CONFIG_PINCTRL_MESON_GXL=y
CONFIG_PINCTRL_MESON8_PMX=y
CONFIG_PINCTRL_MESON_AXG=y
CONFIG_PINCTRL_MESON_AXG_PMX=y
CONFIG_PINCTRL_MESON_G12A=y
CONFIG_PINCTRL_MESON_A1=y
CONFIG_PINCTRL_MESON_S4=m
CONFIG_PINCTRL_MVEBU=y
CONFIG_PINCTRL_ARMADA_AP806=y
CONFIG_PINCTRL_ARMADA_CP110=y
CONFIG_PINCTRL_AC5=y
CONFIG_PINCTRL_ARMADA_37XX=y
CONFIG_PINCTRL_WPCM450=y
CONFIG_PINCTRL_NPCM7XX=y
CONFIG_PINCTRL_PXA=y
# CONFIG_PINCTRL_PXA25X is not set
CONFIG_PINCTRL_PXA27X=m
# CONFIG_PINCTRL_MSM is not set
# CONFIG_PINCTRL_QCOM_SPMI_PMIC is not set
CONFIG_PINCTRL_QCOM_SSBI_PMIC=m
CONFIG_PINCTRL_SC7280_LPASS_LPI=y
CONFIG_PINCTRL_SM8250_LPASS_LPI=m
CONFIG_PINCTRL_LPASS_LPI=y

#
# Renesas pinctrl drivers
#
CONFIG_PINCTRL_RENESAS=y
CONFIG_PINCTRL_SH_PFC=y
CONFIG_PINCTRL_SH_PFC_GPIO=y
CONFIG_PINCTRL_SH_FUNC_GPIO=y
# CONFIG_PINCTRL_PFC_EMEV2 is not set
CONFIG_PINCTRL_PFC_R8A77995=y
# CONFIG_PINCTRL_PFC_R8A7794 is not set
CONFIG_PINCTRL_PFC_R8A77990=y
# CONFIG_PINCTRL_PFC_R8A7779 is not set
# CONFIG_PINCTRL_PFC_R8A7790 is not set
CONFIG_PINCTRL_PFC_R8A77950=y
# CONFIG_PINCTRL_PFC_R8A77951 is not set
CONFIG_PINCTRL_PFC_R8A7778=y
# CONFIG_PINCTRL_PFC_R8A7793 is not set
CONFIG_PINCTRL_PFC_R8A7791=y
CONFIG_PINCTRL_PFC_R8A77965=y
CONFIG_PINCTRL_PFC_R8A77960=y
# CONFIG_PINCTRL_PFC_R8A77961 is not set
CONFIG_PINCTRL_PFC_R8A779F0=y
CONFIG_PINCTRL_PFC_R8A7792=y
CONFIG_PINCTRL_PFC_R8A77980=y
# CONFIG_PINCTRL_PFC_R8A77970 is not set
CONFIG_PINCTRL_PFC_R8A779A0=y
CONFIG_PINCTRL_PFC_R8A779G0=y
# CONFIG_PINCTRL_PFC_R8A7740 is not set
# CONFIG_PINCTRL_PFC_R8A73A4 is not set
CONFIG_PINCTRL_RZA1=y
CONFIG_PINCTRL_RZA2=y
CONFIG_PINCTRL_RZG2L=y
CONFIG_PINCTRL_PFC_R8A77470=y
CONFIG_PINCTRL_PFC_R8A7745=y
# CONFIG_PINCTRL_PFC_R8A7742 is not set
CONFIG_PINCTRL_PFC_R8A7743=y
# CONFIG_PINCTRL_PFC_R8A7744 is not set
CONFIG_PINCTRL_PFC_R8A774C0=y
CONFIG_PINCTRL_PFC_R8A774E1=y
CONFIG_PINCTRL_PFC_R8A774A1=y
CONFIG_PINCTRL_PFC_R8A774B1=y
CONFIG_PINCTRL_RZN1=y
CONFIG_PINCTRL_RZV2M=y
CONFIG_PINCTRL_PFC_SH7203=y
# CONFIG_PINCTRL_PFC_SH7264 is not set
# CONFIG_PINCTRL_PFC_SH7269 is not set
CONFIG_PINCTRL_PFC_SH7720=y
# CONFIG_PINCTRL_PFC_SH7722 is not set
# CONFIG_PINCTRL_PFC_SH7734 is not set
# CONFIG_PINCTRL_PFC_SH7757 is not set
# CONFIG_PINCTRL_PFC_SH7785 is not set
# CONFIG_PINCTRL_PFC_SH7786 is not set
CONFIG_PINCTRL_PFC_SH73A0=y
# CONFIG_PINCTRL_PFC_SH7723 is not set
# CONFIG_PINCTRL_PFC_SH7724 is not set
CONFIG_PINCTRL_PFC_SHX3=y
# end of Renesas pinctrl drivers

CONFIG_PINCTRL_SAMSUNG=y
# CONFIG_PINCTRL_EXYNOS is not set
# CONFIG_PINCTRL_S3C24XX is not set
CONFIG_PINCTRL_S3C64XX=y
# CONFIG_PINCTRL_SPRD_SC9860 is not set
CONFIG_PINCTRL_STM32=y
# CONFIG_PINCTRL_STM32F429 is not set
CONFIG_PINCTRL_STM32F469=y
CONFIG_PINCTRL_STM32F746=y
CONFIG_PINCTRL_STM32F769=y
# CONFIG_PINCTRL_STM32H743 is not set
# CONFIG_PINCTRL_STM32MP135 is not set
# CONFIG_PINCTRL_STM32MP157 is not set
CONFIG_PINCTRL_SUNXI=y
CONFIG_PINCTRL_SUN4I_A10=y
# CONFIG_PINCTRL_SUN5I is not set
CONFIG_PINCTRL_SUN6I_A31=y
# CONFIG_PINCTRL_SUN6I_A31_R is not set
# CONFIG_PINCTRL_SUN8I_A23 is not set
# CONFIG_PINCTRL_SUN8I_A33 is not set
CONFIG_PINCTRL_SUN8I_A83T=y
# CONFIG_PINCTRL_SUN8I_A83T_R is not set
# CONFIG_PINCTRL_SUN8I_A23_R is not set
CONFIG_PINCTRL_SUN8I_H3=y
CONFIG_PINCTRL_SUN8I_H3_R=y
CONFIG_PINCTRL_SUN8I_V3S=y
CONFIG_PINCTRL_SUN9I_A80=y
CONFIG_PINCTRL_SUN9I_A80_R=y
CONFIG_PINCTRL_SUN20I_D1=y
CONFIG_PINCTRL_SUN50I_A64=y
CONFIG_PINCTRL_SUN50I_A64_R=y
# CONFIG_PINCTRL_SUN50I_A100 is not set
# CONFIG_PINCTRL_SUN50I_A100_R is not set
# CONFIG_PINCTRL_SUN50I_H5 is not set
CONFIG_PINCTRL_SUN50I_H6=y
CONFIG_PINCTRL_SUN50I_H6_R=y
# CONFIG_PINCTRL_SUN50I_H616 is not set
CONFIG_PINCTRL_SUN50I_H616_R=y
CONFIG_PINCTRL_TEGRA=y
CONFIG_PINCTRL_TEGRA210=y
CONFIG_PINCTRL_TEGRA194=y
CONFIG_PINCTRL_TEGRA_XUSB=y
# CONFIG_PINCTRL_TI_IODELAY is not set
# CONFIG_PINCTRL_UNIPHIER is not set
# CONFIG_PINCTRL_TMPV7700 is not set
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_74XX_MMIO=y
# CONFIG_GPIO_ALTERA is not set
CONFIG_GPIO_ASPEED=m
# CONFIG_GPIO_ASPEED_SGPIO is not set
CONFIG_GPIO_ATH79=y
CONFIG_GPIO_RASPBERRYPI_EXP=y
CONFIG_GPIO_BCM_KONA=y
# CONFIG_GPIO_BCM_XGS_IPROC is not set
CONFIG_GPIO_BRCMSTB=m
# CONFIG_GPIO_CADENCE is not set
CONFIG_GPIO_CLPS711X=y
CONFIG_GPIO_DWAPB=m
CONFIG_GPIO_EIC_SPRD=y
CONFIG_GPIO_EM=y
# CONFIG_GPIO_FTGPIO010 is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_GRGPIO=y
CONFIG_GPIO_HISI=y
CONFIG_GPIO_HLWD=m
CONFIG_GPIO_IOP=m
CONFIG_GPIO_LOGICVC=y
# CONFIG_GPIO_LPC18XX is not set
CONFIG_GPIO_LPC32XX=m
# CONFIG_GPIO_MB86S7X is not set
CONFIG_GPIO_MENZ127=y
CONFIG_GPIO_MPC8XXX=y
# CONFIG_GPIO_MT7621 is not set
CONFIG_GPIO_MVEBU=y
CONFIG_GPIO_MXC=y
CONFIG_GPIO_MXS=y
# CONFIG_GPIO_PL061 is not set
CONFIG_GPIO_PMIC_EIC_SPRD=m
# CONFIG_GPIO_PXA is not set
CONFIG_GPIO_RCAR=y
CONFIG_GPIO_RDA=y
CONFIG_GPIO_ROCKCHIP=y
# CONFIG_GPIO_SAMA5D2_PIOBU is not set
CONFIG_GPIO_SIFIVE=y
# CONFIG_GPIO_SNPS_CREG is not set
CONFIG_GPIO_SPRD=y
CONFIG_GPIO_STP_XWAY=y
CONFIG_GPIO_SYSCON=y
CONFIG_GPIO_TEGRA=y
CONFIG_GPIO_TEGRA186=y
CONFIG_GPIO_TS4800=m
CONFIG_GPIO_UNIPHIER=m
# CONFIG_GPIO_VISCONTI is not set
# CONFIG_GPIO_WCD934X is not set
CONFIG_GPIO_XGENE=y
# CONFIG_GPIO_XGENE_SB is not set
CONFIG_GPIO_XILINX=m
CONFIG_GPIO_XLP=m
CONFIG_GPIO_ZYNQ=m
# CONFIG_GPIO_AMD_FCH is not set
# CONFIG_GPIO_IDT3243X is not set
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADP5588=y
CONFIG_GPIO_ADP5588_IRQ=y
CONFIG_GPIO_ADNP=m
CONFIG_GPIO_GW_PLD=y
# CONFIG_GPIO_MAX7300 is not set
CONFIG_GPIO_MAX732X=y
CONFIG_GPIO_MAX732X_IRQ=y
CONFIG_GPIO_PCA953X=y
CONFIG_GPIO_PCA953X_IRQ=y
CONFIG_GPIO_PCA9570=m
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
CONFIG_GPIO_TS4900=m
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# CONFIG_GPIO_ADP5520 is not set
# CONFIG_GPIO_ALTERA_A10SR is not set
# CONFIG_GPIO_ARIZONA is not set
CONFIG_GPIO_BD71815=y
# CONFIG_GPIO_BD71828 is not set
CONFIG_GPIO_BD9571MWV=m
CONFIG_GPIO_DA9052=y
# CONFIG_GPIO_DA9055 is not set
# CONFIG_GPIO_DLN2 is not set
CONFIG_GPIO_KEMPLD=m
# CONFIG_GPIO_LP3943 is not set
# CONFIG_GPIO_MADERA is not set
CONFIG_GPIO_MAX77650=m
CONFIG_GPIO_PALMAS=y
CONFIG_GPIO_SL28CPLD=y
# CONFIG_GPIO_TPS65910 is not set
# CONFIG_GPIO_TPS65912 is not set
CONFIG_GPIO_TWL4030=m
CONFIG_GPIO_TWL6040=y
# CONFIG_GPIO_WM831X is not set
# CONFIG_GPIO_WM8994 is not set
# end of MFD GPIO expanders

#
# SPI GPIO expanders
#
CONFIG_GPIO_74X164=m
CONFIG_GPIO_MAX3191X=m
CONFIG_GPIO_MAX7301=y
# CONFIG_GPIO_MC33880 is not set
CONFIG_GPIO_PISOSR=m
CONFIG_GPIO_XRA1403=m
# CONFIG_GPIO_MOXTET is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
CONFIG_GPIO_MOCKUP=m
# CONFIG_GPIO_VIRTIO is not set
CONFIG_GPIO_SIM=y
# end of Virtual GPIO drivers

CONFIG_W1=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_DS2490=y
# CONFIG_W1_MASTER_DS2482 is not set
CONFIG_W1_MASTER_MXC=m
CONFIG_W1_MASTER_DS1WM=y
CONFIG_W1_MASTER_GPIO=m
CONFIG_W1_MASTER_SGI=y
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=m
CONFIG_W1_SLAVE_SMEM=m
# CONFIG_W1_SLAVE_DS2405 is not set
CONFIG_W1_SLAVE_DS2408=m
CONFIG_W1_SLAVE_DS2408_READBACK=y
CONFIG_W1_SLAVE_DS2413=y
# CONFIG_W1_SLAVE_DS2406 is not set
# CONFIG_W1_SLAVE_DS2423 is not set
CONFIG_W1_SLAVE_DS2805=y
CONFIG_W1_SLAVE_DS2430=y
CONFIG_W1_SLAVE_DS2431=m
# CONFIG_W1_SLAVE_DS2433 is not set
# CONFIG_W1_SLAVE_DS2438 is not set
# CONFIG_W1_SLAVE_DS250X is not set
# CONFIG_W1_SLAVE_DS2780 is not set
CONFIG_W1_SLAVE_DS2781=m
# CONFIG_W1_SLAVE_DS28E04 is not set
CONFIG_W1_SLAVE_DS28E17=m
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_AS3722 is not set
# CONFIG_POWER_RESET_BRCMKONA is not set
CONFIG_POWER_RESET_BRCMSTB=y
# CONFIG_POWER_RESET_GEMINI_POWEROFF is not set
# CONFIG_POWER_RESET_GPIO is not set
# CONFIG_POWER_RESET_GPIO_RESTART is not set
# CONFIG_POWER_RESET_HISI is not set
CONFIG_POWER_RESET_MSM=y
CONFIG_POWER_RESET_OCELOT_RESET=y
# CONFIG_POWER_RESET_LTC2952 is not set
# CONFIG_POWER_RESET_REGULATOR is not set
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_RESET_XGENE=y
# CONFIG_POWER_RESET_KEYSTONE is not set
CONFIG_POWER_RESET_SYSCON=y
CONFIG_POWER_RESET_SYSCON_POWEROFF=y
CONFIG_POWER_RESET_RMOBILE=y
CONFIG_REBOOT_MODE=m
CONFIG_SYSCON_REBOOT_MODE=m
CONFIG_POWER_RESET_SC27XX=y
# CONFIG_NVMEM_REBOOT_MODE is not set
CONFIG_POWER_SUPPLY=y
CONFIG_POWER_SUPPLY_DEBUG=y
# CONFIG_POWER_SUPPLY_HWMON is not set
CONFIG_PDA_POWER=y
# CONFIG_GENERIC_ADC_BATTERY is not set
CONFIG_IP5XXX_POWER=m
CONFIG_MAX8925_POWER=y
# CONFIG_WM831X_BACKUP is not set
CONFIG_WM831X_POWER=y
CONFIG_TEST_POWER=y
CONFIG_BATTERY_88PM860X=y
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_ACT8945A is not set
# CONFIG_BATTERY_CW2015 is not set
# CONFIG_BATTERY_DS2760 is not set
# CONFIG_BATTERY_DS2780 is not set
CONFIG_BATTERY_DS2781=m
# CONFIG_BATTERY_DS2782 is not set
CONFIG_BATTERY_LEGO_EV3=m
CONFIG_BATTERY_SAMSUNG_SDI=y
CONFIG_BATTERY_SBS=m
# CONFIG_CHARGER_SBS is not set
CONFIG_MANAGER_SBS=y
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=y
CONFIG_BATTERY_BQ27XXX_HDQ=m
CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=y
CONFIG_BATTERY_DA9052=y
CONFIG_CHARGER_AXP20X=m
# CONFIG_BATTERY_AXP20X is not set
# CONFIG_AXP20X_POWER is not set
CONFIG_BATTERY_MAX17040=y
CONFIG_BATTERY_MAX17042=y
CONFIG_BATTERY_MAX1721X=y
# CONFIG_BATTERY_TWL4030_MADC is not set
# CONFIG_CHARGER_88PM860X is not set
# CONFIG_CHARGER_PCF50633 is not set
CONFIG_BATTERY_RX51=m
# CONFIG_CHARGER_ISP1704 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_TWL4030 is not set
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_GPIO=m
# CONFIG_CHARGER_MANAGER is not set
CONFIG_CHARGER_LT3651=m
CONFIG_CHARGER_LTC4162L=y
# CONFIG_CHARGER_DETECTOR_MAX14656 is not set
# CONFIG_CHARGER_MAX77650 is not set
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_MAX8997 is not set
CONFIG_CHARGER_MP2629=m
CONFIG_CHARGER_MT6360=y
CONFIG_CHARGER_QCOM_SMBB=m
CONFIG_CHARGER_BQ2415X=m
CONFIG_CHARGER_BQ24190=m
CONFIG_CHARGER_BQ24257=y
# CONFIG_CHARGER_BQ24735 is not set
CONFIG_CHARGER_BQ2515X=m
# CONFIG_CHARGER_BQ25890 is not set
CONFIG_CHARGER_BQ25980=m
CONFIG_CHARGER_BQ256XX=y
CONFIG_CHARGER_SMB347=m
CONFIG_CHARGER_TPS65090=y
CONFIG_CHARGER_TPS65217=m
CONFIG_BATTERY_GAUGE_LTC2941=y
CONFIG_BATTERY_GOLDFISH=y
# CONFIG_BATTERY_RT5033 is not set
CONFIG_CHARGER_RT9455=m
# CONFIG_CHARGER_SC2731 is not set
CONFIG_FUEL_GAUGE_SC27XX=m
CONFIG_CHARGER_UCS1002=m
CONFIG_CHARGER_BD99954=m
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
# CONFIG_SENSORS_AD7314 is not set
CONFIG_SENSORS_AD7414=y
# CONFIG_SENSORS_AD7418 is not set
CONFIG_SENSORS_ADM1025=y
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
# CONFIG_SENSORS_ADM9240 is not set
# CONFIG_SENSORS_ADT7310 is not set
# CONFIG_SENSORS_ADT7410 is not set
# CONFIG_SENSORS_ADT7411 is not set
CONFIG_SENSORS_ADT7462=y
CONFIG_SENSORS_ADT7470=y
CONFIG_SENSORS_ADT7475=y
CONFIG_SENSORS_AHT10=m
CONFIG_SENSORS_AS370=y
CONFIG_SENSORS_ASC7621=y
CONFIG_SENSORS_AXI_FAN_CONTROL=m
# CONFIG_SENSORS_ARM_SCMI is not set
# CONFIG_SENSORS_ASB100 is not set
CONFIG_SENSORS_ASPEED=y
CONFIG_SENSORS_ATXP1=y
# CONFIG_SENSORS_BT1_PVT is not set
CONFIG_SENSORS_CORSAIR_CPRO=y
CONFIG_SENSORS_CORSAIR_PSU=y
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=y
CONFIG_SENSORS_DA9052_ADC=m
CONFIG_SENSORS_DA9055=y
# CONFIG_SENSORS_SPARX5 is not set
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=y
CONFIG_SENSORS_F75375S=y
CONFIG_SENSORS_GSC=y
# CONFIG_SENSORS_MC13783_ADC is not set
CONFIG_SENSORS_FSCHMD=y
CONFIG_SENSORS_FTSTEUTATES=y
CONFIG_SENSORS_GL518SM=m
# CONFIG_SENSORS_GL520SM is not set
CONFIG_SENSORS_G760A=m
CONFIG_SENSORS_G762=y
CONFIG_SENSORS_GPIO_FAN=m
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
# CONFIG_SENSORS_IIO_HWMON is not set
# CONFIG_SENSORS_IT87 is not set
CONFIG_SENSORS_JC42=m
CONFIG_SENSORS_POWR1220=y
# CONFIG_SENSORS_LAN966X is not set
# CONFIG_SENSORS_LINEAGE is not set
CONFIG_SENSORS_LTC2945=y
CONFIG_SENSORS_LTC2947=y
CONFIG_SENSORS_LTC2947_I2C=y
# CONFIG_SENSORS_LTC2947_SPI is not set
CONFIG_SENSORS_LTC2990=m
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=m
# CONFIG_SENSORS_LTC4215 is not set
CONFIG_SENSORS_LTC4222=m
CONFIG_SENSORS_LTC4245=y
CONFIG_SENSORS_LTC4260=m
# CONFIG_SENSORS_LTC4261 is not set
# CONFIG_SENSORS_MAX1111 is not set
CONFIG_SENSORS_MAX127=y
CONFIG_SENSORS_MAX16065=m
# CONFIG_SENSORS_MAX1619 is not set
CONFIG_SENSORS_MAX1668=y
# CONFIG_SENSORS_MAX197 is not set
CONFIG_SENSORS_MAX31722=m
CONFIG_SENSORS_MAX31730=m
CONFIG_SENSORS_MAX6620=y
CONFIG_SENSORS_MAX6621=y
# CONFIG_SENSORS_MAX6639 is not set
CONFIG_SENSORS_MAX6650=y
# CONFIG_SENSORS_MAX6697 is not set
# CONFIG_SENSORS_MAX31790 is not set
# CONFIG_SENSORS_MCP3021 is not set
CONFIG_SENSORS_MLXREG_FAN=m
CONFIG_SENSORS_TC654=m
# CONFIG_SENSORS_TPS23861 is not set
CONFIG_SENSORS_MENF21BMC_HWMON=y
CONFIG_SENSORS_MR75203=m
CONFIG_SENSORS_ADCXX=y
CONFIG_SENSORS_LM63=m
CONFIG_SENSORS_LM70=y
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=y
# CONFIG_SENSORS_LM78 is not set
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=y
# CONFIG_SENSORS_LM87 is not set
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=y
# CONFIG_SENSORS_LM95234 is not set
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=y
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
CONFIG_SENSORS_NTC_THERMISTOR=m
CONFIG_SENSORS_NCT6683=m
CONFIG_SENSORS_NCT6775_CORE=m
# CONFIG_SENSORS_NCT6775 is not set
CONFIG_SENSORS_NCT6775_I2C=m
CONFIG_SENSORS_NCT7802=m
CONFIG_SENSORS_NCT7904=y
# CONFIG_SENSORS_NPCM7XX is not set
CONFIG_SENSORS_NSA320=m
CONFIG_SENSORS_OCC_P8_I2C=y
CONFIG_SENSORS_OCC=y
CONFIG_SENSORS_PCF8591=m
CONFIG_SENSORS_PECI_CPUTEMP=m
CONFIG_SENSORS_PECI_DIMMTEMP=m
CONFIG_SENSORS_PECI=m
CONFIG_PMBUS=m
# CONFIG_SENSORS_PMBUS is not set
# CONFIG_SENSORS_ADM1266 is not set
# CONFIG_SENSORS_ADM1275 is not set
CONFIG_SENSORS_BEL_PFE=m
# CONFIG_SENSORS_BPA_RS600 is not set
CONFIG_SENSORS_DELTA_AHE50DC_FAN=m
# CONFIG_SENSORS_FSP_3Y is not set
CONFIG_SENSORS_IBM_CFFPS=m
CONFIG_SENSORS_DPS920AB=m
# CONFIG_SENSORS_INSPUR_IPSPS is not set
# CONFIG_SENSORS_IR35221 is not set
CONFIG_SENSORS_IR36021=m
CONFIG_SENSORS_IR38064=m
CONFIG_SENSORS_IR38064_REGULATOR=y
CONFIG_SENSORS_IRPS5401=m
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
CONFIG_SENSORS_LM25066_REGULATOR=y
CONFIG_SENSORS_LT7182S=m
CONFIG_SENSORS_LTC2978=m
# CONFIG_SENSORS_LTC2978_REGULATOR is not set
# CONFIG_SENSORS_LTC3815 is not set
CONFIG_SENSORS_MAX15301=m
# CONFIG_SENSORS_MAX16064 is not set
CONFIG_SENSORS_MAX16601=m
CONFIG_SENSORS_MAX20730=m
CONFIG_SENSORS_MAX20751=m
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
CONFIG_SENSORS_MP2888=m
# CONFIG_SENSORS_MP2975 is not set
CONFIG_SENSORS_MP5023=m
CONFIG_SENSORS_PIM4328=m
CONFIG_SENSORS_PLI1209BC=m
# CONFIG_SENSORS_PLI1209BC_REGULATOR is not set
# CONFIG_SENSORS_PM6764TR is not set
CONFIG_SENSORS_PXE1610=m
CONFIG_SENSORS_Q54SJ108A2=m
# CONFIG_SENSORS_STPDDC60 is not set
# CONFIG_SENSORS_TPS40422 is not set
CONFIG_SENSORS_TPS53679=m
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
CONFIG_SENSORS_XDPE152=m
# CONFIG_SENSORS_XDPE122 is not set
CONFIG_SENSORS_ZL6100=m
# CONFIG_SENSORS_PWM_FAN is not set
CONFIG_SENSORS_RASPBERRYPI_HWMON=y
CONFIG_SENSORS_SL28CPLD=m
# CONFIG_SENSORS_SBTSI is not set
CONFIG_SENSORS_SBRMI=m
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
CONFIG_SENSORS_SHT4x=y
# CONFIG_SENSORS_SHTC1 is not set
# CONFIG_SENSORS_SY7636A is not set
CONFIG_SENSORS_DME1737=y
# CONFIG_SENSORS_EMC1403 is not set
CONFIG_SENSORS_EMC2103=y
CONFIG_SENSORS_EMC6W201=y
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=y
CONFIG_SENSORS_SMSC47B397=y
CONFIG_SENSORS_SCH56XX_COMMON=m
# CONFIG_SENSORS_SCH5627 is not set
CONFIG_SENSORS_SCH5636=m
CONFIG_SENSORS_STTS751=y
# CONFIG_SENSORS_SMM665 is not set
CONFIG_SENSORS_ADC128D818=y
# CONFIG_SENSORS_ADS7828 is not set
CONFIG_SENSORS_ADS7871=m
# CONFIG_SENSORS_AMC6821 is not set
CONFIG_SENSORS_INA209=y
CONFIG_SENSORS_INA2XX=y
CONFIG_SENSORS_INA238=m
CONFIG_SENSORS_INA3221=y
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=y
# CONFIG_SENSORS_TMP102 is not set
# CONFIG_SENSORS_TMP103 is not set
CONFIG_SENSORS_TMP108=y
CONFIG_SENSORS_TMP401=y
CONFIG_SENSORS_TMP421=m
CONFIG_SENSORS_TMP464=m
CONFIG_SENSORS_TMP513=y
# CONFIG_SENSORS_VT1211 is not set
CONFIG_SENSORS_W83773G=y
# CONFIG_SENSORS_W83781D is not set
# CONFIG_SENSORS_W83791D is not set
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=y
CONFIG_SENSORS_W83795=y
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
# CONFIG_SENSORS_W83627HF is not set
# CONFIG_SENSORS_W83627EHF is not set
# CONFIG_SENSORS_WM831X is not set
# CONFIG_SENSORS_INTEL_M10_BMC_HWMON is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_OF=y
# CONFIG_THERMAL_WRITABLE_TRIPS is not set
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE=y
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_CPU_THERMAL is not set
CONFIG_DEVFREQ_THERMAL=y
# CONFIG_THERMAL_EMULATION is not set
CONFIG_THERMAL_MMIO=y
CONFIG_HISI_THERMAL=y
CONFIG_IMX_THERMAL=y
CONFIG_IMX8MM_THERMAL=y
CONFIG_K3_THERMAL=y
CONFIG_QORIQ_THERMAL=y
CONFIG_SPEAR_THERMAL=m
# CONFIG_SUN8I_THERMAL is not set
CONFIG_ROCKCHIP_THERMAL=m
CONFIG_RCAR_THERMAL=m
# CONFIG_RCAR_GEN3_THERMAL is not set
CONFIG_RZG2L_THERMAL=y
CONFIG_KIRKWOOD_THERMAL=y
# CONFIG_DOVE_THERMAL is not set
# CONFIG_ARMADA_THERMAL is not set
CONFIG_DA9062_THERMAL=y
CONFIG_MTK_THERMAL=y
CONFIG_AMLOGIC_THERMAL=m

#
# Intel thermal drivers
#

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers
# end of Intel thermal drivers

#
# Broadcom thermal drivers
#
CONFIG_BCM2711_THERMAL=y
CONFIG_BCM2835_THERMAL=m
CONFIG_BRCMSTB_THERMAL=y
CONFIG_BCM_NS_THERMAL=y
CONFIG_BCM_SR_THERMAL=m
# end of Broadcom thermal drivers

#
# Texas Instruments thermal drivers
#
# CONFIG_TI_SOC_THERMAL is not set
# end of Texas Instruments thermal drivers

#
# Samsung thermal drivers
#
# CONFIG_EXYNOS_THERMAL is not set
# end of Samsung thermal drivers

#
# NVIDIA Tegra thermal drivers
#
CONFIG_TEGRA_SOCTHERM=y
CONFIG_TEGRA_BPMP_THERMAL=y
CONFIG_TEGRA30_TSENSOR=m
# end of NVIDIA Tegra thermal drivers

CONFIG_GENERIC_ADC_THERMAL=m

#
# Qualcomm thermal drivers
#
# CONFIG_QCOM_SPMI_ADC_TM5 is not set
# CONFIG_QCOM_SPMI_TEMP_ALARM is not set
CONFIG_QCOM_LMH=y
# end of Qualcomm thermal drivers

CONFIG_UNIPHIER_THERMAL=m
CONFIG_SPRD_THERMAL=m
CONFIG_KHADAS_MCU_FAN_THERMAL=m
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=m
# CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP is not set
CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=y
CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=y

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=y
CONFIG_SOFT_WATCHDOG_PRETIMEOUT=y
# CONFIG_BD957XMUF_WATCHDOG is not set
CONFIG_DA9052_WATCHDOG=m
CONFIG_DA9055_WATCHDOG=y
# CONFIG_DA9063_WATCHDOG is not set
CONFIG_DA9062_WATCHDOG=y
CONFIG_GPIO_WATCHDOG=m
# CONFIG_MENF21BMC_WATCHDOG is not set
CONFIG_MENZ069_WATCHDOG=y
CONFIG_WM831X_WATCHDOG=y
CONFIG_XILINX_WATCHDOG=y
CONFIG_ZIIRAVE_WATCHDOG=m
CONFIG_RAVE_SP_WATCHDOG=m
CONFIG_MLX_WDT=m
CONFIG_SL28CPLD_WATCHDOG=y
CONFIG_ARM_SP805_WATCHDOG=m
# CONFIG_ARM_SBSA_WATCHDOG is not set
CONFIG_ARMADA_37XX_WATCHDOG=m
CONFIG_ASM9260_WATCHDOG=m
# CONFIG_AT91RM9200_WATCHDOG is not set
# CONFIG_AT91SAM9X_WATCHDOG is not set
CONFIG_SAMA5D4_WATCHDOG=y
CONFIG_CADENCE_WATCHDOG=m
CONFIG_FTWDT010_WATCHDOG=y
# CONFIG_S3C2410_WATCHDOG is not set
CONFIG_DW_WATCHDOG=y
# CONFIG_EP93XX_WATCHDOG is not set
CONFIG_OMAP_WATCHDOG=y
CONFIG_PNX4008_WATCHDOG=y
CONFIG_DAVINCI_WATCHDOG=y
CONFIG_K3_RTI_WATCHDOG=y
CONFIG_RN5T618_WATCHDOG=m
# CONFIG_SUNXI_WATCHDOG is not set
# CONFIG_NPCM7XX_WATCHDOG is not set
CONFIG_TWL4030_WATCHDOG=y
CONFIG_STMP3XXX_RTC_WATCHDOG=m
CONFIG_TS4800_WATCHDOG=y
# CONFIG_TS72XX_WATCHDOG is not set
CONFIG_MAX63XX_WATCHDOG=m
CONFIG_MAX77620_WATCHDOG=m
CONFIG_IMX2_WDT=m
# CONFIG_IMX7ULP_WDT is not set
CONFIG_RETU_WATCHDOG=m
CONFIG_MOXART_WDT=y
CONFIG_ST_LPC_WATCHDOG=y
# CONFIG_TEGRA_WATCHDOG is not set
CONFIG_QCOM_WDT=m
# CONFIG_MESON_GXBB_WATCHDOG is not set
CONFIG_MESON_WATCHDOG=m
CONFIG_MEDIATEK_WATCHDOG=m
CONFIG_DIGICOLOR_WATCHDOG=y
CONFIG_ARM_SMC_WATCHDOG=m
CONFIG_LPC18XX_WATCHDOG=y
CONFIG_RENESAS_WDT=y
# CONFIG_RENESAS_RZAWDT is not set
CONFIG_RENESAS_RZN1WDT=m
# CONFIG_RENESAS_RZG2LWDT is not set
# CONFIG_ASPEED_WATCHDOG is not set
CONFIG_STPMIC1_WATCHDOG=m
CONFIG_UNIPHIER_WATCHDOG=m
# CONFIG_RTD119X_WATCHDOG is not set
CONFIG_REALTEK_OTTO_WDT=m
CONFIG_SPRD_WATCHDOG=y
# CONFIG_VISCONTI_WATCHDOG is not set
CONFIG_MSC313E_WATCHDOG=y
CONFIG_APPLE_WATCHDOG=y
CONFIG_SUNPLUS_WATCHDOG=y
CONFIG_SC520_WDT=m
CONFIG_KEMPLD_WDT=m
CONFIG_BCM47XX_WDT=y
CONFIG_BCM2835_WDT=m
CONFIG_BCM_KONA_WDT=m
CONFIG_BCM_KONA_WDT_DEBUG=y
# CONFIG_BCM7038_WDT is not set
# CONFIG_IMGPDC_WDT is not set
CONFIG_MPC5200_WDT=y
CONFIG_MEN_A21_WDT=y
CONFIG_UML_WATCHDOG=y

#
# USB-based Watchdog Cards
#
CONFIG_USBPCWATCHDOG=y
# CONFIG_KEEMBAY_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=m
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
CONFIG_SSB_PCMCIAHOST=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
CONFIG_SSB_SDIOHOST=y
CONFIG_SSB_HOST_SOC=y
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_SOC=y
CONFIG_BCMA_DRIVER_MIPS=y
CONFIG_BCMA_PFLASH=y
# CONFIG_BCMA_SFLASH is not set
CONFIG_BCMA_NFLASH=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_ALTERA_A10SR=y
# CONFIG_MFD_ALTERA_SYSMGR is not set
# CONFIG_MFD_ACT8945A is not set
CONFIG_MFD_SUN4I_GPADC=y
# CONFIG_MFD_AS3711 is not set
CONFIG_MFD_AS3722=y
CONFIG_PMIC_ADP5520=y
CONFIG_MFD_AAT2870_CORE=y
CONFIG_MFD_AT91_USART=y
# CONFIG_MFD_ATMEL_FLEXCOM is not set
CONFIG_MFD_ATMEL_HLCDC=m
CONFIG_MFD_ATMEL_SMC=y
CONFIG_MFD_BCM590XX=m
CONFIG_MFD_BD9571MWV=y
CONFIG_MFD_AC100=m
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
CONFIG_MFD_AXP20X_RSB=m
# CONFIG_MFD_CROS_EC_DEV is not set
CONFIG_MFD_MADERA=y
CONFIG_MFD_MADERA_I2C=y
# CONFIG_MFD_MADERA_SPI is not set
CONFIG_MFD_CS47L15=y
CONFIG_MFD_CS47L35=y
CONFIG_MFD_CS47L85=y
# CONFIG_MFD_CS47L90 is not set
CONFIG_MFD_CS47L92=y
CONFIG_MFD_ASIC3=y
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
# CONFIG_MFD_DA9052_SPI is not set
CONFIG_MFD_DA9052_I2C=y
CONFIG_MFD_DA9055=y
CONFIG_MFD_DA9062=y
CONFIG_MFD_DA9063=m
# CONFIG_MFD_DA9150 is not set
CONFIG_MFD_DLN2=y
CONFIG_MFD_ENE_KB3930=m
CONFIG_MFD_EXYNOS_LPASS=y
CONFIG_MFD_GATEWORKS_GSC=y
CONFIG_MFD_MC13XXX=m
# CONFIG_MFD_MC13XXX_SPI is not set
CONFIG_MFD_MC13XXX_I2C=m
CONFIG_MFD_MP2629=m
# CONFIG_MFD_MXS_LRADC is not set
CONFIG_MFD_MX25_TSADC=y
CONFIG_MFD_HI6421_PMIC=m
CONFIG_MFD_HI6421_SPMI=m
CONFIG_MFD_HI655X_PMIC=y
CONFIG_HTC_PASIC3=y
CONFIG_HTC_I2CPLD=y
CONFIG_MFD_IQS62X=y
CONFIG_MFD_KEMPLD=y
# CONFIG_MFD_88PM800 is not set
CONFIG_MFD_88PM805=y
CONFIG_MFD_88PM860X=y
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77620 is not set
CONFIG_MFD_MAX77650=m
CONFIG_MFD_MAX77686=m
# CONFIG_MFD_MAX77693 is not set
CONFIG_MFD_MAX77714=m
CONFIG_MFD_MAX77843=y
CONFIG_MFD_MAX8907=y
CONFIG_MFD_MAX8925=y
CONFIG_MFD_MAX8997=y
# CONFIG_MFD_MAX8998 is not set
CONFIG_MFD_MT6360=y
# CONFIG_MFD_MT6397 is not set
CONFIG_MFD_MENF21BMC=y
CONFIG_EZX_PCAP=y
# CONFIG_MFD_CPCAP is not set
# CONFIG_MFD_VIPERBOARD is not set
CONFIG_MFD_NTXEC=y
CONFIG_MFD_RETU=m
CONFIG_MFD_PCF50633=y
CONFIG_PCF50633_ADC=y
# CONFIG_PCF50633_GPIO is not set
# CONFIG_MFD_PM8XXX is not set
CONFIG_MFD_QCOM_RPM=m
# CONFIG_MFD_SPMI_PMIC is not set
CONFIG_MFD_RT4831=m
CONFIG_MFD_RT5033=m
# CONFIG_MFD_RC5T583 is not set
CONFIG_MFD_RK808=m
CONFIG_MFD_RN5T618=m
CONFIG_MFD_SEC_CORE=m
CONFIG_MFD_SI476X_CORE=m
CONFIG_MFD_SIMPLE_MFD_I2C=m
CONFIG_MFD_SL28CPLD=m
CONFIG_MFD_SM501=m
CONFIG_MFD_SM501_GPIO=y
CONFIG_MFD_SKY81452=y
# CONFIG_MFD_SC27XX_PMIC is not set
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_STMPE is not set
CONFIG_MFD_SUN6I_PRCM=y
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=m
CONFIG_MFD_LP3943=y
# CONFIG_MFD_LP8788 is not set
CONFIG_MFD_TI_LMU=m
CONFIG_MFD_PALMAS=y
# CONFIG_TPS6105X is not set
CONFIG_TPS65010=m
CONFIG_TPS6507X=m
# CONFIG_MFD_TPS65086 is not set
CONFIG_MFD_TPS65090=y
CONFIG_MFD_TPS65217=y
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TI_LP87565 is not set
# CONFIG_MFD_TPS65218 is not set
# CONFIG_MFD_TPS6586X is not set
CONFIG_MFD_TPS65910=y
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
CONFIG_MFD_TPS65912_SPI=y
CONFIG_TWL4030_CORE=y
CONFIG_MFD_TWL4030_AUDIO=y
CONFIG_TWL6040_CORE=y
CONFIG_MFD_WL1273_CORE=y
CONFIG_MFD_LM3533=y
# CONFIG_MFD_TC3589X is not set
CONFIG_MFD_TQMX86=y
# CONFIG_MFD_LOCHNAGAR is not set
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
CONFIG_MFD_ARIZONA_SPI=y
CONFIG_MFD_CS47L24=y
CONFIG_MFD_WM5102=y
# CONFIG_MFD_WM5110 is not set
# CONFIG_MFD_WM8997 is not set
# CONFIG_MFD_WM8998 is not set
# CONFIG_MFD_WM8400 is not set
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
CONFIG_MFD_WM8994=m
CONFIG_MFD_STW481X=m
CONFIG_MFD_ROHM_BD718XX=y
CONFIG_MFD_ROHM_BD71828=y
CONFIG_MFD_ROHM_BD957XMUF=y
CONFIG_MFD_STM32_LPTIMER=y
CONFIG_MFD_STM32_TIMERS=m
CONFIG_MFD_STPMIC1=y
CONFIG_MFD_STMFX=y
CONFIG_MFD_WCD934X=m
# CONFIG_MFD_ATC260X_I2C is not set
CONFIG_MFD_KHADAS_MCU=m
# CONFIG_MFD_ACER_A500_EC is not set
CONFIG_MFD_QCOM_PM8008=m
CONFIG_RAVE_SP_CORE=y
CONFIG_MFD_INTEL_M10_BMC=m
# CONFIG_MFD_RSMU_I2C is not set
CONFIG_MFD_RSMU_SPI=m
# end of Multifunction device drivers

CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=m
CONFIG_REGULATOR_VIRTUAL_CONSUMER=m
CONFIG_REGULATOR_USERSPACE_CONSUMER=m
CONFIG_REGULATOR_88PG86X=m
# CONFIG_REGULATOR_88PM8607 is not set
CONFIG_REGULATOR_ACT8865=y
CONFIG_REGULATOR_AD5398=m
CONFIG_REGULATOR_ANATOP=y
CONFIG_REGULATOR_AAT2870=m
# CONFIG_REGULATOR_ARM_SCMI is not set
CONFIG_REGULATOR_AS3722=m
CONFIG_REGULATOR_AXP20X=m
# CONFIG_REGULATOR_BCM590XX is not set
CONFIG_REGULATOR_BD71815=m
CONFIG_REGULATOR_BD71828=y
CONFIG_REGULATOR_BD718XX=m
# CONFIG_REGULATOR_BD9571MWV is not set
CONFIG_REGULATOR_BD957XMUF=y
CONFIG_REGULATOR_CROS_EC=y
CONFIG_REGULATOR_DA9052=m
CONFIG_REGULATOR_DA9055=m
# CONFIG_REGULATOR_DA9062 is not set
CONFIG_REGULATOR_DA9063=m
# CONFIG_REGULATOR_DA9121 is not set
CONFIG_REGULATOR_DA9210=m
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=m
CONFIG_REGULATOR_FAN53880=m
CONFIG_REGULATOR_GPIO=m
CONFIG_REGULATOR_HI6421=m
# CONFIG_REGULATOR_HI6421V530 is not set
CONFIG_REGULATOR_HI655X=m
CONFIG_REGULATOR_HI6421V600=m
# CONFIG_REGULATOR_ISL9305 is not set
CONFIG_REGULATOR_ISL6271A=y
CONFIG_REGULATOR_LM363X=m
CONFIG_REGULATOR_LP3971=m
# CONFIG_REGULATOR_LP3972 is not set
CONFIG_REGULATOR_LP872X=m
# CONFIG_REGULATOR_LP8755 is not set
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_LTC3676=m
# CONFIG_REGULATOR_MAX1586 is not set
CONFIG_REGULATOR_MAX77620=m
CONFIG_REGULATOR_MAX77650=m
# CONFIG_REGULATOR_MAX8649 is not set
CONFIG_REGULATOR_MAX8660=y
CONFIG_REGULATOR_MAX8893=y
CONFIG_REGULATOR_MAX8907=y
# CONFIG_REGULATOR_MAX8925 is not set
CONFIG_REGULATOR_MAX8952=m
CONFIG_REGULATOR_MAX8973=y
CONFIG_REGULATOR_MAX8997=m
CONFIG_REGULATOR_MAX20086=y
CONFIG_REGULATOR_MAX77686=y
# CONFIG_REGULATOR_MAX77693 is not set
# CONFIG_REGULATOR_MAX77802 is not set
CONFIG_REGULATOR_MAX77826=y
CONFIG_REGULATOR_MC13XXX_CORE=m
# CONFIG_REGULATOR_MC13783 is not set
CONFIG_REGULATOR_MC13892=m
# CONFIG_REGULATOR_MCP16502 is not set
CONFIG_REGULATOR_MP5416=m
# CONFIG_REGULATOR_MP8859 is not set
CONFIG_REGULATOR_MP886X=y
# CONFIG_REGULATOR_MPQ7920 is not set
CONFIG_REGULATOR_MT6311=m
CONFIG_REGULATOR_MT6315=y
CONFIG_REGULATOR_MT6360=y
CONFIG_REGULATOR_MT6380=m
# CONFIG_REGULATOR_PALMAS is not set
# CONFIG_REGULATOR_PBIAS is not set
CONFIG_REGULATOR_PCA9450=m
CONFIG_REGULATOR_PCAP=y
# CONFIG_REGULATOR_PCF50633 is not set
CONFIG_REGULATOR_PF8X00=m
CONFIG_REGULATOR_PFUZE100=y
CONFIG_REGULATOR_PV88060=m
CONFIG_REGULATOR_PV88080=y
# CONFIG_REGULATOR_PV88090 is not set
CONFIG_REGULATOR_PWM=m
CONFIG_REGULATOR_QCOM_RPM=m
CONFIG_REGULATOR_QCOM_RPMH=m
CONFIG_REGULATOR_QCOM_SMD_RPM=y
CONFIG_REGULATOR_QCOM_SPMI=m
# CONFIG_REGULATOR_QCOM_USB_VBUS is not set
CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=m
CONFIG_REGULATOR_RK808=m
CONFIG_REGULATOR_RN5T618=m
CONFIG_REGULATOR_ROHM=y
# CONFIG_REGULATOR_RT4801 is not set
# CONFIG_REGULATOR_RT4831 is not set
# CONFIG_REGULATOR_RT5033 is not set
CONFIG_REGULATOR_RT5190A=m
CONFIG_REGULATOR_RT5759=y
# CONFIG_REGULATOR_RT6160 is not set
CONFIG_REGULATOR_RT6245=y
CONFIG_REGULATOR_RTQ2134=m
CONFIG_REGULATOR_RTMV20=y
# CONFIG_REGULATOR_RTQ6752 is not set
CONFIG_REGULATOR_S2MPA01=m
CONFIG_REGULATOR_S2MPS11=m
# CONFIG_REGULATOR_S5M8767 is not set
# CONFIG_REGULATOR_SC2731 is not set
CONFIG_REGULATOR_SKY81452=m
CONFIG_REGULATOR_SLG51000=y
CONFIG_REGULATOR_STM32_BOOSTER=m
CONFIG_REGULATOR_STM32_VREFBUF=m
# CONFIG_REGULATOR_STM32_PWR is not set
CONFIG_REGULATOR_STPMIC1=y
CONFIG_REGULATOR_TI_ABB=y
CONFIG_REGULATOR_STW481X_VMMC=y
# CONFIG_REGULATOR_SY7636A is not set
CONFIG_REGULATOR_SY8106A=m
CONFIG_REGULATOR_SY8824X=y
# CONFIG_REGULATOR_SY8827N is not set
CONFIG_REGULATOR_TPS51632=m
CONFIG_REGULATOR_TPS62360=y
CONFIG_REGULATOR_TPS6286X=y
# CONFIG_REGULATOR_TPS65023 is not set
CONFIG_REGULATOR_TPS6507X=m
# CONFIG_REGULATOR_TPS65090 is not set
CONFIG_REGULATOR_TPS65132=m
# CONFIG_REGULATOR_TPS65217 is not set
# CONFIG_REGULATOR_TPS6524X is not set
# CONFIG_REGULATOR_TPS65910 is not set
CONFIG_REGULATOR_TPS65912=y
# CONFIG_REGULATOR_TPS68470 is not set
CONFIG_REGULATOR_TWL4030=m
# CONFIG_REGULATOR_UNIPHIER is not set
CONFIG_REGULATOR_VCTRL=m
# CONFIG_REGULATOR_VQMMC_IPQ4019 is not set
CONFIG_REGULATOR_WM831X=y
# CONFIG_REGULATOR_WM8994 is not set
CONFIG_REGULATOR_QCOM_LABIBB=y
CONFIG_RC_CORE=m
# CONFIG_LIRC is not set
CONFIG_RC_MAP=m
CONFIG_RC_DECODERS=y
# CONFIG_IR_IMON_DECODER is not set
CONFIG_IR_JVC_DECODER=m
# CONFIG_IR_MCE_KBD_DECODER is not set
# CONFIG_IR_NEC_DECODER is not set
CONFIG_IR_RC5_DECODER=m
# CONFIG_IR_RC6_DECODER is not set
CONFIG_IR_RCMM_DECODER=m
# CONFIG_IR_SANYO_DECODER is not set
# CONFIG_IR_SHARP_DECODER is not set
# CONFIG_IR_SONY_DECODER is not set
# CONFIG_IR_XMP_DECODER is not set
CONFIG_RC_DEVICES=y
# CONFIG_IR_ENE is not set
# CONFIG_IR_FINTEK is not set
CONFIG_IR_GPIO_CIR=m
# CONFIG_IR_HIX5HD2 is not set
# CONFIG_IR_IGORPLUGUSB is not set
CONFIG_IR_IGUANA=m
CONFIG_IR_IMON=m
CONFIG_IR_IMON_RAW=m
# CONFIG_IR_ITE_CIR is not set
# CONFIG_IR_MCEUSB is not set
CONFIG_IR_MESON=m
CONFIG_IR_MESON_TX=m
CONFIG_IR_MTK=m
CONFIG_IR_NUVOTON=m
# CONFIG_IR_REDRAT3 is not set
CONFIG_IR_RX51=m
CONFIG_IR_SERIAL=m
CONFIG_IR_SERIAL_TRANSMITTER=y
CONFIG_IR_STREAMZAP=m
CONFIG_IR_SUNXI=m
CONFIG_IR_TOY=m
# CONFIG_IR_TTUSBIR is not set
CONFIG_IR_WINBOND_CIR=m
# CONFIG_RC_ATI_REMOTE is not set
CONFIG_RC_LOOPBACK=m
CONFIG_RC_ST=m
CONFIG_RC_XBOX_DVD=m
CONFIG_IR_IMG=m
CONFIG_IR_IMG_RAW=y
CONFIG_IR_IMG_HW=y
# CONFIG_IR_IMG_NEC is not set
CONFIG_IR_IMG_JVC=y
# CONFIG_IR_IMG_SONY is not set
CONFIG_IR_IMG_SHARP=y
CONFIG_IR_IMG_SANYO=y
# CONFIG_IR_IMG_RC5 is not set
# CONFIG_IR_IMG_RC6 is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y

#
# CEC support
#
CONFIG_MEDIA_CEC_SUPPORT=y
CONFIG_CEC_CH7322=y
# CONFIG_CEC_CROS_EC is not set
CONFIG_CEC_MESON_AO=y
CONFIG_CEC_MESON_G12A_AO=y
# CONFIG_CEC_GPIO is not set
CONFIG_CEC_SAMSUNG_S5P=m
CONFIG_CEC_STI=m
# CONFIG_CEC_STM32 is not set
CONFIG_CEC_TEGRA=y
CONFIG_USB_PULSE8_CEC=m
CONFIG_USB_RAINSHADOW_CEC=m
# end of CEC support

CONFIG_MEDIA_SUPPORT=m
# CONFIG_MEDIA_SUPPORT_FILTER is not set
# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_MEDIA_TEST_SUPPORT=y
# end of Media device types

#
# Media core support
#
# CONFIG_VIDEO_DEV is not set
# CONFIG_MEDIA_CONTROLLER is not set
CONFIG_DVB_CORE=m
# end of Media core support

#
# Digital TV options
#
CONFIG_DVB_MAX_ADAPTERS=16
# CONFIG_DVB_DYNAMIC_MINORS is not set
CONFIG_DVB_DEMUX_SECTION_LOSS_LOG=y
CONFIG_DVB_ULE_DEBUG=y
# end of Digital TV options

#
# Media drivers
#

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
CONFIG_MEDIA_PLATFORM_DRIVERS=y
CONFIG_V4L_PLATFORM_DRIVERS=y
# CONFIG_SDR_PLATFORM_DRIVERS is not set
# CONFIG_DVB_PLATFORM_DRIVERS is not set

#
# Allegro DVT media platform drivers
#

#
# Amlogic media platform drivers
#

#
# Amphion drivers
#

#
# Aspeed media platform drivers
#

#
# Atmel media platform drivers
#

#
# Cadence media platform drivers
#

#
# Chips&Media media platform drivers
#

#
# Intel media platform drivers
#

#
# Marvell media platform drivers
#

#
# Mediatek media platform drivers
#

#
# NVidia media platform drivers
#

#
# NXP media platform drivers
#

#
# Qualcomm media platform drivers
#

#
# Renesas media platform drivers
#

#
# Rockchip media platform drivers
#

#
# Samsung media platform drivers
#

#
# STMicroelectronics media platform drivers
#

#
# Sunxi media platform drivers
#

#
# Texas Instruments drivers
#

#
# VIA media platform drivers
#

#
# Xilinx media platform drivers
#

#
# MMC/SDIO DVB adapters
#
CONFIG_SMS_SDIO_DRV=m
CONFIG_DVB_TEST_DRIVERS=y
CONFIG_DVB_VIDTV=m

#
# FireWire (IEEE 1394) Adapters
#
CONFIG_DVB_FIREDTV=m
CONFIG_DVB_FIREDTV_INPUT=y
CONFIG_MEDIA_COMMON_OPTIONS=y

#
# common driver options
#
CONFIG_SMS_SIANO_MDTV=m
CONFIG_SMS_SIANO_RC=y
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y
CONFIG_MEDIA_TUNER=m

#
# Customize TV tuners
#
# CONFIG_MEDIA_TUNER_FC0011 is not set
# CONFIG_MEDIA_TUNER_FC0012 is not set
# CONFIG_MEDIA_TUNER_FC0013 is not set
CONFIG_MEDIA_TUNER_IT913X=m
CONFIG_MEDIA_TUNER_M88RS6000T=m
CONFIG_MEDIA_TUNER_MAX2165=m
CONFIG_MEDIA_TUNER_MC44S803=m
CONFIG_MEDIA_TUNER_MT2060=m
# CONFIG_MEDIA_TUNER_MT2063 is not set
# CONFIG_MEDIA_TUNER_MT20XX is not set
CONFIG_MEDIA_TUNER_MT2131=m
CONFIG_MEDIA_TUNER_MT2266=m
CONFIG_MEDIA_TUNER_MXL301RF=m
# CONFIG_MEDIA_TUNER_MXL5005S is not set
CONFIG_MEDIA_TUNER_MXL5007T=m
CONFIG_MEDIA_TUNER_QM1D1B0004=m
CONFIG_MEDIA_TUNER_QM1D1C0042=m
# CONFIG_MEDIA_TUNER_QT1010 is not set
CONFIG_MEDIA_TUNER_R820T=m
CONFIG_MEDIA_TUNER_SI2157=m
# CONFIG_MEDIA_TUNER_SIMPLE is not set
# CONFIG_MEDIA_TUNER_TDA18212 is not set
# CONFIG_MEDIA_TUNER_TDA18218 is not set
CONFIG_MEDIA_TUNER_TDA18250=m
CONFIG_MEDIA_TUNER_TDA18271=m
CONFIG_MEDIA_TUNER_TDA827X=m
CONFIG_MEDIA_TUNER_TDA8290=m
CONFIG_MEDIA_TUNER_TDA9887=m
# CONFIG_MEDIA_TUNER_TEA5761 is not set
CONFIG_MEDIA_TUNER_TEA5767=m
CONFIG_MEDIA_TUNER_TUA9001=m
CONFIG_MEDIA_TUNER_XC2028=m
CONFIG_MEDIA_TUNER_XC4000=m
CONFIG_MEDIA_TUNER_XC5000=m
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
# CONFIG_DVB_M88DS3103 is not set
CONFIG_DVB_MXL5XX=m
CONFIG_DVB_STB0899=m
CONFIG_DVB_STB6100=m
CONFIG_DVB_STV090x=m
# CONFIG_DVB_STV0910 is not set
CONFIG_DVB_STV6110x=m
CONFIG_DVB_STV6111=m

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=m
CONFIG_DVB_MN88472=m
CONFIG_DVB_MN88473=m
CONFIG_DVB_SI2165=m
CONFIG_DVB_TDA18271C2DD=m

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=m
CONFIG_DVB_CX24116=m
CONFIG_DVB_CX24117=m
# CONFIG_DVB_CX24120 is not set
CONFIG_DVB_CX24123=m
CONFIG_DVB_DS3000=m
CONFIG_DVB_MB86A16=m
# CONFIG_DVB_MT312 is not set
CONFIG_DVB_S5H1420=m
CONFIG_DVB_SI21XX=m
# CONFIG_DVB_STB6000 is not set
CONFIG_DVB_STV0288=m
CONFIG_DVB_STV0299=m
CONFIG_DVB_STV0900=m
CONFIG_DVB_STV6110=m
CONFIG_DVB_TDA10071=m
CONFIG_DVB_TDA10086=m
# CONFIG_DVB_TDA8083 is not set
CONFIG_DVB_TDA8261=m
CONFIG_DVB_TDA826X=m
CONFIG_DVB_TS2020=m
CONFIG_DVB_TUA6100=m
# CONFIG_DVB_TUNER_CX24113 is not set
CONFIG_DVB_TUNER_ITD1000=m
CONFIG_DVB_VES1X93=m
CONFIG_DVB_ZL10036=m
CONFIG_DVB_ZL10039=m

#
# DVB-T (terrestrial) frontends
#
# CONFIG_DVB_AF9013 is not set
CONFIG_DVB_CX22700=m
CONFIG_DVB_CX22702=m
# CONFIG_DVB_CXD2820R is not set
# CONFIG_DVB_CXD2841ER is not set
CONFIG_DVB_DIB3000MB=m
# CONFIG_DVB_DIB3000MC is not set
CONFIG_DVB_DIB7000M=m
CONFIG_DVB_DIB7000P=m
# CONFIG_DVB_DIB9000 is not set
CONFIG_DVB_DRXD=m
CONFIG_DVB_EC100=m
# CONFIG_DVB_L64781 is not set
CONFIG_DVB_MT352=m
# CONFIG_DVB_NXT6000 is not set
CONFIG_DVB_RTL2830=m
CONFIG_DVB_RTL2832=m
CONFIG_DVB_S5H1432=m
# CONFIG_DVB_SI2168 is not set
CONFIG_DVB_SP887X=m
CONFIG_DVB_STV0367=m
CONFIG_DVB_TDA10048=m
CONFIG_DVB_TDA1004X=m
# CONFIG_DVB_ZD1301_DEMOD is not set
CONFIG_DVB_ZL10353=m
# CONFIG_DVB_CXD2880 is not set

#
# DVB-C (cable) frontends
#
CONFIG_DVB_STV0297=m
CONFIG_DVB_TDA10021=m
# CONFIG_DVB_TDA10023 is not set
# CONFIG_DVB_VES1820 is not set

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
# CONFIG_DVB_AU8522_DTV is not set
# CONFIG_DVB_BCM3510 is not set
CONFIG_DVB_LG2160=m
CONFIG_DVB_LGDT3305=m
CONFIG_DVB_LGDT3306A=m
# CONFIG_DVB_LGDT330X is not set
CONFIG_DVB_MXL692=m
# CONFIG_DVB_NXT200X is not set
# CONFIG_DVB_OR51132 is not set
# CONFIG_DVB_OR51211 is not set
CONFIG_DVB_S5H1409=m
CONFIG_DVB_S5H1411=m

#
# ISDB-T (terrestrial) frontends
#
CONFIG_DVB_DIB8000=m
CONFIG_DVB_MB86A20S=m
CONFIG_DVB_S921=m

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
# CONFIG_DVB_MN88443X is not set
CONFIG_DVB_TC90522=m

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=m
# CONFIG_DVB_TUNER_DIB0070 is not set
CONFIG_DVB_TUNER_DIB0090=m

#
# SEC control devices for DVB-S
#
CONFIG_DVB_A8293=m
CONFIG_DVB_AF9033=m
# CONFIG_DVB_ASCOT2E is not set
# CONFIG_DVB_ATBM8830 is not set
CONFIG_DVB_HELENE=m
CONFIG_DVB_HORUS3A=m
CONFIG_DVB_ISL6405=m
# CONFIG_DVB_ISL6421 is not set
# CONFIG_DVB_ISL6423 is not set
CONFIG_DVB_IX2505V=m
# CONFIG_DVB_LGS8GL5 is not set
CONFIG_DVB_LGS8GXX=m
# CONFIG_DVB_LNBH25 is not set
# CONFIG_DVB_LNBH29 is not set
CONFIG_DVB_LNBP21=m
# CONFIG_DVB_LNBP22 is not set
CONFIG_DVB_M88RS2000=m
# CONFIG_DVB_TDA665x is not set
CONFIG_DVB_DRX39XYJ=m

#
# Common Interface (EN50221) controller drivers
#
CONFIG_DVB_CXD2099=m
# CONFIG_DVB_SP2 is not set
# end of Customise DVB Frontends

#
# Tools to develop new frontends
#
# CONFIG_DVB_DUMMY_FE is not set
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_TEGRA_HOST1X_CONTEXT_BUS=y
CONFIG_TEGRA_HOST1X=m
# CONFIG_TEGRA_HOST1X_FIREWALL is not set
# CONFIG_IMX_IPUV3_CORE is not set
CONFIG_DRM=y
CONFIG_DRM_MIPI_DBI=y
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DEBUG_MM=y
# CONFIG_DRM_DEBUG_SELFTEST is not set
CONFIG_DRM_KMS_HELPER=y
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
CONFIG_DRM_DEBUG_MODESET_LOCK=y
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DP_AUX_BUS=y
CONFIG_DRM_DISPLAY_HELPER=y
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_HELPER=y
# CONFIG_DRM_DP_AUX_CHARDEV is not set
CONFIG_DRM_DP_CEC=y
CONFIG_DRM_GEM_CMA_HELPER=y
CONFIG_DRM_GEM_SHMEM_HELPER=y
CONFIG_DRM_SCHED=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=y
# CONFIG_DRM_I2C_SIL164 is not set
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
CONFIG_DRM_HDLCD=m
CONFIG_DRM_HDLCD_SHOW_UNDERRUN=y
CONFIG_DRM_MALI_DISPLAY=y
# CONFIG_DRM_KOMEDA is not set
# end of ARM devices

CONFIG_DRM_KMB_DISPLAY=m
CONFIG_DRM_VGEM=m
CONFIG_DRM_VKMS=y
# CONFIG_DRM_EXYNOS is not set
# CONFIG_DRM_ROCKCHIP is not set
CONFIG_DRM_UDL=m
CONFIG_DRM_RCAR_DU=m
# CONFIG_DRM_RCAR_USE_CMM is not set
CONFIG_DRM_RCAR_DW_HDMI=m
CONFIG_DRM_RCAR_USE_LVDS=y
CONFIG_DRM_RCAR_LVDS=m
# CONFIG_DRM_RCAR_MIPI_DSI is not set
CONFIG_DRM_RCAR_WRITEBACK=y
CONFIG_DRM_SUN4I=y
# CONFIG_DRM_SUN4I_HDMI is not set
# CONFIG_DRM_SUN4I_BACKEND is not set
# CONFIG_DRM_SUN6I_DSI is not set
CONFIG_DRM_SUN8I_DW_HDMI=y
CONFIG_DRM_SUN8I_MIXER=m
CONFIG_DRM_SUN8I_TCON_TOP=y
# CONFIG_DRM_VIRTIO_GPU is not set
# CONFIG_DRM_MSM is not set
CONFIG_DRM_TEGRA=m
# CONFIG_DRM_TEGRA_DEBUG is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_ABT_Y030XX067A is not set
CONFIG_DRM_PANEL_ARM_VERSATILE=m
CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596=m
CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0=m
CONFIG_DRM_PANEL_BOE_HIMAX8279D=y
CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
CONFIG_DRM_PANEL_DSI_CM=y
CONFIG_DRM_PANEL_LVDS=m
CONFIG_DRM_PANEL_SIMPLE=m
CONFIG_DRM_PANEL_EDP=y
CONFIG_DRM_PANEL_EBBG_FT8719=y
CONFIG_DRM_PANEL_ELIDA_KD35T133=m
CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02=y
CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D=m
CONFIG_DRM_PANEL_ILITEK_IL9322=y
# CONFIG_DRM_PANEL_ILITEK_ILI9341 is not set
# CONFIG_DRM_PANEL_ILITEK_ILI9881C is not set
CONFIG_DRM_PANEL_INNOLUX_EJ030NA=y
# CONFIG_DRM_PANEL_INNOLUX_P079ZCA is not set
CONFIG_DRM_PANEL_JDI_LT070ME05000=y
# CONFIG_DRM_PANEL_JDI_R63452 is not set
# CONFIG_DRM_PANEL_KHADAS_TS050 is not set
CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04=m
# CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W is not set
CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829=m
CONFIG_DRM_PANEL_SAMSUNG_LD9040=y
CONFIG_DRM_PANEL_LG_LB035Q02=y
CONFIG_DRM_PANEL_LG_LG4573=m
CONFIG_DRM_PANEL_NEC_NL8048HL11=m
CONFIG_DRM_PANEL_NEWVISION_NV3052C=y
CONFIG_DRM_PANEL_NOVATEK_NT35510=m
CONFIG_DRM_PANEL_NOVATEK_NT35560=y
CONFIG_DRM_PANEL_NOVATEK_NT35950=y
CONFIG_DRM_PANEL_NOVATEK_NT36672A=y
# CONFIG_DRM_PANEL_NOVATEK_NT39016 is not set
CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=y
CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO=m
CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS=y
CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=m
CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=m
# CONFIG_DRM_PANEL_RAYDIUM_RM67191 is not set
CONFIG_DRM_PANEL_RAYDIUM_RM68200=y
CONFIG_DRM_PANEL_RONBO_RB070D30=m
CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=y
CONFIG_DRM_PANEL_SAMSUNG_DB7430=m
CONFIG_DRM_PANEL_SAMSUNG_S6D16D0=m
CONFIG_DRM_PANEL_SAMSUNG_S6D27A1=y
CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=m
CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=m
# CONFIG_DRM_PANEL_SAMSUNG_S6E63M0 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01=m
# CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0 is not set
CONFIG_DRM_PANEL_SAMSUNG_SOFEF00=y
CONFIG_DRM_PANEL_SEIKO_43WVF1G=y
# CONFIG_DRM_PANEL_SHARP_LQ101R1SX01 is not set
CONFIG_DRM_PANEL_SHARP_LS037V7DW01=y
# CONFIG_DRM_PANEL_SHARP_LS043T1LE01 is not set
CONFIG_DRM_PANEL_SHARP_LS060T1SX01=m
CONFIG_DRM_PANEL_SITRONIX_ST7701=m
CONFIG_DRM_PANEL_SITRONIX_ST7703=y
# CONFIG_DRM_PANEL_SITRONIX_ST7789V is not set
CONFIG_DRM_PANEL_SONY_ACX565AKM=y
# CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521 is not set
CONFIG_DRM_PANEL_TDO_TL070WSH30=m
# CONFIG_DRM_PANEL_TPO_TD028TTEC1 is not set
# CONFIG_DRM_PANEL_TPO_TD043MTEA1 is not set
CONFIG_DRM_PANEL_TPO_TPG110=m
CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=y
CONFIG_DRM_PANEL_VISIONOX_RM69299=m
CONFIG_DRM_PANEL_WIDECHIPS_WS2401=m
CONFIG_DRM_PANEL_XINPENG_XPP055C272=y
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_CDNS_DSI=y
CONFIG_DRM_CHIPONE_ICN6211=m
CONFIG_DRM_CHRONTEL_CH7033=y
# CONFIG_DRM_CROS_EC_ANX7688 is not set
CONFIG_DRM_DISPLAY_CONNECTOR=y
CONFIG_DRM_FSL_LDB=m
CONFIG_DRM_ITE_IT6505=m
# CONFIG_DRM_LONTIUM_LT8912B is not set
# CONFIG_DRM_LONTIUM_LT9211 is not set
# CONFIG_DRM_LONTIUM_LT9611 is not set
CONFIG_DRM_LONTIUM_LT9611UXC=m
# CONFIG_DRM_ITE_IT66121 is not set
# CONFIG_DRM_LVDS_CODEC is not set
# CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW is not set
CONFIG_DRM_NWL_MIPI_DSI=y
# CONFIG_DRM_NXP_PTN3460 is not set
CONFIG_DRM_PARADE_PS8622=y
CONFIG_DRM_PARADE_PS8640=y
CONFIG_DRM_SIL_SII8620=m
# CONFIG_DRM_SII902X is not set
CONFIG_DRM_SII9234=y
# CONFIG_DRM_SIMPLE_BRIDGE is not set
CONFIG_DRM_THINE_THC63LVD1024=m
CONFIG_DRM_TOSHIBA_TC358762=m
CONFIG_DRM_TOSHIBA_TC358764=m
CONFIG_DRM_TOSHIBA_TC358767=y
# CONFIG_DRM_TOSHIBA_TC358768 is not set
CONFIG_DRM_TOSHIBA_TC358775=y
CONFIG_DRM_TI_DLPC3433=y
CONFIG_DRM_TI_TFP410=y
CONFIG_DRM_TI_SN65DSI83=y
CONFIG_DRM_TI_SN65DSI86=y
# CONFIG_DRM_TI_TPD12S015 is not set
# CONFIG_DRM_ANALOGIX_ANX6345 is not set
CONFIG_DRM_ANALOGIX_ANX78XX=y
CONFIG_DRM_ANALOGIX_DP=y
CONFIG_DRM_ANALOGIX_ANX7625=y
CONFIG_DRM_I2C_ADV7511=m
CONFIG_DRM_I2C_ADV7511_CEC=y
# CONFIG_DRM_CDNS_MHDP8546 is not set
CONFIG_DRM_IMX8QM_LDB=m
CONFIG_DRM_IMX8QXP_LDB=y
# CONFIG_DRM_IMX8QXP_PIXEL_COMBINER is not set
# CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI is not set
CONFIG_DRM_DW_HDMI=y
# CONFIG_DRM_DW_HDMI_I2S_AUDIO is not set
CONFIG_DRM_DW_HDMI_CEC=m
# end of Display Interface Bridges

# CONFIG_DRM_INGENIC is not set
CONFIG_DRM_V3D=y
CONFIG_DRM_ETNAVIV=m
CONFIG_DRM_ETNAVIV_THERMAL=y
CONFIG_DRM_HISI_KIRIN=y
CONFIG_DRM_LOGICVC=m
CONFIG_DRM_MXS=y
CONFIG_DRM_MXSFB=y
CONFIG_DRM_IMX_LCDIF=m
CONFIG_DRM_MESON=m
CONFIG_DRM_MESON_DW_HDMI=m
# CONFIG_DRM_ARCPGU is not set
CONFIG_DRM_GM12U320=y
CONFIG_DRM_PANEL_MIPI_DBI=y
# CONFIG_DRM_SIMPLEDRM is not set
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9163 is not set
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
CONFIG_TINYDRM_ILI9486=m
CONFIG_TINYDRM_MI0283QT=m
CONFIG_TINYDRM_REPAPER=m
CONFIG_TINYDRM_ST7586=y
CONFIG_TINYDRM_ST7735R=y
# CONFIG_DRM_PL111 is not set
CONFIG_DRM_TVE200=y
CONFIG_DRM_LIMA=m
CONFIG_DRM_PANFROST=y
CONFIG_DRM_ASPEED_GFX=y
CONFIG_DRM_MCDE=y
# CONFIG_DRM_TIDSS is not set
# CONFIG_DRM_GUD is not set
CONFIG_DRM_SSD130X=y
# CONFIG_DRM_SSD130X_I2C is not set
# CONFIG_DRM_SSD130X_SPI is not set
CONFIG_DRM_SPRD=m
CONFIG_DRM_LEGACY=y
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_NOMODESET=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=m
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_CFB_FILLRECT=m
CONFIG_FB_CFB_COPYAREA=m
CONFIG_FB_CFB_IMAGEBLIT=m
CONFIG_FB_CFB_REV_PIXELS_IN_BYTE=y
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
CONFIG_FB_FOREIGN_ENDIAN=y
CONFIG_FB_BOTH_ENDIAN=y
# CONFIG_FB_BIG_ENDIAN is not set
# CONFIG_FB_LITTLE_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_BACKLIGHT=m
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
CONFIG_FB_ARMCLCD=m
CONFIG_FB_CLPS711X=m
CONFIG_FB_IMX=m
CONFIG_FB_ARC=m
CONFIG_FB_PVR2=m
# CONFIG_FB_OPENCORES is not set
CONFIG_FB_S1D13XXX=m
# CONFIG_FB_ATMEL is not set
CONFIG_FB_PXA168=m
# CONFIG_FB_W100 is not set
CONFIG_FB_SH_MOBILE_LCDC=m
CONFIG_FB_TMIO=m
# CONFIG_FB_TMIO_ACCELL is not set
CONFIG_FB_S3C=m
CONFIG_FB_S3C_DEBUG_REGWRITE=y
CONFIG_FB_SM501=m
CONFIG_FB_SMSCUFX=m
# CONFIG_FB_UDL is not set
CONFIG_FB_IBM_GXT4500=m
CONFIG_FB_XILINX=m
CONFIG_FB_GOLDFISH=m
CONFIG_FB_DA8XX=m
CONFIG_FB_VIRTUAL=m
CONFIG_FB_METRONOME=m
CONFIG_FB_BROADSHEET=m
CONFIG_FB_SIMPLE=m
CONFIG_FB_SSD1307=m
CONFIG_FB_OMAP2=m
# CONFIG_FB_OMAP2_DEBUG_SUPPORT is not set
CONFIG_FB_OMAP2_NUM_FBS=3
CONFIG_FB_OMAP2_DSS_INIT=y
CONFIG_FB_OMAP2_DSS=m
# CONFIG_FB_OMAP2_DSS_DEBUG is not set
# CONFIG_FB_OMAP2_DSS_DEBUGFS is not set
# CONFIG_FB_OMAP2_DSS_DPI is not set
CONFIG_FB_OMAP2_DSS_VENC=y
CONFIG_FB_OMAP2_DSS_HDMI_COMMON=y
CONFIG_FB_OMAP4_DSS_HDMI=y
CONFIG_FB_OMAP5_DSS_HDMI=y
CONFIG_FB_OMAP2_DSS_SDI=y
CONFIG_FB_OMAP2_DSS_DSI=y
CONFIG_FB_OMAP2_DSS_MIN_FCK_PER_PCK=0
CONFIG_FB_OMAP2_DSS_SLEEP_AFTER_VENC_RESET=y

#
# OMAPFB Panel and Encoder Drivers
#
# CONFIG_FB_OMAP2_ENCODER_OPA362 is not set
# CONFIG_FB_OMAP2_ENCODER_TFP410 is not set
CONFIG_FB_OMAP2_ENCODER_TPD12S015=m
CONFIG_FB_OMAP2_CONNECTOR_DVI=m
CONFIG_FB_OMAP2_CONNECTOR_HDMI=m
CONFIG_FB_OMAP2_CONNECTOR_ANALOG_TV=m
# CONFIG_FB_OMAP2_PANEL_DPI is not set
CONFIG_FB_OMAP2_PANEL_LGPHILIPS_LB035Q02=m
CONFIG_FB_OMAP2_PANEL_TPO_TD028TTEC1=m
CONFIG_FB_OMAP2_PANEL_TPO_TD043MTEA1=m
# end of OMAPFB Panel and Encoder Drivers

# CONFIG_MMP_DISP is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
# CONFIG_LCD_L4F00242T03 is not set
CONFIG_LCD_LMS283GF05=m
# CONFIG_LCD_LTV350QV is not set
CONFIG_LCD_ILI922X=m
CONFIG_LCD_ILI9320=y
# CONFIG_LCD_TDO24M is not set
CONFIG_LCD_VGG2432A4=y
CONFIG_LCD_PLATFORM=m
# CONFIG_LCD_AMS369FG06 is not set
CONFIG_LCD_LMS501KF03=y
CONFIG_LCD_HX8357=y
CONFIG_LCD_OTM3225A=y
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
CONFIG_BACKLIGHT_LM3533=m
CONFIG_BACKLIGHT_OMAP1=m
CONFIG_BACKLIGHT_PWM=y
CONFIG_BACKLIGHT_DA9052=m
# CONFIG_BACKLIGHT_MAX8925 is not set
# CONFIG_BACKLIGHT_QCOM_WLED is not set
CONFIG_BACKLIGHT_RT4831=m
CONFIG_BACKLIGHT_WM831X=y
# CONFIG_BACKLIGHT_ADP5520 is not set
CONFIG_BACKLIGHT_ADP8860=m
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_88PM860X is not set
# CONFIG_BACKLIGHT_PCF50633 is not set
# CONFIG_BACKLIGHT_AAT2870 is not set
CONFIG_BACKLIGHT_LM3630A=y
# CONFIG_BACKLIGHT_LM3639 is not set
# CONFIG_BACKLIGHT_LP855X is not set
CONFIG_BACKLIGHT_PANDORA=y
# CONFIG_BACKLIGHT_SKY81452 is not set
CONFIG_BACKLIGHT_TPS65217=m
# CONFIG_BACKLIGHT_GPIO is not set
CONFIG_BACKLIGHT_LV5207LP=m
CONFIG_BACKLIGHT_BD6107=m
CONFIG_BACKLIGHT_ARCXCNN=y
CONFIG_BACKLIGHT_RAVE_SP=m
CONFIG_BACKLIGHT_LED=y
# end of Backlight & LCD device support

CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y
# CONFIG_LOGO is not set
# end of Graphics support

CONFIG_SOUND=m
# CONFIG_SND is not set

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
# CONFIG_HIDRAW is not set
CONFIG_UHID=y
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
# CONFIG_HID_ACRUX is not set
CONFIG_HID_APPLE=m
# CONFIG_HID_AUREAL is not set
CONFIG_HID_BELKIN=y
CONFIG_HID_CHERRY=m
CONFIG_HID_COUGAR=y
CONFIG_HID_MACALLY=y
CONFIG_HID_CMEDIA=y
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=y
# CONFIG_DRAGONRISE_FF is not set
CONFIG_HID_EMS_FF=y
# CONFIG_HID_ELECOM is not set
# CONFIG_HID_EZKEY is not set
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=m
# CONFIG_HID_GLORIOUS is not set
CONFIG_HID_VIVALDI_COMMON=y
CONFIG_HID_VIVALDI=y
# CONFIG_HID_KEYTOUCH is not set
# CONFIG_HID_KYE is not set
# CONFIG_HID_WALTOP is not set
CONFIG_HID_VIEWSONIC=y
CONFIG_HID_XIAOMI=m
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=y
CONFIG_HID_JABRA=m
# CONFIG_HID_TWINHAN is not set
CONFIG_HID_KENSINGTON=m
# CONFIG_HID_LCPOWER is not set
# CONFIG_HID_LED is not set
CONFIG_HID_LENOVO=y
# CONFIG_HID_MAGICMOUSE is not set
CONFIG_HID_MALTRON=y
CONFIG_HID_MAYFLASH=m
CONFIG_HID_REDRAGON=y
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=y
CONFIG_HID_NINTENDO=y
CONFIG_NINTENDO_FF=y
CONFIG_HID_NTI=m
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=y
# CONFIG_PANTHERLORD_FF is not set
CONFIG_HID_PETALYNX=y
CONFIG_HID_PICOLCD=y
# CONFIG_HID_PICOLCD_BACKLIGHT is not set
# CONFIG_HID_PICOLCD_LCD is not set
# CONFIG_HID_PICOLCD_LEDS is not set
CONFIG_HID_PLANTRONICS=y
CONFIG_HID_RAZER=y
CONFIG_HID_PRIMAX=y
# CONFIG_HID_SAITEK is not set
CONFIG_HID_SEMITEK=y
CONFIG_HID_SPEEDLINK=y
CONFIG_HID_STEAM=m
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=y
CONFIG_HID_GREENASIA=y
# CONFIG_GREENASIA_FF is not set
# CONFIG_HID_SMARTJOYPLUS is not set
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
# CONFIG_HID_THINGM is not set
# CONFIG_HID_UDRAW_PS3 is not set
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=y
CONFIG_HID_ZEROPLUS=m
CONFIG_ZEROPLUS_FF=y
# CONFIG_HID_ZYDACRON is not set
CONFIG_HID_SENSOR_HUB=y
# CONFIG_HID_SENSOR_CUSTOM_SENSOR is not set
CONFIG_HID_ALPS=y
# end of Special HID drivers

#
# USB HID support
#
# CONFIG_USB_HID is not set
# CONFIG_HID_PID is not set

#
# USB HID Boot Protocol drivers
#
CONFIG_USB_KBD=m
CONFIG_USB_MOUSE=y
# end of USB HID Boot Protocol drivers
# end of USB HID support

#
# I2C HID support
#
CONFIG_I2C_HID_OF=m
CONFIG_I2C_HID_OF_ELAN=y
CONFIG_I2C_HID_OF_GOODIX=y
# end of I2C HID support

CONFIG_I2C_HID_CORE=y
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_ULPI_BUS=m
CONFIG_USB_CONN_GPIO=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
CONFIG_USB_DYNAMIC_MINORS=y
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_PRODUCTLIST is not set
# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
CONFIG_USB_AUTOSUSPEND_DELAY=2
# CONFIG_USB_MON is not set

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=y
CONFIG_USB_XHCI_HCD=m
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI_RENESAS=m
CONFIG_USB_XHCI_PLATFORM=m
CONFIG_USB_XHCI_HISTB=m
CONFIG_USB_XHCI_MTK=m
# CONFIG_USB_XHCI_MVEBU is not set
CONFIG_USB_XHCI_RCAR=m
CONFIG_USB_XHCI_TEGRA=m
CONFIG_USB_BRCMSTB=y
# CONFIG_USB_EHCI_HCD is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
CONFIG_USB_ISP1362_HCD=m
CONFIG_USB_FOTG210_HCD=m
CONFIG_USB_MAX3421_HCD=y
# CONFIG_USB_OHCI_HCD is not set
# CONFIG_USB_U132_HCD is not set
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
CONFIG_USB_HCD_BCMA=m
CONFIG_USB_HCD_SSB=m
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=m
CONFIG_USB_PRINTER=y
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
CONFIG_USB_CDNS_SUPPORT=y
# CONFIG_USB_CDNS3 is not set
CONFIG_USB_MTU3=y
CONFIG_USB_MTU3_HOST=y
# CONFIG_USB_MTU3_DEBUG is not set
CONFIG_USB_MUSB_HDRC=y
CONFIG_USB_MUSB_HOST=y

#
# Platform Glue Layer
#
CONFIG_USB_MUSB_TUSB6010=m
CONFIG_USB_MUSB_DSPS=m
CONFIG_USB_MUSB_UX500=y
CONFIG_USB_MUSB_MEDIATEK=m
# CONFIG_USB_MUSB_POLARFIRE_SOC is not set

#
# MUSB DMA mode
#
CONFIG_MUSB_PIO_ONLY=y
CONFIG_USB_DWC3=m
CONFIG_USB_DWC3_ULPI=y
CONFIG_USB_DWC3_HOST=y

#
# Platform Glue Driver Support
#
# CONFIG_USB_DWC3_OMAP is not set
CONFIG_USB_DWC3_EXYNOS=m
CONFIG_USB_DWC3_KEYSTONE=m
CONFIG_USB_DWC3_MESON_G12A=m
CONFIG_USB_DWC3_OF_SIMPLE=m
# CONFIG_USB_DWC3_ST is not set
CONFIG_USB_DWC3_QCOM=m
CONFIG_USB_DWC3_IMX8MP=m
CONFIG_USB_DWC3_XILINX=m
CONFIG_USB_DWC3_AM62=m
# CONFIG_USB_DWC2 is not set
CONFIG_USB_ISP1760=m
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1760_HOST_ROLE=y

#
# USB port drivers
#
CONFIG_USB_SERIAL=m
# CONFIG_USB_SERIAL_GENERIC is not set
CONFIG_USB_SERIAL_SIMPLE=m
# CONFIG_USB_SERIAL_AIRCABLE is not set
CONFIG_USB_SERIAL_ARK3116=m
CONFIG_USB_SERIAL_BELKIN=m
# CONFIG_USB_SERIAL_CH341 is not set
CONFIG_USB_SERIAL_WHITEHEAT=m
CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m
CONFIG_USB_SERIAL_CP210X=m
CONFIG_USB_SERIAL_CYPRESS_M8=m
# CONFIG_USB_SERIAL_EMPEG is not set
# CONFIG_USB_SERIAL_FTDI_SIO is not set
CONFIG_USB_SERIAL_VISOR=m
# CONFIG_USB_SERIAL_IPAQ is not set
CONFIG_USB_SERIAL_IR=m
CONFIG_USB_SERIAL_EDGEPORT=m
# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
CONFIG_USB_SERIAL_F81232=m
CONFIG_USB_SERIAL_F8153X=m
CONFIG_USB_SERIAL_GARMIN=m
CONFIG_USB_SERIAL_IPW=m
# CONFIG_USB_SERIAL_IUU is not set
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
CONFIG_USB_SERIAL_KEYSPAN=m
CONFIG_USB_SERIAL_KLSI=m
CONFIG_USB_SERIAL_KOBIL_SCT=m
# CONFIG_USB_SERIAL_MCT_U232 is not set
# CONFIG_USB_SERIAL_METRO is not set
CONFIG_USB_SERIAL_MOS7720=m
CONFIG_USB_SERIAL_MOS7840=m
CONFIG_USB_SERIAL_MXUPORT=m
CONFIG_USB_SERIAL_NAVMAN=m
# CONFIG_USB_SERIAL_PL2303 is not set
CONFIG_USB_SERIAL_OTI6858=m
# CONFIG_USB_SERIAL_QCAUX is not set
CONFIG_USB_SERIAL_QUALCOMM=m
CONFIG_USB_SERIAL_SPCP8X5=m
# CONFIG_USB_SERIAL_SAFE is not set
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
# CONFIG_USB_SERIAL_SYMBOL is not set
# CONFIG_USB_SERIAL_TI is not set
# CONFIG_USB_SERIAL_CYBERJACK is not set
CONFIG_USB_SERIAL_WWAN=m
CONFIG_USB_SERIAL_OPTION=m
CONFIG_USB_SERIAL_OMNINET=m
# CONFIG_USB_SERIAL_OPTICON is not set
CONFIG_USB_SERIAL_XSENS_MT=m
CONFIG_USB_SERIAL_WISHBONE=m
CONFIG_USB_SERIAL_SSU100=m
CONFIG_USB_SERIAL_QT2=m
CONFIG_USB_SERIAL_UPD78F0730=m
# CONFIG_USB_SERIAL_XR is not set
CONFIG_USB_SERIAL_DEBUG=m

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=y
CONFIG_USB_EMI26=y
CONFIG_USB_ADUTUX=y
CONFIG_USB_SEVSEG=m
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
CONFIG_USB_FTDI_ELAN=y
CONFIG_USB_APPLEDISPLAY=y
# CONFIG_USB_QCOM_EUD is not set
CONFIG_APPLE_MFI_FASTCHARGE=m
# CONFIG_USB_SISUSBVGA is not set
CONFIG_USB_LD=y
# CONFIG_USB_TRANCEVIBRATOR is not set
CONFIG_USB_IOWARRIOR=m
CONFIG_USB_TEST=y
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=y
CONFIG_USB_YUREX=y
CONFIG_USB_EZUSB_FX2=m
CONFIG_USB_HUB_USB251XB=m
CONFIG_USB_HSIC_USB3503=m
CONFIG_USB_HSIC_USB4604=y
CONFIG_USB_LINK_LAYER_TEST=m
CONFIG_USB_CHAOSKEY=m
CONFIG_BRCM_USB_PINMAP=y
CONFIG_USB_ONBOARD_HUB=m

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
CONFIG_KEYSTONE_USB_PHY=y
CONFIG_NOP_USB_XCEIV=y
CONFIG_AM335X_CONTROL_USB=m
CONFIG_AM335X_PHY_USB=m
CONFIG_USB_GPIO_VBUS=y
CONFIG_TAHVO_USB=m
# CONFIG_TAHVO_USB_HOST_BY_DEFAULT is not set
CONFIG_USB_ISP1301=y
CONFIG_USB_TEGRA_PHY=y
CONFIG_USB_ULPI=y
CONFIG_USB_ULPI_VIEWPORT=y
# CONFIG_JZ4770_PHY is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
# CONFIG_TYPEC is not set
CONFIG_USB_ROLE_SWITCH=y
CONFIG_MMC=y
CONFIG_PWRSEQ_EMMC=y
# CONFIG_PWRSEQ_SIMPLE is not set
CONFIG_SDIO_UART=m
CONFIG_MMC_TEST=m

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_ARMMMCI=m
CONFIG_MMC_STM32_SDMMC=y
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PLTFM=m
CONFIG_MMC_SDHCI_OF_ARASAN=m
# CONFIG_MMC_SDHCI_OF_ASPEED is not set
CONFIG_MMC_SDHCI_OF_AT91=m
CONFIG_MMC_SDHCI_OF_ESDHC=m
CONFIG_MMC_SDHCI_OF_DWCMSHC=m
CONFIG_MMC_SDHCI_OF_SPARX5=m
CONFIG_MMC_SDHCI_CADENCE=m
# CONFIG_MMC_SDHCI_CNS3XXX is not set
CONFIG_MMC_SDHCI_ESDHC_IMX=m
CONFIG_MMC_SDHCI_DOVE=m
CONFIG_MMC_SDHCI_TEGRA=m
CONFIG_MMC_SDHCI_S3C=m
# CONFIG_MMC_SDHCI_PXAV3 is not set
# CONFIG_MMC_SDHCI_PXAV2 is not set
CONFIG_MMC_SDHCI_SPEAR=m
CONFIG_MMC_SDHCI_S3C_DMA=y
CONFIG_MMC_SDHCI_BCM_KONA=m
CONFIG_MMC_SDHCI_F_SDH30=m
# CONFIG_MMC_SDHCI_MILBEAUT is not set
# CONFIG_MMC_SDHCI_IPROC is not set
CONFIG_MMC_MESON_GX=m
# CONFIG_MMC_MESON_MX_SDHC is not set
CONFIG_MMC_MESON_MX_SDIO=m
CONFIG_MMC_MOXART=m
# CONFIG_MMC_SDHCI_ST is not set
CONFIG_MMC_OMAP_HS=m
CONFIG_MMC_SDHCI_MSM=m
# CONFIG_MMC_DAVINCI is not set
# CONFIG_MMC_SPI is not set
# CONFIG_MMC_S3C is not set
# CONFIG_MMC_SDHCI_SPRD is not set
CONFIG_MMC_TMIO_CORE=y
# CONFIG_MMC_TMIO is not set
CONFIG_MMC_SDHI=y
CONFIG_MMC_SDHI_SYS_DMAC=y
CONFIG_MMC_SDHI_INTERNAL_DMAC=m
CONFIG_MMC_UNIPHIER=m
CONFIG_MMC_DW=y
CONFIG_MMC_DW_PLTFM=y
# CONFIG_MMC_DW_BLUEFIELD is not set
CONFIG_MMC_DW_EXYNOS=y
# CONFIG_MMC_DW_HI3798CV200 is not set
# CONFIG_MMC_DW_K3 is not set
CONFIG_MMC_SH_MMCIF=y
# CONFIG_MMC_VUB300 is not set
# CONFIG_MMC_USHC is not set
CONFIG_MMC_USDHI6ROL0=m
CONFIG_MMC_REALTEK_USB=m
CONFIG_MMC_CQHCI=m
CONFIG_MMC_HSQ=y
# CONFIG_MMC_BCM2835 is not set
# CONFIG_MMC_MTK is not set
CONFIG_MMC_SDHCI_XENON=m
CONFIG_MMC_SDHCI_OMAP=m
CONFIG_MMC_SDHCI_AM654=m
CONFIG_MMC_OWL=y
# CONFIG_MMC_LITEX is not set
CONFIG_MEMSTICK=m
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_REALTEK_USB=m
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=m
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
CONFIG_LEDS_88PM860X=y
CONFIG_LEDS_AN30259A=y
# CONFIG_LEDS_ARIEL is not set
CONFIG_LEDS_AW2013=m
CONFIG_LEDS_BCM6328=y
CONFIG_LEDS_BCM6358=m
CONFIG_LEDS_CR0014114=m
CONFIG_LEDS_EL15203000=y
CONFIG_LEDS_LM3530=y
CONFIG_LEDS_LM3532=m
CONFIG_LEDS_LM3533=y
# CONFIG_LEDS_LM3642 is not set
CONFIG_LEDS_LM3692X=m
CONFIG_LEDS_S3C24XX=m
# CONFIG_LEDS_COBALT_QUBE is not set
# CONFIG_LEDS_COBALT_RAQ is not set
# CONFIG_LEDS_PCA9532 is not set
CONFIG_LEDS_GPIO=m
# CONFIG_LEDS_LP3944 is not set
CONFIG_LEDS_LP3952=y
# CONFIG_LEDS_LP50XX is not set
CONFIG_LEDS_LP55XX_COMMON=y
CONFIG_LEDS_LP5521=y
CONFIG_LEDS_LP5523=y
CONFIG_LEDS_LP5562=m
# CONFIG_LEDS_LP8501 is not set
# CONFIG_LEDS_LP8860 is not set
# CONFIG_LEDS_PCA955X is not set
CONFIG_LEDS_PCA963X=m
CONFIG_LEDS_WM831X_STATUS=m
CONFIG_LEDS_DA9052=y
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_PWM is not set
CONFIG_LEDS_REGULATOR=y
CONFIG_LEDS_BD2802=y
CONFIG_LEDS_LT3593=y
# CONFIG_LEDS_ADP5520 is not set
# CONFIG_LEDS_MC13783 is not set
CONFIG_LEDS_NS2=y
CONFIG_LEDS_NETXBIG=y
CONFIG_LEDS_ASIC3=y
CONFIG_LEDS_TCA6507=m
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_MAX77650 is not set
CONFIG_LEDS_MAX8997=m
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_OT200 is not set
CONFIG_LEDS_MENF21BMC=m
CONFIG_LEDS_IS31FL319X=m
CONFIG_LEDS_IS31FL32XX=m

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
CONFIG_LEDS_SYSCON=y
CONFIG_LEDS_MLXREG=m
CONFIG_LEDS_USER=y
CONFIG_LEDS_SPI_BYTE=m
# CONFIG_LEDS_TI_LMU_COMMON is not set
# CONFIG_LEDS_IP30 is not set
CONFIG_LEDS_BCM63138=y
# CONFIG_LEDS_LGM is not set

#
# Flash and Torch LED drivers
#
CONFIG_LEDS_AAT1290=m
CONFIG_LEDS_AS3645A=m
# CONFIG_LEDS_KTD2692 is not set
CONFIG_LEDS_LM3601X=m
# CONFIG_LEDS_MT6360 is not set
# CONFIG_LEDS_RT4505 is not set
# CONFIG_LEDS_RT8515 is not set
CONFIG_LEDS_SGM3140=m

#
# RGB LED drivers
#

#
# LED Triggers
#
# CONFIG_LEDS_TRIGGERS is not set

#
# Simple LED drivers
#
CONFIG_ACCESSIBILITY=y

#
# Speakup console speech
#
# end of Speakup console speech

CONFIG_EDAC_SUPPORT=y
# CONFIG_EDAC is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
CONFIG_RTC_SYSTOHC=y
CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
# CONFIG_RTC_INTF_SYSFS is not set
CONFIG_RTC_INTF_DEV=y
CONFIG_RTC_INTF_DEV_UIE_EMUL=y
CONFIG_RTC_DRV_TEST=y

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_88PM860X is not set
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
CONFIG_RTC_DRV_ABX80X=y
CONFIG_RTC_DRV_AC100=m
CONFIG_RTC_DRV_BRCMSTB=y
# CONFIG_RTC_DRV_AS3722 is not set
CONFIG_RTC_DRV_DS1307=y
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=m
CONFIG_RTC_DRV_DS1374_WDT=y
CONFIG_RTC_DRV_DS1672=y
CONFIG_RTC_DRV_HYM8563=y
# CONFIG_RTC_DRV_MAX6900 is not set
# CONFIG_RTC_DRV_MAX8907 is not set
# CONFIG_RTC_DRV_MAX8925 is not set
CONFIG_RTC_DRV_MAX8997=y
CONFIG_RTC_DRV_MAX77686=m
# CONFIG_RTC_DRV_NCT3018Y is not set
# CONFIG_RTC_DRV_RK808 is not set
CONFIG_RTC_DRV_RS5C372=y
CONFIG_RTC_DRV_ISL1208=y
CONFIG_RTC_DRV_ISL12022=y
# CONFIG_RTC_DRV_ISL12026 is not set
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=y
CONFIG_RTC_DRV_PCF85063=y
# CONFIG_RTC_DRV_PCF85363 is not set
# CONFIG_RTC_DRV_PCF8563 is not set
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=y
# CONFIG_RTC_DRV_M41T80_WDT is not set
CONFIG_RTC_DRV_BD70528=m
CONFIG_RTC_DRV_BQ32K=y
# CONFIG_RTC_DRV_TWL4030 is not set
# CONFIG_RTC_DRV_PALMAS is not set
CONFIG_RTC_DRV_TPS65910=y
CONFIG_RTC_DRV_RC5T619=m
# CONFIG_RTC_DRV_S35390A is not set
# CONFIG_RTC_DRV_FM3130 is not set
# CONFIG_RTC_DRV_RX8010 is not set
# CONFIG_RTC_DRV_RX8581 is not set
# CONFIG_RTC_DRV_RX8025 is not set
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3028 is not set
CONFIG_RTC_DRV_RV3032=y
CONFIG_RTC_DRV_RV8803=y
# CONFIG_RTC_DRV_S5M is not set
CONFIG_RTC_DRV_SD3078=y

#
# SPI RTC drivers
#
CONFIG_RTC_DRV_M41T93=y
CONFIG_RTC_DRV_M41T94=m
CONFIG_RTC_DRV_DS1302=y
CONFIG_RTC_DRV_DS1305=m
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
# CONFIG_RTC_DRV_DS1390 is not set
# CONFIG_RTC_DRV_MAX6916 is not set
CONFIG_RTC_DRV_R9701=y
CONFIG_RTC_DRV_RX4581=m
CONFIG_RTC_DRV_RS5C348=y
CONFIG_RTC_DRV_MAX6902=y
# CONFIG_RTC_DRV_PCF2123 is not set
CONFIG_RTC_DRV_MCP795=m
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
CONFIG_RTC_DRV_PCF2127=y
CONFIG_RTC_DRV_RV3029C2=m
CONFIG_RTC_DRV_RV3029_HWMON=y
CONFIG_RTC_DRV_RX6110=m

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=m
CONFIG_RTC_DRV_DS1553=m
CONFIG_RTC_DRV_DS1685_FAMILY=m
# CONFIG_RTC_DRV_DS1685 is not set
CONFIG_RTC_DRV_DS1689=y
# CONFIG_RTC_DRV_DS17285 is not set
# CONFIG_RTC_DRV_DS17485 is not set
# CONFIG_RTC_DRV_DS17885 is not set
CONFIG_RTC_DRV_DS1742=y
CONFIG_RTC_DRV_DS2404=m
# CONFIG_RTC_DRV_DA9052 is not set
# CONFIG_RTC_DRV_DA9055 is not set
CONFIG_RTC_DRV_DA9063=m
CONFIG_RTC_DRV_STK17TA8=m
CONFIG_RTC_DRV_M48T86=m
CONFIG_RTC_DRV_M48T35=m
# CONFIG_RTC_DRV_M48T59 is not set
# CONFIG_RTC_DRV_MSM6242 is not set
# CONFIG_RTC_DRV_BQ4802 is not set
# CONFIG_RTC_DRV_RP5C01 is not set
# CONFIG_RTC_DRV_V3020 is not set
CONFIG_RTC_DRV_GAMECUBE=y
CONFIG_RTC_DRV_WM831X=m
CONFIG_RTC_DRV_SC27XX=m
CONFIG_RTC_DRV_SPEAR=m
CONFIG_RTC_DRV_PCF50633=y
CONFIG_RTC_DRV_ZYNQMP=y
# CONFIG_RTC_DRV_CROS_EC is not set
CONFIG_RTC_DRV_NTXEC=y

#
# on-CPU RTC drivers
#
CONFIG_RTC_DRV_ASM9260=m
CONFIG_RTC_DRV_DAVINCI=y
# CONFIG_RTC_DRV_DIGICOLOR is not set
# CONFIG_RTC_DRV_FSL_FTM_ALARM is not set
CONFIG_RTC_DRV_MESON=y
CONFIG_RTC_DRV_MESON_VRTC=y
CONFIG_RTC_DRV_OMAP=y
# CONFIG_RTC_DRV_S3C is not set
CONFIG_RTC_DRV_EP93XX=y
# CONFIG_RTC_DRV_SH is not set
# CONFIG_RTC_DRV_PL030 is not set
# CONFIG_RTC_DRV_PL031 is not set
CONFIG_RTC_DRV_AT91RM9200=y
CONFIG_RTC_DRV_AT91SAM9=m
CONFIG_RTC_DRV_RZN1=y
CONFIG_RTC_DRV_GENERIC=y
CONFIG_RTC_DRV_VT8500=y
CONFIG_RTC_DRV_SUN6I=y
CONFIG_RTC_DRV_SUNXI=m
CONFIG_RTC_DRV_MV=m
CONFIG_RTC_DRV_ARMADA38X=y
CONFIG_RTC_DRV_CADENCE=y
# CONFIG_RTC_DRV_FTRTC010 is not set
CONFIG_RTC_DRV_STMP=m
CONFIG_RTC_DRV_PCAP=m
CONFIG_RTC_DRV_MC13XXX=m
CONFIG_RTC_DRV_JZ4740=m
# CONFIG_RTC_DRV_LPC24XX is not set
# CONFIG_RTC_DRV_LPC32XX is not set
# CONFIG_RTC_DRV_PM8XXX is not set
CONFIG_RTC_DRV_TEGRA=y
# CONFIG_RTC_DRV_MXC is not set
# CONFIG_RTC_DRV_MXC_V2 is not set
# CONFIG_RTC_DRV_SNVS is not set
# CONFIG_RTC_DRV_MOXART is not set
CONFIG_RTC_DRV_MT2712=y
# CONFIG_RTC_DRV_MT6397 is not set
CONFIG_RTC_DRV_MT7622=m
# CONFIG_RTC_DRV_XGENE is not set
CONFIG_RTC_DRV_R7301=y
# CONFIG_RTC_DRV_STM32 is not set
# CONFIG_RTC_DRV_RTD119X is not set
CONFIG_RTC_DRV_ASPEED=y
CONFIG_RTC_DRV_TI_K3=m

#
# HID Sensor RTC drivers
#
CONFIG_RTC_DRV_GOLDFISH=y
CONFIG_RTC_DRV_MSC313=y
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
CONFIG_UDMABUF=y
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
CONFIG_DMABUF_HEAPS=y
CONFIG_DMABUF_SYSFS_STATS=y
# CONFIG_DMABUF_HEAPS_SYSTEM is not set
# CONFIG_DMABUF_HEAPS_CMA is not set
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
CONFIG_UIO=y
# CONFIG_UIO_PDRV_GENIRQ is not set
# CONFIG_UIO_DMEM_GENIRQ is not set
# CONFIG_UIO_PRUSS is not set
# CONFIG_UIO_DFL is not set
# CONFIG_VFIO is not set
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
# CONFIG_VIRTIO_BALLOON is not set
CONFIG_VIRTIO_INPUT=y
CONFIG_VIRTIO_MMIO=y
# CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
CONFIG_VHOST_MENU=y
CONFIG_VHOST_CROSS_ENDIAN_LEGACY=y

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
CONFIG_COMEDI=y
CONFIG_COMEDI_DEBUG=y
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
CONFIG_COMEDI_MISC_DRIVERS=y
# CONFIG_COMEDI_BOND is not set
CONFIG_COMEDI_TEST=y
# CONFIG_COMEDI_PARPORT is not set
CONFIG_COMEDI_SSV_DNP=y
# CONFIG_COMEDI_ISA_DRIVERS is not set
# CONFIG_COMEDI_PCMCIA_DRIVERS is not set
CONFIG_COMEDI_USB_DRIVERS=y
# CONFIG_COMEDI_DT9812 is not set
# CONFIG_COMEDI_NI_USB6501 is not set
CONFIG_COMEDI_USBDUX=m
CONFIG_COMEDI_USBDUXFAST=m
CONFIG_COMEDI_USBDUXSIGMA=y
# CONFIG_COMEDI_VMK80XX is not set
CONFIG_COMEDI_8255=y
CONFIG_COMEDI_8255_SA=y
CONFIG_COMEDI_KCOMEDILIB=m
# CONFIG_COMEDI_TESTS is not set
# CONFIG_STAGING is not set
CONFIG_GOLDFISH=y
CONFIG_GOLDFISH_PIPE=y
CONFIG_CHROME_PLATFORMS=y
CONFIG_CROS_EC=y
# CONFIG_CROS_EC_I2C is not set
CONFIG_CROS_EC_RPMSG=m
CONFIG_CROS_EC_SPI=y
CONFIG_CROS_EC_PROTO=y
CONFIG_CROS_KBD_LED_BACKLIGHT=y
CONFIG_MELLANOX_PLATFORM=y
CONFIG_MLXREG_HOTPLUG=y
# CONFIG_MLXREG_IO is not set
CONFIG_MLXREG_LC=m
CONFIG_NVSW_SN2201=y
CONFIG_OLPC_XO175=y
# CONFIG_OLPC_XO175_EC is not set
CONFIG_SURFACE_PLATFORMS=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
CONFIG_COMMON_CLK_WM831X=m

#
# Clock driver for ARM Reference designs
#
# CONFIG_CLK_ICST is not set
CONFIG_CLK_SP810=y
# end of Clock driver for ARM Reference designs

CONFIG_CLK_HSDK=y
CONFIG_LMK04832=y
CONFIG_COMMON_CLK_APPLE_NCO=m
# CONFIG_COMMON_CLK_MAX77686 is not set
CONFIG_COMMON_CLK_MAX9485=m
CONFIG_COMMON_CLK_RK808=m
CONFIG_COMMON_CLK_HI655X=m
CONFIG_COMMON_CLK_SCMI=m
# CONFIG_COMMON_CLK_SCPI is not set
# CONFIG_COMMON_CLK_SI5341 is not set
CONFIG_COMMON_CLK_SI5351=y
CONFIG_COMMON_CLK_SI514=m
CONFIG_COMMON_CLK_SI544=y
# CONFIG_COMMON_CLK_SI570 is not set
CONFIG_COMMON_CLK_BM1880=y
CONFIG_COMMON_CLK_CDCE706=y
CONFIG_COMMON_CLK_TPS68470=m
CONFIG_COMMON_CLK_CDCE925=y
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_EN7523 is not set
# CONFIG_COMMON_CLK_FSL_FLEXSPI is not set
CONFIG_COMMON_CLK_FSL_SAI=y
CONFIG_COMMON_CLK_GEMINI=y
# CONFIG_COMMON_CLK_LAN966X is not set
# CONFIG_COMMON_CLK_ASPEED is not set
CONFIG_COMMON_CLK_S2MPS11=m
# CONFIG_CLK_TWL6040 is not set
CONFIG_COMMON_CLK_AXI_CLKGEN=y
# CONFIG_CLK_QORIQ is not set
CONFIG_CLK_LS1028A_PLLDIG=y
CONFIG_COMMON_CLK_XGENE=y
CONFIG_COMMON_CLK_PALMAS=y
CONFIG_COMMON_CLK_PWM=y
CONFIG_COMMON_CLK_OXNAS=y
CONFIG_COMMON_CLK_RS9_PCIE=m
CONFIG_COMMON_CLK_VC5=m
CONFIG_COMMON_CLK_MMP2_AUDIO=y
CONFIG_COMMON_CLK_BD718XX=m
# CONFIG_COMMON_CLK_FIXED_MMIO is not set
CONFIG_CLK_ACTIONS=y
CONFIG_CLK_OWL_S500=y
CONFIG_CLK_OWL_S700=y
CONFIG_CLK_OWL_S900=y
# CONFIG_CLK_BAIKAL_T1 is not set
CONFIG_CLK_BCM2711_DVP=m
CONFIG_CLK_BCM2835=y
# CONFIG_CLK_BCM_63XX is not set
CONFIG_CLK_BCM_63XX_GATE=y
CONFIG_CLK_BCM_KONA=y
CONFIG_COMMON_CLK_IPROC=y
# CONFIG_CLK_BCM_CYGNUS is not set
# CONFIG_CLK_BCM_HR2 is not set
CONFIG_CLK_BCM_NSP=y
CONFIG_CLK_BCM_NS2=y
CONFIG_CLK_BCM_SR=y
CONFIG_CLK_RASPBERRYPI=y
# CONFIG_COMMON_CLK_HI3516CV300 is not set
CONFIG_COMMON_CLK_HI3519=m
CONFIG_COMMON_CLK_HI3559A=y
# CONFIG_COMMON_CLK_HI3660 is not set
# CONFIG_COMMON_CLK_HI3670 is not set
CONFIG_COMMON_CLK_HI3798CV200=m
CONFIG_COMMON_CLK_HI6220=y
CONFIG_RESET_HISI=y
# CONFIG_STUB_CLK_HI6220 is not set
CONFIG_STUB_CLK_HI3660=y
# CONFIG_COMMON_CLK_BOSTON is not set
CONFIG_MXC_CLK=y
CONFIG_CLK_IMX8MM=y
CONFIG_CLK_IMX8MN=m
CONFIG_CLK_IMX8MP=y
CONFIG_CLK_IMX8MQ=y
CONFIG_CLK_IMX8ULP=y
CONFIG_CLK_IMX93=y

#
# Ingenic SoCs drivers
#
CONFIG_INGENIC_CGU_COMMON=y
CONFIG_INGENIC_CGU_JZ4740=y
# CONFIG_INGENIC_CGU_JZ4725B is not set
CONFIG_INGENIC_CGU_JZ4760=y
# CONFIG_INGENIC_CGU_JZ4770 is not set
CONFIG_INGENIC_CGU_JZ4780=y
# CONFIG_INGENIC_CGU_X1000 is not set
# CONFIG_INGENIC_CGU_X1830 is not set
CONFIG_INGENIC_TCU_CLK=y
# end of Ingenic SoCs drivers

CONFIG_COMMON_CLK_KEYSTONE=y
# CONFIG_TI_SYSCON_CLK is not set

#
# Clock driver for MediaTek SoC
#
CONFIG_COMMON_CLK_MEDIATEK=y
# CONFIG_COMMON_CLK_MT2701 is not set
CONFIG_COMMON_CLK_MT2712=y
CONFIG_COMMON_CLK_MT2712_BDPSYS=y
# CONFIG_COMMON_CLK_MT2712_IMGSYS is not set
# CONFIG_COMMON_CLK_MT2712_JPGDECSYS is not set
CONFIG_COMMON_CLK_MT2712_MFGCFG=y
CONFIG_COMMON_CLK_MT2712_MMSYS=y
# CONFIG_COMMON_CLK_MT2712_VDECSYS is not set
# CONFIG_COMMON_CLK_MT2712_VENCSYS is not set
# CONFIG_COMMON_CLK_MT6765 is not set
# CONFIG_COMMON_CLK_MT6779 is not set
# CONFIG_COMMON_CLK_MT6797 is not set
CONFIG_COMMON_CLK_MT7622=y
CONFIG_COMMON_CLK_MT7622_ETHSYS=y
# CONFIG_COMMON_CLK_MT7622_HIFSYS is not set
CONFIG_COMMON_CLK_MT7622_AUDSYS=y
CONFIG_COMMON_CLK_MT7629=y
CONFIG_COMMON_CLK_MT7629_ETHSYS=y
CONFIG_COMMON_CLK_MT7629_HIFSYS=y
# CONFIG_COMMON_CLK_MT7986 is not set
CONFIG_COMMON_CLK_MT8135=y
# CONFIG_COMMON_CLK_MT8167 is not set
# CONFIG_COMMON_CLK_MT8173 is not set
CONFIG_COMMON_CLK_MT8183=y
CONFIG_COMMON_CLK_MT8183_AUDIOSYS=y
CONFIG_COMMON_CLK_MT8183_CAMSYS=y
# CONFIG_COMMON_CLK_MT8183_IMGSYS is not set
CONFIG_COMMON_CLK_MT8183_IPU_CORE0=y
CONFIG_COMMON_CLK_MT8183_IPU_CORE1=y
CONFIG_COMMON_CLK_MT8183_IPU_ADL=y
CONFIG_COMMON_CLK_MT8183_IPU_CONN=y
# CONFIG_COMMON_CLK_MT8183_MFGCFG is not set
CONFIG_COMMON_CLK_MT8183_MMSYS=y
CONFIG_COMMON_CLK_MT8183_VDECSYS=y
# CONFIG_COMMON_CLK_MT8183_VENCSYS is not set
# CONFIG_COMMON_CLK_MT8186 is not set
# CONFIG_COMMON_CLK_MT8192 is not set
CONFIG_COMMON_CLK_MT8195=y
# CONFIG_COMMON_CLK_MT8516 is not set
# end of Clock driver for MediaTek SoC

#
# Clock support for Amlogic platforms
#
CONFIG_COMMON_CLK_MESON_REGMAP=y
CONFIG_COMMON_CLK_MESON_DUALDIV=y
CONFIG_COMMON_CLK_MESON_MPLL=y
CONFIG_COMMON_CLK_MESON_PLL=y
CONFIG_COMMON_CLK_MESON_VID_PLL_DIV=m
CONFIG_COMMON_CLK_MESON_AO_CLKC=y
CONFIG_COMMON_CLK_MESON_EE_CLKC=y
CONFIG_COMMON_CLK_MESON_CPU_DYNDIV=m
CONFIG_COMMON_CLK_GXBB=m
CONFIG_COMMON_CLK_AXG=y
# CONFIG_COMMON_CLK_AXG_AUDIO is not set
CONFIG_COMMON_CLK_G12A=m
# end of Clock support for Amlogic platforms

CONFIG_MSTAR_MSC313_MPLL=y
CONFIG_MCHP_CLK_MPFS=y
CONFIG_ARMADA_AP_CP_HELPER=y
CONFIG_ARMADA_37XX_CLK=y
CONFIG_ARMADA_AP806_SYSCON=y
CONFIG_ARMADA_CP110_SYSCON=y
CONFIG_COMMON_CLK_PISTACHIO=y
CONFIG_QCOM_GDSC=y
CONFIG_QCOM_RPMCC=y
CONFIG_COMMON_CLK_QCOM=m
# CONFIG_QCOM_A53PLL is not set
CONFIG_QCOM_A7PLL=m
CONFIG_QCOM_CLK_APCS_MSM8916=m
# CONFIG_QCOM_CLK_APCC_MSM8996 is not set
CONFIG_QCOM_CLK_APCS_SDX55=m
# CONFIG_QCOM_CLK_RPM is not set
CONFIG_QCOM_CLK_SMD_RPM=m
CONFIG_APQ_GCC_8084=m
CONFIG_APQ_MMCC_8084=m
CONFIG_IPQ_APSS_PLL=m
CONFIG_IPQ_APSS_6018=m
CONFIG_IPQ_GCC_4019=m
CONFIG_IPQ_GCC_6018=m
CONFIG_IPQ_GCC_806X=m
CONFIG_IPQ_LCC_806X=m
CONFIG_IPQ_GCC_8074=m
CONFIG_MSM_GCC_8660=m
CONFIG_MSM_GCC_8916=m
CONFIG_MSM_GCC_8939=m
CONFIG_MSM_GCC_8960=m
CONFIG_MSM_LCC_8960=m
CONFIG_MDM_GCC_9607=m
CONFIG_MDM_GCC_9615=m
CONFIG_MDM_LCC_9615=m
CONFIG_MSM_MMCC_8960=m
CONFIG_MSM_GCC_8953=m
CONFIG_MSM_GCC_8974=m
CONFIG_MSM_MMCC_8974=m
CONFIG_MSM_GCC_8976=m
CONFIG_MSM_MMCC_8994=m
CONFIG_MSM_GCC_8994=m
# CONFIG_MSM_GCC_8996 is not set
# CONFIG_MSM_MMCC_8996 is not set
CONFIG_MSM_GCC_8998=m
# CONFIG_MSM_GPUCC_8998 is not set
CONFIG_MSM_MMCC_8998=m
CONFIG_QCM_GCC_2290=m
CONFIG_QCM_DISPCC_2290=m
CONFIG_QCS_GCC_404=m
CONFIG_SC_CAMCC_7180=m
CONFIG_SC_CAMCC_7280=m
CONFIG_SC_DISPCC_7180=m
CONFIG_SC_DISPCC_7280=m
CONFIG_SC_GCC_7180=m
CONFIG_SC_GCC_7280=m
CONFIG_SC_GCC_8180X=m
# CONFIG_SC_GCC_8280XP is not set
CONFIG_SC_GPUCC_7180=m
# CONFIG_SC_GPUCC_7280 is not set
# CONFIG_SC_LPASSCC_7280 is not set
CONFIG_SC_LPASS_CORECC_7180=m
CONFIG_SC_LPASS_CORECC_7280=m
# CONFIG_SC_MSS_7180 is not set
CONFIG_SC_VIDEOCC_7180=m
# CONFIG_SC_VIDEOCC_7280 is not set
# CONFIG_SDM_CAMCC_845 is not set
CONFIG_SDM_GCC_660=m
CONFIG_SDM_MMCC_660=m
CONFIG_SDM_GPUCC_660=m
CONFIG_QCS_TURING_404=m
CONFIG_QCS_Q6SSTOP_404=m
CONFIG_SDM_GCC_845=m
CONFIG_SDM_GPUCC_845=m
# CONFIG_SDM_VIDEOCC_845 is not set
CONFIG_SDM_DISPCC_845=m
CONFIG_SDM_LPASSCC_845=m
CONFIG_SDX_GCC_55=m
CONFIG_SDX_GCC_65=m
CONFIG_SM_CAMCC_8250=m
CONFIG_SM_CAMCC_8450=m
CONFIG_SM_DISPCC_6125=m
CONFIG_SM_DISPCC_8250=m
# CONFIG_SM_GCC_6115 is not set
CONFIG_SM_GCC_6125=m
# CONFIG_SM_GCC_6350 is not set
CONFIG_SM_GCC_8150=m
CONFIG_SM_GCC_8250=m
CONFIG_SM_GCC_8350=m
CONFIG_SM_GCC_8450=m
# CONFIG_SM_GPUCC_6350 is not set
# CONFIG_SM_GPUCC_8150 is not set
# CONFIG_SM_GPUCC_8250 is not set
CONFIG_SM_GPUCC_8350=m
CONFIG_SM_VIDEOCC_8150=m
CONFIG_SM_VIDEOCC_8250=m
CONFIG_SPMI_PMIC_CLKDIV=m
# CONFIG_QCOM_HFPLL is not set
CONFIG_KPSS_XCC=m
# CONFIG_CLK_GFM_LPASS_SM8250 is not set
CONFIG_CLK_MT7621=y
CONFIG_CLK_RENESAS=y
# CONFIG_CLK_EMEV2 is not set
CONFIG_CLK_RZA1=y
CONFIG_CLK_R7S9210=y
CONFIG_CLK_R8A73A4=y
# CONFIG_CLK_R8A7740 is not set
# CONFIG_CLK_R8A7742 is not set
# CONFIG_CLK_R8A7743 is not set
CONFIG_CLK_R8A7745=y
CONFIG_CLK_R8A77470=y
CONFIG_CLK_R8A774A1=y
CONFIG_CLK_R8A774B1=y
CONFIG_CLK_R8A774C0=y
CONFIG_CLK_R8A774E1=y
# CONFIG_CLK_R8A7778 is not set
CONFIG_CLK_R8A7779=y
CONFIG_CLK_R8A7790=y
CONFIG_CLK_R8A7791=y
CONFIG_CLK_R8A7792=y
# CONFIG_CLK_R8A7794 is not set
CONFIG_CLK_R8A7795=y
CONFIG_CLK_R8A77960=y
# CONFIG_CLK_R8A77961 is not set
# CONFIG_CLK_R8A77965 is not set
# CONFIG_CLK_R8A77970 is not set
CONFIG_CLK_R8A77980=y
CONFIG_CLK_R8A77990=y
CONFIG_CLK_R8A77995=y
CONFIG_CLK_R8A779A0=y
# CONFIG_CLK_R8A779F0 is not set
# CONFIG_CLK_R8A779G0 is not set
# CONFIG_CLK_R9A06G032 is not set
# CONFIG_CLK_R9A07G043 is not set
CONFIG_CLK_R9A07G044=y
CONFIG_CLK_R9A07G054=y
CONFIG_CLK_R9A09G011=y
# CONFIG_CLK_SH73A0 is not set
CONFIG_CLK_RCAR_CPG_LIB=y
CONFIG_CLK_RCAR_GEN2_CPG=y
CONFIG_CLK_RCAR_GEN3_CPG=y
CONFIG_CLK_RCAR_GEN4_CPG=y
# CONFIG_CLK_RCAR_USB2_CLOCK_SEL is not set
CONFIG_CLK_RZG2L=y
CONFIG_CLK_RENESAS_CPG_MSSR=y
CONFIG_CLK_RENESAS_CPG_MSTP=y
CONFIG_CLK_RENESAS_DIV6=y
CONFIG_COMMON_CLK_SAMSUNG=y
# CONFIG_S3C64XX_COMMON_CLK is not set
CONFIG_S5PV210_COMMON_CLK=y
# CONFIG_EXYNOS_3250_COMMON_CLK is not set
# CONFIG_EXYNOS_4_COMMON_CLK is not set
CONFIG_EXYNOS_5250_COMMON_CLK=y
# CONFIG_EXYNOS_5260_COMMON_CLK is not set
CONFIG_EXYNOS_5410_COMMON_CLK=y
CONFIG_EXYNOS_5420_COMMON_CLK=y
CONFIG_EXYNOS_ARM64_COMMON_CLK=y
CONFIG_EXYNOS_AUDSS_CLK_CON=y
CONFIG_EXYNOS_CLKOUT=m
# CONFIG_S3C2410_COMMON_CLK is not set
CONFIG_S3C2412_COMMON_CLK=y
# CONFIG_S3C2443_COMMON_CLK is not set
# CONFIG_TESLA_FSD_COMMON_CLK is not set
CONFIG_CLK_SIFIVE=y
# CONFIG_CLK_SIFIVE_PRCI is not set
CONFIG_CLK_INTEL_SOCFPGA=y
# CONFIG_CLK_INTEL_SOCFPGA32 is not set
CONFIG_CLK_INTEL_SOCFPGA64=y
CONFIG_SPRD_COMMON_CLK=m
CONFIG_SPRD_SC9860_CLK=m
CONFIG_SPRD_SC9863A_CLK=m
CONFIG_CLK_STARFIVE_JH7100=y
# CONFIG_CLK_STARFIVE_JH7100_AUDIO is not set
CONFIG_CLK_SUNXI=y
# CONFIG_CLK_SUNXI_CLOCKS is not set
# CONFIG_CLK_SUNXI_PRCM_SUN6I is not set
CONFIG_CLK_SUNXI_PRCM_SUN8I=y
CONFIG_CLK_SUNXI_PRCM_SUN9I=y
# CONFIG_SUNXI_CCU is not set
CONFIG_CLK_TEGRA_BPMP=y
CONFIG_TEGRA_CLK_DFLL=y
# CONFIG_COMMON_CLK_TI_ADPLL is not set
# CONFIG_CLK_UNIPHIER is not set
# CONFIG_COMMON_CLK_VISCONTI is not set
CONFIG_CLK_LGM_CGU=y
CONFIG_XILINX_VCU=y
# CONFIG_COMMON_CLK_ZYNQMP is not set
CONFIG_HWSPINLOCK=y
CONFIG_HWSPINLOCK_OMAP=y
CONFIG_HWSPINLOCK_QCOM=y
CONFIG_HWSPINLOCK_SPRD=m
# CONFIG_HWSPINLOCK_STM32 is not set
CONFIG_HWSPINLOCK_SUN6I=y
CONFIG_HSEM_U8500=m

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKSRC_MMIO=y
CONFIG_BCM2835_TIMER=y
# CONFIG_BCM_KONA_TIMER is not set
# CONFIG_DAVINCI_TIMER is not set
# CONFIG_DIGICOLOR_TIMER is not set
# CONFIG_OMAP_DM_TIMER is not set
CONFIG_DW_APB_TIMER=y
CONFIG_DW_APB_TIMER_OF=y
CONFIG_FTTMR010_TIMER=y
CONFIG_IXP4XX_TIMER=y
# CONFIG_ROCKCHIP_TIMER is not set
# CONFIG_MESON6_TIMER is not set
CONFIG_OWL_TIMER=y
# CONFIG_RDA_TIMER is not set
CONFIG_SUN4I_TIMER=y
CONFIG_SUN5I_HSTIMER=y
CONFIG_TEGRA_TIMER=y
# CONFIG_TEGRA186_TIMER is not set
# CONFIG_VT8500_TIMER is not set
# CONFIG_NPCM7XX_TIMER is not set
# CONFIG_CADENCE_TTC_TIMER is not set
CONFIG_ASM9260_TIMER=y
CONFIG_CLKSRC_DBX500_PRCMU=y
# CONFIG_CLPS711X_TIMER is not set
CONFIG_MXS_TIMER=y
CONFIG_NSPIRE_TIMER=y
CONFIG_KEYSTONE_TIMER=y
# CONFIG_INTEGRATOR_AP_TIMER is not set
# CONFIG_CLKSRC_PISTACHIO is not set
CONFIG_CLKSRC_TI_32K=y
# CONFIG_CLKSRC_STM32_LP is not set
CONFIG_CLKSRC_MPS2=y
CONFIG_ARC_TIMERS=y
CONFIG_ARC_TIMERS_64BIT=y
CONFIG_ARM_ARCH_TIMER=y
CONFIG_ARM_ARCH_TIMER_EVTSTREAM=y
CONFIG_ARM_ARCH_TIMER_OOL_WORKAROUND=y
# CONFIG_FSL_ERRATUM_A008585 is not set
CONFIG_HISILICON_ERRATUM_161010101=y
CONFIG_ARM64_ERRATUM_858921=y
CONFIG_SUN50I_ERRATUM_UNKNOWN1=y
CONFIG_ARM_TIMER_SP804=y
CONFIG_ARMV7M_SYSTICK=y
CONFIG_ATMEL_PIT=y
CONFIG_ATMEL_ST=y
CONFIG_CLKSRC_EXYNOS_MCT=y
CONFIG_CLKSRC_SAMSUNG_PWM=y
CONFIG_FSL_FTM_TIMER=y
CONFIG_OXNAS_RPS_TIMER=y
CONFIG_SYS_SUPPORTS_SH_CMT=y
CONFIG_MTK_TIMER=y
# CONFIG_SPRD_TIMER is not set
CONFIG_SYS_SUPPORTS_SH_TMU=y
CONFIG_CLKSRC_JCORE_PIT=y
# CONFIG_SH_TIMER_CMT is not set
CONFIG_SH_TIMER_MTU2=y
# CONFIG_RENESAS_OSTM is not set
# CONFIG_SH_TIMER_TMU is not set
CONFIG_EM_TIMER_STI=y
CONFIG_CLKSRC_VERSATILE=y
# CONFIG_CLKSRC_PXA is not set
CONFIG_CLKSRC_IMX_GPT=y
# CONFIG_CLKSRC_IMX_TPM is not set
CONFIG_TIMER_IMX_SYS_CTR=y
# CONFIG_CLKSRC_ST_LPC is not set
CONFIG_GXP_TIMER=y
CONFIG_MSC313E_TIMER=y
# CONFIG_INGENIC_TIMER is not set
CONFIG_INGENIC_SYSOST=y
# CONFIG_INGENIC_OST is not set
# CONFIG_MICROCHIP_PIT64B is not set
CONFIG_GOLDFISH_TIMER=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_APPLE_MAILBOX=y
CONFIG_ARM_MHU=m
# CONFIG_ARM_MHU_V2 is not set
CONFIG_IMX_MBOX=y
# CONFIG_PLATFORM_MHU is not set
CONFIG_PL320_MBOX=y
CONFIG_ARMADA_37XX_RWTM_MBOX=m
CONFIG_ROCKCHIP_MBOX=y
CONFIG_ALTERA_MBOX=y
CONFIG_HI3660_MBOX=m
# CONFIG_HI6220_MBOX is not set
# CONFIG_MAILBOX_TEST is not set
# CONFIG_POLARFIRE_SOC_MAILBOX is not set
# CONFIG_QCOM_APCS_IPC is not set
CONFIG_TEGRA_HSP_MBOX=y
# CONFIG_BCM_PDC_MBOX is not set
# CONFIG_BCM_FLEXRM_MBOX is not set
CONFIG_STM32_IPCC=m
CONFIG_MTK_ADSP_MBOX=m
CONFIG_MTK_CMDQ_MBOX=y
CONFIG_ZYNQMP_IPI_MBOX=y
CONFIG_SUN6I_MSGBOX=m
CONFIG_SPRD_MBOX=m
CONFIG_QCOM_IPCC=m
CONFIG_IOMMU_IOVA=y
CONFIG_IOASID=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
CONFIG_IOMMU_IO_PGTABLE=y
CONFIG_IOMMU_IO_PGTABLE_LPAE=y
CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST=y
CONFIG_IOMMU_IO_PGTABLE_ARMV7S=y
# CONFIG_IOMMU_IO_PGTABLE_ARMV7S_SELFTEST is not set
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
CONFIG_IOMMU_DEFAULT_DMA_STRICT=y
# CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_OF_IOMMU=y
CONFIG_IOMMU_DMA=y
CONFIG_IOMMU_SVA=y
# CONFIG_OMAP_IOMMU is not set
CONFIG_ROCKCHIP_IOMMU=y
CONFIG_SUN50I_IOMMU=y
CONFIG_TEGRA_IOMMU_SMMU=y
CONFIG_EXYNOS_IOMMU=y
CONFIG_EXYNOS_IOMMU_DEBUG=y
CONFIG_IPMMU_VMSA=y
CONFIG_APPLE_DART=m
# CONFIG_ARM_SMMU is not set
CONFIG_ARM_SMMU_V3=m
CONFIG_ARM_SMMU_V3_SVA=y
# CONFIG_S390_CCW_IOMMU is not set
# CONFIG_S390_AP_IOMMU is not set
CONFIG_MTK_IOMMU=y
CONFIG_QCOM_IOMMU=y
CONFIG_VIRTIO_IOMMU=m
# CONFIG_SPRD_IOMMU is not set

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
CONFIG_REMOTEPROC_CDEV=y
CONFIG_INGENIC_VPU_RPROC=m
# CONFIG_MTK_SCP is not set
CONFIG_MESON_MX_AO_ARC_REMOTEPROC=y
CONFIG_RCAR_REMOTEPROC=m
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_CTRL=y
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_QCOM_GLINK=m
CONFIG_RPMSG_QCOM_GLINK_RPM=m
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=m

#
# SoundWire Devices
#

#
# SOC (System On Chip) specific Drivers
#
# CONFIG_OWL_PM_DOMAINS is not set

#
# Amlogic SoC drivers
#
CONFIG_MESON_CANVAS=m
CONFIG_MESON_CLK_MEASURE=y
CONFIG_MESON_GX_SOCINFO=y
CONFIG_MESON_GX_PM_DOMAINS=m
CONFIG_MESON_EE_PM_DOMAINS=m
CONFIG_MESON_MX_SOCINFO=y
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
# CONFIG_APPLE_PMGR_PWRSTATE is not set
# CONFIG_APPLE_RTKIT is not set
# CONFIG_APPLE_SART is not set
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
CONFIG_ASPEED_LPC_CTRL=y
CONFIG_ASPEED_LPC_SNOOP=m
CONFIG_ASPEED_UART_ROUTING=m
# CONFIG_ASPEED_P2A_CTRL is not set
# CONFIG_ASPEED_SOCINFO is not set
# end of ASPEED SoC drivers

CONFIG_AT91_SOC_ID=y
CONFIG_AT91_SOC_SFR=y

#
# Broadcom SoC drivers
#
# CONFIG_BCM2835_POWER is not set
CONFIG_SOC_BCM63XX=y
CONFIG_SOC_BRCMSTB=y
CONFIG_BCM63XX_POWER=y
# CONFIG_BCM_PMB is not set
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# CONFIG_QUICC_ENGINE is not set
CONFIG_FSL_GUTS=y
# CONFIG_FSL_MC_DPIO is not set
CONFIG_DPAA2_CONSOLE=m
# CONFIG_FSL_RCPM is not set
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
CONFIG_IMX_GPCV2_PM_DOMAINS=y
CONFIG_SOC_IMX8M=y
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
CONFIG_IXP4XX_QMGR=m
CONFIG_IXP4XX_NPE=y
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# CONFIG_LITEX_SOC_CONTROLLER is not set
# end of Enable LiteX SoC Builder specific drivers

#
# MediaTek SoC drivers
#
CONFIG_MTK_CMDQ=m
# CONFIG_MTK_DEVAPC is not set
CONFIG_MTK_INFRACFG=y
CONFIG_MTK_PMIC_WRAP=m
# CONFIG_MTK_SCPSYS is not set
CONFIG_MTK_SCPSYS_PM_DOMAINS=y
CONFIG_MTK_MMSYS=y
# end of MediaTek SoC drivers

#
# Qualcomm SoC drivers
#
CONFIG_QCOM_AOSS_QMP=y
CONFIG_QCOM_COMMAND_DB=m
CONFIG_QCOM_CPR=m
CONFIG_QCOM_GENI_SE=y
CONFIG_QCOM_GSBI=m
CONFIG_QCOM_LLCC=y
CONFIG_QCOM_OCMEM=m
CONFIG_QCOM_RMTFS_MEM=y
# CONFIG_QCOM_RPMH is not set
# CONFIG_QCOM_RPMPD is not set
# CONFIG_QCOM_SMEM is not set
CONFIG_QCOM_SMD_RPM=y
CONFIG_QCOM_SPM=y
CONFIG_QCOM_WCNSS_CTRL=m
CONFIG_QCOM_ICC_BWMON=y
# end of Qualcomm SoC drivers

CONFIG_SOC_RENESAS=y
CONFIG_ARCH_RCAR_GEN3=y
CONFIG_ARCH_RZG2L=y
CONFIG_ARCH_R8A77995=y
CONFIG_ARCH_R8A77990=y
CONFIG_ARCH_R8A77950=y
# CONFIG_ARCH_R8A77951 is not set
# CONFIG_ARCH_R8A77965 is not set
# CONFIG_ARCH_R8A77960 is not set
# CONFIG_ARCH_R8A77961 is not set
# CONFIG_ARCH_R8A779F0 is not set
CONFIG_ARCH_R8A77980=y
# CONFIG_ARCH_R8A77970 is not set
# CONFIG_ARCH_R8A779A0 is not set
# CONFIG_ARCH_R8A779G0 is not set
# CONFIG_ARCH_R8A774C0 is not set
CONFIG_ARCH_R8A774E1=y
CONFIG_ARCH_R8A774A1=y
CONFIG_ARCH_R8A774B1=y
# CONFIG_ARCH_R9A07G043 is not set
# CONFIG_ARCH_R9A07G044 is not set
CONFIG_ARCH_R9A07G054=y
CONFIG_ARCH_R9A09G011=y
CONFIG_RST_RCAR=y
CONFIG_SYSC_RCAR=y
CONFIG_SYSC_RCAR_GEN4=y
CONFIG_SYSC_R8A77995=y
# CONFIG_SYSC_R8A7794 is not set
CONFIG_SYSC_R8A77990=y
CONFIG_SYSC_R8A7779=y
# CONFIG_SYSC_R8A7790 is not set
CONFIG_SYSC_R8A7795=y
# CONFIG_SYSC_R8A7791 is not set
# CONFIG_SYSC_R8A77965 is not set
CONFIG_SYSC_R8A77960=y
# CONFIG_SYSC_R8A77961 is not set
CONFIG_SYSC_R8A779F0=y
CONFIG_SYSC_R8A7792=y
CONFIG_SYSC_R8A77980=y
# CONFIG_SYSC_R8A77970 is not set
CONFIG_SYSC_R8A779A0=y
# CONFIG_SYSC_R8A779G0 is not set
CONFIG_SYSC_RMOBILE=y
# CONFIG_SYSC_R8A77470 is not set
# CONFIG_SYSC_R8A7745 is not set
CONFIG_SYSC_R8A7742=y
CONFIG_SYSC_R8A7743=y
CONFIG_SYSC_R8A774C0=y
CONFIG_SYSC_R8A774E1=y
CONFIG_SYSC_R8A774A1=y
CONFIG_SYSC_R8A774B1=y
# CONFIG_ROCKCHIP_GRF is not set
# CONFIG_ROCKCHIP_IODOMAIN is not set
# CONFIG_ROCKCHIP_PM_DOMAINS is not set
CONFIG_SOC_SAMSUNG=y
# CONFIG_EXYNOS_ASV_ARM is not set
CONFIG_EXYNOS_CHIPID=m
CONFIG_EXYNOS_USI=y
# CONFIG_EXYNOS_PMU is not set
CONFIG_EXYNOS_PM_DOMAINS=y
# CONFIG_EXYNOS_REGULATOR_COUPLER is not set
CONFIG_SUNXI_MBUS=y
CONFIG_SUNXI_SRAM=y
# CONFIG_ARCH_TEGRA_132_SOC is not set
CONFIG_ARCH_TEGRA_210_SOC=y
# CONFIG_ARCH_TEGRA_186_SOC is not set
CONFIG_ARCH_TEGRA_194_SOC=y
# CONFIG_ARCH_TEGRA_234_SOC is not set
CONFIG_SOC_TEGRA_FUSE=y
CONFIG_SOC_TEGRA_FLOWCTRL=y
CONFIG_SOC_TEGRA_PMC=y
CONFIG_SOC_TEGRA_POWERGATE_BPMP=y
CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER=y
# CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER is not set
CONFIG_SOC_TI=y
# CONFIG_UX500_SOC_ID is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=y
CONFIG_DEVFREQ_GOV_POWERSAVE=y
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
# CONFIG_ARM_EXYNOS_BUS_DEVFREQ is not set
# CONFIG_ARM_IMX_BUS_DEVFREQ is not set
CONFIG_ARM_IMX8M_DDRC_DEVFREQ=y
CONFIG_ARM_TEGRA_DEVFREQ=y
CONFIG_ARM_MEDIATEK_CCI_DEVFREQ=y
CONFIG_ARM_RK3399_DMC_DEVFREQ=y
CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ=y
CONFIG_PM_DEVFREQ_EVENT=y
# CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP is not set
CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU=y
CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI=y
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_ADC_JACK is not set
# CONFIG_EXTCON_FSA9480 is not set
CONFIG_EXTCON_GPIO=y
CONFIG_EXTCON_MAX3355=m
CONFIG_EXTCON_MAX77843=y
CONFIG_EXTCON_MAX8997=m
# CONFIG_EXTCON_PALMAS is not set
# CONFIG_EXTCON_PTN5150 is not set
CONFIG_EXTCON_QCOM_SPMI_MISC=m
CONFIG_EXTCON_RT8973A=m
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
CONFIG_EXTCON_USBC_CROS_EC=m
CONFIG_EXTCON_USBC_TUSB320=y
CONFIG_MEMORY=y
CONFIG_DDR=y
# CONFIG_ARM_PL172_MPMC is not set
CONFIG_ATMEL_SDRAMC=y
CONFIG_ATMEL_EBI=y
CONFIG_BRCMSTB_DPFE=y
# CONFIG_BT1_L2_CTL is not set
# CONFIG_TI_AEMIF is not set
CONFIG_TI_EMIF=y
# CONFIG_OMAP_GPMC is not set
CONFIG_FPGA_DFL_EMIF=y
# CONFIG_MVEBU_DEVBUS is not set
CONFIG_FSL_CORENET_CF=y
CONFIG_FSL_IFC=y
# CONFIG_JZ4780_NEMC is not set
CONFIG_MTK_SMI=y
CONFIG_DA8XX_DDRCTL=y
CONFIG_PL353_SMC=y
CONFIG_RENESAS_RPCIF=m
CONFIG_STM32_FMC2_EBI=y
CONFIG_SAMSUNG_MC=y
CONFIG_EXYNOS5422_DMC=m
CONFIG_EXYNOS_SROM=y
CONFIG_TEGRA_MC=y
CONFIG_TEGRA20_EMC=m
CONFIG_TEGRA30_EMC=y
# CONFIG_TEGRA124_EMC is not set
CONFIG_TEGRA210_EMC_TABLE=y
CONFIG_TEGRA210_EMC=y
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_BUFFER_DMA=y
CONFIG_IIO_BUFFER_DMAENGINE=y
CONFIG_IIO_BUFFER_HW_CONSUMER=y
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=m
CONFIG_IIO_SW_TRIGGER=y
CONFIG_IIO_TRIGGERED_EVENT=m

#
# Accelerometers
#
# CONFIG_ADIS16201 is not set
CONFIG_ADIS16209=m
CONFIG_ADXL313=y
CONFIG_ADXL313_I2C=y
CONFIG_ADXL313_SPI=y
CONFIG_ADXL345=y
CONFIG_ADXL345_I2C=m
CONFIG_ADXL345_SPI=y
CONFIG_ADXL355=y
CONFIG_ADXL355_I2C=y
CONFIG_ADXL355_SPI=m
CONFIG_ADXL367=y
CONFIG_ADXL367_SPI=y
# CONFIG_ADXL367_I2C is not set
CONFIG_ADXL372=m
# CONFIG_ADXL372_SPI is not set
CONFIG_ADXL372_I2C=m
# CONFIG_BMA180 is not set
# CONFIG_BMA220 is not set
CONFIG_BMA400=y
CONFIG_BMA400_I2C=y
CONFIG_BMA400_SPI=y
# CONFIG_BMC150_ACCEL is not set
# CONFIG_BMI088_ACCEL is not set
CONFIG_DA280=m
CONFIG_DA311=y
# CONFIG_DMARD06 is not set
CONFIG_DMARD09=m
CONFIG_DMARD10=m
CONFIG_FXLS8962AF=m
CONFIG_FXLS8962AF_I2C=m
# CONFIG_FXLS8962AF_SPI is not set
CONFIG_HID_SENSOR_ACCEL_3D=y
# CONFIG_KXSD9 is not set
CONFIG_KXCJK1013=m
CONFIG_MC3230=y
CONFIG_MMA7455=y
CONFIG_MMA7455_I2C=m
CONFIG_MMA7455_SPI=y
# CONFIG_MMA7660 is not set
CONFIG_MMA8452=y
CONFIG_MMA9551_CORE=y
# CONFIG_MMA9551 is not set
CONFIG_MMA9553=y
# CONFIG_MXC4005 is not set
# CONFIG_MXC6255 is not set
# CONFIG_SCA3000 is not set
CONFIG_SCA3300=y
# CONFIG_STK8312 is not set
CONFIG_STK8BA50=m
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD_SIGMA_DELTA=m
CONFIG_AD7091R5=m
# CONFIG_AD7124 is not set
CONFIG_AD7192=m
# CONFIG_AD7266 is not set
CONFIG_AD7280=m
CONFIG_AD7291=y
CONFIG_AD7292=y
CONFIG_AD7298=y
CONFIG_AD7476=y
CONFIG_AD7606=y
CONFIG_AD7606_IFACE_PARALLEL=m
CONFIG_AD7606_IFACE_SPI=y
# CONFIG_AD7766 is not set
CONFIG_AD7768_1=y
# CONFIG_AD7780 is not set
CONFIG_AD7791=m
CONFIG_AD7793=m
CONFIG_AD7887=m
CONFIG_AD7923=y
CONFIG_AD7949=y
# CONFIG_AD799X is not set
CONFIG_AD9467=m
CONFIG_ADI_AXI_ADC=y
CONFIG_ASPEED_ADC=m
CONFIG_AT91_ADC=y
CONFIG_AT91_SAMA5D2_ADC=y
CONFIG_AXP20X_ADC=m
CONFIG_AXP288_ADC=y
# CONFIG_BCM_IPROC_ADC is not set
CONFIG_BERLIN2_ADC=m
CONFIG_CC10001_ADC=m
# CONFIG_DLN2_ADC is not set
CONFIG_ENVELOPE_DETECTOR=y
CONFIG_EXYNOS_ADC=y
CONFIG_FSL_MX25_ADC=m
# CONFIG_HI8435 is not set
CONFIG_HX711=y
# CONFIG_INGENIC_ADC is not set
CONFIG_IMX7D_ADC=m
CONFIG_IMX8QXP_ADC=m
CONFIG_LPC18XX_ADC=y
CONFIG_LPC32XX_ADC=m
CONFIG_LTC2471=y
# CONFIG_LTC2485 is not set
CONFIG_LTC2496=m
CONFIG_LTC2497=m
CONFIG_MAX1027=m
CONFIG_MAX11100=y
# CONFIG_MAX1118 is not set
CONFIG_MAX1241=m
CONFIG_MAX1363=y
# CONFIG_MAX9611 is not set
CONFIG_MCP320X=m
CONFIG_MCP3422=m
# CONFIG_MCP3911 is not set
CONFIG_MEDIATEK_MT6360_ADC=m
# CONFIG_MEDIATEK_MT6577_AUXADC is not set
CONFIG_MEN_Z188_ADC=m
CONFIG_MESON_SARADC=y
CONFIG_MP2629_ADC=m
CONFIG_NAU7802=m
CONFIG_NPCM_ADC=y
# CONFIG_PALMAS_GPADC is not set
CONFIG_QCOM_VADC_COMMON=m
# CONFIG_QCOM_SPMI_IADC is not set
# CONFIG_QCOM_SPMI_VADC is not set
CONFIG_QCOM_SPMI_ADC5=m
CONFIG_RCAR_GYRO_ADC=y
# CONFIG_RN5T618_ADC is not set
CONFIG_ROCKCHIP_SARADC=y
CONFIG_RZG2L_ADC=m
# CONFIG_SC27XX_ADC is not set
CONFIG_SPEAR_ADC=y
CONFIG_SD_ADC_MODULATOR=m
CONFIG_STM32_ADC_CORE=m
# CONFIG_STM32_ADC is not set
CONFIG_STM32_DFSDM_CORE=m
CONFIG_STM32_DFSDM_ADC=m
CONFIG_SUN4I_GPADC=m
CONFIG_TI_ADC081C=m
CONFIG_TI_ADC0832=m
CONFIG_TI_ADC084S021=y
# CONFIG_TI_ADC12138 is not set
# CONFIG_TI_ADC108S102 is not set
CONFIG_TI_ADC128S052=m
CONFIG_TI_ADC161S626=m
# CONFIG_TI_ADS1015 is not set
CONFIG_TI_ADS7950=y
CONFIG_TI_ADS8344=y
CONFIG_TI_ADS8688=m
# CONFIG_TI_ADS124S08 is not set
CONFIG_TI_ADS131E08=m
CONFIG_TI_AM335X_ADC=m
CONFIG_TI_TLC4541=y
CONFIG_TI_TSC2046=m
CONFIG_TWL4030_MADC=y
# CONFIG_TWL6030_GPADC is not set
CONFIG_VF610_ADC=m
CONFIG_XILINX_XADC=y
CONFIG_XILINX_AMS=m
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
# CONFIG_AD74413R is not set
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
CONFIG_IIO_RESCALE=y
# end of Analog Front Ends

#
# Amplifiers
#
# CONFIG_AD8366 is not set
CONFIG_ADA4250=y
CONFIG_HMC425=y
# end of Amplifiers

#
# Capacitance to digital converters
#
CONFIG_AD7150=m
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=m
CONFIG_ATLAS_EZO_SENSOR=y
CONFIG_BME680=m
CONFIG_BME680_I2C=m
CONFIG_BME680_SPI=m
# CONFIG_CCS811 is not set
CONFIG_IAQCORE=m
CONFIG_PMS7003=m
CONFIG_SCD30_CORE=m
# CONFIG_SCD30_I2C is not set
# CONFIG_SCD30_SERIAL is not set
CONFIG_SCD4X=y
CONFIG_SENSIRION_SGP30=y
CONFIG_SENSIRION_SGP40=y
CONFIG_SPS30=y
CONFIG_SPS30_I2C=y
CONFIG_SPS30_SERIAL=m
CONFIG_SENSEAIR_SUNRISE_CO2=m
CONFIG_VZ89X=y
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=y
CONFIG_HID_SENSOR_IIO_TRIGGER=y
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=y

#
# IIO SCMI Sensors
#
CONFIG_IIO_SCMI=y
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
CONFIG_IIO_SSP_SENSORS_COMMONS=y
CONFIG_IIO_SSP_SENSORHUB=y
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=y
CONFIG_IIO_ST_SENSORS_SPI=m
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
CONFIG_AD3552R=y
CONFIG_AD5064=y
CONFIG_AD5360=m
CONFIG_AD5380=y
CONFIG_AD5421=y
CONFIG_AD5446=m
# CONFIG_AD5449 is not set
CONFIG_AD5592R_BASE=m
CONFIG_AD5592R=m
CONFIG_AD5593R=m
CONFIG_AD5504=y
CONFIG_AD5624R_SPI=m
CONFIG_LTC2688=y
CONFIG_AD5686=y
CONFIG_AD5686_SPI=y
CONFIG_AD5696_I2C=m
CONFIG_AD5755=m
# CONFIG_AD5758 is not set
# CONFIG_AD5761 is not set
CONFIG_AD5764=y
CONFIG_AD5766=y
CONFIG_AD5770R=m
CONFIG_AD5791=m
# CONFIG_AD7293 is not set
# CONFIG_AD7303 is not set
CONFIG_AD8801=y
CONFIG_DPOT_DAC=m
CONFIG_DS4424=y
# CONFIG_LPC18XX_DAC is not set
CONFIG_LTC1660=m
CONFIG_LTC2632=y
# CONFIG_M62332 is not set
CONFIG_MAX517=y
# CONFIG_MAX5821 is not set
# CONFIG_MCP4725 is not set
# CONFIG_MCP4922 is not set
CONFIG_STM32_DAC=m
CONFIG_STM32_DAC_CORE=m
# CONFIG_TI_DAC082S085 is not set
CONFIG_TI_DAC5571=y
CONFIG_TI_DAC7311=y
# CONFIG_TI_DAC7612 is not set
CONFIG_VF610_DAC=y
# end of Digital to analog converters

#
# IIO dummy driver
#
CONFIG_IIO_DUMMY_EVGEN=m
CONFIG_IIO_SIMPLE_DUMMY=m
CONFIG_IIO_SIMPLE_DUMMY_EVENTS=y
CONFIG_IIO_SIMPLE_DUMMY_BUFFER=y
# end of IIO dummy driver

#
# Filters
#
CONFIG_ADMV8818=m
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# CONFIG_AD9523 is not set
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
CONFIG_ADF4350=m
# CONFIG_ADF4371 is not set
CONFIG_ADMV1013=y
CONFIG_ADMV1014=y
CONFIG_ADMV4420=m
CONFIG_ADRF6780=m
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# CONFIG_ADIS16080 is not set
CONFIG_ADIS16130=y
# CONFIG_ADIS16136 is not set
CONFIG_ADIS16260=m
# CONFIG_ADXRS290 is not set
CONFIG_ADXRS450=y
# CONFIG_BMG160 is not set
# CONFIG_FXAS21002C is not set
CONFIG_HID_SENSOR_GYRO_3D=y
CONFIG_MPU3050=m
CONFIG_MPU3050_I2C=m
# CONFIG_IIO_ST_GYRO_3AXIS is not set
CONFIG_ITG3200=y
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4403=m
CONFIG_AFE4404=m
CONFIG_MAX30100=m
# CONFIG_MAX30102 is not set
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_AM2315=m
# CONFIG_DHT11 is not set
# CONFIG_HDC100X is not set
CONFIG_HDC2010=y
# CONFIG_HID_SENSOR_HUMIDITY is not set
CONFIG_HTS221=m
CONFIG_HTS221_I2C=m
CONFIG_HTS221_SPI=m
CONFIG_HTU21=m
CONFIG_SI7005=y
CONFIG_SI7020=y
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_ADIS16400=m
CONFIG_ADIS16460=m
# CONFIG_ADIS16475 is not set
CONFIG_ADIS16480=y
# CONFIG_BMI160_I2C is not set
# CONFIG_BMI160_SPI is not set
CONFIG_FXOS8700=y
# CONFIG_FXOS8700_I2C is not set
CONFIG_FXOS8700_SPI=y
CONFIG_KMX61=m
CONFIG_INV_ICM42600=m
# CONFIG_INV_ICM42600_I2C is not set
CONFIG_INV_ICM42600_SPI=m
CONFIG_INV_MPU6050_IIO=m
CONFIG_INV_MPU6050_I2C=m
# CONFIG_INV_MPU6050_SPI is not set
CONFIG_IIO_ST_LSM6DSX=y
CONFIG_IIO_ST_LSM6DSX_I2C=y
CONFIG_IIO_ST_LSM6DSX_SPI=y
CONFIG_IIO_ST_LSM6DSX_I3C=y
# end of Inertial measurement units

CONFIG_IIO_ADIS_LIB=y
CONFIG_IIO_ADIS_LIB_BUFFER=y

#
# Light sensors
#
CONFIG_ADJD_S311=m
CONFIG_ADUX1020=y
CONFIG_AL3010=y
# CONFIG_AL3320A is not set
CONFIG_APDS9300=y
CONFIG_APDS9960=y
CONFIG_AS73211=m
CONFIG_BH1750=y
CONFIG_BH1780=m
CONFIG_CM32181=y
CONFIG_CM3232=m
# CONFIG_CM3323 is not set
CONFIG_CM3605=y
CONFIG_CM36651=m
CONFIG_GP2AP002=m
CONFIG_GP2AP020A00F=m
CONFIG_IQS621_ALS=m
CONFIG_SENSORS_ISL29018=m
CONFIG_SENSORS_ISL29028=m
CONFIG_ISL29125=m
CONFIG_HID_SENSOR_ALS=y
CONFIG_HID_SENSOR_PROX=y
CONFIG_JSA1212=m
CONFIG_RPR0521=y
CONFIG_SENSORS_LM3533=y
# CONFIG_LTR501 is not set
# CONFIG_LV0104CS is not set
CONFIG_MAX44000=y
CONFIG_MAX44009=y
CONFIG_NOA1305=y
CONFIG_OPT3001=y
CONFIG_PA12203001=m
# CONFIG_SI1133 is not set
CONFIG_SI1145=m
CONFIG_STK3310=y
CONFIG_ST_UVIS25=m
CONFIG_ST_UVIS25_I2C=m
CONFIG_ST_UVIS25_SPI=m
CONFIG_TCS3414=m
CONFIG_TCS3472=y
CONFIG_SENSORS_TSL2563=m
CONFIG_TSL2583=y
# CONFIG_TSL2591 is not set
CONFIG_TSL2772=m
CONFIG_TSL4531=y
# CONFIG_US5182D is not set
CONFIG_VCNL4000=m
CONFIG_VCNL4035=y
# CONFIG_VEML6030 is not set
CONFIG_VEML6070=m
CONFIG_VL6180=m
CONFIG_ZOPT2201=y
# end of Light sensors

#
# Magnetometer sensors
#
CONFIG_AK8974=y
CONFIG_AK8975=y
# CONFIG_AK09911 is not set
CONFIG_BMC150_MAGN=m
# CONFIG_BMC150_MAGN_I2C is not set
CONFIG_BMC150_MAGN_SPI=m
CONFIG_MAG3110=y
# CONFIG_HID_SENSOR_MAGNETOMETER_3D is not set
CONFIG_MMC35240=m
CONFIG_IIO_ST_MAGN_3AXIS=m
CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
# CONFIG_IIO_ST_MAGN_SPI_3AXIS is not set
# CONFIG_SENSORS_HMC5843_I2C is not set
# CONFIG_SENSORS_HMC5843_SPI is not set
CONFIG_SENSORS_RM3100=y
CONFIG_SENSORS_RM3100_I2C=m
CONFIG_SENSORS_RM3100_SPI=y
CONFIG_YAMAHA_YAS530=y
# end of Magnetometer sensors

#
# Multiplexers
#
CONFIG_IIO_MUX=m
# end of Multiplexers

#
# Inclinometer sensors
#
# CONFIG_HID_SENSOR_INCLINOMETER_3D is not set
CONFIG_HID_SENSOR_DEVICE_ROTATION=m
# end of Inclinometer sensors

#
# Triggers - standalone
#
# CONFIG_IIO_HRTIMER_TRIGGER is not set
# CONFIG_IIO_INTERRUPT_TRIGGER is not set
# CONFIG_IIO_STM32_LPTIMER_TRIGGER is not set
CONFIG_IIO_STM32_TIMER_TRIGGER=y
CONFIG_IIO_TIGHTLOOP_TRIGGER=y
# CONFIG_IIO_SYSFS_TRIGGER is not set
# end of Triggers - standalone

#
# Linear and angular position sensors
#
CONFIG_IQS624_POS=m
# CONFIG_HID_SENSOR_CUSTOM_INTEL_HINGE is not set
# end of Linear and angular position sensors

#
# Digital potentiometers
#
CONFIG_AD5110=m
# CONFIG_AD5272 is not set
CONFIG_DS1803=m
# CONFIG_MAX5432 is not set
CONFIG_MAX5481=y
CONFIG_MAX5487=m
CONFIG_MCP4018=y
# CONFIG_MCP4131 is not set
# CONFIG_MCP4531 is not set
# CONFIG_MCP41010 is not set
CONFIG_TPL0102=y
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=y
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_ABP060MG=y
# CONFIG_BMP280 is not set
CONFIG_DLHL60D=m
CONFIG_DPS310=m
CONFIG_HID_SENSOR_PRESS=m
# CONFIG_HP03 is not set
CONFIG_ICP10100=m
CONFIG_MPL115=y
# CONFIG_MPL115_I2C is not set
CONFIG_MPL115_SPI=y
CONFIG_MPL3115=y
# CONFIG_MS5611 is not set
# CONFIG_MS5637 is not set
CONFIG_IIO_ST_PRESS=y
CONFIG_IIO_ST_PRESS_I2C=y
CONFIG_IIO_ST_PRESS_SPI=m
# CONFIG_T5403 is not set
# CONFIG_HP206C is not set
CONFIG_ZPA2326=y
CONFIG_ZPA2326_I2C=y
CONFIG_ZPA2326_SPI=y
# end of Pressure sensors

#
# Lightning sensors
#
# CONFIG_AS3935 is not set
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_CROS_EC_MKBP_PROXIMITY=m
CONFIG_ISL29501=y
CONFIG_LIDAR_LITE_V2=y
# CONFIG_MB1232 is not set
# CONFIG_PING is not set
CONFIG_RFD77402=m
CONFIG_SRF04=m
CONFIG_SX_COMMON=y
CONFIG_SX9310=m
CONFIG_SX9324=y
CONFIG_SX9360=y
CONFIG_SX9500=m
CONFIG_SRF08=y
# CONFIG_VCNL3020 is not set
CONFIG_VL53L0X_I2C=y
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
CONFIG_AD2S90=y
CONFIG_AD2S1200=y
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_IQS620AT_TEMP=m
CONFIG_LTC2983=y
CONFIG_MAXIM_THERMOCOUPLE=m
# CONFIG_HID_SENSOR_TEMP is not set
# CONFIG_MLX90614 is not set
# CONFIG_MLX90632 is not set
CONFIG_TMP006=m
CONFIG_TMP007=y
# CONFIG_TMP117 is not set
CONFIG_TSYS01=m
CONFIG_TSYS02D=y
# CONFIG_MAX31856 is not set
# CONFIG_MAX31865 is not set
# end of Temperature sensors

CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
# CONFIG_PWM_ATMEL is not set
CONFIG_PWM_ATMEL_HLCDC_PWM=m
# CONFIG_PWM_ATMEL_TCB is not set
CONFIG_PWM_BCM_IPROC=m
CONFIG_PWM_BCM_KONA=y
# CONFIG_PWM_BCM2835 is not set
# CONFIG_PWM_BERLIN is not set
CONFIG_PWM_BRCMSTB=y
CONFIG_PWM_CLK=m
CONFIG_PWM_CLPS711X=y
# CONFIG_PWM_CROS_EC is not set
CONFIG_PWM_EP93XX=y
# CONFIG_PWM_FSL_FTM is not set
CONFIG_PWM_HIBVT=m
CONFIG_PWM_IMG=m
# CONFIG_PWM_IMX1 is not set
# CONFIG_PWM_IMX27 is not set
CONFIG_PWM_IMX_TPM=y
CONFIG_PWM_INTEL_LGM=y
# CONFIG_PWM_IQS620A is not set
CONFIG_PWM_JZ4740=m
CONFIG_PWM_KEEMBAY=m
CONFIG_PWM_LP3943=m
# CONFIG_PWM_LPC18XX_SCT is not set
# CONFIG_PWM_LPC32XX is not set
CONFIG_PWM_LPSS=m
CONFIG_PWM_LPSS_PLATFORM=m
# CONFIG_PWM_MESON is not set
CONFIG_PWM_MTK_DISP=y
# CONFIG_PWM_MEDIATEK is not set
CONFIG_PWM_MXS=y
CONFIG_PWM_NTXEC=y
# CONFIG_PWM_OMAP_DMTIMER is not set
CONFIG_PWM_PCA9685=m
# CONFIG_PWM_PXA is not set
CONFIG_PWM_RASPBERRYPI_POE=y
CONFIG_PWM_RCAR=y
CONFIG_PWM_RENESAS_TPU=m
# CONFIG_PWM_ROCKCHIP is not set
CONFIG_PWM_SAMSUNG=m
# CONFIG_PWM_SIFIVE is not set
# CONFIG_PWM_SL28CPLD is not set
# CONFIG_PWM_SPEAR is not set
# CONFIG_PWM_SPRD is not set
# CONFIG_PWM_STI is not set
# CONFIG_PWM_STM32 is not set
# CONFIG_PWM_STM32_LP is not set
CONFIG_PWM_SUN4I=y
# CONFIG_PWM_SUNPLUS is not set
# CONFIG_PWM_TEGRA is not set
CONFIG_PWM_TIECAP=m
# CONFIG_PWM_TIEHRPWM is not set
# CONFIG_PWM_TWL is not set
CONFIG_PWM_TWL_LED=y
CONFIG_PWM_VISCONTI=m
CONFIG_PWM_VT8500=m
# CONFIG_PWM_XILINX is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
CONFIG_ARM_GIC=y
CONFIG_ARM_GIC_PM=y
CONFIG_ARM_GIC_MAX_NR=1
CONFIG_ARM_GIC_V3=y
CONFIG_ARM_GIC_V3_ITS=y
CONFIG_ARM_GIC_V3_ITS_FSL_MC=y
CONFIG_AL_FIC=y
CONFIG_DW_APB_ICTL=y
CONFIG_MADERA_IRQ=y
CONFIG_JCORE_AIC=y
# CONFIG_RENESAS_INTC_IRQPIN is not set
CONFIG_RENESAS_IRQC=y
CONFIG_RENESAS_RZA1_IRQC=y
CONFIG_RENESAS_RZG2L_IRQC=y
# CONFIG_SL28CPLD_INTC is not set
CONFIG_SUN6I_R_INTC=y
CONFIG_SUNXI_NMI_INTC=y
CONFIG_TS4800_IRQ=m
# CONFIG_XILINX_INTC is not set
# CONFIG_INGENIC_TCU_IRQ is not set
CONFIG_MVEBU_GICP=y
CONFIG_MVEBU_ICU=y
CONFIG_MVEBU_ODMI=y
CONFIG_MVEBU_PIC=y
CONFIG_MVEBU_SEI=y
CONFIG_PARTITION_PERCPU=y
CONFIG_IRQ_UNIPHIER_AIDET=y
# CONFIG_MESON_IRQ_GPIO is not set
CONFIG_QCOM_PDC=y
# CONFIG_QCOM_MPM is not set
CONFIG_IMX_IRQSTEER=y
# CONFIG_IMX_INTMUX is not set
# CONFIG_EXYNOS_IRQ_COMBINER is not set
# CONFIG_MST_IRQ is not set
CONFIG_APPLE_AIC=y
CONFIG_MCHP_EIC=y
CONFIG_SUNPLUS_SP7021_INTC=y
# end of IRQ chip support

CONFIG_IPACK_BUS=m
# CONFIG_SERIAL_IPOCTAL is not set
CONFIG_ARCH_HAS_RESET_CONTROLLER=y
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_A10SR=y
# CONFIG_RESET_ATH79 is not set
# CONFIG_RESET_AXS10X is not set
# CONFIG_RESET_BCM6345 is not set
# CONFIG_RESET_BERLIN is not set
CONFIG_RESET_BRCMSTB=y
CONFIG_RESET_BRCMSTB_RESCAL=m
CONFIG_RESET_HSDK=y
# CONFIG_RESET_IMX7 is not set
# CONFIG_RESET_INTEL_GW is not set
# CONFIG_RESET_K210 is not set
CONFIG_RESET_LANTIQ=y
CONFIG_RESET_LPC18XX=y
CONFIG_RESET_MCHP_SPARX5=y
CONFIG_RESET_MESON=y
# CONFIG_RESET_MESON_AUDIO_ARB is not set
# CONFIG_RESET_NPCM is not set
# CONFIG_RESET_PISTACHIO is not set
CONFIG_RESET_QCOM_AOSS=y
CONFIG_RESET_QCOM_PDC=m
CONFIG_RESET_RASPBERRYPI=m
CONFIG_RESET_RZG2L_USBPHY_CTRL=m
CONFIG_RESET_SCMI=y
CONFIG_RESET_SIMPLE=y
# CONFIG_RESET_SOCFPGA is not set
CONFIG_RESET_STARFIVE_JH7100=y
# CONFIG_RESET_SUNPLUS is not set
CONFIG_RESET_SUNXI=y
# CONFIG_RESET_TI_SCI is not set
CONFIG_RESET_TI_SYSCON=m
CONFIG_RESET_TI_TPS380X=y
# CONFIG_RESET_TN48M_CPLD is not set
# CONFIG_RESET_UNIPHIER is not set
# CONFIG_RESET_UNIPHIER_GLUE is not set
CONFIG_RESET_ZYNQ=y
CONFIG_COMMON_RESET_HI3660=y
CONFIG_COMMON_RESET_HI6220=y
CONFIG_RESET_TEGRA_BPMP=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
# CONFIG_PHY_LPC18XX_USB_OTG is not set
CONFIG_PHY_PISTACHIO_USB=m
# CONFIG_PHY_XGENE is not set
CONFIG_USB_LGM_PHY=m
# CONFIG_PHY_CAN_TRANSCEIVER is not set
# CONFIG_PHY_SUN4I_USB is not set
# CONFIG_PHY_SUN6I_MIPI_DPHY is not set
# CONFIG_PHY_SUN9I_USB is not set
CONFIG_PHY_SUN50I_USB3=m
CONFIG_PHY_MESON8_HDMI_TX=y
CONFIG_PHY_MESON8B_USB2=y
# CONFIG_PHY_MESON_GXL_USB2 is not set
CONFIG_PHY_MESON_G12A_MIPI_DPHY_ANALOG=m
CONFIG_PHY_MESON_G12A_USB2=m
# CONFIG_PHY_MESON_G12A_USB3_PCIE is not set
CONFIG_PHY_MESON_AXG_PCIE=y
CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG=y
# CONFIG_PHY_MESON_AXG_MIPI_DPHY is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_PHY_BCM63XX_USBH is not set
CONFIG_PHY_CYGNUS_PCIE=m
CONFIG_PHY_BCM_SR_USB=m
# CONFIG_BCM_KONA_USB2_PHY is not set
CONFIG_PHY_BCM_NS_USB2=m
CONFIG_PHY_NS2_USB_DRD=y
CONFIG_PHY_BRCM_SATA=m
CONFIG_PHY_BRCM_USB=m
CONFIG_PHY_BCM_SR_PCIE=m
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_CADENCE_TORRENT=m
CONFIG_PHY_CADENCE_DPHY=y
CONFIG_PHY_CADENCE_DPHY_RX=y
# CONFIG_PHY_CADENCE_SIERRA is not set
CONFIG_PHY_CADENCE_SALVO=y
# CONFIG_PHY_FSL_IMX8MQ_USB is not set
CONFIG_PHY_MIXEL_LVDS_PHY=y
CONFIG_PHY_MIXEL_MIPI_DPHY=y
CONFIG_PHY_FSL_IMX8M_PCIE=m
# CONFIG_PHY_FSL_LYNX_28G is not set
# CONFIG_PHY_HI6220_USB is not set
CONFIG_PHY_HI3660_USB=m
CONFIG_PHY_HI3670_USB=y
# CONFIG_PHY_HI3670_PCIE is not set
# CONFIG_PHY_HISTB_COMBPHY is not set
CONFIG_PHY_HISI_INNO_USB2=m
CONFIG_PHY_INGENIC_USB=m
# CONFIG_PHY_LANTIQ_VRX200_PCIE is not set
CONFIG_PHY_LANTIQ_RCU_USB2=y
# CONFIG_ARMADA375_USBCLUSTER_PHY is not set
# CONFIG_PHY_BERLIN_SATA is not set
# CONFIG_PHY_BERLIN_USB is not set
# CONFIG_PHY_MVEBU_A3700_COMPHY is not set
CONFIG_PHY_MVEBU_A3700_UTMI=y
# CONFIG_PHY_MVEBU_A38X_COMPHY is not set
CONFIG_PHY_MVEBU_CP110_COMPHY=y
CONFIG_PHY_MVEBU_CP110_UTMI=m
# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
CONFIG_PHY_PXA_USB=y
CONFIG_PHY_MMP3_USB=y
CONFIG_PHY_MMP3_HSIC=m
# CONFIG_PHY_MTK_PCIE is not set
CONFIG_PHY_MTK_TPHY=m
# CONFIG_PHY_MTK_UFS is not set
# CONFIG_PHY_MTK_XSPHY is not set
CONFIG_PHY_MTK_HDMI=y
CONFIG_PHY_MTK_MIPI_DSI=m
CONFIG_PHY_MTK_DP=m
# CONFIG_PHY_SPARX5_SERDES is not set
CONFIG_PHY_LAN966X_SERDES=m
# CONFIG_PHY_CPCAP_USB is not set
CONFIG_PHY_MAPPHONE_MDM6600=m
CONFIG_PHY_OCELOT_SERDES=m
CONFIG_PHY_ATH79_USB=m
# CONFIG_PHY_QCOM_APQ8064_SATA is not set
CONFIG_PHY_QCOM_EDP=y
CONFIG_PHY_QCOM_IPQ4019_USB=y
CONFIG_PHY_QCOM_IPQ806X_SATA=y
# CONFIG_PHY_QCOM_PCIE2 is not set
CONFIG_PHY_QCOM_QMP=y
CONFIG_PHY_QCOM_QUSB2=y
CONFIG_PHY_QCOM_USB_HS=m
CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
# CONFIG_PHY_QCOM_USB_HSIC is not set
CONFIG_PHY_QCOM_USB_HS_28NM=m
# CONFIG_PHY_QCOM_USB_SS is not set
CONFIG_PHY_QCOM_IPQ806X_USB=m
# CONFIG_PHY_MT7621_PCI is not set
CONFIG_PHY_RALINK_USB=m
# CONFIG_PHY_RCAR_GEN2 is not set
CONFIG_PHY_RCAR_GEN3_PCIE=m
CONFIG_PHY_RCAR_GEN3_USB2=m
CONFIG_PHY_RCAR_GEN3_USB3=m
CONFIG_PHY_ROCKCHIP_DPHY_RX0=m
# CONFIG_PHY_ROCKCHIP_INNO_HDMI is not set
# CONFIG_PHY_ROCKCHIP_INNO_USB2 is not set
CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY=m
CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY=y
CONFIG_PHY_ROCKCHIP_PCIE=y
# CONFIG_PHY_ROCKCHIP_TYPEC is not set
CONFIG_PHY_EXYNOS_DP_VIDEO=m
# CONFIG_PHY_EXYNOS_MIPI_VIDEO is not set
# CONFIG_PHY_EXYNOS_PCIE is not set
CONFIG_PHY_SAMSUNG_UFS=y
CONFIG_PHY_SAMSUNG_USB2=y
# CONFIG_PHY_S5PV210_USB2 is not set
CONFIG_PHY_EXYNOS5_USBDRD=m
# CONFIG_PHY_UNIPHIER_USB2 is not set
CONFIG_PHY_UNIPHIER_USB3=y
CONFIG_PHY_UNIPHIER_PCIE=y
CONFIG_PHY_UNIPHIER_AHCI=m
# CONFIG_PHY_ST_SPEAR1310_MIPHY is not set
CONFIG_PHY_ST_SPEAR1340_MIPHY=m
CONFIG_PHY_STIH407_USB=y
CONFIG_PHY_STM32_USBPHYC=m
CONFIG_PHY_TEGRA_XUSB=y
# CONFIG_PHY_TEGRA194_P2U is not set
CONFIG_PHY_DA8XX_USB=y
# CONFIG_PHY_DM816X_USB is not set
CONFIG_PHY_AM654_SERDES=m
CONFIG_PHY_J721E_WIZ=y
CONFIG_OMAP_CONTROL_PHY=y
CONFIG_TI_PIPE3=y
CONFIG_PHY_TUSB1210=m
# CONFIG_PHY_INTEL_KEEMBAY_EMMC is not set
# CONFIG_PHY_INTEL_KEEMBAY_USB is not set
# CONFIG_PHY_INTEL_LGM_COMBO is not set
CONFIG_PHY_INTEL_LGM_EMMC=m
CONFIG_PHY_INTEL_THUNDERBAY_EMMC=y
CONFIG_PHY_XILINX_ZYNQMP=y
# end of PHY Subsystem

CONFIG_POWERCAP=y
# CONFIG_DTPM is not set
CONFIG_MCB=y
CONFIG_MCB_LPC=y
CONFIG_RAS=y

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_DAX=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_IMX_IIM=y
# CONFIG_NVMEM_IMX_OCOTP is not set
# CONFIG_JZ4780_EFUSE is not set
CONFIG_NVMEM_LPC18XX_EEPROM=y
CONFIG_NVMEM_LPC18XX_OTP=m
CONFIG_NVMEM_MXS_OCOTP=m
# CONFIG_MTK_EFUSE is not set
# CONFIG_MICROCHIP_OTPC is not set
# CONFIG_NVMEM_NINTENDO_OTP is not set
# CONFIG_QCOM_QFPROM is not set
CONFIG_NVMEM_SPMI_SDAM=y
# CONFIG_ROCKCHIP_EFUSE is not set
# CONFIG_ROCKCHIP_OTP is not set
CONFIG_NVMEM_BCM_OCOTP=y
CONFIG_NVMEM_STM32_ROMEM=y
# CONFIG_NVMEM_SUNXI_SID is not set
# CONFIG_UNIPHIER_EFUSE is not set
CONFIG_NVMEM_VF610_OCOTP=y
# CONFIG_MESON_MX_EFUSE is not set
# CONFIG_NVMEM_SNVS_LPGPR is not set
# CONFIG_RAVE_SP_EEPROM is not set
# CONFIG_SC27XX_EFUSE is not set
# CONFIG_NVMEM_ZYNQMP is not set
# CONFIG_SPRD_EFUSE is not set
# CONFIG_NVMEM_RMEM is not set
CONFIG_NVMEM_BRCM_NVRAM=m
CONFIG_NVMEM_LAYERSCAPE_SFP=y
# CONFIG_NVMEM_SUNPLUS_OCOTP is not set
# CONFIG_NVMEM_APPLE_EFUSES is not set

#
# HW tracing support
#
CONFIG_STM=y
# CONFIG_STM_PROTO_BASIC is not set
CONFIG_STM_PROTO_SYS_T=m
CONFIG_STM_DUMMY=y
CONFIG_STM_SOURCE_CONSOLE=m
CONFIG_STM_SOURCE_HEARTBEAT=y
CONFIG_STM_SOURCE_FTRACE=m
CONFIG_INTEL_TH=y
CONFIG_INTEL_TH_GTH=m
# CONFIG_INTEL_TH_STH is not set
CONFIG_INTEL_TH_MSU=m
# CONFIG_INTEL_TH_PTI is not set
CONFIG_INTEL_TH_DEBUG=y
# end of HW tracing support

CONFIG_FPGA=y
# CONFIG_FPGA_MGR_SOCFPGA is not set
CONFIG_FPGA_MGR_SOCFPGA_A10=m
CONFIG_ALTERA_PR_IP_CORE=y
# CONFIG_ALTERA_PR_IP_CORE_PLAT is not set
CONFIG_FPGA_MGR_ALTERA_PS_SPI=m
CONFIG_FPGA_MGR_ZYNQ_FPGA=m
CONFIG_FPGA_MGR_STRATIX10_SOC=m
CONFIG_FPGA_MGR_XILINX_SPI=y
CONFIG_FPGA_MGR_ICE40_SPI=y
CONFIG_FPGA_MGR_MACHXO2_SPI=y
CONFIG_FPGA_BRIDGE=y
CONFIG_SOCFPGA_FPGA_BRIDGE=m
CONFIG_ALTERA_FREEZE_BRIDGE=m
CONFIG_XILINX_PR_DECOUPLER=y
CONFIG_FPGA_REGION=y
CONFIG_OF_FPGA_REGION=m
CONFIG_FPGA_DFL=y
CONFIG_FPGA_DFL_AFU=y
# CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000 is not set
# CONFIG_FPGA_MGR_ZYNQMP_FPGA is not set
# CONFIG_FPGA_MGR_VERSAL_FPGA is not set
CONFIG_FPGA_MGR_MICROCHIP_SPI=y
# CONFIG_FSI is not set
CONFIG_TEE=m
# CONFIG_OPTEE is not set
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
# CONFIG_MUX_ADG792A is not set
CONFIG_MUX_ADGS1408=m
CONFIG_MUX_GPIO=y
CONFIG_MUX_MMIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
CONFIG_SLIMBUS=m
CONFIG_SLIM_QCOM_CTRL=m
CONFIG_INTERCONNECT=y
# CONFIG_INTERCONNECT_IMX is not set
# CONFIG_INTERCONNECT_QCOM is not set
CONFIG_INTERCONNECT_QCOM_OSM_L3=y
CONFIG_INTERCONNECT_SAMSUNG=y
CONFIG_INTERCONNECT_EXYNOS=m
# CONFIG_COUNTER is not set
CONFIG_MOST=m
CONFIG_MOST_USB_HDM=m
CONFIG_MOST_CDEV=m
CONFIG_PECI=y
CONFIG_PECI_CPU=m
# CONFIG_PECI_ASPEED is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
# CONFIG_QUOTA is not set
CONFIG_AUTOFS4_FS=m
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
# CONFIG_FSCACHE is not set
# end of Caches

#
# Pseudo filesystems
#
# CONFIG_PROC_FS is not set
# CONFIG_PROC_CHILDREN is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
CONFIG_TMPFS_XATTR=y
CONFIG_TMPFS_INODE64=y
CONFIG_ARCH_SUPPORTS_HUGETLBFS=y
# CONFIG_HUGETLBFS is not set
CONFIG_ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=m
CONFIG_ECRYPT_FS=m
CONFIG_ECRYPT_FS_MESSAGING=y
# CONFIG_JFFS2_FS is not set
CONFIG_CRAMFS=y
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=m
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=m
CONFIG_PSTORE_LZO_COMPRESS=m
CONFIG_PSTORE_LZ4_COMPRESS=m
CONFIG_PSTORE_LZ4HC_COMPRESS=m
CONFIG_PSTORE_842_COMPRESS=y
CONFIG_PSTORE_ZSTD_COMPRESS=y
CONFIG_PSTORE_COMPRESS=y
# CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_LZO_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_LZ4_COMPRESS_DEFAULT=y
# CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_842_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_ZSTD_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_COMPRESS_DEFAULT="lz4"
CONFIG_PSTORE_CONSOLE=y
# CONFIG_PSTORE_PMSG is not set
# CONFIG_PSTORE_RAM is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
CONFIG_NLS_CODEPAGE_737=y
CONFIG_NLS_CODEPAGE_775=m
# CONFIG_NLS_CODEPAGE_850 is not set
# CONFIG_NLS_CODEPAGE_852 is not set
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
CONFIG_NLS_CODEPAGE_861=y
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
CONFIG_NLS_CODEPAGE_864=y
# CONFIG_NLS_CODEPAGE_865 is not set
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=m
# CONFIG_NLS_CODEPAGE_936 is not set
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=y
# CONFIG_NLS_CODEPAGE_1251 is not set
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=m
# CONFIG_NLS_ISO8859_2 is not set
CONFIG_NLS_ISO8859_3=y
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=y
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=y
# CONFIG_NLS_ISO8859_13 is not set
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=y
# CONFIG_NLS_KOI8_U is not set
# CONFIG_NLS_MAC_ROMAN is not set
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=y
# CONFIG_NLS_MAC_CYRILLIC is not set
CONFIG_NLS_MAC_GAELIC=y
CONFIG_NLS_MAC_GREEK=m
# CONFIG_NLS_MAC_ICELAND is not set
CONFIG_NLS_MAC_INUIT=m
# CONFIG_NLS_MAC_ROMANIAN is not set
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=y
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y

#
# No trust source selected!
#
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
CONFIG_KEY_DH_OPERATIONS=y
# CONFIG_KEY_NOTIFICATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_SECURITYFS is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
CONFIG_INIT_STACK_NONE=y
# CONFIG_INIT_STACK_ALL_PATTERN is not set
# CONFIG_INIT_STACK_ALL_ZERO is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_CC_HAS_RANDSTRUCT=y
# CONFIG_RANDSTRUCT_NONE is not set
CONFIG_RANDSTRUCT_FULL=y
CONFIG_RANDSTRUCT=y
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_FIPS=y
CONFIG_CRYPTO_FIPS_NAME="Linux Kernel Cryptographic API"
# CONFIG_CRYPTO_FIPS_CUSTOM_VERSION is not set
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
# CONFIG_CRYPTO_PCRYPT is not set
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_TEST=m
CONFIG_CRYPTO_ENGINE=y

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_ECDSA=m
# CONFIG_CRYPTO_ECRDSA is not set
CONFIG_CRYPTO_SM2=y
CONFIG_CRYPTO_CURVE25519=y

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_CHACHA20POLY1305=m
# CONFIG_CRYPTO_AEGIS128 is not set
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=m
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=m
CONFIG_CRYPTO_KEYWRAP=y
# CONFIG_CRYPTO_ADIANTUM is not set
# CONFIG_CRYPTO_HCTR2 is not set
# CONFIG_CRYPTO_ESSIV is not set

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_HMAC=y
# CONFIG_CRYPTO_XCBC is not set
CONFIG_CRYPTO_VMAC=m

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_XXHASH=m
CONFIG_CRYPTO_BLAKE2B=m
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLYVAL=y
CONFIG_CRYPTO_POLY1305=y
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_RMD160=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_SM3_GENERIC=y
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_WP512=m

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=m
# CONFIG_CRYPTO_BLOWFISH is not set
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_DES=y
# CONFIG_CRYPTO_FCRYPT is not set
CONFIG_CRYPTO_CHACHA20=m
# CONFIG_CRYPTO_ARIA is not set
CONFIG_CRYPTO_SERPENT=m
# CONFIG_CRYPTO_SM4_GENERIC is not set
# CONFIG_CRYPTO_TWOFISH is not set

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=m
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=m
CONFIG_CRYPTO_LZ4=m
CONFIG_CRYPTO_LZ4HC=m
CONFIG_CRYPTO_ZSTD=y

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_KDF800108_CTR=y
CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_ALLWINNER=y
CONFIG_CRYPTO_DEV_SUN4I_SS=y
# CONFIG_CRYPTO_DEV_SUN4I_SS_PRNG is not set
# CONFIG_CRYPTO_DEV_SUN4I_SS_DEBUG is not set
CONFIG_CRYPTO_DEV_SUN8I_CE=m
# CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG is not set
CONFIG_CRYPTO_DEV_SUN8I_CE_HASH=y
CONFIG_CRYPTO_DEV_SUN8I_CE_PRNG=y
CONFIG_CRYPTO_DEV_SUN8I_CE_TRNG=y
CONFIG_CRYPTO_DEV_SUN8I_SS=y
CONFIG_CRYPTO_DEV_SUN8I_SS_DEBUG=y
# CONFIG_CRYPTO_DEV_SUN8I_SS_PRNG is not set
# CONFIG_CRYPTO_DEV_SUN8I_SS_HASH is not set
CONFIG_CRYPTO_DEV_SL3516=y
CONFIG_CRYPTO_DEV_SL3516_DEBUG=y
# CONFIG_CRYPTO_DEV_EXYNOS_RNG is not set
CONFIG_CRYPTO_DEV_S5P=y
# CONFIG_CRYPTO_DEV_EXYNOS_HASH is not set
# CONFIG_CRYPTO_DEV_ATMEL_AUTHENC is not set
CONFIG_CRYPTO_DEV_ATMEL_AES=m
# CONFIG_CRYPTO_DEV_ATMEL_TDES is not set
CONFIG_CRYPTO_DEV_ATMEL_SHA=y
CONFIG_CRYPTO_DEV_ATMEL_I2C=y
CONFIG_CRYPTO_DEV_ATMEL_ECC=y
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
CONFIG_CRYPTO_DEV_CCP=y
CONFIG_CRYPTO_DEV_CCP_DD=y
CONFIG_CRYPTO_DEV_MARVELL=y
CONFIG_CRYPTO_DEV_MARVELL_CESA=y
CONFIG_CRYPTO_DEV_QCE=m
CONFIG_CRYPTO_DEV_QCE_SKCIPHER=y
CONFIG_CRYPTO_DEV_QCE_SHA=y
CONFIG_CRYPTO_DEV_QCE_AEAD=y
CONFIG_CRYPTO_DEV_QCE_ENABLE_ALL=y
# CONFIG_CRYPTO_DEV_QCE_ENABLE_SKCIPHER is not set
# CONFIG_CRYPTO_DEV_QCE_ENABLE_SHA is not set
# CONFIG_CRYPTO_DEV_QCE_ENABLE_AEAD is not set
CONFIG_CRYPTO_DEV_QCE_SW_MAX_LEN=512
# CONFIG_CRYPTO_DEV_QCOM_RNG is not set
CONFIG_CRYPTO_DEV_IMGTEC_HASH=m
CONFIG_CRYPTO_DEV_ZYNQMP_AES=y
CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m
CONFIG_CRYPTO_DEV_VIRTIO=y
CONFIG_CRYPTO_DEV_SAFEXCEL=m
# CONFIG_CRYPTO_DEV_CCREE is not set
CONFIG_CRYPTO_DEV_HISI_SEC=m
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
CONFIG_CRYPTO_DEV_SA2UL=y
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4=y
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4_ECB=y
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4_CTS=y
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_ECC=y
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_HCU=m
CONFIG_CRYPTO_DEV_KEEMBAY_OCS_HCU_HMAC_SHA224=y
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
CONFIG_PKCS7_MESSAGE_PARSER=y
CONFIG_PKCS7_TEST_KEY=y
CONFIG_SIGNED_PE_FILE_VERIFICATION=y
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
CONFIG_SYSTEM_REVOCATION_LIST=y
CONFIG_SYSTEM_REVOCATION_KEYS=""
CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE=y
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_HAVE_ARCH_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_CORDIC=m
CONFIG_PRIME_NUMBERS=m
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_STMP_DEVICE=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y
CONFIG_INDIRECT_PIO=y
# CONFIG_TRACE_MMIO_ACCESS is not set

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=m
CONFIG_CRYPTO_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=9
CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=m
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_LIB_MEMNEQ=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=m
CONFIG_CRC64_ROCKSOFT=m
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
CONFIG_CRC32_SELFTEST=y
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
CONFIG_CRC32_BIT=y
CONFIG_CRC64=m
CONFIG_CRC4=y
CONFIG_CRC7=m
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
CONFIG_AUDIT_ARCH_COMPAT_GENERIC=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=m
CONFIG_842_DECOMPRESS=m
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=m
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=m
CONFIG_LZ4HC_COMPRESS=m
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
# CONFIG_XZ_DEC_X86 is not set
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
# CONFIG_XZ_DEC_ARM is not set
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_MICROLZMA=y
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_ENC16=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=m
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_DMA_DECLARE_COHERENT=y
CONFIG_ARCH_HAS_SETUP_DMA_OPS=y
CONFIG_ARCH_HAS_TEARDOWN_DMA_OPS=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU=y
CONFIG_ARCH_HAS_DMA_PREP_COHERENT=y
CONFIG_SWIOTLB=y
CONFIG_DMA_RESTRICTED_POOL=y
CONFIG_DMA_NONCOHERENT_MMAP=y
CONFIG_DMA_COHERENT_POOL=y
CONFIG_DMA_DIRECT_REMAP=y
CONFIG_DMA_CMA=y
# CONFIG_DMA_PERNUMA_CMA is not set

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=16
CONFIG_CMA_SIZE_PERCENTAGE=10
# CONFIG_CMA_SIZE_SEL_MBYTES is not set
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
CONFIG_CMA_SIZE_SEL_MIN=y
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
CONFIG_DMA_API_DEBUG=y
CONFIG_DMA_API_DEBUG_SG=y
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
# CONFIG_CPUMASK_OFFSTACK is not set
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_SG_SPLIT=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
# CONFIG_PARMAN is not set
CONFIG_OBJAGG=y
# end of Library routines

CONFIG_GENERIC_IOREMAP=y
CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_SYMBOLIC_ERRNAME=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
# CONFIG_DEBUG_INFO_NONE is not set
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
# CONFIG_DEBUG_INFO_REDUCED is not set
CONFIG_DEBUG_INFO_SPLIT=y
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_BTF_TAG=y
CONFIG_GDB_SCRIPTS=y
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_HEADERS_INSTALL is not set
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
CONFIG_ARCH_WANT_FRAME_POINTERS=y
CONFIG_FRAME_POINTER=y
CONFIG_VMLINUX_MAP=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
CONFIG_DEBUG_FS_ALLOW_NONE=y
CONFIG_HAVE_ARCH_KGDB=y
CONFIG_KGDB=y
# CONFIG_KGDB_HONOUR_BLOCKLIST is not set
# CONFIG_KGDB_TESTS is not set
# CONFIG_KGDB_KDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
# CONFIG_UBSAN_BOUNDS is not set
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_UNREACHABLE is not set
# CONFIG_UBSAN_BOOL is not set
CONFIG_UBSAN_ENUM=y
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# CONFIG_KCSAN is not set
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_DEBUG_SLAB=y
# CONFIG_PAGE_OWNER is not set
# CONFIG_PAGE_TABLE_CHECK is not set
CONFIG_PAGE_POISONING=y
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
CONFIG_DEBUG_OBJECTS=y
CONFIG_DEBUG_OBJECTS_SELFTEST=y
# CONFIG_DEBUG_OBJECTS_FREE is not set
CONFIG_DEBUG_OBJECTS_TIMERS=y
# CONFIG_DEBUG_OBJECTS_WORK is not set
CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
CONFIG_SHRINKER_DEBUG=y
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
CONFIG_DEBUG_STACK_USAGE=y
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_VM=y
# CONFIG_DEBUG_VM_VMACACHE is not set
CONFIG_DEBUG_VM_RB=y
# CONFIG_DEBUG_VM_PGFLAGS is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_DEBUG_PER_CPU_MAPS=y
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_SW_TAGS=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_KASAN_SW_TAGS=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_HAVE_ARCH_KFENCE=y
CONFIG_KFENCE=y
CONFIG_KFENCE_SAMPLE_INTERVAL=100
CONFIG_KFENCE_NUM_OBJECTS=255
CONFIG_KFENCE_DEFERRABLE=y
# CONFIG_KFENCE_STATIC_KEYS is not set
CONFIG_KFENCE_STRESS_TEST_FAULTS=0
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
# CONFIG_SOFTLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
CONFIG_BOOTPARAM_HUNG_TASK_PANIC=y
# CONFIG_WQ_WATCHDOG is not set
CONFIG_TEST_LOCKUP=m
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_INFO=y
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y
# CONFIG_DEBUG_PREEMPT is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
CONFIG_DEBUG_LOCKDEP=y
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
CONFIG_LOCK_TORTURE_TEST=m
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
CONFIG_CSD_LOCK_WAIT_DEBUG=y
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACE_IRQFLAGS_NMI=y
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
# CONFIG_DEBUG_KOBJECT is not set
CONFIG_DEBUG_KOBJECT_RELEASE=y

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
CONFIG_DEBUG_PLIST=y
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
CONFIG_PROVE_RCU_LIST=y
CONFIG_TORTURE_TEST=y
# CONFIG_RCU_SCALE_TEST is not set
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_REF_SCALE_TEST=y
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
CONFIG_CPU_HOTPLUG_STATE_CONTROL=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
# CONFIG_SAMPLES is not set
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set

#
# arm64 Debugging
#
CONFIG_PID_IN_CONTEXTIDR=y
CONFIG_ARM64_RELOC_TEST=m
# CONFIG_CORESIGHT is not set
# end of arm64 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=m
CONFIG_PM_NOTIFIER_ERROR_INJECT=m
CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT=m
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
# CONFIG_FAIL_PAGE_ALLOC is not set
CONFIG_FAULT_INJECTION_USERCOPY=y
# CONFIG_FAIL_FUTEX is not set
# CONFIG_FAULT_INJECTION_DEBUG_FS is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_KCOV=y
CONFIG_KCOV_ENABLE_COMPARISONS=y
CONFIG_KCOV_INSTRUMENT_ALL=y
CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_LKDTM is not set
CONFIG_TEST_MIN_HEAP=y
CONFIG_TEST_DIV64=y
CONFIG_BACKTRACE_SELF_TEST=y
# CONFIG_TEST_REF_TRACKER is not set
CONFIG_RBTREE_TEST=m
CONFIG_REED_SOLOMON_TEST=y
# CONFIG_INTERVAL_TREE_TEST is not set
CONFIG_PERCPU_TEST=m
CONFIG_ATOMIC64_SELFTEST=m
CONFIG_TEST_HEXDUMP=y
CONFIG_STRING_SELFTEST=y
CONFIG_TEST_STRING_HELPERS=y
# CONFIG_TEST_STRSCPY is not set
# CONFIG_TEST_KSTRTOX is not set
CONFIG_TEST_PRINTF=m
CONFIG_TEST_SCANF=m
CONFIG_TEST_BITMAP=m
CONFIG_TEST_UUID=y
CONFIG_TEST_XARRAY=y
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_SIPHASH is not set
# CONFIG_TEST_IDA is not set
CONFIG_TEST_LKM=m
CONFIG_TEST_BITOPS=m
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
CONFIG_TEST_FIRMWARE=m
CONFIG_TEST_UDELAY=y
# CONFIG_TEST_STATIC_KEYS is not set
CONFIG_TEST_MEMCAT_P=y
CONFIG_TEST_OBJAGG=y
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_FREE_PAGES is not set
CONFIG_ARCH_USE_MEMTEST=y
CONFIG_MEMTEST=y
# end of Kernel Testing and Coverage

# CONFIG_WARN_MISSING_DOCUMENTS is not set
CONFIG_WARN_ABI_ERRORS=y
# end of Kernel hacking

--eT9GJHl9ZYjniUOt--
