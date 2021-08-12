Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2E733E9CE0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 05:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233719AbhHLDZX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 23:25:23 -0400
Received: from mga09.intel.com ([134.134.136.24]:62265 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229729AbhHLDZU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Aug 2021 23:25:20 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="215258039"
X-IronPort-AV: E=Sophos;i="5.84,314,1620716400"; 
   d="scan'208";a="215258039"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 20:24:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,314,1620716400"; 
   d="scan'208";a="507338430"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2021 20:24:54 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mE1Kv-000ML6-Bx; Thu, 12 Aug 2021 03:24:53 +0000
Date:   Thu, 12 Aug 2021 11:24:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 e87078650b2a0a0bdc98d5b5a18e948c0d9fe2dd
Message-ID: <61149482.MTXg+QQEJthS+wPt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: e87078650b2a0a0bdc98d5b5a18e948c0d9fe2dd  pinctrl: amd: Fix an issue with shutdown when system set to s0ix

elapsed time: 727m

configs tested: 149
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210810
i386                 randconfig-c001-20210811
arm                       aspeed_g4_defconfig
arm                         bcm2835_defconfig
m68k                       m5208evb_defconfig
m68k                       bvme6000_defconfig
arm                           h5000_defconfig
h8300                       h8s-sim_defconfig
arm                        clps711x_defconfig
nios2                            alldefconfig
arm                        spear6xx_defconfig
arm                          pxa3xx_defconfig
powerpc                      mgcoge_defconfig
arm                       multi_v4t_defconfig
mips                       lemote2f_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                        qi_lb60_defconfig
mips                        jmr3927_defconfig
sh                   sh7724_generic_defconfig
openrisc                            defconfig
powerpc                     rainier_defconfig
arm                      footbridge_defconfig
arm                             ezx_defconfig
arm                       omap2plus_defconfig
sh                          landisk_defconfig
m68k                        m5307c3_defconfig
sh                               j2_defconfig
alpha                            allyesconfig
powerpc                     tqm5200_defconfig
powerpc                   lite5200b_defconfig
arm                   milbeaut_m10v_defconfig
mips                         cobalt_defconfig
arc                    vdk_hs38_smp_defconfig
sparc64                             defconfig
x86_64                            allnoconfig
powerpc                   currituck_defconfig
nds32                               defconfig
powerpc                     powernv_defconfig
arm                         mv78xx0_defconfig
powerpc                     mpc512x_defconfig
mips                           ip22_defconfig
mips                   sb1250_swarm_defconfig
arm                         nhk8815_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210810
x86_64               randconfig-a006-20210810
x86_64               randconfig-a003-20210810
x86_64               randconfig-a005-20210810
x86_64               randconfig-a002-20210810
x86_64               randconfig-a001-20210810
i386                 randconfig-a004-20210810
i386                 randconfig-a002-20210810
i386                 randconfig-a001-20210810
i386                 randconfig-a003-20210810
i386                 randconfig-a006-20210810
i386                 randconfig-a005-20210810
i386                 randconfig-a004-20210811
i386                 randconfig-a001-20210811
i386                 randconfig-a002-20210811
i386                 randconfig-a003-20210811
i386                 randconfig-a006-20210811
i386                 randconfig-a005-20210811
x86_64               randconfig-a013-20210811
x86_64               randconfig-a011-20210811
x86_64               randconfig-a012-20210811
x86_64               randconfig-a016-20210811
x86_64               randconfig-a014-20210811
x86_64               randconfig-a015-20210811
i386                 randconfig-a011-20210811
i386                 randconfig-a015-20210811
i386                 randconfig-a014-20210811
i386                 randconfig-a013-20210811
i386                 randconfig-a016-20210811
i386                 randconfig-a012-20210811
i386                 randconfig-a011-20210810
i386                 randconfig-a015-20210810
i386                 randconfig-a013-20210810
i386                 randconfig-a014-20210810
i386                 randconfig-a016-20210810
i386                 randconfig-a012-20210810
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210811
x86_64               randconfig-c001-20210810
x86_64               randconfig-a004-20210811
x86_64               randconfig-a006-20210811
x86_64               randconfig-a003-20210811
x86_64               randconfig-a002-20210811
x86_64               randconfig-a005-20210811
x86_64               randconfig-a001-20210811
x86_64               randconfig-a013-20210810
x86_64               randconfig-a011-20210810
x86_64               randconfig-a012-20210810
x86_64               randconfig-a016-20210810
x86_64               randconfig-a014-20210810
x86_64               randconfig-a015-20210810
x86_64               randconfig-a016-20210809
x86_64               randconfig-a012-20210809
x86_64               randconfig-a013-20210809
x86_64               randconfig-a011-20210809
x86_64               randconfig-a014-20210809
x86_64               randconfig-a015-20210809

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
