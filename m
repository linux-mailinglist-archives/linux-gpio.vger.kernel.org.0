Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471C74316E4
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 13:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbhJRLLg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 07:11:36 -0400
Received: from mga09.intel.com ([134.134.136.24]:40335 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229870AbhJRLLb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Oct 2021 07:11:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="228104435"
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; 
   d="scan'208";a="228104435"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 04:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; 
   d="scan'208";a="444014919"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 18 Oct 2021 04:09:16 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mcQW3-000BGP-R0; Mon, 18 Oct 2021 11:09:15 +0000
Date:   Mon, 18 Oct 2021 19:08:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 664bad61ccdec3b3b751da79f9c0449e1af005ed
Message-ID: <616d55b2.1dEYcEtEbXCRdhRR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 664bad61ccdec3b3b751da79f9c0449e1af005ed  Merge branch 'devel' into for-next

elapsed time: 721m

configs tested: 168
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sparc                            allyesconfig
mips                         tb0287_defconfig
s390                          debug_defconfig
mips                      bmips_stb_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                    klondike_defconfig
powerpc                 mpc8560_ads_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                         orion5x_defconfig
powerpc                  iss476-smp_defconfig
arm                           h5000_defconfig
arm                       multi_v4t_defconfig
arm                        multi_v7_defconfig
sh                        edosk7705_defconfig
arc                          axs103_defconfig
arm                       imx_v4_v5_defconfig
sh                          rsk7264_defconfig
arm                            mmp2_defconfig
m68k                         amcore_defconfig
sparc64                          alldefconfig
xtensa                  nommu_kc705_defconfig
xtensa                         virt_defconfig
powerpc                      obs600_defconfig
mips                        qi_lb60_defconfig
mips                    maltaup_xpa_defconfig
mips                      maltasmvp_defconfig
x86_64                           allyesconfig
powerpc                    socrates_defconfig
arm                      tct_hammer_defconfig
m68k                        mvme16x_defconfig
powerpc                 mpc837x_mds_defconfig
m68k                          atari_defconfig
mips                       capcella_defconfig
arm                       imx_v6_v7_defconfig
xtensa                  audio_kc705_defconfig
s390                                defconfig
nios2                         3c120_defconfig
mips                malta_qemu_32r6_defconfig
arc                    vdk_hs38_smp_defconfig
arm                            hisi_defconfig
arc                           tb10x_defconfig
ia64                                defconfig
powerpc                     rainier_defconfig
powerpc                       holly_defconfig
mips                        nlm_xlr_defconfig
powerpc                     ksi8560_defconfig
arm                          pxa910_defconfig
s390                       zfcpdump_defconfig
mips                     loongson2k_defconfig
mips                      malta_kvm_defconfig
arm                           stm32_defconfig
powerpc                     mpc5200_defconfig
arm                         cm_x300_defconfig
powerpc                   currituck_defconfig
powerpc                        icon_defconfig
powerpc                      tqm8xx_defconfig
mips                         bigsur_defconfig
arm                         shannon_defconfig
nios2                         10m50_defconfig
sh                            titan_defconfig
powerpc                 mpc834x_mds_defconfig
m68k                          multi_defconfig
powerpc                      ep88xc_defconfig
sh                        edosk7760_defconfig
sh                        sh7763rdp_defconfig
arm                           u8500_defconfig
arm                       mainstone_defconfig
sh                          r7785rp_defconfig
powerpc                     kmeter1_defconfig
arm                        clps711x_defconfig
powerpc                      pcm030_defconfig
arm                           corgi_defconfig
arm                          gemini_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                  randconfig-c002-20211017
i386                 randconfig-c001-20211017
x86_64               randconfig-c001-20211017
arm                  randconfig-c002-20211018
i386                 randconfig-c001-20211018
x86_64               randconfig-c001-20211018
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                              allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20211018
x86_64               randconfig-a006-20211018
x86_64               randconfig-a005-20211018
x86_64               randconfig-a001-20211018
x86_64               randconfig-a002-20211018
x86_64               randconfig-a003-20211018
i386                 randconfig-a001-20211018
i386                 randconfig-a003-20211018
i386                 randconfig-a004-20211018
i386                 randconfig-a005-20211018
i386                 randconfig-a002-20211018
i386                 randconfig-a006-20211018
x86_64               randconfig-a012-20211017
x86_64               randconfig-a015-20211017
x86_64               randconfig-a016-20211017
x86_64               randconfig-a014-20211017
x86_64               randconfig-a011-20211017
x86_64               randconfig-a013-20211017
arc                  randconfig-r043-20211018
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
i386                 randconfig-a003-20211017
i386                 randconfig-a001-20211017
i386                 randconfig-a005-20211017
i386                 randconfig-a004-20211017
i386                 randconfig-a002-20211017
i386                 randconfig-a006-20211017
x86_64               randconfig-a015-20211018
x86_64               randconfig-a012-20211018
x86_64               randconfig-a016-20211018
x86_64               randconfig-a014-20211018
x86_64               randconfig-a013-20211018
x86_64               randconfig-a011-20211018
i386                 randconfig-a014-20211018
i386                 randconfig-a016-20211018
i386                 randconfig-a011-20211018
i386                 randconfig-a015-20211018
i386                 randconfig-a012-20211018
i386                 randconfig-a013-20211018
hexagon              randconfig-r041-20211018
s390                 randconfig-r044-20211018
riscv                randconfig-r042-20211018
hexagon              randconfig-r045-20211018

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
