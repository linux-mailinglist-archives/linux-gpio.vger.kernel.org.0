Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29FB316F045
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2020 21:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729080AbgBYUlC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Feb 2020 15:41:02 -0500
Received: from mga03.intel.com ([134.134.136.65]:4912 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728976AbgBYUlB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Feb 2020 15:41:01 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 12:41:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,485,1574150400"; 
   d="scan'208";a="410361545"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 25 Feb 2020 12:40:59 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j6h0k-0005dI-S9; Wed, 26 Feb 2020 04:40:58 +0800
Date:   Wed, 26 Feb 2020 04:40:34 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-backlight] BUILD SUCCESS
 f008c9e2fe21b5c28271901fd5acafd16fd75440
Message-ID: <5e558642.X2BiCccwGhHMdjqX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-backlight
branch HEAD: f008c9e2fe21b5c28271901fd5acafd16fd75440  backlight: pwm_bl: Switch to full GPIO descriptor

elapsed time: 1764m

configs tested: 222
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
sh                  sh7785lcr_32bit_defconfig
h8300                     edosk2674_defconfig
i386                                defconfig
mips                              allnoconfig
arc                              allyesconfig
s390                             allyesconfig
riscv                    nommu_virt_defconfig
powerpc                       ppc64_defconfig
mips                      fuloong2e_defconfig
riscv                          rv32_defconfig
m68k                       m5475evb_defconfig
parisc                generic-64bit_defconfig
m68k                           sun3_defconfig
ia64                              allnoconfig
parisc                            allnoconfig
microblaze                    nommu_defconfig
ia64                                defconfig
csky                                defconfig
h8300                       h8s-sim_defconfig
riscv                               defconfig
xtensa                          iss_defconfig
s390                             alldefconfig
sh                               allmodconfig
arc                                 defconfig
nds32                             allnoconfig
sparc64                          allmodconfig
openrisc                    or1ksim_defconfig
sh                                allnoconfig
sparc                               defconfig
riscv                             allnoconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                             allyesconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
alpha                               defconfig
nds32                               defconfig
h8300                    h8300h-sim_defconfig
m68k                             allmodconfig
m68k                          multi_defconfig
microblaze                      mmu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                             allyesconfig
mips                      malta_kvm_defconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
x86_64               randconfig-a001-20200225
x86_64               randconfig-a002-20200225
x86_64               randconfig-a003-20200225
i386                 randconfig-a001-20200225
i386                 randconfig-a002-20200225
i386                 randconfig-a003-20200225
x86_64               randconfig-a001-20200224
x86_64               randconfig-a002-20200224
x86_64               randconfig-a003-20200224
i386                 randconfig-a001-20200224
i386                 randconfig-a002-20200224
i386                 randconfig-a003-20200224
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
nios2                randconfig-a001-20200224
c6x                  randconfig-a001-20200224
csky                 randconfig-a001-20200225
openrisc             randconfig-a001-20200225
s390                 randconfig-a001-20200225
sh                   randconfig-a001-20200225
xtensa               randconfig-a001-20200225
csky                 randconfig-a001-20200226
openrisc             randconfig-a001-20200226
s390                 randconfig-a001-20200226
sh                   randconfig-a001-20200226
xtensa               randconfig-a001-20200226
csky                 randconfig-a001-20200224
openrisc             randconfig-a001-20200224
s390                 randconfig-a001-20200224
sh                   randconfig-a001-20200224
xtensa               randconfig-a001-20200224
x86_64               randconfig-b001-20200225
x86_64               randconfig-b002-20200225
x86_64               randconfig-b003-20200225
i386                 randconfig-b001-20200225
i386                 randconfig-b002-20200225
i386                 randconfig-b003-20200225
x86_64               randconfig-b001-20200224
x86_64               randconfig-b002-20200224
x86_64               randconfig-b003-20200224
i386                 randconfig-b001-20200224
i386                 randconfig-b002-20200224
i386                 randconfig-b003-20200224
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
x86_64               randconfig-d001-20200225
x86_64               randconfig-d002-20200225
x86_64               randconfig-d003-20200225
i386                 randconfig-d001-20200225
i386                 randconfig-d002-20200225
i386                 randconfig-d003-20200225
x86_64               randconfig-e001-20200225
x86_64               randconfig-e002-20200225
x86_64               randconfig-e003-20200225
i386                 randconfig-e001-20200225
i386                 randconfig-e002-20200225
i386                 randconfig-e003-20200225
x86_64               randconfig-e001-20200224
x86_64               randconfig-e002-20200224
x86_64               randconfig-e003-20200224
i386                 randconfig-e001-20200224
i386                 randconfig-e002-20200224
i386                 randconfig-e003-20200224
x86_64               randconfig-f001-20200225
x86_64               randconfig-f002-20200225
x86_64               randconfig-f003-20200225
i386                 randconfig-f001-20200225
i386                 randconfig-f002-20200225
i386                 randconfig-f003-20200225
x86_64               randconfig-f001-20200224
x86_64               randconfig-f002-20200224
x86_64               randconfig-f003-20200224
i386                 randconfig-f001-20200224
i386                 randconfig-f002-20200224
i386                 randconfig-f003-20200224
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
arc                  randconfig-a001-20200224
arm                  randconfig-a001-20200224
arm64                randconfig-a001-20200224
ia64                 randconfig-a001-20200224
powerpc              randconfig-a001-20200224
sparc                randconfig-a001-20200224
arm                  randconfig-a001-20200226
arm64                randconfig-a001-20200226
ia64                 randconfig-a001-20200226
powerpc              randconfig-a001-20200226
riscv                            allmodconfig
riscv                            allyesconfig
s390                             allmodconfig
s390                              allnoconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                          rsk7269_defconfig
sh                            titan_defconfig
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
