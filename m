Return-Path: <linux-gpio+bounces-23522-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF67B0B491
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 11:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2164189C40B
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 09:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BC41D79A5;
	Sun, 20 Jul 2025 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOtYui1b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5441B424F
	for <linux-gpio@vger.kernel.org>; Sun, 20 Jul 2025 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753003378; cv=none; b=TDMGBLvVyYKsJtqP2XvT8/NufZb4ubnFuf2BZw1oq9wJE0Hd/YpVyt6NWQKRRTjW27MvL0262Ie0P7/QRHj8mG/YRht9pwfqsXrsqjJgGcD4ytq80HPEoMuJj3NCfso+dLRni5O2ZCiukRT5/HtopeXZQtOkRWWNvkmcWG/zDQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753003378; c=relaxed/simple;
	bh=u04/dBEuw5rEYDvS7g1BLfKcVwsf7TFB+7m0hf/bI4k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HbVswlc6YkPEQKKFMdz+2xD8HthP36SiE+35bRtdxV4cLp6i5uKyYRfjWTybMEukl9RwJlPZ2urVf9jkbIRhilxxej5nPzFGXM03+BkRql8EPNUl0wctSDY07Q9bW0T9hp5HjY9lfd4qVcbvcMmYatp6JcsUh3AmIIjsxHbl2yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOtYui1b; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753003377; x=1784539377;
  h=date:from:to:cc:subject:message-id;
  bh=u04/dBEuw5rEYDvS7g1BLfKcVwsf7TFB+7m0hf/bI4k=;
  b=fOtYui1bqrPzghmQjqlxqC73JgxPqkgB3NKB68J/tquGMxjSkZTN7fky
   +TwCpckfXy4Jszyy751KbmVBQJN+HIdao7ABTLNWZwQIvKG4+kAGvtilP
   iFLl2Jzs8zwNcwo0st8E5YmIVeitrTMUwBwbqgSn9xA9UPtDnorE45SFv
   9rIFlKy5zUk/bdu0O8u/ep9ZGWAW5DqoRwgrE9hpAd4BT5yIWhvPhBiAj
   dVTRgTDGncxUrjpzIoQhe7haV0+U/aNiyF6MAsf4h5My1FnErk2mQJ766
   zcu98WJMokxh8XltHR2KYOGJiJqsjd5W7+2ESHCVCH77WsgOfnRcall6t
   w==;
X-CSE-ConnectionGUID: DQx7U6uyRHaq4La+ASEe+A==
X-CSE-MsgGUID: stY1aXl0RTOwdNLVdAjejw==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="65930941"
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="65930941"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 02:22:55 -0700
X-CSE-ConnectionGUID: kpJsoApVTB201MKubAObgQ==
X-CSE-MsgGUID: Tq5OjmMiRsyuL5I0qXkRxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="159019475"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Jul 2025 02:22:55 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udQFw-000G21-1P;
	Sun, 20 Jul 2025 09:22:52 +0000
Date: Sun, 20 Jul 2025 17:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 5607f5ed3c5f30f41e72ce09c8e616af0fc0d474
Message-ID: <202507201746.AahkKnoL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 5607f5ed3c5f30f41e72ce09c8e616af0fc0d474  gpio: sysfs: Fix an end of loop test in gpiod_unexport()

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: gpio@80000000 (cirrus,ep7209-gpio): reg: [[2147483648, 1], [2147483712, 1]] is too long

Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-052-20250718
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
|-- arm-randconfig-054-20250720
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
`-- arm-randconfig-055-20250720
    `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long

elapsed time: 980m

configs tested: 128
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                     haps_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250720    gcc-11.5.0
arc                   randconfig-002-20250720    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250720    gcc-15.1.0
arm                   randconfig-002-20250720    gcc-15.1.0
arm                   randconfig-003-20250720    gcc-10.5.0
arm                   randconfig-004-20250720    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250720    gcc-15.1.0
arm64                 randconfig-002-20250720    gcc-12.5.0
arm64                 randconfig-003-20250720    clang-21
arm64                 randconfig-004-20250720    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250720    gcc-15.1.0
csky                  randconfig-002-20250720    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250720    clang-21
hexagon               randconfig-002-20250720    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250720    clang-20
i386        buildonly-randconfig-002-20250720    gcc-12
i386        buildonly-randconfig-003-20250720    gcc-12
i386        buildonly-randconfig-004-20250720    clang-20
i386        buildonly-randconfig-005-20250720    gcc-12
i386        buildonly-randconfig-006-20250720    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250720    clang-18
loongarch             randconfig-002-20250720    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         db1xxx_defconfig    clang-21
mips                           ip22_defconfig    gcc-15.1.0
mips                           mtx1_defconfig    clang-21
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250720    gcc-9.5.0
nios2                 randconfig-002-20250720    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250720    gcc-8.5.0
parisc                randconfig-002-20250720    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250720    gcc-10.5.0
powerpc               randconfig-002-20250720    gcc-8.5.0
powerpc               randconfig-003-20250720    gcc-11.5.0
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250720    gcc-10.5.0
powerpc64             randconfig-002-20250720    gcc-8.5.0
powerpc64             randconfig-003-20250720    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250720    clang-21
riscv                 randconfig-002-20250720    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250720    clang-21
s390                  randconfig-002-20250720    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250720    gcc-15.1.0
sh                    randconfig-002-20250720    gcc-13.4.0
sh                           se7750_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250720    gcc-8.5.0
sparc                 randconfig-002-20250720    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250720    gcc-8.5.0
sparc64               randconfig-002-20250720    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250720    gcc-11
um                    randconfig-002-20250720    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250720    gcc-12
x86_64      buildonly-randconfig-002-20250720    gcc-12
x86_64      buildonly-randconfig-003-20250720    gcc-12
x86_64      buildonly-randconfig-004-20250720    clang-20
x86_64      buildonly-randconfig-005-20250720    gcc-11
x86_64      buildonly-randconfig-006-20250720    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250720    gcc-8.5.0
xtensa                randconfig-002-20250720    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

