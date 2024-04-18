Return-Path: <linux-gpio+bounces-5653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4084E8A965A
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Apr 2024 11:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 619831C21767
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Apr 2024 09:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A7015B0F5;
	Thu, 18 Apr 2024 09:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NyosuZTj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF2B15B105
	for <linux-gpio@vger.kernel.org>; Thu, 18 Apr 2024 09:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713433103; cv=none; b=HSy1VDXlvN4AggvvEgKz2enbF24xqXHSBWGbginQMq5Ctr4ji9GeJDhsCqPn58pdl4r69pEVq1Mul+Rf+EYzPzC/TIesu97aC3PDJWVLm/bxjgv32HY/mCi4+tt3xepcpZoo7tkBDHMtr5LY1L/7qEaso8JCbtCw9KwElnp80TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713433103; c=relaxed/simple;
	bh=aPNsd+Dwv8GoenWcxjRffDq726qMUkIyoOzyHvljFKU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dGczP1JSF4S+qpNTDWCdZNTMeq8NV5g4RbBZuX6/q5aYotYNG+K5cHScvqUy+dRDbRRGmEDSAj5ay5zkRT2tSqEkMlrIIOjmVKht+mqzmcdY54FnyZaeSdOdKGGGmDj79kQ7PXVsluMK5Fn0ebTcNse6/BG+64ZpXG8SDv0FkdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NyosuZTj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713433101; x=1744969101;
  h=date:from:to:cc:subject:message-id;
  bh=aPNsd+Dwv8GoenWcxjRffDq726qMUkIyoOzyHvljFKU=;
  b=NyosuZTj8Pa72TcRyQ9ao2VDgxOodteLiYyzfBaR4S4CfCCusdvkf5Yc
   baKIDYyHfJFcXu8VtFwUCDbu+qZ587m3RNmmzUIUd+6bQA1UCNPLbPco/
   Zngx+19DFIqTMeZOXx/3Mk+6jqgc+C1nsNnsDnljCOiVgtAKhk1+p9WEj
   yB/bQzeq+GjibkDnstdQX7O4jpAheKWgsqiNDYJjiBGXlUqBwYtWwRprE
   hvn8tB/LsswKYFHG5rvINa21zfz/qkNDQSH3lveBX9KwcVrbh2RT8Gmcy
   NSLVqQK2+vIzHpqG1FyZchSA8B3qk5W3qC3vzweMRTOcD7szSQxIPZ90f
   A==;
X-CSE-ConnectionGUID: RVKVI8whSuye5ouTTusRAQ==
X-CSE-MsgGUID: 0L/uvTPkSlub6uVTkEZ36w==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12806797"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="12806797"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 02:38:20 -0700
X-CSE-ConnectionGUID: R5d6Cx03SOWS9FZECrO61A==
X-CSE-MsgGUID: w/8BcvVLRpaQMOzefbq6EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="23532151"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 Apr 2024 02:38:18 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxODg-0007TM-0D;
	Thu, 18 Apr 2024 09:38:16 +0000
Date: Thu, 18 Apr 2024 17:37:27 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 69ffed4b62523bbc85511f150500329d28aba356
Message-ID: <202404181724.vbVITD7I-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 69ffed4b62523bbc85511f150500329d28aba356  gpiolib: swnode: Remove wrong header inclusion

elapsed time: 741m

configs tested: 160
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
arc                   randconfig-001-20240418   gcc  
arc                   randconfig-002-20240418   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                   randconfig-001-20240418   gcc  
arm                   randconfig-002-20240418   gcc  
arm                   randconfig-003-20240418   gcc  
arm                   randconfig-004-20240418   gcc  
arm                         s3c6400_defconfig   gcc  
arm                    vt8500_v6_v7_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-002-20240418   gcc  
arm64                 randconfig-003-20240418   gcc  
arm64                 randconfig-004-20240418   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240418   gcc  
csky                  randconfig-002-20240418   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240418   gcc  
i386         buildonly-randconfig-002-20240418   gcc  
i386         buildonly-randconfig-003-20240418   clang
i386         buildonly-randconfig-004-20240418   gcc  
i386         buildonly-randconfig-005-20240418   clang
i386         buildonly-randconfig-006-20240418   clang
i386                                defconfig   clang
i386                  randconfig-001-20240418   gcc  
i386                  randconfig-002-20240418   gcc  
i386                  randconfig-003-20240418   clang
i386                  randconfig-004-20240418   gcc  
i386                  randconfig-005-20240418   gcc  
i386                  randconfig-006-20240418   gcc  
i386                  randconfig-011-20240418   clang
i386                  randconfig-012-20240418   clang
i386                  randconfig-013-20240418   gcc  
i386                  randconfig-014-20240418   gcc  
i386                  randconfig-015-20240418   gcc  
i386                  randconfig-016-20240418   clang
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240418   gcc  
loongarch             randconfig-002-20240418   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      malta_kvm_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240418   gcc  
nios2                 randconfig-002-20240418   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240418   gcc  
parisc                randconfig-002-20240418   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     ep8248e_defconfig   gcc  
powerpc               randconfig-001-20240418   gcc  
powerpc               randconfig-003-20240418   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc64             randconfig-001-20240418   gcc  
powerpc64             randconfig-002-20240418   gcc  
powerpc64             randconfig-003-20240418   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240418   gcc  
riscv                 randconfig-002-20240418   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                    randconfig-001-20240418   gcc  
sh                    randconfig-002-20240418   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240418   gcc  
sparc64               randconfig-002-20240418   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240418   gcc  
um                    randconfig-002-20240418   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-005-20240418   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240418   gcc  
x86_64                randconfig-003-20240418   gcc  
x86_64                randconfig-005-20240418   gcc  
x86_64                randconfig-006-20240418   gcc  
x86_64                randconfig-012-20240418   gcc  
x86_64                randconfig-014-20240418   gcc  
x86_64                randconfig-015-20240418   gcc  
x86_64                randconfig-016-20240418   gcc  
x86_64                randconfig-071-20240418   gcc  
x86_64                randconfig-074-20240418   gcc  
x86_64                randconfig-075-20240418   gcc  
x86_64                randconfig-076-20240418   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240418   gcc  
xtensa                randconfig-002-20240418   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

