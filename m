Return-Path: <linux-gpio+bounces-770-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 008827FEE74
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 13:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24CCB1C20B08
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 12:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A343D97E;
	Thu, 30 Nov 2023 12:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLoXNd82"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8508510FE
	for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2023 04:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701345647; x=1732881647;
  h=date:from:to:cc:subject:message-id;
  bh=MYOFlS1vGeNCZqp6ip0FfN88BMmXXS3jUnEyWOUdwqo=;
  b=NLoXNd82SYuSFG7fg/bDOlmjNqRzIAquDvmJC1xLQYJ7+qWaBCycFahB
   6/hrC2zzr0cpyeOa56PveBiXTM0SmlAhKyV1w8/eqM1tcLA9Ksns86kQH
   fgAa2wJOSqgJMmMaFYfi05qxjAUVT8x2c2hlJNYUgOMEnnFUaF74+DvEV
   SQoWknhQ0mAvv8G/wCc9M/n8UnWvfUCOPry/lQzCEn+M1gJ2HT7fGWlKS
   Sh9KgfYViml/6nzFDsG/tRnIc4z5IFnsmhZs3dguL/mWcg+pKg3XjQ4iy
   M554SCANu1AqSmiORESOQ/1uS00zPjswJB5HigLLeb9p/ECjUtd7U0EFQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="372692796"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="372692796"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 04:00:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="719105959"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="719105959"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Nov 2023 04:00:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8fik-0001ol-0A;
	Thu, 30 Nov 2023 12:00:42 +0000
Date: Thu, 30 Nov 2023 20:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:at24/for-next] BUILD SUCCESS
 ec74a1dfcdd1714ee458d738b865598379197198
Message-ID: <202311302002.K7MVy9Ju-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git at24/for-next
branch HEAD: ec74a1dfcdd1714ee458d738b865598379197198  eeprom: at24: use of_match_ptr()

elapsed time: 1473m

