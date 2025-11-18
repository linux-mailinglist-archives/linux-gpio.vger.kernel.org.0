Return-Path: <linux-gpio+bounces-28652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E865C6930D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 12:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 44FE52A556
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 11:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C62730597B;
	Tue, 18 Nov 2025 11:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYT6oGt5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339982877D7
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 11:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763466624; cv=none; b=L0iYY5UM0DySQA2kExJQhjAfjwy4ymwQ/XWD05w9c7AIjAOCU++J60PPPfmIgYoQ/TZcgEGjwm8oIpPSLFw19VIOJRcASh66OxXRT22cYmV+WhzYpfDuAdl0g2LK9h65H7zaPbi+WjTu53Myu8wCEY3UW8FL+k0G4N/Gzr5lN4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763466624; c=relaxed/simple;
	bh=mOerfsh2xpdAEcagTzUxJ/upPlLpsrk6k+ssqdLU358=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aw6TT6J+UBYr5hwyIaSoA3Q4Inerubr51K6DO3QQMjsrUfQpA1ULd+DLrjfE6KnYmBM62CylI640M7wqOO93o35VoJa4B1oplg5DRovzH6kP1gvQPUrOpVDvXyqYLcKK2GkmK92PcXx1RQZvPIxAaw2t17QLpntEUPqlY5yOkNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SYT6oGt5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763466623; x=1795002623;
  h=date:from:to:cc:subject:message-id;
  bh=mOerfsh2xpdAEcagTzUxJ/upPlLpsrk6k+ssqdLU358=;
  b=SYT6oGt5qVWVuwuLx/Uvp5sbSyhv7O4fnsXeIa+f14qph4hQyCQ16lvj
   kaSSZTi3syjrPlZG038W3UlE+DpeP9AP4WMf63kAOeaeCjpsLI7mJr2pY
   TUCUmpyVycghpP94lq8uffrKiYPuadDhtYfsKiGc747XGhk/UH1oiCBDh
   +Ixpi3IWQV4ZcexfMmCrvoLa5A+cDlfAB1fov2Vq/scajNaEemj7Gr9wT
   nKQ0DMXMDluv09IN0Bu+NNIeMSiO3gAkrtPGVv3rPgZ9kv6KFUrd6ZZyw
   TIuOkecvDdS7knMbz/Yt8X20RwKjyVwv6Kg2ifk3ocTac8Hps3b4IC593
   w==;
X-CSE-ConnectionGUID: dmCFU9b/SF6qGPtRiYyVzg==
X-CSE-MsgGUID: T1S6t7VZQFi6VY554ZSKhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76838467"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76838467"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 03:50:22 -0800
X-CSE-ConnectionGUID: NTjJl1w0T0qVLPOdzxSCGw==
X-CSE-MsgGUID: zprqEUoWQCmjV/DosaPxnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190028201"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Nov 2025 03:50:22 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLKDz-0001gS-0S;
	Tue, 18 Nov 2025 11:50:19 +0000
Date: Tue, 18 Nov 2025 19:49:47 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS WITH WARNING
 67f9b828d4e5e47caf3472a399c25c3c0ddc824a
