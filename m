Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 989351DA03F
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2020 21:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgESTBd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 May 2020 15:01:33 -0400
Received: from mga09.intel.com ([134.134.136.24]:11904 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726344AbgESTBc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 May 2020 15:01:32 -0400
IronPort-SDR: XZVgAOiudLiY/29aZCeY4/We/3wzd3m0wKXEdz+JvfrF9Mh7yljrl7k6YnmRi92zboKuSpsdQg
 hSwIgqAxCDGQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 12:01:32 -0700
IronPort-SDR: jHnHtHE7nlrJtqHkTaTrJzZ5qifyV18yFcvL9/4/DlB5A9HiGpk2Du6MZdTrCPPwrOcO7bnh4s
 6S9jPTAOXelA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="267988288"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 May 2020 12:01:30 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jb7UX-000HkE-Sd; Wed, 20 May 2020 03:01:29 +0800
Date:   Wed, 20 May 2020 03:00:49 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:for-next] BUILD SUCCESS
 a3bc02eb6fe3a86e4157815b86f243fb6bb6e2d0
Message-ID: <5ec42ce1.tvbbqGOTK7m8+2OZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  for-next
branch HEAD: a3bc02eb6fe3a86e4157815b86f243fb6bb6e2d0  Merge branch 'devel' into for-next

elapsed time: 526m

configs tested: 126
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
mips                             allyesconfig
m68k                             allyesconfig
xtensa                generic_kc705_defconfig
ia64                            zx1_defconfig
arm                      integrator_defconfig
arm                     davinci_all_defconfig
sh                          r7780mp_defconfig
ia64                                defconfig
arm                           sunxi_defconfig
sh                         microdev_defconfig
mips                              allnoconfig
arm                          exynos_defconfig
riscv                             allnoconfig
arm                       mainstone_defconfig
sh                          kfr2r09_defconfig
m68k                        m5407c3_defconfig
c6x                        evmc6472_defconfig
mips                           ci20_defconfig
arm                       omap2plus_defconfig
sh                                  defconfig
sh                           se7722_defconfig
powerpc64                           defconfig
riscv                          rv32_defconfig
arc                        nsimosci_defconfig
arc                        vdk_hs38_defconfig
sh                           se7751_defconfig
arm                       netwinder_defconfig
arm                          iop32x_defconfig
mips                          ath25_defconfig
arm                       aspeed_g4_defconfig
arm                         at91_dt_defconfig
nios2                            allyesconfig
sparc                       sparc64_defconfig
arm                       multi_v4t_defconfig
i386                              allnoconfig
i386                                defconfig
i386                              debian-10.3
i386                             allyesconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
nios2                               defconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200519
i386                 randconfig-a005-20200519
i386                 randconfig-a001-20200519
i386                 randconfig-a003-20200519
i386                 randconfig-a004-20200519
i386                 randconfig-a002-20200519
x86_64               randconfig-a003-20200519
x86_64               randconfig-a005-20200519
x86_64               randconfig-a004-20200519
x86_64               randconfig-a006-20200519
x86_64               randconfig-a002-20200519
x86_64               randconfig-a001-20200519
i386                 randconfig-a012-20200519
i386                 randconfig-a014-20200519
i386                 randconfig-a016-20200519
i386                 randconfig-a011-20200519
i386                 randconfig-a015-20200519
i386                 randconfig-a013-20200519
riscv                            allyesconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
x86_64                              defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allyesconfig
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
