Return-Path: <linux-gpio+bounces-2047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C77582526A
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jan 2024 11:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 254931C2310E
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jan 2024 10:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0BF250ED;
	Fri,  5 Jan 2024 10:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EoP6k+4m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0592C85B
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jan 2024 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704451887; x=1735987887;
  h=date:from:to:cc:subject:message-id;
  bh=XvNq2zNvn7V0XrjsBnjF+glWmx3JGsaVLkpGk1xeWrg=;
  b=EoP6k+4mTqTBr365SktyfyoURQo44onIIiX2oTEqdjQH6MiISWn9KvUZ
   JP1AUeQOR+GxxdCw3YXnJc3i39A4yTf3pv3EIEryR7E8G9x1QxPqbgAwx
   vZ7pa/d3tWGQECu4vr4rNfrH/rMR3uwJ8PyiTdPpFSrvublmhpJpMdu5B
   AeoFOXuzHZ6gYLOIb0HpTsKpj7qLurrtAPgfqacfTE+w8n9QfH/tOUrJB
   npJrd2zgfCKbXfxCqe1f3tLW5j44U85nnd31lmXaoBYhqc2Y0kJ4jteaE
   ru3ih4fVt7rMwJ3cx1XCinvwN1Z+x2Yrhgxb4eGXcxoPmQK7VzVcqwe7c
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="394656893"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="394656893"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 02:51:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="756911559"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="756911559"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Jan 2024 02:51:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLhnM-00018e-2Q;
	Fri, 05 Jan 2024 10:51:21 +0000
Date: Fri, 05 Jan 2024 18:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 db660b9a9f862804fa0c856f15cd35cd8fcbfc7b
Message-ID: <202401051837.AVlllMTV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: db660b9a9f862804fa0c856f15cd35cd8fcbfc7b  gpiolib: pin GPIO devices in place during descriptor lookup

elapsed time: 1445m

configs tested: 213
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
arc                         haps_hs_defconfig   gcc  
arc                   randconfig-001-20240104   gcc  
arc                   randconfig-001-20240105   gcc  
arc                   randconfig-002-20240104   gcc  
arc                   randconfig-002-20240105   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                                 defconfig   clang
arm                      integrator_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                   randconfig-001-20240104   gcc  
arm                   randconfig-002-20240104   gcc  
arm                   randconfig-003-20240104   gcc  
arm                   randconfig-004-20240104   gcc  
arm                           stm32_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240104   gcc  
arm64                 randconfig-002-20240104   gcc  
arm64                 randconfig-003-20240104   gcc  
arm64                 randconfig-004-20240104   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240104   gcc  
csky                  randconfig-001-20240105   gcc  
csky                  randconfig-002-20240104   gcc  
csky                  randconfig-002-20240105   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240104   clang
hexagon               randconfig-002-20240104   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240104   gcc  
i386         buildonly-randconfig-002-20240104   gcc  
i386         buildonly-randconfig-003-20240104   gcc  
i386         buildonly-randconfig-004-20240104   gcc  
i386         buildonly-randconfig-005-20240104   gcc  
i386         buildonly-randconfig-006-20240104   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240104   gcc  
i386                  randconfig-002-20240104   gcc  
i386                  randconfig-003-20240104   gcc  
i386                  randconfig-004-20240104   gcc  
i386                  randconfig-005-20240104   gcc  
i386                  randconfig-006-20240104   gcc  
i386                  randconfig-011-20240104   clang
i386                  randconfig-011-20240105   gcc  
i386                  randconfig-012-20240104   clang
i386                  randconfig-012-20240105   gcc  
i386                  randconfig-013-20240104   clang
i386                  randconfig-013-20240105   gcc  
i386                  randconfig-014-20240104   clang
i386                  randconfig-014-20240105   gcc  
i386                  randconfig-015-20240104   clang
i386                  randconfig-015-20240105   gcc  
i386                  randconfig-016-20240104   clang
i386                  randconfig-016-20240105   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240104   gcc  
loongarch             randconfig-001-20240105   gcc  
loongarch             randconfig-002-20240104   gcc  
loongarch             randconfig-002-20240105   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                           gcw0_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240104   gcc  
nios2                 randconfig-001-20240105   gcc  
nios2                 randconfig-002-20240104   gcc  
nios2                 randconfig-002-20240105   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240104   gcc  
parisc                randconfig-001-20240105   gcc  
parisc                randconfig-002-20240104   gcc  
parisc                randconfig-002-20240105   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      arches_defconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
powerpc               randconfig-001-20240104   gcc  
powerpc               randconfig-002-20240104   gcc  
powerpc               randconfig-003-20240104   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc64             randconfig-001-20240104   gcc  
powerpc64             randconfig-002-20240104   gcc  
powerpc64             randconfig-003-20240104   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240104   gcc  
riscv                 randconfig-002-20240104   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240104   clang
s390                  randconfig-001-20240105   gcc  
s390                  randconfig-002-20240104   clang
s390                  randconfig-002-20240105   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20240104   gcc  
sh                    randconfig-001-20240105   gcc  
sh                    randconfig-002-20240104   gcc  
sh                    randconfig-002-20240105   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240104   gcc  
sparc64               randconfig-001-20240105   gcc  
sparc64               randconfig-002-20240104   gcc  
sparc64               randconfig-002-20240105   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240104   gcc  
um                    randconfig-002-20240104   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240105   clang
x86_64       buildonly-randconfig-002-20240105   clang
x86_64       buildonly-randconfig-003-20240105   clang
x86_64       buildonly-randconfig-004-20240105   clang
x86_64       buildonly-randconfig-005-20240105   clang
x86_64       buildonly-randconfig-006-20240105   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20240105   clang
x86_64                randconfig-012-20240105   clang
x86_64                randconfig-013-20240105   clang
x86_64                randconfig-014-20240105   clang
x86_64                randconfig-015-20240105   clang
x86_64                randconfig-016-20240105   clang
x86_64                randconfig-071-20240105   clang
x86_64                randconfig-072-20240105   clang
x86_64                randconfig-073-20240105   clang
x86_64                randconfig-074-20240105   clang
x86_64                randconfig-075-20240105   clang
x86_64                randconfig-076-20240105   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240104   gcc  
xtensa                randconfig-001-20240105   gcc  
xtensa                randconfig-002-20240104   gcc  
xtensa                randconfig-002-20240105   gcc  
xtensa                    smp_lx200_defconfig   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

