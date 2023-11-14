Return-Path: <linux-gpio+bounces-84-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB6F7EA91D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 04:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C7551F23D29
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 03:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F378C0B;
	Tue, 14 Nov 2023 03:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="anQV8wgm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120798C01
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 03:24:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A4C7D44
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 19:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699932272; x=1731468272;
  h=date:from:to:cc:subject:message-id;
  bh=A4qTfEuwM9wnZR1IJJsiSwHgeS9XEcb42BgqGG/5hcY=;
  b=anQV8wgmVGxT2IQQvxk4EYZrz4oVaGI1IssQ9fWl7rgp9wqYFt2Mnk8C
   ZYDhni4QzaGyXylIAvPagLb+3lGXDObEjryJe/Lgxypw/EYMRjh6HIqux
   EOtCFB4THs9gj91s2m9ISdbBm3hV1rJxRGAjITqTAIysSFFoxyCnPLdPB
   ay8yh3Q5GJu78kd0GEMK9Nx1OmFHVAVE5tPOIBbDdROm8bjvmey7iL/zD
   0UsERaNuS3QTTV64cqaAK9pe3y5cRg7y2GW+YQ0DOcR5WoO+lwwV9hwTz
   58UrFa2dKUH61/xQ9xQWIzC0JlzSEqkcPORAsvIsDpcREluHrX9HLZZSQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="387728282"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="387728282"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 19:24:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="12652090"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Nov 2023 19:24:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2k2O-000CoH-1l;
	Tue, 14 Nov 2023 03:24:28 +0000
Date: Tue, 14 Nov 2023 11:23:47 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 b0eeba527e704d6023a6cd9103f929226e326b03
Message-ID: <202311141145.kBOuiTyf-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: b0eeba527e704d6023a6cd9103f929226e326b03  pinctrl: stm32: Add check for devm_kcalloc

elapsed time: 731m

configs tested: 165
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
arc                                 defconfig   gcc  
arc                   randconfig-001-20231114   gcc  
arc                   randconfig-002-20231114   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231114   gcc  
arm                   randconfig-002-20231114   gcc  
arm                   randconfig-003-20231114   gcc  
arm                   randconfig-004-20231114   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231114   gcc  
arm64                 randconfig-002-20231114   gcc  
arm64                 randconfig-003-20231114   gcc  
arm64                 randconfig-004-20231114   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231114   gcc  
csky                  randconfig-002-20231114   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231114   gcc  
i386         buildonly-randconfig-002-20231114   gcc  
i386         buildonly-randconfig-003-20231114   gcc  
i386         buildonly-randconfig-004-20231114   gcc  
i386         buildonly-randconfig-005-20231114   gcc  
i386         buildonly-randconfig-006-20231114   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231114   gcc  
i386                  randconfig-002-20231114   gcc  
i386                  randconfig-003-20231114   gcc  
i386                  randconfig-004-20231114   gcc  
i386                  randconfig-005-20231114   gcc  
i386                  randconfig-006-20231114   gcc  
i386                  randconfig-011-20231114   gcc  
i386                  randconfig-012-20231114   gcc  
i386                  randconfig-013-20231114   gcc  
i386                  randconfig-014-20231114   gcc  
i386                  randconfig-015-20231114   gcc  
i386                  randconfig-016-20231114   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231114   gcc  
loongarch             randconfig-002-20231114   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231114   gcc  
nios2                 randconfig-002-20231114   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231114   gcc  
parisc                randconfig-002-20231114   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc               randconfig-001-20231114   gcc  
powerpc               randconfig-002-20231114   gcc  
powerpc               randconfig-003-20231114   gcc  
powerpc64             randconfig-001-20231114   gcc  
powerpc64             randconfig-002-20231114   gcc  
powerpc64             randconfig-003-20231114   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231114   gcc  
riscv                 randconfig-002-20231114   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231114   gcc  
s390                  randconfig-002-20231114   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231114   gcc  
sh                    randconfig-002-20231114   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231114   gcc  
sparc                 randconfig-002-20231114   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231114   gcc  
sparc64               randconfig-002-20231114   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231114   gcc  
um                    randconfig-002-20231114   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231114   gcc  
x86_64       buildonly-randconfig-002-20231114   gcc  
x86_64       buildonly-randconfig-003-20231114   gcc  
x86_64       buildonly-randconfig-004-20231114   gcc  
x86_64       buildonly-randconfig-005-20231114   gcc  
x86_64       buildonly-randconfig-006-20231114   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231114   gcc  
x86_64                randconfig-002-20231114   gcc  
x86_64                randconfig-003-20231114   gcc  
x86_64                randconfig-004-20231114   gcc  
x86_64                randconfig-005-20231114   gcc  
x86_64                randconfig-006-20231114   gcc  
x86_64                randconfig-011-20231114   gcc  
x86_64                randconfig-012-20231114   gcc  
x86_64                randconfig-013-20231114   gcc  
x86_64                randconfig-014-20231114   gcc  
x86_64                randconfig-015-20231114   gcc  
x86_64                randconfig-016-20231114   gcc  
x86_64                randconfig-071-20231114   gcc  
x86_64                randconfig-072-20231114   gcc  
x86_64                randconfig-073-20231114   gcc  
x86_64                randconfig-074-20231114   gcc  
x86_64                randconfig-075-20231114   gcc  
x86_64                randconfig-076-20231114   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                randconfig-001-20231114   gcc  
xtensa                randconfig-002-20231114   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

