Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3C1F27F481
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 23:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730981AbgI3VzQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 17:55:16 -0400
Received: from mga09.intel.com ([134.134.136.24]:44574 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731297AbgI3VzI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Sep 2020 17:55:08 -0400
IronPort-SDR: 4w4sbnxYy5TpUD2O9C176+QrHH4CsHucXJwdoq62vrNCkS8/lWtJWMrsSPycqR+8qrQqkKXcep
 +1mFgmhSme9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="163418472"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="163418472"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 14:55:03 -0700
IronPort-SDR: iXyN46dn37VJS6KraMtH2rF9HChMJW/h7l+PxWPoDIAGvzCPJAP37we+wkUou1d+G/+oBN/Bo+
 iZ0xNb/64XyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="312745836"
Received: from lkp-server02.sh.intel.com (HELO de448af6ea1b) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Sep 2020 14:55:00 -0700
Received: from kbuild by de448af6ea1b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kNk3x-0000PL-Ay; Wed, 30 Sep 2020 21:55:01 +0000
Date:   Thu, 01 Oct 2020 05:54:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:for-next] BUILD SUCCESS
 7da6060fb2fef4380d13cc48790c0425c0a95401
Message-ID: <5f74fe79.+ZBnpkDNheAcOGkJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  for-next
branch HEAD: 7da6060fb2fef4380d13cc48790c0425c0a95401  Merge branch 'devel' into for-next

elapsed time: 724m

configs tested: 125
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7722_defconfig
m68k                       m5475evb_defconfig
mips                          rm200_defconfig
arm                          prima2_defconfig
arm                          iop32x_defconfig
mips                   sb1250_swarm_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                 linkstation_defconfig
c6x                         dsk6455_defconfig
powerpc64                        alldefconfig
nds32                            alldefconfig
mips                           rs90_defconfig
mips                      pistachio_defconfig
riscv                          rv32_defconfig
arm                          imote2_defconfig
sh                                  defconfig
parisc                              defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                     tqm8540_defconfig
xtensa                  cadence_csp_defconfig
sh                          lboxre2_defconfig
powerpc                       maple_defconfig
sh                           se7750_defconfig
m68k                          sun3x_defconfig
arm                           tegra_defconfig
arm                        multi_v5_defconfig
sh                        dreamcast_defconfig
arm                         bcm2835_defconfig
powerpc                      mgcoge_defconfig
powerpc                  storcenter_defconfig
microblaze                      mmu_defconfig
m68k                             allyesconfig
arm                             mxs_defconfig
arm                         lpc32xx_defconfig
mips                        vocore2_defconfig
arc                          axs103_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                        realview_defconfig
powerpc                     taishan_defconfig
sh                        edosk7705_defconfig
m68k                         apollo_defconfig
arm                              zx_defconfig
sh                           se7343_defconfig
arm                            dove_defconfig
mips                        nlm_xlr_defconfig
sh                          rsk7203_defconfig
sh                   sh7724_generic_defconfig
sh                             espt_defconfig
csky                                defconfig
powerpc                 mpc837x_rdb_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7724_defconfig
arc                        nsim_700_defconfig
arm                         palmz72_defconfig
c6x                        evmc6474_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
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
