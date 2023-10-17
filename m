Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0337CB9BF
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 06:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjJQEdM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 00:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbjJQEdL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 00:33:11 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F679F
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2023 21:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697517189; x=1729053189;
  h=date:from:to:cc:subject:message-id;
  bh=js5L2BUjzaH8jGxb0p+xaJ6U5072kgdzcXp5kjGoz40=;
  b=WK7xUMhK78tLI9UDVGepGZvpu1/VIm5sROzqSvpN5+0S2RA7iBJWltxh
   GNiFCPssbbU5ilnrcajTPnPlo3oaUOLEOLZowGV2dNsftYPrBDrNWB/YH
   cJ1Rok/ydXeamZL8kUmP0FNP9cmerPKLwWfPJzlqNILY+j0G4HqTDrt0M
   8vu5pp4B0c5F0GRXGfeWbxopxt+EawaYTm1zTaQpUDAhU4dnzVo+IvFX1
   kmmEsDOFc9UuYqftoKTIlIch6CHtOIXCv9CUX50mG+p08VzlpZZSavkXw
   uyv3wludEMuaZj0qfN8JL6HwbvtTMnLKZUeeWoV5qipa6KRMLdSxtmdkc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="389568296"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="389568296"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 21:33:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="929620960"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="929620960"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Oct 2023 21:33:08 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qsblR-00090H-0o;
        Tue, 17 Oct 2023 04:33:05 +0000
Date:   Tue, 17 Oct 2023 12:31:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/devel] BUILD REGRESSION
 a1bf9eab0b4ae634c25e0176d719cd76ee337468
Message-ID: <202310171226.XyIbQ4Nl-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
branch HEAD: a1bf9eab0b4ae634c25e0176d719cd76ee337468  pinctrl: tegra: drop the wrapper around pinctrl_gpio_request()

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202310131321.jDp5kiph-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/pinctrl/pinctrl-st.c:1326:9: error: implicit declaration of function 'st_gpio_direction_input'; did you mean 'st_gpio_direction_output'? [-Werror=implicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-allmodconfig
|   `-- drivers-pinctrl-pinctrl-st.c:error:implicit-declaration-of-function-st_gpio_direction_input
|-- arm-allyesconfig
|   `-- drivers-pinctrl-pinctrl-st.c:error:implicit-declaration-of-function-st_gpio_direction_input
`-- arm-defconfig
    `-- drivers-pinctrl-pinctrl-st.c:error:implicit-declaration-of-function-st_gpio_direction_input

elapsed time: 733m

configs tested: 104
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231017   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231017   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231017   gcc  
i386                  randconfig-002-20231017   gcc  
i386                  randconfig-003-20231017   gcc  
i386                  randconfig-004-20231017   gcc  
i386                  randconfig-005-20231017   gcc  
i386                  randconfig-006-20231017   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231017   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231017   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231017   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231017   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231017   gcc  
x86_64                randconfig-002-20231017   gcc  
x86_64                randconfig-003-20231017   gcc  
x86_64                randconfig-004-20231017   gcc  
x86_64                randconfig-005-20231017   gcc  
x86_64                randconfig-006-20231017   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
