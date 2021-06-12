Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69E8A3A5117
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Jun 2021 00:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbhFLWI0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Jun 2021 18:08:26 -0400
Received: from mga05.intel.com ([192.55.52.43]:34836 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229985AbhFLWI0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 12 Jun 2021 18:08:26 -0400
IronPort-SDR: lt2y7g79nZejug+jaK+7YS+XvpelkFqRCS0iou19+DhQcTiplk2Q58R92Hb7T4vyQUcYztkODi
 eaLT3jAlFP8A==
X-IronPort-AV: E=McAfee;i="6200,9189,10013"; a="291314641"
X-IronPort-AV: E=Sophos;i="5.83,268,1616482800"; 
   d="scan'208";a="291314641"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2021 15:06:26 -0700
IronPort-SDR: QqbYhS2iLBOLmv4PI8U4lUWaeT2cdW6C4hI77VWXZtNmrjNczuUm2RfjjZKy0qzbacBlLMxybB
 hAdoyLsQGvPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,268,1616482800"; 
   d="scan'208";a="553740542"
Received: from lkp-server02.sh.intel.com (HELO 3cb98b298c7e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2021 15:06:25 -0700
Received: from kbuild by 3cb98b298c7e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lsBlq-00015W-2P; Sat, 12 Jun 2021 22:06:26 +0000
Date:   Sun, 13 Jun 2021 06:06:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 2f792ec782092ae3287351d5d9a2b4f77406e533
Message-ID: <60c52fcd.uZM0dulTSvq/SbwN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 2f792ec782092ae3287351d5d9a2b4f77406e533  Merge tag 'renesas-pinctrl-for-v5.14-tag2' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into devel

elapsed time: 721m

configs tested: 131
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          landisk_defconfig
powerpc                     redwood_defconfig
arc                           tb10x_defconfig
h8300                    h8300h-sim_defconfig
powerpc                     sequoia_defconfig
powerpc                      acadia_defconfig
arm                      jornada720_defconfig
arm                         bcm2835_defconfig
arm                           sama5_defconfig
arm64                            alldefconfig
ia64                          tiger_defconfig
m68k                         amcore_defconfig
microblaze                      mmu_defconfig
mips                  maltasmvp_eva_defconfig
mips                malta_qemu_32r6_defconfig
mips                      loongson3_defconfig
powerpc                     kmeter1_defconfig
mips                           ci20_defconfig
arc                          axs103_defconfig
arm                             mxs_defconfig
sh                        sh7763rdp_defconfig
sh                          r7785rp_defconfig
arm                            mmp2_defconfig
powerpc                       eiger_defconfig
um                                  defconfig
arm                  colibri_pxa300_defconfig
m68k                       m5249evb_defconfig
powerpc                          g5_defconfig
mips                           rs90_defconfig
arm                            mps2_defconfig
powerpc                    ge_imp3a_defconfig
mips                        omega2p_defconfig
mips                        bcm47xx_defconfig
xtensa                       common_defconfig
sh                        dreamcast_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20210613
i386                 randconfig-a006-20210613
i386                 randconfig-a001-20210613
i386                 randconfig-a004-20210613
i386                 randconfig-a005-20210613
i386                 randconfig-a003-20210613
i386                 randconfig-a002-20210612
i386                 randconfig-a006-20210612
i386                 randconfig-a001-20210612
i386                 randconfig-a004-20210612
i386                 randconfig-a005-20210612
i386                 randconfig-a003-20210612
x86_64               randconfig-a015-20210612
x86_64               randconfig-a011-20210612
x86_64               randconfig-a014-20210612
x86_64               randconfig-a012-20210612
x86_64               randconfig-a013-20210612
x86_64               randconfig-a016-20210612
i386                 randconfig-a015-20210612
i386                 randconfig-a013-20210612
i386                 randconfig-a016-20210612
i386                 randconfig-a014-20210612
i386                 randconfig-a012-20210612
i386                 randconfig-a011-20210612
i386                 randconfig-a015-20210613
i386                 randconfig-a013-20210613
i386                 randconfig-a016-20210613
i386                 randconfig-a014-20210613
i386                 randconfig-a012-20210613
i386                 randconfig-a011-20210613
x86_64               randconfig-a002-20210613
x86_64               randconfig-a004-20210613
x86_64               randconfig-a001-20210613
x86_64               randconfig-a003-20210613
x86_64               randconfig-a006-20210613
x86_64               randconfig-a005-20210613
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210612
x86_64               randconfig-a004-20210612
x86_64               randconfig-a001-20210612
x86_64               randconfig-a003-20210612
x86_64               randconfig-a006-20210612
x86_64               randconfig-a005-20210612

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
