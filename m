Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70FF0179F6A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2020 06:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgCEFoC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Mar 2020 00:44:02 -0500
Received: from mga06.intel.com ([134.134.136.31]:63732 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725839AbgCEFoB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Mar 2020 00:44:01 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Mar 2020 21:44:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,516,1574150400"; 
   d="scan'208";a="387395665"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Mar 2020 21:43:59 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j9jIc-0004Me-EV; Thu, 05 Mar 2020 13:43:58 +0800
Date:   Thu, 05 Mar 2020 13:43:23 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-sa1100fb] BUILD SUCCESS
 d4d420afd1381e212e4bc6a5d325f65c74264c69
Message-ID: <5e60917b.9NXUvQ4pfNsjFMn2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-sa1100fb
branch HEAD: d4d420afd1381e212e4bc6a5d325f65c74264c69  ARM/fbdev: sa11x0: Switch to use GPIO descriptors

elapsed time: 2379m

configs tested: 274
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
s390                             alldefconfig
m68k                             allmodconfig
s390                       zfcpdump_defconfig
sparc64                          allyesconfig
arc                                 defconfig
parisc                generic-64bit_defconfig
sh                  sh7785lcr_32bit_defconfig
riscv                             allnoconfig
csky                                defconfig
sparc                               defconfig
ia64                             allmodconfig
sh                          rsk7269_defconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
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
nds32                             allnoconfig
nds32                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
h8300                    h8300h-sim_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
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
x86_64               randconfig-a001-20200303
x86_64               randconfig-a002-20200303
x86_64               randconfig-a003-20200303
i386                 randconfig-a001-20200303
i386                 randconfig-a002-20200303
i386                 randconfig-a003-20200303
x86_64               randconfig-a001-20200304
x86_64               randconfig-a002-20200304
x86_64               randconfig-a003-20200304
i386                 randconfig-a001-20200304
i386                 randconfig-a002-20200304
i386                 randconfig-a003-20200304
x86_64               randconfig-a001-20200305
x86_64               randconfig-a002-20200305
x86_64               randconfig-a003-20200305
i386                 randconfig-a001-20200305
i386                 randconfig-a002-20200305
i386                 randconfig-a003-20200305
alpha                randconfig-a001-20200303
m68k                 randconfig-a001-20200303
mips                 randconfig-a001-20200303
nds32                randconfig-a001-20200303
parisc               randconfig-a001-20200303
riscv                randconfig-a001-20200303
alpha                randconfig-a001-20200305
m68k                 randconfig-a001-20200305
mips                 randconfig-a001-20200305
nds32                randconfig-a001-20200305
parisc               randconfig-a001-20200305
riscv                randconfig-a001-20200305
alpha                randconfig-a001-20200304
m68k                 randconfig-a001-20200304
mips                 randconfig-a001-20200304
nds32                randconfig-a001-20200304
parisc               randconfig-a001-20200304
riscv                randconfig-a001-20200304
c6x                  randconfig-a001-20200303
h8300                randconfig-a001-20200303
microblaze           randconfig-a001-20200303
nios2                randconfig-a001-20200303
sparc64              randconfig-a001-20200303
c6x                  randconfig-a001-20200304
h8300                randconfig-a001-20200304
microblaze           randconfig-a001-20200304
nios2                randconfig-a001-20200304
sparc64              randconfig-a001-20200304
c6x                  randconfig-a001-20200305
h8300                randconfig-a001-20200305
microblaze           randconfig-a001-20200305
nios2                randconfig-a001-20200305
sparc64              randconfig-a001-20200305
sh                   randconfig-a001-20200303
openrisc             randconfig-a001-20200303
csky                 randconfig-a001-20200303
s390                 randconfig-a001-20200303
xtensa               randconfig-a001-20200303
csky                 randconfig-a001-20200304
openrisc             randconfig-a001-20200304
s390                 randconfig-a001-20200304
sh                   randconfig-a001-20200304
xtensa               randconfig-a001-20200304
csky                 randconfig-a001-20200302
openrisc             randconfig-a001-20200302
s390                 randconfig-a001-20200302
sh                   randconfig-a001-20200302
xtensa               randconfig-a001-20200302
x86_64               randconfig-b001-20200303
x86_64               randconfig-b002-20200303
x86_64               randconfig-b003-20200303
i386                 randconfig-b001-20200303
i386                 randconfig-b002-20200303
i386                 randconfig-b003-20200303
x86_64               randconfig-b001-20200304
x86_64               randconfig-b002-20200304
x86_64               randconfig-b003-20200304
i386                 randconfig-b001-20200304
i386                 randconfig-b002-20200304
i386                 randconfig-b003-20200304
x86_64               randconfig-b001-20200305
x86_64               randconfig-b002-20200305
x86_64               randconfig-b003-20200305
i386                 randconfig-b001-20200305
i386                 randconfig-b002-20200305
i386                 randconfig-b003-20200305
x86_64               randconfig-c001-20200303
x86_64               randconfig-c002-20200303
x86_64               randconfig-c003-20200303
i386                 randconfig-c001-20200303
i386                 randconfig-c002-20200303
i386                 randconfig-c003-20200303
x86_64               randconfig-c001-20200305
x86_64               randconfig-c002-20200305
x86_64               randconfig-c003-20200305
i386                 randconfig-c001-20200305
i386                 randconfig-c002-20200305
i386                 randconfig-c003-20200305
x86_64               randconfig-c001-20200304
x86_64               randconfig-c002-20200304
x86_64               randconfig-c003-20200304
i386                 randconfig-c001-20200304
i386                 randconfig-c002-20200304
i386                 randconfig-c003-20200304
x86_64               randconfig-d001-20200303
x86_64               randconfig-d002-20200303
x86_64               randconfig-d003-20200303
i386                 randconfig-d001-20200303
i386                 randconfig-d002-20200303
i386                 randconfig-d003-20200303
x86_64               randconfig-d001-20200304
x86_64               randconfig-d002-20200304
x86_64               randconfig-d003-20200304
i386                 randconfig-d001-20200304
i386                 randconfig-d002-20200304
i386                 randconfig-d003-20200304
x86_64               randconfig-e001-20200303
x86_64               randconfig-e002-20200303
x86_64               randconfig-e003-20200303
i386                 randconfig-e001-20200303
i386                 randconfig-e002-20200303
i386                 randconfig-e003-20200303
x86_64               randconfig-e001-20200304
x86_64               randconfig-e002-20200304
x86_64               randconfig-e003-20200304
i386                 randconfig-e001-20200304
i386                 randconfig-e002-20200304
i386                 randconfig-e003-20200304
x86_64               randconfig-e001-20200305
x86_64               randconfig-e002-20200305
x86_64               randconfig-e003-20200305
i386                 randconfig-e001-20200305
i386                 randconfig-e002-20200305
i386                 randconfig-e003-20200305
x86_64               randconfig-f001-20200304
x86_64               randconfig-f002-20200304
x86_64               randconfig-f003-20200304
i386                 randconfig-f001-20200304
i386                 randconfig-f002-20200304
i386                 randconfig-f003-20200304
x86_64               randconfig-g001-20200303
x86_64               randconfig-g002-20200303
x86_64               randconfig-g003-20200303
i386                 randconfig-g001-20200303
i386                 randconfig-g002-20200303
i386                 randconfig-g003-20200303
x86_64               randconfig-g001-20200304
x86_64               randconfig-g002-20200304
x86_64               randconfig-g003-20200304
i386                 randconfig-g001-20200304
i386                 randconfig-g002-20200304
i386                 randconfig-g003-20200304
x86_64               randconfig-h001-20200303
x86_64               randconfig-h002-20200303
x86_64               randconfig-h003-20200303
i386                 randconfig-h001-20200303
i386                 randconfig-h002-20200303
i386                 randconfig-h003-20200303
x86_64               randconfig-h001-20200305
x86_64               randconfig-h002-20200305
x86_64               randconfig-h003-20200305
i386                 randconfig-h001-20200305
i386                 randconfig-h002-20200305
i386                 randconfig-h003-20200305
x86_64               randconfig-h001-20200304
x86_64               randconfig-h002-20200304
x86_64               randconfig-h003-20200304
i386                 randconfig-h001-20200304
i386                 randconfig-h002-20200304
i386                 randconfig-h003-20200304
arc                  randconfig-a001-20200303
arm                  randconfig-a001-20200303
arm64                randconfig-a001-20200303
ia64                 randconfig-a001-20200303
powerpc              randconfig-a001-20200303
sparc                randconfig-a001-20200303
arc                  randconfig-a001-20200304
arm                  randconfig-a001-20200304
arm64                randconfig-a001-20200304
ia64                 randconfig-a001-20200304
powerpc              randconfig-a001-20200304
sparc                randconfig-a001-20200304
riscv                            allmodconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                            titan_defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
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
