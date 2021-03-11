Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEC7A337806
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 16:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234177AbhCKPjO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 10:39:14 -0500
Received: from mga04.intel.com ([192.55.52.120]:60581 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234169AbhCKPi6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Mar 2021 10:38:58 -0500
IronPort-SDR: EcC/+lUXm1VqKysetR7uavYR39datSDzAEA0AuvXBxS0OzvY/SfI57Haj3owxE53jDlg8f01FU
 2fyeGArvonZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="186304926"
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; 
   d="scan'208";a="186304926"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 07:38:57 -0800
IronPort-SDR: Tbh7+5A9Yv0iJIBYGsRVm0IMnBJiW9iErrklih1lidvjHZZzmlO7WV+Xxk6B1xHZQ/D7tEhapO
 yBvKx/SyiYaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; 
   d="scan'208";a="603574380"
Received: from lkp-server02.sh.intel.com (HELO ce64c092ff93) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 11 Mar 2021 07:38:56 -0800
Received: from kbuild by ce64c092ff93 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lKNOp-0000pk-FK; Thu, 11 Mar 2021 15:38:55 +0000
Date:   Thu, 11 Mar 2021 23:38:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 a0686a4cdfad967e991618d3c35608f1903dfcaf
Message-ID: <604a396a.3P410JjGJl/L4Ya/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: a0686a4cdfad967e991618d3c35608f1903dfcaf  Merge branch 'devel' into for-next

elapsed time: 814m

configs tested: 103
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc836x_rdk_defconfig
sh                           se7724_defconfig
mips                        omega2p_defconfig
arm                        oxnas_v6_defconfig
arm                       versatile_defconfig
sh                           sh2007_defconfig
arm                           viper_defconfig
mips                        vocore2_defconfig
arc                          axs103_defconfig
sh                          lboxre2_defconfig
sh                          rsk7203_defconfig
openrisc                         alldefconfig
powerpc                      obs600_defconfig
sparc                               defconfig
ia64                         bigsur_defconfig
arm                            zeus_defconfig
m68k                          sun3x_defconfig
powerpc                    gamecube_defconfig
powerpc                     tqm8548_defconfig
sh                     magicpanelr2_defconfig
arm                  colibri_pxa300_defconfig
powerpc                  mpc866_ads_defconfig
m68k                        m5307c3_defconfig
mips                          malta_defconfig
arm                          badge4_defconfig
mips                      pic32mzda_defconfig
powerpc                          allmodconfig
sh                             shx3_defconfig
powerpc                        cell_defconfig
arm                            mps2_defconfig
arm                         hackkit_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                     pseries_defconfig
arm                            xcep_defconfig
sh                              ul2_defconfig
mips                      maltaaprp_defconfig
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
i386                               tinyconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210311
i386                 randconfig-a005-20210311
i386                 randconfig-a003-20210311
i386                 randconfig-a002-20210311
i386                 randconfig-a004-20210311
i386                 randconfig-a006-20210311
i386                 randconfig-a013-20210311
i386                 randconfig-a016-20210311
i386                 randconfig-a011-20210311
i386                 randconfig-a014-20210311
i386                 randconfig-a015-20210311
i386                 randconfig-a012-20210311
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20210311
x86_64               randconfig-a016-20210311
x86_64               randconfig-a013-20210311
x86_64               randconfig-a015-20210311
x86_64               randconfig-a014-20210311
x86_64               randconfig-a012-20210311

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
