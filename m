Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3426F2DD19F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Dec 2020 13:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgLQMmw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Dec 2020 07:42:52 -0500
Received: from mga11.intel.com ([192.55.52.93]:42933 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726595AbgLQMmw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Dec 2020 07:42:52 -0500
IronPort-SDR: gISOv4Xga9NTTlddI02kjXVNmoq8Aqv+ATowoE3Hny5YtZe22UHT3cUWORLVr7hJYv4DQqA4Ys
 b69ZAwUkzbGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9837"; a="171738687"
X-IronPort-AV: E=Sophos;i="5.78,428,1599548400"; 
   d="scan'208";a="171738687"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2020 04:42:11 -0800
IronPort-SDR: sv8BKDyRhN+tEMChF0QP9gSHRZED4ouTbiixwrnu1eRO9OOBpRC2pfv7dUIzh0aoDPR58g9QXo
 +Q8HmaqB7elA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,428,1599548400"; 
   d="scan'208";a="387497935"
Received: from lkp-server02.sh.intel.com (HELO 070e1a605002) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2020 04:42:10 -0800
Received: from kbuild by 070e1a605002 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kpsbh-0001BY-J0; Thu, 17 Dec 2020 12:42:09 +0000
Date:   Thu, 17 Dec 2020 20:41:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel] BUILD SUCCESS
 7ac554888233468a9fd7c4f28721396952dd9959
Message-ID: <5fdb5216.1fwyzjQYIRUQPaQf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel
branch HEAD: 7ac554888233468a9fd7c4f28721396952dd9959  MAINTAINERS: Remove reference to non-existing file

elapsed time: 725m

configs tested: 136
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      pcm030_defconfig
um                           x86_64_defconfig
powerpc                     sequoia_defconfig
arm                         mv78xx0_defconfig
riscv                             allnoconfig
arm                            dove_defconfig
mips                        workpad_defconfig
mips                           jazz_defconfig
powerpc                      arches_defconfig
powerpc                   currituck_defconfig
powerpc                mpc7448_hpc2_defconfig
h8300                       h8s-sim_defconfig
powerpc                      walnut_defconfig
m68k                          amiga_defconfig
m68k                          sun3x_defconfig
arc                     nsimosci_hs_defconfig
powerpc                      chrp32_defconfig
sh                          landisk_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                     taishan_defconfig
arm                       multi_v4t_defconfig
h8300                               defconfig
sh                          rsk7264_defconfig
alpha                            alldefconfig
arm                         assabet_defconfig
sh                            hp6xx_defconfig
sh                     magicpanelr2_defconfig
mips                           ip28_defconfig
powerpc                    socrates_defconfig
x86_64                           alldefconfig
sh                           se7619_defconfig
h8300                     edosk2674_defconfig
sh                ecovec24-romimage_defconfig
ia64                        generic_defconfig
sh                           sh2007_defconfig
c6x                        evmc6474_defconfig
arm                         axm55xx_defconfig
arm                             mxs_defconfig
sh                         microdev_defconfig
powerpc                  storcenter_defconfig
ia64                            zx1_defconfig
powerpc                   bluestone_defconfig
mips                           mtx1_defconfig
ia64                          tiger_defconfig
powerpc                      ppc6xx_defconfig
arm                            zeus_defconfig
powerpc                 mpc8540_ads_defconfig
c6x                                 defconfig
arm                            pleb_defconfig
arc                      axs103_smp_defconfig
arm                       aspeed_g4_defconfig
sh                         ap325rxa_defconfig
mips                     decstation_defconfig
arm                          badge4_defconfig
h8300                    h8300h-sim_defconfig
mips                   sb1250_swarm_defconfig
powerpc                       maple_defconfig
arm                         s3c6400_defconfig
sh                          sdk7786_defconfig
powerpc                     ppa8548_defconfig
powerpc                      ppc44x_defconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20201217
i386                 randconfig-a004-20201217
i386                 randconfig-a003-20201217
i386                 randconfig-a002-20201217
i386                 randconfig-a006-20201217
i386                 randconfig-a005-20201217
i386                 randconfig-a014-20201217
i386                 randconfig-a013-20201217
i386                 randconfig-a012-20201217
i386                 randconfig-a011-20201217
i386                 randconfig-a015-20201217
i386                 randconfig-a016-20201217
x86_64               randconfig-a003-20201217
x86_64               randconfig-a006-20201217
x86_64               randconfig-a002-20201217
x86_64               randconfig-a005-20201217
x86_64               randconfig-a004-20201217
x86_64               randconfig-a001-20201217
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a016-20201217
x86_64               randconfig-a012-20201217
x86_64               randconfig-a013-20201217
x86_64               randconfig-a015-20201217
x86_64               randconfig-a014-20201217
x86_64               randconfig-a011-20201217

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
