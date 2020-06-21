Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD3A2029DD
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2020 11:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgFUJvj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 05:51:39 -0400
Received: from mga11.intel.com ([192.55.52.93]:56802 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729628AbgFUJvj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Jun 2020 05:51:39 -0400
IronPort-SDR: lC8d5QYrji2hKt77E26FGfwrPUp6hx8+K0L67IeeVZIgpCNLvhWvFW7sJ4aqnCgT8zUCxcod52
 jmAaxm0ArSXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9658"; a="141791826"
X-IronPort-AV: E=Sophos;i="5.75,262,1589266800"; 
   d="scan'208";a="141791826"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2020 02:51:38 -0700
IronPort-SDR: n6WTnj/kththyes9NBSgYCvcMXDmzCmO4WYneGE00TYybwhxr1jKUi8TI2n5Yx1PCfRciswGd1
 tkWOk2on92Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,262,1589266800"; 
   d="scan'208";a="264257216"
Received: from lkp-server02.sh.intel.com (HELO 3aa54c81372e) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 21 Jun 2020 02:51:37 -0700
Received: from kbuild by 3aa54c81372e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jmwdU-0002c1-Mm; Sun, 21 Jun 2020 09:51:36 +0000
Date:   Sun, 21 Jun 2020 17:51:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 25fae752156db7253471347df08a2700501eafde
Message-ID: <5eef2d9f.NysX3lhGR7XZXdsw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  fixes
branch HEAD: 25fae752156db7253471347df08a2700501eafde  pinctrl: single: fix function name in documentation

elapsed time: 721m

configs tested: 123
configs skipped: 10

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
mips                 pnx8335_stb225_defconfig
mips                           mtx1_defconfig
xtensa                    smp_lx200_defconfig
mips                        bcm47xx_defconfig
mips                        nlm_xlr_defconfig
sh                             shx3_defconfig
m68k                          sun3x_defconfig
sh                ecovec24-romimage_defconfig
arm                            dove_defconfig
openrisc                         allyesconfig
microblaze                    nommu_defconfig
arc                              allyesconfig
nds32                             allnoconfig
sh                               j2_defconfig
m68k                       bvme6000_defconfig
arc                        nsimosci_defconfig
m68k                       m5475evb_defconfig
arc                        nsim_700_defconfig
arm                   milbeaut_m10v_defconfig
arm                         orion5x_defconfig
sh                          rsk7201_defconfig
powerpc                  mpc866_ads_defconfig
arc                    vdk_hs38_smp_defconfig
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
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
nds32                               defconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
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
x86_64               randconfig-a012-20200621
x86_64               randconfig-a011-20200621
x86_64               randconfig-a013-20200621
x86_64               randconfig-a014-20200621
x86_64               randconfig-a015-20200621
x86_64               randconfig-a016-20200621
riscv                            allyesconfig
riscv                             allnoconfig
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
sparc64                          allmodconfig
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
