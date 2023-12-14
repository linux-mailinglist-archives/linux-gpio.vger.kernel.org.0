Return-Path: <linux-gpio+bounces-1443-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE4D812BC0
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 10:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58CB3B2128F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 09:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F010B2E846;
	Thu, 14 Dec 2023 09:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c2yoJXv8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 553BC98
	for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2023 01:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702546409; x=1734082409;
  h=date:from:to:cc:subject:message-id;
  bh=6Z3x+R08cd/2yxWsFWwoO9+6laTi/AZ4ScPvlsXf7IE=;
  b=c2yoJXv8iz/SNuVazkL6+9o9M1Xw+l2U3DmLinExrPMUKymnW9/d0aV7
   Az22Gu3kvvewX/bOMskpvDFAhlW6s5ZOaFaKGgQb2kjUV4bDV24iiEHL+
   L+fj1aPkz3VCAjxKvcwWk9Kdt0TQmtqzI2yRRWMQF9JTLXWwC0XIXCuRE
   UWtZ6DwWPV1VIB9UKUGDHR2Vc66kybJk6Syixu1gpdJ88ND0Zujp5Q/Jx
   4Uv5fFvfkQVAkrN0fRafL0s0lqXzc7SGLAIBLC4LruAgO2uoBDoc9zy40
   5elmMzrZIRJIi06gCanx4GWcArJZKzvhRoKkNsm8qepA07Zi9myIq9sCz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="461559635"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="461559635"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 01:33:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="947514696"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="947514696"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Dec 2023 01:33:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDi5s-000Lqv-0N;
	Thu, 14 Dec 2023 09:33:24 +0000
Date: Thu, 14 Dec 2023 17:33:07 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/gpio-descriptors-sound-misc] BUILD SUCCESS
 5634debdfb50c8f3d7af74adca070f0993163d55
Message-ID: <202312141704.hJghJJEW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/gpio-descriptors-sound-misc
branch HEAD: 5634debdfb50c8f3d7af74adca070f0993163d55  ASoC: tegra: tegra20_ac97: Convert to use GPIO descriptors

elapsed time: 1499m

