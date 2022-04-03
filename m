Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40D2D4F0A19
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Apr 2022 16:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237097AbiDCOJm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Apr 2022 10:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358971AbiDCOJk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Apr 2022 10:09:40 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBAAE38DA5
        for <linux-gpio@vger.kernel.org>; Sun,  3 Apr 2022 07:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648994863; x=1680530863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Iaa0Rz+YG1vfFfesV6ptCzQLT+88xCYxNQQwWKE1i/0=;
  b=OjgYQ5TfWIcJvD/4lm72EFRfdHXFLYZ11xmwsLA/zlaGJN0WdwyxsjC+
   iUWei9KjrWIl/44fEoIYKlP/ZUUB/Tnh7sbAW/TTmThEId5aUH9/BizTn
   9iq7qkVuRbjOWGQkHtsXF+IUuxzq1haFKiAYK9x68crD/+xWqMpFKckJl
   jFue3A9VyBtBqqKJvI/PYG42zsxAtVrNr4gpTSQ4FkumJX//j0ACGIQe+
   TiHT1ICkItVg94kJLTiWBlI5daKCcV324O1BC6/YrNj5lylchoRUP3C0U
   SBGbgTaKvB0L61U4DM6sgqzP5HZBrSai/TR3RLLMjX/hrzbKK8/uonu7c
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10305"; a="240975065"
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="240975065"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2022 07:07:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="657149866"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 03 Apr 2022 07:07:31 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nb0t9-000113-7f;
        Sun, 03 Apr 2022 14:07:31 +0000
Date:   Sun, 3 Apr 2022 22:06:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] gpio: pcf857x: Make teardown callback return void
Message-ID: <202204032242.oF5ZiIfP-lkp@intel.com>
References: <20220401170549.340923-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401170549.340923-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi "Uwe,

I love your patch! Yet something to improve:

[auto build test ERROR on e8b767f5e04097aaedcd6e06e2270f9fe5282696]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/gpio-pcf857x-Make-teardown-callback-return-void/20220402-010754
base:   e8b767f5e04097aaedcd6e06e2270f9fe5282696
config: arm-davinci_all_defconfig (https://download.01.org/0day-ci/archive/20220403/202204032242.oF5ZiIfP-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/a3a8679599814e10a75617073b06db14ef794a54
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Uwe-Kleine-K-nig/gpio-pcf857x-Make-teardown-callback-return-void/20220402-010754
        git checkout a3a8679599814e10a75617073b06db14ef794a54
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm/mach-davinci/board-dm644x-evm.c:499:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
>> arch/arm/mach-davinci/board-dm644x-evm.c:504:14: error: incompatible function pointer types initializing 'void (*)(struct i2c_client *, int, unsigned int, void *)' with an expression of type 'int (struct i2c_client *, int, unsigned int, void *)' [-Werror,-Wincompatible-function-pointer-types]
           .teardown       = evm_u35_teardown,
                             ^~~~~~~~~~~~~~~~
   2 errors generated.


vim +499 arch/arm/mach-davinci/board-dm644x-evm.c

7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  488  
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  489  static int
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  490  evm_u35_teardown(struct i2c_client *client, int gpio, unsigned ngpio, void *c)
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  491  {
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  492  	gpio_free(gpio + 7);
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  493  	gpio_free(gpio + 6);
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  494  	gpio_free(gpio + 5);
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  495  	gpio_free(gpio + 3);
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  496  	gpio_free(gpio + 2);
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  497  	gpio_free(gpio + 1);
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  498  	gpio_free(gpio + 0);
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07 @499  }
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  500  
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  501  static struct pcf857x_platform_data pcf_data_u35 = {
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  502  	.gpio_base	= PCF_Uxx_BASE(2),
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  503  	.setup		= evm_u35_setup,
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07 @504  	.teardown	= evm_u35_teardown,
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  505  };
7bff3c4ce44ea48 arch/arm/mach-davinci/board-evm.c David Brownell 2008-09-07  506  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
