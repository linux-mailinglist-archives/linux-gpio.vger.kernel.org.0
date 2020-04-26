Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 847B81B8A7E
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Apr 2020 02:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgDZA4I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Apr 2020 20:56:08 -0400
Received: from mga17.intel.com ([192.55.52.151]:21123 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726117AbgDZA4I (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 25 Apr 2020 20:56:08 -0400
IronPort-SDR: 3HitM6ZLVeN5ooDQPaYdZpvxPU5au/9AwzeDqx7sUBHBsx7mLFlp8xEFeezOfEBR8pA88k8nbI
 LODOFNGeo4Iw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2020 17:56:05 -0700
IronPort-SDR: wyZjxo4W046P5RYeRT/sRICSHlR7IVqLuKYEhp70pPRugpKTyq8xMcaEuYHyuz8hdiwefryDuk
 klzTz7f7yWEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,318,1583222400"; 
   d="scan'208";a="260266524"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Apr 2020 17:56:04 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jSVaV-000GW6-Ej; Sun, 26 Apr 2020 08:56:03 +0800
Date:   Sun, 26 Apr 2020 08:55:05 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-leds] BUILD SUCCESS
 2a77ae55dbf0c33bbbc537876f5e920d79ada53b
Message-ID: <5ea4dbe9.og/v59QS1Xp2ftRH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-leds
branch HEAD: 2a77ae55dbf0c33bbbc537876f5e920d79ada53b  leds: tca6507: Include the right header

elapsed time: 14599m

configs tested: 371
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                              allmodconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
mips                          ath79_defconfig
s390                             allmodconfig
i386                                defconfig
riscv                             allnoconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
sparc64                           allnoconfig
mips                             allmodconfig
ia64                          tiger_defconfig
arc                                 defconfig
ia64                                defconfig
microblaze                      mmu_defconfig
s390                                defconfig
m68k                          multi_defconfig
xtensa                          iss_defconfig
ia64                              allnoconfig
mips                malta_kvm_guest_defconfig
m68k                       m5475evb_defconfig
ia64                         bigsur_defconfig
c6x                              allyesconfig
ia64                             alldefconfig
i386                              allnoconfig
sparc                               defconfig
sh                  sh7785lcr_32bit_defconfig
ia64                        generic_defconfig
riscv                               defconfig
nios2                         3c120_defconfig
um                           x86_64_defconfig
m68k                             allmodconfig
openrisc                    or1ksim_defconfig
sparc64                          allmodconfig
mips                         tb0287_defconfig
parisc                            allnoconfig
mips                            ar7_defconfig
s390                             allyesconfig
s390                          debug_defconfig
nds32                             allnoconfig
riscv                            allmodconfig
csky                                defconfig
powerpc                             defconfig
um                             i386_defconfig
riscv                          rv32_defconfig
mips                       capcella_defconfig
s390                             alldefconfig
i386                             alldefconfig
s390                       zfcpdump_defconfig
nds32                               defconfig
mips                  decstation_64_defconfig
m68k                           sun3_defconfig
ia64                             allmodconfig
mips                      fuloong2e_defconfig
mips                              allnoconfig
um                                  defconfig
powerpc                           allnoconfig
parisc                generic-64bit_defconfig
i386                             allyesconfig
i386                              debian-10.3
ia64                             allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
arc                              allyesconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
microblaze                    nommu_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                           32r2_defconfig
mips                           ip32_defconfig
mips                      loongson3_defconfig
mips                        bcm63xx_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
parisc                           allmodconfig
parisc               randconfig-a001-20200422
mips                 randconfig-a001-20200422
alpha                randconfig-a001-20200422
m68k                 randconfig-a001-20200422
riscv                randconfig-a001-20200422
nds32                randconfig-a001-20200422
parisc               randconfig-a001-20200424
alpha                randconfig-a001-20200424
m68k                 randconfig-a001-20200424
riscv                randconfig-a001-20200424
nds32                randconfig-a001-20200424
parisc               randconfig-a001-20200421
alpha                randconfig-a001-20200421
mips                 randconfig-a001-20200421
m68k                 randconfig-a001-20200421
riscv                randconfig-a001-20200421
nds32                randconfig-a001-20200421
parisc               randconfig-a001-20200423
alpha                randconfig-a001-20200423
mips                 randconfig-a001-20200423
riscv                randconfig-a001-20200423
nds32                randconfig-a001-20200423
parisc               randconfig-a001-20200426
mips                 randconfig-a001-20200426
alpha                randconfig-a001-20200426
m68k                 randconfig-a001-20200426
nds32                randconfig-a001-20200426
nios2                randconfig-a001-20200421
h8300                randconfig-a001-20200421
c6x                  randconfig-a001-20200421
sparc64              randconfig-a001-20200421
microblaze           randconfig-a001-20200421
nios2                randconfig-a001-20200424
c6x                  randconfig-a001-20200424
h8300                randconfig-a001-20200424
sparc64              randconfig-a001-20200424
microblaze           randconfig-a001-20200424
nios2                randconfig-a001-20200425
c6x                  randconfig-a001-20200425
h8300                randconfig-a001-20200425
sparc64              randconfig-a001-20200425
microblaze           randconfig-a001-20200425
sh                   randconfig-a001-20200421
csky                 randconfig-a001-20200421
s390                 randconfig-a001-20200421
xtensa               randconfig-a001-20200421
openrisc             randconfig-a001-20200421
sh                   randconfig-a001-20200424
csky                 randconfig-a001-20200424
s390                 randconfig-a001-20200424
xtensa               randconfig-a001-20200424
openrisc             randconfig-a001-20200424
sh                   randconfig-a001-20200425
csky                 randconfig-a001-20200425
s390                 randconfig-a001-20200425
xtensa               randconfig-a001-20200425
openrisc             randconfig-a001-20200425
i386                 randconfig-a002-20200416
i386                 randconfig-a003-20200416
i386                 randconfig-a001-20200416
x86_64               randconfig-a001-20200416
x86_64               randconfig-a002-20200416
x86_64               randconfig-a003-20200416
x86_64               randconfig-a001-20200422
i386                 randconfig-a003-20200422
x86_64               randconfig-a003-20200422
i386                 randconfig-a002-20200422
i386                 randconfig-a001-20200422
x86_64               randconfig-a002-20200422
i386                 randconfig-b002-20200421
i386                 randconfig-b001-20200421
x86_64               randconfig-b001-20200421
i386                 randconfig-b003-20200421
x86_64               randconfig-b002-20200421
x86_64               randconfig-b003-20200421
i386                 randconfig-b002-20200425
x86_64               randconfig-b001-20200425
i386                 randconfig-b001-20200425
i386                 randconfig-b003-20200425
x86_64               randconfig-b002-20200425
x86_64               randconfig-b003-20200425
i386                 randconfig-b002-20200422
i386                 randconfig-b001-20200422
x86_64               randconfig-b001-20200422
i386                 randconfig-b003-20200422
x86_64               randconfig-b003-20200422
i386                 randconfig-b002-20200426
x86_64               randconfig-b001-20200426
i386                 randconfig-b001-20200426
i386                 randconfig-b003-20200426
x86_64               randconfig-b003-20200426
i386                 randconfig-a002-20200417
x86_64               randconfig-a001-20200417
x86_64               randconfig-a002-20200417
i386                 randconfig-a003-20200417
i386                 randconfig-a001-20200417
x86_64               randconfig-a003-20200417
x86_64               randconfig-a001-20200424
i386                 randconfig-a003-20200424
x86_64               randconfig-a003-20200424
i386                 randconfig-a002-20200424
i386                 randconfig-a001-20200424
x86_64               randconfig-a002-20200424
i386                 randconfig-c002-20200421
i386                 randconfig-c001-20200421
x86_64               randconfig-c002-20200421
x86_64               randconfig-c001-20200421
i386                 randconfig-c003-20200421
x86_64               randconfig-c003-20200421
i386                 randconfig-c002-20200424
i386                 randconfig-c001-20200424
x86_64               randconfig-c001-20200424
i386                 randconfig-c003-20200424
x86_64               randconfig-c003-20200424
i386                 randconfig-c002-20200425
i386                 randconfig-c001-20200425
x86_64               randconfig-c002-20200425
x86_64               randconfig-c001-20200425
i386                 randconfig-c003-20200425
x86_64               randconfig-c003-20200425
i386                 randconfig-c002-20200423
i386                 randconfig-c001-20200423
x86_64               randconfig-c002-20200423
x86_64               randconfig-c001-20200423
i386                 randconfig-c003-20200423
x86_64               randconfig-c003-20200423
x86_64               randconfig-d001-20200421
x86_64               randconfig-d002-20200421
i386                 randconfig-d002-20200421
i386                 randconfig-d001-20200421
x86_64               randconfig-d003-20200421
i386                 randconfig-d003-20200421
x86_64               randconfig-d002-20200422
i386                 randconfig-d002-20200422
i386                 randconfig-d001-20200422
i386                 randconfig-d003-20200422
x86_64               randconfig-d001-20200423
x86_64               randconfig-d002-20200423
i386                 randconfig-d002-20200423
i386                 randconfig-d001-20200423
x86_64               randconfig-d003-20200423
i386                 randconfig-d003-20200423
x86_64               randconfig-d001-20200424
i386                 randconfig-d002-20200424
i386                 randconfig-d001-20200424
x86_64               randconfig-d003-20200424
i386                 randconfig-d003-20200424
x86_64               randconfig-d002-20200426
i386                 randconfig-d002-20200426
i386                 randconfig-d001-20200426
i386                 randconfig-d003-20200426
x86_64               randconfig-a001-20200420
i386                 randconfig-a003-20200420
x86_64               randconfig-a003-20200420
i386                 randconfig-a002-20200420
i386                 randconfig-a001-20200420
x86_64               randconfig-a002-20200420
x86_64               randconfig-e002-20200421
i386                 randconfig-e003-20200421
x86_64               randconfig-e003-20200421
i386                 randconfig-e002-20200421
i386                 randconfig-e001-20200421
x86_64               randconfig-e001-20200421
i386                 randconfig-e003-20200425
x86_64               randconfig-e002-20200425
x86_64               randconfig-e003-20200425
i386                 randconfig-e002-20200425
i386                 randconfig-e001-20200425
x86_64               randconfig-e001-20200425
i386                 randconfig-e003-20200426
x86_64               randconfig-e003-20200426
i386                 randconfig-e002-20200426
i386                 randconfig-e001-20200426
x86_64               randconfig-e001-20200426
x86_64               randconfig-e002-20200423
i386                 randconfig-e003-20200423
x86_64               randconfig-e003-20200423
i386                 randconfig-e002-20200423
i386                 randconfig-e001-20200423
x86_64               randconfig-e001-20200423
i386                 randconfig-f002-20200421
i386                 randconfig-f003-20200421
x86_64               randconfig-f003-20200421
i386                 randconfig-f001-20200421
x86_64               randconfig-f001-20200421
x86_64               randconfig-f002-20200424
i386                 randconfig-f002-20200424
i386                 randconfig-f003-20200424
x86_64               randconfig-f003-20200424
i386                 randconfig-f001-20200424
x86_64               randconfig-f001-20200424
i386                 randconfig-f002-20200425
i386                 randconfig-f003-20200425
x86_64               randconfig-f003-20200425
i386                 randconfig-f001-20200425
x86_64               randconfig-f001-20200425
x86_64               randconfig-f002-20200426
i386                 randconfig-f002-20200426
x86_64               randconfig-f003-20200426
i386                 randconfig-f003-20200426
i386                 randconfig-f001-20200426
x86_64               randconfig-f001-20200426
i386                 randconfig-g003-20200422
x86_64               randconfig-g001-20200422
i386                 randconfig-g001-20200422
x86_64               randconfig-g002-20200422
i386                 randconfig-g002-20200422
x86_64               randconfig-g003-20200422
i386                 randconfig-g003-20200424
i386                 randconfig-g001-20200424
x86_64               randconfig-g001-20200424
x86_64               randconfig-g002-20200424
i386                 randconfig-g002-20200424
x86_64               randconfig-g003-20200424
i386                 randconfig-g003-20200423
x86_64               randconfig-g001-20200423
i386                 randconfig-g001-20200423
i386                 randconfig-g002-20200423
x86_64               randconfig-g003-20200423
i386                 randconfig-h003-20200421
x86_64               randconfig-h001-20200421
x86_64               randconfig-h003-20200421
i386                 randconfig-h002-20200421
i386                 randconfig-h001-20200421
i386                 randconfig-h003-20200422
x86_64               randconfig-h001-20200422
x86_64               randconfig-h003-20200422
x86_64               randconfig-h002-20200422
i386                 randconfig-h001-20200422
i386                 randconfig-h002-20200422
i386                 randconfig-h003-20200424
x86_64               randconfig-h001-20200424
x86_64               randconfig-h003-20200424
x86_64               randconfig-h002-20200424
i386                 randconfig-h001-20200424
i386                 randconfig-h002-20200424
i386                 randconfig-h003-20200426
x86_64               randconfig-h001-20200426
x86_64               randconfig-h003-20200426
x86_64               randconfig-h002-20200426
i386                 randconfig-h001-20200426
i386                 randconfig-h002-20200426
sparc                randconfig-a001-20200421
ia64                 randconfig-a001-20200421
powerpc              randconfig-a001-20200421
arm                  randconfig-a001-20200421
arc                  randconfig-a001-20200421
sparc                randconfig-a001-20200423
ia64                 randconfig-a001-20200423
arm                  randconfig-a001-20200423
arm64                randconfig-a001-20200423
arc                  randconfig-a001-20200423
sparc                randconfig-a001-20200425
ia64                 randconfig-a001-20200425
powerpc              randconfig-a001-20200425
arm                  randconfig-a001-20200425
arc                  randconfig-a001-20200425
sparc                randconfig-a001-20200424
ia64                 randconfig-a001-20200424
powerpc              randconfig-a001-20200424
arm64                randconfig-a001-20200424
arc                  randconfig-a001-20200424
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
s390                              allnoconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                                allnoconfig
sparc64                             defconfig
sparc64                          allyesconfig
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
