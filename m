Return-Path: <linux-gpio+bounces-3170-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFF08504CB
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Feb 2024 15:53:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E816D1F22009
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Feb 2024 14:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC0355798;
	Sat, 10 Feb 2024 14:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5BAvtn0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A7720B29
	for <linux-gpio@vger.kernel.org>; Sat, 10 Feb 2024 14:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707576806; cv=none; b=Q8np9+6hW3Ch1johXMBSvVgyEMzwBJDgfrg6lq8FBJW1L+gXRUbeUAS4cTqK2SWTObHbcUCDyrx0/udccJgTJCC29yXH2C226EavmxD3Q+XSQo1/gv4J20nIR4qMc/xiMzMUur/BoZ/FUr7UPTBkjMA1fKlbtc/+iA7wHOsp/0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707576806; c=relaxed/simple;
	bh=VEovzUx41gCVHGOzBFzHX1u5DN7klZqTa1RM1ISqNmU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kXy/29aJn3Anxqo1GJd+/g0dYPQ4uRc5ade+PdR52lkCdD1B6aBQLQkJisp0vX00C2lnNymn9zqDdqLCT0rzn5j4uXP1DuZcmLKx7kep35GhMQVfMjVZ0+CEiRmPpDsd7zWlEnKEXdx1JATSGQo+wrT1Ds7rWnfULW6PG7aMv9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5BAvtn0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707576804; x=1739112804;
  h=date:from:to:cc:subject:message-id;
  bh=VEovzUx41gCVHGOzBFzHX1u5DN7klZqTa1RM1ISqNmU=;
  b=j5BAvtn0mzkKfYL+pghvHyPXAms+ScP+XDr40HSES28uosoBBCMqGyZI
   hbrJCAc2jAbBmJNP8m6peEQqnTS95FvUchd4KynQHGTc3gxwWtMfJQam6
   oo4Wo2bTyeChEjsWf28QpIVxfJjZ3JuGu9rI8imT4h8/z66n0Ro05T0HO
   uM0vsjOiQGe3RKuyE1cUNF3fPUidquFKX3vQyT997QCQfWvs2pSYqhRBN
   LUT833jWTpbU711ViaYmyePuvrVPPDrM9odZ9+Whi0Rf81zPzpLjdSsyT
   VC+5GDy7hH8NY49uXplSw/XMGCiahp6cDgrGS4vWTBhurvhMCnmM0cxOT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="12210404"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="12210404"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 06:53:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="39627453"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Feb 2024 06:53:23 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYojI-0005ki-05;
	Sat, 10 Feb 2024 14:53:20 +0000
Date: Sat, 10 Feb 2024 22:52:20 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 2c0aafdf4a7c9e6381bcaa7d8aa2e90e42b028d7
Message-ID: <202402102219.zla8oF85-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 2c0aafdf4a7c9e6381bcaa7d8aa2e90e42b028d7  pinctrl: mcp23s08: Check only GPIOs which have interrupts enabled

elapsed time: 1445m

