Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10993191D29
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 23:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbgCXW60 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Mar 2020 18:58:26 -0400
Received: from mga05.intel.com ([192.55.52.43]:11838 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727289AbgCXW60 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Mar 2020 18:58:26 -0400
IronPort-SDR: 81+nnQyrXx4FiLuK0LDKK+G3AfhvM6TBoR+BfjD8AJiEiSOPLNCLHLv3OsIhrHRhQ4f2pfk884
 bCECm3Hhqlpw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2020 15:58:26 -0700
IronPort-SDR: VxmA6aCet1X1sBRYNQcNR4jHUM2W27Pjh4RNEa4x4oxmE99JB5WIX55Xsc0bFh7olfXb/wptDM
 Myq7wt4jp1UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,302,1580803200"; 
   d="scan'208";a="293190463"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Mar 2020 15:58:24 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jGsV5-0009S1-T7; Wed, 25 Mar 2020 06:58:23 +0800
Date:   Wed, 25 Mar 2020 06:57:53 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel] BUILD SUCCESS
 a28e1c0505a09c3a2d81fed1c8453ac2d8d02b3a
Message-ID: <5e7a9071.pn1kIHOqcpSWB3+8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel
branch HEAD: a28e1c0505a09c3a2d81fed1c8453ac2d8d02b3a  gpio: Move devres calls to devres file

elapsed time: 821m

configs tested: 151
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
h8300                     edosk2674_defconfig
sh                                allnoconfig
arc                                 defconfig
riscv                             allnoconfig
i386                             alldefconfig
i386                              allnoconfig
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
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
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
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200324
x86_64               randconfig-a002-20200324
x86_64               randconfig-a003-20200324
i386                 randconfig-a001-20200324
i386                 randconfig-a002-20200324
i386                 randconfig-a003-20200324
alpha                randconfig-a001-20200324
m68k                 randconfig-a001-20200324
mips                 randconfig-a001-20200324
nds32                randconfig-a001-20200324
parisc               randconfig-a001-20200324
riscv                randconfig-a001-20200324
csky                 randconfig-a001-20200324
openrisc             randconfig-a001-20200324
s390                 randconfig-a001-20200324
xtensa               randconfig-a001-20200324
x86_64               randconfig-c003-20200324
i386                 randconfig-c002-20200324
x86_64               randconfig-c001-20200324
x86_64               randconfig-c002-20200324
i386                 randconfig-c003-20200324
i386                 randconfig-c001-20200324
x86_64               randconfig-d001-20200324
x86_64               randconfig-d002-20200324
x86_64               randconfig-d003-20200324
i386                 randconfig-d001-20200324
i386                 randconfig-d002-20200324
i386                 randconfig-d003-20200324
x86_64               randconfig-e001-20200324
i386                 randconfig-e002-20200324
i386                 randconfig-e003-20200324
x86_64               randconfig-e002-20200324
i386                 randconfig-e001-20200324
i386                 randconfig-f001-20200324
i386                 randconfig-f003-20200324
i386                 randconfig-f002-20200324
x86_64               randconfig-f002-20200324
x86_64               randconfig-f003-20200324
x86_64               randconfig-f001-20200324
i386                 randconfig-g003-20200324
x86_64               randconfig-g002-20200324
i386                 randconfig-g001-20200324
i386                 randconfig-g002-20200324
x86_64               randconfig-g001-20200324
x86_64               randconfig-g003-20200324
x86_64               randconfig-h001-20200324
x86_64               randconfig-h002-20200324
x86_64               randconfig-h003-20200324
i386                 randconfig-h001-20200324
i386                 randconfig-h002-20200324
i386                 randconfig-h003-20200324
arc                  randconfig-a001-20200324
arm                  randconfig-a001-20200324
arm64                randconfig-a001-20200324
ia64                 randconfig-a001-20200324
powerpc              randconfig-a001-20200324
sparc                randconfig-a001-20200324
riscv                            allmodconfig
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
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
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
