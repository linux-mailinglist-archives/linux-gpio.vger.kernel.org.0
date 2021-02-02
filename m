Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2008B30B90D
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Feb 2021 09:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbhBBH7V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Feb 2021 02:59:21 -0500
Received: from mga06.intel.com ([134.134.136.31]:48415 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229554AbhBBH7V (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Feb 2021 02:59:21 -0500
IronPort-SDR: PfT01BHsTwBL4XSZUCDzlaHXSkRZZXBW8ty6C75ikRym5TbewprNPJOZxeDv5mTqH682y5c8zi
 dIS42PS6rCdw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="242330924"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="242330924"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 23:58:38 -0800
IronPort-SDR: ocm0O5bAf3V2mPASzHpu2o2tA65btC//iUbjQBLWY/1/EPzDWerpwV5T4xQYHo3wpvmhnnFzsc
 /c947+CY9EMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="391337606"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 01 Feb 2021 23:58:37 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l6qa4-0009CR-Iy; Tue, 02 Feb 2021 07:58:36 +0000
Date:   Tue, 02 Feb 2021 15:57:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 d3e0c0572caf3a26f5d4ef4e0cbd577b9b6f94ff
Message-ID: <60190605.7VmuQrpLpLNinA6Y%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: d3e0c0572caf3a26f5d4ef4e0cbd577b9b6f94ff  Merge branch 'devel' into for-next

elapsed time: 726m

configs tested: 143
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                            q40_defconfig
powerpc                  storcenter_defconfig
arm                           h5000_defconfig
sh                           se7619_defconfig
mips                  cavium_octeon_defconfig
mips                         db1xxx_defconfig
arm                         assabet_defconfig
h8300                    h8300h-sim_defconfig
arc                      axs103_smp_defconfig
powerpc                      walnut_defconfig
m68k                        mvme147_defconfig
sh                           sh2007_defconfig
ia64                             alldefconfig
sh                      rts7751r2d1_defconfig
powerpc                    amigaone_defconfig
sh                          r7780mp_defconfig
mips                            ar7_defconfig
arm                         s5pv210_defconfig
arm                             ezx_defconfig
xtensa                           allyesconfig
powerpc                      katmai_defconfig
powerpc                         wii_defconfig
mips                           ip32_defconfig
mips                          ath25_defconfig
xtensa                  cadence_csp_defconfig
powerpc                       maple_defconfig
arm                         at91_dt_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                      ppc64e_defconfig
mips                           ip27_defconfig
mips                         bigsur_defconfig
powerpc                       eiger_defconfig
mips                           ip22_defconfig
arm                          imote2_defconfig
arm                        clps711x_defconfig
powerpc                     tqm8555_defconfig
arm                       multi_v4t_defconfig
powerpc                     skiroot_defconfig
s390                       zfcpdump_defconfig
arm                          gemini_defconfig
alpha                            alldefconfig
mips                        omega2p_defconfig
mips                      bmips_stb_defconfig
xtensa                  audio_kc705_defconfig
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
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
powerpc                           allnoconfig
i386                 randconfig-a001-20210202
i386                 randconfig-a005-20210202
i386                 randconfig-a003-20210202
i386                 randconfig-a006-20210202
i386                 randconfig-a002-20210202
i386                 randconfig-a004-20210202
i386                 randconfig-a001-20210201
i386                 randconfig-a005-20210201
i386                 randconfig-a003-20210201
i386                 randconfig-a006-20210201
i386                 randconfig-a002-20210201
i386                 randconfig-a004-20210201
x86_64               randconfig-a013-20210202
x86_64               randconfig-a014-20210202
x86_64               randconfig-a015-20210202
x86_64               randconfig-a016-20210202
x86_64               randconfig-a011-20210202
x86_64               randconfig-a012-20210202
x86_64               randconfig-a006-20210201
x86_64               randconfig-a001-20210201
x86_64               randconfig-a005-20210201
x86_64               randconfig-a002-20210201
x86_64               randconfig-a004-20210201
x86_64               randconfig-a003-20210201
i386                 randconfig-a013-20210202
i386                 randconfig-a016-20210202
i386                 randconfig-a014-20210202
i386                 randconfig-a012-20210202
i386                 randconfig-a015-20210202
i386                 randconfig-a011-20210202
i386                 randconfig-a013-20210201
i386                 randconfig-a016-20210201
i386                 randconfig-a014-20210201
i386                 randconfig-a012-20210201
i386                 randconfig-a015-20210201
i386                 randconfig-a011-20210201
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210202
x86_64               randconfig-a001-20210202
x86_64               randconfig-a005-20210202
x86_64               randconfig-a002-20210202
x86_64               randconfig-a004-20210202
x86_64               randconfig-a003-20210202
x86_64               randconfig-a013-20210201
x86_64               randconfig-a014-20210201
x86_64               randconfig-a015-20210201
x86_64               randconfig-a016-20210201
x86_64               randconfig-a011-20210201
x86_64               randconfig-a012-20210201

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
