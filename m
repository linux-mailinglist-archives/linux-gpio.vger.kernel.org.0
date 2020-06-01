Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDA581E9D90
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2020 07:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgFAFxA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jun 2020 01:53:00 -0400
Received: from mga12.intel.com ([192.55.52.136]:10752 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726159AbgFAFxA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Jun 2020 01:53:00 -0400
IronPort-SDR: sGywdqtmsPbRaOaFPuaqnGp4vFnNTPWG3pyXKhuL/8XH0rj6KUlRUUl2A5LyHXfUzsJaeul+fQ
 AX5gxGr99Wgw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2020 22:52:59 -0700
IronPort-SDR: cXb2/fA4o7fBtjUZ/UvFpic0B61bVRv0vKO06QVWzJuHZ9sDJzNtoYVyKa2pekdH6Mk7vLOBpR
 DTOknKkOahfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; 
   d="scan'208";a="256680084"
Received: from lkp-server01.sh.intel.com (HELO 49d03d9b0ee7) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 31 May 2020 22:52:58 -0700
Received: from kbuild by 49d03d9b0ee7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jfdNZ-0000XU-M7; Mon, 01 Jun 2020 05:52:57 +0000
Date:   Mon, 01 Jun 2020 13:52:12 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:fix-opendrain-irq] BUILD SUCCESS
 17df3089eccf2d9ef92448a92a64cda6668d038b
Message-ID: <5ed4978c.+CYuuIn1tLqJPFod%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  fix-opendrain-irq
branch HEAD: 17df3089eccf2d9ef92448a92a64cda6668d038b  gpio: fix locking open drain IRQ lines

elapsed time: 4790m

configs tested: 154
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
sparc                       sparc64_defconfig
mips                  decstation_64_defconfig
mips                          ath79_defconfig
powerpc                      pasemi_defconfig
h8300                            allyesconfig
sh                             sh03_defconfig
sh                           se7343_defconfig
arm                          badge4_defconfig
sh                           se7780_defconfig
sh                          rsk7269_defconfig
mips                             allyesconfig
ia64                        generic_defconfig
arm                       mainstone_defconfig
arm                            hisi_defconfig
powerpc                     mpc83xx_defconfig
m68k                          multi_defconfig
m68k                             allyesconfig
m68k                            q40_defconfig
sh                           se7724_defconfig
mips                malta_qemu_32r6_defconfig
mips                            e55_defconfig
mips                       lemote2f_defconfig
arm                            pleb_defconfig
sh                             espt_defconfig
arm                           omap1_defconfig
arm                       spear13xx_defconfig
sparc64                          allyesconfig
microblaze                    nommu_defconfig
arc                          axs101_defconfig
powerpc                       maple_defconfig
nds32                             allnoconfig
sh                               allmodconfig
nds32                            alldefconfig
arm                         s3c6400_defconfig
m68k                        mvme16x_defconfig
powerpc                       ppc64_defconfig
mips                      pistachio_defconfig
c6x                         dsk6455_defconfig
riscv                    nommu_virt_defconfig
sh                        apsh4ad0a_defconfig
powerpc                      tqm8xx_defconfig
sh                           se7750_defconfig
xtensa                         virt_defconfig
sh                            shmin_defconfig
arm                        multi_v5_defconfig
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
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
x86_64               randconfig-a002-20200529
x86_64               randconfig-a006-20200529
x86_64               randconfig-a005-20200529
x86_64               randconfig-a001-20200529
x86_64               randconfig-a004-20200529
x86_64               randconfig-a003-20200529
i386                 randconfig-a004-20200529
i386                 randconfig-a001-20200529
i386                 randconfig-a002-20200529
i386                 randconfig-a006-20200529
i386                 randconfig-a003-20200529
i386                 randconfig-a005-20200529
i386                 randconfig-a004-20200531
i386                 randconfig-a003-20200531
i386                 randconfig-a006-20200531
i386                 randconfig-a002-20200531
i386                 randconfig-a005-20200531
i386                 randconfig-a001-20200531
x86_64               randconfig-a011-20200531
x86_64               randconfig-a016-20200531
x86_64               randconfig-a012-20200531
x86_64               randconfig-a014-20200531
x86_64               randconfig-a013-20200531
x86_64               randconfig-a015-20200531
i386                 randconfig-a013-20200529
i386                 randconfig-a011-20200529
i386                 randconfig-a012-20200529
i386                 randconfig-a015-20200529
i386                 randconfig-a016-20200529
i386                 randconfig-a014-20200529
i386                 randconfig-a013-20200531
i386                 randconfig-a012-20200531
i386                 randconfig-a015-20200531
i386                 randconfig-a011-20200531
i386                 randconfig-a016-20200531
i386                 randconfig-a014-20200531
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
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
