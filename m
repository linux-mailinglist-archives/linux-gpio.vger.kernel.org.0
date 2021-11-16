Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EADC45342D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 15:30:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237473AbhKPOdY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 09:33:24 -0500
Received: from mga05.intel.com ([192.55.52.43]:53357 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237459AbhKPOdO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Nov 2021 09:33:14 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="319914769"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; 
   d="scan'208";a="319914769"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 06:30:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; 
   d="scan'208";a="454470189"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Nov 2021 06:30:15 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mmzTS-0000Xg-9R; Tue, 16 Nov 2021 14:30:14 +0000
Date:   Tue, 16 Nov 2021 22:29:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 62209e805b5c68577602a5803a71d8e2e11ee0d3
Message-ID: <6193c037.gwW93NkKPsKJHmFY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 62209e805b5c68577602a5803a71d8e2e11ee0d3  pinctrl: qcom: sm8350: Correct UFS and SDC offsets

elapsed time: 722m

configs tested: 169
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211116
riscv                            allyesconfig
mips                             allyesconfig
um                             i386_defconfig
mips                             allmodconfig
riscv                            allmodconfig
um                           x86_64_defconfig
m68k                             allmodconfig
m68k                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
nios2                            allyesconfig
m68k                             alldefconfig
powerpc                 linkstation_defconfig
ia64                                defconfig
mips                         db1xxx_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                        cell_defconfig
powerpc                      ep88xc_defconfig
mips                      pic32mzda_defconfig
powerpc                     rainier_defconfig
arm                         lubbock_defconfig
sh                             shx3_defconfig
sh                          lboxre2_defconfig
arc                          axs101_defconfig
sh                          rsk7269_defconfig
arm                        shmobile_defconfig
openrisc                 simple_smp_defconfig
arm                        spear3xx_defconfig
arm                          imote2_defconfig
mips                            ar7_defconfig
powerpc                      arches_defconfig
m68k                            mac_defconfig
powerpc                     tqm8560_defconfig
m68k                          multi_defconfig
sh                               j2_defconfig
powerpc                      ppc6xx_defconfig
mips                          ath25_defconfig
sh                         ecovec24_defconfig
sh                      rts7751r2d1_defconfig
mips                           gcw0_defconfig
m68k                       m5208evb_defconfig
mips                      bmips_stb_defconfig
powerpc                     ppa8548_defconfig
arm                        clps711x_defconfig
arm                         socfpga_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                           rs90_defconfig
arm                          exynos_defconfig
arm                         cm_x300_defconfig
arm                       cns3420vb_defconfig
sparc                       sparc64_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                    klondike_defconfig
m68k                          amiga_defconfig
arm                       versatile_defconfig
m68k                        mvme147_defconfig
arm                          badge4_defconfig
sh                           sh2007_defconfig
powerpc                     ksi8560_defconfig
powerpc                     kilauea_defconfig
arm                         hackkit_defconfig
arm                            qcom_defconfig
sh                          r7780mp_defconfig
xtensa                       common_defconfig
sh                            migor_defconfig
arm                         orion5x_defconfig
arm                      tct_hammer_defconfig
sh                          sdk7780_defconfig
powerpc                      cm5200_defconfig
powerpc                   microwatt_defconfig
mips                       bmips_be_defconfig
um                               alldefconfig
sh                          rsk7203_defconfig
m68k                        m5407c3_defconfig
mips                           xway_defconfig
riscv                             allnoconfig
arm                  colibri_pxa270_defconfig
mips                      malta_kvm_defconfig
sparc                               defconfig
s390                             alldefconfig
s390                                defconfig
sh                           se7343_defconfig
powerpc                    ge_imp3a_defconfig
sh                        sh7763rdp_defconfig
mips                         mpc30x_defconfig
sh                     sh7710voipgw_defconfig
nds32                            alldefconfig
m68k                       bvme6000_defconfig
xtensa                  audio_kc705_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                            e55_defconfig
arm                         bcm2835_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                        mini2440_defconfig
um                                  defconfig
arm                  randconfig-c002-20211116
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a015-20211116
x86_64               randconfig-a013-20211116
x86_64               randconfig-a012-20211116
x86_64               randconfig-a011-20211116
x86_64               randconfig-a016-20211116
x86_64               randconfig-a014-20211116
i386                 randconfig-a014-20211116
i386                 randconfig-a016-20211116
i386                 randconfig-a012-20211116
i386                 randconfig-a013-20211116
i386                 randconfig-a011-20211116
i386                 randconfig-a015-20211116
arc                  randconfig-r043-20211116
s390                 randconfig-r044-20211116
riscv                randconfig-r042-20211116
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-c007-20211116
i386                 randconfig-c001-20211116
arm                  randconfig-c002-20211116
riscv                randconfig-c006-20211116
powerpc              randconfig-c003-20211116
s390                 randconfig-c005-20211116
mips                 randconfig-c004-20211116
x86_64               randconfig-a005-20211116
x86_64               randconfig-a003-20211116
x86_64               randconfig-a001-20211116
x86_64               randconfig-a002-20211116
x86_64               randconfig-a006-20211116
x86_64               randconfig-a004-20211116
i386                 randconfig-a006-20211116
i386                 randconfig-a003-20211116
i386                 randconfig-a005-20211116
i386                 randconfig-a001-20211116
i386                 randconfig-a004-20211116
i386                 randconfig-a002-20211116
hexagon              randconfig-r045-20211116
hexagon              randconfig-r041-20211116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
