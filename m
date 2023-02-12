Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51FA4693A4B
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Feb 2023 22:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbjBLVr5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 12 Feb 2023 16:47:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjBLVr4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 12 Feb 2023 16:47:56 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E7D9750
        for <linux-gpio@vger.kernel.org>; Sun, 12 Feb 2023 13:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676238475; x=1707774475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W9VHxmt5OExJwTOnHFZ/HUvyDmFFCgydGvIbDkfecp4=;
  b=Qy4+kftKC6X15D9E7WC8ELxYoSqOJv/ri0kFakSWkWlEvsArwmtAXCCp
   m7FKo6Wg941XlQ+IfR/vy9HuCoyMk3NLpBan5TawWAAZtnVEJYPntyNDQ
   6ojhUA7aqHMbzUXZkdmXxmXp3u4FMye4WYxQjrlMCWJ+Nx5P8sASt0LLh
   dyK9Yc/0V8YW1Px8MbyuxRjdXUjMfbtuQz6/JVcFP9IL9RH04ryUytgbp
   +lgSUYBtb391eYOjFmYvS8LKU3snP82tslzmORIo/304hi9pz8nWWUhpV
   XlV3lUkYV4DnnjCSez6cI+n5x4qqmwckkGNXv+DWVRgExwwRSzcOlgAW8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="318785891"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="318785891"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 13:47:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="811392676"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="811392676"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2023 13:47:53 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pRKCO-0007Ov-1A;
        Sun, 12 Feb 2023 21:47:52 +0000
Date:   Mon, 13 Feb 2023 05:47:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: [linusw-gpio:gpiochip-no-driver-h 5/5] arch/mips/ar7/gpio.c:24:38:
 warning: initialization of 'struct ar7_gpio_chip *' from 'int' makes pointer
 from integer without a cast
Message-ID: <202302130551.RReykD8t-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpiochip-no-driver-h
head:   df771cce328bbd37333797d0df3471c2e03ecb03
commit: df771cce328bbd37333797d0df3471c2e03ecb03 [5/5] gpio: Make the legacy <linux/gpio.h> consumer-only
config: mips-ar7_defconfig (https://download.01.org/0day-ci/archive/20230213/202302130551.RReykD8t-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?id=df771cce328bbd37333797d0df3471c2e03ecb03
        git remote add linusw-gpio https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
        git fetch --no-tags linusw-gpio gpiochip-no-driver-h
        git checkout df771cce328bbd37333797d0df3471c2e03ecb03
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/ar7/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302130551.RReykD8t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/mips/ar7/gpio.c:19:33: error: field 'chip' has incomplete type
      19 |         struct gpio_chip        chip;
         |                                 ^~~~
   arch/mips/ar7/gpio.c: In function 'ar7_gpio_get_value':
   arch/mips/ar7/gpio.c:24:38: error: implicit declaration of function 'gpiochip_get_data' [-Werror=implicit-function-declaration]
      24 |         struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
         |                                      ^~~~~~~~~~~~~~~~~
>> arch/mips/ar7/gpio.c:24:38: warning: initialization of 'struct ar7_gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   arch/mips/ar7/gpio.c: In function 'titan_gpio_get_value':
   arch/mips/ar7/gpio.c:32:38: warning: initialization of 'struct ar7_gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      32 |         struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
         |                                      ^~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c: In function 'ar7_gpio_set_value':
   arch/mips/ar7/gpio.c:42:38: warning: initialization of 'struct ar7_gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      42 |         struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
         |                                      ^~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c: In function 'titan_gpio_set_value':
   arch/mips/ar7/gpio.c:55:38: warning: initialization of 'struct ar7_gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      55 |         struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
         |                                      ^~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c: In function 'ar7_gpio_direction_input':
   arch/mips/ar7/gpio.c:68:38: warning: initialization of 'struct ar7_gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      68 |         struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
         |                                      ^~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c: In function 'titan_gpio_direction_input':
   arch/mips/ar7/gpio.c:78:38: warning: initialization of 'struct ar7_gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      78 |         struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
         |                                      ^~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c: In function 'ar7_gpio_direction_output':
   arch/mips/ar7/gpio.c:93:38: warning: initialization of 'struct ar7_gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      93 |         struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
         |                                      ^~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c: In function 'titan_gpio_direction_output':
   arch/mips/ar7/gpio.c:105:38: warning: initialization of 'struct ar7_gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     105 |         struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
         |                                      ^~~~~~~~~~~~~~~~~
   arch/mips/ar7/gpio.c: In function 'ar7_gpio_init':
   arch/mips/ar7/gpio.c:318:15: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
     318 |         ret = gpiochip_add_data(&gpch->chip, gpch);
         |               ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +24 arch/mips/ar7/gpio.c

7ca5dc145bc7da Florian Fainelli 2009-06-24  21  
5f3c909881d5de Florian Fainelli 2010-01-03  22  static int ar7_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
7ca5dc145bc7da Florian Fainelli 2009-06-24  23  {
1b2766fb496c46 Linus Walleij    2015-12-08 @24  	struct ar7_gpio_chip *gpch = gpiochip_get_data(chip);
5f3c909881d5de Florian Fainelli 2010-01-03  25  	void __iomem *gpio_in = gpch->regs + AR7_GPIO_INPUT;
7ca5dc145bc7da Florian Fainelli 2009-06-24  26  
249e573d99ab59 Linus Walleij    2015-12-22  27  	return !!(readl(gpio_in) & (1 << gpio));
5f3c909881d5de Florian Fainelli 2010-01-03  28  }
5f3c909881d5de Florian Fainelli 2010-01-03  29  

:::::: The code at line 24 was first introduced by commit
:::::: 1b2766fb496c462b3f6e1d1c52c72f8601ac8540 MIPS: ar7: use gpiochip data pointer

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
