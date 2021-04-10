Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F7235AD57
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Apr 2021 14:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234619AbhDJMkg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Apr 2021 08:40:36 -0400
Received: from mga07.intel.com ([134.134.136.100]:13691 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234377AbhDJMkf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 10 Apr 2021 08:40:35 -0400
IronPort-SDR: FjlkMVriUlt1pEqb+N956U1cImgUWAJaFUKjj/Vif72lwfl4H0rBY+ZZiiNKG4DbaMqN1xm9zQ
 pKGxLHFC55mA==
X-IronPort-AV: E=McAfee;i="6000,8403,9950"; a="257899426"
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; 
   d="scan'208";a="257899426"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2021 05:40:18 -0700
IronPort-SDR: ar3ddGHP9EvzPp3wwUyOcYbjMMa6vQ79gYpkTBNcEWBWKzhKazdKQiJHsrw2DtJcYNhDTtAlqD
 R8oG1W/RtGog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; 
   d="scan'208";a="416648891"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Apr 2021 05:40:17 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lVCuO-000IMO-Ly; Sat, 10 Apr 2021 12:40:16 +0000
Date:   Sat, 10 Apr 2021 20:40:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:for-next] BUILD SUCCESS
 2421dc2a76384e9236f2a8cee31549fc47910eab
Message-ID: <60719ca8.7q/ck2FJOal88QSA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 2421dc2a76384e9236f2a8cee31549fc47910eab  Merge branch 'devel' into for-next

elapsed time: 722m

configs tested: 138
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
arm64                            alldefconfig
powerpc                      bamboo_defconfig
m68k                       bvme6000_defconfig
mips                      pistachio_defconfig
openrisc                 simple_smp_defconfig
sh                           se7750_defconfig
powerpc                       ebony_defconfig
mips                           xway_defconfig
powerpc                     mpc83xx_defconfig
ia64                      gensparse_defconfig
arm                          simpad_defconfig
s390                       zfcpdump_defconfig
powerpc                      pasemi_defconfig
powerpc                 linkstation_defconfig
um                             i386_defconfig
s390                             allmodconfig
powerpc                      tqm8xx_defconfig
openrisc                         alldefconfig
arm                            mmp2_defconfig
arc                     haps_hs_smp_defconfig
arm                             mxs_defconfig
powerpc                      arches_defconfig
sh                        dreamcast_defconfig
arm                             rpc_defconfig
powerpc                   currituck_defconfig
powerpc                 mpc837x_mds_defconfig
microblaze                      mmu_defconfig
mips                         tb0287_defconfig
mips                         tb0219_defconfig
sh                          urquell_defconfig
arm                        spear6xx_defconfig
sh                            titan_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                   bluestone_defconfig
mips                      loongson3_defconfig
m68k                          multi_defconfig
arm                             pxa_defconfig
arc                                 defconfig
powerpc                      walnut_defconfig
mips                       lemote2f_defconfig
sh                          sdk7780_defconfig
arm                     am200epdkit_defconfig
sh                        sh7757lcr_defconfig
arm                         nhk8815_defconfig
arm                         shannon_defconfig
sh                           se7751_defconfig
arm                        multi_v5_defconfig
sh                           se7619_defconfig
xtensa                  audio_kc705_defconfig
arm                          badge4_defconfig
arm                      jornada720_defconfig
sh                           se7780_defconfig
sh                          lboxre2_defconfig
arm                         s3c6400_defconfig
sh                          r7785rp_defconfig
powerpc                     asp8347_defconfig
powerpc                     sbc8548_defconfig
powerpc                     tqm8540_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                      mgcoge_defconfig
m68k                        m5407c3_defconfig
csky                                defconfig
i386                                defconfig
arm                        vexpress_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20210409
i386                 randconfig-a003-20210409
i386                 randconfig-a001-20210409
i386                 randconfig-a004-20210409
i386                 randconfig-a002-20210409
i386                 randconfig-a005-20210409
x86_64               randconfig-a014-20210409
x86_64               randconfig-a015-20210409
x86_64               randconfig-a012-20210409
x86_64               randconfig-a011-20210409
x86_64               randconfig-a013-20210409
x86_64               randconfig-a016-20210409
i386                 randconfig-a014-20210409
i386                 randconfig-a011-20210409
i386                 randconfig-a016-20210409
i386                 randconfig-a012-20210409
i386                 randconfig-a013-20210409
i386                 randconfig-a015-20210409
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210409
x86_64               randconfig-a005-20210409
x86_64               randconfig-a003-20210409
x86_64               randconfig-a001-20210409
x86_64               randconfig-a002-20210409
x86_64               randconfig-a006-20210409

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
