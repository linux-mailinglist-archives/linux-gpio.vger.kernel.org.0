Return-Path: <linux-gpio+bounces-21894-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5528AE0F74
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 00:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 944AF1BC62DA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 22:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D873121FF28;
	Thu, 19 Jun 2025 22:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFl2I3/K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC96DF42
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 22:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750370993; cv=none; b=g6EOTEcngARr0blAaqPzSalRIv2leGOJcQMMKgbz/IAGyeZ/WnfebjjQYDa3Ho3WIz6eFEIjxncONVJPm2IM2D6ooScGkGcTKodMD1P76scr+uRj/Cs95ARV2cWrogdpUJ5qoPpjV6mVpu5V6UT5QRX9fq2zgQKq0tsdYV2d3zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750370993; c=relaxed/simple;
	bh=gyZbsE5fCRaHeEDp2dNcYHd18pSKM1dxOoOCdE4BAnY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fkTjgYd5+X4JYheTVPnvVCMz0N3yWnhS5MDqdZ8XZBVTZ+sMbcYPYHftxlM3LWkJGDoApPVgv9rmuMNUwmDxoM2FfyUiGBJqAL4pXqHTX7RiL1e+98j6JBEFlMxmPpbHQEls5AbLX9RqPYneOldEZXZeddyaaqZnOPTa2JW6bwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFl2I3/K; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750370992; x=1781906992;
  h=date:from:to:cc:subject:message-id;
  bh=gyZbsE5fCRaHeEDp2dNcYHd18pSKM1dxOoOCdE4BAnY=;
  b=NFl2I3/KGo2CR1KVF0RNiG0tzpB1S7taHCRGeRu4G6JkwdSWTgYmwbal
   402I6KfMuI/I25bEqnj0CNmYzQ9uXK3K2P1sHHYDY0ZdCLvZiN3R1tIEH
   ZGQRjSGGQqur+T+KHaAVSF9sj4dSt6B1nu1y1JC/qgXyn07U+vFFPgj+f
   9+csGvgLW8LsjvBKXpxw1I5OyxJLGUT3/qwiVnGFpdG1x0bxlTlrMtU1P
   IACpS2w/o/ugk6vhCdOu5Rlb7YoCx1geyjx/HLFgCCurEmMj5JoTRVvLb
   f/HTF1DP6GQsTh7mUwPFE8sjsoAj1oEZekbXZIJkj80fFbCCmRI8aVnua
   Q==;
X-CSE-ConnectionGUID: HAHXG0XASBKoBT/C+rSUmg==
X-CSE-MsgGUID: 6gJ6/KrdSpuENWtRVZQJ5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64060430"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64060430"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 15:09:51 -0700
X-CSE-ConnectionGUID: 895tuw7GQW+9vzWfkYFzEw==
X-CSE-MsgGUID: 40+Fg1XrSymRvgq99UbP8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150883282"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Jun 2025 15:09:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSNS7-000L8Q-2A;
	Thu, 19 Jun 2025 22:09:47 +0000
Date: Fri, 20 Jun 2025 06:09:38 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/mmio-bgpiof-no-input-flag] BUILD SUCCESS
 deefc7083414de81aad102b60f0390f600d7eb79
Message-ID: <202506200628.ysIYR7lV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/mmio-bgpiof-no-input-flag
branch HEAD: deefc7083414de81aad102b60f0390f600d7eb79  gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip

elapsed time: 865m

