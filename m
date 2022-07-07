Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1073A569974
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jul 2022 06:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235010AbiGGEtX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jul 2022 00:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235071AbiGGEtB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jul 2022 00:49:01 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D6A31230
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jul 2022 21:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657169246; x=1688705246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KPHeN1M2tikU2dR02upVUOR2LHepqS/qsCyrD3NSLx0=;
  b=Jgvw1T0FKDvYenW58kfNSkUL7CGyOnyVX1Q2kdhCcLGjPwPqvezrKHZG
   7PAF+oEj0+4JKnI9IZgc7QZakZhS/arapHE7Cb8sMuRN8u0ucQSDnKcf/
   F5e1qKN3vklD6x2AX05nxTwphBOUxqYCHttq5a38mvCdxqZ5kZ3vSaUwb
   hRpxqO2+6ryIj+ieOEkXIP7B4ud1wsLnV2DCagf5/a/4D4I0EtviF5zZC
   JbptRG40daAfl1Dqh4myem3dxC8dZaaTWddgG2SDdYXVH3O99nPM/paHB
   7q7+QHHUHrsYmkBD/PhQftOfbKwB4I0K/bFnXZ0AzIuq0eKu86y+PfThc
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="285053657"
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; 
   d="scan'208";a="285053657"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 21:47:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; 
   d="scan'208";a="568356991"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Jul 2022 21:47:23 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o9JQA-000LYg-Hb;
        Thu, 07 Jul 2022 04:47:22 +0000
Date:   Thu, 7 Jul 2022 12:46:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     lewis.hanly@microchip.com, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@dabbelt.com, maz@kernel.org
Cc:     kbuild-all@lists.01.org, paul.walmsley@sifive.com,
        conor.dooley@microchip.com, daire.mcnamara@microchip.com,
        lewis.hanly@microchip.com
Subject: Re: [PATCH 1/1] gpio: mpfs - add polarfire soc gpio support
Message-ID: <202207071219.0Jw0owWG-lkp@intel.com>
References: <20220705134912.2740421-2-lewis.hanly@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220705134912.2740421-2-lewis.hanly@microchip.com>
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

I love your patch! Yet something to improve:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v5.19-rc5 next-20220706]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/lewis-hanly-microchip-com/Add-Polarfire-SoC-GPIO-support/20220705-220421
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220707/202207071219.0Jw0owWG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/f1c1cf42734c00cf02babb6220f8b68a62e86d0e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review lewis-hanly-microchip-com/Add-Polarfire-SoC-GPIO-support/20220705-220421
        git checkout f1c1cf42734c00cf02babb6220f8b68a62e86d0e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-mpfs.c: In function 'mpfs_gpio_probe':
>> drivers/gpio/gpio-mpfs.c:290:20: error: 'struct irq_chip' has no member named 'parent_device'
     290 |         irq_c->chip->parent_device = dev;
         |                    ^~
>> drivers/gpio/gpio-mpfs.c:310:23: error: implicit declaration of function 'devm_request_irq'; did you mean 'can_request_irq'? [-Werror=implicit-function-declaration]
     310 |                 ret = devm_request_irq(&pdev->dev, irq,
         |                       ^~~~~~~~~~~~~~~~
         |                       can_request_irq
>> drivers/gpio/gpio-mpfs.c:312:40: error: 'IRQF_SHARED' undeclared (first use in this function)
     312 |                                        IRQF_SHARED, mpfs_gpio->gc.label, mpfs_gpio);
         |                                        ^~~~~~~~~~~
   drivers/gpio/gpio-mpfs.c:312:40: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +290 drivers/gpio/gpio-mpfs.c

   240	
   241	static int mpfs_gpio_probe(struct platform_device *pdev)
   242	{
   243		struct clk *clk;
   244		struct device *dev = &pdev->dev;
   245		struct device_node *node = pdev->dev.of_node;
   246		struct mpfs_gpio_chip *mpfs_gpio;
   247		int i, ret, ngpio;
   248		struct gpio_irq_chip *irq_c;
   249	
   250		mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
   251		if (!mpfs_gpio)
   252			return -ENOMEM;
   253	
   254		mpfs_gpio->base = devm_platform_ioremap_resource(pdev, 0);
   255		if (IS_ERR(mpfs_gpio->base)) {
   256			dev_err(dev, "failed to allocate device memory\n");
   257			return PTR_ERR(mpfs_gpio->base);
   258		}
   259		clk = devm_clk_get(&pdev->dev, NULL);
   260		if (IS_ERR(clk))
   261			return dev_err_probe(&pdev->dev, PTR_ERR(clk), "failed to get clock\n");
   262	
   263		ret = clk_prepare_enable(clk);
   264		if (ret)
   265			return dev_err_probe(&pdev->dev, ret, "failed to enable clock\n");
   266	
   267		mpfs_gpio->clk = clk;
   268	
   269		spin_lock_init(&mpfs_gpio->lock);
   270	
   271		ngpio = of_irq_count(node);
   272		if (ngpio > NUM_GPIO) {
   273			dev_err(dev, "too many interrupts\n");
   274			goto cleanup_clock;
   275		}
   276	
   277		mpfs_gpio->gc.direction_input = mpfs_gpio_direction_input;
   278		mpfs_gpio->gc.direction_output = mpfs_gpio_direction_output;
   279		mpfs_gpio->gc.get_direction = mpfs_gpio_get_direction;
   280		mpfs_gpio->gc.get = mpfs_gpio_get;
   281		mpfs_gpio->gc.set = mpfs_gpio_set;
   282		mpfs_gpio->gc.base = -1;
   283		mpfs_gpio->gc.ngpio = ngpio;
   284		mpfs_gpio->gc.label = dev_name(dev);
   285		mpfs_gpio->gc.parent = dev;
   286		mpfs_gpio->gc.owner = THIS_MODULE;
   287	
   288		irq_c = &mpfs_gpio->gc.irq;
   289		irq_c->chip = &mpfs_gpio_irqchip;
 > 290		irq_c->chip->parent_device = dev;
   291		irq_c->handler = handle_simple_irq;
   292	
   293		ret = devm_irq_alloc_descs(&pdev->dev, -1, 0, ngpio, 0);
   294		if (ret < 0) {
   295			dev_err(dev, "failed to allocate descs\n");
   296			goto cleanup_clock;
   297		}
   298	
   299		/*
   300		 * Setup the interrupt handlers. Interrupts can be
   301		 * direct and/or non-direct mode, based on register value:
   302		 * GPIO_INTERRUPT_FAB_CR.
   303		 */
   304		for (i = 0; i < ngpio; i++) {
   305			int irq = platform_get_irq_optional(pdev, i);
   306	
   307			if (irq < 0)
   308				continue;
   309	
 > 310			ret = devm_request_irq(&pdev->dev, irq,
   311					       mpfs_gpio_irq_handler,
 > 312					       IRQF_SHARED, mpfs_gpio->gc.label, mpfs_gpio);
   313			if (ret) {
   314				dev_err(&pdev->dev, "failed to request irq %d: %d\n",
   315					irq, ret);
   316				goto cleanup_clock;
   317			}
   318		}
   319	
   320		ret = gpiochip_add_data(&mpfs_gpio->gc, mpfs_gpio);
   321		if (ret)
   322			goto cleanup_clock;
   323	
   324		platform_set_drvdata(pdev, mpfs_gpio);
   325		dev_info(dev, "Microchip MPFS GPIO registered %d GPIOs\n", ngpio);
   326	
   327		return 0;
   328	
   329	cleanup_clock:
   330		clk_disable_unprepare(mpfs_gpio->clk);
   331		return ret;
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
