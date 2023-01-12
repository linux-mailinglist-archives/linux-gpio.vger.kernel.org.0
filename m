Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8D96669E8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jan 2023 05:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235156AbjALECn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Jan 2023 23:02:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjALECk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2023 23:02:40 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D42C48CEF
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2023 20:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673496159; x=1705032159;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4TVCgCdOAbnbK5IUv4btIGrCV1mwPeF1bGqOp3OWxRE=;
  b=ddKIOpqbs95pUrgRUSU7pxxeL/3gT4EFOO2Y+ZXLFL1WzVnPuKiaMRzd
   82RkqnOtAs8aU0QdFN2e2gdH1yYBP3whxrDbnIvz+pceeTN7JTSiu9I0Q
   76tY8C/+iIp1bf1RkVuD0YUc9R/53iO6sZR+YWdDZ1MMfYS4hH4VLUV+y
   RjG4U/KxZqW+zLPTAMC6mmpxYresQ+jptuDxaSdvoEXBb8L3Kqmkt5uPZ
   xVvbEPEn9x6CwtaltUXfCeLHxICxZEcf2zu7Zs/yXHj8GcRKFsrNKeCJs
   nC42OoJ/zu//PHG1leQtni6h9+EY6F77Ch3gr27Y7hHcv0r1zY43C28H/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="322308995"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="322308995"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 20:02:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="903025946"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="903025946"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 11 Jan 2023 20:02:37 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pFonV-0009m8-09;
        Thu, 12 Jan 2023 04:02:37 +0000
Date:   Thu, 12 Jan 2023 12:02:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-gpio:gpiochip-no-driver-h] BUILD REGRESSION
 73609f752a84622a727704686c1e92559a707499
Message-ID: <63bf8651.ELgWSSd0kRuN0iDX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpiochip-no-driver-h
branch HEAD: 73609f752a84622a727704686c1e92559a707499  See what explodes if we apply this patch

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202301120740.iMoLXaU0-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301120746.BeQnQQwA-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/arm/mach-s3c/s3c64xx.c:212:13: error: implicit declaration of function 'of_have_populated_dt' [-Werror=implicit-function-declaration]
arch/arm/plat-orion/gpio.c:157:41: error: implicit declaration of function 'gpiochip_get_data'; did you mean 'ioasid_set_data'? [-Werror=implicit-function-declaration]
arch/arm/plat-orion/gpio.c:157:41: warning: initialization of 'struct orion_gpio_chip *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
arch/arm/plat-orion/gpio.c:242:32: error: invalid use of undefined type 'struct gpio_chip'
arch/arm/plat-orion/gpio.c:41:33: error: field 'chip' has incomplete type
arch/arm/plat-orion/gpio.c:444:13: warning: variable 'out' set but not used [-Wunused-but-set-variable]
arch/arm/plat-orion/gpio.c:444:18: warning: variable 'io_conf' set but not used [-Wunused-but-set-variable]
arch/arm/plat-orion/gpio.c:444:27: warning: variable 'blink' set but not used [-Wunused-but-set-variable]
arch/arm/plat-orion/gpio.c:444:34: warning: variable 'in_pol' set but not used [-Wunused-but-set-variable]
arch/arm/plat-orion/gpio.c:444:42: warning: variable 'data_in' set but not used [-Wunused-but-set-variable]
arch/arm/plat-orion/gpio.c:444:51: warning: variable 'cause' set but not used [-Wunused-but-set-variable]
arch/arm/plat-orion/gpio.c:444:58: warning: variable 'edg_msk' set but not used [-Wunused-but-set-variable]
arch/arm/plat-orion/gpio.c:444:67: warning: variable 'lvl_msk' set but not used [-Wunused-but-set-variable]
arch/arm/plat-orion/gpio.c:457:48: error: expected ';' before '{' token
arch/arm/plat-orion/gpio.c:457:9: error: implicit declaration of function 'for_each_requested_gpio' [-Werror=implicit-function-declaration]
arch/arm/plat-orion/gpio.c:556:9: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
drivers/hte/hte-tegra194-test.c:96:34: error: array type has incomplete element type 'struct of_device_id'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-allyesconfig
|   |-- arch-arm-mach-s3c-s3c64xx.c:error:implicit-declaration-of-function-of_have_populated_dt
|   |-- arch-arm-plat-orion-gpio.c:error:expected-before-token
|   |-- arch-arm-plat-orion-gpio.c:error:field-chip-has-incomplete-type
|   |-- arch-arm-plat-orion-gpio.c:error:implicit-declaration-of-function-for_each_requested_gpio
|   |-- arch-arm-plat-orion-gpio.c:error:implicit-declaration-of-function-gpiochip_add_data
|   |-- arch-arm-plat-orion-gpio.c:error:implicit-declaration-of-function-gpiochip_get_data
|   |-- arch-arm-plat-orion-gpio.c:error:invalid-use-of-undefined-type-struct-gpio_chip
|   |-- arch-arm-plat-orion-gpio.c:warning:initialization-of-struct-orion_gpio_chip-from-int-makes-pointer-from-integer-without-a-cast
|   |-- arch-arm-plat-orion-gpio.c:warning:variable-blink-set-but-not-used
|   |-- arch-arm-plat-orion-gpio.c:warning:variable-cause-set-but-not-used
|   |-- arch-arm-plat-orion-gpio.c:warning:variable-data_in-set-but-not-used
|   |-- arch-arm-plat-orion-gpio.c:warning:variable-edg_msk-set-but-not-used
|   |-- arch-arm-plat-orion-gpio.c:warning:variable-in_pol-set-but-not-used
|   |-- arch-arm-plat-orion-gpio.c:warning:variable-io_conf-set-but-not-used
|   |-- arch-arm-plat-orion-gpio.c:warning:variable-lvl_msk-set-but-not-used
|   `-- arch-arm-plat-orion-gpio.c:warning:variable-out-set-but-not-used
`-- arm64-allyesconfig
    `-- drivers-hte-hte-tegra194-test.c:error:array-type-has-incomplete-element-type-struct-of_device_id

elapsed time: 726m

configs tested: 86
configs skipped: 2

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                            allnoconfig
s390                                defconfig
s390                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                              defconfig
x86_64                           rhel-8.3-bpf
x86_64                               rhel-8.3
powerpc                           allnoconfig
x86_64                           allyesconfig
i386                                defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
um                             i386_defconfig
i386                          randconfig-a001
um                           x86_64_defconfig
i386                          randconfig-a003
sh                               allmodconfig
arm                                 defconfig
x86_64                        randconfig-a006
m68k                             allyesconfig
i386                          randconfig-a005
m68k                             allmodconfig
mips                             allyesconfig
x86_64                    rhel-8.3-kselftests
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
arc                              allyesconfig
arc                  randconfig-r043-20230110
alpha                            allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
s390                 randconfig-r044-20230110
riscv                randconfig-r042-20230110
x86_64                        randconfig-a015
arm                              allyesconfig
i386                             allyesconfig
arm64                            allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
ia64                             allmodconfig
m68k                         amcore_defconfig
arm                        multi_v7_defconfig
sh                              ul2_defconfig
m68k                             alldefconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                    klondike_defconfig
arm                          gemini_defconfig
powerpc                     tqm8548_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230110
i386                          randconfig-a004
i386                          randconfig-a006
arm                  randconfig-r046-20230110
x86_64                        randconfig-a012
hexagon              randconfig-r045-20230110
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
powerpc                        fsp2_defconfig
arm                         shannon_defconfig
arm                         s5pv210_defconfig
hexagon                          alldefconfig
powerpc                     ksi8560_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
