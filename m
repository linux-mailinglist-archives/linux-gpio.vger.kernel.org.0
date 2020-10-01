Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1645027F759
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 03:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgJAB2S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 21:28:18 -0400
Received: from mga06.intel.com ([134.134.136.31]:19481 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725823AbgJAB2S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Sep 2020 21:28:18 -0400
IronPort-SDR: tlPTJlH7kCzPqhRieKbFLvJP1o3G3ooglarcyYkRFR5XXa+Sbv0Vn+JQFKVW7lJ6k7Tf/EM7xx
 1C5BfpzzQJOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="224195848"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="224195848"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 18:28:16 -0700
IronPort-SDR: njSFvkKaY4NchzthQS8mvQOqVshJUilHMkruV5f1OEyY4Y4rHntM++3bg7gR+B+KiVxQ2HHAWf
 sv4cFiATb95g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="325221057"
Received: from lkp-server02.sh.intel.com (HELO de448af6ea1b) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Sep 2020 18:28:15 -0700
Received: from kbuild by de448af6ea1b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kNnOI-0000TD-5i; Thu, 01 Oct 2020 01:28:14 +0000
Date:   Thu, 01 Oct 2020 09:27:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [pinctrl:fixes] BUILD SUCCESS
 35ebe9ee3c4ab22cbd42f612281c7fee1ea9679f
Message-ID: <5f753091.ASS92BkiR896ibgW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  fixes
branch HEAD: 35ebe9ee3c4ab22cbd42f612281c7fee1ea9679f  pinctrl: mediatek: check mtk_is_virt_gpio input parameter

elapsed time: 721m

configs tested: 164
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                          g5_defconfig
arm                           u8500_defconfig
powerpc                     sbc8548_defconfig
powerpc                    gamecube_defconfig
mips                          rb532_defconfig
arm                       aspeed_g4_defconfig
powerpc                   motionpro_defconfig
sh                         ap325rxa_defconfig
powerpc                     sequoia_defconfig
mips                    maltaup_xpa_defconfig
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
alpha                               defconfig
powerpc                 canyonlands_defconfig
mips                          ath79_defconfig
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
powerpc                 mpc832x_rdb_defconfig
sparc                            allyesconfig
arm                          simpad_defconfig
microblaze                    nommu_defconfig
sh                                  defconfig
parisc                              defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                     tqm8540_defconfig
xtensa                  cadence_csp_defconfig
sh                          lboxre2_defconfig
mips                         rt305x_defconfig
mips                           ip28_defconfig
arm                          pxa3xx_defconfig
sh                ecovec24-romimage_defconfig
sh                   secureedge5410_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                          gemini_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                           alldefconfig
arm                         nhk8815_defconfig
arm                         bcm2835_defconfig
powerpc                      mgcoge_defconfig
powerpc                  storcenter_defconfig
microblaze                      mmu_defconfig
m68k                             allyesconfig
powerpc                    mvme5100_defconfig
arc                            hsdk_defconfig
m68k                           sun3_defconfig
arm                          pxa910_defconfig
sh                     magicpanelr2_defconfig
powerpc                    sam440ep_defconfig
sh                          sdk7786_defconfig
xtensa                          iss_defconfig
powerpc                      ppc44x_defconfig
sh                           se7750_defconfig
m68k                            q40_defconfig
arm                        multi_v5_defconfig
arm                          lpd270_defconfig
arm                        trizeps4_defconfig
powerpc                      chrp32_defconfig
arm                           stm32_defconfig
mips                      loongson3_defconfig
powerpc                      makalu_defconfig
arm                       imx_v6_v7_defconfig
arc                    vdk_hs38_smp_defconfig
mips                        bcm47xx_defconfig
arm                             pxa_defconfig
arm                         hackkit_defconfig
sh                          rsk7269_defconfig
m68k                         apollo_defconfig
arm                              zx_defconfig
sh                           se7343_defconfig
arm                            dove_defconfig
mips                        nlm_xlr_defconfig
sh                        edosk7705_defconfig
sh                          rsk7203_defconfig
sh                   sh7724_generic_defconfig
sh                             espt_defconfig
csky                                defconfig
powerpc                 mpc837x_rdb_defconfig
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
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
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
x86_64               randconfig-a011-20200930
x86_64               randconfig-a016-20200930
x86_64               randconfig-a014-20200930
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
x86_64               randconfig-a003-20200930
x86_64               randconfig-a006-20200930
x86_64               randconfig-a005-20200930
x86_64               randconfig-a004-20200930
x86_64               randconfig-a002-20200930

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