configs tested: 255
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20231129   gcc  
arc                   randconfig-001-20231130   gcc  
arc                   randconfig-002-20231129   gcc  
arc                   randconfig-002-20231130   gcc  
arm                               allnoconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                   randconfig-001-20231129   gcc  
arm                   randconfig-001-20231130   gcc  
arm                   randconfig-002-20231129   gcc  
arm                   randconfig-002-20231130   gcc  
arm                   randconfig-003-20231129   gcc  
arm                   randconfig-003-20231130   gcc  
arm                   randconfig-004-20231129   gcc  
arm                   randconfig-004-20231130   gcc  
arm                        realview_defconfig   gcc  
arm                       spear13xx_defconfig   clang
arm                           stm32_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231129   gcc  
arm64                 randconfig-001-20231130   gcc  
arm64                 randconfig-002-20231129   gcc  
arm64                 randconfig-002-20231130   gcc  
arm64                 randconfig-003-20231129   gcc  
arm64                 randconfig-003-20231130   gcc  
arm64                 randconfig-004-20231129   gcc  
arm64                 randconfig-004-20231130   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231129   gcc  
csky                  randconfig-001-20231130   gcc  
csky                  randconfig-002-20231129   gcc  
csky                  randconfig-002-20231130   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386                                defconfig   gcc  
i386                  randconfig-011-20231129   clang
i386                  randconfig-011-20231130   clang
i386                  randconfig-012-20231129   clang
i386                  randconfig-012-20231130   clang
i386                  randconfig-013-20231129   clang
i386                  randconfig-013-20231130   clang
i386                  randconfig-014-20231129   clang
i386                  randconfig-014-20231130   clang
i386                  randconfig-015-20231129   clang
i386                  randconfig-015-20231130   clang
i386                  randconfig-016-20231129   clang
i386                  randconfig-016-20231130   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231129   gcc  
loongarch             randconfig-001-20231130   gcc  
loongarch             randconfig-002-20231129   gcc  
loongarch             randconfig-002-20231130   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                         db1xxx_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                     loongson1c_defconfig   clang
mips                      loongson3_defconfig   gcc  
mips                          rb532_defconfig   gcc  
mips                           rs90_defconfig   clang
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231129   gcc  
nios2                 randconfig-001-20231130   gcc  
nios2                 randconfig-002-20231129   gcc  
nios2                 randconfig-002-20231130   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20231129   gcc  
parisc                randconfig-001-20231130   gcc  
parisc                randconfig-002-20231129   gcc  
parisc                randconfig-002-20231130   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     asp8347_defconfig   gcc  
powerpc                       ebony_defconfig   clang
powerpc                     ep8248e_defconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                   microwatt_defconfig   clang
powerpc                   motionpro_defconfig   gcc  
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc                     powernv_defconfig   clang
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20231129   gcc  
powerpc               randconfig-001-20231130   gcc  
powerpc               randconfig-002-20231129   gcc  
powerpc               randconfig-002-20231130   gcc  
powerpc               randconfig-003-20231129   gcc  
powerpc               randconfig-003-20231130   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     tqm8548_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20231129   gcc  
powerpc64             randconfig-001-20231130   gcc  
powerpc64             randconfig-002-20231129   gcc  
powerpc64             randconfig-002-20231130   gcc  
powerpc64             randconfig-003-20231129   gcc  
powerpc64             randconfig-003-20231130   gcc  
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                 randconfig-001-20231129   gcc  
riscv                 randconfig-001-20231130   gcc  
riscv                 randconfig-002-20231129   gcc  
riscv                 randconfig-002-20231130   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                    randconfig-001-20231129   gcc  
sh                    randconfig-001-20231130   gcc  
sh                    randconfig-002-20231129   gcc  
sh                    randconfig-002-20231130   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231129   gcc  
sparc64               randconfig-001-20231130   gcc  
sparc64               randconfig-002-20231129   gcc  
sparc64               randconfig-002-20231130   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231129   gcc  
um                    randconfig-001-20231130   gcc  
um                    randconfig-002-20231129   gcc  
um                    randconfig-002-20231130   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231129   gcc  
x86_64       buildonly-randconfig-001-20231130   gcc  
x86_64       buildonly-randconfig-002-20231129   gcc  
x86_64       buildonly-randconfig-002-20231130   gcc  
x86_64       buildonly-randconfig-003-20231129   gcc  
x86_64       buildonly-randconfig-003-20231130   gcc  
x86_64       buildonly-randconfig-004-20231129   gcc  
x86_64       buildonly-randconfig-004-20231130   gcc  
x86_64       buildonly-randconfig-005-20231129   gcc  
x86_64       buildonly-randconfig-005-20231130   gcc  
x86_64       buildonly-randconfig-006-20231129   gcc  
x86_64       buildonly-randconfig-006-20231130   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20231129   gcc  
x86_64                randconfig-011-20231130   gcc  
x86_64                randconfig-012-20231129   gcc  
x86_64                randconfig-012-20231130   gcc  
x86_64                randconfig-013-20231129   gcc  
x86_64                randconfig-013-20231130   gcc  
x86_64                randconfig-014-20231129   gcc  
x86_64                randconfig-014-20231130   gcc  
x86_64                randconfig-015-20231129   gcc  
x86_64                randconfig-015-20231130   gcc  
x86_64                randconfig-016-20231129   gcc  
x86_64                randconfig-016-20231130   gcc  
x86_64                randconfig-071-20231129   gcc  
x86_64                randconfig-071-20231130   gcc  
x86_64                randconfig-072-20231129   gcc  
x86_64                randconfig-072-20231130   gcc  
x86_64                randconfig-073-20231129   gcc  
x86_64                randconfig-073-20231130   gcc  
x86_64                randconfig-074-20231129   gcc  
x86_64                randconfig-074-20231130   gcc  
x86_64                randconfig-075-20231129   gcc  
x86_64                randconfig-075-20231130   gcc  
x86_64                randconfig-076-20231129   gcc  
x86_64                randconfig-076-20231130   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                randconfig-001-20231129   gcc  
xtensa                randconfig-001-20231130   gcc  
xtensa                randconfig-002-20231129   gcc  
xtensa                randconfig-002-20231130   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

