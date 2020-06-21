Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8086C202A57
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2020 13:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729944AbgFULiy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 07:38:54 -0400
Received: from mga12.intel.com ([192.55.52.136]:57279 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729878AbgFULiy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Jun 2020 07:38:54 -0400
IronPort-SDR: DoISy5v9OWzwPySEHwA215Gx03M5udVOrXApynbAw/OuoE+VsvD+TjEseuUaq49QTW17r2JrM7
 RTuGPZFene+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9658"; a="123204210"
X-IronPort-AV: E=Sophos;i="5.75,262,1589266800"; 
   d="scan'208";a="123204210"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2020 04:38:53 -0700
IronPort-SDR: 14bu9g2pUqJrvZt+cuzeXmwDyKgChwe0UCd2FPGJN/v5VsyFvoXYkkybd+OyBHn8uo2KLFXSP4
 nYAlDrYrAyJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,262,1589266800"; 
   d="scan'208";a="384253010"
Received: from lkp-server02.sh.intel.com (HELO 3aa54c81372e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jun 2020 04:38:51 -0700
Received: from kbuild by 3aa54c81372e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jmyJH-0002eK-Ah; Sun, 21 Jun 2020 11:38:51 +0000
Date:   Sun, 21 Jun 2020 19:37:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:gpio-charger-mentioned] BUILD SUCCESS
 e4ae3c21f7cceec4f3b42546f3c90b73f98a9a46
Message-ID: <5eef4697.md+cBYg+/6gXjWov%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  gpio-charger-mentioned
branch HEAD: e4ae3c21f7cceec4f3b42546f3c90b73f98a9a46  gpio: Add gpio-charger to the documentation

elapsed time: 723m

configs tested: 123
configs skipped: 9

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
arm                      footbridge_defconfig
sh                   sh7770_generic_defconfig
arm                         mv78xx0_defconfig
arm                          ixp4xx_defconfig
nios2                               defconfig
riscv                             allnoconfig
sparc64                          allmodconfig
sh                           se7721_defconfig
mips                           ip27_defconfig
powerpc                 mpc8272_ads_defconfig
arm                           spitz_defconfig
m68k                        stmark2_defconfig
powerpc                    amigaone_defconfig
arm                          pcm027_defconfig
arm                             rpc_defconfig
arm                          imote2_defconfig
arc                      axs103_smp_defconfig
mips                         db1xxx_defconfig
riscv                            alldefconfig
m68k                            mac_defconfig
ia64                      gensparse_defconfig
riscv                    nommu_k210_defconfig
sh                          polaris_defconfig
arm                         lpc32xx_defconfig
arm                         nhk8815_defconfig
mips                 pnx8335_stb225_defconfig
mips                           mtx1_defconfig
xtensa                    smp_lx200_defconfig
mips                        bcm47xx_defconfig
mips                        nlm_xlr_defconfig
sh                             shx3_defconfig
m68k                          sun3x_defconfig
mips                             allmodconfig
sh                ecovec24-romimage_defconfig
arm                            dove_defconfig
openrisc                         allyesconfig
microblaze                    nommu_defconfig
m68k                       m5475evb_defconfig
arc                        nsim_700_defconfig
arm                   milbeaut_m10v_defconfig
arm                         orion5x_defconfig
sh                          rsk7201_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
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
mips                              allnoconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200621
i386                 randconfig-a002-20200621
i386                 randconfig-a003-20200621
i386                 randconfig-a001-20200621
i386                 randconfig-a005-20200621
i386                 randconfig-a004-20200621
riscv                            allyesconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
