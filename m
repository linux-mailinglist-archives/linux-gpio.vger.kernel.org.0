Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0858A5BAF90
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Sep 2022 16:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbiIPOoF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Sep 2022 10:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231372AbiIPOoE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Sep 2022 10:44:04 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1829E5F221
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 07:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663339442; x=1694875442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gLSznxd8T+69M1DaDETXKkyW81PVE30+Xx00nDgb6Sc=;
  b=CUTA4AF9Ujbua5iik86WJ1+FURWk3/zphhMmeNHDADQGenDiZfjyQ2lu
   x9/72nw3RX6O3v7StDRLDI+NMhneBCtUIRErefd30ioq33szo1rk2Ll/F
   pf2Su67rrv1bZEhggbE83IwyNLpQVLAUcbC1qVMaBzrYXBmAfN69KrRFA
   JuBZaH0VOx6sbg3kQEsz3bwCVhaLX+dKdALewaKb0dKrTYT9cGjs1YL6G
   et2ilRdtiykV8LGhcONWEJKp8+dfl5beuYP9Te8xDSIsubugFSjGSgS2n
   yB+fANWd9pOmKh6CN2XMVxZ++aTCWwwZpQX0E4cUhmD5YDYzZHlqBN3w4
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="360744927"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="360744927"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 07:44:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="686158540"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Sep 2022 07:43:58 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oZCZS-0001qk-0U;
        Fri, 16 Sep 2022 14:43:58 +0000
Date:   Fri, 16 Sep 2022 22:43:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jianqun Xu <jay.xu@rock-chips.com>, jbx6244@gmail.com,
        heiko@sntech.de, linus.walleij@linaro.org,
        andriy.shevchenko@linux.intel.com
