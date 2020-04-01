Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E21B119AEA9
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 17:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732442AbgDAPY7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Apr 2020 11:24:59 -0400
Received: from mga14.intel.com ([192.55.52.115]:54107 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732683AbgDAPY7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 1 Apr 2020 11:24:59 -0400
IronPort-SDR: BKJ0Zqtua1yEOpFrpCj+9nc46NhhDmU48oSwr4ZkQyNtupnoBDGXyf9OmJby6Y4hrEGEtXNntV
 3c1E+9kvKGKA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2020 08:24:58 -0700
IronPort-SDR: vuofOo+wcdX2zAmHhNUdhKC+uSspjJvbo95CP0QHyDdGeJR681gjAGDpaIF9XDCiiErkcN8YGN
 hRUV1Wc8Wg+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,332,1580803200"; 
   d="scan'208";a="359892789"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Apr 2020 08:24:57 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jJfEe-000DVj-Jg; Wed, 01 Apr 2020 23:24:56 +0800
Date:   Wed, 01 Apr 2020 23:24:29 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel] BUILD SUCCESS
 33dd888263199676946f1c789e821d39a9a79d98
Message-ID: <5e84b22d.xas325UoGIC0AlvB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel
branch HEAD: 33dd888263199676946f1c789e821d39a9a79d98  gpio: export of_pinctrl_get to modules

elapsed time: 480m

configs tested: 158
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arm64                            allyesconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
arm64                               defconfig
sparc                            allyesconfig
i386                              allnoconfig
i386                                defconfig
i386                             allyesconfig
i386                             alldefconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
xtensa                          iss_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
arc                                 defconfig
arc                              allyesconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                           allnoconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
x86_64               randconfig-a003-20200401
i386                 randconfig-a002-20200401
x86_64               randconfig-a002-20200401
x86_64               randconfig-a001-20200401
i386                 randconfig-a003-20200401
i386                 randconfig-a001-20200401
x86_64               randconfig-a003-20200331
x86_64               randconfig-a002-20200331
i386                 randconfig-a001-20200331
mips                 randconfig-a001-20200401
nds32                randconfig-a001-20200401
m68k                 randconfig-a001-20200401
alpha                randconfig-a001-20200401
parisc               randconfig-a001-20200401
riscv                randconfig-a001-20200401
sparc64              randconfig-a001-20200401
h8300                randconfig-a001-20200401
nios2                randconfig-a001-20200401
microblaze           randconfig-a001-20200401
c6x                  randconfig-a001-20200401
csky                 randconfig-a001-20200331
s390                 randconfig-a001-20200331
xtensa               randconfig-a001-20200331
openrisc             randconfig-a001-20200331
sh                   randconfig-a001-20200331
s390                 randconfig-a001-20200401
xtensa               randconfig-a001-20200401
csky                 randconfig-a001-20200401
openrisc             randconfig-a001-20200401
sh                   randconfig-a001-20200401
i386                 randconfig-b003-20200401
x86_64               randconfig-b002-20200401
x86_64               randconfig-b003-20200401
i386                 randconfig-b001-20200401
x86_64               randconfig-b001-20200401
i386                 randconfig-b002-20200401
i386                 randconfig-c001-20200401
i386                 randconfig-c003-20200401
x86_64               randconfig-c003-20200401
i386                 randconfig-c002-20200401
x86_64               randconfig-c001-20200401
x86_64               randconfig-d001-20200401
i386                 randconfig-d003-20200401
i386                 randconfig-d001-20200401
x86_64               randconfig-d002-20200401
i386                 randconfig-d002-20200401
i386                 randconfig-e001-20200401
x86_64               randconfig-e002-20200401
i386                 randconfig-e003-20200401
x86_64               randconfig-e001-20200401
i386                 randconfig-e002-20200401
i386                 randconfig-f001-20200401
i386                 randconfig-f003-20200401
x86_64               randconfig-f003-20200401
x86_64               randconfig-f001-20200401
i386                 randconfig-f002-20200401
x86_64               randconfig-f002-20200401
x86_64               randconfig-g003-20200401
x86_64               randconfig-g002-20200401
i386                 randconfig-g001-20200401
i386                 randconfig-g002-20200401
x86_64               randconfig-g001-20200401
i386                 randconfig-g003-20200401
x86_64               randconfig-h002-20200401
i386                 randconfig-h002-20200401
i386                 randconfig-h003-20200401
i386                 randconfig-h001-20200401
x86_64               randconfig-h001-20200401
x86_64               randconfig-h003-20200401
arm64                randconfig-a001-20200401
sparc                randconfig-a001-20200401
ia64                 randconfig-a001-20200401
arc                  randconfig-a001-20200401
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             alldefconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc64                             defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec
x86_64                               rhel-7.6
x86_64                         rhel-7.2-clear

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
