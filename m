Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB5245FEB2
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Nov 2021 13:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237071AbhK0NAH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Nov 2021 08:00:07 -0500
Received: from mga14.intel.com ([192.55.52.115]:54451 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230513AbhK0M6H (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 27 Nov 2021 07:58:07 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="235997059"
X-IronPort-AV: E=Sophos;i="5.87,269,1631602800"; 
   d="scan'208";a="235997059"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2021 04:54:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,269,1631602800"; 
   d="scan'208";a="498732046"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 27 Nov 2021 04:54:51 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mqxEA-0009Wo-I1; Sat, 27 Nov 2021 12:54:50 +0000
Date:   Sat, 27 Nov 2021 20:53:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 72f902d8b1870dd0c7824f0e7ce2915d564ca802
Message-ID: <61a22a5f.8LqcIbZ8ZU9koSKW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 72f902d8b1870dd0c7824f0e7ce2915d564ca802  Revert "dt-bindings: pinctrl: qcom: Add SDX65 pinctrl bindings"

elapsed time: 725m

configs tested: 130
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211126
powerpc              randconfig-c003-20211126
mips                 randconfig-c004-20211126
arm                            zeus_defconfig
arm                  colibri_pxa300_defconfig
arm                         lpc32xx_defconfig
ia64                             allyesconfig
s390                       zfcpdump_defconfig
arm                       omap2plus_defconfig
powerpc                    adder875_defconfig
arm                            dove_defconfig
m68k                        m5272c3_defconfig
arm                        spear3xx_defconfig
sh                        edosk7760_defconfig
powerpc                 mpc8560_ads_defconfig
m68k                          sun3x_defconfig
parisc                generic-32bit_defconfig
arm                          ep93xx_defconfig
arm                          simpad_defconfig
sh                           se7705_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                          g5_defconfig
arm                        mvebu_v5_defconfig
arm                            hisi_defconfig
s390                          debug_defconfig
h8300                     edosk2674_defconfig
m68k                         apollo_defconfig
sh                               j2_defconfig
sh                               allmodconfig
powerpc                     mpc5200_defconfig
sh                           se7722_defconfig
sh                          sdk7780_defconfig
arm                          pcm027_defconfig
powerpc                    gamecube_defconfig
sh                          kfr2r09_defconfig
arm                            lart_defconfig
powerpc                     ep8248e_defconfig
arm                       cns3420vb_defconfig
arm                         mv78xx0_defconfig
sh                 kfr2r09-romimage_defconfig
arm                     eseries_pxa_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                           sh2007_defconfig
arm                  randconfig-c002-20211126
ia64                             allmodconfig
ia64                                defconfig
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
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a014-20211126
x86_64               randconfig-a011-20211126
x86_64               randconfig-a012-20211126
x86_64               randconfig-a016-20211126
x86_64               randconfig-a013-20211126
x86_64               randconfig-a015-20211126
i386                 randconfig-a016-20211126
i386                 randconfig-a015-20211126
i386                 randconfig-a012-20211126
i386                 randconfig-a013-20211126
i386                 randconfig-a014-20211126
i386                 randconfig-a011-20211126
arc                  randconfig-r043-20211126
s390                 randconfig-r044-20211126
riscv                randconfig-r042-20211126
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20211126
i386                 randconfig-c001-20211126
powerpc              randconfig-c003-20211126
riscv                randconfig-c006-20211126
arm                  randconfig-c002-20211126
x86_64               randconfig-c007-20211126
mips                 randconfig-c004-20211126
x86_64               randconfig-a001-20211126
x86_64               randconfig-a003-20211126
x86_64               randconfig-a006-20211126
x86_64               randconfig-a004-20211126
x86_64               randconfig-a005-20211126
x86_64               randconfig-a002-20211126
i386                 randconfig-a002-20211126
i386                 randconfig-a001-20211126
i386                 randconfig-a005-20211126
i386                 randconfig-a006-20211126
i386                 randconfig-a004-20211126
i386                 randconfig-a003-20211126
hexagon              randconfig-r045-20211127
s390                 randconfig-r044-20211127
hexagon              randconfig-r041-20211127
riscv                randconfig-r042-20211127

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
