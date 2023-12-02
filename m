Return-Path: <linux-gpio+bounces-901-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64713801C13
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Dec 2023 11:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A675B20E00
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Dec 2023 10:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96E8154AC;
	Sat,  2 Dec 2023 10:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8r6E6A7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F97CC
	for <linux-gpio@vger.kernel.org>; Sat,  2 Dec 2023 02:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701511357; x=1733047357;
  h=date:from:to:cc:subject:message-id;
  bh=xdpHBkS6NxIDOGJztMZipQfePOTCROftOd21TSkqOQk=;
  b=i8r6E6A7ApEQvqR+ozfhIYwp6Q4F2UNgYmEIk6dKdO3gdoOgZLtXfX6/
   5w843SeJfCyEXm7qSNN7kGvVpx4VMZxBBVSyKvWxRYx+qDQ8o2xJDLSVW
   8nuDWkheXvLwu0/RoZds0soSTTOMi0ZL9neUPA40BTTHIvNXyxdjSk8cC
   vfwcdM/PWR2g+Qd7SGQ1CtrpPRL5Oj0ARJ8ykmntP0xOhKYVbn3oLW1sU
   hdyeYA+UurnJLFagb5+ddHbDyWhLkkOnmMdwNBqcdm3PbsAos5dZstdJX
   KKwZslCQxlIdKSwxXd9zuIS/5bK0g8nTGGXyhdMKCLkgeEMcJzTJzWRiH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="383989222"
X-IronPort-AV: E=Sophos;i="6.04,245,1695711600"; 
   d="scan'208";a="383989222"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 02:02:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="913854187"
X-IronPort-AV: E=Sophos;i="6.04,245,1695711600"; 
   d="scan'208";a="913854187"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2023 02:02:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9MpV-0004y4-1g;
	Sat, 02 Dec 2023 10:02:33 +0000
Date: Sat, 02 Dec 2023 18:02:05 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 95dd1e34ff5bbee93a28ff3947eceaf6de811b1a
Message-ID: <202312021802.gxHbVEOb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 95dd1e34ff5bbee93a28ff3947eceaf6de811b1a  gpiolib: sysfs: Fix error handling on failed export

elapsed time: 1451m

