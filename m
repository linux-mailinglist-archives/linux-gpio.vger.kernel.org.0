Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51B113B4E7D
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jun 2021 14:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhFZMxW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Jun 2021 08:53:22 -0400
Received: from mga06.intel.com ([134.134.136.31]:7080 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229952AbhFZMxU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 26 Jun 2021 08:53:20 -0400
IronPort-SDR: QQkzg1mgJJBW+La79du7IqOiohXvImT/nbJOTCqbhdqFgGtBEzc/6c8ZM61nSKm2trhqhVBXU3
 jmeYT6JD8fNQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10026"; a="268918090"
X-IronPort-AV: E=Sophos;i="5.83,301,1616482800"; 
   d="scan'208";a="268918090"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2021 05:50:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,301,1616482800"; 
   d="scan'208";a="407222359"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Jun 2021 05:50:57 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lx7lw-0007l1-Bk; Sat, 26 Jun 2021 12:50:56 +0000
Date:   Sat, 26 Jun 2021 20:50:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 c477d9c76b1ecb0eb55f32b8dd3fac1debe91187
Message-ID: <60d722ad.1dVTo0EeSlJkNvhb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: c477d9c76b1ecb0eb55f32b8dd3fac1debe91187  Merge branch 'devel' into for-next

elapsed time: 725m

configs tested: 157
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                  maltasmvp_eva_defconfig
ia64                                defconfig
mips                         db1xxx_defconfig
sh                        apsh4ad0a_defconfig
mips                         tb0226_defconfig
powerpc                           allnoconfig
powerpc               mpc834x_itxgp_defconfig
mips                      malta_kvm_defconfig
mips                malta_qemu_32r6_defconfig
arm                          ep93xx_defconfig
xtensa                           alldefconfig
s390                          debug_defconfig
powerpc                 mpc832x_mds_defconfig
arc                            hsdk_defconfig
arc                           tb10x_defconfig
ia64                            zx1_defconfig
powerpc                         ps3_defconfig
powerpc                      mgcoge_defconfig
sh                        sh7785lcr_defconfig
sh                           se7721_defconfig
sh                        edosk7705_defconfig
arm                         bcm2835_defconfig
sh                               j2_defconfig
sh                          r7785rp_defconfig
h8300                            alldefconfig
mips                 decstation_r4k_defconfig
m68k                        mvme16x_defconfig
riscv                            allyesconfig
arm                           omap1_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc834x_itx_defconfig
sh                             espt_defconfig
microblaze                      mmu_defconfig
arm                      footbridge_defconfig
arm                       multi_v4t_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                     tqm8540_defconfig
arm                      integrator_defconfig
i386                             alldefconfig
x86_64                              defconfig
arm                             ezx_defconfig
arm                           sunxi_defconfig
mips                      fuloong2e_defconfig
um                           x86_64_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                            zeus_defconfig
arc                          axs101_defconfig
arm                          pxa3xx_defconfig
sh                          landisk_defconfig
ia64                          tiger_defconfig
sh                        dreamcast_defconfig
arm                         s3c6400_defconfig
mips                      pic32mzda_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                     tqm8560_defconfig
arc                     nsimosci_hs_defconfig
powerpc                     pq2fads_defconfig
arm                         vf610m4_defconfig
m68k                            mac_defconfig
arm                        trizeps4_defconfig
arm                             pxa_defconfig
m68k                         amcore_defconfig
sh                           sh2007_defconfig
arm                           viper_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
i386                 randconfig-a002-20210625
i386                 randconfig-a001-20210625
i386                 randconfig-a003-20210625
i386                 randconfig-a006-20210625
i386                 randconfig-a005-20210625
i386                 randconfig-a004-20210625
x86_64               randconfig-a012-20210622
x86_64               randconfig-a016-20210622
x86_64               randconfig-a015-20210622
x86_64               randconfig-a014-20210622
x86_64               randconfig-a013-20210622
x86_64               randconfig-a011-20210622
x86_64               randconfig-a012-20210626
x86_64               randconfig-a016-20210626
x86_64               randconfig-a015-20210626
x86_64               randconfig-a014-20210626
x86_64               randconfig-a013-20210626
x86_64               randconfig-a011-20210626
x86_64               randconfig-a002-20210625
x86_64               randconfig-a001-20210625
x86_64               randconfig-a005-20210625
x86_64               randconfig-a003-20210625
x86_64               randconfig-a004-20210625
x86_64               randconfig-a006-20210625
i386                 randconfig-a011-20210622
i386                 randconfig-a014-20210622
i386                 randconfig-a013-20210622
i386                 randconfig-a015-20210622
i386                 randconfig-a012-20210622
i386                 randconfig-a016-20210622
i386                 randconfig-a011-20210625
i386                 randconfig-a014-20210625
i386                 randconfig-a013-20210625
i386                 randconfig-a015-20210625
i386                 randconfig-a012-20210625
i386                 randconfig-a016-20210625
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210622
x86_64               randconfig-b001-20210625
x86_64               randconfig-a002-20210622
x86_64               randconfig-a001-20210622
x86_64               randconfig-a005-20210622
x86_64               randconfig-a003-20210622
x86_64               randconfig-a004-20210622
x86_64               randconfig-a006-20210622

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
