Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 108CE5B10A9
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 01:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbiIGXxm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Sep 2022 19:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbiIGXxk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2022 19:53:40 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF822CEB38
        for <linux-gpio@vger.kernel.org>; Wed,  7 Sep 2022 16:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662594819; x=1694130819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=afq7WfcNMyREFRVD0+o2whWINHeS3DxNx3J5qZCgnl8=;
  b=FvVzADGX8EkQ/9UIzuuVq0wqX5gEs4smYHSfleGiV03u2DkqZAkvGC+6
   7FYmBHBiUHt2I5ICQ2R9MWL1HkuDqJpdqHDAY/yJP9sWMbw9+eTpczwA3
   7rUZra0/49byhzQGRi/n1oDHArdont8ZpYodUn9Y9YDAKtmYqRydjREKM
   GXdmmUA0MELZHQ3hrFrLSCHTsR4b4uu53KIhkdYZoY/odsFXCSo+/mr9Y
   M8d+DjJbFxa3WOonkKnE58UymaSdBhITydB/lr1TP7eII7GaKCElEBpZw
   JYy7xTzdCaR8B/tfY1ST71sBaXcjbo/6rMoIiMgTLceC0YNJBUaFD/ESw
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="298361418"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; 
   d="scan'208";a="298361418"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 16:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; 
   d="scan'208";a="740475974"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 07 Sep 2022 16:53:37 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oW4rQ-00076P-1Y;
        Wed, 07 Sep 2022 23:53:36 +0000
Date:   Thu, 8 Sep 2022 07:52:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jianqun Xu <jay.xu@rock-chips.com>, heiko@sntech.de,
        linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     kbuild-all@lists.01.org, andriy.shevchenko@linux.intel.com,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH v3 RESEND] gpio: rockchip: support acpi
Message-ID: <202209080711.fRu3ImWL-lkp@intel.com>
References: <20220907092722.3333752-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907092722.3333752-1-jay.xu@rock-chips.com>
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
[also build test ERROR on linus/master v6.0-rc4 next-20220907]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianqun-Xu/gpio-rockchip-support-acpi/20220907-172920
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
config: loongarch-buildonly-randconfig-r002-20220907 (https://download.01.org/0day-ci/archive/20220908/202209080711.fRu3ImWL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6b62c564dce1d94e9256d98661e5a7ae396627fb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jianqun-Xu/gpio-rockchip-support-acpi/20220907-172920
        git checkout 6b62c564dce1d94e9256d98661e5a7ae396627fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:22,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/gpio/gpio-rockchip.c:9:
   drivers/gpio/gpio-rockchip.c: In function 'rockchip_gpio_of_get_bank_id':
   drivers/gpio/gpio-rockchip.c:666:27: error: passing argument 1 of 'is_of_node' from incompatible pointer type [-Werror=incompatible-pointer-types]
     666 |         if (is_of_node(dev->of_node)) {
         |                        ~~~^~~~~~~~~
         |                           |
         |                           struct device_node *
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/gpio/gpio-rockchip.c:666:9: note: in expansion of macro 'if'
     666 |         if (is_of_node(dev->of_node)) {
         |         ^~
   In file included from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13:
   include/linux/of.h:155:59: note: expected 'const struct fwnode_handle *' but argument is of type 'struct device_node *'
     155 | static inline bool is_of_node(const struct fwnode_handle *fwnode)
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/gpio/gpio-rockchip.c:666:27: error: passing argument 1 of 'is_of_node' from incompatible pointer type [-Werror=incompatible-pointer-types]
     666 |         if (is_of_node(dev->of_node)) {
         |                        ~~~^~~~~~~~~
         |                           |
         |                           struct device_node *
   include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   drivers/gpio/gpio-rockchip.c:666:9: note: in expansion of macro 'if'
     666 |         if (is_of_node(dev->of_node)) {
         |         ^~
   include/linux/of.h:155:59: note: expected 'const struct fwnode_handle *' but argument is of type 'struct device_node *'
     155 | static inline bool is_of_node(const struct fwnode_handle *fwnode)
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/gpio/gpio-rockchip.c:666:27: error: passing argument 1 of 'is_of_node' from incompatible pointer type [-Werror=incompatible-pointer-types]
     666 |         if (is_of_node(dev->of_node)) {
         |                        ~~~^~~~~~~~~
         |                           |
         |                           struct device_node *
   include/linux/compiler.h:69:10: note: in definition of macro '__trace_if_value'
      69 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:666:9: note: in expansion of macro 'if'
     666 |         if (is_of_node(dev->of_node)) {
         |         ^~
   include/linux/of.h:155:59: note: expected 'const struct fwnode_handle *' but argument is of type 'struct device_node *'
     155 | static inline bool is_of_node(const struct fwnode_handle *fwnode)
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/gpio/gpio-rockchip.c: In function 'rockchip_gpio_probe':
>> drivers/gpio/gpio-rockchip.c:882:46: error: unterminated argument list invoking macro "if"
     882 | MODULE_DEVICE_TABLE(of, rockchip_gpio_match);
         |                                              ^
>> drivers/gpio/gpio-rockchip.c:883: error: expected '(' at end of input
   drivers/gpio/gpio-rockchip.c:721:9: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
     721 |         if (!is_acpi_node(dev_fwnode(dev)) {
         |         ^~
   drivers/gpio/gpio-rockchip.c:721:9: note: adding '-flarge-source-files' will allow for more column-tracking support, at the expense of compilation time and memory
   drivers/gpio/gpio-rockchip.c:721:9: error: expected declaration or statement at end of input
   drivers/gpio/gpio-rockchip.c:712:13: warning: unused variable 'ret' [-Wunused-variable]
     712 |         int ret;
         |             ^~~
   drivers/gpio/gpio-rockchip.c:710:35: warning: unused variable 'bank' [-Wunused-variable]
     710 |         struct rockchip_pin_bank *bank = NULL;
         |                                   ^~~~
   drivers/gpio/gpio-rockchip.c:709:29: warning: unused variable 'pctldev' [-Wunused-variable]
     709 |         struct pinctrl_dev *pctldev = NULL;
         |                             ^~~~~~~
   drivers/gpio/gpio-rockchip.c: At top level:
   drivers/gpio/gpio-rockchip.c:706:12: warning: 'rockchip_gpio_probe' defined but not used [-Wunused-function]
     706 | static int rockchip_gpio_probe(struct platform_device *pdev)
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:643:1: warning: 'rockchip_gpio_find_bank' defined but not used [-Wunused-function]
     643 | rockchip_gpio_find_bank(struct pinctrl_dev *pctldev, int id)
         | ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:628:13: warning: 'rockchip_gpio_get_ver' defined but not used [-Wunused-function]
     628 | static void rockchip_gpio_get_ver(struct rockchip_pin_bank *bank)
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-rockchip.c:584:12: warning: 'rockchip_gpiolib_register' defined but not used [-Wunused-function]
     584 | static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/if +882 drivers/gpio/gpio-rockchip.c

936ee2675eee1f Jianqun Xu 2021-08-16  878  
936ee2675eee1f Jianqun Xu 2021-08-16  879  MODULE_DESCRIPTION("Rockchip gpio driver");
936ee2675eee1f Jianqun Xu 2021-08-16  880  MODULE_ALIAS("platform:rockchip-gpio");
936ee2675eee1f Jianqun Xu 2021-08-16  881  MODULE_LICENSE("GPL v2");
936ee2675eee1f Jianqun Xu 2021-08-16 @882  MODULE_DEVICE_TABLE(of, rockchip_gpio_match);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
