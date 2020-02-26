Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0077016F5F2
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2020 04:08:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbgBZDIs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Feb 2020 22:08:48 -0500
Received: from mga05.intel.com ([192.55.52.43]:15846 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727880AbgBZDIs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Feb 2020 22:08:48 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 19:08:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,486,1574150400"; 
   d="scan'208";a="231249237"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 25 Feb 2020 19:08:45 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j6n40-000ANM-W5; Wed, 26 Feb 2020 11:08:44 +0800
Date:   Wed, 26 Feb 2020 11:08:14 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 2d2177ffa2695e340c7bcfd88be76d73bf75bd89
Message-ID: <5e55e11e.GNXMxLrCqxzxzWZg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  for-next
branch HEAD: 2d2177ffa2695e340c7bcfd88be76d73bf75bd89  Merge branch 'devel' into for-next

elapsed time: 467m

configs tested: 202
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
sparc                            allyesconfig
c6x                        evmc6678_defconfig
microblaze                    nommu_defconfig
mips                              allnoconfig
ia64                             allyesconfig
mips                             allyesconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                                defconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
xtensa                          iss_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
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
arc                                 defconfig
arc                              allyesconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
powerpc                           allnoconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200225
x86_64               randconfig-a002-20200225
x86_64               randconfig-a003-20200225
i386                 randconfig-a001-20200225
i386                 randconfig-a002-20200225
i386                 randconfig-a003-20200225
alpha                randconfig-a001-20200225
m68k                 randconfig-a001-20200225
mips                 randconfig-a001-20200225
nds32                randconfig-a001-20200225
parisc               randconfig-a001-20200225
riscv                randconfig-a001-20200225
alpha                randconfig-a001-20200226
m68k                 randconfig-a001-20200226
mips                 randconfig-a001-20200226
nds32                randconfig-a001-20200226
parisc               randconfig-a001-20200226
riscv                randconfig-a001-20200226
c6x                  randconfig-a001-20200225
h8300                randconfig-a001-20200225
microblaze           randconfig-a001-20200225
nios2                randconfig-a001-20200225
sparc64              randconfig-a001-20200225
c6x                  randconfig-a001-20200226
h8300                randconfig-a001-20200226
microblaze           randconfig-a001-20200226
nios2                randconfig-a001-20200226
sparc64              randconfig-a001-20200226
csky                 randconfig-a001-20200226
openrisc             randconfig-a001-20200226
s390                 randconfig-a001-20200226
sh                   randconfig-a001-20200226
xtensa               randconfig-a001-20200226
openrisc             randconfig-a001-20200225
sh                   randconfig-a001-20200225
s390                 randconfig-a001-20200225
xtensa               randconfig-a001-20200225
csky                 randconfig-a001-20200225
x86_64               randconfig-b001-20200225
x86_64               randconfig-b002-20200225
x86_64               randconfig-b003-20200225
i386                 randconfig-b001-20200225
i386                 randconfig-b002-20200225
i386                 randconfig-b003-20200225
x86_64               randconfig-b001-20200226
x86_64               randconfig-b002-20200226
x86_64               randconfig-b003-20200226
i386                 randconfig-b001-20200226
i386                 randconfig-b002-20200226
i386                 randconfig-b003-20200226
x86_64               randconfig-c001-20200225
x86_64               randconfig-c002-20200225
x86_64               randconfig-c003-20200225
i386                 randconfig-c001-20200225
i386                 randconfig-c002-20200225
i386                 randconfig-c003-20200225
x86_64               randconfig-d001-20200226
x86_64               randconfig-d002-20200226
x86_64               randconfig-d003-20200226
i386                 randconfig-d001-20200226
i386                 randconfig-d002-20200226
i386                 randconfig-d003-20200226
x86_64               randconfig-d001-20200225
x86_64               randconfig-d002-20200225
x86_64               randconfig-d003-20200225
i386                 randconfig-d001-20200225
i386                 randconfig-d002-20200225
i386                 randconfig-d003-20200225
x86_64               randconfig-e001-20200226
x86_64               randconfig-e002-20200226
x86_64               randconfig-e003-20200226
i386                 randconfig-e001-20200226
i386                 randconfig-e002-20200226
i386                 randconfig-e003-20200226
x86_64               randconfig-e001-20200225
x86_64               randconfig-e002-20200225
x86_64               randconfig-e003-20200225
i386                 randconfig-e001-20200225
i386                 randconfig-e002-20200225
i386                 randconfig-e003-20200225
x86_64               randconfig-f001-20200226
x86_64               randconfig-f002-20200226
x86_64               randconfig-f003-20200226
i386                 randconfig-f001-20200226
i386                 randconfig-f002-20200226
i386                 randconfig-f003-20200226
x86_64               randconfig-g001-20200225
x86_64               randconfig-g002-20200225
x86_64               randconfig-g003-20200225
i386                 randconfig-g001-20200225
i386                 randconfig-g002-20200225
i386                 randconfig-g003-20200225
x86_64               randconfig-h001-20200225
x86_64               randconfig-h002-20200225
x86_64               randconfig-h003-20200225
i386                 randconfig-h001-20200225
i386                 randconfig-h002-20200225
i386                 randconfig-h003-20200225
arc                  randconfig-a001-20200225
arm                  randconfig-a001-20200225
arm64                randconfig-a001-20200225
ia64                 randconfig-a001-20200225
powerpc              randconfig-a001-20200225
sparc                randconfig-a001-20200225
arm                  randconfig-a001-20200226
arm64                randconfig-a001-20200226
ia64                 randconfig-a001-20200226
powerpc              randconfig-a001-20200226
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