Cc:     kbuild-all@lists.01.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH] pinctrl: rockchip: find gpiochip by name from gpio module
Message-ID: <202209162216.ywZfA4Za-lkp@intel.com>
References: <20220916084343.458566-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916084343.458566-1-jay.xu@rock-chips.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jianqun,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on linus/master v6.0-rc5 next-20220916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianqun-Xu/pinctrl-rockchip-find-gpiochip-by-name-from-gpio-module/20220916-164429
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
config: arm-randconfig-r026-20220916 (https://download.01.org/0day-ci/archive/20220916/202209162216.ywZfA4Za-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3b7aea26a196ae8a452c7283c4a42d98eade1aff
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jianqun-Xu/pinctrl-rockchip-find-gpiochip-by-name-from-gpio-module/20220916-164429
        git checkout 3b7aea26a196ae8a452c7283c4a42d98eade1aff
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-rockchip.c: In function 'rockchip_irq_reqres':
>> drivers/gpio/gpio-rockchip.c:477:36: error: passing argument 1 of 'gpiochip_reqres_irq' from incompatible pointer type [-Werror=incompatible-pointer-types]
     477 |         return gpiochip_reqres_irq(&bank->gpio_chip, d->hwirq);
         |                                    ^~~~~~~~~~~~~~~~
         |                                    |
         |                                    struct gpio_chip **
   In file included from drivers/gpio/gpio-rockchip.c:13:
   include/linux/gpio/driver.h:622:43: note: expected 'struct gpio_chip *' but argument is of type 'struct gpio_chip **'
     622 | int gpiochip_reqres_irq(struct gpio_chip *gc, unsigned int offset);
         |                         ~~~~~~~~~~~~~~~~~~^~
   drivers/gpio/gpio-rockchip.c: In function 'rockchip_irq_relres':
>> drivers/gpio/gpio-rockchip.c:485:29: error: passing argument 1 of 'gpiochip_relres_irq' from incompatible pointer type [-Werror=incompatible-pointer-types]
     485 |         gpiochip_relres_irq(&bank->gpio_chip, d->hwirq);
         |                             ^~~~~~~~~~~~~~~~
         |                             |
         |                             struct gpio_chip **
   include/linux/gpio/driver.h:623:44: note: expected 'struct gpio_chip *' but argument is of type 'struct gpio_chip **'
     623 | void gpiochip_relres_irq(struct gpio_chip *gc, unsigned int offset);
         |                          ~~~~~~~~~~~~~~~~~~^~
   drivers/gpio/gpio-rockchip.c: In function 'rockchip_gpiolib_register':
>> drivers/gpio/gpio-rockchip.c:584:27: error: incompatible types when assigning to type 'struct gpio_chip *' from type 'struct gpio_chip'
     584 |         bank->gpio_chip = rockchip_gpiolib_chip;
         |                           ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-rockchip.c:586:12: error: assignment to 'struct gpio_chip *' from incompatible pointer type 'struct gpio_chip **' [-Werror=incompatible-pointer-types]
     586 |         gc = &bank->gpio_chip;
         |            ^
>> drivers/gpio/gpio-rockchip.c:637:25: error: passing argument 1 of 'gpiochip_remove' from incompatible pointer type [-Werror=incompatible-pointer-types]
     637 |         gpiochip_remove(&bank->gpio_chip);
         |                         ^~~~~~~~~~~~~~~~
         |                         |
         |                         struct gpio_chip **
   include/linux/gpio/driver.h:613:47: note: expected 'struct gpio_chip *' but argument is of type 'struct gpio_chip **'
     613 | extern void gpiochip_remove(struct gpio_chip *gc);
         |                             ~~~~~~~~~~~~~~~~~~^~
   drivers/gpio/gpio-rockchip.c: In function 'rockchip_gpio_probe':
>> drivers/gpio/gpio-rockchip.c:759:62: error: passing argument 1 of 'rockchip_gpio_direction_output' from incompatible pointer type [-Werror=incompatible-pointer-types]
     759 |                         ret = rockchip_gpio_direction_output(&bank->gpio_chip, cfg->pin, cfg->arg);
         |                                                              ^~~~~~~~~~~~~~~~
         |                                                              |
         |                                                              struct gpio_chip **
   drivers/gpio/gpio-rockchip.c:256:61: note: expected 'struct gpio_chip *' but argument is of type 'struct gpio_chip **'
     256 | static int rockchip_gpio_direction_output(struct gpio_chip *gc,
         |                                           ~~~~~~~~~~~~~~~~~~^~
>> drivers/gpio/gpio-rockchip.c:765:61: error: passing argument 1 of 'rockchip_gpio_direction_input' from incompatible pointer type [-Werror=incompatible-pointer-types]
     765 |                         ret = rockchip_gpio_direction_input(&bank->gpio_chip, cfg->pin);
         |                                                             ^~~~~~~~~~~~~~~~
         |                                                             |
         |                                                             struct gpio_chip **
   drivers/gpio/gpio-rockchip.c:250:60: note: expected 'struct gpio_chip *' but argument is of type 'struct gpio_chip **'
     250 | static int rockchip_gpio_direction_input(struct gpio_chip *gc,
         |                                          ~~~~~~~~~~~~~~~~~~^~
   drivers/gpio/gpio-rockchip.c: In function 'rockchip_gpio_remove':
   drivers/gpio/gpio-rockchip.c:789:25: error: passing argument 1 of 'gpiochip_remove' from incompatible pointer type [-Werror=incompatible-pointer-types]
     789 |         gpiochip_remove(&bank->gpio_chip);
         |                         ^~~~~~~~~~~~~~~~
         |                         |
         |                         struct gpio_chip **
   include/linux/gpio/driver.h:613:47: note: expected 'struct gpio_chip *' but argument is of type 'struct gpio_chip **'
     613 | extern void gpiochip_remove(struct gpio_chip *gc);
         |                             ~~~~~~~~~~~~~~~~~~^~
   cc1: some warnings being treated as errors


vim +584 drivers/gpio/gpio-rockchip.c

936ee2675eee1f Jianqun Xu     2021-08-16  471  
adc8b4bf2a7f6f John Keeping   2021-12-02  472  static int rockchip_irq_reqres(struct irq_data *d)
adc8b4bf2a7f6f John Keeping   2021-12-02  473  {
adc8b4bf2a7f6f John Keeping   2021-12-02  474  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
adc8b4bf2a7f6f John Keeping   2021-12-02  475  	struct rockchip_pin_bank *bank = gc->private;
adc8b4bf2a7f6f John Keeping   2021-12-02  476  
adc8b4bf2a7f6f John Keeping   2021-12-02 @477  	return gpiochip_reqres_irq(&bank->gpio_chip, d->hwirq);
adc8b4bf2a7f6f John Keeping   2021-12-02  478  }
adc8b4bf2a7f6f John Keeping   2021-12-02  479  
adc8b4bf2a7f6f John Keeping   2021-12-02  480  static void rockchip_irq_relres(struct irq_data *d)
adc8b4bf2a7f6f John Keeping   2021-12-02  481  {
adc8b4bf2a7f6f John Keeping   2021-12-02  482  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
adc8b4bf2a7f6f John Keeping   2021-12-02  483  	struct rockchip_pin_bank *bank = gc->private;
adc8b4bf2a7f6f John Keeping   2021-12-02  484  
adc8b4bf2a7f6f John Keeping   2021-12-02 @485  	gpiochip_relres_irq(&bank->gpio_chip, d->hwirq);
adc8b4bf2a7f6f John Keeping   2021-12-02  486  }
adc8b4bf2a7f6f John Keeping   2021-12-02  487  
936ee2675eee1f Jianqun Xu     2021-08-16  488  static void rockchip_irq_suspend(struct irq_data *d)
936ee2675eee1f Jianqun Xu     2021-08-16  489  {
936ee2675eee1f Jianqun Xu     2021-08-16  490  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
936ee2675eee1f Jianqun Xu     2021-08-16  491  	struct rockchip_pin_bank *bank = gc->private;
936ee2675eee1f Jianqun Xu     2021-08-16  492  
ff96a8c21cdbf4 Jianqun Xu     2021-08-16  493  	bank->saved_masks = irq_reg_readl(gc, bank->gpio_regs->int_mask);
ff96a8c21cdbf4 Jianqun Xu     2021-08-16  494  	irq_reg_writel(gc, ~gc->wake_active, bank->gpio_regs->int_mask);
936ee2675eee1f Jianqun Xu     2021-08-16  495  }
936ee2675eee1f Jianqun Xu     2021-08-16  496  
936ee2675eee1f Jianqun Xu     2021-08-16  497  static void rockchip_irq_resume(struct irq_data *d)
936ee2675eee1f Jianqun Xu     2021-08-16  498  {
936ee2675eee1f Jianqun Xu     2021-08-16  499  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
936ee2675eee1f Jianqun Xu     2021-08-16  500  	struct rockchip_pin_bank *bank = gc->private;
936ee2675eee1f Jianqun Xu     2021-08-16  501  
ff96a8c21cdbf4 Jianqun Xu     2021-08-16  502  	irq_reg_writel(gc, bank->saved_masks, bank->gpio_regs->int_mask);
936ee2675eee1f Jianqun Xu     2021-08-16  503  }
936ee2675eee1f Jianqun Xu     2021-08-16  504  
936ee2675eee1f Jianqun Xu     2021-08-16  505  static void rockchip_irq_enable(struct irq_data *d)
936ee2675eee1f Jianqun Xu     2021-08-16  506  {
936ee2675eee1f Jianqun Xu     2021-08-16  507  	irq_gc_mask_clr_bit(d);
936ee2675eee1f Jianqun Xu     2021-08-16  508  }
936ee2675eee1f Jianqun Xu     2021-08-16  509  
936ee2675eee1f Jianqun Xu     2021-08-16  510  static void rockchip_irq_disable(struct irq_data *d)
936ee2675eee1f Jianqun Xu     2021-08-16  511  {
936ee2675eee1f Jianqun Xu     2021-08-16  512  	irq_gc_mask_set_bit(d);
936ee2675eee1f Jianqun Xu     2021-08-16  513  }
936ee2675eee1f Jianqun Xu     2021-08-16  514  
936ee2675eee1f Jianqun Xu     2021-08-16  515  static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
936ee2675eee1f Jianqun Xu     2021-08-16  516  {
936ee2675eee1f Jianqun Xu     2021-08-16  517  	unsigned int clr = IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN;
936ee2675eee1f Jianqun Xu     2021-08-16  518  	struct irq_chip_generic *gc;
936ee2675eee1f Jianqun Xu     2021-08-16  519  	int ret;
936ee2675eee1f Jianqun Xu     2021-08-16  520  
936ee2675eee1f Jianqun Xu     2021-08-16  521  	bank->domain = irq_domain_add_linear(bank->of_node, 32,
936ee2675eee1f Jianqun Xu     2021-08-16  522  					&irq_generic_chip_ops, NULL);
936ee2675eee1f Jianqun Xu     2021-08-16  523  	if (!bank->domain) {
936ee2675eee1f Jianqun Xu     2021-08-16  524  		dev_warn(bank->dev, "could not init irq domain for bank %s\n",
936ee2675eee1f Jianqun Xu     2021-08-16  525  			 bank->name);
936ee2675eee1f Jianqun Xu     2021-08-16  526  		return -EINVAL;
936ee2675eee1f Jianqun Xu     2021-08-16  527  	}
936ee2675eee1f Jianqun Xu     2021-08-16  528  
936ee2675eee1f Jianqun Xu     2021-08-16  529  	ret = irq_alloc_domain_generic_chips(bank->domain, 32, 1,
936ee2675eee1f Jianqun Xu     2021-08-16  530  					     "rockchip_gpio_irq",
936ee2675eee1f Jianqun Xu     2021-08-16  531  					     handle_level_irq,
936ee2675eee1f Jianqun Xu     2021-08-16  532  					     clr, 0, 0);
936ee2675eee1f Jianqun Xu     2021-08-16  533  	if (ret) {
936ee2675eee1f Jianqun Xu     2021-08-16  534  		dev_err(bank->dev, "could not alloc generic chips for bank %s\n",
936ee2675eee1f Jianqun Xu     2021-08-16  535  			bank->name);
936ee2675eee1f Jianqun Xu     2021-08-16  536  		irq_domain_remove(bank->domain);
936ee2675eee1f Jianqun Xu     2021-08-16  537  		return -EINVAL;
936ee2675eee1f Jianqun Xu     2021-08-16  538  	}
936ee2675eee1f Jianqun Xu     2021-08-16  539  
936ee2675eee1f Jianqun Xu     2021-08-16  540  	gc = irq_get_domain_generic_chip(bank->domain, 0);
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  541  	if (bank->gpio_type == GPIO_TYPE_V2) {
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  542  		gc->reg_writel = gpio_writel_v2;
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  543  		gc->reg_readl = gpio_readl_v2;
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  544  	}
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  545  
936ee2675eee1f Jianqun Xu     2021-08-16  546  	gc->reg_base = bank->reg_base;
936ee2675eee1f Jianqun Xu     2021-08-16  547  	gc->private = bank;
ff96a8c21cdbf4 Jianqun Xu     2021-08-16  548  	gc->chip_types[0].regs.mask = bank->gpio_regs->int_mask;
ff96a8c21cdbf4 Jianqun Xu     2021-08-16  549  	gc->chip_types[0].regs.ack = bank->gpio_regs->port_eoi;
936ee2675eee1f Jianqun Xu     2021-08-16  550  	gc->chip_types[0].chip.irq_ack = irq_gc_ack_set_bit;
936ee2675eee1f Jianqun Xu     2021-08-16  551  	gc->chip_types[0].chip.irq_mask = irq_gc_mask_set_bit;
936ee2675eee1f Jianqun Xu     2021-08-16  552  	gc->chip_types[0].chip.irq_unmask = irq_gc_mask_clr_bit;
936ee2675eee1f Jianqun Xu     2021-08-16  553  	gc->chip_types[0].chip.irq_enable = rockchip_irq_enable;
936ee2675eee1f Jianqun Xu     2021-08-16  554  	gc->chip_types[0].chip.irq_disable = rockchip_irq_disable;
936ee2675eee1f Jianqun Xu     2021-08-16  555  	gc->chip_types[0].chip.irq_set_wake = irq_gc_set_wake;
936ee2675eee1f Jianqun Xu     2021-08-16  556  	gc->chip_types[0].chip.irq_suspend = rockchip_irq_suspend;
936ee2675eee1f Jianqun Xu     2021-08-16  557  	gc->chip_types[0].chip.irq_resume = rockchip_irq_resume;
936ee2675eee1f Jianqun Xu     2021-08-16  558  	gc->chip_types[0].chip.irq_set_type = rockchip_irq_set_type;
adc8b4bf2a7f6f John Keeping   2021-12-02  559  	gc->chip_types[0].chip.irq_request_resources = rockchip_irq_reqres;
adc8b4bf2a7f6f John Keeping   2021-12-02  560  	gc->chip_types[0].chip.irq_release_resources = rockchip_irq_relres;
936ee2675eee1f Jianqun Xu     2021-08-16  561  	gc->wake_enabled = IRQ_MSK(bank->nr_pins);
936ee2675eee1f Jianqun Xu     2021-08-16  562  
936ee2675eee1f Jianqun Xu     2021-08-16  563  	/*
936ee2675eee1f Jianqun Xu     2021-08-16  564  	 * Linux assumes that all interrupts start out disabled/masked.
936ee2675eee1f Jianqun Xu     2021-08-16  565  	 * Our driver only uses the concept of masked and always keeps
936ee2675eee1f Jianqun Xu     2021-08-16  566  	 * things enabled, so for us that's all masked and all enabled.
936ee2675eee1f Jianqun Xu     2021-08-16  567  	 */
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  568  	rockchip_gpio_writel(bank, 0xffffffff, bank->gpio_regs->int_mask);
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  569  	rockchip_gpio_writel(bank, 0xffffffff, bank->gpio_regs->port_eoi);
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  570  	rockchip_gpio_writel(bank, 0xffffffff, bank->gpio_regs->int_en);
936ee2675eee1f Jianqun Xu     2021-08-16  571  	gc->mask_cache = 0xffffffff;
936ee2675eee1f Jianqun Xu     2021-08-16  572  
936ee2675eee1f Jianqun Xu     2021-08-16  573  	irq_set_chained_handler_and_data(bank->irq,
936ee2675eee1f Jianqun Xu     2021-08-16  574  					 rockchip_irq_demux, bank);
936ee2675eee1f Jianqun Xu     2021-08-16  575  
936ee2675eee1f Jianqun Xu     2021-08-16  576  	return 0;
936ee2675eee1f Jianqun Xu     2021-08-16  577  }
936ee2675eee1f Jianqun Xu     2021-08-16  578  
936ee2675eee1f Jianqun Xu     2021-08-16  579  static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
936ee2675eee1f Jianqun Xu     2021-08-16  580  {
936ee2675eee1f Jianqun Xu     2021-08-16  581  	struct gpio_chip *gc;
936ee2675eee1f Jianqun Xu     2021-08-16  582  	int ret;
936ee2675eee1f Jianqun Xu     2021-08-16  583  
936ee2675eee1f Jianqun Xu     2021-08-16 @584  	bank->gpio_chip = rockchip_gpiolib_chip;
936ee2675eee1f Jianqun Xu     2021-08-16  585  
936ee2675eee1f Jianqun Xu     2021-08-16 @586  	gc = &bank->gpio_chip;
936ee2675eee1f Jianqun Xu     2021-08-16  587  	gc->base = bank->pin_base;
936ee2675eee1f Jianqun Xu     2021-08-16  588  	gc->ngpio = bank->nr_pins;
936ee2675eee1f Jianqun Xu     2021-08-16  589  	gc->label = bank->name;
936ee2675eee1f Jianqun Xu     2021-08-16  590  	gc->parent = bank->dev;
936ee2675eee1f Jianqun Xu     2021-08-16  591  
936ee2675eee1f Jianqun Xu     2021-08-16  592  	ret = gpiochip_add_data(gc, bank);
936ee2675eee1f Jianqun Xu     2021-08-16  593  	if (ret) {
936ee2675eee1f Jianqun Xu     2021-08-16  594  		dev_err(bank->dev, "failed to add gpiochip %s, %d\n",
936ee2675eee1f Jianqun Xu     2021-08-16  595  			gc->label, ret);
936ee2675eee1f Jianqun Xu     2021-08-16  596  		return ret;
936ee2675eee1f Jianqun Xu     2021-08-16  597  	}
936ee2675eee1f Jianqun Xu     2021-08-16  598  
936ee2675eee1f Jianqun Xu     2021-08-16  599  	/*
936ee2675eee1f Jianqun Xu     2021-08-16  600  	 * For DeviceTree-supported systems, the gpio core checks the
936ee2675eee1f Jianqun Xu     2021-08-16  601  	 * pinctrl's device node for the "gpio-ranges" property.
936ee2675eee1f Jianqun Xu     2021-08-16  602  	 * If it is present, it takes care of adding the pin ranges
936ee2675eee1f Jianqun Xu     2021-08-16  603  	 * for the driver. In this case the driver can skip ahead.
936ee2675eee1f Jianqun Xu     2021-08-16  604  	 *
936ee2675eee1f Jianqun Xu     2021-08-16  605  	 * In order to remain compatible with older, existing DeviceTree
936ee2675eee1f Jianqun Xu     2021-08-16  606  	 * files which don't set the "gpio-ranges" property or systems that
936ee2675eee1f Jianqun Xu     2021-08-16  607  	 * utilize ACPI the driver has to call gpiochip_add_pin_range().
936ee2675eee1f Jianqun Xu     2021-08-16  608  	 */
936ee2675eee1f Jianqun Xu     2021-08-16  609  	if (!of_property_read_bool(bank->of_node, "gpio-ranges")) {
936ee2675eee1f Jianqun Xu     2021-08-16  610  		struct device_node *pctlnp = of_get_parent(bank->of_node);
936ee2675eee1f Jianqun Xu     2021-08-16  611  		struct pinctrl_dev *pctldev = NULL;
936ee2675eee1f Jianqun Xu     2021-08-16  612  
936ee2675eee1f Jianqun Xu     2021-08-16  613  		if (!pctlnp)
936ee2675eee1f Jianqun Xu     2021-08-16  614  			return -ENODATA;
936ee2675eee1f Jianqun Xu     2021-08-16  615  
936ee2675eee1f Jianqun Xu     2021-08-16  616  		pctldev = of_pinctrl_get(pctlnp);
936ee2675eee1f Jianqun Xu     2021-08-16  617  		if (!pctldev)
936ee2675eee1f Jianqun Xu     2021-08-16  618  			return -ENODEV;
936ee2675eee1f Jianqun Xu     2021-08-16  619  
936ee2675eee1f Jianqun Xu     2021-08-16  620  		ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
936ee2675eee1f Jianqun Xu     2021-08-16  621  					     gc->base, gc->ngpio);
936ee2675eee1f Jianqun Xu     2021-08-16  622  		if (ret) {
936ee2675eee1f Jianqun Xu     2021-08-16  623  			dev_err(bank->dev, "Failed to add pin range\n");
936ee2675eee1f Jianqun Xu     2021-08-16  624  			goto fail;
936ee2675eee1f Jianqun Xu     2021-08-16  625  		}
936ee2675eee1f Jianqun Xu     2021-08-16  626  	}
936ee2675eee1f Jianqun Xu     2021-08-16  627  
936ee2675eee1f Jianqun Xu     2021-08-16  628  	ret = rockchip_interrupts_register(bank);
936ee2675eee1f Jianqun Xu     2021-08-16  629  	if (ret) {
936ee2675eee1f Jianqun Xu     2021-08-16  630  		dev_err(bank->dev, "failed to register interrupt, %d\n", ret);
936ee2675eee1f Jianqun Xu     2021-08-16  631  		goto fail;
936ee2675eee1f Jianqun Xu     2021-08-16  632  	}
936ee2675eee1f Jianqun Xu     2021-08-16  633  
936ee2675eee1f Jianqun Xu     2021-08-16  634  	return 0;
936ee2675eee1f Jianqun Xu     2021-08-16  635  
936ee2675eee1f Jianqun Xu     2021-08-16  636  fail:
936ee2675eee1f Jianqun Xu     2021-08-16 @637  	gpiochip_remove(&bank->gpio_chip);
936ee2675eee1f Jianqun Xu     2021-08-16  638  
936ee2675eee1f Jianqun Xu     2021-08-16  639  	return ret;
936ee2675eee1f Jianqun Xu     2021-08-16  640  }
936ee2675eee1f Jianqun Xu     2021-08-16  641  
936ee2675eee1f Jianqun Xu     2021-08-16  642  static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
936ee2675eee1f Jianqun Xu     2021-08-16  643  {
936ee2675eee1f Jianqun Xu     2021-08-16  644  	struct resource res;
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  645  	int id = 0;
936ee2675eee1f Jianqun Xu     2021-08-16  646  
936ee2675eee1f Jianqun Xu     2021-08-16  647  	if (of_address_to_resource(bank->of_node, 0, &res)) {
936ee2675eee1f Jianqun Xu     2021-08-16  648  		dev_err(bank->dev, "cannot find IO resource for bank\n");
936ee2675eee1f Jianqun Xu     2021-08-16  649  		return -ENOENT;
936ee2675eee1f Jianqun Xu     2021-08-16  650  	}
936ee2675eee1f Jianqun Xu     2021-08-16  651  
936ee2675eee1f Jianqun Xu     2021-08-16  652  	bank->reg_base = devm_ioremap_resource(bank->dev, &res);
936ee2675eee1f Jianqun Xu     2021-08-16  653  	if (IS_ERR(bank->reg_base))
936ee2675eee1f Jianqun Xu     2021-08-16  654  		return PTR_ERR(bank->reg_base);
936ee2675eee1f Jianqun Xu     2021-08-16  655  
936ee2675eee1f Jianqun Xu     2021-08-16  656  	bank->irq = irq_of_parse_and_map(bank->of_node, 0);
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  657  	if (!bank->irq)
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  658  		return -EINVAL;
936ee2675eee1f Jianqun Xu     2021-08-16  659  
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  660  	bank->clk = of_clk_get(bank->of_node, 0);
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  661  	if (IS_ERR(bank->clk))
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  662  		return PTR_ERR(bank->clk);
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  663  
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  664  	clk_prepare_enable(bank->clk);
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  665  	id = readl(bank->reg_base + gpio_regs_v2.version_id);
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  666  
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  667  	/* If not gpio v2, that is default to v1. */
cc165ba48aaf7d Jianqun Xu     2022-06-23  668  	if (id == GPIO_TYPE_V2 || id == GPIO_TYPE_V2_1) {
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  669  		bank->gpio_regs = &gpio_regs_v2;
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  670  		bank->gpio_type = GPIO_TYPE_V2;
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  671  		bank->db_clk = of_clk_get(bank->of_node, 1);
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  672  		if (IS_ERR(bank->db_clk)) {
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  673  			dev_err(bank->dev, "cannot find debounce clk\n");
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  674  			clk_disable_unprepare(bank->clk);
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  675  			return -EINVAL;
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  676  		}
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  677  	} else {
ff96a8c21cdbf4 Jianqun Xu     2021-08-16  678  		bank->gpio_regs = &gpio_regs_v1;
ff96a8c21cdbf4 Jianqun Xu     2021-08-16  679  		bank->gpio_type = GPIO_TYPE_V1;
3bcbd1a85b68e5 Jianqun Xu     2021-08-16  680  	}
ff96a8c21cdbf4 Jianqun Xu     2021-08-16  681  
936ee2675eee1f Jianqun Xu     2021-08-16  682  	return 0;
936ee2675eee1f Jianqun Xu     2021-08-16  683  }
936ee2675eee1f Jianqun Xu     2021-08-16  684  
936ee2675eee1f Jianqun Xu     2021-08-16  685  static struct rockchip_pin_bank *
936ee2675eee1f Jianqun Xu     2021-08-16  686  rockchip_gpio_find_bank(struct pinctrl_dev *pctldev, int id)
936ee2675eee1f Jianqun Xu     2021-08-16  687  {
936ee2675eee1f Jianqun Xu     2021-08-16  688  	struct rockchip_pinctrl *info;
936ee2675eee1f Jianqun Xu     2021-08-16  689  	struct rockchip_pin_bank *bank;
936ee2675eee1f Jianqun Xu     2021-08-16  690  	int i, found = 0;
936ee2675eee1f Jianqun Xu     2021-08-16  691  
936ee2675eee1f Jianqun Xu     2021-08-16  692  	info = pinctrl_dev_get_drvdata(pctldev);
936ee2675eee1f Jianqun Xu     2021-08-16  693  	bank = info->ctrl->pin_banks;
936ee2675eee1f Jianqun Xu     2021-08-16  694  	for (i = 0; i < info->ctrl->nr_banks; i++, bank++) {
936ee2675eee1f Jianqun Xu     2021-08-16  695  		if (bank->bank_num == id) {
936ee2675eee1f Jianqun Xu     2021-08-16  696  			found = 1;
936ee2675eee1f Jianqun Xu     2021-08-16  697  			break;
936ee2675eee1f Jianqun Xu     2021-08-16  698  		}
936ee2675eee1f Jianqun Xu     2021-08-16  699  	}
936ee2675eee1f Jianqun Xu     2021-08-16  700  
936ee2675eee1f Jianqun Xu     2021-08-16  701  	return found ? bank : NULL;
936ee2675eee1f Jianqun Xu     2021-08-16  702  }
936ee2675eee1f Jianqun Xu     2021-08-16  703  
936ee2675eee1f Jianqun Xu     2021-08-16  704  static int rockchip_gpio_probe(struct platform_device *pdev)
936ee2675eee1f Jianqun Xu     2021-08-16  705  {
936ee2675eee1f Jianqun Xu     2021-08-16  706  	struct device *dev = &pdev->dev;
936ee2675eee1f Jianqun Xu     2021-08-16  707  	struct device_node *np = dev->of_node;
936ee2675eee1f Jianqun Xu     2021-08-16  708  	struct device_node *pctlnp = of_get_parent(np);
936ee2675eee1f Jianqun Xu     2021-08-16  709  	struct pinctrl_dev *pctldev = NULL;
936ee2675eee1f Jianqun Xu     2021-08-16  710  	struct rockchip_pin_bank *bank = NULL;
8ce5ef64546850 Caleb Connolly 2022-03-28  711  	struct rockchip_pin_deferred *cfg;
936ee2675eee1f Jianqun Xu     2021-08-16  712  	static int gpio;
936ee2675eee1f Jianqun Xu     2021-08-16  713  	int id, ret;
936ee2675eee1f Jianqun Xu     2021-08-16  714  
936ee2675eee1f Jianqun Xu     2021-08-16  715  	if (!np || !pctlnp)
936ee2675eee1f Jianqun Xu     2021-08-16  716  		return -ENODEV;
936ee2675eee1f Jianqun Xu     2021-08-16  717  
936ee2675eee1f Jianqun Xu     2021-08-16  718  	pctldev = of_pinctrl_get(pctlnp);
936ee2675eee1f Jianqun Xu     2021-08-16  719  	if (!pctldev)
936ee2675eee1f Jianqun Xu     2021-08-16  720  		return -EPROBE_DEFER;
936ee2675eee1f Jianqun Xu     2021-08-16  721  
936ee2675eee1f Jianqun Xu     2021-08-16  722  	id = of_alias_get_id(np, "gpio");
936ee2675eee1f Jianqun Xu     2021-08-16  723  	if (id < 0)
936ee2675eee1f Jianqun Xu     2021-08-16  724  		id = gpio++;
936ee2675eee1f Jianqun Xu     2021-08-16  725  
936ee2675eee1f Jianqun Xu     2021-08-16  726  	bank = rockchip_gpio_find_bank(pctldev, id);
936ee2675eee1f Jianqun Xu     2021-08-16  727  	if (!bank)
936ee2675eee1f Jianqun Xu     2021-08-16  728  		return -EINVAL;
936ee2675eee1f Jianqun Xu     2021-08-16  729  
936ee2675eee1f Jianqun Xu     2021-08-16  730  	bank->dev = dev;
936ee2675eee1f Jianqun Xu     2021-08-16  731  	bank->of_node = np;
936ee2675eee1f Jianqun Xu     2021-08-16  732  
936ee2675eee1f Jianqun Xu     2021-08-16  733  	raw_spin_lock_init(&bank->slock);
936ee2675eee1f Jianqun Xu     2021-08-16  734  
936ee2675eee1f Jianqun Xu     2021-08-16  735  	ret = rockchip_get_bank_data(bank);
936ee2675eee1f Jianqun Xu     2021-08-16  736  	if (ret)
936ee2675eee1f Jianqun Xu     2021-08-16  737  		return ret;
936ee2675eee1f Jianqun Xu     2021-08-16  738  
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  739  	/*
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  740  	 * Prevent clashes with a deferred output setting
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  741  	 * being added right at this moment.
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  742  	 */
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  743  	mutex_lock(&bank->deferred_lock);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  744  
936ee2675eee1f Jianqun Xu     2021-08-16  745  	ret = rockchip_gpiolib_register(bank);
936ee2675eee1f Jianqun Xu     2021-08-16  746  	if (ret) {
936ee2675eee1f Jianqun Xu     2021-08-16  747  		clk_disable_unprepare(bank->clk);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  748  		mutex_unlock(&bank->deferred_lock);
936ee2675eee1f Jianqun Xu     2021-08-16  749  		return ret;
936ee2675eee1f Jianqun Xu     2021-08-16  750  	}
936ee2675eee1f Jianqun Xu     2021-08-16  751  
8ce5ef64546850 Caleb Connolly 2022-03-28  752  	while (!list_empty(&bank->deferred_pins)) {
8ce5ef64546850 Caleb Connolly 2022-03-28  753  		cfg = list_first_entry(&bank->deferred_pins,
8ce5ef64546850 Caleb Connolly 2022-03-28  754  				       struct rockchip_pin_deferred, head);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  755  		list_del(&cfg->head);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  756  
8ce5ef64546850 Caleb Connolly 2022-03-28  757  		switch (cfg->param) {
8ce5ef64546850 Caleb Connolly 2022-03-28  758  		case PIN_CONFIG_OUTPUT:
59dd178e1d7cb6 Heiko Stuebner 2021-09-14 @759  			ret = rockchip_gpio_direction_output(&bank->gpio_chip, cfg->pin, cfg->arg);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  760  			if (ret)
8ce5ef64546850 Caleb Connolly 2022-03-28  761  				dev_warn(dev, "setting output pin %u to %u failed\n", cfg->pin,
8ce5ef64546850 Caleb Connolly 2022-03-28  762  					 cfg->arg);
8ce5ef64546850 Caleb Connolly 2022-03-28  763  			break;
7ff11357810fd1 Caleb Connolly 2022-03-28  764  		case PIN_CONFIG_INPUT_ENABLE:
7ff11357810fd1 Caleb Connolly 2022-03-28 @765  			ret = rockchip_gpio_direction_input(&bank->gpio_chip, cfg->pin);
7ff11357810fd1 Caleb Connolly 2022-03-28  766  			if (ret)
7ff11357810fd1 Caleb Connolly 2022-03-28  767  				dev_warn(dev, "setting input pin %u failed\n", cfg->pin);
7ff11357810fd1 Caleb Connolly 2022-03-28  768  			break;
8ce5ef64546850 Caleb Connolly 2022-03-28  769  		default:
8ce5ef64546850 Caleb Connolly 2022-03-28  770  			dev_warn(dev, "unknown deferred config param %d\n", cfg->param);
8ce5ef64546850 Caleb Connolly 2022-03-28  771  			break;
8ce5ef64546850 Caleb Connolly 2022-03-28  772  		}
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  773  		kfree(cfg);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  774  	}
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  775  
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  776  	mutex_unlock(&bank->deferred_lock);
59dd178e1d7cb6 Heiko Stuebner 2021-09-14  777  
936ee2675eee1f Jianqun Xu     2021-08-16  778  	platform_set_drvdata(pdev, bank);
936ee2675eee1f Jianqun Xu     2021-08-16  779  	dev_info(dev, "probed %pOF\n", np);
936ee2675eee1f Jianqun Xu     2021-08-16  780  
936ee2675eee1f Jianqun Xu     2021-08-16  781  	return 0;
936ee2675eee1f Jianqun Xu     2021-08-16  782  }
936ee2675eee1f Jianqun Xu     2021-08-16  783  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
