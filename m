Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4CD2FAF7A
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 05:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732068AbhASEcL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 23:32:11 -0500
Received: from mga11.intel.com ([192.55.52.93]:43228 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731364AbhASEao (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Jan 2021 23:30:44 -0500
IronPort-SDR: MGEsCFSiTsPv1lfwTsDI2mtcFsd/KQjNsG8FOEBOPJBUNJjinrWeIl3KLF+gr2ukxaW4qBLgPv
 JVO2hBjL3AZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="175373054"
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="175373054"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 20:29:51 -0800
IronPort-SDR: XOiAIRKrqTAQDZ5xucKI1UDj4pejVeW0lNdAdVO9bQmYx9mEeGol5kphgVaYUagc6AJxaZsgMe
 R7muPY4/qoaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="383788651"
Received: from lkp-server01.sh.intel.com (HELO 260eafd5ecd0) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 18 Jan 2021 20:29:49 -0800
Received: from kbuild by 260eafd5ecd0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l1ieL-0004iZ-5M; Tue, 19 Jan 2021 04:29:49 +0000
Date:   Tue, 19 Jan 2021 12:28:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 cf9d052aa6005f1e8dfaf491d83bf37f368af69e
Message-ID: <6006600b.dnPF1berLgshSpt/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: cf9d052aa6005f1e8dfaf491d83bf37f368af69e  pinctrl: qcom: Don't clear pending interrupts when enabling

elapsed time: 720m

configs tested: 129
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                 kfr2r09-romimage_defconfig
sparc64                             defconfig
arm                          pxa910_defconfig
sparc                            allyesconfig
powerpc                    amigaone_defconfig
arm                           tegra_defconfig
arm                          collie_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                      tqm8xx_defconfig
sh                          polaris_defconfig
s390                             allyesconfig
m68k                        mvme147_defconfig
arm                          tango4_defconfig
powerpc                  iss476-smp_defconfig
powerpc                      ep88xc_defconfig
powerpc                      mgcoge_defconfig
arm                            xcep_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                         nhk8815_defconfig
s390                       zfcpdump_defconfig
h8300                     edosk2674_defconfig
mips                     decstation_defconfig
mips                malta_qemu_32r6_defconfig
arm                         s3c2410_defconfig
sh                              ul2_defconfig
m68k                          multi_defconfig
openrisc                         alldefconfig
mips                           xway_defconfig
sparc                       sparc32_defconfig
mips                       lemote2f_defconfig
arm                          imote2_defconfig
powerpc                      pcm030_defconfig
sh                   sh7724_generic_defconfig
xtensa                    smp_lx200_defconfig
arm                             ezx_defconfig
arm                           viper_defconfig
arm                            zeus_defconfig
mips                      bmips_stb_defconfig
arm                            hisi_defconfig
arm                     am200epdkit_defconfig
arm                         vf610m4_defconfig
mips                          rm200_defconfig
arm                        magician_defconfig
h8300                               defconfig
openrisc                 simple_smp_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                      tct_hammer_defconfig
mips                           jazz_defconfig
powerpc                     skiroot_defconfig
xtensa                generic_kc705_defconfig
powerpc                     tqm5200_defconfig
m68k                         amcore_defconfig
xtensa                       common_defconfig
sh                            hp6xx_defconfig
i386                             alldefconfig
m68k                            q40_defconfig
powerpc                 mpc8560_ads_defconfig
csky                                defconfig
mips                    maltaup_xpa_defconfig
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
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
sparc                               defconfig
i386                               tinyconfig
i386                             allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20210118
i386                 randconfig-a001-20210118
x86_64               randconfig-a015-20210118
x86_64               randconfig-a013-20210118
x86_64               randconfig-a012-20210118
x86_64               randconfig-a016-20210118
x86_64               randconfig-a011-20210118
x86_64               randconfig-a014-20210118
i386                 randconfig-a011-20210118
i386                 randconfig-a012-20210118
i386                 randconfig-a016-20210118
i386                 randconfig-a015-20210118
i386                 randconfig-a013-20210118
i386                 randconfig-a014-20210118
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
x86_64               randconfig-a004-20210118
x86_64               randconfig-a006-20210118
x86_64               randconfig-a001-20210118
x86_64               randconfig-a003-20210118
x86_64               randconfig-a005-20210118
x86_64               randconfig-a002-20210118

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
