Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59BB560C21E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Oct 2022 05:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbiJYDMF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Oct 2022 23:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbiJYDMA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 23:12:00 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7034C62E
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 20:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666667519; x=1698203519;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dQkTWgATdiNdxo/TIkvG3ZoefRFvwmVgWo6/oF9qS7Q=;
  b=B/bYLPOKhB9fm82X2K7mn4Y7OW7X4EcoJiMR0PRYtkPJCB0tVr7h5cIJ
   qlUymILUJZqkrBrJ1lS3jd2xi1vh1vlV+c1xrX4TxQ0xcvhKOrTBtFPaV
   C2ukuylEPbgS79Md6BrIJI3AMJ4iUBzEjp8GeKh4LXehmpFGyYqcmaqmw
   L6F10wew3DgGTCVAlXWwLcBVIAUFk9CRMmDPerM0BZ7KyxWbUYGo90E2e
   KIv0wEmaDK7GFUnfoJ/RDAl52SIMPxeLZdm+7N7KJd6yANuqrKCjjvjtU
   IuIJF7puGV3UDnYkhedQwr1KDi+RqrtLBWyXqx7RapIl1JEsvsZdY/gLl
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="371792399"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="371792399"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 20:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609420615"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="609420615"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Oct 2022 20:11:58 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1onAM9-0005rf-13;
        Tue, 25 Oct 2022 03:11:57 +0000
Date:   Tue, 25 Oct 2022 11:11:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-gpio:gpiochip-no-driver-h] BUILD REGRESSION
 2794f665a65946e4ed04a53751f80afbc0b6e432
Message-ID: <635753ec.hYAzbC8a9rBVuect%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpiochip-no-driver-h
branch HEAD: 2794f665a65946e4ed04a53751f80afbc0b6e432  See what explodes if we apply this patch

Error/Warning reports:

