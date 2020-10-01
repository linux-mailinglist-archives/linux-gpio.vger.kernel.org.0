Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA345280A49
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 00:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgJAWck (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Oct 2020 18:32:40 -0400
Received: from mga05.intel.com ([192.55.52.43]:22277 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725924AbgJAWck (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Oct 2020 18:32:40 -0400
IronPort-SDR: Lyv1TNkWU1F2U/cPk+MK+hxTarcKKh8lMWCb2xqNmqPYpVsRrBqy85GPq39k0C3WBgvdg4jZkF
 LvDEl0zqSObw==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="247597712"
X-IronPort-AV: E=Sophos;i="5.77,325,1596524400"; 
   d="scan'208";a="247597712"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 15:32:37 -0700
IronPort-SDR: xzmX+f/qJ0l09/nOJgZSLXbRLiGN3Fwl8zAD6LVHHVuxALf9ecwV7cajKQI3tec8rgGKVX2egl
 SWn9dalfHQMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,325,1596524400"; 
   d="scan'208";a="505924755"
Received: from lkp-server02.sh.intel.com (HELO de448af6ea1b) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 01 Oct 2020 15:32:35 -0700
Received: from kbuild by de448af6ea1b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kO77q-0000lw-Cn; Thu, 01 Oct 2020 22:32:34 +0000
Date:   Fri, 02 Oct 2020 06:31:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 c348abca14dc51890bc07ce8f63538dea6d0bc3c
Message-ID: <5f7658cd.eaEAZl9hne8zGCM9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  for-next
branch HEAD: c348abca14dc51890bc07ce8f63538dea6d0bc3c  Merge branch 'devel' into for-next

elapsed time: 723m

configs tested: 141
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         shannon_defconfig
arm                  colibri_pxa300_defconfig
mips                          ath25_defconfig
sh                        edosk7705_defconfig
sh                          landisk_defconfig
sh                             sh03_defconfig
arm64                            alldefconfig
powerpc                 mpc832x_mds_defconfig
m68k                        mvme147_defconfig
arm                          gemini_defconfig
mips                malta_qemu_32r6_defconfig
mips                          malta_defconfig
riscv                             allnoconfig
arm                              alldefconfig
mips                         tb0287_defconfig
arm                       cns3420vb_defconfig
arm                        realview_defconfig
csky                                defconfig
arm                         assabet_defconfig
mips                       rbtx49xx_defconfig
mips                malta_kvm_guest_defconfig
um                           x86_64_defconfig
sh                           se7724_defconfig
xtensa                    smp_lx200_defconfig
arm                     am200epdkit_defconfig
powerpc                 mpc834x_mds_defconfig
c6x                        evmc6457_defconfig
powerpc                     asp8347_defconfig
arm                         mv78xx0_defconfig
arm                           tegra_defconfig
sh                           se7619_defconfig
mips                        bcm63xx_defconfig
nds32                            alldefconfig
nios2                         10m50_defconfig
powerpc                     rainier_defconfig
xtensa                       common_defconfig
sh                           sh2007_defconfig
powerpc                  iss476-smp_defconfig
powerpc                   motionpro_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                           alldefconfig
arm                         nhk8815_defconfig
sh                           se7750_defconfig
m68k                            q40_defconfig
arm                        multi_v5_defconfig
arm                          lpd270_defconfig
arm                        trizeps4_defconfig
powerpc                      chrp32_defconfig
arm                           stm32_defconfig
x86_64                              defconfig
mips                      loongson3_defconfig
powerpc                      makalu_defconfig
m68k                         apollo_defconfig
sh                         apsh4a3a_defconfig
powerpc                  storcenter_defconfig
sh                             shx3_defconfig
mips                          ath79_defconfig
m68k                          multi_defconfig
arm                             pxa_defconfig
mips                           ip28_defconfig
arm                         hackkit_defconfig
sh                          rsk7269_defconfig
powerpc                      mgcoge_defconfig
sh                     magicpanelr2_defconfig
arm                         axm55xx_defconfig
m68k                        m5307c3_defconfig
xtensa                  audio_kc705_defconfig
powerpc                          allmodconfig
microblaze                      mmu_defconfig
mips                        jmr3927_defconfig
powerpc                      katmai_defconfig
powerpc                           allnoconfig
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
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
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
i386                 randconfig-a003-20200930
i386                 randconfig-a002-20200930
i386                 randconfig-a006-20200930
i386                 randconfig-a005-20200930
i386                 randconfig-a004-20200930
i386                 randconfig-a001-20200930
x86_64               randconfig-a015-20200930
x86_64               randconfig-a013-20200930
x86_64               randconfig-a012-20200930
x86_64               randconfig-a016-20200930
x86_64               randconfig-a014-20200930
x86_64               randconfig-a011-20200930
i386                 randconfig-a011-20200930
i386                 randconfig-a015-20200930
i386                 randconfig-a012-20200930
i386                 randconfig-a014-20200930
i386                 randconfig-a016-20200930
i386                 randconfig-a013-20200930
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20200930
x86_64               randconfig-a005-20200930
x86_64               randconfig-a003-20200930
x86_64               randconfig-a004-20200930
x86_64               randconfig-a002-20200930
x86_64               randconfig-a006-20200930

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
