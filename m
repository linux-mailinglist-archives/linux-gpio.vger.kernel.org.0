Return-Path: <linux-gpio+bounces-904-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C96801D69
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Dec 2023 15:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BD2C1F21188
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Dec 2023 14:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4190218C16;
	Sat,  2 Dec 2023 14:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSmm7xGf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF164102
	for <linux-gpio@vger.kernel.org>; Sat,  2 Dec 2023 06:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701528911; x=1733064911;
  h=date:from:to:cc:subject:message-id;
  bh=nJHdLJ8DeYlrVlTip6ckmXH3+Ph1uhE8SzXgARt2k8o=;
  b=gSmm7xGfI0H1g3tPZTpctfopeC7NGpZ7dmOE9XkhNilsHhRXNmaHKIs8
   trccOJPJYml8Z2Txt/lmFmTWeS83GUTPyUVy6xB1Ar06+ESSbE2jPYdMt
   bVQV8KdWh1W+LiFQt6UlDE4EkONDbceKxfxY86/B/4Bhvx0+Hw/xZ/H4O
   ggTyRrbgfc7U2AJlJp9n5zSrVjqfXgllipKicArSjxkotvj2cQYbnow8C
   nH0jEIvObmaIh1SDLnFy61IBjSPWnMJ2WiI+9sTSTFYsCbp49k1SiAoDn
   KfBiLFGFtJF6z0FaWjNaamsDJF+Q8kCRBR/kB8512YNOKyUR63ptd1zX0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="392471675"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="392471675"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 06:55:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770022724"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="770022724"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2023 06:55:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9ROd-0005KI-1W;
	Sat, 02 Dec 2023 14:55:07 +0000
Date: Sat, 02 Dec 2023 22:54:23 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 20470f6b5038fb550b625d31a266954ff0b71acc
Message-ID: <202312022220.6i6O0RPx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 20470f6b5038fb550b625d31a266954ff0b71acc  pinctrl: Convert unsigned to unsigned int

elapsed time: 1455m

configs tested: 203
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
arc                   randconfig-001-20231202   gcc  
arc                   randconfig-002-20231202   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                         lpc32xx_defconfig   clang
arm                        multi_v5_defconfig   clang
arm                   randconfig-001-20231202   clang
arm                   randconfig-002-20231202   clang
arm                   randconfig-003-20231202   clang
arm                   randconfig-004-20231202   clang
arm                        spear6xx_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231202   clang
arm64                 randconfig-002-20231202   clang
arm64                 randconfig-003-20231202   clang
arm64                 randconfig-004-20231202   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231202   gcc  
csky                  randconfig-002-20231202   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231202   clang
hexagon               randconfig-002-20231202   clang
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
i386                  randconfig-012-20231201   clang
i386                  randconfig-013-20231201   clang
i386                  randconfig-014-20231201   clang
i386                  randconfig-015-20231201   clang
i386                  randconfig-016-20231201   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231202   gcc  
loongarch             randconfig-002-20231202   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                         db1xxx_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231202   gcc  
nios2                 randconfig-002-20231202   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231202   gcc  
parisc                randconfig-002-20231202   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     mpc512x_defconfig   clang
powerpc               randconfig-001-20231202   clang
powerpc               randconfig-002-20231202   clang
powerpc               randconfig-003-20231202   clang
powerpc                     tqm8541_defconfig   gcc  
powerpc64             randconfig-001-20231202   clang
powerpc64             randconfig-002-20231202   clang
powerpc64             randconfig-003-20231202   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231202   clang
riscv                 randconfig-002-20231202   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231202   gcc  
s390                  randconfig-002-20231202   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                    randconfig-001-20231202   gcc  
sh                    randconfig-002-20231202   gcc  
sh                          sdk7780_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231202   gcc  
sparc64               randconfig-002-20231202   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231202   clang
um                    randconfig-002-20231202   clang
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
x86_64                randconfig-001-20231201   clang
x86_64                randconfig-001-20231202   gcc  
x86_64                randconfig-002-20231201   clang
x86_64                randconfig-002-20231202   gcc  
x86_64                randconfig-003-20231201   clang
x86_64                randconfig-003-20231202   gcc  
x86_64                randconfig-004-20231201   clang
x86_64                randconfig-004-20231202   gcc  
x86_64                randconfig-005-20231201   clang
x86_64                randconfig-005-20231202   gcc  
x86_64                randconfig-006-20231201   clang
x86_64                randconfig-006-20231202   gcc  
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
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231202   gcc  
xtensa                randconfig-002-20231202   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

