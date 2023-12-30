Return-Path: <linux-gpio+bounces-1940-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F0F82092B
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Dec 2023 00:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6370B1F22334
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 23:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D07F9E9;
	Sat, 30 Dec 2023 23:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="guTyFxut"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D3911195
	for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 23:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703980587; x=1735516587;
  h=date:from:to:cc:subject:message-id;
  bh=O3ADQttsimB/C7fQSDnVl7PBg/D8hPNJzcUhkkm8ZtI=;
  b=guTyFxutTyqjlm4VzV8pal2LVp78VelgBcMzSoF8hP+KgnYHHo92NHov
   /t/HlUTVgOg2XD7h3CbRHPkf8s+zzfy6PxUPnGAHf2+hGC1/kWVf6NwPN
   hicKoAjN6JSteCKcFfzurzn+KAgQI+/Jp1061Zp3cT8/vEF2MvFcVcavp
   zQfwPCNHebTFgW7sbsFcI8MMnbsjrypWqTM+M7MCIhhxDUrJbDITzHXDf
   XbMn/rFoCXnqw9EUmBTdChMdKFgNwE1pAPjOQOryfq4CC036yNN2XGSr8
   7OWLRrHJckzof0q1IO8LmkU5il4C0aKWTA3e+Sb0Xqhr1smGaJZz4OwZ8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="4034970"
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="4034970"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 15:56:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="772245967"
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="772245967"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 30 Dec 2023 15:56:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJjBm-000IqR-11;
	Sat, 30 Dec 2023 23:56:22 +0000
Date: Sun, 31 Dec 2023 07:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 1b09c2b8f849079220a9a9ddf961582f00bdc2c4
Message-ID: <202312310755.11tGLXEp-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 1b09c2b8f849079220a9a9ddf961582f00bdc2c4  pinctrl: samsung: constify iomem pointers

elapsed time: 1454m

configs tested: 178
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20231230   gcc  
arc                   randconfig-002-20231230   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                         bcm2835_defconfig   clang
arm                                 defconfig   clang
arm                        multi_v7_defconfig   gcc  
arm                   randconfig-001-20231230   clang
arm                   randconfig-002-20231230   clang
arm                   randconfig-003-20231230   clang
arm                   randconfig-004-20231230   clang
arm                           sunxi_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231230   clang
arm64                 randconfig-002-20231230   clang
arm64                 randconfig-003-20231230   clang
arm64                 randconfig-004-20231230   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231230   gcc  
csky                  randconfig-002-20231230   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231230   clang
hexagon               randconfig-002-20231230   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231230   clang
i386         buildonly-randconfig-002-20231230   clang
i386         buildonly-randconfig-003-20231230   clang
i386         buildonly-randconfig-004-20231230   clang
i386         buildonly-randconfig-005-20231230   clang
i386         buildonly-randconfig-006-20231230   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231230   clang
i386                  randconfig-002-20231230   clang
i386                  randconfig-003-20231230   clang
i386                  randconfig-004-20231230   clang
i386                  randconfig-005-20231230   clang
i386                  randconfig-006-20231230   clang
i386                  randconfig-011-20231230   gcc  
i386                  randconfig-012-20231230   gcc  
i386                  randconfig-013-20231230   gcc  
i386                  randconfig-014-20231230   gcc  
i386                  randconfig-015-20231230   gcc  
i386                  randconfig-016-20231230   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231230   gcc  
loongarch             randconfig-002-20231230   gcc  
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
mips                          ath79_defconfig   clang
mips                           ci20_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231230   gcc  
nios2                 randconfig-002-20231230   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231230   gcc  
parisc                randconfig-002-20231230   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 mpc8315_rdb_defconfig   clang
powerpc               randconfig-001-20231230   clang
powerpc               randconfig-002-20231230   clang
powerpc               randconfig-003-20231230   clang
powerpc                    socrates_defconfig   gcc  
powerpc64             randconfig-001-20231230   clang
powerpc64             randconfig-002-20231230   clang
powerpc64             randconfig-003-20231230   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231230   clang
riscv                 randconfig-002-20231230   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231230   gcc  
s390                  randconfig-002-20231230   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20231230   gcc  
sh                    randconfig-002-20231230   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231230   gcc  
sparc64               randconfig-002-20231230   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231230   clang
um                    randconfig-002-20231230   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231230   clang
x86_64       buildonly-randconfig-002-20231230   clang
x86_64       buildonly-randconfig-003-20231230   clang
x86_64       buildonly-randconfig-004-20231230   clang
x86_64       buildonly-randconfig-005-20231230   clang
x86_64       buildonly-randconfig-006-20231230   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231230   gcc  
x86_64                randconfig-002-20231230   gcc  
x86_64                randconfig-003-20231230   gcc  
x86_64                randconfig-004-20231230   gcc  
x86_64                randconfig-005-20231230   gcc  
x86_64                randconfig-006-20231230   gcc  
x86_64                randconfig-011-20231230   clang
x86_64                randconfig-012-20231230   clang
x86_64                randconfig-013-20231230   clang
x86_64                randconfig-014-20231230   clang
x86_64                randconfig-015-20231230   clang
x86_64                randconfig-016-20231230   clang
x86_64                randconfig-071-20231230   clang
x86_64                randconfig-072-20231230   clang
x86_64                randconfig-073-20231230   clang
x86_64                randconfig-074-20231230   clang
x86_64                randconfig-075-20231230   clang
x86_64                randconfig-076-20231230   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231230   gcc  
xtensa                randconfig-002-20231230   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

