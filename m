Return-Path: <linux-gpio+bounces-4129-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACED871825
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 09:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EC261F2232F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 08:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F7A7EEF8;
	Tue,  5 Mar 2024 08:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHPJ8DEn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6D87E567
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709626962; cv=none; b=Yopy38N/KkKua7hVbOiXE2thSOngnU83xIhlerzM3rDFh5dDttaQdqWNaHka+3WVVO9Co01VVdphWlVhHSDl1LGnXYJ0udkdjEpM5bU3FQ/dBpZnx1tq4rL22io/I23U/06g0tvu4wNpLYFKi4AzrzG1iYePC/BeDbHvmsQdFwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709626962; c=relaxed/simple;
	bh=YkMXhPw9bslWlJGsLrGdNmdU0ru2Z+VReUKcBULNJvc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D2W10FCWJjaHeXBByUMMid3BOj9/4Qtezm2skbNwXxteVgxpLPMUShw+N/FN3nFmbbnnlF5wu0zXOIoMc6fG+WKyUI0ffdmRqUy1AsbLRzM+LzAyFCS75iWJpLQyaXBCMXnFq1+uIBGUJH0OhUixn57wke7+ZP1qNgJKVaZDmTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHPJ8DEn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709626961; x=1741162961;
  h=date:from:to:cc:subject:message-id;
  bh=YkMXhPw9bslWlJGsLrGdNmdU0ru2Z+VReUKcBULNJvc=;
  b=OHPJ8DEnnTGjgScyQXBPEzFRFmOI2/m42Gi4YTGqfSe3zmq8nwvn/c7y
   T44+zGBG8jvUfjlF3Ab/UXrsCDyBIHxmvuxx20lpwUCEVT/kHyaBoXbhV
   CX/S8daBPzrtpL1+ivpi6S4gO0ptbtFGRcivotkm/BZtwMTTFsfFBoqgu
   dCnBIBssRMHWpYtjVmkmatKyc9241jHTjk3CQkxppCXp1+YRmV8I0CGoA
   fm8sKvypNUBlMDCNoKLzy/mjZ0u3vutivaHmOZXAx+trTXsqIeW0rGweN
   6Gg284k2FipNUiyQyfjIjB1YxweI+iURSY9dI4XZwH5qRBIWn2cWnyIHH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15593023"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="15593023"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 00:22:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9873871"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Mar 2024 00:22:38 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhQ4K-00039Z-0t;
	Tue, 05 Mar 2024 08:22:36 +0000
Date: Tue, 05 Mar 2024 16:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 8f5e04b43129ef6e1eb49ac8f8607f4c88e575ef
Message-ID: <202403051614.QlwqFuR9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 8f5e04b43129ef6e1eb49ac8f8607f4c88e575ef  Merge branch 'devel' into for-next

elapsed time: 1412m

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
arc                   randconfig-001-20240305   gcc  
arc                   randconfig-002-20240305   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                           h3600_defconfig   gcc  
arm                   randconfig-001-20240305   clang
arm                   randconfig-002-20240305   gcc  
arm                   randconfig-003-20240305   clang
arm                   randconfig-004-20240305   gcc  
arm                        shmobile_defconfig   gcc  
arm                    vt8500_v6_v7_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240305   gcc  
arm64                 randconfig-002-20240305   clang
arm64                 randconfig-003-20240305   gcc  
arm64                 randconfig-004-20240305   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240305   gcc  
csky                  randconfig-002-20240305   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240305   clang
hexagon               randconfig-002-20240305   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240305   clang
i386         buildonly-randconfig-002-20240305   gcc  
i386         buildonly-randconfig-003-20240305   gcc  
i386         buildonly-randconfig-004-20240305   clang
i386         buildonly-randconfig-005-20240305   clang
i386         buildonly-randconfig-006-20240305   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240305   clang
i386                  randconfig-002-20240305   gcc  
i386                  randconfig-003-20240305   clang
i386                  randconfig-004-20240305   gcc  
i386                  randconfig-005-20240305   gcc  
i386                  randconfig-006-20240305   gcc  
i386                  randconfig-011-20240305   gcc  
i386                  randconfig-012-20240305   gcc  
i386                  randconfig-013-20240305   gcc  
i386                  randconfig-014-20240305   gcc  
i386                  randconfig-015-20240305   clang
i386                  randconfig-016-20240305   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240305   gcc  
loongarch             randconfig-002-20240305   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          multi_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240305   gcc  
nios2                 randconfig-002-20240305   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240305   gcc  
parisc                randconfig-002-20240305   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                   microwatt_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20240305   gcc  
powerpc               randconfig-002-20240305   gcc  
powerpc               randconfig-003-20240305   gcc  
powerpc                     tqm8560_defconfig   gcc  
powerpc64             randconfig-001-20240305   clang
powerpc64             randconfig-002-20240305   clang
powerpc64             randconfig-003-20240305   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240305   clang
riscv                 randconfig-002-20240305   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240305   gcc  
s390                  randconfig-002-20240305   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240305   gcc  
sh                    randconfig-002-20240305   gcc  
sh                           se7206_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240305   gcc  
sparc64               randconfig-002-20240305   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240305   gcc  
um                    randconfig-002-20240305   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240305   clang
x86_64       buildonly-randconfig-002-20240305   clang
x86_64       buildonly-randconfig-003-20240305   clang
x86_64       buildonly-randconfig-004-20240305   clang
x86_64       buildonly-randconfig-005-20240305   clang
x86_64       buildonly-randconfig-006-20240305   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240305   clang
x86_64                randconfig-002-20240305   clang
x86_64                randconfig-003-20240305   gcc  
x86_64                randconfig-004-20240305   clang
x86_64                randconfig-005-20240305   clang
x86_64                randconfig-006-20240305   gcc  
x86_64                randconfig-011-20240305   gcc  
x86_64                randconfig-012-20240305   gcc  
x86_64                randconfig-013-20240305   clang
x86_64                randconfig-014-20240305   gcc  
x86_64                randconfig-015-20240305   clang
x86_64                randconfig-016-20240305   clang
x86_64                randconfig-072-20240305   gcc  
x86_64                randconfig-073-20240305   clang
x86_64                randconfig-074-20240305   clang
x86_64                randconfig-076-20240305   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240305   gcc  
xtensa                randconfig-002-20240305   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

