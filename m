Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4517417F552
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2020 11:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbgCJKrg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Mar 2020 06:47:36 -0400
Received: from mga17.intel.com ([192.55.52.151]:33141 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbgCJKrf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Mar 2020 06:47:35 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Mar 2020 03:47:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,536,1574150400"; 
   d="scan'208";a="231279883"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Mar 2020 03:47:33 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jBcQ9-000Hru-0G; Tue, 10 Mar 2020 18:47:33 +0800
Date:   Tue, 10 Mar 2020 18:46:59 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel] BUILD SUCCESS
 5779925c23e1b9cc4cffb6dafe0b70a47beb364d
Message-ID: <5e677023.ycPkimqcLYwpdHrb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel
branch HEAD: 5779925c23e1b9cc4cffb6dafe0b70a47beb364d  Merge tag 'gpio-updates-for-v5.7-part2' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into devel

elapsed time: 9883m

configs tested: 146
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
sh                  sh7785lcr_32bit_defconfig
s390                       zfcpdump_defconfig
sparc64                          allyesconfig
riscv                               defconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200303
x86_64               randconfig-a002-20200303
x86_64               randconfig-a003-20200303
i386                 randconfig-a001-20200303
i386                 randconfig-a002-20200303
i386                 randconfig-a003-20200303
riscv                randconfig-a001-20200303
alpha                randconfig-a001-20200303
m68k                 randconfig-a001-20200303
mips                 randconfig-a001-20200303
nds32                randconfig-a001-20200303
parisc               randconfig-a001-20200303
c6x                  randconfig-a001-20200303
h8300                randconfig-a001-20200303
microblaze           randconfig-a001-20200303
nios2                randconfig-a001-20200303
sparc64              randconfig-a001-20200303
csky                 randconfig-a001-20200304
openrisc             randconfig-a001-20200304
s390                 randconfig-a001-20200304
sh                   randconfig-a001-20200304
xtensa               randconfig-a001-20200304
sh                   randconfig-a001-20200302
openrisc             randconfig-a001-20200302
csky                 randconfig-a001-20200302
s390                 randconfig-a001-20200302
xtensa               randconfig-a001-20200302
x86_64               randconfig-c001-20200303
x86_64               randconfig-c002-20200303
x86_64               randconfig-c003-20200303
i386                 randconfig-c001-20200303
i386                 randconfig-c002-20200303
i386                 randconfig-c003-20200303
x86_64               randconfig-d001-20200303
x86_64               randconfig-d002-20200303
x86_64               randconfig-d003-20200303
i386                 randconfig-d001-20200303
i386                 randconfig-d002-20200303
i386                 randconfig-d003-20200303
x86_64               randconfig-g001-20200303
x86_64               randconfig-g002-20200303
x86_64               randconfig-g003-20200303
i386                 randconfig-g001-20200303
i386                 randconfig-g002-20200303
i386                 randconfig-g003-20200303
x86_64               randconfig-h001-20200303
x86_64               randconfig-h002-20200303
x86_64               randconfig-h003-20200303
i386                 randconfig-h001-20200303
i386                 randconfig-h002-20200303
i386                 randconfig-h003-20200303
arc                  randconfig-a001-20200303
sparc                randconfig-a001-20200303
ia64                 randconfig-a001-20200303
arm                  randconfig-a001-20200303
arm64                randconfig-a001-20200303
powerpc              randconfig-a001-20200303
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                             defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                                   rhel

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
