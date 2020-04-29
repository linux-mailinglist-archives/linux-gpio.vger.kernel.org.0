Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55A341BE383
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 18:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgD2QMv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 12:12:51 -0400
Received: from mga18.intel.com ([134.134.136.126]:21356 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbgD2QMv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Apr 2020 12:12:51 -0400
IronPort-SDR: hDX6MBKyXiPD9tSJXTraC5mu58A60nVOrTlrOSqr/LqOvuYp7kfb+DvsWB6a9g+wC0FnQ1KCj9
 Ml4nD32mX1qQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 09:12:50 -0700
IronPort-SDR: 3j2hq+7yamrx56s8ko71PxybLW7FdmW/Wk0L64JZVuXgl+NrEldqWSBmPyK5ze/AkESTN/Pe5X
 W6RbqrFhmIrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; 
   d="scan'208";a="249495336"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 29 Apr 2020 09:12:49 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jTpKK-000DDZ-F0; Thu, 30 Apr 2020 00:12:48 +0800
Date:   Thu, 30 Apr 2020 00:12:24 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 9e692aa8d3f8c0a98477158d6a62fe1d5988a873
Message-ID: <5ea9a768.j8LVf478EEyxeLJx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  for-next
branch HEAD: 9e692aa8d3f8c0a98477158d6a62fe1d5988a873  Merge branch 'devel' into for-next

elapsed time: 512m

configs tested: 178
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
sparc                            allyesconfig
sparc64                             defconfig
mips                      fuloong2e_defconfig
xtensa                          iss_defconfig
parisc                           allmodconfig
s390                          debug_defconfig
h8300                     edosk2674_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                        generic_defconfig
ia64                          tiger_defconfig
ia64                         bigsur_defconfig
ia64                             allyesconfig
ia64                             alldefconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
m68k                       bvme6000_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                    h8300h-sim_defconfig
xtensa                       common_defconfig
arc                                 defconfig
arc                              allyesconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
mips                      malta_kvm_defconfig
mips                            ar7_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
mips                malta_kvm_guest_defconfig
mips                         tb0287_defconfig
mips                       capcella_defconfig
mips                           ip32_defconfig
mips                  decstation_64_defconfig
mips                      loongson3_defconfig
mips                          ath79_defconfig
mips                        bcm63xx_defconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
powerpc                      chrp32_defconfig
powerpc                             defconfig
powerpc                       holly_defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
powerpc                           allnoconfig
powerpc                  mpc866_ads_defconfig
powerpc                    amigaone_defconfig
powerpc                    adder875_defconfig
powerpc                     ep8248e_defconfig
powerpc                          g5_defconfig
powerpc                     mpc512x_defconfig
parisc               randconfig-a001-20200429
m68k                 randconfig-a001-20200429
alpha                randconfig-a001-20200429
mips                 randconfig-a001-20200429
nds32                randconfig-a001-20200429
riscv                randconfig-a001-20200429
nios2                randconfig-a001-20200429
h8300                randconfig-a001-20200429
c6x                  randconfig-a001-20200429
sparc64              randconfig-a001-20200429
microblaze           randconfig-a001-20200429
sh                   randconfig-a001-20200429
csky                 randconfig-a001-20200429
s390                 randconfig-a001-20200429
xtensa               randconfig-a001-20200429
openrisc             randconfig-a001-20200429
i386                 randconfig-b002-20200429
i386                 randconfig-b001-20200429
x86_64               randconfig-b001-20200429
i386                 randconfig-b003-20200429
x86_64               randconfig-b002-20200429
x86_64               randconfig-b003-20200429
i386                 randconfig-c002-20200429
i386                 randconfig-c001-20200429
x86_64               randconfig-c002-20200429
x86_64               randconfig-c001-20200429
i386                 randconfig-c003-20200429
x86_64               randconfig-c003-20200429
x86_64               randconfig-d001-20200428
i386                 randconfig-d002-20200428
i386                 randconfig-d001-20200428
x86_64               randconfig-d003-20200428
i386                 randconfig-d003-20200428
x86_64               randconfig-d001-20200429
x86_64               randconfig-d002-20200429
i386                 randconfig-d002-20200429
i386                 randconfig-d001-20200429
x86_64               randconfig-d003-20200429
i386                 randconfig-d003-20200429
x86_64               randconfig-e002-20200429
i386                 randconfig-e003-20200429
i386                 randconfig-e002-20200429
x86_64               randconfig-e003-20200429
i386                 randconfig-e001-20200429
x86_64               randconfig-e001-20200429
i386                 randconfig-f002-20200429
i386                 randconfig-f003-20200429
x86_64               randconfig-f003-20200429
i386                 randconfig-f001-20200429
x86_64               randconfig-f001-20200429
x86_64               randconfig-h001-20200429
i386                 randconfig-h003-20200429
x86_64               randconfig-h003-20200429
i386                 randconfig-h002-20200429
i386                 randconfig-h001-20200429
sparc                randconfig-a001-20200429
ia64                 randconfig-a001-20200429
powerpc              randconfig-a001-20200429
arm                  randconfig-a001-20200429
arc                  randconfig-a001-20200429
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                       zfcpdump_defconfig
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
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
