Return-Path: <linux-gpio+bounces-4878-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8061F8920C7
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 16:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9FECB28F65
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 15:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A7C8592B;
	Fri, 29 Mar 2024 15:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j50Ib4rT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F631C0DEE
	for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 15:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711724458; cv=none; b=frBCWVUdRegdXE2LxumpHhsByI3yZeiQgIsFqWR99Ksyhdv3SBZVCrUVdkHmvl6/wA7V5T5m8+41plGiowc7oEXGpYMnvuwdXA6RJOqLirslmth9xjVaJP47L+G/ld9g2gwVkdMXux7cdXOuL/7TZBgVuGuYJ6gAy2ToYQb9RY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711724458; c=relaxed/simple;
	bh=uAMrKJKUdMVY1K9Cxh0FmzLngit/Sc7fBP0jrNUtibU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bJMj1un4D2wb/A/b2kJt/NmfySPKSyvh26t0mp6fXSKHkvebnU5yWJqnWmWMFwJqEtOrADkGKFD4RlX+PUrVSK467FnIrbqyfMjuO7W6ZxDN9lN8gYhFwSN0BtBILanAqsAIxA6+N6juP9QiOMkJHOp3MdeOAVh8cFVjqG2IYlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j50Ib4rT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711724457; x=1743260457;
  h=date:from:to:cc:subject:message-id;
  bh=uAMrKJKUdMVY1K9Cxh0FmzLngit/Sc7fBP0jrNUtibU=;
  b=j50Ib4rTpPHmgsa0Co9svlC2Lfyg2r3bi34BUTV4gOGrLpwnTph8AZjn
   bYbsN5bTOtYmmDzeor6bf++/M1H1gnazU2hCs46aeKl9a/hCPeZLws0lI
   FVfGGNYUjBwcfJNPpm2XiHh9+es9K79I5H01t3U6wjLGpx57BiaEUxY65
   s9RMVHqHfV/BHCyz40DQBycuJbYaypIKJR1ioLw4AsJndxt2LtnPn/OYG
   SHM8lq8SXGHlb/NvCJzFOaK13hNL1zHn3qTvwqRZxUIC/HkKMWZYacLGq
   L0m6y+bzYIhCypzx9GCf3Wd0sA9CoFOdM/drcffPtGDq94uyuiuYr6GPl
   g==;
X-CSE-ConnectionGUID: 5gPJLQBNTkq/pOvxCqBiYg==
X-CSE-MsgGUID: 5gX1CImgT8yNtVgVkTWJaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="6852202"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="6852202"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 08:00:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="17071573"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Mar 2024 08:00:53 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqDit-0003Ie-19;
	Fri, 29 Mar 2024 15:00:51 +0000
Date: Fri, 29 Mar 2024 23:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 9ca691f95646e27ad947a5fd0bc380aa19012c39
Message-ID: <202403292316.LeLuRcrL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 9ca691f95646e27ad947a5fd0bc380aa19012c39  Merge branch 'devel' into for-next

elapsed time: 893m

configs tested: 156
configs skipped: 5

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
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240329   gcc  
arc                   randconfig-002-20240329   gcc  
arc                           tb10x_defconfig   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240329   gcc  
arm                   randconfig-004-20240329   gcc  
arm                       spear13xx_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240329   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240329   gcc  
csky                  randconfig-002-20240329   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             alldefconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-002-20240329   clang
i386         buildonly-randconfig-003-20240329   clang
i386         buildonly-randconfig-004-20240329   clang
i386         buildonly-randconfig-005-20240329   clang
i386         buildonly-randconfig-006-20240329   clang
i386                                defconfig   clang
i386                  randconfig-001-20240329   clang
i386                  randconfig-002-20240329   clang
i386                  randconfig-003-20240329   clang
i386                  randconfig-004-20240329   clang
i386                  randconfig-005-20240329   clang
i386                  randconfig-006-20240329   clang
i386                  randconfig-011-20240329   clang
i386                  randconfig-012-20240329   clang
i386                  randconfig-016-20240329   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240329   gcc  
loongarch             randconfig-002-20240329   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                       lemote2f_defconfig   gcc  
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240329   gcc  
nios2                 randconfig-002-20240329   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240329   gcc  
parisc                randconfig-002-20240329   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        fsp2_defconfig   gcc  
powerpc                        icon_defconfig   gcc  
powerpc               randconfig-002-20240329   gcc  
powerpc                    socrates_defconfig   gcc  
powerpc64             randconfig-001-20240329   gcc  
powerpc64             randconfig-003-20240329   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240329   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240329   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240329   gcc  
sh                    randconfig-002-20240329   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240329   gcc  
sparc64               randconfig-002-20240329   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-002-20240329   gcc  
um                           x86_64_defconfig   clang
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240329   clang
x86_64       buildonly-randconfig-004-20240329   clang
x86_64       buildonly-randconfig-006-20240329   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-003-20240329   clang
x86_64                randconfig-005-20240329   clang
x86_64                randconfig-011-20240329   clang
x86_64                randconfig-013-20240329   clang
x86_64                randconfig-014-20240329   clang
x86_64                randconfig-016-20240329   clang
x86_64                randconfig-073-20240329   clang
x86_64                randconfig-075-20240329   clang
x86_64                randconfig-076-20240329   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240329   gcc  
xtensa                randconfig-002-20240329   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

