Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E07AD168D18
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Feb 2020 08:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbgBVHJ1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 Feb 2020 02:09:27 -0500
Received: from mga09.intel.com ([134.134.136.24]:31222 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727072AbgBVHJ1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 22 Feb 2020 02:09:27 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Feb 2020 23:09:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,471,1574150400"; 
   d="scan'208";a="270256172"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2020 23:09:24 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j5Oui-0009l0-BA; Sat, 22 Feb 2020 15:09:24 +0800
Date:   Sat, 22 Feb 2020 15:08:34 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 3385ab72d995fc0b876818a36203bf2429445686
Message-ID: <5e50d372.6QZ9xxG/SCXr2+j9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  devel
branch HEAD: 3385ab72d995fc0b876818a36203bf2429445686  pinctrl: mediatek: Fix some off by one bugs

elapsed time: 669m

configs tested: 211
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
csky                                defconfig
mips                      malta_kvm_defconfig
nios2                         10m50_defconfig
riscv                          rv32_defconfig
ia64                              allnoconfig
microblaze                      mmu_defconfig
c6x                              allyesconfig
parisc                generic-32bit_defconfig
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                        evmc6678_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
nds32                               defconfig
nds32                             allnoconfig
alpha                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
arc                                 defconfig
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
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200221
x86_64               randconfig-a002-20200221
x86_64               randconfig-a003-20200221
i386                 randconfig-a001-20200221
i386                 randconfig-a002-20200221
i386                 randconfig-a003-20200221
x86_64               randconfig-a001-20200222
x86_64               randconfig-a002-20200222
x86_64               randconfig-a003-20200222
i386                 randconfig-a001-20200222
i386                 randconfig-a002-20200222
i386                 randconfig-a003-20200222
alpha                randconfig-a001-20200221
m68k                 randconfig-a001-20200221
mips                 randconfig-a001-20200221
nds32                randconfig-a001-20200221
parisc               randconfig-a001-20200221
riscv                randconfig-a001-20200221
alpha                randconfig-a001-20200222
m68k                 randconfig-a001-20200222
mips                 randconfig-a001-20200222
nds32                randconfig-a001-20200222
parisc               randconfig-a001-20200222
riscv                randconfig-a001-20200222
c6x                  randconfig-a001-20200221
h8300                randconfig-a001-20200221
microblaze           randconfig-a001-20200221
nios2                randconfig-a001-20200221
sparc64              randconfig-a001-20200221
csky                 randconfig-a001-20200221
openrisc             randconfig-a001-20200221
s390                 randconfig-a001-20200221
sh                   randconfig-a001-20200221
xtensa               randconfig-a001-20200221
csky                 randconfig-a001-20200222
openrisc             randconfig-a001-20200222
s390                 randconfig-a001-20200222
sh                   randconfig-a001-20200222
xtensa               randconfig-a001-20200222
x86_64               randconfig-b001-20200222
x86_64               randconfig-b002-20200222
x86_64               randconfig-b003-20200222
i386                 randconfig-b001-20200222
i386                 randconfig-b002-20200222
i386                 randconfig-b003-20200222
x86_64               randconfig-c001-20200221
x86_64               randconfig-c002-20200221
x86_64               randconfig-c003-20200221
i386                 randconfig-c001-20200221
i386                 randconfig-c002-20200221
i386                 randconfig-c003-20200221
x86_64               randconfig-d001-20200221
x86_64               randconfig-d002-20200221
x86_64               randconfig-d003-20200221
i386                 randconfig-d001-20200221
i386                 randconfig-d002-20200221
i386                 randconfig-d003-20200221
x86_64               randconfig-d001-20200222
x86_64               randconfig-d002-20200222
x86_64               randconfig-d003-20200222
i386                 randconfig-d001-20200222
i386                 randconfig-d002-20200222
i386                 randconfig-d003-20200222
x86_64               randconfig-e001-20200222
x86_64               randconfig-e002-20200222
x86_64               randconfig-e003-20200222
i386                 randconfig-e001-20200222
i386                 randconfig-e002-20200222
i386                 randconfig-e003-20200222
x86_64               randconfig-e001-20200221
x86_64               randconfig-e002-20200221
x86_64               randconfig-e003-20200221
i386                 randconfig-e001-20200221
i386                 randconfig-e002-20200221
i386                 randconfig-e003-20200221
x86_64               randconfig-f001-20200221
x86_64               randconfig-f002-20200221
x86_64               randconfig-f003-20200221
i386                 randconfig-f001-20200221
i386                 randconfig-f002-20200221
i386                 randconfig-f003-20200221
x86_64               randconfig-f001-20200222
x86_64               randconfig-f002-20200222
x86_64               randconfig-f003-20200222
i386                 randconfig-f001-20200222
i386                 randconfig-f002-20200222
i386                 randconfig-f003-20200222
x86_64               randconfig-g001-20200222
x86_64               randconfig-g002-20200222
x86_64               randconfig-g003-20200222
i386                 randconfig-g001-20200222
i386                 randconfig-g002-20200222
i386                 randconfig-g003-20200222
x86_64               randconfig-g001-20200221
x86_64               randconfig-g002-20200221
x86_64               randconfig-g003-20200221
i386                 randconfig-g001-20200221
i386                 randconfig-g002-20200221
i386                 randconfig-g003-20200221
x86_64               randconfig-h001-20200221
x86_64               randconfig-h002-20200221
x86_64               randconfig-h003-20200221
i386                 randconfig-h001-20200221
i386                 randconfig-h002-20200221
i386                 randconfig-h003-20200221
x86_64               randconfig-h001-20200222
x86_64               randconfig-h002-20200222
x86_64               randconfig-h003-20200222
i386                 randconfig-h001-20200222
i386                 randconfig-h002-20200222
i386                 randconfig-h003-20200222
arc                  randconfig-a001-20200221
arm                  randconfig-a001-20200221
arm64                randconfig-a001-20200221
ia64                 randconfig-a001-20200221
powerpc              randconfig-a001-20200221
sparc                randconfig-a001-20200221
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
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
