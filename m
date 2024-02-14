Return-Path: <linux-gpio+bounces-3271-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6D48546A4
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 10:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C96971F23658
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 09:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99EF14A8C;
	Wed, 14 Feb 2024 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/Ng6AAy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF62101E3
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 09:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707904490; cv=none; b=ge/n693vKPmjuKR3r3wW/7xUIAg1Ll36iMG+1Hqk+Mp755nZ1qZbnppACsp/P1AqQje2tvYDgO/OV4WOdXA4i6UT+lc7HAaFw+F8q2yAKBXdn4OfIwb1PDE2Mojb1aimFGnipU+rMxeU3Uy5aTn5YtCo+sAMJbngwZJRJDQ7ev0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707904490; c=relaxed/simple;
	bh=AW3iTpdeQd5LrcY5EEVfeccxQicHGDM6fp70Qht42ow=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OmfvMzLUv02k3voQU/Axk/RtjLa7A6SDWQFPh+uduRhS/Dna7C9fQ5MKIWmhFho1qYlGkqzobf7kobXaOaG6qtRXUImBD9WGDT7rgC3yPoz4qtFAyP7fT3OMejNH6YCT8mT+C+RRE7tR97x7qnOwPP9s8Z0wjSh6ViZ0eOiAjdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/Ng6AAy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707904488; x=1739440488;
  h=date:from:to:cc:subject:message-id;
  bh=AW3iTpdeQd5LrcY5EEVfeccxQicHGDM6fp70Qht42ow=;
  b=L/Ng6AAytpUURfe2vLUgFCLfSi5IO0DSIFXUIaF1NQ8ftqgou2amJHyi
   BR/phr1uldywfm2mJ+xwoEkgb8hhY/bbeSDQBmr+Ml8CPsBBGor7BjK36
   E7ino2C2410V4b9y3G1P3Rjb7hrybVr1HgxNcxbcE/GeGIoq0ufDTSXlf
   O6CntP2xLXPwor2+qzALyucjuhPkM7tho6rAk7nkVpCp8MllPOcDTS6v9
   SyYXxZVWqNSHOIwG+2ZxhM0YA98AjMoH7A6cTCncVh8b7KmtSxoIPJexA
   ww0jlFqz4x4bZLmR/tICDnSvG2ZkWzfv63kOV7tv5VP+o1Kl/hKDniSjy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1849796"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1849796"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:54:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="7750562"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Feb 2024 01:54:45 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raByV-0008eU-1n;
	Wed, 14 Feb 2024 09:54:43 +0000
Date: Wed, 14 Feb 2024 17:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 cb4443f26b43efa54494b8de8a50457febb06940
Message-ID: <202402141718.espmTSLg-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: cb4443f26b43efa54494b8de8a50457febb06940  pinctrl: stm32: fix PM support for stm32mp257

elapsed time: 1458m

