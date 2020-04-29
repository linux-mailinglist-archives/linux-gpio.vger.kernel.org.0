Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4F01BE7F8
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 22:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbgD2UAX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 16:00:23 -0400
Received: from mga04.intel.com ([192.55.52.120]:9729 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726456AbgD2UAX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Apr 2020 16:00:23 -0400
IronPort-SDR: eOCvIcq6mZLrrQ9r1ClLfqlj/2hFEND52+2IUf9jPemefgrRTyPFSUDJRiLt+bsgp83sR8Hmxv
 Nl+axIV6xK/g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 13:00:22 -0700
IronPort-SDR: Kc44swzA17ijr/IUaG66xTLVBWPM6KajiAbWTcWvk8QzuYqy19398MyU/enlELwdGVG854sulE
 C9/5spvBtaZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,333,1583222400"; 
   d="scan'208";a="246953032"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Apr 2020 13:00:20 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jTssW-000FKe-6o; Thu, 30 Apr 2020 04:00:20 +0800
Date:   Thu, 30 Apr 2020 03:59:40 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:for-next] BUILD SUCCESS
 9e581cd14663a665c32039acb0577f0ea2653f46
Message-ID: <5ea9dcac.flCocDX23sPpxl/J%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  for-next
branch HEAD: 9e581cd14663a665c32039acb0577f0ea2653f46  Merge branch 'devel' into for-next

elapsed time: 739m

configs tested: 173
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
s390                                defconfig
ia64                              allnoconfig
sparc64                             defconfig
mips                      fuloong2e_defconfig
nds32                               defconfig
sparc                               defconfig
s390                          debug_defconfig
xtensa                          iss_defconfig
h8300                     edosk2674_defconfig
sh                  sh7785lcr_32bit_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
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
parisc                           allmodconfig
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
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                                allnoconfig
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
