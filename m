Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB9772B2A5F
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Nov 2020 02:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgKNBO7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 20:14:59 -0500
Received: from mga14.intel.com ([192.55.52.115]:28830 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726236AbgKNBO7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Nov 2020 20:14:59 -0500
IronPort-SDR: qtdRNRFAbmrKPA0J/4PvYrMn+juxR9ZfCFgy50UghfoivFGWZhkfpqe04SFJxhkKczpq/9kGS8
 EA4GJe1CkGiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9804"; a="169771103"
X-IronPort-AV: E=Sophos;i="5.77,477,1596524400"; 
   d="scan'208";a="169771103"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2020 17:14:53 -0800
IronPort-SDR: lXk+W+OjJNDf/lzsfuBwJefZOwWH+UuWqU0M6ZzaOa18XwlxeW/bB19omZo0r6LRw7+GhX1ORO
 e1XspgRYjn0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,477,1596524400"; 
   d="scan'208";a="355725503"
Received: from lkp-server02.sh.intel.com (HELO 697932c29306) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Nov 2020 17:14:49 -0800
Received: from kbuild by 697932c29306 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kdk9R-0000bu-7y; Sat, 14 Nov 2020 01:14:49 +0000
Date:   Sat, 14 Nov 2020 09:14:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-spi] BUILD SUCCESS
 a40edbe3d2bf76cbc1a7c30b50de679811427aaf
Message-ID: <5faf2f5c.szuPkQAxKrEmFwZd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-spi
branch HEAD: a40edbe3d2bf76cbc1a7c30b50de679811427aaf  spi: mpc512x-psc: Convert to use GPIO descriptors

elapsed time: 723m

configs tested: 174
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                  cavium_octeon_defconfig
powerpc                     pq2fads_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                     loongson1b_defconfig
powerpc                     rainier_defconfig
ia64                          tiger_defconfig
powerpc                    sam440ep_defconfig
h8300                    h8300h-sim_defconfig
sh                             shx3_defconfig
xtensa                              defconfig
powerpc                  iss476-smp_defconfig
arm                         ebsa110_defconfig
m68k                         apollo_defconfig
sh                            titan_defconfig
mips                         mpc30x_defconfig
powerpc                 mpc837x_mds_defconfig
sh                     magicpanelr2_defconfig
powerpc                     sequoia_defconfig
powerpc                       eiger_defconfig
arm                        neponset_defconfig
powerpc                     kmeter1_defconfig
m68k                                defconfig
mips                         bigsur_defconfig
arm                         s3c6400_defconfig
arm                         s5pv210_defconfig
arm                        cerfcube_defconfig
arm                         assabet_defconfig
sh                           se7343_defconfig
nios2                            alldefconfig
sh                          rsk7203_defconfig
m68k                            q40_defconfig
openrisc                    or1ksim_defconfig
arm                         hackkit_defconfig
powerpc                  storcenter_defconfig
sparc                       sparc32_defconfig
powerpc                     ppa8548_defconfig
arm                          gemini_defconfig
m68k                       m5249evb_defconfig
arm                          iop32x_defconfig
arm                          simpad_defconfig
arm                           sunxi_defconfig
arm                    vt8500_v6_v7_defconfig
arm                           h3600_defconfig
arm                          tango4_defconfig
powerpc                     stx_gp3_defconfig
mips                         rt305x_defconfig
powerpc                   bluestone_defconfig
powerpc               mpc834x_itxgp_defconfig
ia64                                defconfig
arm                      pxa255-idp_defconfig
powerpc                     tqm8560_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                        omega2p_defconfig
powerpc                      cm5200_defconfig
powerpc                      bamboo_defconfig
mips                        bcm47xx_defconfig
powerpc64                        alldefconfig
sh                   sh7724_generic_defconfig
alpha                            alldefconfig
arm                         vf610m4_defconfig
arm                      integrator_defconfig
sh                         ecovec24_defconfig
sh                           se7750_defconfig
mips                           jazz_defconfig
powerpc                      acadia_defconfig
xtensa                          iss_defconfig
m68k                       m5208evb_defconfig
mips                           xway_defconfig
mips                        jmr3927_defconfig
mips                          rb532_defconfig
powerpc                          allmodconfig
nds32                            alldefconfig
arm                       aspeed_g4_defconfig
um                            kunit_defconfig
powerpc                      chrp32_defconfig
sh                               j2_defconfig
m68k                            mac_defconfig
mips                        vocore2_defconfig
xtensa                         virt_defconfig
arm                        shmobile_defconfig
powerpc64                           defconfig
arm                           sama5_defconfig
mips                           ip32_defconfig
riscv                               defconfig
sh                          kfr2r09_defconfig
mips                     loongson1c_defconfig
arm                   milbeaut_m10v_defconfig
arm                           spitz_defconfig
mips                         tb0226_defconfig
m68k                        m5272c3_defconfig
arm                            xcep_defconfig
mips                 decstation_r4k_defconfig
arm                         axm55xx_defconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
arm                       versatile_defconfig
arm                       imx_v4_v5_defconfig
powerpc                    mvme5100_defconfig
ia64                        generic_defconfig
arm                           stm32_defconfig
mips                        bcm63xx_defconfig
sh                          rsk7269_defconfig
powerpc                         wii_defconfig
mips                        nlm_xlr_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20201113
i386                 randconfig-a005-20201113
i386                 randconfig-a002-20201113
i386                 randconfig-a001-20201113
i386                 randconfig-a003-20201113
i386                 randconfig-a004-20201113
x86_64               randconfig-a015-20201113
x86_64               randconfig-a011-20201113
x86_64               randconfig-a014-20201113
x86_64               randconfig-a013-20201113
x86_64               randconfig-a016-20201113
x86_64               randconfig-a012-20201113
i386                 randconfig-a012-20201113
i386                 randconfig-a014-20201113
i386                 randconfig-a016-20201113
i386                 randconfig-a011-20201113
i386                 randconfig-a015-20201113
i386                 randconfig-a013-20201113
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20201113
x86_64               randconfig-a005-20201113
x86_64               randconfig-a004-20201113
x86_64               randconfig-a002-20201113
x86_64               randconfig-a006-20201113
x86_64               randconfig-a001-20201113

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
