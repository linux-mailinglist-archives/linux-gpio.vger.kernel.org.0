Return-Path: <linux-gpio+bounces-22815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4942EAF9E56
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jul 2025 07:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72BF87ADB1D
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jul 2025 05:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059B218FDD2;
	Sat,  5 Jul 2025 05:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzY5CjFk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D219920330
	for <linux-gpio@vger.kernel.org>; Sat,  5 Jul 2025 05:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751691984; cv=none; b=fqXv+MhIcCj5psHVBDLBjPzZOiTQXQ/jxPTyjUByXYz0BKodwnukuN1uslp+XAQYI6MzFYOHV2Z3nGcaaJ5Uhib2G00fs2RPwQacNeGSZKwYGEDoeTdFBPE0yYQygwrQAnHHN/C8aLpooHp1wowPc8bRfiipBcYpsVm0OGuOso0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751691984; c=relaxed/simple;
	bh=++SJSkd14653yJeKgNS3GvugbyrMB+ZllIR3cR+egYU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jQu8tiF8SRQKwk/GX4CoH6GLALdd+fiFxJ9zlxm01yA6hyjw42cdrraW3sizLmFOmwqIKk4kohoMHJEiUWdZedzdkFKswUy6XWIvJQhkn6C0OXSMrry3f2vCm4C4+EG7GzxHwTeeUbOFr4ICw5Pt3KmNgXDrtfbK2VRQVYMqBwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bzY5CjFk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751691982; x=1783227982;
  h=date:from:to:cc:subject:message-id;
  bh=++SJSkd14653yJeKgNS3GvugbyrMB+ZllIR3cR+egYU=;
  b=bzY5CjFkzmAUlvXlfCODjzdhFic6vWM1ZneyfwKulLbHSYPrb8cQTvZP
   JOCkIXvCbxof9jQo6BM9KneFavrxVacfffO4Es+OshgObgwDoubXUEHnP
   TegboSqGrtyg6PTTsPcZUjNse6E7q4A5zmMR/KyKrVE+QE88ernlgVAQk
   JGyRunaZMxXJmofuX9dF4IrRFx6r+y/jxBUJsoOpVVY/2Un0e+nuR9AvK
   mOxn+9KeDtb4w3DzkX19VTuDgWL9PayH8+5VbppEn2tgi0vKTfpzz7OBl
   mLPMMlnPxbkfnqLP6Lxs/kjJ5zpyuafcHK2RuQ9N9Jb+LX0qD9foTAh7X
   g==;
X-CSE-ConnectionGUID: B9fScGjMT9C3FyYmK6xnvQ==
X-CSE-MsgGUID: H+LK93rYRieE8DepXKEJtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="71437937"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="71437937"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 22:06:22 -0700
X-CSE-ConnectionGUID: nR0IGJWBQ5OmKHDR6i2b4A==
X-CSE-MsgGUID: 2bxlOxeOS129W1gf1jx/uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="154896590"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Jul 2025 22:06:21 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXv6Q-0004IV-1f;
	Sat, 05 Jul 2025 05:06:18 +0000
Date: Sat, 05 Jul 2025 13:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 5285b5ed04ab6ad40f7b654eefbccd6ae8cbf415
Message-ID: <202507051352.iP6u8ZEk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 5285b5ed04ab6ad40f7b654eefbccd6ae8cbf415  pinctrl: aw9523: fix can_sleep flag for GPIO chip

elapsed time: 946m

