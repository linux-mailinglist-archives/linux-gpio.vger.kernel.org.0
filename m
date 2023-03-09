Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 403356B1E25
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 09:31:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbjCIIbq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 03:31:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbjCIIbW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 03:31:22 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47316DF27D;
        Thu,  9 Mar 2023 00:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678350575; x=1709886575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ez34kjscgZUPX0KiPYbpcrQbCpjzHK/+o25b4HpA+Zw=;
  b=KA1pCLguKVkGEelTAIGc7ZZOVNiWx6jJv8vt04AO0UsjpkXKLm6QFS93
   KBdQCWv4p7ueX5kpvm5gg572qixkO3MWxX2sqn+S9MYjfN6xkBGtGqP9+
   0nohuD3ii77BHlJsnfTF4j83aNYz7b8kXNTw5IXW9iTDUsZAUEHTQ/GnW
   KFizG+K9PTRzs5CQU+VCsT+HtKr9KoaOLe/fM+AO5H3GP6GzfZSuYXwgt
   L14LBkmZdD0YJwneLaOH6e8l0c0oMaqeCw0qhMoQAxpa53J2WQfEtcRXd
   BGqIPR+01z7qOpF0SRu3ibZR6yAARAZNtSDrtJrIK7x/TlXz+dKB2saeo
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="333857812"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="333857812"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 00:29:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="746232565"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="746232565"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2023 00:29:16 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1paBeG-0002nt-0N;
        Thu, 09 Mar 2023 08:29:16 +0000
Date:   Thu, 9 Mar 2023 16:28:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 3/8] pinctrl: renesas: Add support for 1.8V/2.5V I/O
 voltage levels
Message-ID: <202303091612.UKr8Fhos-lkp@intel.com>
References: <0c04925457bf3f7e78e7e3851528d9a4c29246da.1678271030.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c04925457bf3f7e78e7e3851528d9a4c29246da.1678271030.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

I love your patch! Yet something to improve:

