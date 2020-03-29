Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2202619705F
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2020 22:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbgC2Uzh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 29 Mar 2020 16:55:37 -0400
Received: from mga14.intel.com ([192.55.52.115]:52472 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727101AbgC2Uzh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 29 Mar 2020 16:55:37 -0400
IronPort-SDR: wb47AmJstzlxXI5o0zp1DSNnwdgxNJYcZgPH5LBkSULvGs2PT+Xxay7+nNC3nv59GmIW5ePg21
 gFU+cUm/d1yQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2020 13:55:36 -0700
IronPort-SDR: m5CqzSpR/ueDrPxW4d7vgTMIadGAghrGAsINEOThj0BEO0XhoyzmbQ1ChBQbUPQM0zzOhoeQ5i
 UeA59aAULU9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,321,1580803200"; 
   d="scan'208";a="394924745"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Mar 2020 13:55:35 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jIexy-0006OM-Lq; Mon, 30 Mar 2020 04:55:34 +0800
Date:   Mon, 30 Mar 2020 04:54:34 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-variable-naming] BUILD SUCCESS
 6ce316651a9f236e7204494a4fa080aaf59d5a9d
Message-ID: <5e810b0a.Vyh3gb6eIsRUhjqf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-variable-naming
branch HEAD: 6ce316651a9f236e7204494a4fa080aaf59d5a9d  gpio: Rename variable in core APIs

elapsed time: 480m

configs tested: 149
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
arc                              allyesconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
xtensa                          iss_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                                 defconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
i386                 randconfig-a002-20200329
x86_64               randconfig-a001-20200329
i386                 randconfig-a001-20200329
i386                 randconfig-a003-20200329
nds32                randconfig-a001-20200329
mips                 randconfig-a001-20200329
parisc               randconfig-a001-20200329
m68k                 randconfig-a001-20200329
alpha                randconfig-a001-20200329
riscv                randconfig-a001-20200329
h8300                randconfig-a001-20200329
nios2                randconfig-a001-20200329
microblaze           randconfig-a001-20200329
sparc64              randconfig-a001-20200329
c6x                  randconfig-a001-20200329
s390                 randconfig-a001-20200329
xtensa               randconfig-a001-20200329
csky                 randconfig-a001-20200329
openrisc             randconfig-a001-20200329
sh                   randconfig-a001-20200329
i386                 randconfig-b003-20200329
x86_64               randconfig-b003-20200329
i386                 randconfig-b001-20200329
i386                 randconfig-b002-20200329
x86_64               randconfig-b002-20200329
x86_64               randconfig-b001-20200329
i386                 randconfig-d003-20200329
i386                 randconfig-d001-20200329
x86_64               randconfig-d002-20200329
i386                 randconfig-d002-20200329
x86_64               randconfig-d001-20200329
x86_64               randconfig-d003-20200329
x86_64               randconfig-e001-20200329
i386                 randconfig-e002-20200329
x86_64               randconfig-e003-20200329
i386                 randconfig-e003-20200329
x86_64               randconfig-e002-20200329
i386                 randconfig-e001-20200329
i386                 randconfig-f001-20200329
i386                 randconfig-f003-20200329
i386                 randconfig-f002-20200329
x86_64               randconfig-f002-20200329
x86_64               randconfig-f001-20200329
i386                 randconfig-g003-20200329
x86_64               randconfig-g002-20200329
i386                 randconfig-g002-20200329
i386                 randconfig-g001-20200329
x86_64               randconfig-g001-20200329
x86_64               randconfig-h002-20200329
x86_64               randconfig-h003-20200329
i386                 randconfig-h003-20200329
x86_64               randconfig-h001-20200329
i386                 randconfig-h001-20200329
i386                 randconfig-h002-20200329
arm                  randconfig-a001-20200329
arm64                randconfig-a001-20200329
powerpc              randconfig-a001-20200329
ia64                 randconfig-a001-20200329
sparc                randconfig-a001-20200329
arc                  randconfig-a001-20200329
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
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                                   rhel

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
