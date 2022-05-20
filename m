Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6055A52E31A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 May 2022 05:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345093AbiETD3A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 May 2022 23:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344901AbiETD26 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 May 2022 23:28:58 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C79031269B3
        for <linux-gpio@vger.kernel.org>; Thu, 19 May 2022 20:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653017336; x=1684553336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bwtmELOb6mYHFvOqw/JuCovmhmbf6QCAoAqaOXD1uJo=;
  b=StYNa80MqT+ZABymAEFHHD80LkzJznvgiJZLb2wonpMiXkk6rOoEd2iM
   qidQmmgeCFYnsEhHaUhJS/lgiMgu2jOT4bEWvn2Hzl/Hl8UPnYuR3Rl3b
   +S0YJzl4flV9ylTdkQ8sIR13zPfuDKFRL/rrrdBhZzL6Fc8rwDCDat782
   n6KYOBUqlSOCbt5t9fk7hg5Ybq7xqefgWqUY9cPnv7EhaUySp/cRET8Vn
   k0bOBcvtKfmKWV51ZQXNITo8hsU3KFJ2Qp31uEAJJMJ+0QPjkuqKkL5nd
   9YlNJsV8H2N4Sw5f172K3t48jcuFI0D7RnYyGy7XycM/Bc8m4kwGsi4u5
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="272598472"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="272598472"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2022 20:28:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="674411271"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 19 May 2022 20:28:53 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nrtJt-0004Eh-3v;
        Fri, 20 May 2022 03:28:53 +0000
Date:   Fri, 20 May 2022 11:28:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] gpio: sifive: Make the irqchip immutable
Message-ID: <202205201122.xuM6bWUt-lkp@intel.com>
References: <73c75a67d1c87b049d633057c0e765e708ee02a2.1652884788.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73c75a67d1c87b049d633057c0e765e708ee02a2.1652884788.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on linusw-gpio/for-next v5.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/gpio-sifive-Make-the-irqchip-immutable/20220518-224530
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 210e04ff768142b96452030c4c2627512b30ad95
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220520/202205201122.xuM6bWUt-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/3db66356e9f7309998a9172feeb84d8b226ad539
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Geert-Uytterhoeven/gpio-sifive-Make-the-irqchip-immutable/20220518-224530
        git checkout 3db66356e9f7309998a9172feeb84d8b226ad539
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-sifive.c:151:27: error: 'IRQCHIP_IMMUTABLE' undeclared here (not in a function); did you mean 'IS_IMMUTABLE'?
     151 |         .flags          = IRQCHIP_IMMUTABLE,
         |                           ^~~~~~~~~~~~~~~~~
         |                           IS_IMMUTABLE
>> drivers/gpio/gpio-sifive.c:152:9: error: 'GPIOCHIP_IRQ_RESOURCE_HELPERS' undeclared here (not in a function)
     152 |         GPIOCHIP_IRQ_RESOURCE_HELPERS,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-sifive.c:152:9: warning: excess elements in struct initializer
   drivers/gpio/gpio-sifive.c:152:9: note: (near initialization for 'sifive_gpio_irqchip')
   drivers/gpio/gpio-sifive.c: In function 'sifive_gpio_probe':