configs tested: 284
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250619    gcc-15.1.0
arc                   randconfig-001-20250620    clang-21
arc                   randconfig-002-20250619    gcc-15.1.0
arc                   randconfig-002-20250620    clang-21
arc                    vdk_hs38_smp_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                      jornada720_defconfig    clang-21
arm                   randconfig-001-20250619    clang-21
arm                   randconfig-001-20250619    gcc-15.1.0
arm                   randconfig-001-20250620    clang-21
arm                   randconfig-002-20250619    gcc-15.1.0
arm                   randconfig-002-20250619    gcc-8.5.0
arm                   randconfig-002-20250620    clang-21
arm                   randconfig-003-20250619    gcc-15.1.0
arm                   randconfig-003-20250619    gcc-8.5.0
arm                   randconfig-003-20250620    clang-21
arm                   randconfig-004-20250619    gcc-10.5.0
arm                   randconfig-004-20250619    gcc-15.1.0
arm                   randconfig-004-20250620    clang-21
arm                           stm32_defconfig    gcc-15.1.0
arm                       versatile_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250619    gcc-15.1.0
arm64                 randconfig-001-20250619    gcc-8.5.0
arm64                 randconfig-001-20250620    clang-21
arm64                 randconfig-002-20250619    gcc-15.1.0
arm64                 randconfig-002-20250619    gcc-9.5.0
arm64                 randconfig-002-20250620    clang-21
arm64                 randconfig-003-20250619    gcc-10.5.0
arm64                 randconfig-003-20250619    gcc-15.1.0
arm64                 randconfig-003-20250620    clang-21
arm64                 randconfig-004-20250619    gcc-10.5.0
arm64                 randconfig-004-20250619    gcc-15.1.0
arm64                 randconfig-004-20250620    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250619    gcc-11.5.0
csky                  randconfig-001-20250619    gcc-8.5.0
csky                  randconfig-002-20250619    gcc-8.5.0
csky                  randconfig-002-20250619    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250619    clang-21
hexagon               randconfig-001-20250619    gcc-8.5.0
hexagon               randconfig-002-20250619    clang-21
hexagon               randconfig-002-20250619    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250619    clang-20
i386        buildonly-randconfig-001-20250619    gcc-12
i386        buildonly-randconfig-001-20250620    clang-20
i386        buildonly-randconfig-002-20250619    clang-20
i386        buildonly-randconfig-002-20250619    gcc-12
i386        buildonly-randconfig-002-20250620    clang-20
i386        buildonly-randconfig-003-20250619    clang-20
i386        buildonly-randconfig-003-20250620    clang-20
i386        buildonly-randconfig-004-20250619    clang-20
i386        buildonly-randconfig-004-20250620    clang-20
i386        buildonly-randconfig-005-20250619    clang-20
i386        buildonly-randconfig-005-20250620    clang-20
i386        buildonly-randconfig-006-20250619    clang-20
i386        buildonly-randconfig-006-20250620    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250619    gcc-12
i386                  randconfig-001-20250620    gcc-12
i386                  randconfig-002-20250619    gcc-12
i386                  randconfig-002-20250620    gcc-12
i386                  randconfig-003-20250619    gcc-12
i386                  randconfig-003-20250620    gcc-12
i386                  randconfig-004-20250619    gcc-12
i386                  randconfig-004-20250620    gcc-12
i386                  randconfig-005-20250619    gcc-12
i386                  randconfig-005-20250620    gcc-12
i386                  randconfig-006-20250619    gcc-12
i386                  randconfig-006-20250620    gcc-12
i386                  randconfig-007-20250619    gcc-12
i386                  randconfig-007-20250620    gcc-12
i386                  randconfig-011-20250619    clang-20
i386                  randconfig-011-20250620    gcc-12
i386                  randconfig-012-20250619    clang-20
i386                  randconfig-012-20250620    gcc-12
i386                  randconfig-013-20250619    clang-20
i386                  randconfig-013-20250620    gcc-12
i386                  randconfig-014-20250619    clang-20
i386                  randconfig-014-20250620    gcc-12
i386                  randconfig-015-20250619    clang-20
i386                  randconfig-015-20250620    gcc-12
i386                  randconfig-016-20250619    clang-20
i386                  randconfig-016-20250620    gcc-12
i386                  randconfig-017-20250619    clang-20
i386                  randconfig-017-20250620    gcc-12
loongarch                        alldefconfig    gcc-15.1.0
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250619    gcc-15.1.0
loongarch             randconfig-001-20250619    gcc-8.5.0
loongarch             randconfig-002-20250619    gcc-15.1.0
loongarch             randconfig-002-20250619    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          amiga_defconfig    gcc-15.1.0
m68k                         apollo_defconfig    clang-21
m68k                            mac_defconfig    clang-21
m68k                        stmark2_defconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip30_defconfig    clang-21
mips                           ip32_defconfig    gcc-15.1.0
nios2                         3c120_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                 randconfig-001-20250619    gcc-8.5.0
nios2                 randconfig-002-20250619    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250619    gcc-11.5.0
parisc                randconfig-001-20250619    gcc-8.5.0
parisc                randconfig-002-20250619    gcc-8.5.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   currituck_defconfig    clang-21
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc                     kmeter1_defconfig    gcc-15.1.0
powerpc                     mpc83xx_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250619    gcc-8.5.0
powerpc               randconfig-001-20250619    gcc-9.3.0
powerpc               randconfig-002-20250619    clang-21
powerpc               randconfig-002-20250619    gcc-8.5.0
powerpc               randconfig-003-20250619    gcc-10.5.0
powerpc               randconfig-003-20250619    gcc-8.5.0
powerpc64             randconfig-001-20250619    gcc-11.5.0
powerpc64             randconfig-001-20250619    gcc-8.5.0
powerpc64             randconfig-002-20250619    clang-21
powerpc64             randconfig-002-20250619    gcc-8.5.0
powerpc64             randconfig-003-20250619    gcc-10.5.0
powerpc64             randconfig-003-20250619    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250619    gcc-11.5.0
riscv                 randconfig-001-20250619    gcc-9.3.0
riscv                 randconfig-001-20250620    gcc-13.3.0
riscv                 randconfig-002-20250619    clang-16
riscv                 randconfig-002-20250619    gcc-9.3.0
riscv                 randconfig-002-20250620    gcc-13.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250619    clang-19
s390                  randconfig-001-20250619    gcc-9.3.0
s390                  randconfig-001-20250620    gcc-13.3.0
s390                  randconfig-002-20250619    gcc-13.2.0
s390                  randconfig-002-20250619    gcc-9.3.0
s390                  randconfig-002-20250620    gcc-13.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    clang-21
sh                                  defconfig    gcc-12
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20250619    gcc-9.3.0
sh                    randconfig-001-20250620    gcc-13.3.0
sh                    randconfig-002-20250619    gcc-9.3.0
sh                    randconfig-002-20250620    gcc-13.3.0
sh                           se7343_defconfig    gcc-15.1.0
sh                           se7705_defconfig    clang-21
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250619    gcc-14.3.0
sparc                 randconfig-001-20250619    gcc-9.3.0
sparc                 randconfig-001-20250620    gcc-13.3.0
sparc                 randconfig-002-20250619    gcc-10.3.0
sparc                 randconfig-002-20250619    gcc-9.3.0
sparc                 randconfig-002-20250620    gcc-13.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250619    gcc-13.3.0
sparc64               randconfig-001-20250619    gcc-9.3.0
sparc64               randconfig-001-20250620    gcc-13.3.0
sparc64               randconfig-002-20250619    gcc-8.5.0
sparc64               randconfig-002-20250619    gcc-9.3.0
sparc64               randconfig-002-20250620    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250619    clang-19
um                    randconfig-001-20250619    gcc-9.3.0
um                    randconfig-001-20250620    gcc-13.3.0
um                    randconfig-002-20250619    clang-21
um                    randconfig-002-20250619    gcc-9.3.0
um                    randconfig-002-20250620    gcc-13.3.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250619    clang-20
x86_64      buildonly-randconfig-001-20250619    gcc-12
x86_64      buildonly-randconfig-001-20250620    gcc-12
x86_64      buildonly-randconfig-002-20250619    gcc-12
x86_64      buildonly-randconfig-002-20250620    gcc-12
x86_64      buildonly-randconfig-003-20250619    clang-20
x86_64      buildonly-randconfig-003-20250619    gcc-12
x86_64      buildonly-randconfig-003-20250620    gcc-12
x86_64      buildonly-randconfig-004-20250619    gcc-12
x86_64      buildonly-randconfig-004-20250620    gcc-12
x86_64      buildonly-randconfig-005-20250619    clang-20
x86_64      buildonly-randconfig-005-20250619    gcc-12
x86_64      buildonly-randconfig-005-20250620    gcc-12
x86_64      buildonly-randconfig-006-20250619    gcc-12
x86_64      buildonly-randconfig-006-20250620    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250619    gcc-11
x86_64                randconfig-001-20250620    clang-20
x86_64                randconfig-002-20250619    gcc-11
x86_64                randconfig-002-20250620    clang-20
x86_64                randconfig-003-20250619    gcc-11
x86_64                randconfig-003-20250620    clang-20
x86_64                randconfig-004-20250619    gcc-11
x86_64                randconfig-004-20250620    clang-20
x86_64                randconfig-005-20250619    gcc-11
x86_64                randconfig-005-20250620    clang-20
x86_64                randconfig-006-20250619    gcc-11
x86_64                randconfig-006-20250620    clang-20
x86_64                randconfig-007-20250619    gcc-11
x86_64                randconfig-007-20250620    clang-20
x86_64                randconfig-008-20250619    gcc-11
x86_64                randconfig-008-20250620    clang-20
x86_64                randconfig-071-20250619    clang-20
x86_64                randconfig-071-20250620    clang-20
x86_64                randconfig-072-20250619    clang-20
x86_64                randconfig-072-20250620    clang-20
x86_64                randconfig-073-20250619    clang-20
x86_64                randconfig-073-20250620    clang-20
x86_64                randconfig-074-20250619    clang-20
x86_64                randconfig-074-20250620    clang-20
x86_64                randconfig-075-20250619    clang-20
x86_64                randconfig-075-20250620    clang-20
x86_64                randconfig-076-20250619    clang-20
x86_64                randconfig-076-20250620    clang-20
x86_64                randconfig-077-20250619    clang-20
x86_64                randconfig-077-20250620    clang-20
x86_64                randconfig-078-20250619    clang-20
x86_64                randconfig-078-20250620    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250619    gcc-9.3.0
xtensa                randconfig-001-20250620    gcc-13.3.0
xtensa                randconfig-002-20250619    gcc-8.5.0
xtensa                randconfig-002-20250619    gcc-9.3.0
xtensa                randconfig-002-20250620    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

