Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0631F256452
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Aug 2020 05:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgH2DXA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 23:23:00 -0400
Received: from mga03.intel.com ([134.134.136.65]:8321 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726464AbgH2DW6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Aug 2020 23:22:58 -0400
IronPort-SDR: QwW/BQi4ZEiQlHMIZ+ikAJPu5x/QefpJ5+Ue4ffKkuIAZn3Lh463Pg/hBboosMiN3zMYuGU5OG
 Kt0K7et5iX+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="156779503"
X-IronPort-AV: E=Sophos;i="5.76,366,1592895600"; 
   d="scan'208";a="156779503"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 20:22:57 -0700
IronPort-SDR: B9zjqfB7Yhu5sZUNiGScjknmypepiSX4BzLo8czFx6bxeCwzjSLR+JHC2Vy3Pf+E0I1ClSu2CO
 zvKw35ZynggA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,366,1592895600"; 
   d="scan'208";a="500711354"
Received: from lkp-server02.sh.intel.com (HELO 301dc1beeb51) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 28 Aug 2020 20:22:56 -0700
Received: from kbuild by 301dc1beeb51 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kBrSB-0000KC-FZ; Sat, 29 Aug 2020 03:22:55 +0000
Date:   Sat, 29 Aug 2020 11:22:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 ebc2599144b610a7e6e967ee89a769d908a3eeef
Message-ID: <5f49c9e5.BYpiWI/fJazS26UK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  devel
branch HEAD: ebc2599144b610a7e6e967ee89a769d908a3eeef  pinctrl: mcp23s08: Improve error messaging in ->probe()

elapsed time: 720m

configs tested: 118
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                           gcw0_defconfig
nios2                         3c120_defconfig
sh                          sdk7786_defconfig
arm                        multi_v5_defconfig
arm                      integrator_defconfig
mips                        nlm_xlp_defconfig
m68k                             alldefconfig
mips                      malta_kvm_defconfig
sh                   secureedge5410_defconfig
microblaze                    nommu_defconfig
mips                     cu1830-neo_defconfig
arm                              zx_defconfig
arm                         s3c6400_defconfig
arm                        vexpress_defconfig
mips                   sb1250_swarm_defconfig
sh                        edosk7760_defconfig
arm                        realview_defconfig
mips                          rb532_defconfig
ia64                         bigsur_defconfig
arm                           viper_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                     mpc512x_defconfig
sh                   rts7751r2dplus_defconfig
arm64                            alldefconfig
powerpc                          g5_defconfig
arm                          tango4_defconfig
arm                      jornada720_defconfig
sh                           se7780_defconfig
sh                           se7750_defconfig
mips                         bigsur_defconfig
arm                          badge4_defconfig
arm                        spear3xx_defconfig
arm                          gemini_defconfig
m68k                       m5208evb_defconfig
um                             i386_defconfig
arm                           h5000_defconfig
sh                            hp6xx_defconfig
s390                       zfcpdump_defconfig
arc                     haps_hs_smp_defconfig
xtensa                    xip_kc705_defconfig
m68k                       m5275evb_defconfig
arm                             pxa_defconfig
sh                          sdk7780_defconfig
arm                          ixp4xx_defconfig
arm                           sunxi_defconfig
arm                       mainstone_defconfig
mips                     decstation_defconfig
m68k                        stmark2_defconfig
powerpc                         wii_defconfig
arm                            dove_defconfig
m68k                             allyesconfig
sh                ecovec24-romimage_defconfig
m68k                          sun3x_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
powerpc                             defconfig
i386                 randconfig-a002-20200828
i386                 randconfig-a005-20200828
i386                 randconfig-a003-20200828
i386                 randconfig-a004-20200828
i386                 randconfig-a001-20200828
i386                 randconfig-a006-20200828
x86_64               randconfig-a015-20200828
x86_64               randconfig-a012-20200828
x86_64               randconfig-a016-20200828
x86_64               randconfig-a014-20200828
x86_64               randconfig-a011-20200828
x86_64               randconfig-a013-20200828
i386                 randconfig-a013-20200828
i386                 randconfig-a012-20200828
i386                 randconfig-a011-20200828
i386                 randconfig-a016-20200828
i386                 randconfig-a014-20200828
i386                 randconfig-a015-20200828
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
