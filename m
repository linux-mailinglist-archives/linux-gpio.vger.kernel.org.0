Return-Path: <linux-gpio+bounces-15425-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB0BA2A403
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 10:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2209D167642
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 09:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0C9226168;
	Thu,  6 Feb 2025 09:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BV7LIRFT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F897225A34
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 09:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738833537; cv=none; b=gsC+5FBhIxtUMYFzUsbb1inatvo8gMbrNVcpaOgLnikuYvm84W1EaJkD6AGjdcwyWnymZkqQBxc+8CzW0pZd6f7pdo1mTLxVC+jFNCPGmymXkLDmSHB2sdUOy3Hl7InK2GcMJxtS4cRyjKgi7NMpFayF3xEpDNiU1NSizYMlato=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738833537; c=relaxed/simple;
	bh=SVfmBCocnhf55DYpQbmEc4lD4DR0Aplmc2negPoJZ0M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=imLaC7r2mVilt9f8Td8TI6ClJmh2p5vCqch4PvqtPi+SvzAYks9U5cKDAfCb79eAxPonWuNXNRxMqDv/YksvT2jB1vSIMbudohqwTIN/dfeFAwvJiJaCV1RsLwZx9UzHvCs0yt821+QVPc8tMUF6NHPSqdlcc0A7oELXfAMhVJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BV7LIRFT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738833535; x=1770369535;
  h=date:from:to:cc:subject:message-id;
  bh=SVfmBCocnhf55DYpQbmEc4lD4DR0Aplmc2negPoJZ0M=;
  b=BV7LIRFTSTdMC/g4nHR34SD0NVW9+MJM99y7QQKGt9//brXJXdreuJsS
   ByLOStCZgiQGBKIHbHwI3VUYXDGIyKSeTKhV6ijt807QYhsemBRrvxrj2
   lWVKxlFwGQhQdj8sDQZbP1GVzr4z43aLktBAO2DOKKSzAq08NL+eQhKHj
   cL1+KD73FX1XDj4vDls0bj/3F+YkiSzOzJAqnOpgHjXNRek5otwGeTa21
   /6RP6+ovl1nfYP32lFNRm3cR+VE6hk4HhSONw3Qve/VIWsVmYVxiP87LP
   GHM6apdEdtBoh7bX9IOK/fiqMHn3rhJwjNREgpPWTTwRWhHzrumoOHjxc
   w==;
X-CSE-ConnectionGUID: J8GW4/wUSfSOwKdOYYw+TQ==
X-CSE-MsgGUID: ZZuMyBYCQ3Cu47spdXBTHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56844741"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="56844741"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:18:55 -0800
X-CSE-ConnectionGUID: ebBejR/KQqa1DcTQq8nfyg==
X-CSE-MsgGUID: JSitZJfoT22NIYJnES8AOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112052715"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Feb 2025 01:18:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfy26-000wfb-1u;
	Thu, 06 Feb 2025 09:18:50 +0000
Date: Thu, 06 Feb 2025 17:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 e8f2ca6be61f1cae2ff12932fa03224581b6b231
Message-ID: <202502061731.Gvbe9bbz-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: e8f2ca6be61f1cae2ff12932fa03224581b6b231  dt-bindings: gpio: ast2400-gpio: Add hogs parsing

elapsed time: 1451m

