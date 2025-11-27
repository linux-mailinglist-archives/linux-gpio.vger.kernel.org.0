Return-Path: <linux-gpio+bounces-29123-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFE2C8D7C6
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 10:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 04CCB4E8A52
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Nov 2025 09:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82579327201;
	Thu, 27 Nov 2025 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBOnd4Pe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8475F3271E7
	for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2025 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764234911; cv=none; b=q6758Hou15szPWoQYgXYxPhYtD7NjH8igGxPhHU+CthWZ8pK/iqgwJoARAdBEg3n2edOP4nexxacy9HdbgYEXtysFkpkiUrBSXayR4NeSMp7CtozpqrjG20YW8fs4AZjOWoyGRqxbyWV0ncvVZDxM4TjJcXwMdz17yEGo2Y8IBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764234911; c=relaxed/simple;
	bh=4yNt2ceN8kG4MDy7THXXoF+Y35zxxHauOsawAyTJdUI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XFEV0DVgscngXT2O9KaZP3KWpFOn7D8vC86mBexQVkiNnTXdhDXUqOULKHFn897GIVXArRz1ydOtnLDC3BGdbwpJ4TVkOxePyQg/DfG1+39uJf8k/jfo7Tosippx6M3fDHMPMRWmxFoSARdJ2tyDrv32Ar4HJxvRsIfyF6TxCYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBOnd4Pe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764234908; x=1795770908;
  h=date:from:to:cc:subject:message-id;
  bh=4yNt2ceN8kG4MDy7THXXoF+Y35zxxHauOsawAyTJdUI=;
  b=YBOnd4PewackvH3yV/xBhTfhv0TGBw4pEV8cQzSkV8iOJqtjCcR8KnaW
   gehbyI6Gy65FQpYVpuUgZmTzL62Lytt4rOp+TC7EjyT4TTK1NbjIOroZf
   6TNgxkqx+Bw+PV8BLBqjG8ecfWNHpwLHjBbQIaQ2y9IhLB3LyQwlXw8RV
   mNT0v4DKaGOgCaX2B/cL3Xu2sNXxLXusF83dasoreSE3P9/D1iHp+IhjT
   x689N2uKxj7rZNs32XLEuMY0J3TtzGy2HthyRvuqI/HzM/+m2YvKYSL6O
   YqoTIZwxeOgWFfagEUb+1VxE8PbOqzJfQX65eScJg7yPacPCpPo/mmbeU
   Q==;
X-CSE-ConnectionGUID: 3r8QKk3TR1K65eqtU+5Mvg==
X-CSE-MsgGUID: naG1arAXS1K2ecD2AoJE7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77642285"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="77642285"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 01:15:08 -0800
X-CSE-ConnectionGUID: e5Q+ClVLTaut6GaRu3kFQA==
X-CSE-MsgGUID: HejMeubhSW6CAW2MRTbrSw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Nov 2025 01:15:08 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOY5h-0000000049T-2qxV;
	Thu, 27 Nov 2025 09:15:05 +0000
Date: Thu, 27 Nov 2025 17:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 2d432ce3a98d189f949b7bc5be8258ee5c71f2f3
Message-ID: <202511271739.BAePwmDQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 2d432ce3a98d189f949b7bc5be8258ee5c71f2f3  Merge branch 'devel' into for-next

elapsed time: 2169m

