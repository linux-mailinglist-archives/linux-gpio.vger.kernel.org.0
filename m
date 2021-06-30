Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7563B82AF
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jun 2021 15:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234641AbhF3NLS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Jun 2021 09:11:18 -0400
Received: from mga07.intel.com ([134.134.136.100]:25574 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234481AbhF3NLS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Jun 2021 09:11:18 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="272199245"
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; 
   d="scan'208";a="272199245"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2021 06:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; 
   d="scan'208";a="408553655"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Jun 2021 06:08:47 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lyZxO-0009m1-Jf; Wed, 30 Jun 2021 13:08:46 +0000
Date:   Wed, 30 Jun 2021 21:07:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 bfa50166cd9d5d190b20dc33d1ec7ae19ced7022
Message-ID: <60dc6ca9.thky3ov8XLejhjx8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: bfa50166cd9d5d190b20dc33d1ec7ae19ced7022  pinctrl: ralink: rt305x: add missing include

elapsed time: 725m

configs tested: 156
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
xtensa                           allyesconfig
arm                         at91_dt_defconfig
arm                       imx_v6_v7_defconfig
ia64                         bigsur_defconfig
powerpc                     mpc512x_defconfig
arm                  colibri_pxa300_defconfig
mips                            gpr_defconfig
powerpc                      ppc44x_defconfig
powerpc                     mpc5200_defconfig
sh                        edosk7760_defconfig
mips                            ar7_defconfig
sh                           se7712_defconfig
mips                      maltasmvp_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                           se7724_defconfig
sh                          sdk7786_defconfig
powerpc                     taishan_defconfig
powerpc                      chrp32_defconfig
arm                            mmp2_defconfig
arm                         palmz72_defconfig
powerpc                     stx_gp3_defconfig
powerpc                     skiroot_defconfig
parisc                              defconfig
powerpc                  mpc885_ads_defconfig
arm                            zeus_defconfig
riscv                    nommu_k210_defconfig
arc                         haps_hs_defconfig
arm                      pxa255-idp_defconfig
powerpc                     tqm8540_defconfig
mips                           ip27_defconfig
ia64                          tiger_defconfig
sh                            hp6xx_defconfig
mips                        nlm_xlp_defconfig
mips                     cu1830-neo_defconfig
arm                         socfpga_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc64                           defconfig
sh                               j2_defconfig
arm                           u8500_defconfig
mips                         tb0287_defconfig
powerpc                     mpc83xx_defconfig
xtensa                           alldefconfig
powerpc                 mpc834x_mds_defconfig
sh                        edosk7705_defconfig
sh                         apsh4a3a_defconfig
csky                                defconfig
powerpc                   currituck_defconfig
arm                           h3600_defconfig
powerpc                    mvme5100_defconfig
arm                        mvebu_v5_defconfig
arm                             ezx_defconfig
riscv                               defconfig
arc                          axs101_defconfig
arm                         shannon_defconfig
arm                          moxart_defconfig
mips                      pic32mzda_defconfig
mips                          rm200_defconfig
arm                           h5000_defconfig
openrisc                 simple_smp_defconfig
sh                   secureedge5410_defconfig
arm                       netwinder_defconfig
powerpc                      ppc6xx_defconfig
powerpc                      katmai_defconfig
mips                        workpad_defconfig
powerpc                      pasemi_defconfig
powerpc                 mpc8560_ads_defconfig
sparc                       sparc32_defconfig
mips                           ci20_defconfig
sh                           se7780_defconfig
arm                        clps711x_defconfig
mips                         db1xxx_defconfig
sparc64                             defconfig
mips                       rbtx49xx_defconfig
um                               alldefconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210628
i386                 randconfig-a002-20210628
i386                 randconfig-a005-20210628
i386                 randconfig-a003-20210628
i386                 randconfig-a006-20210628
i386                 randconfig-a004-20210628
x86_64               randconfig-a012-20210628
x86_64               randconfig-a016-20210628
x86_64               randconfig-a015-20210628
x86_64               randconfig-a013-20210628
x86_64               randconfig-a014-20210628
x86_64               randconfig-a011-20210628
i386                 randconfig-a011-20210628
i386                 randconfig-a013-20210628
i386                 randconfig-a012-20210628
i386                 randconfig-a014-20210628
i386                 randconfig-a015-20210628
i386                 randconfig-a016-20210628
x86_64               randconfig-a002-20210629
x86_64               randconfig-a005-20210629
x86_64               randconfig-a001-20210629
x86_64               randconfig-a003-20210629
x86_64               randconfig-a004-20210629
x86_64               randconfig-a006-20210629
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                            kunit_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210628
x86_64               randconfig-a002-20210628
x86_64               randconfig-a005-20210628
x86_64               randconfig-a001-20210628
x86_64               randconfig-a003-20210628
x86_64               randconfig-a004-20210628
x86_64               randconfig-a006-20210628

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
