Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F20863F01A3
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Aug 2021 12:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234505AbhHRK2k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 06:28:40 -0400
Received: from mga04.intel.com ([192.55.52.120]:15461 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234872AbhHRK2j (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Aug 2021 06:28:39 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="214451552"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="214451552"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2021 03:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="680778896"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Aug 2021 03:28:03 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mGInj-000Sof-9l; Wed, 18 Aug 2021 10:28:03 +0000
Date:   Wed, 18 Aug 2021 18:27:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS WITH WARNING
 04853352952b7dd17f355ed54bd81305b341af55
Message-ID: <611ce079.+3NgF00ZLwtIzcfr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 04853352952b7dd17f355ed54bd81305b341af55  Merge tag 'samsung-pinctrl-5.15' of https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into devel

Warning reports:

https://lore.kernel.org/linux-gpio/202108180726.yKngeGE2-lkp@intel.com

Warning in current branch:

drivers/pinctrl/bcm/pinctrl-bcm2835.c:412:14: warning: variable 'group' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]

Warning ids grouped by kconfigs:

clang_recent_errors
`-- mips-randconfig-c004-20210816
    `-- drivers-pinctrl-bcm-pinctrl-bcm2835.c:warning:variable-group-is-used-uninitialized-whenever-for-loop-exits-because-its-condition-is-false

elapsed time: 821m

configs tested: 80
configs skipped: 3

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                         at91_dt_defconfig
mips                     loongson1c_defconfig
mips                          rb532_defconfig
mips                       bmips_be_defconfig
arm                            dove_defconfig
sh                     magicpanelr2_defconfig
arc                        nsim_700_defconfig
mips                            e55_defconfig
arm                          lpd270_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                  iss476-smp_defconfig
mips                     loongson2k_defconfig
parisc                generic-64bit_defconfig
powerpc                     sequoia_defconfig
arc                     nsimosci_hs_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
alpha                               defconfig
alpha                            allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
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
x86_64               randconfig-a006-20210816
x86_64               randconfig-a004-20210816
x86_64               randconfig-a003-20210816
x86_64               randconfig-a001-20210816
x86_64               randconfig-a005-20210816
x86_64               randconfig-a002-20210816
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
i386                 randconfig-c001-20210816
i386                 randconfig-a011-20210816
i386                 randconfig-a015-20210816
i386                 randconfig-a013-20210816
i386                 randconfig-a014-20210816
i386                 randconfig-a016-20210816
i386                 randconfig-a012-20210816

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