[auto build test ERROR on geert-renesas-drivers/renesas-pinctrl]
[also build test ERROR on linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.3-rc1 next-20230309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/pinctrl-renesas-r8a77995-Retain-POCCTRL0-register-across-suspend-resume/20230308-212328
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
patch link:    https://lore.kernel.org/r/0c04925457bf3f7e78e7e3851528d9a4c29246da.1678271030.git.geert%2Brenesas%40glider.be
patch subject: [PATCH 3/8] pinctrl: renesas: Add support for 1.8V/2.5V I/O voltage levels
config: nios2-randconfig-r004-20230309 (https://download.01.org/0day-ci/archive/20230309/202303091612.UKr8Fhos-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/513932515f943c5987c5a214520f6875cd507c3e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Geert-Uytterhoeven/pinctrl-renesas-r8a77995-Retain-POCCTRL0-register-across-suspend-resume/20230308-212328
        git checkout 513932515f943c5987c5a214520f6875cd507c3e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/pinctrl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091612.UKr8Fhos-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pinctrl/renesas/pfc-r8a77950.c:11:
>> drivers/pinctrl/renesas/pfc-r8a77950.c:19:48: error: 'SH_PFC_PIN_CFG_IO_VOLTAGE' undeclared here (not in a function); did you mean 'SH_PFC_PIN_CFG_IO_VOLTAGE_MASK'?
      19 |         PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/renesas/sh_pfc.h:620:20: note: in definition of macro '_GP_GPIO'
     620 |         .configs = cfg,                                                 \
         |                    ^~~
   drivers/pinctrl/renesas/sh_pfc.h:447:9: note: in expansion of macro 'PORT_GP_CFG_1'
     447 |         PORT_GP_CFG_1(bank, 0,  fn, sfx, cfg),                          \
         |         ^~~~~~~~~~~~~
   drivers/pinctrl/renesas/sh_pfc.h:452:9: note: in expansion of macro 'PORT_GP_CFG_2'
     452 |         PORT_GP_CFG_2(bank, fn, sfx, cfg),                              \
         |         ^~~~~~~~~~~~~
   drivers/pinctrl/renesas/sh_pfc.h:458:9: note: in expansion of macro 'PORT_GP_CFG_4'
     458 |         PORT_GP_CFG_4(bank, fn, sfx, cfg),                              \
         |         ^~~~~~~~~~~~~
   drivers/pinctrl/renesas/sh_pfc.h:464:9: note: in expansion of macro 'PORT_GP_CFG_6'
     464 |         PORT_GP_CFG_6(bank, fn, sfx, cfg),                              \
         |         ^~~~~~~~~~~~~
   drivers/pinctrl/renesas/sh_pfc.h:469:9: note: in expansion of macro 'PORT_GP_CFG_7'
     469 |         PORT_GP_CFG_7(bank, fn, sfx, cfg),                              \
         |         ^~~~~~~~~~~~~
   drivers/pinctrl/renesas/sh_pfc.h:474:9: note: in expansion of macro 'PORT_GP_CFG_8'
     474 |         PORT_GP_CFG_8(bank, fn, sfx, cfg),                              \
         |         ^~~~~~~~~~~~~
   drivers/pinctrl/renesas/sh_pfc.h:479:9: note: in expansion of macro 'PORT_GP_CFG_9'
     479 |         PORT_GP_CFG_9(bank, fn, sfx, cfg),                              \
         |         ^~~~~~~~~~~~~
   drivers/pinctrl/renesas/sh_pfc.h:484:9: note: in expansion of macro 'PORT_GP_CFG_10'
     484 |         PORT_GP_CFG_10(bank, fn, sfx, cfg),                             \
         |         ^~~~~~~~~~~~~~
   drivers/pinctrl/renesas/sh_pfc.h:489:9: note: in expansion of macro 'PORT_GP_CFG_11'
     489 |         PORT_GP_CFG_11(bank, fn, sfx, cfg),                             \
         |         ^~~~~~~~~~~~~~
   drivers/pinctrl/renesas/pfc-r8a77950.c:19:9: note: in expansion of macro 'PORT_GP_CFG_12'
      19 |         PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
         |         ^~~~~~~~~~~~~~
   drivers/pinctrl/renesas/sh_pfc.h:622:41: note: in expansion of macro 'CPU_ALL_GP'
     622 | #define PINMUX_GPIO_GP_ALL()            CPU_ALL_GP(_GP_GPIO, unused)
         |                                         ^~~~~~~~~~
   drivers/pinctrl/renesas/pfc-r8a77950.c:1502:9: note: in expansion of macro 'PINMUX_GPIO_GP_ALL'
    1502 |         PINMUX_GPIO_GP_ALL(),
         |         ^~~~~~~~~~~~~~~~~~


vim +19 drivers/pinctrl/renesas/pfc-r8a77950.c

b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2016-10-03  14  
bd79c92039f117 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2019-03-21  15  #define CPU_ALL_GP(fn, sfx)						\
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2016-10-03  16  	PORT_GP_CFG_16(0, fn, sfx, CFG_FLAGS),	\
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2016-10-03  17  	PORT_GP_CFG_28(1, fn, sfx, CFG_FLAGS),	\
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2016-10-03  18  	PORT_GP_CFG_15(2, fn, sfx, CFG_FLAGS),	\
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2016-10-03 @19  	PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),	\
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2016-10-03  20  	PORT_GP_CFG_1(3, 12, fn, sfx, CFG_FLAGS),	\
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2016-10-03  21  	PORT_GP_CFG_1(3, 13, fn, sfx, CFG_FLAGS),	\
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2016-10-03  22  	PORT_GP_CFG_1(3, 14, fn, sfx, CFG_FLAGS),	\
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2016-10-03  23  	PORT_GP_CFG_1(3, 15, fn, sfx, CFG_FLAGS),	\
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2016-10-03  24  	PORT_GP_CFG_18(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),	\
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2016-10-03  25  	PORT_GP_CFG_26(5, fn, sfx, CFG_FLAGS),	\
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2016-10-03  26  	PORT_GP_CFG_32(6, fn, sfx, CFG_FLAGS),	\
b205914c8f822e drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2016-10-03  27  	PORT_GP_CFG_4(7, fn, sfx, CFG_FLAGS)
4f062bcb588972 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c Geert Uytterhoeven 2019-01-15  28  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
