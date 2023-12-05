Return-Path: <linux-gpio+bounces-1012-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8751E804FD9
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 11:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B865F1C20A60
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 10:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC264C63F;
	Tue,  5 Dec 2023 10:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHt34V8e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC911A0
	for <linux-gpio@vger.kernel.org>; Tue,  5 Dec 2023 02:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701770918; x=1733306918;
  h=date:from:to:cc:subject:message-id;
  bh=kVeW+O0lDUddOE0eDspn+CjqEkrRZ1BIm8WrhGMupvQ=;
  b=jHt34V8eru1AyETyBS5X4QSpngxB66Gw91+1JAL1z2a2RK7TI2V5xJFj
   ub1LuiHWJbH/0QB8GdtjjCO9GgfzTiIzx+749fx4xXSWp44ni4Dzrfel7
   hT4LAmnhGu+VWl4jq++1rnmtXa5KKzvkqJCfWvReTOURfSmvHDabAdWv/
   j3aYKBSs/F+nde4MweNU10ZHtygc5Nc3cNseU+PppY+RAmxcSSwd+Qkoh
   bCvBO7VfpxsjT2J7HJsJaGtosPWQhdGVFUUpZfaUjJBhhrDhOj9kWuZ6Y
   5VYgiiWIaB2yRk/V8tRG90ly+uJKda5i8hOg2XKJA5eyh7/JSU8SHNVVH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="714946"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="714946"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 02:08:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1102403036"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="1102403036"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Dec 2023 02:08:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rASLz-0008iz-0v;
	Tue, 05 Dec 2023 10:08:35 +0000
Date: Tue, 05 Dec 2023 18:07:43 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 52816298bd2a1e8c6fb3d9311730c00ef03c1f03
Message-ID: <202312051840.W5cz56K6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 52816298bd2a1e8c6fb3d9311730c00ef03c1f03  dt-bindings: gpio: rockchip: add a pattern for gpio hogs

elapsed time: 1466m

configs tested: 176
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231204   gcc  
arc                   randconfig-002-20231204   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20231204   clang
arm                   randconfig-002-20231204   clang
arm                   randconfig-003-20231204   clang
arm                   randconfig-004-20231204   clang
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231204   clang
arm64                 randconfig-002-20231204   clang
arm64                 randconfig-003-20231204   clang
arm64                 randconfig-004-20231204   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231204   gcc  
csky                  randconfig-002-20231204   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231204   clang
hexagon               randconfig-002-20231204   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231204   clang
i386         buildonly-randconfig-002-20231204   clang
i386         buildonly-randconfig-003-20231204   clang
i386         buildonly-randconfig-004-20231204   clang
i386         buildonly-randconfig-005-20231204   clang
i386         buildonly-randconfig-006-20231204   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231204   clang
i386                  randconfig-002-20231204   clang
i386                  randconfig-003-20231204   clang
i386                  randconfig-004-20231204   clang
i386                  randconfig-005-20231204   clang
i386                  randconfig-006-20231204   clang
i386                  randconfig-011-20231204   gcc  
i386                  randconfig-012-20231204   gcc  
i386                  randconfig-013-20231204   gcc  
i386                  randconfig-014-20231204   gcc  
i386                  randconfig-015-20231204   gcc  
i386                  randconfig-016-20231204   gcc  
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231204   gcc  
loongarch             randconfig-002-20231204   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                           rs90_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231204   gcc  
nios2                 randconfig-002-20231204   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231204   gcc  
parisc                randconfig-002-20231204   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      bamboo_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                        fsp2_defconfig   clang
powerpc                  mpc885_ads_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                      pmac32_defconfig   clang
powerpc               randconfig-001-20231204   clang
powerpc               randconfig-002-20231204   clang
powerpc               randconfig-003-20231204   clang
powerpc                    sam440ep_defconfig   gcc  
powerpc64             randconfig-001-20231204   clang
powerpc64             randconfig-002-20231204   clang
powerpc64             randconfig-003-20231204   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231204   clang
riscv                 randconfig-002-20231204   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231204   gcc  
s390                  randconfig-002-20231204   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231204   gcc  
sh                    randconfig-002-20231204   gcc  
sh                   secureedge5410_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231204   gcc  
sparc64               randconfig-002-20231204   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231204   clang
um                    randconfig-002-20231204   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231204   clang
x86_64       buildonly-randconfig-002-20231204   clang
x86_64       buildonly-randconfig-003-20231204   clang
x86_64       buildonly-randconfig-004-20231204   clang
x86_64       buildonly-randconfig-005-20231204   clang
x86_64       buildonly-randconfig-006-20231204   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231204   gcc  
x86_64                randconfig-002-20231204   gcc  
x86_64                randconfig-003-20231204   gcc  
x86_64                randconfig-004-20231204   gcc  
x86_64                randconfig-005-20231204   gcc  
x86_64                randconfig-006-20231204   gcc  
x86_64                randconfig-011-20231204   clang
x86_64                randconfig-012-20231204   clang
x86_64                randconfig-013-20231204   clang
x86_64                randconfig-014-20231204   clang
x86_64                randconfig-015-20231204   clang
x86_64                randconfig-016-20231204   clang
x86_64                randconfig-071-20231204   clang
x86_64                randconfig-072-20231204   clang
x86_64                randconfig-073-20231204   clang
x86_64                randconfig-074-20231204   clang
x86_64                randconfig-075-20231204   clang
x86_64                randconfig-076-20231204   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231204   gcc  
xtensa                randconfig-002-20231204   gcc  
xtensa                    smp_lx200_defconfig   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

