Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D936527DE2E
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 03:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729690AbgI3B6l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 21:58:41 -0400
Received: from mga02.intel.com ([134.134.136.20]:20721 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729395AbgI3B6l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Sep 2020 21:58:41 -0400
IronPort-SDR: HzOMvyGOsB1ctEV9nBK4kzQCCML9rUAHIqbiCpVjuWJwOwflUwbYJnMpQAsMAQNbKnFID3eXBw
 9lePM0rtKiCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="149990603"
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; 
   d="scan'208";a="149990603"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 18:58:39 -0700
IronPort-SDR: 6MCnFvAfkWnLMxAOtKT5bHVlf2XmYqpD4DkU9+ayG4K28uS3NUS8s97ovgtwbxT7UdJnHYkPv7
 IMWam985d0HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; 
   d="scan'208";a="307991215"
Received: from lkp-server02.sh.intel.com (HELO de448af6ea1b) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 29 Sep 2020 18:58:37 -0700
Received: from kbuild by de448af6ea1b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kNRO9-00000b-0u; Wed, 30 Sep 2020 01:58:37 +0000
Date:   Wed, 30 Sep 2020 09:57:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:fixes] BUILD SUCCESS
 2e969d8a7f9903e8d015885bdfd031a6809a4d02
Message-ID: <5f73e611.0N4mR3zLQJ8I2Dmf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  fixes
branch HEAD: 2e969d8a7f9903e8d015885bdfd031a6809a4d02  Merge tag 'gpio-fixes-for-v5.9-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into fixes

elapsed time: 726m

configs tested: 146
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
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
sh                           se7722_defconfig
sh                         ap325rxa_defconfig
powerpc                     redwood_defconfig
sh                          r7785rp_defconfig
powerpc                        fsp2_defconfig
mips                           ip32_defconfig
xtensa                         virt_defconfig
powerpc                   bluestone_defconfig
arm                         s5pv210_defconfig
m68k                        mvme147_defconfig
arm                        mvebu_v5_defconfig
arc                           tb10x_defconfig
powerpc                      ppc40x_defconfig
arm                            zeus_defconfig
arm                     davinci_all_defconfig
openrisc                            defconfig
arc                          axs103_defconfig
arm                        spear6xx_defconfig
arm                       imx_v6_v7_defconfig
powerpc                      ppc64e_defconfig
powerpc                 mpc837x_mds_defconfig
microblaze                          defconfig
arm                         cm_x300_defconfig
powerpc                      mgcoge_defconfig
mips                         tb0226_defconfig
h8300                               defconfig
powerpc                     mpc512x_defconfig
arm                        oxnas_v6_defconfig
xtensa                           allyesconfig
mips                          rm200_defconfig
m68k                       m5249evb_defconfig
arc                    vdk_hs38_smp_defconfig
mips                        maltaup_defconfig
arm                       versatile_defconfig
s390                       zfcpdump_defconfig
powerpc                      ep88xc_defconfig
sh                         apsh4a3a_defconfig
arm                            u300_defconfig
arc                        vdk_hs38_defconfig
mips                             allmodconfig
arm                      pxa255-idp_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                          simpad_defconfig
sh                        edosk7705_defconfig
powerpc                 mpc837x_rdb_defconfig
c6x                        evmc6457_defconfig
arm                      tct_hammer_defconfig
arm                         s3c6400_defconfig
arm                           sama5_defconfig
powerpc                    mvme5100_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                       multi_v4t_defconfig
sh                             shx3_defconfig
mips                   sb1250_swarm_defconfig
sh                   sh7770_generic_defconfig
arm                          ep93xx_defconfig
arm                           h5000_defconfig
sh                           se7780_defconfig
csky                                defconfig
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
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
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
