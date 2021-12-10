Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A513246F8D8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 02:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232822AbhLJB72 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Dec 2021 20:59:28 -0500
Received: from mga09.intel.com ([134.134.136.24]:50951 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232642AbhLJB70 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Dec 2021 20:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639101352; x=1670637352;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pt1LUVJ7t6kvfKxFjDQlEfDO+jGg5uzrho/LBo1u0Cc=;
  b=Tvq90wbovb+4PxXvHTNoWTOKQ8b+SeyqGeiIsHIrcNXY8m3LaMQgDBEv
   fxYCTHVKu8oxfOhKbYPbvJdHXT8q9BB8UmxDFoyJJax/16nsXVC5Y7ytM
   ZRS+FIbkWl32RcMFouSrXPeF15s8/Iyi3Gns39kzFft+cAsUk4bLHExLQ
   yGALguN4ovnePLOiX6AbBrw8QOwUunyeu9/SYktmMt5Y6jicnDO4RAYTF
   T5GbNfnEey/0H1f/vaFWHfPw1AGcJ78QJW8PDF2W+asemBfwT412wlEOX
   rR/hX8m8chXRvA7VkzP1yHPh/wUvTDpUgDvL2TeWk7aR3ak6WRmrKo3v8
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="238054111"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; 
   d="scan'208";a="238054111"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2021 17:55:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; 
   d="scan'208";a="565026398"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 09 Dec 2021 17:55:50 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mvV8X-0002cl-Gw; Fri, 10 Dec 2021 01:55:49 +0000
Date:   Fri, 10 Dec 2021 09:55:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fix-bcm2835] BUILD SUCCESS
 c2f1326dcff2fe6646e1e8a1a55736bcbec567f7
Message-ID: <61b2b388.c5fsrTtfQnKRww/F%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fix-bcm2835
branch HEAD: c2f1326dcff2fe6646e1e8a1a55736bcbec567f7  pinctrl: bcm2835: Silence uninit warning

elapsed time: 723m

configs tested: 146
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211209
powerpc              randconfig-c003-20211209
x86_64                           allyesconfig
arc                      axs103_smp_defconfig
powerpc                      mgcoge_defconfig
arm                        mvebu_v7_defconfig
m68k                        stmark2_defconfig
arm                          imote2_defconfig
powerpc                    sam440ep_defconfig
m68k                        m5307c3_defconfig
sh                          sdk7780_defconfig
arm                           sunxi_defconfig
xtensa                  cadence_csp_defconfig
arm                          pxa3xx_defconfig
m68k                       m5475evb_defconfig
ia64                            zx1_defconfig
ia64                      gensparse_defconfig
powerpc                      tqm8xx_defconfig
arm                             mxs_defconfig
sh                        apsh4ad0a_defconfig
alpha                            allyesconfig
arm                            pleb_defconfig
ia64                        generic_defconfig
mips                          malta_defconfig
h8300                    h8300h-sim_defconfig
openrisc                 simple_smp_defconfig
sh                        sh7763rdp_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                     kilauea_defconfig
powerpc                      makalu_defconfig
sh                          lboxre2_defconfig
mips                           ip27_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                    socrates_defconfig
nds32                             allnoconfig
mips                  maltasmvp_eva_defconfig
mips                           rs90_defconfig
sh                           se7705_defconfig
sh                          sdk7786_defconfig
arm                           sama7_defconfig
mips                         cobalt_defconfig
sh                          rsk7201_defconfig
arm                             rpc_defconfig
arm                        multi_v5_defconfig
m68k                             alldefconfig
arm                      jornada720_defconfig
m68k                          hp300_defconfig
arm                       omap2plus_defconfig
ia64                                defconfig
powerpc                     ep8248e_defconfig
arm                             ezx_defconfig
arm                       multi_v4t_defconfig
powerpc                   motionpro_defconfig
mips                           gcw0_defconfig
arm                        mvebu_v5_defconfig
powerpc                        fsp2_defconfig
sh                           se7721_defconfig
arm                  randconfig-c002-20211209
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211209
x86_64               randconfig-a005-20211209
x86_64               randconfig-a001-20211209
x86_64               randconfig-a002-20211209
x86_64               randconfig-a004-20211209
x86_64               randconfig-a003-20211209
i386                 randconfig-a001-20211209
i386                 randconfig-a005-20211209
i386                 randconfig-a003-20211209
i386                 randconfig-a002-20211209
i386                 randconfig-a006-20211209
i386                 randconfig-a004-20211209
i386                 randconfig-a001-20211210
i386                 randconfig-a002-20211210
i386                 randconfig-a005-20211210
i386                 randconfig-a003-20211210
i386                 randconfig-a006-20211210
i386                 randconfig-a004-20211210
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211209
x86_64               randconfig-c007-20211209
riscv                randconfig-c006-20211209
i386                 randconfig-c001-20211209
mips                 randconfig-c004-20211209
powerpc              randconfig-c003-20211209
s390                 randconfig-c005-20211209
x86_64               randconfig-a016-20211209
x86_64               randconfig-a011-20211209
x86_64               randconfig-a013-20211209
x86_64               randconfig-a015-20211209
x86_64               randconfig-a012-20211209
x86_64               randconfig-a014-20211209
i386                 randconfig-a013-20211209
i386                 randconfig-a016-20211209
i386                 randconfig-a011-20211209
i386                 randconfig-a014-20211209
i386                 randconfig-a012-20211209
i386                 randconfig-a015-20211209
hexagon              randconfig-r045-20211209
s390                 randconfig-r044-20211209
hexagon              randconfig-r041-20211209
riscv                randconfig-r042-20211209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