configs tested: 255
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20231213   gcc  
arc                   randconfig-001-20231214   gcc  
arc                   randconfig-002-20231213   gcc  
arc                   randconfig-002-20231214   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          gemini_defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                   randconfig-001-20231213   clang
arm                   randconfig-001-20231214   gcc  
arm                   randconfig-002-20231213   clang
arm                   randconfig-002-20231214   gcc  
arm                   randconfig-003-20231213   clang
arm                   randconfig-003-20231214   gcc  
arm                   randconfig-004-20231213   clang
arm                   randconfig-004-20231214   gcc  
arm                        shmobile_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231213   clang
arm64                 randconfig-001-20231214   gcc  
arm64                 randconfig-002-20231213   clang
arm64                 randconfig-002-20231214   gcc  
arm64                 randconfig-003-20231213   clang
arm64                 randconfig-003-20231214   gcc  
arm64                 randconfig-004-20231213   clang
arm64                 randconfig-004-20231214   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231213   gcc  
csky                  randconfig-001-20231214   gcc  
csky                  randconfig-002-20231213   gcc  
csky                  randconfig-002-20231214   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231213   clang
hexagon               randconfig-002-20231213   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231213   clang
i386         buildonly-randconfig-002-20231213   clang
i386         buildonly-randconfig-003-20231213   clang
i386         buildonly-randconfig-004-20231213   clang
i386         buildonly-randconfig-005-20231213   clang
i386         buildonly-randconfig-006-20231213   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231213   clang
i386                  randconfig-002-20231213   clang
i386                  randconfig-003-20231213   clang
i386                  randconfig-004-20231213   clang
i386                  randconfig-005-20231213   clang
i386                  randconfig-006-20231213   clang
i386                  randconfig-011-20231213   gcc  
i386                  randconfig-011-20231214   clang
i386                  randconfig-012-20231213   gcc  
i386                  randconfig-012-20231214   clang
i386                  randconfig-013-20231213   gcc  
i386                  randconfig-013-20231214   clang
i386                  randconfig-014-20231213   gcc  
i386                  randconfig-014-20231214   clang
i386                  randconfig-015-20231213   gcc  
i386                  randconfig-015-20231214   clang
i386                  randconfig-016-20231213   gcc  
i386                  randconfig-016-20231214   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231213   gcc  
loongarch             randconfig-001-20231214   gcc  
loongarch             randconfig-002-20231213   gcc  
loongarch             randconfig-002-20231214   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231213   gcc  
nios2                 randconfig-001-20231214   gcc  
nios2                 randconfig-002-20231213   gcc  
nios2                 randconfig-002-20231214   gcc  
openrisc                         alldefconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231213   gcc  
parisc                randconfig-001-20231214   gcc  
parisc                randconfig-002-20231213   gcc  
parisc                randconfig-002-20231214   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     asp8347_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                      makalu_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                       ppc64_defconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20231213   clang
powerpc               randconfig-001-20231214   gcc  
powerpc               randconfig-002-20231213   clang
powerpc               randconfig-002-20231214   gcc  
powerpc               randconfig-003-20231213   clang
powerpc               randconfig-003-20231214   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20231213   clang
powerpc64             randconfig-001-20231214   gcc  
powerpc64             randconfig-002-20231213   clang
powerpc64             randconfig-002-20231214   gcc  
powerpc64             randconfig-003-20231213   clang
powerpc64             randconfig-003-20231214   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20231213   clang
riscv                 randconfig-001-20231214   gcc  
riscv                 randconfig-002-20231213   clang
riscv                 randconfig-002-20231214   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231213   gcc  
s390                  randconfig-002-20231213   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                    randconfig-001-20231213   gcc  
sh                    randconfig-001-20231214   gcc  
sh                    randconfig-002-20231213   gcc  
sh                    randconfig-002-20231214   gcc  
sh                          rsk7203_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                            titan_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231213   gcc  
sparc64               randconfig-001-20231214   gcc  
sparc64               randconfig-002-20231213   gcc  
sparc64               randconfig-002-20231214   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231213   clang
um                    randconfig-001-20231214   gcc  
um                    randconfig-002-20231213   clang
um                    randconfig-002-20231214   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231213   clang
x86_64       buildonly-randconfig-001-20231214   gcc  
x86_64       buildonly-randconfig-002-20231213   clang
x86_64       buildonly-randconfig-002-20231214   gcc  
x86_64       buildonly-randconfig-003-20231213   clang
x86_64       buildonly-randconfig-003-20231214   gcc  
x86_64       buildonly-randconfig-004-20231213   clang
x86_64       buildonly-randconfig-004-20231214   gcc  
x86_64       buildonly-randconfig-005-20231213   clang
x86_64       buildonly-randconfig-005-20231214   gcc  
x86_64       buildonly-randconfig-006-20231213   clang
x86_64       buildonly-randconfig-006-20231214   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20231213   clang
x86_64                randconfig-011-20231214   gcc  
x86_64                randconfig-012-20231213   clang
x86_64                randconfig-012-20231214   gcc  
x86_64                randconfig-013-20231213   clang
x86_64                randconfig-013-20231214   gcc  
x86_64                randconfig-014-20231213   clang
x86_64                randconfig-014-20231214   gcc  
x86_64                randconfig-015-20231213   clang
x86_64                randconfig-015-20231214   gcc  
x86_64                randconfig-016-20231213   clang
x86_64                randconfig-016-20231214   gcc  
x86_64                randconfig-071-20231213   clang
x86_64                randconfig-071-20231214   gcc  
x86_64                randconfig-072-20231213   clang
x86_64                randconfig-072-20231214   gcc  
x86_64                randconfig-073-20231213   clang
x86_64                randconfig-073-20231214   gcc  
x86_64                randconfig-074-20231213   clang
x86_64                randconfig-074-20231214   gcc  
x86_64                randconfig-075-20231213   clang
x86_64                randconfig-075-20231214   gcc  
x86_64                randconfig-076-20231213   clang
x86_64                randconfig-076-20231214   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20231213   gcc  
xtensa                randconfig-001-20231214   gcc  
xtensa                randconfig-002-20231213   gcc  
xtensa                randconfig-002-20231214   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

