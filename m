Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 896CC2B8275
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 17:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbgKRQ6v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Nov 2020 11:58:51 -0500
Received: from mga07.intel.com ([134.134.136.100]:25812 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727514AbgKRQ6v (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Nov 2020 11:58:51 -0500
IronPort-SDR: rnk5l5oNIMmImi6VtxYoMAJNmkjq7GjCB5dVOHXXrJwXLIuw6OLzL6n431M49cqZrVqmqdFIoU
 5slYIF1C1OHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="235295353"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="235295353"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 08:58:50 -0800
IronPort-SDR: Ty4hCKBKBZ6Mqzir/mzl1nzodPNBynMGL9T9dzoVWojPzmfTuOExQzgIcFHfvA35JOaK8MJ2fb
 Ii+IVN+lt8tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="359542607"
Received: from lkp-server02.sh.intel.com (HELO 67996b229c47) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 18 Nov 2020 08:58:49 -0800
Received: from kbuild by 67996b229c47 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kfQn8-0000AN-TT; Wed, 18 Nov 2020 16:58:46 +0000
Date:   Thu, 19 Nov 2020 00:58:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:irq-hierarchy-parent] BUILD SUCCESS
 755d8679bba3dad4067c9e679d719d2c55acecae
Message-ID: <5fb5529a.QwQRkZ//LgbiGvEd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  irq-hierarchy-parent
branch HEAD: 755d8679bba3dad4067c9e679d719d2c55acecae  gpio: tegra186: Set affinity callback to parent

elapsed time: 723m

configs tested: 142
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          rsk7269_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                        edosk7760_defconfig
sh                         microdev_defconfig
sh                            shmin_defconfig
sh                            migor_defconfig
powerpc                     mpc5200_defconfig
m68k                            mac_defconfig
arm                        spear3xx_defconfig
nios2                            alldefconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                      ppc6xx_defconfig
powerpc                     taishan_defconfig
powerpc                     skiroot_defconfig
powerpc                    ge_imp3a_defconfig
arm                          gemini_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     ksi8560_defconfig
microblaze                    nommu_defconfig
arc                         haps_hs_defconfig
sh                   sh7770_generic_defconfig
arm                          tango4_defconfig
mips                      loongson3_defconfig
arm                            mps2_defconfig
arc                     nsimosci_hs_defconfig
powerpc                      arches_defconfig
arm                          pcm027_defconfig
mips                           ip32_defconfig
mips                            ar7_defconfig
powerpc                      cm5200_defconfig
mips                          malta_defconfig
openrisc                    or1ksim_defconfig
arm                         hackkit_defconfig
m68k                         apollo_defconfig
mips                          rm200_defconfig
mips                  decstation_64_defconfig
sh                            hp6xx_defconfig
mips                       bmips_be_defconfig
c6x                        evmc6472_defconfig
sh                          polaris_defconfig
sh                           se7724_defconfig
m68k                          atari_defconfig
sh                        dreamcast_defconfig
mips                      maltaaprp_defconfig
arm                         socfpga_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                               j2_defconfig
arm                          exynos_defconfig
xtensa                  cadence_csp_defconfig
arm                            lart_defconfig
arm                          prima2_defconfig
powerpc                    gamecube_defconfig
h8300                            alldefconfig
nios2                         10m50_defconfig
um                           x86_64_defconfig
arm                       netwinder_defconfig
arm                         s3c2410_defconfig
mips                        bcm63xx_defconfig
mips                      bmips_stb_defconfig
s390                             alldefconfig
arm                           h5000_defconfig
arm                        neponset_defconfig
i386                                defconfig
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
csky                                defconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20201118
x86_64               randconfig-a003-20201118
x86_64               randconfig-a004-20201118
x86_64               randconfig-a002-20201118
x86_64               randconfig-a006-20201118
x86_64               randconfig-a001-20201118
i386                 randconfig-a006-20201118
i386                 randconfig-a005-20201118
i386                 randconfig-a002-20201118
i386                 randconfig-a001-20201118
i386                 randconfig-a003-20201118
i386                 randconfig-a004-20201118
i386                 randconfig-a001-20201117
i386                 randconfig-a002-20201117
i386                 randconfig-a003-20201117
i386                 randconfig-a006-20201117
i386                 randconfig-a005-20201117
i386                 randconfig-a004-20201117
i386                 randconfig-a012-20201118
i386                 randconfig-a014-20201118
i386                 randconfig-a016-20201118
i386                 randconfig-a011-20201118
i386                 randconfig-a013-20201118
i386                 randconfig-a015-20201118
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
x86_64               randconfig-a015-20201118
x86_64               randconfig-a014-20201118
x86_64               randconfig-a011-20201118
x86_64               randconfig-a013-20201118
x86_64               randconfig-a016-20201118
x86_64               randconfig-a012-20201118

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