>> drivers/gpio/gpio-sifive.c:249:9: error: implicit declaration of function 'gpio_irq_chip_set_chip' [-Werror=implicit-function-declaration]
     249 |         gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +151 drivers/gpio/gpio-sifive.c

   141	
   142	static const struct irq_chip sifive_gpio_irqchip = {
   143		.name		= "sifive-gpio",
   144		.irq_set_type	= sifive_gpio_irq_set_type,
   145		.irq_mask	= irq_chip_mask_parent,
   146		.irq_unmask	= irq_chip_unmask_parent,
   147		.irq_enable	= sifive_gpio_irq_enable,
   148		.irq_disable	= sifive_gpio_irq_disable,
   149		.irq_eoi	= sifive_gpio_irq_eoi,
   150		.irq_set_affinity = sifive_gpio_irq_set_affinity,
 > 151		.flags		= IRQCHIP_IMMUTABLE,
 > 152		GPIOCHIP_IRQ_RESOURCE_HELPERS,
   153	};
   154	
   155	static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
   156						     unsigned int child,
   157						     unsigned int child_type,
   158						     unsigned int *parent,
   159						     unsigned int *parent_type)
   160	{
   161		struct sifive_gpio *chip = gpiochip_get_data(gc);
   162		struct irq_data *d = irq_get_irq_data(chip->irq_number[child]);
   163	
   164		*parent_type = IRQ_TYPE_NONE;
   165		*parent = irqd_to_hwirq(d);
   166	
   167		return 0;
   168	}
   169	
   170	static const struct regmap_config sifive_gpio_regmap_config = {
   171		.reg_bits = 32,
   172		.reg_stride = 4,
   173		.val_bits = 32,
   174		.fast_io = true,
   175		.disable_locking = true,
   176	};
   177	
   178	static int sifive_gpio_probe(struct platform_device *pdev)
   179	{
   180		struct device *dev = &pdev->dev;
   181		struct device_node *node = pdev->dev.of_node;
   182		struct device_node *irq_parent;
   183		struct irq_domain *parent;
   184		struct gpio_irq_chip *girq;
   185		struct sifive_gpio *chip;
   186		int ret, ngpio, i;
   187	
   188		chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
   189		if (!chip)
   190			return -ENOMEM;
   191	
   192		chip->base = devm_platform_ioremap_resource(pdev, 0);
   193		if (IS_ERR(chip->base)) {
   194			dev_err(dev, "failed to allocate device memory\n");
   195			return PTR_ERR(chip->base);
   196		}
   197	
   198		chip->regs = devm_regmap_init_mmio(dev, chip->base,
   199						   &sifive_gpio_regmap_config);
   200		if (IS_ERR(chip->regs))
   201			return PTR_ERR(chip->regs);
   202	
   203		ngpio = of_irq_count(node);
   204		if (ngpio > SIFIVE_GPIO_MAX) {
   205			dev_err(dev, "Too many GPIO interrupts (max=%d)\n",
   206				SIFIVE_GPIO_MAX);
   207			return -ENXIO;
   208		}
   209	
   210		irq_parent = of_irq_find_parent(node);
   211		if (!irq_parent) {
   212			dev_err(dev, "no IRQ parent node\n");
   213			return -ENODEV;
   214		}
   215		parent = irq_find_host(irq_parent);
   216		if (!parent) {
   217			dev_err(dev, "no IRQ parent domain\n");
   218			return -ENODEV;
   219		}
   220	
   221		for (i = 0; i < ngpio; i++)
   222			chip->irq_number[i] = platform_get_irq(pdev, i);
   223	
   224		ret = bgpio_init(&chip->gc, dev, 4,
   225				 chip->base + SIFIVE_GPIO_INPUT_VAL,
   226				 chip->base + SIFIVE_GPIO_OUTPUT_VAL,
   227				 NULL,
   228				 chip->base + SIFIVE_GPIO_OUTPUT_EN,
   229				 chip->base + SIFIVE_GPIO_INPUT_EN,
   230				 BGPIOF_READ_OUTPUT_REG_SET);
   231		if (ret) {
   232			dev_err(dev, "unable to init generic GPIO\n");
   233			return ret;
   234		}
   235	
   236		/* Disable all GPIO interrupts before enabling parent interrupts */
   237		regmap_write(chip->regs, SIFIVE_GPIO_RISE_IE, 0);
   238		regmap_write(chip->regs, SIFIVE_GPIO_FALL_IE, 0);
   239		regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IE, 0);
   240		regmap_write(chip->regs, SIFIVE_GPIO_LOW_IE, 0);
   241		chip->irq_state = 0;
   242	
   243		chip->gc.base = -1;
   244		chip->gc.ngpio = ngpio;
   245		chip->gc.label = dev_name(dev);
   246		chip->gc.parent = dev;
   247		chip->gc.owner = THIS_MODULE;
   248		girq = &chip->gc.irq;
 > 249		gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
   250		girq->fwnode = of_node_to_fwnode(node);
   251		girq->parent_domain = parent;
   252		girq->child_to_parent_hwirq = sifive_gpio_child_to_parent_hwirq;
   253		girq->handler = handle_bad_irq;
   254		girq->default_type = IRQ_TYPE_NONE;
   255	
   256		platform_set_drvdata(pdev, chip);
   257		return gpiochip_add_data(&chip->gc, chip);
   258	}
   259	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