https://lore.kernel.org/linux-gpio/202210250638.zgGEWfhP-lkp@intel.com
https://lore.kernel.org/linux-gpio/202210251011.3oXqxD0i-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/mips/alchemy/common/gpiolib.c:143:15: error: variable 'au1300_gpiochip' has initializer but incomplete type
arch/mips/alchemy/common/gpiolib.c:143:25: error: storage size of 'au1300_gpiochip' isn't known
arch/mips/alchemy/common/gpiolib.c:144:10: error: 'struct gpio_chip' has no member named 'label'
arch/mips/alchemy/common/gpiolib.c:144:35: warning: excess elements in struct initializer
arch/mips/alchemy/common/gpiolib.c:145:10: error: 'struct gpio_chip' has no member named 'direction_input'
arch/mips/alchemy/common/gpiolib.c:146:10: error: 'struct gpio_chip' has no member named 'direction_output'
arch/mips/alchemy/common/gpiolib.c:147:10: error: 'struct gpio_chip' has no member named 'get'
arch/mips/alchemy/common/gpiolib.c:148:10: error: 'struct gpio_chip' has no member named 'set'
arch/mips/alchemy/common/gpiolib.c:149:10: error: 'struct gpio_chip' has no member named 'to_irq'
arch/mips/alchemy/common/gpiolib.c:150:10: error: 'struct gpio_chip' has no member named 'base'
arch/mips/alchemy/common/gpiolib.c:151:10: error: 'struct gpio_chip' has no member named 'ngpio'
arch/mips/alchemy/common/gpiolib.c:160:23: error: implicit declaration of function 'gpiochip_add_data' [-Werror=implicit-function-declaration]
arch/mips/alchemy/common/gpiolib.c:94:18: error: array type has incomplete element type 'struct gpio_chip'
arch/mips/include/asm/mach-au1x00/gpio-au1300.h:22:33: warning: excess elements in struct initializer

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- mips-gpr_defconfig
    |-- arch-mips-alchemy-common-gpiolib.c:error:array-type-has-incomplete-element-type-struct-gpio_chip
    |-- arch-mips-alchemy-common-gpiolib.c:error:implicit-declaration-of-function-gpiochip_add_data
    |-- arch-mips-alchemy-common-gpiolib.c:error:storage-size-of-au1300_gpiochip-isn-t-known
    |-- arch-mips-alchemy-common-gpiolib.c:error:struct-gpio_chip-has-no-member-named-base
    |-- arch-mips-alchemy-common-gpiolib.c:error:struct-gpio_chip-has-no-member-named-direction_input
    |-- arch-mips-alchemy-common-gpiolib.c:error:struct-gpio_chip-has-no-member-named-direction_output
    |-- arch-mips-alchemy-common-gpiolib.c:error:struct-gpio_chip-has-no-member-named-get
    |-- arch-mips-alchemy-common-gpiolib.c:error:struct-gpio_chip-has-no-member-named-label
    |-- arch-mips-alchemy-common-gpiolib.c:error:struct-gpio_chip-has-no-member-named-ngpio
    |-- arch-mips-alchemy-common-gpiolib.c:error:struct-gpio_chip-has-no-member-named-set
    |-- arch-mips-alchemy-common-gpiolib.c:error:struct-gpio_chip-has-no-member-named-to_irq
    |-- arch-mips-alchemy-common-gpiolib.c:error:variable-au1300_gpiochip-has-initializer-but-incomplete-type
    |-- arch-mips-alchemy-common-gpiolib.c:warning:excess-elements-in-struct-initializer
    `-- arch-mips-include-asm-mach-au1x00-gpio-au1300.h:warning:excess-elements-in-struct-initializer

elapsed time: 727m

configs tested: 121
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
x86_64                              defconfig
i386                             allyesconfig
x86_64                               rhel-8.3
arc                              allyesconfig
i386                 randconfig-a011-20221024
alpha                            allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
i386                 randconfig-a014-20221024
m68k                             allmodconfig
x86_64                           rhel-8.3-syz
i386                 randconfig-a013-20221024
m68k                             allyesconfig
x86_64                         rhel-8.3-kunit
x86_64               randconfig-k001-20221024
i386                 randconfig-a012-20221024
arc                                 defconfig
i386                 randconfig-a016-20221024
s390                             allmodconfig
i386                 randconfig-a015-20221024
alpha                               defconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
s390                                defconfig
s390                             allyesconfig
arc                  randconfig-r043-20221024
s390                 randconfig-r044-20221024
riscv                randconfig-r042-20221024
i386                          randconfig-c001
x86_64               randconfig-a014-20221024
x86_64               randconfig-a015-20221024
x86_64               randconfig-a016-20221024
x86_64               randconfig-a013-20221024
x86_64               randconfig-a012-20221024
x86_64               randconfig-a011-20221024
powerpc                   motionpro_defconfig
csky                             alldefconfig
powerpc                 mpc837x_rdb_defconfig
openrisc                            defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
m68k                            q40_defconfig
m68k                        m5307c3_defconfig
powerpc                      cm5200_defconfig
arm                       omap2plus_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                        spear6xx_defconfig
powerpc                      tqm8xx_defconfig
powerpc                 mpc834x_mds_defconfig
mips                            gpr_defconfig
arc                  randconfig-r043-20221023
sh                        sh7763rdp_defconfig
ia64                             allyesconfig
sh                             shx3_defconfig
arc                      axs103_smp_defconfig
mips                        vocore2_defconfig
sh                         ap325rxa_defconfig
ia64                      gensparse_defconfig
arm                          pxa910_defconfig
i386                 randconfig-c001-20221024
parisc                generic-64bit_defconfig
sh                           se7712_defconfig
arc                              alldefconfig
sh                        dreamcast_defconfig
sh                          polaris_defconfig
riscv                    nommu_k210_defconfig
xtensa                    xip_kc705_defconfig
arm                        mini2440_defconfig
powerpc                      chrp32_defconfig
sh                          lboxre2_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
m68k                       m5249evb_defconfig
arm                       aspeed_g5_defconfig
powerpc                  storcenter_defconfig
powerpc                 canyonlands_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
powerpc                     tqm8555_defconfig

clang tested configs:
i386                 randconfig-a004-20221024
i386                 randconfig-a006-20221024
i386                 randconfig-a002-20221024
i386                 randconfig-a003-20221024
i386                 randconfig-a001-20221024
i386                 randconfig-a005-20221024
x86_64               randconfig-a005-20221024
x86_64               randconfig-a002-20221024
x86_64               randconfig-a006-20221024
x86_64               randconfig-a001-20221024
x86_64               randconfig-a004-20221024
x86_64               randconfig-a003-20221024
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
hexagon              randconfig-r041-20221024
hexagon              randconfig-r045-20221024
hexagon              randconfig-r041-20221023
hexagon              randconfig-r045-20221023
riscv                randconfig-r042-20221023
s390                 randconfig-r044-20221023
mips                     loongson2k_defconfig
arm                          moxart_defconfig
arm                         s3c2410_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
