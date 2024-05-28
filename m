Return-Path: <linux-gpio+bounces-6708-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF10F8D12F3
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 05:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6222A1F2288F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 03:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4A1171A7;
	Tue, 28 May 2024 03:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQ5lqnDj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B95B17BA2
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 03:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867600; cv=none; b=trFKUmZIDrTla1al0EEV+hXa9KYUozVgC1U2TGNHPO0YUNTggQVtYnLFR2OgXGLoLOJ/7vH0I4r3kOVPcLnrOTNkypuqVIpvR9yOW9VssZhPVrUgRZ4kvRUxvW1U4zWDOktihmdldtOEJlbAttPnoxxQi3jh0YYfv4r6dn0d6V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867600; c=relaxed/simple;
	bh=iFl1H6iWPgVNI+8e169o4Whgi+ItONPnEcO1Z9gAwi8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YU8YCQX1dDdgrF3GyU4qg3RZ58KD0nGMpSn85S3+5OPIlb9kjoyCxgomr5xaeqCsmDOSv/+jLkBWNZzClDzgN+63zckpw9JfqTGw4V74CPHOUaW3WVuQIyRNAnaMTAAy3k+iUAOWEruV+ybGgby8lLGaJ8lcZIH+NgLRIuB5I+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQ5lqnDj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716867599; x=1748403599;
  h=date:from:to:cc:subject:message-id;
  bh=iFl1H6iWPgVNI+8e169o4Whgi+ItONPnEcO1Z9gAwi8=;
  b=nQ5lqnDjLtZPl6kVPF9O7ALwxzqtk3TybOlqCNgIMKPlJ+PZoD7J2S/j
   5a1Vdms/8rHP/ovtAYyWcsxfXCCtAqRq0xNrDYQJXVKfTal2koeUROoww
   FkMVXzGIAC5cjRxyf+v+c3vJwXVWBDF149BAD1UBLpwK2pN1cS6M145Ok
   ou8snv+8cIn9CO9fpmscf6VHIcqmTq9/RNrjrO9QPivF8l4QbIzQ5ZtId
   RDQrG6Zuva6EidMZ9qwC/vWFh/DTLLkEIw9YrHw5vzdHQINbgH3QK3KOJ
   PzaPHIEuJwsDMD/OabC/4x5mdP+sIdE9MwWWrmJrphMxpDLInRLRw46S8
   Q==;
X-CSE-ConnectionGUID: muKnWYvARmqVq2St+9Tm9g==
X-CSE-MsgGUID: EZVTp7S7T8m43n86LBGt3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="38573436"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="38573436"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 20:39:58 -0700
X-CSE-ConnectionGUID: IzqpoLNeRnOh/WgZo9ATDQ==
X-CSE-MsgGUID: ulzJo91bTkebYW4gHNSh2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="34819364"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 27 May 2024 20:39:57 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBngo-000BQm-1R;
	Tue, 28 May 2024 03:39:54 +0000
Date: Tue, 28 May 2024 11:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 517b3757b78064c22dca76e98d00dc694154acd3
Message-ID: <202405281145.JBtQuSSe-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 517b3757b78064c22dca76e98d00dc694154acd3  pinctrl: core: reset gpio_device in loop in pinctrl_pins_show()

elapsed time: 807m

configs tested: 156
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
arc                   randconfig-001-20240528   gcc  
arc                   randconfig-002-20240528   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240528   gcc  
arm                   randconfig-002-20240528   gcc  
arm                   randconfig-003-20240528   clang
arm                   randconfig-004-20240528   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240528   clang
arm64                 randconfig-002-20240528   clang
arm64                 randconfig-003-20240528   gcc  
arm64                 randconfig-004-20240528   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240528   gcc  
csky                  randconfig-002-20240528   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240528   clang
hexagon               randconfig-002-20240528   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240528   gcc  
i386         buildonly-randconfig-002-20240528   clang
i386         buildonly-randconfig-003-20240528   clang
i386         buildonly-randconfig-004-20240528   clang
i386         buildonly-randconfig-005-20240528   clang
i386         buildonly-randconfig-006-20240528   clang
i386                                defconfig   clang
i386                  randconfig-001-20240528   clang
i386                  randconfig-002-20240528   clang
i386                  randconfig-003-20240528   gcc  
i386                  randconfig-004-20240528   gcc  
i386                  randconfig-005-20240528   gcc  
i386                  randconfig-006-20240528   gcc  
i386                  randconfig-011-20240528   clang
i386                  randconfig-012-20240528   gcc  
i386                  randconfig-013-20240528   gcc  
i386                  randconfig-014-20240528   clang
i386                  randconfig-015-20240528   gcc  
i386                  randconfig-016-20240528   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240528   gcc  
loongarch             randconfig-002-20240528   gcc  
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
nios2                 randconfig-001-20240528   gcc  
nios2                 randconfig-002-20240528   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240528   gcc  
parisc                randconfig-002-20240528   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240528   gcc  
powerpc               randconfig-002-20240528   clang
powerpc               randconfig-003-20240528   clang
powerpc64             randconfig-001-20240528   clang
powerpc64             randconfig-002-20240528   gcc  
powerpc64             randconfig-003-20240528   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240528   clang
riscv                 randconfig-002-20240528   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240528   gcc  
s390                  randconfig-002-20240528   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240528   gcc  
sh                    randconfig-002-20240528   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240528   gcc  
sparc64               randconfig-002-20240528   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240528   gcc  
um                    randconfig-002-20240528   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240528   clang
x86_64       buildonly-randconfig-002-20240528   clang
x86_64       buildonly-randconfig-003-20240528   clang
x86_64       buildonly-randconfig-004-20240528   gcc  
x86_64       buildonly-randconfig-005-20240528   clang
x86_64       buildonly-randconfig-006-20240528   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240528   clang
x86_64                randconfig-002-20240528   clang
x86_64                randconfig-003-20240528   clang
x86_64                randconfig-004-20240528   gcc  
x86_64                randconfig-005-20240528   clang
x86_64                randconfig-013-20240528   clang
x86_64                randconfig-014-20240528   clang
x86_64                randconfig-015-20240528   clang
x86_64                randconfig-071-20240528   clang
x86_64                randconfig-075-20240528   clang
x86_64                randconfig-076-20240528   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240528   gcc  
xtensa                randconfig-002-20240528   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