configs tested: 148
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251126    gcc-13.4.0
arc                   randconfig-001-20251127    clang-22
arc                   randconfig-002-20251126    gcc-11.5.0
arc                   randconfig-002-20251127    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                         axm55xx_defconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                            mmp2_defconfig    clang-19
arm                         mv78xx0_defconfig    clang-19
arm                   randconfig-001-20251126    clang-22
arm                   randconfig-001-20251127    clang-22
arm                   randconfig-002-20251126    clang-22
arm                   randconfig-002-20251127    clang-22
arm                   randconfig-003-20251126    clang-19
arm                   randconfig-003-20251127    clang-22
arm                   randconfig-004-20251126    clang-22
arm                   randconfig-004-20251127    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251127    gcc-15.1.0
arm64                 randconfig-002-20251127    gcc-15.1.0
arm64                 randconfig-003-20251127    gcc-15.1.0
arm64                 randconfig-004-20251127    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251127    gcc-15.1.0
csky                  randconfig-002-20251127    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251126    clang-22
hexagon               randconfig-001-20251127    gcc-15.1.0
hexagon               randconfig-002-20251126    clang-22
hexagon               randconfig-002-20251127    gcc-15.1.0
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386        buildonly-randconfig-001-20251127    clang-20
i386        buildonly-randconfig-002-20251127    clang-20
i386        buildonly-randconfig-003-20251127    clang-20
i386        buildonly-randconfig-004-20251127    clang-20
i386        buildonly-randconfig-005-20251127    clang-20
i386        buildonly-randconfig-006-20251127    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251127    clang-20
i386                  randconfig-002-20251127    clang-20
i386                  randconfig-003-20251127    clang-20
i386                  randconfig-004-20251127    clang-20
i386                  randconfig-005-20251127    clang-20
i386                  randconfig-006-20251127    clang-20
i386                  randconfig-007-20251127    clang-20
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251126    gcc-15.1.0
loongarch             randconfig-001-20251127    gcc-15.1.0
loongarch             randconfig-002-20251126    clang-22
loongarch             randconfig-002-20251127    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                              allnoconfig    gcc-15.1.0
mips                          ath79_defconfig    clang-19
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251126    gcc-11.5.0
nios2                 randconfig-001-20251127    gcc-15.1.0
nios2                 randconfig-002-20251126    gcc-9.5.0
nios2                 randconfig-002-20251127    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251126    gcc-8.5.0
parisc                randconfig-001-20251127    gcc-13.4.0
parisc                randconfig-002-20251126    gcc-15.1.0
parisc                randconfig-002-20251127    gcc-13.4.0
parisc64                            defconfig    clang-19
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251126    gcc-10.5.0
powerpc               randconfig-001-20251127    gcc-13.4.0
powerpc               randconfig-002-20251126    gcc-8.5.0
powerpc               randconfig-002-20251127    gcc-13.4.0
powerpc                      tqm8xx_defconfig    clang-19
powerpc                        warp_defconfig    clang-19
powerpc64             randconfig-001-20251126    clang-19
powerpc64             randconfig-001-20251127    gcc-13.4.0
powerpc64             randconfig-002-20251126    clang-22
powerpc64             randconfig-002-20251127    gcc-13.4.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251126    gcc-10.5.0
riscv                 randconfig-001-20251127    gcc-12.5.0
riscv                 randconfig-002-20251127    gcc-12.5.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251126    gcc-8.5.0
s390                  randconfig-001-20251127    gcc-12.5.0
s390                  randconfig-002-20251126    gcc-8.5.0
s390                  randconfig-002-20251127    gcc-12.5.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251127    gcc-12.5.0
sh                    randconfig-002-20251127    gcc-12.5.0
sh                   secureedge5410_defconfig    clang-19
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251127    clang-22
sparc                 randconfig-002-20251127    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251127    clang-22
sparc64               randconfig-002-20251127    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251127    clang-22
um                    randconfig-002-20251127    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64      buildonly-randconfig-001-20251127    clang-20
x86_64      buildonly-randconfig-002-20251127    clang-20
x86_64      buildonly-randconfig-003-20251127    clang-20
x86_64      buildonly-randconfig-004-20251127    clang-20
x86_64      buildonly-randconfig-005-20251127    clang-20
x86_64      buildonly-randconfig-006-20251127    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251127    gcc-14
x86_64                randconfig-002-20251127    gcc-14
x86_64                randconfig-003-20251127    gcc-14
x86_64                randconfig-004-20251127    gcc-14
x86_64                randconfig-005-20251127    gcc-14
x86_64                randconfig-006-20251127    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251127    clang-22
xtensa                randconfig-002-20251127    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

