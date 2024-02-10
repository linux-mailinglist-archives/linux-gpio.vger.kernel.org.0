Return-Path: <linux-gpio+bounces-3169-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C298504CA
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Feb 2024 15:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 093B6283156
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Feb 2024 14:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A800C5B5D8;
	Sat, 10 Feb 2024 14:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Urp7E/vF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D6736AF0
	for <linux-gpio@vger.kernel.org>; Sat, 10 Feb 2024 14:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707576746; cv=none; b=n6g4V6bLdVDcXCo6sH+05p+8U//N57bPa4P2yHFn6cG8gmE0JgcjKezXBx9riDk/ZJnymbYvqm6X+Db0lvEzOqhwCg5upILk/pfn8qGGCiWtx8Hs5R9CP/go5u8Xqmed2ohqsrKIb6Kea7a0JuTqwao4CUOLwIeppYJ0gF9qRDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707576746; c=relaxed/simple;
	bh=t7rv3NhaSaPhIOlwJDY2YnBUrqo5HU44oly+3EUNLHI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lCH+xPrUOA3sEcPNKpqbPQR/j8wLLuRXtBGz5UzJO6IdOVPIonLXDeCIB3Epb/+Utdb8NICf/tZtB+tsG7dIRbUGUuDhdP/Juk3DZDie4LMG8Yfmd09lblwtEsly/jaUZB3lwI2J5kbWoBExAG7/elPcLnpfJIO5Vk+V7h5ebR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Urp7E/vF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707576744; x=1739112744;
  h=date:from:to:cc:subject:message-id;
  bh=t7rv3NhaSaPhIOlwJDY2YnBUrqo5HU44oly+3EUNLHI=;
  b=Urp7E/vFfM5+X81CwQ1hPCcX2MjAQB3d9O9rbdnM1CjDHbBYgVnwKOwB
   PjJxcRsczTJSf2GOrbPR5QD4gMNEHJkBgiJOj/0PEOBlKlkp/Ue5qoYu7
   LoZsJ9K0Cj6WOGgbbA1wqCL/3S8di8zjC9E7ccsEMrIHZlDE9pEL2pyJt
   zN/kDDprorSTAYPBuapMisepPZRwq4x5NYm1q85Ipe9lckfH2ejLC6yml
   PBvMF6+0F/i9St+liNg2pWJ2fbZmZ9oaPZsPryrbxcItBXSGQCY0PUes4
   XgeODfF1YUKRKo/fzauKPa6siIn8ApOkTLxyBvX1BjcXmGy+TnLUPaoO7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="12297319"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="12297319"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 06:52:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="32970545"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Feb 2024 06:52:23 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYoiJ-0005kD-2o;
	Sat, 10 Feb 2024 14:52:19 +0000
Date: Sat, 10 Feb 2024 22:51:57 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 da98bf28ca30bc411cfff1d5f56c492a1904f94c
Message-ID: <202402102255.12ATc1pD-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: da98bf28ca30bc411cfff1d5f56c492a1904f94c  Merge branch 'devel' into for-next

elapsed time: 1444m

configs tested: 203
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
x86_64       buildonly-randconfig-001-20240210   gcc  
x86_64       buildonly-randconfig-002-20240210   gcc  
x86_64       buildonly-randconfig-003-20240210   gcc  
x86_64       buildonly-randconfig-004-20240210   clang
x86_64       buildonly-randconfig-005-20240210   clang
x86_64       buildonly-randconfig-006-20240210   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240210   clang
x86_64                randconfig-002-20240210   clang
x86_64                randconfig-003-20240210   gcc  
x86_64                randconfig-004-20240210   clang
x86_64                randconfig-005-20240210   clang
x86_64                randconfig-006-20240210   gcc  
x86_64                randconfig-011-20240210   gcc  
x86_64                randconfig-012-20240210   clang
x86_64                randconfig-013-20240210   clang
x86_64                randconfig-014-20240210   clang
x86_64                randconfig-015-20240210   gcc  
x86_64                randconfig-016-20240210   clang
x86_64                randconfig-071-20240210   gcc  
x86_64                randconfig-072-20240210   gcc  
x86_64                randconfig-073-20240210   clang
x86_64                randconfig-074-20240210   gcc  
x86_64                randconfig-075-20240210   clang
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

