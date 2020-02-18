Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9179F1625DF
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 13:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgBRMAj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 07:00:39 -0500
Received: from mga05.intel.com ([192.55.52.43]:46660 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726206AbgBRMAj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Feb 2020 07:00:39 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 04:00:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; 
   d="scan'208";a="228267870"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Feb 2020 04:00:37 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j41YK-000Ec4-Lu; Tue, 18 Feb 2020 20:00:36 +0800
Date:   Tue, 18 Feb 2020 19:59:45 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 c93214689f0c70b6942ba1d12b8371b9fc60ae41
Message-ID: <5e4bd1b1.4DSI1qHSpVMMb3NQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  devel
branch HEAD: c93214689f0c70b6942ba1d12b8371b9fc60ae41  MAINTAINERS: Sort entries in database for PIN CONTROLLER

elapsed time: 4975m

configs tested: 206
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
m68k                          multi_defconfig
riscv                             allnoconfig
powerpc                       ppc64_defconfig
sh                                allnoconfig
h8300                       h8s-sim_defconfig
s390                              allnoconfig
i386                             allyesconfig
microblaze                      mmu_defconfig
s390                                defconfig
m68k                           sun3_defconfig
nios2                         3c120_defconfig
m68k                             allmodconfig
arc                                 defconfig
parisc                            allnoconfig
mips                      malta_kvm_defconfig
openrisc                    or1ksim_defconfig
um                           x86_64_defconfig
mips                             allmodconfig
ia64                                defconfig
csky                                defconfig
um                                  defconfig
mips                             allyesconfig
nds32                               defconfig
sparc                            allyesconfig
powerpc                           allnoconfig
riscv                               defconfig
c6x                        evmc6678_defconfig
xtensa                          iss_defconfig
sparc64                             defconfig
s390                             allmodconfig
i386                              allnoconfig
alpha                               defconfig
i386                             alldefconfig
ia64                             allmodconfig
i386                                defconfig
ia64                             alldefconfig
ia64                              allnoconfig
ia64                             allyesconfig
c6x                              allyesconfig
nios2                         10m50_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
nds32                             allnoconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
m68k                       m5475evb_defconfig
arc                              allyesconfig
microblaze                    nommu_defconfig
powerpc                             defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                      fuloong2e_defconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200215
x86_64               randconfig-a002-20200215
x86_64               randconfig-a003-20200215
i386                 randconfig-a001-20200215
i386                 randconfig-a002-20200215
i386                 randconfig-a003-20200215
x86_64               randconfig-a001-20200218
x86_64               randconfig-a002-20200218
x86_64               randconfig-a003-20200218
i386                 randconfig-a001-20200218
i386                 randconfig-a002-20200218
i386                 randconfig-a003-20200218
alpha                randconfig-a001-20200218
m68k                 randconfig-a001-20200218
mips                 randconfig-a001-20200218
nds32                randconfig-a001-20200218
parisc               randconfig-a001-20200218
riscv                randconfig-a001-20200218
csky                 randconfig-a001-20200214
openrisc             randconfig-a001-20200214
s390                 randconfig-a001-20200214
xtensa               randconfig-a001-20200214
x86_64               randconfig-b001-20200214
x86_64               randconfig-b002-20200214
x86_64               randconfig-b003-20200214
i386                 randconfig-b001-20200214
i386                 randconfig-b002-20200214
i386                 randconfig-b003-20200214
x86_64               randconfig-b001-20200218
x86_64               randconfig-b002-20200218
x86_64               randconfig-b003-20200218
i386                 randconfig-b001-20200218
i386                 randconfig-b002-20200218
i386                 randconfig-b003-20200218
x86_64               randconfig-c001-20200214
x86_64               randconfig-c002-20200214
x86_64               randconfig-c003-20200214
i386                 randconfig-c001-20200214
i386                 randconfig-c002-20200214
i386                 randconfig-c003-20200214
x86_64               randconfig-c001-20200218
x86_64               randconfig-c002-20200218
x86_64               randconfig-c003-20200218
i386                 randconfig-c001-20200218
i386                 randconfig-c002-20200218
i386                 randconfig-c003-20200218
x86_64               randconfig-d001-20200218
x86_64               randconfig-d002-20200218
x86_64               randconfig-d003-20200218
i386                 randconfig-d001-20200218
i386                 randconfig-d002-20200218
i386                 randconfig-d003-20200218
x86_64               randconfig-d001-20200214
x86_64               randconfig-d002-20200214
x86_64               randconfig-d003-20200214
i386                 randconfig-d001-20200214
i386                 randconfig-d002-20200214
i386                 randconfig-d003-20200214
x86_64               randconfig-d001-20200215
x86_64               randconfig-d002-20200215
x86_64               randconfig-d003-20200215
i386                 randconfig-d001-20200215
i386                 randconfig-d002-20200215
i386                 randconfig-d003-20200215
x86_64               randconfig-e001-20200218
x86_64               randconfig-e002-20200218
x86_64               randconfig-e003-20200218
i386                 randconfig-e001-20200218
i386                 randconfig-e002-20200218
i386                 randconfig-e003-20200218
x86_64               randconfig-e001-20200214
x86_64               randconfig-e002-20200214
x86_64               randconfig-e003-20200214
i386                 randconfig-e001-20200214
i386                 randconfig-e002-20200214
i386                 randconfig-e003-20200214
x86_64               randconfig-f001-20200218
x86_64               randconfig-f002-20200218
x86_64               randconfig-f003-20200218
i386                 randconfig-f001-20200218
i386                 randconfig-f002-20200218
i386                 randconfig-f003-20200218
i386                 randconfig-g001-20200214
i386                 randconfig-g002-20200214
x86_64               randconfig-g003-20200214
i386                 randconfig-g003-20200214
x86_64               randconfig-g001-20200214
x86_64               randconfig-g002-20200214
x86_64               randconfig-g001-20200218
x86_64               randconfig-g002-20200218
x86_64               randconfig-g003-20200218
i386                 randconfig-g001-20200218
i386                 randconfig-g002-20200218
i386                 randconfig-g003-20200218
x86_64               randconfig-h001-20200218
x86_64               randconfig-h002-20200218
x86_64               randconfig-h003-20200218
i386                 randconfig-h001-20200218
i386                 randconfig-h002-20200218
i386                 randconfig-h003-20200218
x86_64               randconfig-h001-20200214
x86_64               randconfig-h002-20200214
x86_64               randconfig-h003-20200214
i386                 randconfig-h001-20200214
i386                 randconfig-h002-20200214
i386                 randconfig-h003-20200214
arc                  randconfig-a001-20200214
arm                  randconfig-a001-20200214
arm64                randconfig-a001-20200214
ia64                 randconfig-a001-20200214
powerpc              randconfig-a001-20200214
sparc                randconfig-a001-20200214
riscv                            allmodconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
um                             i386_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
