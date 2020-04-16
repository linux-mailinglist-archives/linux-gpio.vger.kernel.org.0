Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 664211AD2C9
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 00:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728882AbgDPWXB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 18:23:01 -0400
Received: from mga18.intel.com ([134.134.136.126]:58513 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728842AbgDPWXA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 18:23:00 -0400
IronPort-SDR: LyBcsSvW5L1npZq6grn3IiQiZ3MhmOeT2UMs86FlPlPQI0liB3gHKfZcOKLw6X5PaMiugBWxfV
 9skPVLME2Aew==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 15:22:59 -0700
IronPort-SDR: w2D+e6lDLu/X9q0xM0AO1S372LB+CRj1VgVi0iYohQ1gBXqTzbKwXqfy8BAo/Zdynqm0CIWX/2
 me7f8Aqb8t0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,392,1580803200"; 
   d="scan'208";a="246122811"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Apr 2020 15:22:55 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jPCuM-000Hyj-AW; Fri, 17 Apr 2020 06:22:54 +0800
Date:   Fri, 17 Apr 2020 06:21:56 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-tty] BUILD SUCCESS
 307e05dc1188254c95191fe2d9aa5ee37ab20612
Message-ID: <5e98da84.EOESiKOWM/ziIbNL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-descriptors-tty
branch HEAD: 307e05dc1188254c95191fe2d9aa5ee37ab20612  serial: lpc32xx_hs: Drop surplus include

elapsed time: 1486m

configs tested: 90
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                              allmodconfig
sparc                            allyesconfig
mips                          ath79_defconfig
mips                            ar7_defconfig
i386                                defconfig
s390                             allmodconfig
riscv                             allnoconfig
microblaze                      mmu_defconfig
s390                                defconfig
m68k                          multi_defconfig
powerpc                             defconfig
ia64                                defconfig
m68k                       m5475evb_defconfig
ia64                         bigsur_defconfig
c6x                              allyesconfig
riscv                               defconfig
nios2                         3c120_defconfig
um                           x86_64_defconfig
m68k                             allmodconfig
openrisc                    or1ksim_defconfig
sparc64                          allmodconfig
arm                           efm32_defconfig
s390                             allyesconfig
s390                          debug_defconfig
nds32                             allnoconfig
csky                                defconfig
ia64                        generic_defconfig
nios2                         10m50_defconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
sh                  sh7785lcr_32bit_defconfig
ia64                             allmodconfig
arm                        shmobile_defconfig
riscv                            allyesconfig
arm                          exynos_defconfig
arm                        multi_v7_defconfig
mips                      fuloong2e_defconfig
mips                              allnoconfig
xtensa                          iss_defconfig
um                                  defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                              debian-10.3
ia64                              allnoconfig
ia64                          tiger_defconfig
ia64                             allyesconfig
ia64                             alldefconfig
c6x                        evmc6678_defconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
parisc                           allmodconfig
i386                 randconfig-a002-20200416
i386                 randconfig-a003-20200416
i386                 randconfig-a001-20200416
x86_64               randconfig-a001-20200416
x86_64               randconfig-a002-20200416
x86_64               randconfig-a003-20200416
riscv                    nommu_virt_defconfig
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
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
um                             i386_defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
