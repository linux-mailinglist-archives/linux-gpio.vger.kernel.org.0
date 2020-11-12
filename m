Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 949392AFE54
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 06:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbgKLFhK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 00:37:10 -0500
Received: from mga14.intel.com ([192.55.52.115]:7788 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729028AbgKLEpe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 23:45:34 -0500
IronPort-SDR: HP5+9THCdAYh2kHfnNEPgrv/y1UtsAUxOzE6Rd0SHTGgBbf7l5G7u7dlfpFvpFZhIq5BFxEg1t
 SnOLM4+x7UAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="169473431"
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="169473431"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 20:45:33 -0800
IronPort-SDR: AUetnB+tPSOw0M2A2eUGpxI6NhwwUYCPpx6H6tIRVUlAM7hqhH4LOO2xgTnxZd7YRBa7odf3ly
 lClfozXF9aWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="355078452"
Received: from lkp-server02.sh.intel.com (HELO de5c6a867800) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 11 Nov 2020 20:45:32 -0800
Received: from kbuild by de5c6a867800 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kd4UG-00005X-1Q; Thu, 12 Nov 2020 04:45:32 +0000
Date:   Thu, 12 Nov 2020 12:44:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:for-next] BUILD SUCCESS
 27b5ea2fcb90d2dbc3be03e3a171bc28117eef14
Message-ID: <5facbdc5.FqqBkx+ez9MY8V/V%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  for-next
branch HEAD: 27b5ea2fcb90d2dbc3be03e3a171bc28117eef14  Merge branch 'devel' into for-next

elapsed time: 724m

configs tested: 136
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                       ebony_defconfig
m68k                          atari_defconfig
mips                        jmr3927_defconfig
sh                           se7206_defconfig
arm                            qcom_defconfig
sh                            titan_defconfig
arm                        mini2440_defconfig
powerpc                     mpc512x_defconfig
sh                          lboxre2_defconfig
powerpc                     mpc5200_defconfig
arm                       aspeed_g4_defconfig
mips                        workpad_defconfig
sh                           se7712_defconfig
um                            kunit_defconfig
m68k                         apollo_defconfig
powerpc                    mvme5100_defconfig
powerpc                   lite5200b_defconfig
arm                       cns3420vb_defconfig
arm                        mvebu_v5_defconfig
csky                             alldefconfig
um                           x86_64_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                         tb0226_defconfig
sh                             shx3_defconfig
i386                                defconfig
powerpc                           allnoconfig
m68k                        m5307c3_defconfig
c6x                                 defconfig
sh                   secureedge5410_defconfig
mips                      pistachio_defconfig
ia64                      gensparse_defconfig
powerpc                     tqm8560_defconfig
arm                       mainstone_defconfig
xtensa                    xip_kc705_defconfig
arm                         at91_dt_defconfig
arc                 nsimosci_hs_smp_defconfig
c6x                        evmc6474_defconfig
powerpc                      makalu_defconfig
riscv                    nommu_k210_defconfig
sh                               allmodconfig
ia64                            zx1_defconfig
xtensa                  nommu_kc705_defconfig
arm                            zeus_defconfig
sh                               alldefconfig
arm                         s3c6400_defconfig
arm                        keystone_defconfig
microblaze                      mmu_defconfig
sh                             sh03_defconfig
sh                         microdev_defconfig
arm                   milbeaut_m10v_defconfig
riscv                            allmodconfig
arm                         nhk8815_defconfig
arm                          moxart_defconfig
powerpc                     ep8248e_defconfig
powerpc                   currituck_defconfig
powerpc                 mpc837x_mds_defconfig
m68k                           sun3_defconfig
sh                           se7705_defconfig
arm                          collie_defconfig
mips                         cobalt_defconfig
arm                      tct_hammer_defconfig
mips                     decstation_defconfig
arm                          ixp4xx_defconfig
m68k                          hp300_defconfig
arm                         socfpga_defconfig
m68k                          sun3x_defconfig
sh                     magicpanelr2_defconfig
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
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a006-20201111
i386                 randconfig-a005-20201111
i386                 randconfig-a002-20201111
i386                 randconfig-a001-20201111
i386                 randconfig-a003-20201111
i386                 randconfig-a004-20201111
x86_64               randconfig-a015-20201111
x86_64               randconfig-a011-20201111
x86_64               randconfig-a014-20201111
x86_64               randconfig-a013-20201111
x86_64               randconfig-a016-20201111
x86_64               randconfig-a012-20201111
i386                 randconfig-a012-20201111
i386                 randconfig-a014-20201111
i386                 randconfig-a016-20201111
i386                 randconfig-a011-20201111
i386                 randconfig-a015-20201111
i386                 randconfig-a013-20201111
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20201111
x86_64               randconfig-a005-20201111
x86_64               randconfig-a004-20201111
x86_64               randconfig-a002-20201111
x86_64               randconfig-a006-20201111
x86_64               randconfig-a001-20201111

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