configs tested: 216
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250205    gcc-13.2.0
arc                   randconfig-001-20250206    gcc-13.2.0
arc                   randconfig-002-20250205    gcc-13.2.0
arc                   randconfig-002-20250206    gcc-13.2.0
arc                    vdk_hs38_smp_defconfig    clang-21
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                        clps711x_defconfig    clang-19
arm                            mmp2_defconfig    clang-21
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                          pxa3xx_defconfig    clang-21
arm                            qcom_defconfig    clang-17
arm                   randconfig-001-20250205    gcc-14.2.0
arm                   randconfig-001-20250206    gcc-13.2.0
arm                   randconfig-002-20250205    gcc-14.2.0
arm                   randconfig-002-20250206    gcc-13.2.0
arm                   randconfig-003-20250205    clang-16
arm                   randconfig-003-20250206    gcc-13.2.0
arm                   randconfig-004-20250205    gcc-14.2.0
arm                   randconfig-004-20250206    gcc-13.2.0
arm                           sama7_defconfig    clang-16
arm                           stm32_defconfig    gcc-14.2.0
arm                           u8500_defconfig    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250205    gcc-14.2.0
arm64                 randconfig-001-20250206    gcc-13.2.0
arm64                 randconfig-002-20250205    gcc-14.2.0
arm64                 randconfig-002-20250206    gcc-13.2.0
arm64                 randconfig-003-20250205    gcc-14.2.0
arm64                 randconfig-003-20250206    gcc-13.2.0
arm64                 randconfig-004-20250205    gcc-14.2.0
arm64                 randconfig-004-20250206    gcc-13.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250205    gcc-14.2.0
csky                  randconfig-002-20250205    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250205    clang-17
hexagon               randconfig-002-20250205    clang-19
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250205    gcc-12
i386        buildonly-randconfig-002-20250205    gcc-12
i386        buildonly-randconfig-003-20250205    gcc-12
i386        buildonly-randconfig-004-20250205    gcc-11
i386        buildonly-randconfig-005-20250205    clang-19
i386        buildonly-randconfig-006-20250205    clang-19
i386                                defconfig    clang-19
i386                  randconfig-011-20250206    gcc-12
i386                  randconfig-012-20250206    gcc-12
i386                  randconfig-013-20250206    gcc-12
i386                  randconfig-014-20250206    gcc-12
i386                  randconfig-015-20250206    gcc-12
i386                  randconfig-016-20250206    gcc-12
i386                  randconfig-017-20250206    gcc-12
loongarch                        alldefconfig    clang-21
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250205    gcc-14.2.0
loongarch             randconfig-002-20250205    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        vocore2_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250205    gcc-14.2.0
nios2                 randconfig-002-20250205    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250205    gcc-14.2.0
parisc                randconfig-002-20250205    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     asp8347_defconfig    gcc-14.2.0
powerpc                    gamecube_defconfig    clang-16
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                      ppc44x_defconfig    clang-21
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250205    clang-16
powerpc               randconfig-002-20250205    gcc-14.2.0
powerpc               randconfig-003-20250205    gcc-14.2.0
powerpc                  storcenter_defconfig    clang-21
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250205    clang-18
powerpc64             randconfig-002-20250205    gcc-14.2.0
powerpc64             randconfig-003-20250205    clang-18
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250205    gcc-14.2.0
riscv                 randconfig-001-20250206    gcc-14.2.0
riscv                 randconfig-002-20250205    gcc-14.2.0
riscv                 randconfig-002-20250206    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250205    clang-17
s390                  randconfig-001-20250206    gcc-14.2.0
s390                  randconfig-002-20250205    clang-19
s390                  randconfig-002-20250206    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                            migor_defconfig    clang-21
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250205    gcc-14.2.0
sh                    randconfig-001-20250206    gcc-14.2.0
sh                    randconfig-002-20250205    gcc-14.2.0
sh                    randconfig-002-20250206    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    clang-21
sh                           se7722_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250205    gcc-14.2.0
sparc                 randconfig-001-20250206    gcc-14.2.0
sparc                 randconfig-002-20250205    gcc-14.2.0
sparc                 randconfig-002-20250206    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250205    gcc-14.2.0
sparc64               randconfig-001-20250206    gcc-14.2.0
sparc64               randconfig-002-20250205    gcc-14.2.0
sparc64               randconfig-002-20250206    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250205    gcc-11
um                    randconfig-001-20250206    gcc-14.2.0
um                    randconfig-002-20250205    clang-21
um                    randconfig-002-20250206    gcc-14.2.0
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250205    clang-19
x86_64      buildonly-randconfig-001-20250206    clang-19
x86_64      buildonly-randconfig-002-20250205    clang-19
x86_64      buildonly-randconfig-002-20250206    clang-19
x86_64      buildonly-randconfig-003-20250205    clang-19
x86_64      buildonly-randconfig-003-20250206    clang-19
x86_64      buildonly-randconfig-004-20250205    gcc-12
x86_64      buildonly-randconfig-004-20250206    clang-19
x86_64      buildonly-randconfig-005-20250205    clang-19
x86_64      buildonly-randconfig-005-20250206    clang-19
x86_64      buildonly-randconfig-006-20250205    clang-19
x86_64      buildonly-randconfig-006-20250206    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                randconfig-001-20250206    gcc-12
x86_64                randconfig-002-20250206    gcc-12
x86_64                randconfig-003-20250206    gcc-12
x86_64                randconfig-004-20250206    gcc-12
x86_64                randconfig-005-20250206    gcc-12
x86_64                randconfig-006-20250206    gcc-12
x86_64                randconfig-007-20250206    gcc-12
x86_64                randconfig-008-20250206    gcc-12
x86_64                randconfig-071-20250206    gcc-12
x86_64                randconfig-072-20250206    gcc-12
x86_64                randconfig-073-20250206    gcc-12
x86_64                randconfig-074-20250206    gcc-12
x86_64                randconfig-075-20250206    gcc-12
x86_64                randconfig-076-20250206    gcc-12
x86_64                randconfig-077-20250206    gcc-12
x86_64                randconfig-078-20250206    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250205    gcc-14.2.0
xtensa                randconfig-001-20250206    gcc-14.2.0
xtensa                randconfig-002-20250205    gcc-14.2.0
xtensa                randconfig-002-20250206    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

