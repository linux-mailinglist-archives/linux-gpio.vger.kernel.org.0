Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 679AC36813C
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 15:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236500AbhDVNJY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Apr 2021 09:09:24 -0400
Received: from mga17.intel.com ([192.55.52.151]:7450 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236325AbhDVNJY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Apr 2021 09:09:24 -0400
IronPort-SDR: n1Fr8okq/CGSn8YQv+Xc4CLa1Qt+gr1bprK+KMZLlM/JbIV9u4VBYvCEfKAF8TZZgo6IX+bRIi
 JjPo0OHc7F/w==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="175995220"
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; 
   d="scan'208";a="175995220"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2021 06:08:49 -0700
IronPort-SDR: uInt7/SFwowMY6gAghSYuoORwYUKvMb1kHVlqDzXUXrhTmhKPPgvFo12WHOxzeYoUQKpni2gnm
 j5amzOdn/uSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; 
   d="scan'208";a="463938232"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Apr 2021 06:08:47 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lZZ4Y-0004Ag-Nj; Thu, 22 Apr 2021 13:08:46 +0000
Date:   Thu, 22 Apr 2021 21:08:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 482715ff0601c836152b792f06c353464d826b9b
Message-ID: <60817557.3ParZnIkE8j6doDS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 482715ff0601c836152b792f06c353464d826b9b  pinctrl: core: Show pin numbers for the controllers with base = 0

elapsed time: 720m

configs tested: 129
configs skipped: 2

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
arm                            lart_defconfig
mips                malta_qemu_32r6_defconfig
mips                          malta_defconfig
sh                             shx3_defconfig
um                                  defconfig
powerpc                      ppc44x_defconfig
mips                        workpad_defconfig
powerpc                   currituck_defconfig
riscv                             allnoconfig
powerpc                 mpc837x_mds_defconfig
arm                       netwinder_defconfig
mips                        bcm63xx_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                      pcm030_defconfig
arm                         s3c6400_defconfig
xtensa                          iss_defconfig
mips                      loongson3_defconfig
powerpc                  iss476-smp_defconfig
arm                              alldefconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                      mgcoge_defconfig
ia64                                defconfig
powerpc                         wii_defconfig
arm                  colibri_pxa270_defconfig
openrisc                    or1ksim_defconfig
arm                         lpc18xx_defconfig
mips                      bmips_stb_defconfig
arm                        mvebu_v7_defconfig
powerpc                          allmodconfig
nds32                               defconfig
sh                          sdk7780_defconfig
sh                            titan_defconfig
arc                                 defconfig
arm                         lpc32xx_defconfig
arm                           h5000_defconfig
powerpc                     tqm8548_defconfig
powerpc                 canyonlands_defconfig
sh                     magicpanelr2_defconfig
mips                        maltaup_defconfig
mips                        bcm47xx_defconfig
mips                malta_kvm_guest_defconfig
ia64                             allmodconfig
arm                        magician_defconfig
mips                           jazz_defconfig
arm                         s3c2410_defconfig
powerpc                 mpc836x_mds_defconfig
mips                             allyesconfig
powerpc                     skiroot_defconfig
mips                      maltaaprp_defconfig
i386                             alldefconfig
powerpc                 xes_mpc85xx_defconfig
arc                      axs103_smp_defconfig
m68k                         apollo_defconfig
sh                           sh2007_defconfig
sh                           se7722_defconfig
openrisc                         alldefconfig
powerpc                      acadia_defconfig
mips                            e55_defconfig
sh                            migor_defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210421
x86_64               randconfig-a002-20210421
x86_64               randconfig-a001-20210421
x86_64               randconfig-a005-20210421
x86_64               randconfig-a006-20210421
x86_64               randconfig-a003-20210421
i386                 randconfig-a005-20210421
i386                 randconfig-a002-20210421
i386                 randconfig-a001-20210421
i386                 randconfig-a006-20210421
i386                 randconfig-a004-20210421
i386                 randconfig-a003-20210421
i386                 randconfig-a012-20210421
i386                 randconfig-a014-20210421
i386                 randconfig-a011-20210421
i386                 randconfig-a013-20210421
i386                 randconfig-a015-20210421
i386                 randconfig-a016-20210421
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210421
x86_64               randconfig-a016-20210421
x86_64               randconfig-a011-20210421
x86_64               randconfig-a014-20210421
x86_64               randconfig-a013-20210421
x86_64               randconfig-a012-20210421

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