configs tested: 257
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              alldefconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20231201   gcc  
arc                   randconfig-001-20231202   gcc  
arc                   randconfig-002-20231201   gcc  
arc                   randconfig-002-20231202   gcc  
arc                           tb10x_defconfig   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   clang
arm                         lpc18xx_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                   randconfig-001-20231201   gcc  
arm                   randconfig-002-20231201   gcc  
arm                   randconfig-003-20231201   gcc  
arm                   randconfig-004-20231201   gcc  
arm                        realview_defconfig   gcc  
arm                           stm32_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231201   gcc  
arm64                 randconfig-002-20231201   gcc  
arm64                 randconfig-003-20231201   gcc  
arm64                 randconfig-004-20231201   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231201   gcc  
csky                  randconfig-001-20231202   gcc  
csky                  randconfig-002-20231201   gcc  
csky                  randconfig-002-20231202   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231201   clang
hexagon               randconfig-002-20231201   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231201   gcc  
i386         buildonly-randconfig-002-20231201   gcc  
i386         buildonly-randconfig-003-20231201   gcc  
i386         buildonly-randconfig-004-20231201   gcc  
i386         buildonly-randconfig-005-20231201   gcc  
i386         buildonly-randconfig-006-20231201   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231201   gcc  
i386                  randconfig-002-20231201   gcc  
i386                  randconfig-003-20231201   gcc  
i386                  randconfig-004-20231201   gcc  
i386                  randconfig-005-20231201   gcc  
i386                  randconfig-006-20231201   gcc  
i386                  randconfig-011-20231201   clang
i386                  randconfig-011-20231202   gcc  
i386                  randconfig-012-20231201   clang
i386                  randconfig-012-20231202   gcc  
i386                  randconfig-013-20231201   clang
i386                  randconfig-013-20231202   gcc  
i386                  randconfig-014-20231201   clang
i386                  randconfig-014-20231202   gcc  
i386                  randconfig-015-20231201   clang
i386                  randconfig-015-20231202   gcc  
i386                  randconfig-016-20231201   clang
i386                  randconfig-016-20231202   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231201   gcc  
loongarch             randconfig-001-20231202   gcc  
loongarch             randconfig-002-20231201   gcc  
loongarch             randconfig-002-20231202   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           mtx1_defconfig   clang
mips                          rb532_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231201   gcc  
nios2                 randconfig-001-20231202   gcc  
nios2                 randconfig-002-20231201   gcc  
nios2                 randconfig-002-20231202   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231201   gcc  
parisc                randconfig-001-20231202   gcc  
parisc                randconfig-002-20231201   gcc  
parisc                randconfig-002-20231202   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      arches_defconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                        fsp2_defconfig   clang
powerpc                  iss476-smp_defconfig   gcc  
powerpc                 linkstation_defconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc               randconfig-001-20231201   gcc  
powerpc               randconfig-002-20231201   gcc  
powerpc               randconfig-003-20231201   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc64             randconfig-001-20231201   gcc  
powerpc64             randconfig-002-20231201   gcc  
powerpc64             randconfig-003-20231201   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231201   gcc  
riscv                 randconfig-002-20231201   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231201   clang
s390                  randconfig-001-20231202   gcc  
s390                  randconfig-002-20231201   clang
s390                  randconfig-002-20231202   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                    randconfig-001-20231201   gcc  
sh                    randconfig-001-20231202   gcc  
sh                    randconfig-002-20231201   gcc  
sh                    randconfig-002-20231202   gcc  
sh                          rsk7201_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231201   gcc  
sparc64               randconfig-001-20231202   gcc  
sparc64               randconfig-002-20231201   gcc  
sparc64               randconfig-002-20231202   gcc  
um                               alldefconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231201   gcc  
um                    randconfig-002-20231201   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231201   gcc  
x86_64       buildonly-randconfig-001-20231202   clang
x86_64       buildonly-randconfig-002-20231201   gcc  
x86_64       buildonly-randconfig-002-20231202   clang
x86_64       buildonly-randconfig-003-20231201   gcc  
x86_64       buildonly-randconfig-003-20231202   clang
x86_64       buildonly-randconfig-004-20231201   gcc  
x86_64       buildonly-randconfig-004-20231202   clang
x86_64       buildonly-randconfig-005-20231201   gcc  
x86_64       buildonly-randconfig-005-20231202   clang
x86_64       buildonly-randconfig-006-20231201   gcc  
x86_64       buildonly-randconfig-006-20231202   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231201   clang
x86_64                randconfig-002-20231201   clang
x86_64                randconfig-003-20231201   clang
x86_64                randconfig-004-20231201   clang
x86_64                randconfig-005-20231201   clang
x86_64                randconfig-006-20231201   clang
x86_64                randconfig-011-20231201   gcc  
x86_64                randconfig-011-20231202   clang
x86_64                randconfig-012-20231201   gcc  
x86_64                randconfig-012-20231202   clang
x86_64                randconfig-013-20231201   gcc  
x86_64                randconfig-013-20231202   clang
x86_64                randconfig-014-20231201   gcc  
x86_64                randconfig-014-20231202   clang
x86_64                randconfig-015-20231201   gcc  
x86_64                randconfig-015-20231202   clang
x86_64                randconfig-016-20231201   gcc  
x86_64                randconfig-016-20231202   clang
x86_64                randconfig-071-20231201   gcc  
x86_64                randconfig-071-20231202   clang
x86_64                randconfig-072-20231201   gcc  
x86_64                randconfig-072-20231202   clang
x86_64                randconfig-073-20231201   gcc  
x86_64                randconfig-073-20231202   clang
x86_64                randconfig-074-20231201   gcc  
x86_64                randconfig-074-20231202   clang
x86_64                randconfig-075-20231201   gcc  
x86_64                randconfig-075-20231202   clang
x86_64                randconfig-076-20231201   gcc  
x86_64                randconfig-076-20231202   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20231201   gcc  
xtensa                randconfig-001-20231202   gcc  
xtensa                randconfig-002-20231201   gcc  
xtensa                randconfig-002-20231202   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

