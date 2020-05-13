Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCDA1D1B46
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 18:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732422AbgEMQkf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 12:40:35 -0400
Received: from mga06.intel.com ([134.134.136.31]:44538 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732510AbgEMQke (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 May 2020 12:40:34 -0400
IronPort-SDR: L0SnKgRAIF7875fBI04sZNb+KczGTfrWzWarudm+eOLUEu1JlNTiOkRRboM5rSwE4lrvg+bvi2
 inxuT+sZX3yg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 09:40:34 -0700
IronPort-SDR: BnQ0yMbeXsHC1nmnZh5cIE1I7K3RMf+bjjtqAygt00CYhQSrm9qU0IVwqGvEmDCQpNt5DV6pht
 iOu7gmuOlVRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,388,1583222400"; 
   d="scan'208";a="297727767"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 May 2020 09:40:33 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jYuQq-000A61-J0; Thu, 14 May 2020 00:40:32 +0800
Date:   Thu, 14 May 2020 00:40:00 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 45d0618e021a088da39f18768a6d5ae35a411bb0
Message-ID: <5ebc22e0.K4JcgYqqIAx6FPlZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  for-next
branch HEAD: 45d0618e021a088da39f18768a6d5ae35a411bb0  Merge branch 'devel' into for-next

elapsed time: 485m

configs tested: 123
configs skipped: 7

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
m68k                             allyesconfig
sparc                            allyesconfig
mips                          rm200_defconfig
riscv                    nommu_virt_defconfig
mips                      pistachio_defconfig
xtensa                           alldefconfig
sh                           se7722_defconfig
openrisc                         alldefconfig
arm                        cerfcube_defconfig
arm                         assabet_defconfig
sh                ecovec24-romimage_defconfig
arc                            hsdk_defconfig
arm                          iop32x_defconfig
riscv                             allnoconfig
sh                   sh7724_generic_defconfig
m68k                          amiga_defconfig
c6x                                 defconfig
sh                            titan_defconfig
mips                       capcella_defconfig
arm                       spear13xx_defconfig
arc                        nsimosci_defconfig
arm                         shannon_defconfig
nios2                            alldefconfig
arm                           corgi_defconfig
arm                         lpc32xx_defconfig
mips                      loongson3_defconfig
arc                          axs101_defconfig
mips                     loongson1c_defconfig
c6x                        evmc6472_defconfig
um                               alldefconfig
arm                        clps711x_defconfig
powerpc                    adder875_defconfig
parisc                generic-64bit_defconfig
arm                        vexpress_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
nios2                               defconfig
nios2                            allyesconfig
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
mips                             allyesconfig
mips                              allnoconfig
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
x86_64               randconfig-a005-20200513
x86_64               randconfig-a003-20200513
x86_64               randconfig-a006-20200513
x86_64               randconfig-a004-20200513
x86_64               randconfig-a001-20200513
x86_64               randconfig-a002-20200513
i386                 randconfig-a006-20200513
i386                 randconfig-a005-20200513
i386                 randconfig-a003-20200513
i386                 randconfig-a001-20200513
i386                 randconfig-a004-20200513
i386                 randconfig-a002-20200513
riscv                            allyesconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
x86_64                              defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
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
