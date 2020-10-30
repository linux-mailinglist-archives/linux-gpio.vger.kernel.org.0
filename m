Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8703A29FA8B
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 02:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgJ3B0l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 21:26:41 -0400
Received: from mga11.intel.com ([192.55.52.93]:12999 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgJ3B0l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Oct 2020 21:26:41 -0400
IronPort-SDR: 7P3JPQxwqMBuilIab+vCIKDsUO8SxMDWe/Y06XQNI4j3P0vSiL+xG9nKOXjli6GFhOjJ61Ewnr
 AQNha/ElPb3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="165045446"
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; 
   d="scan'208";a="165045446"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 18:26:41 -0700
IronPort-SDR: CBh0AyRKVXFj4KkmDQxoAQR0hM/0a+lsPBwKzgUlIP9yj90wRX+/ROvhbU8PNf5NgCwRq1m9Bm
 gSnJRnq1tWNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; 
   d="scan'208";a="536889653"
Received: from lkp-server01.sh.intel.com (HELO c01187be935a) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Oct 2020 18:26:39 -0700
Received: from kbuild by c01187be935a with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kYJBe-0000K0-JU; Fri, 30 Oct 2020 01:26:38 +0000
Date:   Fri, 30 Oct 2020 09:26:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 03dec17c36a7376423bff60edbaf42df5d91af53
Message-ID: <5f9b6bc8.5NDEPY0dBkCwvi13%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  for-next
branch HEAD: 03dec17c36a7376423bff60edbaf42df5d91af53  Merge branch 'devel' into for-next

elapsed time: 721m

configs tested: 145
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                   motionpro_defconfig
c6x                        evmc6678_defconfig
arm                        mvebu_v5_defconfig
xtensa                    smp_lx200_defconfig
arm                     davinci_all_defconfig
nios2                         3c120_defconfig
sh                          landisk_defconfig
sh                        sh7785lcr_defconfig
m68k                          amiga_defconfig
powerpc                      ppc64e_defconfig
powerpc                         wii_defconfig
xtensa                           alldefconfig
powerpc                 mpc8315_rdb_defconfig
arm                         bcm2835_defconfig
m68k                        m5307c3_defconfig
arm                        mvebu_v7_defconfig
arc                          axs103_defconfig
sh                          lboxre2_defconfig
arm                          pxa3xx_defconfig
mips                        qi_lb60_defconfig
arm                       versatile_defconfig
mips                           ip32_defconfig
sh                           sh2007_defconfig
sh                           se7780_defconfig
powerpc                     mpc5200_defconfig
powerpc                       maple_defconfig
powerpc                      arches_defconfig
sh                        apsh4ad0a_defconfig
mips                          rb532_defconfig
arm                         hackkit_defconfig
arm                          gemini_defconfig
powerpc                 mpc8313_rdb_defconfig
sparc                       sparc64_defconfig
sh                        dreamcast_defconfig
sh                        edosk7705_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                        m5407c3_defconfig
arm                        keystone_defconfig
ia64                            zx1_defconfig
powerpc                     tqm8540_defconfig
arm                          pxa168_defconfig
um                           x86_64_defconfig
arc                            hsdk_defconfig
mips                        bcm47xx_defconfig
m68k                           sun3_defconfig
sh                            migor_defconfig
microblaze                      mmu_defconfig
m68k                       m5475evb_defconfig
sh                ecovec24-romimage_defconfig
powerpc                    gamecube_defconfig
powerpc                     stx_gp3_defconfig
powerpc                  mpc885_ads_defconfig
sh                          rsk7264_defconfig
sh                             sh03_defconfig
arm                          prima2_defconfig
mips                       capcella_defconfig
c6x                              alldefconfig
mips                malta_kvm_guest_defconfig
sh                          sdk7780_defconfig
arm                              zx_defconfig
ia64                          tiger_defconfig
mips                       rbtx49xx_defconfig
sh                          rsk7203_defconfig
m68k                            q40_defconfig
ia64                         bigsur_defconfig
arm                            dove_defconfig
h8300                            alldefconfig
c6x                        evmc6457_defconfig
mips                malta_qemu_32r6_defconfig
ia64                             alldefconfig
arm                            mps2_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20201029
x86_64               randconfig-a002-20201029
x86_64               randconfig-a003-20201029
x86_64               randconfig-a006-20201029
x86_64               randconfig-a005-20201029
x86_64               randconfig-a004-20201029
i386                 randconfig-a002-20201029
i386                 randconfig-a005-20201029
i386                 randconfig-a003-20201029
i386                 randconfig-a001-20201029
i386                 randconfig-a004-20201029
i386                 randconfig-a006-20201029
i386                 randconfig-a016-20201029
i386                 randconfig-a014-20201029
i386                 randconfig-a015-20201029
i386                 randconfig-a013-20201029
i386                 randconfig-a012-20201029
i386                 randconfig-a011-20201029
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20201029
x86_64               randconfig-a013-20201029
x86_64               randconfig-a016-20201029
x86_64               randconfig-a015-20201029
x86_64               randconfig-a012-20201029
x86_64               randconfig-a014-20201029

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
