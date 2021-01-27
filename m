Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77BFC3052BE
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 07:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232916AbhA0GDJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 01:03:09 -0500
Received: from mga12.intel.com ([192.55.52.136]:16298 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236838AbhA0DnO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Jan 2021 22:43:14 -0500
IronPort-SDR: yu/1A2j8Qz0SOKhOAtfPykm3jTFFiVlNxI/tZaPjesAGpHzffDmHlcTX2w27AXT1HqXA7wo0xu
 MHSf4eXQIo2Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="159185314"
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="159185314"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 19:42:31 -0800
IronPort-SDR: HtVYs3bO9PTvaAML/HSUD4668fSMSKt4d7vUUJMdc/dbWxlcsVxv0rAJeJwLNNlr7rpFIJNIKz
 s9eyhQgrzGig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="362251087"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 26 Jan 2021 19:42:30 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l4biv-0001IS-O4; Wed, 27 Jan 2021 03:42:29 +0000
Date:   Wed, 27 Jan 2021 11:41:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD REGRESSION
 9d5032f97e9e0655e8c507ab1f43237e31520b00
Message-ID: <6010e0ec.svhp6fduETRFccMu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 9d5032f97e9e0655e8c507ab1f43237e31520b00  dt-bindings: mediatek: mt8192: Fix dt_binding_check warning

Error/Warning reports:

https://lore.kernel.org/linux-gpio/202101260734.haBuNSsB-lkp@intel.com

Error/Warning in current branch:

drivers/pinctrl/samsung/pinctrl-s3c64xx.c:289:20: error: passing argument 1 of 'spinlock_check' from incompatible pointer type [-Werror=incompatible-pointer-types]
drivers/pinctrl/samsung/pinctrl-s3c64xx.c:296:25: error: passing argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type [-Werror=incompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- arc-allyesconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- arm-allmodconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- arm-allyesconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- arm64-allyesconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- arm64-randconfig-r023-20210126
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- c6x-allyesconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- h8300-allyesconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- i386-allyesconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- ia64-allmodconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- ia64-allyesconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- m68k-allmodconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- m68k-allyesconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- mips-allmodconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- mips-allyesconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- nds32-allyesconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- nios2-allyesconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- openrisc-randconfig-r025-20210126
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- parisc-allyesconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- powerpc-allmodconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- powerpc-allyesconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- powerpc-randconfig-r012-20210126
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- riscv-allmodconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- riscv-allyesconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- sh-allmodconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- sparc-allyesconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- x86_64-allmodconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
|-- x86_64-allyesconfig
|   |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
|   `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type
`-- xtensa-allyesconfig
    |-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spin_unlock_irqrestore-from-incompatible-pointer-type
    `-- drivers-pinctrl-samsung-pinctrl-s3c64xx.c:error:passing-argument-of-spinlock_check-from-incompatible-pointer-type

elapsed time: 724m

configs tested: 155
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          landisk_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                        warp_defconfig
powerpc                     tqm8560_defconfig
powerpc                      ppc44x_defconfig
powerpc                      ep88xc_defconfig
sh                          kfr2r09_defconfig
powerpc                    klondike_defconfig
powerpc                    mvme5100_defconfig
mips                           ip22_defconfig
openrisc                    or1ksim_defconfig
xtensa                generic_kc705_defconfig
x86_64                           allyesconfig
nios2                         10m50_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                        clps711x_defconfig
mips                     decstation_defconfig
powerpc                  storcenter_defconfig
arm                          ep93xx_defconfig
powerpc                         wii_defconfig
sh                           se7780_defconfig
mips                         tb0287_defconfig
sh                          polaris_defconfig
xtensa                    smp_lx200_defconfig
parisc                generic-32bit_defconfig
powerpc                     stx_gp3_defconfig
powerpc                     kilauea_defconfig
powerpc                     tqm8541_defconfig
arm                            lart_defconfig
openrisc                            defconfig
c6x                         dsk6455_defconfig
powerpc                        cell_defconfig
xtensa                    xip_kc705_defconfig
arm                       imx_v6_v7_defconfig
arm                        realview_defconfig
arm                         vf610m4_defconfig
mips                           ci20_defconfig
alpha                               defconfig
um                           x86_64_defconfig
arm                         lubbock_defconfig
powerpc                      acadia_defconfig
sh                        dreamcast_defconfig
powerpc                 mpc837x_mds_defconfig
arm                      integrator_defconfig
powerpc                    adder875_defconfig
arm                       cns3420vb_defconfig
um                            kunit_defconfig
sh                        edosk7705_defconfig
arm                       aspeed_g4_defconfig
powerpc                     pq2fads_defconfig
powerpc                     powernv_defconfig
arm                          pcm027_defconfig
mips                       capcella_defconfig
arm                             pxa_defconfig
parisc                           alldefconfig
powerpc                 mpc832x_rdb_defconfig
arm                        spear6xx_defconfig
c6x                                 defconfig
powerpc                           allnoconfig
arm                        spear3xx_defconfig
sh                           se7750_defconfig
sh                          rsk7264_defconfig
m68k                          amiga_defconfig
powerpc                     asp8347_defconfig
powerpc                       ppc64_defconfig
nds32                               defconfig
arc                         haps_hs_defconfig
mips                        nlm_xlr_defconfig
arm                        neponset_defconfig
arm                        multi_v7_defconfig
powerpc                       maple_defconfig
m68k                        m5307c3_defconfig
arm                        shmobile_defconfig
powerpc                   lite5200b_defconfig
arm                         s3c2410_defconfig
arm                        oxnas_v6_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a001-20210126
i386                 randconfig-a002-20210126
i386                 randconfig-a004-20210126
i386                 randconfig-a006-20210126
i386                 randconfig-a003-20210126
i386                 randconfig-a005-20210126
x86_64               randconfig-a012-20210126
x86_64               randconfig-a016-20210126
x86_64               randconfig-a015-20210126
x86_64               randconfig-a011-20210126
x86_64               randconfig-a013-20210126
x86_64               randconfig-a014-20210126
i386                 randconfig-a013-20210126
i386                 randconfig-a011-20210126
i386                 randconfig-a012-20210126
i386                 randconfig-a015-20210126
i386                 randconfig-a014-20210126
i386                 randconfig-a016-20210126
i386                 randconfig-a013-20210127
i386                 randconfig-a011-20210127
i386                 randconfig-a012-20210127
i386                 randconfig-a015-20210127
i386                 randconfig-a014-20210127
i386                 randconfig-a016-20210127
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210126
x86_64               randconfig-a002-20210126
x86_64               randconfig-a001-20210126
x86_64               randconfig-a005-20210126
x86_64               randconfig-a006-20210126
x86_64               randconfig-a004-20210126

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
