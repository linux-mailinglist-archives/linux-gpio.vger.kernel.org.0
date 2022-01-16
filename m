Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBAD48FD70
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 15:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235350AbiAPO3E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Jan 2022 09:29:04 -0500
Received: from mga11.intel.com ([192.55.52.93]:20580 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229785AbiAPO3C (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 16 Jan 2022 09:29:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642343342; x=1673879342;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ROIwOBuJollBDIAI6OPSn2kQ3gEZQ6YmkWa7k8vlSf4=;
  b=aEtaMkfI4BiFYrwMOY/yYeBIpg/vOIUvmS8zxHw3EGt1Puv25uww+e0E
   QMUJ/fE0k++N/sHDOqo3l0AbTmMZ2Me0ssMpEzTdBQQxMTEYd9UMF8mpS
   tAjS7l4IINZp7TZ9rfaXnAU/dRE9j3A184VUNTyrkXLjDZR+lIwAsbcas
   G/xD9lx+6EvatsCXxJp/5iv3ReVQmUz+fyE7JEmgz2GeP799ji8qkkJP0
   N/9wXcgCo9OJEHhRK1DktvPhrCgtDae5EZsGOL4TGU7bHRrPBXJBnEbbH
   tJnQld4nDRFsTBxePf/Vyd4QRBo6ZvXhQq3dP3loQn+MkwZT2IJNtHWON
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10228"; a="242051338"
X-IronPort-AV: E=Sophos;i="5.88,293,1635231600"; 
   d="scan'208";a="242051338"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2022 06:29:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,293,1635231600"; 
   d="scan'208";a="692797170"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Jan 2022 06:29:00 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n96Wi-000Am2-2w; Sun, 16 Jan 2022 14:29:00 +0000
Date:   Sun, 16 Jan 2022 22:28:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 6c3dedc1cf9164b4a27bae9a048ae230199b6e8e
Message-ID: <61e42b92.5/PfzwD2JmqPL1SB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 6c3dedc1cf9164b4a27bae9a048ae230199b6e8e  pinctrl: meson-g12a: add more pwm_f options

elapsed time: 721m

configs tested: 99
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
m68k                          hp300_defconfig
sh                   sh7770_generic_defconfig
sparc64                          alldefconfig
arm                          simpad_defconfig
openrisc                  or1klitex_defconfig
powerpc                      bamboo_defconfig
arm                          exynos_defconfig
mips                      fuloong2e_defconfig
um                             i386_defconfig
sh                           se7343_defconfig
openrisc                 simple_smp_defconfig
xtensa                  nommu_kc705_defconfig
sh                          urquell_defconfig
arc                     haps_hs_smp_defconfig
arm                       omap2plus_defconfig
powerpc                 mpc8540_ads_defconfig
arm                         s3c6400_defconfig
sh                         apsh4a3a_defconfig
sh                              ul2_defconfig
powerpc                       maple_defconfig
sh                               j2_defconfig
xtensa                          iss_defconfig
sh                            hp6xx_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                        trizeps4_defconfig
arm                  randconfig-c002-20220116
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
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220116
x86_64                        randconfig-c007
riscv                randconfig-c006-20220116
powerpc              randconfig-c003-20220116
i386                          randconfig-c001
mips                 randconfig-c004-20220116
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220116
riscv                randconfig-r042-20220116
hexagon              randconfig-r041-20220116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
