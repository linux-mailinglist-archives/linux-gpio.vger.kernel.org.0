Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2A2427DE30
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 03:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729717AbgI3B6m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 21:58:42 -0400
Received: from mga06.intel.com ([134.134.136.31]:25747 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729643AbgI3B6m (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Sep 2020 21:58:42 -0400
IronPort-SDR: NEjgnScvXKLndqyHNpzdY5dwa2TWil58cNu5A8exrYVOTw7vYniyNogN6ppLd3JTwflSbhFGNa
 joCjs3tVVknQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="223933991"
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; 
   d="scan'208";a="223933991"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 18:58:38 -0700
IronPort-SDR: 9Q0kD0I6/YKfIDz5qAgqJbidQLDuGrGHHOsmQZM/sJAkGirKHXdZTT7VuDkovaiNOB+XcWPDe5
 KbINX7Pg6b1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; 
   d="scan'208";a="415581416"
Received: from lkp-server02.sh.intel.com (HELO de448af6ea1b) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 29 Sep 2020 18:58:37 -0700
Received: from kbuild by de448af6ea1b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kNRO9-00000W-08; Wed, 30 Sep 2020 01:58:37 +0000
Date:   Wed, 30 Sep 2020 09:57:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 8947391f77c8eb55a9430c5791b50cdf1ada285f
Message-ID: <5f73e613.c/4mkA41oZyyJsHm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  fixes
branch HEAD: 8947391f77c8eb55a9430c5791b50cdf1ada285f  pinctrl: qcom: sm8250: correct sdc2_clk

elapsed time: 726m

configs tested: 154
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
h8300                     edosk2674_defconfig
arm                        mvebu_v5_defconfig
mips                        maltaup_defconfig
arm                         assabet_defconfig
powerpc                 xes_mpc85xx_defconfig
arc                      axs103_smp_defconfig
arc                         haps_hs_defconfig
riscv                               defconfig
parisc                           allyesconfig
arm                         orion5x_defconfig
mips                         tb0219_defconfig
mips                         bigsur_defconfig
arc                             nps_defconfig
h8300                            alldefconfig
sh                            hp6xx_defconfig
ia64                        generic_defconfig
mips                       rbtx49xx_defconfig
powerpc                      pmac32_defconfig
powerpc64                        alldefconfig
sh                        sh7785lcr_defconfig
xtensa                         virt_defconfig
powerpc                   bluestone_defconfig
arm                         s5pv210_defconfig
m68k                        mvme147_defconfig
arc                           tb10x_defconfig
powerpc                      ppc40x_defconfig
arm                            zeus_defconfig
arm                     davinci_all_defconfig
openrisc                            defconfig
arc                          axs103_defconfig
powerpc                    amigaone_defconfig
sh                           se7751_defconfig
mips                      malta_kvm_defconfig
powerpc                     rainier_defconfig
arm                           efm32_defconfig
arm                      tct_hammer_defconfig
powerpc                        icon_defconfig
sh                         ap325rxa_defconfig
arm                        spear6xx_defconfig
arm                       imx_v6_v7_defconfig
powerpc                      ppc64e_defconfig
powerpc                 mpc837x_mds_defconfig
microblaze                          defconfig
xtensa                           allyesconfig
mips                          rm200_defconfig
m68k                       m5249evb_defconfig
arc                    vdk_hs38_smp_defconfig
arm                       versatile_defconfig
sh                          sdk7786_defconfig
mips                        omega2p_defconfig
arm                        cerfcube_defconfig
sh                           se7343_defconfig
sh                           se7721_defconfig
s390                       zfcpdump_defconfig
powerpc                      ep88xc_defconfig
sh                         apsh4a3a_defconfig
s390                             allyesconfig
arm                            u300_defconfig
sh                   sh7724_generic_defconfig
powerpc                     tqm8555_defconfig
sh                            shmin_defconfig
xtensa                  cadence_csp_defconfig
arc                        vdk_hs38_defconfig
arm                      pxa255-idp_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                          simpad_defconfig
sh                        edosk7705_defconfig
powerpc                 mpc837x_rdb_defconfig
c6x                        evmc6457_defconfig
arm                         s3c6400_defconfig
arm                           sama5_defconfig
powerpc                    mvme5100_defconfig
powerpc                        fsp2_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                       multi_v4t_defconfig
sh                             shx3_defconfig
mips                   sb1250_swarm_defconfig
sh                      rts7751r2d1_defconfig
alpha                            alldefconfig
m68k                            q40_defconfig
sh                           se7712_defconfig
mips                     loongson1c_defconfig
um                           x86_64_defconfig
arm                        multi_v7_defconfig
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
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
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
i386                 randconfig-a006-20200929
i386                 randconfig-a002-20200929
i386                 randconfig-a003-20200929
i386                 randconfig-a004-20200929
i386                 randconfig-a005-20200929
i386                 randconfig-a001-20200929
x86_64               randconfig-a011-20200929
x86_64               randconfig-a013-20200929
x86_64               randconfig-a015-20200929
x86_64               randconfig-a014-20200929
x86_64               randconfig-a016-20200929
x86_64               randconfig-a012-20200929
i386                 randconfig-a012-20200929
i386                 randconfig-a016-20200929
i386                 randconfig-a014-20200929
i386                 randconfig-a013-20200929
i386                 randconfig-a015-20200929
i386                 randconfig-a011-20200929
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
x86_64               randconfig-a005-20200929
x86_64               randconfig-a003-20200929
x86_64               randconfig-a004-20200929
x86_64               randconfig-a002-20200929
x86_64               randconfig-a006-20200929
x86_64               randconfig-a001-20200929

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
