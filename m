Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 419F627F73D
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 03:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730723AbgJABW1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 21:22:27 -0400
Received: from mga09.intel.com ([134.134.136.24]:59503 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730381AbgJABWL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Sep 2020 21:22:11 -0400
IronPort-SDR: uDxre3a4+SbNjdoHPkB5+/C1J8bj+u9H6x4VqLaf6jRJcHlw7Vtl+cEQXsrgxlzzjCRb1HzRDA
 U0myRTXXnlPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="163449909"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="163449909"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 18:22:09 -0700
IronPort-SDR: ayEWGQ3chsxu/gIZw9RSkxYq0Lr5kN5SNYta1/uDLHGSboXY8Rt5D6z3JbhgHD/mXDBRs86sBb
 RlPBpUrNnz1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="339337538"
Received: from lkp-server02.sh.intel.com (HELO de448af6ea1b) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 30 Sep 2020 18:22:08 -0700
Received: from kbuild by de448af6ea1b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kNnIN-0000Sx-G9; Thu, 01 Oct 2020 01:22:07 +0000
Date:   Thu, 01 Oct 2020 09:21:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [gpio:devel] BUILD SUCCESS
 237d96164f2c2b33d0d5094192eb743e9e1b04ad
Message-ID: <5f752f1d.qChkiPxxkJ8cfjVX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git  devel
branch HEAD: 237d96164f2c2b33d0d5094192eb743e9e1b04ad  gpio: pca953x: Add support for the NXP PCAL9554B/C

elapsed time: 725m

configs tested: 109
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                       aspeed_g4_defconfig
powerpc                   motionpro_defconfig
sh                         ap325rxa_defconfig
powerpc                     sequoia_defconfig
mips                    maltaup_xpa_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                 linkstation_defconfig
c6x                         dsk6455_defconfig
powerpc64                        alldefconfig
alpha                               defconfig
powerpc                 canyonlands_defconfig
mips                          ath79_defconfig
nds32                            alldefconfig
nios2                         10m50_defconfig
powerpc                     rainier_defconfig
xtensa                       common_defconfig
sh                           sh2007_defconfig
powerpc                  iss476-smp_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                          simpad_defconfig
microblaze                    nommu_defconfig
arm                          gemini_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                           alldefconfig
arm                         nhk8815_defconfig
powerpc                    mvme5100_defconfig
arc                            hsdk_defconfig
m68k                           sun3_defconfig
arm                          pxa910_defconfig
sh                     magicpanelr2_defconfig
m68k                         apollo_defconfig
arm                              zx_defconfig
sh                           se7343_defconfig
arm                            dove_defconfig
mips                        nlm_xlr_defconfig
sh                        edosk7705_defconfig
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
riscv                          rv32_defconfig
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
