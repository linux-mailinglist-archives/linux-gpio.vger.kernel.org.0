Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF1032DB32
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 21:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233299AbhCDU1d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 15:27:33 -0500
Received: from mga01.intel.com ([192.55.52.88]:8101 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238645AbhCDU11 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Mar 2021 15:27:27 -0500
IronPort-SDR: TbrUg2FSSA2r3beawkSnzVBWta0oKSh+6IBDyyeho7elwc0U6EsWNOO7dRxRwCNiXw8RFpCum3
 nNr6GsBBVq6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="207219630"
X-IronPort-AV: E=Sophos;i="5.81,223,1610438400"; 
   d="scan'208";a="207219630"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 12:26:47 -0800
IronPort-SDR: KSX4DfXcN0D0NhWSZY1S4GcWgnwIyPdqza2NMlx7YG6LMnE2zu+cUChwxcEpN7pHWJQb+2f/vJ
 CDAUlOdxd2zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,223,1610438400"; 
   d="scan'208";a="518787562"
Received: from lkp-server02.sh.intel.com (HELO 2482ff9f8ac0) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 04 Mar 2021 12:26:45 -0800
Received: from kbuild by 2482ff9f8ac0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lHuYW-0002Nf-Pd; Thu, 04 Mar 2021 20:26:44 +0000
Date:   Fri, 05 Mar 2021 04:25:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 59263b2bab476e9aa7379e95f62f0f8da39fa740
Message-ID: <6041424f.YxESvB6SHNTICUBN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 59263b2bab476e9aa7379e95f62f0f8da39fa740  Merge branch 'devel' into for-next

elapsed time: 720m

configs tested: 133
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                             pxa_defconfig
xtensa                         virt_defconfig
powerpc                          allyesconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                        icon_defconfig
arm                         axm55xx_defconfig
sparc                               defconfig
mips                           jazz_defconfig
h8300                    h8300h-sim_defconfig
riscv                          rv32_defconfig
mips                malta_kvm_guest_defconfig
arm                          badge4_defconfig
arm                            mps2_defconfig
arm                        multi_v7_defconfig
mips                      maltaaprp_defconfig
arc                          axs103_defconfig
powerpc                     ep8248e_defconfig
mips                      bmips_stb_defconfig
alpha                               defconfig
arm                        multi_v5_defconfig
mips                        vocore2_defconfig
sh                           se7780_defconfig
mips                         tb0287_defconfig
m68k                        m5307c3_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                          imote2_defconfig
arm                         hackkit_defconfig
um                             i386_defconfig
mips                        maltaup_defconfig
powerpc                     sequoia_defconfig
arm                             ezx_defconfig
arm                         s3c2410_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                      malta_kvm_defconfig
m68k                         amcore_defconfig
arm                          ep93xx_defconfig
powerpc                      pmac32_defconfig
microblaze                          defconfig
mips                      fuloong2e_defconfig
m68k                       m5208evb_defconfig
powerpc                       ebony_defconfig
sh                            titan_defconfig
mips                     loongson1c_defconfig
riscv                            allmodconfig
powerpc                     akebono_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc               mpc834x_itxgp_defconfig
x86_64                           alldefconfig
m68k                       m5275evb_defconfig
mips                        bcm47xx_defconfig
arc                        nsimosci_defconfig
arm                         nhk8815_defconfig
powerpc                      pasemi_defconfig
powerpc64                           defconfig
ia64                                defconfig
powerpc                      bamboo_defconfig
powerpc                     mpc83xx_defconfig
powerpc                      chrp32_defconfig
xtensa                generic_kc705_defconfig
m68k                        m5407c3_defconfig
arm64                            alldefconfig
mips                          rb532_defconfig
arm                        trizeps4_defconfig
powerpc                 mpc8315_rdb_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210304
x86_64               randconfig-a001-20210304
x86_64               randconfig-a004-20210304
x86_64               randconfig-a005-20210304
x86_64               randconfig-a002-20210304
x86_64               randconfig-a003-20210304
i386                 randconfig-a005-20210304
i386                 randconfig-a003-20210304
i386                 randconfig-a002-20210304
i386                 randconfig-a004-20210304
i386                 randconfig-a006-20210304
i386                 randconfig-a001-20210304
i386                 randconfig-a016-20210304
i386                 randconfig-a012-20210304
i386                 randconfig-a013-20210304
i386                 randconfig-a014-20210304
i386                 randconfig-a011-20210304
i386                 randconfig-a015-20210304
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210304
x86_64               randconfig-a016-20210304
x86_64               randconfig-a015-20210304
x86_64               randconfig-a014-20210304
x86_64               randconfig-a012-20210304
x86_64               randconfig-a011-20210304

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
