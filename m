Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F295C388E4D
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 14:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353440AbhESMpq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 08:45:46 -0400
Received: from mga04.intel.com ([192.55.52.120]:39801 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238150AbhESMpp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 May 2021 08:45:45 -0400
IronPort-SDR: CPD7hMO8xgY2RfPg4XgXOJk5IPHQhzKs6H338ocSePk5+7cWVTEwNQCf5pq1b9u8zQqwMkXV4I
 Ei+i5jRxx2+Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="199013934"
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; 
   d="scan'208";a="199013934"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2021 05:44:26 -0700
IronPort-SDR: qPeB8y2OZtYnhEvFLzEEl/fZkRC9NdAhJPXOKP6RwuBieI65dh2MB7d2LXgaIDIDeR2eym6h9x
 R/9ysJAu0oCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; 
   d="scan'208";a="630905628"
Received: from lkp-server02.sh.intel.com (HELO 1b329be5b008) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 May 2021 05:44:24 -0700
Received: from kbuild by 1b329be5b008 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ljLYl-00008I-W7; Wed, 19 May 2021 12:44:23 +0000
Date:   Wed, 19 May 2021 20:43:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:devel] BUILD SUCCESS
 969ef42b1ae094da99b8acbf14864f94d37f6e58
Message-ID: <60a507f8.GWpLeJe46XAB3EG1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 969ef42b1ae094da99b8acbf14864f94d37f6e58  pinctrl: qcom: spmi-mpp: Add compatible for pmi8994

elapsed time: 722m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm                          pxa3xx_defconfig
arm                         axm55xx_defconfig
powerpc                      arches_defconfig
mips                        maltaup_defconfig
arm                        realview_defconfig
arc                              alldefconfig
sh                           se7722_defconfig
mips                         mpc30x_defconfig
um                            kunit_defconfig
powerpc                      makalu_defconfig
powerpc                 mpc8315_rdb_defconfig
sh                      rts7751r2d1_defconfig
sh                         apsh4a3a_defconfig
s390                             allmodconfig
arm                          exynos_defconfig
mips                     loongson2k_defconfig
m68k                       m5475evb_defconfig
powerpc                   lite5200b_defconfig
arm                           u8500_defconfig
um                                  defconfig
h8300                    h8300h-sim_defconfig
ia64                            zx1_defconfig
powerpc                      pcm030_defconfig
mips                     cu1000-neo_defconfig
mips                            gpr_defconfig
arm                         s3c2410_defconfig
arm                        spear3xx_defconfig
s390                       zfcpdump_defconfig
arm                     davinci_all_defconfig
m68k                         amcore_defconfig
arm                          pxa168_defconfig
arm                      integrator_defconfig
sh                ecovec24-romimage_defconfig
arm                       cns3420vb_defconfig
powerpc                      ppc6xx_defconfig
arc                           tb10x_defconfig
sh                          sdk7786_defconfig
csky                                defconfig
mips                         tb0226_defconfig
mips                           ci20_defconfig
nios2                         3c120_defconfig
parisc                generic-64bit_defconfig
x86_64                              defconfig
arm                       multi_v4t_defconfig
xtensa                    xip_kc705_defconfig
m68k                        mvme16x_defconfig
powerpc                    klondike_defconfig
powerpc                     tqm8560_defconfig
microblaze                          defconfig
arm                       omap2plus_defconfig
arm                        shmobile_defconfig
mips                            ar7_defconfig
mips                  decstation_64_defconfig
m68k                        stmark2_defconfig
openrisc                    or1ksim_defconfig
x86_64                            allnoconfig
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
i386                 randconfig-a003-20210519
i386                 randconfig-a001-20210519
i386                 randconfig-a005-20210519
i386                 randconfig-a004-20210519
i386                 randconfig-a002-20210519
i386                 randconfig-a006-20210519
x86_64               randconfig-a012-20210519
x86_64               randconfig-a015-20210519
x86_64               randconfig-a013-20210519
x86_64               randconfig-a011-20210519
x86_64               randconfig-a016-20210519
x86_64               randconfig-a014-20210519
i386                 randconfig-a014-20210519
i386                 randconfig-a016-20210519
i386                 randconfig-a011-20210519
i386                 randconfig-a015-20210519
i386                 randconfig-a012-20210519
i386                 randconfig-a013-20210519
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210519
x86_64               randconfig-a003-20210519
x86_64               randconfig-a004-20210519
x86_64               randconfig-a005-20210519
x86_64               randconfig-a001-20210519
x86_64               randconfig-a002-20210519
x86_64               randconfig-a006-20210519

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
