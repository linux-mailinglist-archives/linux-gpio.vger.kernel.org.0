Return-Path: <linux-gpio+bounces-5458-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 278178A3E44
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Apr 2024 21:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCB071C209FE
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Apr 2024 19:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6E95466B;
	Sat, 13 Apr 2024 19:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzU8hX7X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661F853E3B
	for <linux-gpio@vger.kernel.org>; Sat, 13 Apr 2024 19:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713038043; cv=none; b=E0VWd+1nf+BR/pVH9rNCPuaEsYmlUNA17gjhsOfsLZ0whz0hkjnUofIwxIXEZE6RwubENMs3XcSTWNCK7mzWFWeD/GpY65hz0uHWXxGFA091PtMTSDVx8qVxfkjAb/ncI6N+tYpBHBxIgNOGjPD4qLdKwdhk0V69kzFaIHykviU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713038043; c=relaxed/simple;
	bh=3H0WATwQYFTMltdmaed97JP4njsxJHI/yvQeJU/IZrI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cc4PSeLlP1jJaqeV3QlRmeoSOp99IXdbnobHwnJIHFhAUp03+NGzjzF34gck5CXkvTneHtT0lwhNBCNHvj1k2wNONUHHX38ZsIeJs1htapWdDJYa5jEm8TRHkhQrqzIjYPQgk9vxHgja3ntRG1lbi02cg9vH1rz8Kk77/pqAX9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzU8hX7X; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713038042; x=1744574042;
  h=date:from:to:cc:subject:message-id;
  bh=3H0WATwQYFTMltdmaed97JP4njsxJHI/yvQeJU/IZrI=;
  b=UzU8hX7XvvQRmN5Wpo96n2jkae9N2jsA/YMzyezYMQTuR7IiHO1IF06r
   x0C7r9LXXcFdvNOll6/S/DhBjra/CPgIAGyCMV3YbQ52g8dwFuK1knbkd
   2ORlvkI26USB1NYBUC9jlw+8Vs9tP/4D7k4jAybf2ApBIe9c1hVsuzpOx
   Yz3eMSYHgho5GG/6CJ/yhFDLvIGGdLsBL5IKg5Jx0CDVpKz9Qq9rKB44w
   +Ofx7de/181o4qF8AsrpfE6vs4DLJF0L9R8c1yCekY9mWhOMjz6AI9hvT
   +MZVuebQ0Ch/EqW6WoVjnejUXh8V5ao9GQt53gb2axqFo7EJdtXTkBOOU
   g==;
X-CSE-ConnectionGUID: 4tzzDnB4Shmb2KPsKylYeQ==
X-CSE-MsgGUID: k/XZ4eQbRBuEy2JQaQz4cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="8596231"
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="8596231"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 12:53:59 -0700
X-CSE-ConnectionGUID: 9lFNeoDZRxyO98C1fBsL1Q==
X-CSE-MsgGUID: UoVkl+gNQUSPmylX/L6qBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="21517254"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 13 Apr 2024 12:53:58 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvjRj-000316-0x;
	Sat, 13 Apr 2024 19:53:55 +0000
Date: Sun, 14 Apr 2024 03:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 8d1e84ab0176c2d2b49fd741d6609a021ecc1d01
Message-ID: <202404140314.7M3v9KSi-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 8d1e84ab0176c2d2b49fd741d6609a021ecc1d01  gpio: regmap: Use -ENOTSUPP consistently

elapsed time: 1448m

configs tested: 155
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
arc                   randconfig-001-20240413   gcc  
arc                   randconfig-002-20240413   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240413   clang
arm                   randconfig-002-20240413   gcc  
arm                   randconfig-003-20240413   clang
arm                   randconfig-004-20240413   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240413   clang
arm64                 randconfig-002-20240413   clang
arm64                 randconfig-003-20240413   clang
arm64                 randconfig-004-20240413   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240413   gcc  
csky                  randconfig-002-20240413   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240413   clang
hexagon               randconfig-002-20240413   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240413   gcc  
i386         buildonly-randconfig-002-20240413   gcc  
i386         buildonly-randconfig-003-20240413   clang
i386         buildonly-randconfig-004-20240413   clang
i386         buildonly-randconfig-005-20240413   clang
i386         buildonly-randconfig-006-20240413   clang
i386                                defconfig   clang
i386                  randconfig-001-20240413   clang
i386                  randconfig-002-20240413   gcc  
i386                  randconfig-003-20240413   clang
i386                  randconfig-004-20240413   gcc  
i386                  randconfig-005-20240413   clang
i386                  randconfig-006-20240413   clang
i386                  randconfig-011-20240413   gcc  
i386                  randconfig-012-20240413   clang
i386                  randconfig-013-20240413   gcc  
i386                  randconfig-014-20240413   gcc  
i386                  randconfig-015-20240413   clang
i386                  randconfig-016-20240413   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240413   gcc  
loongarch             randconfig-002-20240413   gcc  
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
nios2                 randconfig-001-20240413   gcc  
nios2                 randconfig-002-20240413   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240413   gcc  
parisc                randconfig-002-20240413   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc               randconfig-001-20240413   clang
powerpc               randconfig-002-20240413   clang
powerpc               randconfig-003-20240413   clang
powerpc64             randconfig-001-20240413   clang
powerpc64             randconfig-002-20240413   gcc  
powerpc64             randconfig-003-20240413   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
riscv                 randconfig-001-20240413   clang
riscv                 randconfig-002-20240413   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240413   gcc  
s390                  randconfig-002-20240413   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240413   gcc  
sh                    randconfig-002-20240413   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240413   gcc  
sparc64               randconfig-002-20240413   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240413   clang
um                    randconfig-002-20240413   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240413   gcc  
x86_64       buildonly-randconfig-002-20240413   gcc  
x86_64       buildonly-randconfig-003-20240413   gcc  
x86_64       buildonly-randconfig-004-20240413   gcc  
x86_64       buildonly-randconfig-005-20240413   gcc  
x86_64       buildonly-randconfig-006-20240413   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240413   gcc  
x86_64                randconfig-002-20240413   gcc  
x86_64                randconfig-003-20240413   gcc  
x86_64                randconfig-004-20240413   gcc  
x86_64                randconfig-005-20240413   gcc  
x86_64                randconfig-006-20240413   gcc  
x86_64                randconfig-011-20240413   clang
x86_64                randconfig-012-20240413   clang
x86_64                randconfig-013-20240413   clang
x86_64                randconfig-014-20240413   clang
x86_64                randconfig-015-20240413   gcc  
x86_64                randconfig-016-20240413   clang
x86_64                randconfig-071-20240413   gcc  
x86_64                randconfig-072-20240413   gcc  
x86_64                randconfig-073-20240413   clang
x86_64                randconfig-074-20240413   gcc  
x86_64                randconfig-075-20240413   gcc  
x86_64                randconfig-076-20240413   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-002-20240413   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

