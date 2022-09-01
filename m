Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1125A9E46
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 19:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235073AbiIARkj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 13:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235115AbiIARkS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 13:40:18 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D6CCA1A7A
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 10:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662053877; x=1693589877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a/Qjlh39P1tnozWJ725EZVIZiCymOHE5RglHfQIT8KI=;
  b=Ro54VKBJXQFeZD7z7/lwKF95C299eE/k8/hI3tZNKtj2MjlGJKaiAtR/
   TKH2X2+7f2zuGhvg8yaBd2794hq5oZ3+8hEuN/Op/144mo7tZ58VBb21R
   w/KqRDaoa380L5koSykeA7BgJyVW5kiLIBaTqQ4a19aYq5/qj83uakkqB
   qXbq+ngo4+uAGwSnKBs7v9O7CH9CsnvhCxY9q++X3D8twqVEQvvsBZoIX
   X05IySh9MzkXRN7UPiQgvA+lEVfTfWmm9H41xiSUNLTWoluG7EYuLyRUB
   ggBJ+bSa3I3P0t9NQ5kOvb7N3jii0jzvNrvHyIN7qwI+x6n61oQOaeuRN
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="278799717"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="278799717"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 10:37:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="645755479"
Received: from lkp-server02.sh.intel.com (HELO b138c9e8658c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 01 Sep 2022 10:37:49 -0700
Received: from kbuild by b138c9e8658c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oTo8S-0000Zj-1j;
        Thu, 01 Sep 2022 17:37:48 +0000
Date:   Fri, 2 Sep 2022 01:37:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH] ARM: ep93xx: Convert to use descriptors for GPIO LEDs
Message-ID: <202209020143.4bgj9GIh-lkp@intel.com>
References: <20220830204327.368284-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830204327.368284-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

I love your patch! Yet something to improve:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.0-rc3 next-20220901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/ARM-ep93xx-Convert-to-use-descriptors-for-GPIO-LEDs/20220831-044651
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
config: arm-ep93xx_defconfig (https://download.01.org/0day-ci/archive/20220902/202209020143.4bgj9GIh-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/198889a7fb8ce93e00c3b801161bca6f76efdf3d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Linus-Walleij/ARM-ep93xx-Convert-to-use-descriptors-for-GPIO-LEDs/20220831-044651
        git checkout 198889a7fb8ce93e00c3b801161bca6f76efdf3d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm/mach-ep93xx/core.c:1000:50: error: expected ')'
           gpiod_add_lookup_table((&ep93xx_leds_gpio_table);
                                                           ^
   arch/arm/mach-ep93xx/core.c:1000:24: note: to match this '('
           gpiod_add_lookup_table((&ep93xx_leds_gpio_table);
                                 ^
   1 error generated.


vim +1000 arch/arm/mach-ep93xx/core.c

   972	
   973	struct device __init *ep93xx_init_devices(void)
   974	{
   975		struct device *parent;
   976	
   977		/* Disallow access to MaverickCrunch initially */
   978		ep93xx_devcfg_clear_bits(EP93XX_SYSCON_DEVCFG_CPENA);
   979	
   980		/* Default all ports to GPIO */
   981		ep93xx_devcfg_set_bits(EP93XX_SYSCON_DEVCFG_KEYS |
   982				       EP93XX_SYSCON_DEVCFG_GONK |
   983				       EP93XX_SYSCON_DEVCFG_EONIDE |
   984				       EP93XX_SYSCON_DEVCFG_GONIDE |
   985				       EP93XX_SYSCON_DEVCFG_HONIDE);
   986	
   987		parent = ep93xx_init_soc();
   988	
   989		/* Get the GPIO working early, other devices need it */
   990		platform_device_register(&ep93xx_gpio_device);
   991	
   992		amba_device_register(&uart1_device, &iomem_resource);
   993		amba_device_register(&uart2_device, &iomem_resource);
   994		amba_device_register(&uart3_device, &iomem_resource);
   995	
   996		platform_device_register(&ep93xx_rtc_device);
   997		platform_device_register(&ep93xx_ohci_device);
   998		platform_device_register(&ep93xx_wdt_device);
   999	
> 1000		gpiod_add_lookup_table((&ep93xx_leds_gpio_table);
  1001		gpio_led_register_device(-1, &ep93xx_led_data);
  1002	
  1003		return parent;
  1004	}
  1005	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
