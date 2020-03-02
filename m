Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B02601763BD
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2020 20:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbgCBTV5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Mar 2020 14:21:57 -0500
Received: from mga12.intel.com ([192.55.52.136]:38871 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727126AbgCBTV5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Mar 2020 14:21:57 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Mar 2020 11:21:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,508,1574150400"; 
   d="scan'208";a="440251608"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Mar 2020 11:21:55 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j8qdW-000DJU-Hu; Tue, 03 Mar 2020 03:21:54 +0800
Date:   Tue, 03 Mar 2020 03:20:57 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 3567ee83c413a939d45fea2e2f2c4968a9f81460
Message-ID: <5e5d5c99.1mo9HiB7NNQDcBuH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  fixes
branch HEAD: 3567ee83c413a939d45fea2e2f2c4968a9f81460  pinctrl: madera: Add missing call to pinctrl_unregister_mappings

elapsed time: 2993m

configs tested: 230
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                              allmodconfig
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
riscv                             allnoconfig
nds32                             allnoconfig
s390                             alldefconfig
mips                             allmodconfig
s390                              allnoconfig
arc                                 defconfig
parisc                generic-64bit_defconfig
m68k                             allmodconfig
openrisc                    or1ksim_defconfig
m68k                           sun3_defconfig
xtensa                          iss_defconfig
i386                             alldefconfig
arc                              allyesconfig
m68k                       m5475evb_defconfig
nios2                         3c120_defconfig
h8300                     edosk2674_defconfig
m68k                          multi_defconfig
c6x                              allyesconfig
s390                          debug_defconfig
sh                            titan_defconfig
openrisc                 simple_smp_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
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
m68k                 randconfig-a001-20200302
mips                 randconfig-a001-20200302
nds32                randconfig-a001-20200302
riscv                randconfig-a001-20200302
alpha                randconfig-a001-20200301
m68k                 randconfig-a001-20200301
mips                 randconfig-a001-20200301
nds32                randconfig-a001-20200301
parisc               randconfig-a001-20200301
riscv                randconfig-a001-20200301
c6x                  randconfig-a001-20200301
h8300                randconfig-a001-20200301
microblaze           randconfig-a001-20200301
nios2                randconfig-a001-20200301
sparc64              randconfig-a001-20200301
c6x                  randconfig-a001-20200302
microblaze           randconfig-a001-20200302
csky                 randconfig-a001-20200302
s390                 randconfig-a001-20200302
sh                   randconfig-a001-20200302
xtensa               randconfig-a001-20200302
csky                 randconfig-a001-20200301
openrisc             randconfig-a001-20200301
s390                 randconfig-a001-20200301
xtensa               randconfig-a001-20200301
sh                   randconfig-a001-20200301
x86_64               randconfig-b001-20200301
x86_64               randconfig-b002-20200301
x86_64               randconfig-b003-20200301
i386                 randconfig-b001-20200301
i386                 randconfig-b002-20200301
i386                 randconfig-b003-20200301
x86_64               randconfig-b001-20200302
x86_64               randconfig-b002-20200302
x86_64               randconfig-b003-20200302
i386                 randconfig-b001-20200302
i386                 randconfig-b002-20200302
i386                 randconfig-b003-20200302
x86_64               randconfig-c001-20200301
x86_64               randconfig-c002-20200301
x86_64               randconfig-c003-20200301
i386                 randconfig-c001-20200301
i386                 randconfig-c002-20200301
i386                 randconfig-c003-20200301
x86_64               randconfig-c001-20200302
x86_64               randconfig-c002-20200302
x86_64               randconfig-c003-20200302
i386                 randconfig-c001-20200302
i386                 randconfig-c002-20200302
i386                 randconfig-c003-20200302
x86_64               randconfig-d001-20200301
x86_64               randconfig-d002-20200301
x86_64               randconfig-d003-20200301
i386                 randconfig-d001-20200301
i386                 randconfig-d002-20200301
i386                 randconfig-d003-20200301
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
x86_64               randconfig-f001-20200301
x86_64               randconfig-f002-20200301
x86_64               randconfig-f003-20200301
i386                 randconfig-f001-20200301
i386                 randconfig-f002-20200301
i386                 randconfig-f003-20200301
x86_64               randconfig-f001-20200302
x86_64               randconfig-f002-20200302
x86_64               randconfig-f003-20200302
i386                 randconfig-f001-20200302
i386                 randconfig-f002-20200302
i386                 randconfig-f003-20200302
i386                 randconfig-g002-20200302
i386                 randconfig-g003-20200302
x86_64               randconfig-g001-20200302
x86_64               randconfig-g002-20200302
x86_64               randconfig-g003-20200302
i386                 randconfig-g001-20200302
x86_64               randconfig-g001-20200301
x86_64               randconfig-g002-20200301
x86_64               randconfig-g003-20200301
i386                 randconfig-g001-20200301
i386                 randconfig-g002-20200301
i386                 randconfig-g003-20200301
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
arm                  randconfig-a001-20200301
arm64                randconfig-a001-20200301
ia64                 randconfig-a001-20200301
powerpc              randconfig-a001-20200301
sparc                randconfig-a001-20200301
arm64                randconfig-a001-20200302
ia64                 randconfig-a001-20200302
powerpc              randconfig-a001-20200302
arc                  randconfig-a001-20200302
arm                  randconfig-a001-20200302
sparc                randconfig-a001-20200302
riscv                            allmodconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
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
