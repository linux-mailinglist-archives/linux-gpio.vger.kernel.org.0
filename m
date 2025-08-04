Return-Path: <linux-gpio+bounces-24011-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A73B19F02
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 11:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DF9A3BD31C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 09:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408A0244673;
	Mon,  4 Aug 2025 09:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbbD10nc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7971D242D6B
	for <linux-gpio@vger.kernel.org>; Mon,  4 Aug 2025 09:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754300993; cv=none; b=JsiADxsKw8PEVyxz5e0IPw4dYim13HAGZQ2nycxHK76hpUitHCCTmuJl9t8fcVzsx/bFVkhjgyh8DQufy1BzMj3cGbUMTiwbvB7qb9sRdYcCHNdxJGCcRokESMFhB3m2Uo23h5oljCr4aYAQROcytKH0qhHAE8WAt5UyEnx05Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754300993; c=relaxed/simple;
	bh=TVBxECvTEIkCA2gxcE0Qlnu12iMIiq/9qmPch8vOaaY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dz0zavlNEvMc3PojjxBtomDxqOTWKPBKngxZ3E8g/6vKIg95gsj72Gab2iaPFHY2jam9+EodgyHbd7Ax7ZNTkSdOIZYRk/llWWBDTpykJFq3D8h1R8X4CpfkB3j0lbeUFhIiwjHStssJkjitWoKPhhfKpTtOnn8Hj93nnQI8L+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbbD10nc; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754300991; x=1785836991;
  h=date:from:to:cc:subject:message-id;
  bh=TVBxECvTEIkCA2gxcE0Qlnu12iMIiq/9qmPch8vOaaY=;
  b=YbbD10ncMgf2O0bFWfke0bOlWOUfTBc/xFo/NnBlEfNLIiiAKPmqH7se
   T5FT/4MzkBbnT8+8lGSI0hVGeWEoXv8s6BBWH6DpwXtW84IRPpTIw6DvI
   8E8ZD0E0YqyYeFx5f2nQsiVT+WZb9aGHxt545iQenRdIAIWztcfNh8ucq
   DJpFn7RDrEwURw+zJgbLBeaLQjCOeVzHQfTJkXCDwxLfWhkXtGeAB0ZAV
   suZSaI3pH5eqBlH4aGR5GTMqf0Aqw+84DW57ZnYjSKTHSeGq8206snHR8
   2UNSaP2S3470UfVg42Ogwhwvcf84yX1JOXmOhtGDGbkgmgvM8uINg89TR
   A==;
X-CSE-ConnectionGUID: o9QdTtAGQH2smBmu/TyE6A==
X-CSE-MsgGUID: yMKrqbgZSEysEqzWNzBH+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56638781"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56638781"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 02:49:50 -0700
X-CSE-ConnectionGUID: GgnXw60wTn6K1OthjV3etQ==
X-CSE-MsgGUID: zG5m3NYQR8Krlxq67ALw4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168566502"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Aug 2025 02:49:50 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uirpD-0006wO-0q;
	Mon, 04 Aug 2025 09:49:47 +0000
Date: Mon, 04 Aug 2025 17:49:31 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 63c7bc53a35e785accdc2ceab8f72d94501931ab
Message-ID: <202508041719.7hWkbgpA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 63c7bc53a35e785accdc2ceab8f72d94501931ab  gpio: mlxbf2: use platform_get_irq_optional()

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: gpio@80000000 (cirrus,ep7209-gpio): reg: [[2147483648, 1], [2147483712, 1]] is too long

Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-051-20250804
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
|-- arm-randconfig-052-20250804
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
|-- arm-randconfig-053-20250804
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
|-- arm-randconfig-054-20250804
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
`-- arm-randconfig-055-20250804
    `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long

elapsed time: 835m

configs tested: 133
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.1.0
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250804    gcc-8.5.0
arc                   randconfig-002-20250804    gcc-13.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                                 defconfig    clang-22
arm                   randconfig-001-20250804    clang-22
arm                   randconfig-002-20250804    clang-22
arm                   randconfig-003-20250804    clang-22
arm                   randconfig-004-20250804    gcc-15.1.0
arm                       versatile_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250804    clang-22
arm64                 randconfig-002-20250804    clang-19
arm64                 randconfig-003-20250804    clang-22
arm64                 randconfig-004-20250804    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250804    gcc-12.5.0
csky                  randconfig-002-20250804    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250804    clang-22
hexagon               randconfig-002-20250804    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250804    clang-20
i386        buildonly-randconfig-002-20250804    gcc-12
i386        buildonly-randconfig-003-20250804    clang-20
i386        buildonly-randconfig-004-20250804    gcc-12
i386        buildonly-randconfig-005-20250804    gcc-12
i386        buildonly-randconfig-006-20250804    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250804    gcc-15.1.0
loongarch             randconfig-002-20250804    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                           virt_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250804    gcc-10.5.0
nios2                 randconfig-002-20250804    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250804    gcc-12.5.0
parisc                randconfig-002-20250804    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc               randconfig-001-20250804    gcc-8.5.0
powerpc               randconfig-002-20250804    gcc-13.4.0
powerpc               randconfig-003-20250804    clang-22
powerpc                     tqm5200_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250804    clang-22
powerpc64             randconfig-002-20250804    clang-19
powerpc64             randconfig-003-20250804    clang-16
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250804    gcc-8.5.0
riscv                 randconfig-002-20250804    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250804    clang-22
s390                  randconfig-002-20250804    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250804    gcc-14.3.0
sh                    randconfig-002-20250804    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250804    gcc-8.5.0
sparc                 randconfig-002-20250804    gcc-13.4.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250804    gcc-10.5.0
sparc64               randconfig-002-20250804    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250804    clang-22
um                    randconfig-002-20250804    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250804    clang-20
x86_64      buildonly-randconfig-002-20250804    gcc-12
x86_64      buildonly-randconfig-003-20250804    gcc-12
x86_64      buildonly-randconfig-004-20250804    gcc-12
x86_64      buildonly-randconfig-005-20250804    clang-20
x86_64      buildonly-randconfig-006-20250804    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250804    gcc-11.5.0
xtensa                randconfig-002-20250804    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