configs tested: 227
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
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240210   gcc  
arc                   randconfig-002-20240210   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            dove_defconfig   gcc  
arm                      jornada720_defconfig   clang
arm                         lpc32xx_defconfig   clang
arm                             mxs_defconfig   clang
arm                   randconfig-001-20240210   gcc  
arm                   randconfig-002-20240210   gcc  
arm                   randconfig-003-20240210   gcc  
arm                   randconfig-004-20240210   gcc  
arm                        shmobile_defconfig   gcc  
arm                         socfpga_defconfig   gcc  
arm                           stm32_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-002-20240210   gcc  
arm64                 randconfig-003-20240210   gcc  
arm64                 randconfig-004-20240210   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240210   gcc  
csky                  randconfig-002-20240210   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240209   clang
i386         buildonly-randconfig-001-20240210   clang
i386         buildonly-randconfig-002-20240209   clang
i386         buildonly-randconfig-002-20240210   gcc  
i386         buildonly-randconfig-003-20240209   gcc  
i386         buildonly-randconfig-003-20240210   clang
i386         buildonly-randconfig-004-20240209   clang
i386         buildonly-randconfig-004-20240210   clang
i386         buildonly-randconfig-005-20240209   clang
i386         buildonly-randconfig-005-20240210   clang
i386         buildonly-randconfig-006-20240209   gcc  
i386         buildonly-randconfig-006-20240210   clang
i386                                defconfig   clang
i386                  randconfig-001-20240209   clang
i386                  randconfig-001-20240210   gcc  
i386                  randconfig-002-20240209   gcc  
i386                  randconfig-002-20240210   gcc  
i386                  randconfig-003-20240209   clang
i386                  randconfig-003-20240210   clang
i386                  randconfig-004-20240209   clang
i386                  randconfig-004-20240210   clang
i386                  randconfig-005-20240209   clang
i386                  randconfig-005-20240210   gcc  
i386                  randconfig-006-20240209   gcc  
i386                  randconfig-006-20240210   gcc  
i386                  randconfig-011-20240209   gcc  
i386                  randconfig-011-20240210   clang
i386                  randconfig-012-20240209   gcc  
i386                  randconfig-012-20240210   clang
i386                  randconfig-013-20240209   clang
i386                  randconfig-013-20240210   clang
i386                  randconfig-014-20240209   gcc  
i386                  randconfig-014-20240210   gcc  
i386                  randconfig-015-20240209   gcc  
i386                  randconfig-015-20240210   gcc  
i386                  randconfig-016-20240209   gcc  
i386                  randconfig-016-20240210   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240210   gcc  
loongarch             randconfig-002-20240210   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     loongson2k_defconfig   gcc  
mips                           xway_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240210   gcc  
nios2                 randconfig-002-20240210   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240210   gcc  
parisc                randconfig-002-20240210   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      bamboo_defconfig   clang
powerpc                      cm5200_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20240210   gcc  
powerpc               randconfig-003-20240210   gcc  
powerpc                         wii_defconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240210   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240210   gcc  
s390                  randconfig-002-20240210   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                    randconfig-001-20240210   gcc  
sh                    randconfig-002-20240210   gcc  
sh                           se7343_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240210   gcc  
sparc64               randconfig-002-20240210   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240210   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240209   gcc  
x86_64       buildonly-randconfig-001-20240210   gcc  
x86_64       buildonly-randconfig-002-20240209   gcc  
x86_64       buildonly-randconfig-002-20240210   gcc  
x86_64       buildonly-randconfig-003-20240209   clang
x86_64       buildonly-randconfig-003-20240210   gcc  
x86_64       buildonly-randconfig-004-20240209   gcc  
x86_64       buildonly-randconfig-004-20240210   clang
x86_64       buildonly-randconfig-005-20240209   clang
x86_64       buildonly-randconfig-005-20240210   clang
x86_64       buildonly-randconfig-006-20240209   gcc  
x86_64       buildonly-randconfig-006-20240210   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240209   clang
x86_64                randconfig-001-20240210   clang
x86_64                randconfig-002-20240209   gcc  
x86_64                randconfig-002-20240210   clang
x86_64                randconfig-003-20240209   gcc  
x86_64                randconfig-003-20240210   gcc  
x86_64                randconfig-004-20240209   clang
x86_64                randconfig-004-20240210   clang
x86_64                randconfig-005-20240209   gcc  
x86_64                randconfig-005-20240210   clang
x86_64                randconfig-006-20240209   gcc  
x86_64                randconfig-006-20240210   gcc  
x86_64                randconfig-011-20240209   clang
x86_64                randconfig-011-20240210   gcc  
x86_64                randconfig-012-20240209   clang
x86_64                randconfig-012-20240210   clang
x86_64                randconfig-013-20240209   gcc  
x86_64                randconfig-013-20240210   clang
x86_64                randconfig-014-20240209   clang
x86_64                randconfig-014-20240210   clang
x86_64                randconfig-015-20240209   gcc  
x86_64                randconfig-015-20240210   gcc  
x86_64                randconfig-016-20240209   clang
x86_64                randconfig-016-20240210   clang
x86_64                randconfig-071-20240209   gcc  
x86_64                randconfig-071-20240210   gcc  
x86_64                randconfig-072-20240209   clang
x86_64                randconfig-072-20240210   gcc  
x86_64                randconfig-073-20240209   clang
x86_64                randconfig-073-20240210   clang
x86_64                randconfig-074-20240209   gcc  
x86_64                randconfig-074-20240210   gcc  
x86_64                randconfig-075-20240209   gcc  
x86_64                randconfig-075-20240210   clang
x86_64                randconfig-076-20240209   clang
x86_64                randconfig-076-20240210   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240210   gcc  
xtensa                randconfig-002-20240210   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