configs tested: 244
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
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240213   gcc  
arc                   randconfig-001-20240214   gcc  
arc                   randconfig-002-20240213   gcc  
arc                   randconfig-002-20240214   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                   randconfig-001-20240213   gcc  
arm                   randconfig-001-20240214   clang
arm                   randconfig-002-20240213   gcc  
arm                   randconfig-002-20240214   gcc  
arm                   randconfig-003-20240213   gcc  
arm                   randconfig-003-20240214   clang
arm                   randconfig-004-20240213   clang
arm                   randconfig-004-20240214   clang
arm                    vt8500_v6_v7_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240213   gcc  
arm64                 randconfig-001-20240214   clang
arm64                 randconfig-002-20240213   gcc  
arm64                 randconfig-002-20240214   clang
arm64                 randconfig-003-20240213   gcc  
arm64                 randconfig-003-20240214   gcc  
arm64                 randconfig-004-20240213   gcc  
arm64                 randconfig-004-20240214   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240213   gcc  
csky                  randconfig-001-20240214   gcc  
csky                  randconfig-002-20240213   gcc  
csky                  randconfig-002-20240214   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240213   clang
hexagon               randconfig-001-20240214   clang
hexagon               randconfig-002-20240213   clang
hexagon               randconfig-002-20240214   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240213   clang
i386         buildonly-randconfig-001-20240214   clang
i386         buildonly-randconfig-002-20240213   gcc  
i386         buildonly-randconfig-002-20240214   clang
i386         buildonly-randconfig-003-20240213   gcc  
i386         buildonly-randconfig-003-20240214   clang
i386         buildonly-randconfig-004-20240213   clang
i386         buildonly-randconfig-005-20240213   gcc  
i386         buildonly-randconfig-006-20240213   clang
i386         buildonly-randconfig-006-20240214   clang
i386                                defconfig   clang
i386                  randconfig-001-20240213   clang
i386                  randconfig-001-20240214   clang
i386                  randconfig-002-20240213   gcc  
i386                  randconfig-002-20240214   clang
i386                  randconfig-003-20240213   gcc  
i386                  randconfig-003-20240214   clang
i386                  randconfig-004-20240213   clang
i386                  randconfig-005-20240213   gcc  
i386                  randconfig-005-20240214   clang
i386                  randconfig-006-20240213   gcc  
i386                  randconfig-011-20240213   clang
i386                  randconfig-011-20240214   clang
i386                  randconfig-012-20240213   gcc  
i386                  randconfig-013-20240213   gcc  
i386                  randconfig-014-20240213   gcc  
i386                  randconfig-015-20240213   gcc  
i386                  randconfig-015-20240214   clang
i386                  randconfig-016-20240213   gcc  
i386                  randconfig-016-20240214   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240213   gcc  
loongarch             randconfig-001-20240214   gcc  
loongarch             randconfig-002-20240213   gcc  
loongarch             randconfig-002-20240214   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                      pic32mzda_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240213   gcc  
nios2                 randconfig-001-20240214   gcc  
nios2                 randconfig-002-20240213   gcc  
nios2                 randconfig-002-20240214   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240213   gcc  
parisc                randconfig-001-20240214   gcc  
parisc                randconfig-002-20240213   gcc  
parisc                randconfig-002-20240214   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        icon_defconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20240213   clang
powerpc               randconfig-001-20240214   clang
powerpc               randconfig-002-20240213   gcc  
powerpc               randconfig-002-20240214   clang
powerpc               randconfig-003-20240213   gcc  
powerpc               randconfig-003-20240214   clang
powerpc                     tqm8560_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc64             randconfig-001-20240213   gcc  
powerpc64             randconfig-001-20240214   clang
powerpc64             randconfig-002-20240213   gcc  
powerpc64             randconfig-002-20240214   clang
powerpc64             randconfig-003-20240213   clang
powerpc64             randconfig-003-20240214   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240213   gcc  
riscv                 randconfig-001-20240214   clang
riscv                 randconfig-002-20240213   gcc  
riscv                 randconfig-002-20240214   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240213   gcc  
s390                  randconfig-001-20240214   clang
s390                  randconfig-002-20240213   clang
s390                  randconfig-002-20240214   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                    randconfig-001-20240213   gcc  
sh                    randconfig-001-20240214   gcc  
sh                    randconfig-002-20240213   gcc  
sh                    randconfig-002-20240214   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          alldefconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240213   gcc  
sparc64               randconfig-001-20240214   gcc  
sparc64               randconfig-002-20240213   gcc  
sparc64               randconfig-002-20240214   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240213   clang
um                    randconfig-001-20240214   clang
um                    randconfig-002-20240213   gcc  
um                    randconfig-002-20240214   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240214   gcc  
x86_64       buildonly-randconfig-002-20240214   clang
x86_64       buildonly-randconfig-003-20240214   gcc  
x86_64       buildonly-randconfig-004-20240214   gcc  
x86_64       buildonly-randconfig-005-20240214   gcc  
x86_64       buildonly-randconfig-006-20240214   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240214   clang
x86_64                randconfig-002-20240214   gcc  
x86_64                randconfig-003-20240214   clang
x86_64                randconfig-004-20240214   gcc  
x86_64                randconfig-005-20240214   clang
x86_64                randconfig-006-20240214   clang
x86_64                randconfig-011-20240214   clang
x86_64                randconfig-012-20240214   clang
x86_64                randconfig-013-20240214   gcc  
x86_64                randconfig-014-20240214   gcc  
x86_64                randconfig-015-20240214   clang
x86_64                randconfig-016-20240214   clang
x86_64                randconfig-071-20240214   gcc  
x86_64                randconfig-072-20240214   clang
x86_64                randconfig-073-20240214   gcc  
x86_64                randconfig-074-20240214   clang
x86_64                randconfig-075-20240214   clang
x86_64                randconfig-076-20240214   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240213   gcc  
xtensa                randconfig-001-20240214   gcc  
xtensa                randconfig-002-20240213   gcc  
xtensa                randconfig-002-20240214   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

