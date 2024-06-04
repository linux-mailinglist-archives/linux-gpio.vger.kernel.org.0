Return-Path: <linux-gpio+bounces-7144-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2248FBF06
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 00:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2373A2867EE
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 22:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC52146D78;
	Tue,  4 Jun 2024 22:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J215Vnf+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E03A18651
	for <linux-gpio@vger.kernel.org>; Tue,  4 Jun 2024 22:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717540524; cv=none; b=NZGqPWIqZxvE8seUXUZuFF7cuPBJyWibB1rp3lUAIDVGwdQsuCRMRn7bNHeqCi4Io1j1X5FBPpy4tJ2wIu0Ar2DXKw078+SFk5Nh3I0ccScDHCnGnvr1Q7PTH2zPEUrW/Xcpm1Jo6A3WQiBwhr5MdhvG7FQhcjtcJrlcICHlJoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717540524; c=relaxed/simple;
	bh=uBRcTg3hDwL3EF6MMcKuQ9k37l8m/5LOVTF4Y1Z1MWg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qn4zOXAzN/0q1sfFOGETeHB8brN8h0kYVACnvL3gGk608o/0+DQhRQFjTtWUQIMA4OuiZZFa5be+uOK5hU/uCEwas/SqDckce1NaFQcwgxGf5NqMN3J9fQ3lJczAsRrnyDhj9gf9nuh7Tg992/0QwZEWy8FHhFg/MIk2hTxJYME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J215Vnf+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717540523; x=1749076523;
  h=date:from:to:cc:subject:message-id;
  bh=uBRcTg3hDwL3EF6MMcKuQ9k37l8m/5LOVTF4Y1Z1MWg=;
  b=J215Vnf+S0LadR2ZIc7oZPSYbjiUkWk5+Y4jXtidZZbzhjFFsGs+Wyib
   Ao6b8IMay/QrhTmqg/j4IOn2MRa1u67qfp6A+fLL4qslwv928vKzefueh
   ogl364E5iDLsZ9FV8/aK5Stf54dqt7wpwhNdRo5Vyc8KPYDgQmEFO1oaY
   qpdKRtzcAveOoTj+oGh4Xtd4lb6Hdq6K7ll247i+JJw1iMfu0gAe0tfFK
   JmTpIvmGM2r82QcNuQWYSR1zYqglEBdGNOhCeSaATiil7sK3UIzZEOV6z
   EwdnHpmRjeysrfX530mBeojiH+ayvft9luuf9xQ9B1UstyFVFgqoMDzdT
   Q==;
X-CSE-ConnectionGUID: CYBViACqRUO2pDsHhRJQFw==
X-CSE-MsgGUID: DAXTKw4ZQ4CXGhioLzDrsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="25524941"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="25524941"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 15:35:23 -0700
X-CSE-ConnectionGUID: CbDFTqhKT3GxNr8KPnoE5Q==
X-CSE-MsgGUID: QlkZi4RcTs63sQ8Pi00vVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="68196080"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Jun 2024 15:35:21 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEckR-0000cv-02;
	Tue, 04 Jun 2024 22:35:19 +0000
Date: Wed, 05 Jun 2024 06:34:22 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 7cf236e959b968f854c1586ebabbf3c0047d932d
Message-ID: <202406050619.VrbFyvoO-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 7cf236e959b968f854c1586ebabbf3c0047d932d  pinctrl: rockchip: update rk3308 iomux routes

elapsed time: 1451m

configs tested: 151
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240604   gcc  
arc                   randconfig-001-20240605   gcc  
arc                   randconfig-002-20240604   gcc  
arc                   randconfig-002-20240605   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                   randconfig-002-20240604   gcc  
arm                   randconfig-004-20240604   gcc  
arm                   randconfig-004-20240605   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240605   gcc  
arm64                 randconfig-002-20240604   gcc  
arm64                 randconfig-003-20240604   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240604   gcc  
csky                  randconfig-001-20240605   gcc  
csky                  randconfig-002-20240604   gcc  
csky                  randconfig-002-20240605   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-002-20240604   clang
i386         buildonly-randconfig-003-20240604   clang
i386         buildonly-randconfig-005-20240604   clang
i386         buildonly-randconfig-006-20240604   clang
i386                                defconfig   clang
i386                  randconfig-001-20240604   clang
i386                  randconfig-002-20240604   clang
i386                  randconfig-003-20240604   clang
i386                  randconfig-004-20240604   clang
i386                  randconfig-011-20240604   clang
i386                  randconfig-014-20240604   clang
i386                  randconfig-015-20240604   clang
i386                  randconfig-016-20240604   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240604   gcc  
loongarch             randconfig-001-20240605   gcc  
loongarch             randconfig-002-20240604   gcc  
loongarch             randconfig-002-20240605   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240604   gcc  
nios2                 randconfig-001-20240605   gcc  
nios2                 randconfig-002-20240604   gcc  
nios2                 randconfig-002-20240605   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240604   gcc  
parisc                randconfig-001-20240605   gcc  
parisc                randconfig-002-20240604   gcc  
parisc                randconfig-002-20240605   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc               randconfig-001-20240604   gcc  
powerpc               randconfig-001-20240605   gcc  
powerpc               randconfig-002-20240604   gcc  
powerpc               randconfig-002-20240605   gcc  
powerpc               randconfig-003-20240604   gcc  
powerpc               randconfig-003-20240605   gcc  
powerpc64             randconfig-001-20240604   gcc  
powerpc64             randconfig-001-20240605   gcc  
powerpc64             randconfig-002-20240604   gcc  
powerpc64             randconfig-003-20240605   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
riscv                 randconfig-001-20240605   gcc  
riscv                 randconfig-002-20240604   gcc  
riscv                 randconfig-002-20240605   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240605   gcc  
s390                  randconfig-002-20240604   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240604   gcc  
sh                    randconfig-001-20240605   gcc  
sh                    randconfig-002-20240604   gcc  
sh                    randconfig-002-20240605   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240604   gcc  
sparc64               randconfig-001-20240605   gcc  
sparc64               randconfig-002-20240604   gcc  
sparc64               randconfig-002-20240605   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240605   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240605   gcc  
x86_64       buildonly-randconfig-002-20240605   gcc  
x86_64       buildonly-randconfig-003-20240605   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-003-20240605   gcc  
x86_64                randconfig-006-20240605   gcc  
x86_64                randconfig-012-20240605   gcc  
x86_64                randconfig-014-20240605   gcc  
x86_64                randconfig-016-20240605   gcc  
x86_64                randconfig-071-20240605   gcc  
x86_64                randconfig-073-20240605   gcc  
x86_64                randconfig-074-20240605   gcc  
x86_64                randconfig-075-20240605   gcc  
x86_64                randconfig-076-20240605   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240604   gcc  
xtensa                randconfig-001-20240605   gcc  
xtensa                randconfig-002-20240604   gcc  
xtensa                randconfig-002-20240605   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

