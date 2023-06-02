Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB39E720A16
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 22:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234834AbjFBUAF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 16:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232935AbjFBUAE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 16:00:04 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C729D
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jun 2023 13:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685736002; x=1717272002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=haIZ6yYjZIe64NqUG9FzLM2OyIX7yAq5K2Im5F1qvtY=;
  b=Dww1X2R1sloRoRUFaavTSx7AOr8PXJIaUsS0/pmIO7cJBoHRAwU6rpmP
   eOhdDhzaD0B6w9RcXmBiPLXoILQbbdz2z/lQVdAQTkOvlMNXCCk9Q3f8s
   moU/af0MHXy9F7WCgqAnndcJf7QpUHbIZQElb/V/TpC64LRrGFuzA8+6d
   dp14uofUG3ugW2uMi8La/AMrifGfI6q60OOa2TFfgGlO5zAlVJRrpQfQt
   4eOGg4ksu82I7jRKWqHxeC70zP9ejXF66xaeWDYKMAFf1vCKGvpFRmAsD
   CICguvxb4AadLfrN5kNFegNHkuqAIdOS8tvTNIQQSJ1qLDo19N4XxwqW8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="345534346"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="345534346"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 13:00:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="685419804"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="685419804"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 Jun 2023 13:00:00 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q5AwJ-0000vL-25;
        Fri, 02 Jun 2023 19:59:59 +0000
Date:   Sat, 3 Jun 2023 03:59:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [brgl:gpio/for-next 22/22] drivers/gpio/gpio-delay.c:79:39: error:
 'struct gpio_chip' has no member named 'of_gpio_n_cells'
Message-ID: <202306030340.PkL0Qly6-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   cf5dec80c4e23ac1677b8ef9aafe5a7b87bb18c3
commit: cf5dec80c4e23ac1677b8ef9aafe5a7b87bb18c3 [22/22] gpio: Add gpio delay driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230603/202306030340.PkL0Qly6-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=cf5dec80c4e23ac1677b8ef9aafe5a7b87bb18c3
        git remote add brgl https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
        git fetch --no-tags brgl gpio/for-next
        git checkout cf5dec80c4e23ac1677b8ef9aafe5a7b87bb18c3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306030340.PkL0Qly6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-delay.c: In function 'gpio_delay_of_xlate':
>> drivers/gpio/gpio-delay.c:79:39: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
      79 |         if (gpiospec->args_count != gc->of_gpio_n_cells)
         |                                       ^~
   drivers/gpio/gpio-delay.c: In function 'gpio_delay_probe':
>> drivers/gpio/gpio-delay.c:133:17: error: 'struct gpio_chip' has no member named 'of_xlate'
     133 |         priv->gc.of_xlate = gpio_delay_of_xlate;
         |                 ^
   drivers/gpio/gpio-delay.c:134:17: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     134 |         priv->gc.of_gpio_n_cells = 3;
         |                 ^


vim +79 drivers/gpio/gpio-delay.c

    70	
    71	static int gpio_delay_of_xlate(struct gpio_chip *gc,
    72				       const struct of_phandle_args *gpiospec,
    73				       u32 *flags)
    74	{
    75		struct gpio_delay_priv *priv = gpiochip_get_data(gc);
    76		struct gpio_delay_timing *timings;
    77		u32 line;
    78	
  > 79		if (gpiospec->args_count != gc->of_gpio_n_cells)
    80			return -EINVAL;
    81	
    82		line = gpiospec->args[0];
    83		if (line >= gc->ngpio)
    84			return -EINVAL;
    85	
    86		timings = &priv->delay_timings[line];
    87		timings->ramp_up_delay_us = gpiospec->args[1];
    88		timings->ramp_down_delay_us = gpiospec->args[2];
    89	
    90		return line;
    91	}
    92	
    93	static bool gpio_delay_can_sleep(const struct gpio_delay_priv *priv)
    94	{
    95		int i;
    96	
    97		for (i = 0; i < priv->input_gpio->ndescs; i++)
    98			if (gpiod_cansleep(priv->input_gpio->desc[i]))
    99				return true;
   100	
   101		return false;
   102	}
   103	
   104	static int gpio_delay_probe(struct platform_device *pdev)
   105	{
   106		struct gpio_delay_priv *priv;
   107	
   108		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
   109		if (!priv)
   110			return -ENOMEM;
   111	
   112		priv->input_gpio = devm_gpiod_get_array(&pdev->dev, NULL, GPIOD_OUT_LOW);
   113		if (IS_ERR(priv->input_gpio))
   114			return dev_err_probe(&pdev->dev, PTR_ERR(priv->input_gpio),
   115					     "Failed to get input-gpios");
   116	
   117		priv->delay_timings = devm_kcalloc(&pdev->dev,
   118						   priv->input_gpio->ndescs,
   119						   sizeof(*priv->delay_timings),
   120						   GFP_KERNEL);
   121		if (!priv->delay_timings)
   122			return -ENOMEM;
   123	
   124		if (gpio_delay_can_sleep(priv)) {
   125			priv->gc.can_sleep = true;
   126			priv->gc.set = gpio_delay_set_can_sleep;
   127		} else {
   128			priv->gc.can_sleep = false;
   129			priv->gc.set = gpio_delay_set;
   130		}
   131	
   132		priv->gc.get_direction = gpio_delay_get_direction;
 > 133		priv->gc.of_xlate = gpio_delay_of_xlate;
   134		priv->gc.of_gpio_n_cells = 3;
   135		priv->gc.ngpio = priv->input_gpio->ndescs;
   136		priv->gc.owner = THIS_MODULE;
   137		priv->gc.base = -1;
   138		priv->gc.parent = &pdev->dev;
   139	
   140		platform_set_drvdata(pdev, priv);
   141	
   142		return devm_gpiochip_add_data(&pdev->dev, &priv->gc, priv);
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
