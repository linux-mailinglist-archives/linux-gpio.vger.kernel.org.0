Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1B917640E
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2020 20:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727644AbgCBTgJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Mar 2020 14:36:09 -0500
Received: from mga01.intel.com ([192.55.52.88]:16700 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727372AbgCBTgI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Mar 2020 14:36:08 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Mar 2020 11:36:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,508,1574150400"; 
   d="scan'208";a="438397939"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Mar 2020 11:36:06 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j8qrG-0006lH-8Y; Tue, 03 Mar 2020 03:36:06 +0800
Date:   Tue, 03 Mar 2020 03:35:42 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:for-next] BUILD SUCCESS
 27a2a9a4fa1f84d99a649134aab7367464a1762b
Message-ID: <5e5d600e.z0PtStpy7tSbYskn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  for-next
branch HEAD: 27a2a9a4fa1f84d99a649134aab7367464a1762b  Merge branch 'devel' into for-next

elapsed time: 2406m

configs tested: 227
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
ia64                                defconfig
powerpc                             defconfig
xtensa                       common_defconfig
arc                                 defconfig
parisc                generic-64bit_defconfig
xtensa                          iss_defconfig
i386                             alldefconfig
alpha                               defconfig
c6x                        evmc6678_defconfig
arc                              allyesconfig
m68k                       m5475evb_defconfig
nios2                         3c120_defconfig
h8300                     edosk2674_defconfig
m68k                          multi_defconfig
openrisc                 simple_smp_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
c6x                              allyesconfig
nios2                         10m50_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                           sun3_defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
x86_64               randconfig-a001-20200301
x86_64               randconfig-a002-20200301
x86_64               randconfig-a003-20200301
i386                 randconfig-a001-20200301
i386                 randconfig-a002-20200301
i386                 randconfig-a003-20200301
x86_64               randconfig-a001-20200302
x86_64               randconfig-a002-20200302
x86_64               randconfig-a003-20200302
i386                 randconfig-a001-20200302
i386                 randconfig-a002-20200302
i386                 randconfig-a003-20200302
alpha                randconfig-a001-20200302
parisc               randconfig-a001-20200302
alpha                randconfig-a001-20200301
m68k                 randconfig-a001-20200301
mips                 randconfig-a001-20200301
nds32                randconfig-a001-20200301
parisc               randconfig-a001-20200301
riscv                randconfig-a001-20200301
m68k                 randconfig-a001-20200302
mips                 randconfig-a001-20200302
nds32                randconfig-a001-20200302
riscv                randconfig-a001-20200302
sparc64              randconfig-a001-20200301
c6x                  randconfig-a001-20200301
nios2                randconfig-a001-20200301
h8300                randconfig-a001-20200301
c6x                  randconfig-a001-20200302
microblaze           randconfig-a001-20200302
csky                 randconfig-a001-20200302
s390                 randconfig-a001-20200302
sh                   randconfig-a001-20200302
xtensa               randconfig-a001-20200302
sh                   randconfig-a001-20200301
openrisc             randconfig-a001-20200301
csky                 randconfig-a001-20200301
s390                 randconfig-a001-20200301
xtensa               randconfig-a001-20200301
x86_64               randconfig-b001-20200301
x86_64               randconfig-b002-20200301
i386                 randconfig-b001-20200301
i386                 randconfig-b003-20200301
i386                 randconfig-b002-20200301
x86_64               randconfig-b003-20200301
x86_64               randconfig-b001-20200302
x86_64               randconfig-b002-20200302
x86_64               randconfig-b003-20200302
i386                 randconfig-b001-20200302
i386                 randconfig-b002-20200302
i386                 randconfig-b003-20200302
i386                 randconfig-c002-20200301
x86_64               randconfig-c003-20200301
i386                 randconfig-c001-20200301
x86_64               randconfig-c002-20200301
i386                 randconfig-c003-20200301
x86_64               randconfig-c001-20200301
x86_64               randconfig-c001-20200302
x86_64               randconfig-c002-20200302
x86_64               randconfig-c003-20200302
i386                 randconfig-c001-20200302
i386                 randconfig-c002-20200302
i386                 randconfig-c003-20200302
i386                 randconfig-d001-20200301
x86_64               randconfig-d003-20200301
x86_64               randconfig-d001-20200301
i386                 randconfig-d003-20200301
i386                 randconfig-d002-20200301
x86_64               randconfig-d002-20200301
x86_64               randconfig-d001-20200302
i386                 randconfig-d001-20200302
x86_64               randconfig-d002-20200302
x86_64               randconfig-d003-20200302
i386                 randconfig-d002-20200302
i386                 randconfig-d003-20200302
x86_64               randconfig-e001-20200301
x86_64               randconfig-e002-20200301
x86_64               randconfig-e003-20200301
i386                 randconfig-e001-20200301
i386                 randconfig-e002-20200301
i386                 randconfig-e003-20200301
x86_64               randconfig-e001-20200302
x86_64               randconfig-e002-20200302
x86_64               randconfig-e003-20200302
i386                 randconfig-e001-20200302
i386                 randconfig-e002-20200302
i386                 randconfig-e003-20200302
i386                 randconfig-f003-20200301
x86_64               randconfig-f001-20200301
i386                 randconfig-f001-20200301
i386                 randconfig-f002-20200301
x86_64               randconfig-f002-20200301
x86_64               randconfig-f003-20200301
x86_64               randconfig-f001-20200302
x86_64               randconfig-f002-20200302
x86_64               randconfig-f003-20200302
i386                 randconfig-f001-20200302
i386                 randconfig-f002-20200302
i386                 randconfig-f003-20200302
i386                 randconfig-g003-20200301
x86_64               randconfig-g003-20200301
i386                 randconfig-g001-20200301
x86_64               randconfig-g001-20200301
x86_64               randconfig-g002-20200301
i386                 randconfig-g002-20200301
i386                 randconfig-g002-20200302
i386                 randconfig-g003-20200302
x86_64               randconfig-g001-20200302
x86_64               randconfig-g002-20200302
x86_64               randconfig-g003-20200302
i386                 randconfig-g001-20200302
x86_64               randconfig-h001-20200301
x86_64               randconfig-h002-20200301
x86_64               randconfig-h003-20200301
i386                 randconfig-h001-20200301
i386                 randconfig-h002-20200301
i386                 randconfig-h003-20200301
x86_64               randconfig-h001-20200302
x86_64               randconfig-h002-20200302
x86_64               randconfig-h003-20200302
i386                 randconfig-h001-20200302
i386                 randconfig-h002-20200302
i386                 randconfig-h003-20200302
arc                  randconfig-a001-20200301
sparc                randconfig-a001-20200301
ia64                 randconfig-a001-20200301
arm                  randconfig-a001-20200301
arm64                randconfig-a001-20200301
arm64                randconfig-a001-20200302
ia64                 randconfig-a001-20200302
powerpc              randconfig-a001-20200302
arc                  randconfig-a001-20200302
arm                  randconfig-a001-20200302
sparc                randconfig-a001-20200302
powerpc              randconfig-a001-20200301
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             alldefconfig
s390                                defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
