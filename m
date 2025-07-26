Return-Path: <linux-gpio+bounces-23838-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE70CB129C5
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jul 2025 10:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A05941C21C90
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jul 2025 08:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9552A21D583;
	Sat, 26 Jul 2025 08:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0QONTK6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460E520468E
	for <linux-gpio@vger.kernel.org>; Sat, 26 Jul 2025 08:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753520286; cv=none; b=XaXS3rKT/bHNZHO+cnzkuPwSP0jPwelFOfJx4qnYyPsok7JQRIR2QXvnFgQkXi8rcLOR/f8bFtG20+bRWx0RmyYjeHQMEeLjVjusHbzFkGBu7/l39xJfwq1KLlF9BmPuegTbghZ+HYBg+3U/lEWCMsofN0OsQ8eEhmzFgxWNhYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753520286; c=relaxed/simple;
	bh=5jO+kGua8shFtacygu4hwsxGpl/DTudXw1sHrjlqoXI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u9DoJkkJ82QJ5kq82z7U2qGw6WTphBLapc4p7cb5Asby3p0hJa03Cz9DKujm+ta100RszHrzFc0pXa039CHbtNa11K956cE9d4TOkExcHwEXIf+Iig4q1AlIJUa3PACKjIatabTV5R6DHAwPmqOitSg9Z4w6XFIkdw4DPsosAio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0QONTK6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753520284; x=1785056284;
  h=date:from:to:cc:subject:message-id;
  bh=5jO+kGua8shFtacygu4hwsxGpl/DTudXw1sHrjlqoXI=;
  b=j0QONTK6Ilg5zYKB9d7D2bhkfV2hW9NTys/Wq/lErp4uieajFrerarZi
   HP8PYybOGVNTjybgG8OBBcTysjIVdhdWceiq+FdPVYrxnhZib4yWNrT5G
   XGMq0n6x7uT2kwM9XiV8xIlEFCct+Kp1USmGeI01imFCDviSsTKE0xXF+
   kPO2ZOo/+gVnT5OkHquIg+2FTnYQbRiwbRiPmPY1RuGv28Hp4CFezdehA
   N0xJVS1OPKOfOUysk6DjyAz16x/yTlbld/TghLZoGgrFGJjbMiIfR1mVe
   2AHRuB6mlPh1twjcroXBn4WRLipFms+rMyLUTMMOu+3+o0bci6Zy7es46
   Q==;
X-CSE-ConnectionGUID: 4NkW4G17QCCkrFPvzvCzqQ==
X-CSE-MsgGUID: a8vhFy3wR0qzGPNGJKaF4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55542757"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55542757"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 01:58:03 -0700
X-CSE-ConnectionGUID: N7NkJ6p6Q5+sdD/BK81eWA==
X-CSE-MsgGUID: kmQvdodYQ7Cl1PHTC2RW3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="166866953"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Jul 2025 01:58:03 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufajA-000Lnv-0a;
	Sat, 26 Jul 2025 08:58:00 +0000
Date: Sat, 26 Jul 2025 16:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 4740e1e2f320061c2f0dbadc0dd3dfb58df986d5
Message-ID: <202507261609.H2qSjYYh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 4740e1e2f320061c2f0dbadc0dd3dfb58df986d5  gpio: virtio: Fix config space reading.

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: gpio@80000000 (cirrus,ep7209-gpio): reg: [[2147483648, 1], [2147483712, 1]] is too long

Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-051-20250726
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
|-- arm-randconfig-052-20250726
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
|-- arm-randconfig-053-20250726
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
|-- arm-randconfig-054-20250726
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
`-- arm-randconfig-055-20250726
    `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long

elapsed time: 1444m

configs tested: 120
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250725    gcc-13.4.0
arc                   randconfig-002-20250725    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                            qcom_defconfig    clang-22
arm                   randconfig-001-20250725    gcc-15.1.0
arm                   randconfig-002-20250725    clang-22
arm                   randconfig-003-20250725    clang-20
arm                   randconfig-004-20250725    clang-22
arm                           u8500_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250725    clang-22
arm64                 randconfig-002-20250725    gcc-12.5.0
arm64                 randconfig-003-20250725    gcc-14.3.0
arm64                 randconfig-004-20250725    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250725    gcc-11.5.0
csky                  randconfig-002-20250725    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250725    clang-22
hexagon               randconfig-002-20250725    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250725    gcc-12
i386        buildonly-randconfig-002-20250725    clang-20
i386        buildonly-randconfig-003-20250725    clang-20
i386        buildonly-randconfig-004-20250725    clang-20
i386        buildonly-randconfig-005-20250725    clang-20
i386        buildonly-randconfig-006-20250725    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250725    gcc-15.1.0
loongarch             randconfig-002-20250725    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    clang-18
mips                          eyeq6_defconfig    clang-22
mips                           ip22_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250725    gcc-9.5.0
nios2                 randconfig-002-20250725    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250725    gcc-15.1.0
parisc                randconfig-002-20250725    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250725    gcc-8.5.0
powerpc               randconfig-002-20250725    clang-22
powerpc               randconfig-003-20250725    gcc-8.5.0
powerpc                        warp_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250725    clang-22
powerpc64             randconfig-002-20250725    gcc-8.5.0
powerpc64             randconfig-003-20250725    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250725    gcc-10.5.0
riscv                 randconfig-002-20250725    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250725    gcc-8.5.0
s390                  randconfig-002-20250725    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250725    gcc-15.1.0
sh                    randconfig-002-20250725    gcc-15.1.0
sh                          rsk7203_defconfig    gcc-15.1.0
sh                        sh7757lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250725    gcc-8.5.0
sparc                 randconfig-002-20250725    gcc-11.5.0
sparc64               randconfig-001-20250725    gcc-8.5.0
sparc64               randconfig-002-20250725    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250725    clang-22
um                    randconfig-002-20250725    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250725    clang-20
x86_64      buildonly-randconfig-002-20250725    clang-20
x86_64      buildonly-randconfig-003-20250725    clang-20
x86_64      buildonly-randconfig-004-20250725    clang-20
x86_64      buildonly-randconfig-005-20250725    gcc-12
x86_64      buildonly-randconfig-006-20250725    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250725    gcc-13.4.0
xtensa                randconfig-002-20250725    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