Message-ID: <202511181939.4qShUQXo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 67f9b828d4e5e47caf3472a399c25c3c0ddc824a  gpio: tegra186: Fix GPIO name collisions for Tegra410

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202511180232.EItKeYjY-lkp@intel.com

    drivers/gpio/gpiolib-shared.c:62:1: warning: 'gpio_shared_find_entry' defined but not used [-Wunused-function]

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-randconfig-r132-20251118
|   `-- drivers-gpio-gpiolib-shared.c:warning:gpio_shared_find_entry-defined-but-not-used
|-- i386-buildonly-randconfig-005-20251118
|   `-- drivers-gpio-gpiolib-shared.c:warning:gpio_shared_find_entry-defined-but-not-used
|-- m68k-randconfig-r061-20251118
|   `-- drivers-gpio-gpiolib-shared.c:warning:gpio_shared_find_entry-defined-but-not-used
|-- m68k-randconfig-r071-20251118
|   `-- drivers-gpio-gpiolib-shared.c:warning:gpio_shared_find_entry-defined-but-not-used
|-- parisc-randconfig-001-20251118
|   `-- drivers-gpio-gpiolib-shared.c:warning:gpio_shared_find_entry-defined-but-not-used
|-- parisc-randconfig-002-20251118
|   `-- drivers-gpio-gpiolib-shared.c:warning:gpio_shared_find_entry-defined-but-not-used
|-- s390-randconfig-r073-20251117
|   `-- drivers-gpio-gpiolib-shared.c:warning:gpio_shared_find_entry-defined-but-not-used
|-- sh-randconfig-001-20251118
|   `-- drivers-gpio-gpiolib-shared.c:warning:gpio_shared_find_entry-defined-but-not-used
|-- um-randconfig-r052-20251118
|   `-- drivers-gpio-gpiolib-shared.c:warning:gpio_shared_find_entry-defined-but-not-used
`-- x86_64-buildonly-randconfig-002-20251118
    `-- drivers-gpio-gpiolib-shared.c:warning:gpio_shared_find_entry-defined-but-not-used

elapsed time: 1491m

configs tested: 108
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251117    gcc-14.3.0
arc                   randconfig-002-20251117    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                         lpc18xx_defconfig    clang-22
arm                   randconfig-001-20251117    clang-22
arm                   randconfig-002-20251117    gcc-14.3.0
arm                   randconfig-003-20251117    gcc-12.5.0
arm                   randconfig-004-20251117    gcc-10.5.0
arm                        spear6xx_defconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251117    clang-22
arm64                 randconfig-002-20251117    gcc-15.1.0
arm64                 randconfig-003-20251117    gcc-8.5.0
arm64                 randconfig-004-20251117    gcc-9.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251117    gcc-12.5.0
csky                  randconfig-002-20251117    gcc-9.5.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251118    clang-16
hexagon               randconfig-002-20251118    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251118    clang-20
i386        buildonly-randconfig-002-20251118    clang-20
i386        buildonly-randconfig-003-20251118    clang-20
i386        buildonly-randconfig-004-20251118    clang-20
i386        buildonly-randconfig-005-20251118    gcc-13
i386        buildonly-randconfig-006-20251118    clang-20
i386                  randconfig-001-20251118    clang-20
i386                  randconfig-002-20251118    clang-20
i386                  randconfig-003-20251118    gcc-14
i386                  randconfig-004-20251118    gcc-14
i386                  randconfig-005-20251118    clang-20
i386                  randconfig-006-20251118    gcc-14
i386                  randconfig-007-20251118    gcc-14
i386                  randconfig-011-20251118    gcc-14
i386                  randconfig-012-20251118    gcc-12
i386                  randconfig-013-20251118    clang-20
i386                  randconfig-014-20251118    gcc-14
i386                  randconfig-015-20251118    gcc-14
i386                  randconfig-016-20251118    gcc-14
i386                  randconfig-017-20251118    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251118    gcc-15.1.0
loongarch             randconfig-002-20251118    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         db1xxx_defconfig    clang-22
mips                          eyeq6_defconfig    clang-22
mips                        maltaup_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251118    gcc-11.5.0
nios2                 randconfig-002-20251118    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251118    gcc-14.3.0
parisc                randconfig-002-20251118    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      ppc44x_defconfig    clang-22
powerpc               randconfig-001-20251118    clang-22
powerpc               randconfig-002-20251118    clang-22
powerpc64             randconfig-001-20251118    gcc-13.4.0
powerpc64             randconfig-002-20251118    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251117    gcc-12.5.0
riscv                 randconfig-002-20251117    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251117    gcc-14.3.0
s390                  randconfig-002-20251117    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251117    gcc-15.1.0
sh                    randconfig-002-20251117    gcc-15.1.0
sh                          rsk7269_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251118    clang-20
x86_64                randconfig-012-20251118    clang-20
x86_64                randconfig-013-20251118    gcc-14
x86_64                randconfig-014-20251118    clang-20
x86_64                randconfig-015-20251118    clang-20
x86_64                randconfig-016-20251118    clang-20
x86_64                randconfig-071-20251118    gcc-13
x86_64                randconfig-072-20251118    clang-20
x86_64                randconfig-073-20251118    gcc-14
x86_64                randconfig-074-20251118    gcc-13
x86_64                randconfig-075-20251118    gcc-14
x86_64                randconfig-076-20251118    clang-20
xtensa                           alldefconfig    gcc-15.1.0
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