configs tested: 263
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-21
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250704    gcc-8.5.0
arc                   randconfig-001-20250705    clang-21
arc                   randconfig-002-20250704    gcc-15.1.0
arc                   randconfig-002-20250705    clang-21
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          gemini_defconfig    clang-20
arm                         orion5x_defconfig    clang-21
arm                          pxa168_defconfig    clang-19
arm                   randconfig-001-20250704    gcc-8.5.0
arm                   randconfig-001-20250705    clang-21
arm                   randconfig-002-20250704    clang-21
arm                   randconfig-002-20250705    clang-21
arm                   randconfig-003-20250704    gcc-8.5.0
arm                   randconfig-003-20250705    clang-21
arm                   randconfig-004-20250704    gcc-13.4.0
arm                   randconfig-004-20250705    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-21
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250704    gcc-14.3.0
arm64                 randconfig-001-20250705    clang-21
arm64                 randconfig-002-20250704    clang-21
arm64                 randconfig-002-20250705    clang-21
arm64                 randconfig-003-20250704    clang-16
arm64                 randconfig-003-20250705    clang-21
arm64                 randconfig-004-20250704    gcc-10.5.0
arm64                 randconfig-004-20250705    clang-21
csky                              allnoconfig    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250704    gcc-15.1.0
csky                  randconfig-001-20250705    gcc-9.3.0
csky                  randconfig-002-20250704    gcc-15.1.0
csky                  randconfig-002-20250705    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250704    clang-21
hexagon               randconfig-001-20250705    gcc-9.3.0
hexagon               randconfig-002-20250704    clang-21
hexagon               randconfig-002-20250705    gcc-9.3.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250704    gcc-12
i386        buildonly-randconfig-001-20250705    gcc-12
i386        buildonly-randconfig-002-20250704    clang-20
i386        buildonly-randconfig-002-20250705    gcc-12
i386        buildonly-randconfig-003-20250704    clang-20
i386        buildonly-randconfig-003-20250705    gcc-12
i386        buildonly-randconfig-004-20250704    clang-20
i386        buildonly-randconfig-004-20250705    gcc-12
i386        buildonly-randconfig-005-20250704    clang-20
i386        buildonly-randconfig-005-20250705    gcc-12
i386        buildonly-randconfig-006-20250704    clang-20
i386        buildonly-randconfig-006-20250705    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250705    gcc-12
i386                  randconfig-002-20250705    gcc-12
i386                  randconfig-003-20250705    gcc-12
i386                  randconfig-004-20250705    gcc-12
i386                  randconfig-005-20250705    gcc-12
i386                  randconfig-006-20250705    gcc-12
i386                  randconfig-007-20250705    gcc-12
i386                  randconfig-011-20250705    clang-20
i386                  randconfig-012-20250705    clang-20
i386                  randconfig-013-20250705    clang-20
i386                  randconfig-014-20250705    clang-20
i386                  randconfig-015-20250705    clang-20
i386                  randconfig-016-20250705    clang-20
i386                  randconfig-017-20250705    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250704    gcc-15.1.0
loongarch             randconfig-001-20250705    gcc-9.3.0
loongarch             randconfig-002-20250704    gcc-15.1.0
loongarch             randconfig-002-20250705    gcc-9.3.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    clang-21
m68k                                defconfig    clang-19
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                     cu1000-neo_defconfig    clang-21
mips                      pic32mzda_defconfig    clang-21
mips                         rt305x_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-14.2.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250704    gcc-8.5.0
nios2                 randconfig-001-20250705    gcc-9.3.0
nios2                 randconfig-002-20250704    gcc-10.5.0
nios2                 randconfig-002-20250705    gcc-9.3.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250704    gcc-14.3.0
parisc                randconfig-001-20250705    gcc-9.3.0
parisc                randconfig-002-20250704    gcc-8.5.0
parisc                randconfig-002-20250705    gcc-9.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                       ebony_defconfig    clang-21
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc                       ppc64_defconfig    clang-21
powerpc               randconfig-001-20250704    clang-21
powerpc               randconfig-001-20250705    gcc-9.3.0
powerpc               randconfig-002-20250704    gcc-9.3.0
powerpc               randconfig-002-20250705    gcc-9.3.0
powerpc               randconfig-003-20250704    clang-21
powerpc               randconfig-003-20250705    gcc-9.3.0
powerpc64             randconfig-001-20250704    clang-18
powerpc64             randconfig-001-20250705    gcc-9.3.0
powerpc64             randconfig-002-20250704    gcc-10.5.0
powerpc64             randconfig-002-20250705    gcc-9.3.0
powerpc64             randconfig-003-20250704    clang-18
powerpc64             randconfig-003-20250705    gcc-9.3.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250704    clang-21
riscv                 randconfig-001-20250705    gcc-12
riscv                 randconfig-002-20250704    clang-21
riscv                 randconfig-002-20250705    gcc-12
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250704    gcc-15.1.0
s390                  randconfig-001-20250705    gcc-12
s390                  randconfig-002-20250704    gcc-8.5.0
s390                  randconfig-002-20250705    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-15.1.0
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250704    gcc-15.1.0
sh                    randconfig-001-20250705    gcc-12
sh                    randconfig-002-20250704    gcc-13.4.0
sh                    randconfig-002-20250705    gcc-12
sh                  sh7785lcr_32bit_defconfig    clang-21
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250704    gcc-11.5.0
sparc                 randconfig-001-20250705    gcc-12
sparc                 randconfig-002-20250704    gcc-8.5.0
sparc                 randconfig-002-20250705    gcc-12
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250704    gcc-13.4.0
sparc64               randconfig-001-20250705    gcc-12
sparc64               randconfig-002-20250704    clang-20
sparc64               randconfig-002-20250705    gcc-12
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250704    clang-21
um                    randconfig-001-20250705    gcc-12
um                    randconfig-002-20250704    clang-21
um                    randconfig-002-20250705    gcc-12
um                           x86_64_defconfig    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250704    clang-20
x86_64      buildonly-randconfig-001-20250705    gcc-12
x86_64      buildonly-randconfig-002-20250704    gcc-12
x86_64      buildonly-randconfig-002-20250705    gcc-12
x86_64      buildonly-randconfig-003-20250704    clang-20
x86_64      buildonly-randconfig-003-20250705    gcc-12
x86_64      buildonly-randconfig-004-20250704    clang-20
x86_64      buildonly-randconfig-004-20250705    gcc-12
x86_64      buildonly-randconfig-005-20250704    clang-20
x86_64      buildonly-randconfig-005-20250705    gcc-12
x86_64      buildonly-randconfig-006-20250704    gcc-12
x86_64      buildonly-randconfig-006-20250705    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250705    clang-20
x86_64                randconfig-002-20250705    clang-20
x86_64                randconfig-003-20250705    clang-20
x86_64                randconfig-004-20250705    clang-20
x86_64                randconfig-005-20250705    clang-20
x86_64                randconfig-006-20250705    clang-20
x86_64                randconfig-007-20250705    clang-20
x86_64                randconfig-008-20250705    clang-20
x86_64                randconfig-071-20250705    clang-20
x86_64                randconfig-072-20250705    clang-20
x86_64                randconfig-073-20250705    clang-20
x86_64                randconfig-074-20250705    clang-20
x86_64                randconfig-075-20250705    clang-20
x86_64                randconfig-076-20250705    clang-20
x86_64                randconfig-077-20250705    clang-20
x86_64                randconfig-078-20250705    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250704    gcc-12.4.0
xtensa                randconfig-001-20250705    gcc-12
xtensa                randconfig-002-20250704    gcc-15.1.0
xtensa                randconfig-002-20250705    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

