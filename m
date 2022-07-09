Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF1C56C68B
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Jul 2022 06:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbiGIEL2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Jul 2022 00:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiGIEL1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Jul 2022 00:11:27 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D3B67AB32;
        Fri,  8 Jul 2022 21:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657339885; x=1688875885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dImL4G2o7pTQGqvQRAZ/53V7JkwZUADnQxGIvBEKs5U=;
  b=HpmwqBleJEj+sFuDvRC6BtwHaFFF6VeLKtt+qFZwlaD45gzbVPBIpBQv
   kw2RP8sZEIu8gFyfQMxHa2wmppwN6225+p79CA2xihowLICzN/vObmejn
   dnBpXvsFedE+WwR9fSEaLCzIw2kYWAPLyMtcspbcO4Yeny6HhuL++7Sf8
   3A/wHnV8ikEgXcfldu53jZ8e/l8CowQwtmASGZcJUCQbW88jMEeVxn63G
   GrB2nxjG7YOKMxEvXB+tPSkWyInhTWVZko6Xir6DZqHYqzwYhBqTT5eD8
   zKp1J9+jpGuFgOHFFXP4nU5b3BJiWXmS9v+lMZjRcIvtgPcVNsdvItod8
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="281958563"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="281958563"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 21:11:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="683857081"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Jul 2022 21:11:22 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oA1oP-000OHc-Eb;
        Sat, 09 Jul 2022 04:11:21 +0000
Date:   Sat, 9 Jul 2022 12:10:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-input@vger.kernel.org
Cc:     kbuild-all@lists.01.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/10] input: keyboard: adp5588-keys: support gpi key
 events as 'gpio keys'
Message-ID: <202207091223.nBzeL6dk-lkp@intel.com>
References: <20220708093448.42617-2-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708093448.42617-2-nuno.sa@analog.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi "Nuno,

I love your patch! Yet something to improve:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on next-20220708]
[cannot apply to brgl/gpio/for-next hid/for-next linus/master v5.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-S/adp5588-keys-refactor-and-fw-properties-support/20220708-173730
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20220709/202207091223.nBzeL6dk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/64267ff775fd4b945fb916a10187be1c15faa165
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nuno-S/adp5588-keys-refactor-and-fw-properties-support/20220708-173730
        git checkout 64267ff775fd4b945fb916a10187be1c15faa165
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/input/keyboard/adp5588-keys.c: In function 'adp5588_gpio_add':
>> drivers/input/keyboard/adp5588-keys.c:263:18: error: 'struct gpio_chip' has no member named 'of_node'; did you mean 'fwnode'?
     263 |         kpad->gc.of_node = kpad->client->dev.of_node;
         |                  ^~~~~~~
         |                  fwnode


vim +263 drivers/input/keyboard/adp5588-keys.c

   243	
   244	static int adp5588_gpio_add(struct adp5588_kpad *kpad)
   245	{
   246		struct irq_chip *irq_chip = &kpad->irq_chip;
   247		struct device *dev = &kpad->client->dev;
   248		const struct adp5588_kpad_platform_data *pdata = dev_get_platdata(dev);
   249		const struct adp5588_gpio_platform_data *gpio_data = pdata->gpio_data;
   250		struct gpio_irq_chip *girq;
   251		int i, error;
   252	
   253		if (!gpio_data)
   254			return 0;
   255	
   256		kpad->gc.ngpio = adp5588_build_gpiomap(kpad, pdata);
   257		if (kpad->gc.ngpio == 0) {
   258			dev_info(dev, "No unused gpios left to export\n");
   259			return 0;
   260		}
   261	
   262		kpad->gc.parent = &kpad->client->dev;
 > 263		kpad->gc.of_node = kpad->client->dev.of_node;
   264		kpad->gc.direction_input = adp5588_gpio_direction_input;
   265		kpad->gc.direction_output = adp5588_gpio_direction_output;
   266		kpad->gc.get = adp5588_gpio_get_value;
   267		kpad->gc.set = adp5588_gpio_set_value;
   268		kpad->gc.can_sleep = 1;
   269	
   270		kpad->gc.base = gpio_data->gpio_start;
   271		kpad->gc.label = kpad->client->name;
   272		kpad->gc.owner = THIS_MODULE;
   273		kpad->gc.names = gpio_data->names;
   274	
   275		irq_chip->name = "adp5588";
   276		irq_chip->irq_mask = adp5588_irq_mask;
   277		irq_chip->irq_unmask = adp5588_irq_unmask;
   278		irq_chip->irq_bus_lock = adp5588_irq_bus_lock;
   279		irq_chip->irq_bus_sync_unlock = adp5588_irq_bus_sync_unlock;
   280		irq_chip->irq_set_type = adp5588_irq_set_type;
   281		irq_chip->flags	= IRQCHIP_SKIP_SET_WAKE;
   282		girq = &kpad->gc.irq;
   283		girq->chip = irq_chip;
   284		girq->handler = handle_simple_irq;
   285		girq->threaded = true;
   286	
   287		mutex_init(&kpad->gpio_lock);
   288	
   289		error = devm_gpiochip_add_data(dev, &kpad->gc, kpad);
   290		if (error) {
   291			dev_err(dev, "gpiochip_add failed: %d\n", error);
   292			return error;
   293		}
   294	
   295		for (i = 0; i <= ADP5588_BANK(ADP5588_MAXGPIO); i++) {
   296			kpad->dat_out[i] = adp5588_read(kpad->client,
   297							GPIO_DAT_OUT1 + i);
   298			kpad->dir[i] = adp5588_read(kpad->client, GPIO_DIR1 + i);
   299		}
   300	
   301		if (gpio_data->setup) {
   302			error = gpio_data->setup(kpad->client,
   303						 kpad->gc.base, kpad->gc.ngpio,
   304						 gpio_data->context);
   305			if (error)
   306				dev_warn(dev, "setup failed: %d\n", error);
   307		}
   308	
   309		if (gpio_data->teardown) {
   310			error = devm_add_action(dev, adp5588_gpio_do_teardown, kpad);
   311			if (error)
   312				dev_warn(dev, "failed to schedule teardown: %d\n",
   313					 error);
   314		}
   315	
   316		return 0;
   317	}
   318	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
