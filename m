Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD7032DB2A
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 21:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbhCDU03 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 15:26:29 -0500
Received: from mga17.intel.com ([192.55.52.151]:57527 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232933AbhCDU01 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Mar 2021 15:26:27 -0500
IronPort-SDR: L54fK8jbMmkA5XHUluoVA67LIyJTyUQ7sQvUnTJPOt/JpH6lsIx/XBFjxcT6iS+osizQl292gG
 2Yo5b+F/p+UQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="167399823"
X-IronPort-AV: E=Sophos;i="5.81,223,1610438400"; 
   d="scan'208";a="167399823"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 12:25:46 -0800
IronPort-SDR: KXqlBZdi/zTvhYz/vMKP+MaHlyKuoTYA+epmiJgaF8MZUoZ2yL3db2vjNKGUyvNtNKr4iTwoNo
 pMIzigIjRhFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,223,1610438400"; 
   d="scan'208";a="369871185"
Received: from lkp-server02.sh.intel.com (HELO 2482ff9f8ac0) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Mar 2021 12:25:45 -0800
Received: from kbuild by 2482ff9f8ac0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lHuXY-0002N8-KP; Thu, 04 Mar 2021 20:25:44 +0000
Date:   Fri, 05 Mar 2021 04:25:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 1ccb486315127946d59bc9c6c14b210615aae5e8
Message-ID: <60414241.+BH12pgbSP+7QWGd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 1ccb486315127946d59bc9c6c14b210615aae5e8  pinctrl: ingenic: add missing call to of_node_put()

elapsed time: 720m

configs tested: 128
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
