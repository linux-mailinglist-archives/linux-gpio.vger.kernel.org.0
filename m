Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C11DC1B8AC8
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Apr 2020 03:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgDZB21 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Apr 2020 21:28:27 -0400
Received: from mga12.intel.com ([192.55.52.136]:50554 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725931AbgDZB21 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 25 Apr 2020 21:28:27 -0400
IronPort-SDR: xCDH93eb3HL9E7Vr825s1z8G6g1PXiUQo7pCPWTxngqCb1ZyT6NRc/mmrIayOUkYT24P93rwgL
 MUYc7Zq755VA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2020 18:28:26 -0700
IronPort-SDR: cs6Q4WBHDm01uqimdZwarY5Od4c03nQWl6e3IVHV93s+hRPvlehB6StC3Z29z5MN5zrjbxnssH
 zbVbcVteiasw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,318,1583222400"; 
   d="scan'208";a="247002231"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 25 Apr 2020 18:28:25 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jSW5o-000CKY-DD; Sun, 26 Apr 2020 09:28:24 +0800
Date:   Sun, 26 Apr 2020 09:26:29 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:dwapb] BUILD SUCCESS
 fe5dfc6af3eb25b2778f9e553686ed9383f6069d
Message-ID: <5ea4e345.AC1pP03yTV29eFZq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  dwapb
branch HEAD: fe5dfc6af3eb25b2778f9e553686ed9383f6069d  MAINTAINERS: Add Segey Semin to maintainers of DW APB GPIO driver

elapsed time: 14631m

configs tested: 198
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
mips                            ar7_defconfig
i386                                defconfig
s390                             allmodconfig
riscv                             allnoconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
sparc64                           allnoconfig
mips                             allmodconfig
microblaze                      mmu_defconfig
s390                                defconfig
m68k                          multi_defconfig
arc                                 defconfig
xtensa                          iss_defconfig
s390                             allyesconfig
ia64                              allnoconfig
powerpc                             defconfig
ia64                                defconfig
m68k                       m5475evb_defconfig
ia64                         bigsur_defconfig
c6x                              allyesconfig
ia64                             alldefconfig
i386                              allnoconfig
sh                  sh7785lcr_32bit_defconfig
ia64                        generic_defconfig
riscv                               defconfig
nios2                         3c120_defconfig
um                           x86_64_defconfig
m68k                             allmodconfig
openrisc                    or1ksim_defconfig
sparc64                          allmodconfig
sparc64                             defconfig
s390                          debug_defconfig
nds32                             allnoconfig
csky                                defconfig
um                                  defconfig
mips                       capcella_defconfig
mips                malta_kvm_guest_defconfig
m68k                           sun3_defconfig
ia64                             allmodconfig
riscv                    nommu_virt_defconfig
mips                      fuloong2e_defconfig
mips                              allnoconfig
powerpc                           allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                              debian-10.3
ia64                          tiger_defconfig
ia64                             allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
nds32                               defconfig
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
mips                         tb0287_defconfig
mips                           ip32_defconfig
mips                  decstation_64_defconfig
mips                      loongson3_defconfig
mips                        bcm63xx_defconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
parisc                           allmodconfig
parisc               randconfig-a001-20200421
alpha                randconfig-a001-20200421
mips                 randconfig-a001-20200421
m68k                 randconfig-a001-20200421
riscv                randconfig-a001-20200421
nds32                randconfig-a001-20200421
nios2                randconfig-a001-20200421
h8300                randconfig-a001-20200421
c6x                  randconfig-a001-20200421
sparc64              randconfig-a001-20200421
microblaze           randconfig-a001-20200421
sh                   randconfig-a001-20200421
csky                 randconfig-a001-20200421
s390                 randconfig-a001-20200421
xtensa               randconfig-a001-20200421
openrisc             randconfig-a001-20200421
i386                 randconfig-a002-20200416
i386                 randconfig-a003-20200416
i386                 randconfig-a001-20200416
x86_64               randconfig-a001-20200416
x86_64               randconfig-a002-20200416
x86_64               randconfig-a003-20200416
i386                 randconfig-b002-20200421
i386                 randconfig-b001-20200421
x86_64               randconfig-b001-20200421
i386                 randconfig-b003-20200421
x86_64               randconfig-b002-20200421
x86_64               randconfig-b003-20200421
i386                 randconfig-b002-20200422
i386                 randconfig-b001-20200422
x86_64               randconfig-b001-20200422
i386                 randconfig-b003-20200422
x86_64               randconfig-b003-20200422
i386                 randconfig-c002-20200421
i386                 randconfig-c001-20200421
x86_64               randconfig-c002-20200421
x86_64               randconfig-c001-20200421
i386                 randconfig-c003-20200421
x86_64               randconfig-c003-20200421
x86_64               randconfig-d001-20200421
x86_64               randconfig-d002-20200421
i386                 randconfig-d002-20200421
i386                 randconfig-d001-20200421
x86_64               randconfig-d003-20200421
i386                 randconfig-d003-20200421
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
i386                 randconfig-e003-20200422
x86_64               randconfig-e003-20200422
i386                 randconfig-e002-20200422
i386                 randconfig-e001-20200422
x86_64               randconfig-e001-20200422
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
i386                 randconfig-g003-20200422
x86_64               randconfig-g001-20200422
i386                 randconfig-g001-20200422
x86_64               randconfig-g002-20200422
i386                 randconfig-g002-20200422
x86_64               randconfig-g003-20200422
i386                 randconfig-h003-20200421
x86_64               randconfig-h001-20200421
x86_64               randconfig-h003-20200421
i386                 randconfig-h002-20200421
i386                 randconfig-h001-20200421
sparc                randconfig-a001-20200421
ia64                 randconfig-a001-20200421
powerpc              randconfig-a001-20200421
arm                  randconfig-a001-20200421
arc                  randconfig-a001-20200421
riscv                            allyesconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                       zfcpdump_defconfig
s390                              allnoconfig
s390                             alldefconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                          allyesconfig
um                             i386_defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec
x86_64                         rhel-7.2-clear

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
