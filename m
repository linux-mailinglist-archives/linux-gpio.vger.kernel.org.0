Return-Path: <linux-gpio+bounces-23857-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAD6B131D2
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 22:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA9327A80BA
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 20:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659DA238141;
	Sun, 27 Jul 2025 20:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DW1pnl+n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E11123771E
	for <linux-gpio@vger.kernel.org>; Sun, 27 Jul 2025 20:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753648585; cv=none; b=mWCBxrwQM6JEgqk7vLo7rIonZJSuSMTYAJ8KxyzxLIh+65gKXo19fhEkG0SMECwyKl4QRjXofUP/jn6JAPu0MC0bYRTTfrLqUUTv1uagXzC2OVIHtNbeKyc6Y0rEFWB7k6a5MMYwRHOCxp9wJ/lkv5nkNLrHVnfl40RXvPbhxOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753648585; c=relaxed/simple;
	bh=3LKjYU/6fQNO5oBi0v+tkQV2AneHHfhVkio+X3yRKU0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WfdF0goN/eQshKqCXXOAZjhuLa7/cG/jWEUjhrG0s5Rewv42niT0GAyMJgvzVcJympVoyNYht1pTpins6J2ECW/PYMLnimNVpOxvhM2z3pk3lk0qKxm5j0MwZU+RAzFnwreSA5fb4jxYJXOcx7ES+7ZTExVATMuEHn7HxEfAII8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DW1pnl+n; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753648583; x=1785184583;
  h=date:from:to:cc:subject:message-id;
  bh=3LKjYU/6fQNO5oBi0v+tkQV2AneHHfhVkio+X3yRKU0=;
  b=DW1pnl+nYulgI+waTRvsGSqUYQG5Fg+cFlvxz0iTYoKG/lNEc5nnUf+H
   BatREpipKnjlQzRJNyY5qiDSGbZv9tZR3ofnz7jjc6hEaGLclYGn+1rqu
   qcfm4Wg9Qz99W0/kcpHD7qVqvdbi1OoAfuFFvpeVswvV4uDljNIDZENxX
   JDyELhYbKZwLFwdWrS74UQzL/orsAV7weeMeKsm/VkGdWpUix28E1R89U
   00pLs/xO2HiVazaiNTtncbz3IlM3oah59FJSwpgTgKwPC55eJms9nn9Dc
   qxBIAatDljvKI+Y1tGeFJQ/jVKyne+3L/ejalVzhtRu/svGZfR9ze7vKk
   g==;
X-CSE-ConnectionGUID: NlACNNoLTBOH9UAEs0s05Q==
X-CSE-MsgGUID: sJImrhg4QS2FNl+Lj/37fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="81346304"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="81346304"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 13:36:22 -0700
X-CSE-ConnectionGUID: NQ3pk99JSmCqJbXXwIMSyw==
X-CSE-MsgGUID: u6CxdVHDRRq8cnMc9YMtgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="199377802"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Jul 2025 13:36:21 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ug86U-00001v-2P;
	Sun, 27 Jul 2025 20:36:18 +0000
Date: Mon, 28 Jul 2025 04:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 a86240a37d43fc22b4e4953242fca8d90df2c555
Message-ID: <202507280442.Gws1VQmy-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: a86240a37d43fc22b4e4953242fca8d90df2c555  gpiolib: enable CONFIG_GPIOLIB_LEGACY even for !GPIOLIB

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: gpio@80000000 (cirrus,ep7209-gpio): reg: [[2147483648, 1], [2147483712, 1]] is too long

Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-051-20250727
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
|-- arm-randconfig-052-20250727
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
|-- arm-randconfig-053-20250727
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
|-- arm-randconfig-054-20250727
|   `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long
`-- arm-randconfig-055-20250727
    `-- arch-arm-boot-dts-cirrus-ep7211-edb7211.dtb:gpio-(cirrus-ep7209-gpio):reg:is-too-long

elapsed time: 722m

configs tested: 135
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250727    gcc-8.5.0
arc                   randconfig-002-20250727    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                             pxa_defconfig    gcc-15.1.0
arm                   randconfig-001-20250727    gcc-11.5.0
arm                   randconfig-002-20250727    gcc-14.3.0
arm                   randconfig-003-20250727    clang-22
arm                   randconfig-004-20250727    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250727    gcc-11.5.0
arm64                 randconfig-002-20250727    clang-18
arm64                 randconfig-003-20250727    clang-17
arm64                 randconfig-004-20250727    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250727    gcc-15.1.0
csky                  randconfig-002-20250727    gcc-12.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250727    clang-22
hexagon               randconfig-002-20250727    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250727    gcc-12
i386        buildonly-randconfig-002-20250727    gcc-12
i386        buildonly-randconfig-003-20250727    clang-20
i386        buildonly-randconfig-004-20250727    clang-20
i386        buildonly-randconfig-005-20250727    clang-20
i386        buildonly-randconfig-006-20250727    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250727    clang-22
loongarch             randconfig-002-20250727    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         db1xxx_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250727    gcc-8.5.0
nios2                 randconfig-002-20250727    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                 simple_smp_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250727    gcc-11.5.0
parisc                randconfig-002-20250727    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250727    gcc-13.4.0
powerpc               randconfig-002-20250727    clang-22
powerpc               randconfig-003-20250727    clang-22
powerpc64             randconfig-001-20250727    gcc-12.5.0
powerpc64             randconfig-002-20250727    clang-22
powerpc64             randconfig-003-20250727    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250727    clang-22
riscv                 randconfig-002-20250727    clang-20
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250727    clang-22
s390                  randconfig-002-20250727    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                        edosk7760_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250727    gcc-15.1.0
sh                    randconfig-002-20250727    gcc-11.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250727    gcc-8.5.0
sparc                 randconfig-002-20250727    gcc-8.5.0
sparc64                          alldefconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250727    gcc-8.5.0
sparc64               randconfig-002-20250727    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250727    clang-22
um                    randconfig-002-20250727    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250727    gcc-12
x86_64      buildonly-randconfig-002-20250727    clang-20
x86_64      buildonly-randconfig-003-20250727    clang-20
x86_64      buildonly-randconfig-004-20250727    clang-20
x86_64      buildonly-randconfig-005-20250727    clang-20
x86_64      buildonly-randconfig-006-20250727    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250727    gcc-8.5.0
xtensa                randconfig-002-20250727    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

