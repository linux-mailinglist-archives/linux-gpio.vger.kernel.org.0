Return-Path: <linux-gpio+bounces-23846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FF1B12E19
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 09:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC62516501B
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 07:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538E31D90DD;
	Sun, 27 Jul 2025 07:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JyBAzXIc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0E76FB9
	for <linux-gpio@vger.kernel.org>; Sun, 27 Jul 2025 07:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753601895; cv=none; b=k5yxCxrcmdhMpq+c2oa4/X8/gFERIX9HVMicovhKgPDcm3cIi53jVytBfIg+WOSzm7h14wIpe5gs8pGH8UJ+VnkVZ+7frKH9MhijwSEpc5f2NOJ3lK2n9J65Rm5U2bqjmsHeCV30Ufv/7KlfKDf/FT71Uo3SEJamrGI/Y6kh49M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753601895; c=relaxed/simple;
	bh=3DrcXFDmhIgMV+t1MLX3qvm3MSQ8ukGRue5nJiRLBNM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QkT2dFk2y7p4ZKDUmhdtBeNQ59PjgoXMzRDPEQAVapBVi2gbzCPSnjstup+hPNrxGCW7wiaA+ao5QyaOrq5+2t5TSUEiGgpeDgYKgYZ+G+tBA4h81GYMW3qP1EdvUSu8Zmt23nmqBb6a2jdqaZ8rT73TW7CYfFp32sCcEBU5QAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JyBAzXIc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753601893; x=1785137893;
  h=date:from:to:cc:subject:message-id;
  bh=3DrcXFDmhIgMV+t1MLX3qvm3MSQ8ukGRue5nJiRLBNM=;
  b=JyBAzXIcWy/0rQSu6ngopY9CrLD1Bqv4NOKXJbfvKBTd8cIn/ls2ZDqa
   7ih8oFKDoXP9KokJa6dS1zFBQMK1KRcy402N3zirMfIoJX0upLmABJj6R
   Bvx8OeVaUy4fREgsv0FLKlSYmpXyREIdTrSEoLZhyLC8IG/ACEleoBKtR
   wGxGXATbkwma9j42SQ2AuHgfqoI19z5p574o7IpaBMxozofHDMO4iBJmK
   pwJx/YE/0hE/e7s6U3cDSOY8hco4e91FHAevYX08YVOYSuJiLdpwFhEFL
   eDkee7aD200YcfR6FnEf8of2toytUoS+FZcDDfdtm+eiTP/xcYUf0vbUw
   w==;
X-CSE-ConnectionGUID: +YRv5nieQKavIDpw9GG6RA==
X-CSE-MsgGUID: UpX7yfW2SLKLWVqjwiXLtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="81323564"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="81323564"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 00:38:13 -0700
X-CSE-ConnectionGUID: ZtZuJn6gQwGSL4ACAktt3Q==
X-CSE-MsgGUID: 2TRo3Z11Sa+MCezIDVX8JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162118739"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Jul 2025 00:38:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufvxR-000MWg-2f;
	Sun, 27 Jul 2025 07:38:09 +0000
Date: Sun, 27 Jul 2025 15:37:42 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/devel] BUILD REGRESSION
 2c924414c5d54d7ffc883039176b66efbb735b72
Message-ID: <202507271524.hyTsMaC4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
branch HEAD: 2c924414c5d54d7ffc883039176b66efbb735b72  treewide: rename GPIO set callbacks back to their original names

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202507270738.rj7En3F7-lkp@intel.com

    arch/mips/alchemy/common/gpiolib.c:100:12: error: incompatible function pointer types initializing 'int (*)(struct gpio_chip *, unsigned int, int)' with an expression of type 'void (struct gpio_chip *, unsigned int, int)' [-Wincompatible-function-pointer-types]
    drivers/gpio/gpio-macsmc.c:264:12: error: no member named 'set_rv' in 'struct gpio_chip'
    drivers/gpio/gpio-macsmc.c:264:18: error: 'struct gpio_chip' has no member named 'set_rv'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm64-allmodconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:no-member-named-set_rv-in-struct-gpio_chip
|-- loongarch-allmodconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:no-member-named-set_rv-in-struct-gpio_chip
|-- loongarch-allyesconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:no-member-named-set_rv-in-struct-gpio_chip
|-- mips-db1xxx_defconfig
|   `-- arch-mips-alchemy-common-gpiolib.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-gpio_chip-unsigned-int-int)-with-an-expression-of-type-void-(struct-gpio_chip-unsigned-int-int)
|-- powerpc-allmodconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:struct-gpio_chip-has-no-member-named-set_rv
|-- powerpc-allyesconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:no-member-named-set_rv-in-struct-gpio_chip
|-- riscv-allmodconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:no-member-named-set_rv-in-struct-gpio_chip
|-- riscv-allyesconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:no-member-named-set_rv-in-struct-gpio_chip
|-- sparc-allmodconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:struct-gpio_chip-has-no-member-named-set_rv
|-- sparc-allyesconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:struct-gpio_chip-has-no-member-named-set_rv
|-- um-allmodconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:no-member-named-set_rv-in-struct-gpio_chip
|-- um-allyesconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:struct-gpio_chip-has-no-member-named-set_rv
|-- x86_64-allmodconfig
|   `-- drivers-gpio-gpio-macsmc.c:error:no-member-named-set_rv-in-struct-gpio_chip
`-- x86_64-allyesconfig
    `-- drivers-gpio-gpio-macsmc.c:error:no-member-named-set_rv-in-struct-gpio_chip

elapsed time: 1123m

configs tested: 135
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250726    gcc-14.3.0
arc                   randconfig-002-20250726    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                             pxa_defconfig    gcc-15.1.0
arm                   randconfig-001-20250726    gcc-8.5.0
arm                   randconfig-002-20250726    gcc-10.5.0
arm                   randconfig-003-20250726    gcc-10.5.0
arm                   randconfig-004-20250726    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250726    gcc-8.5.0
arm64                 randconfig-002-20250726    clang-22
arm64                 randconfig-003-20250726    gcc-12.5.0
arm64                 randconfig-004-20250726    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250726    gcc-15.1.0
csky                  randconfig-002-20250726    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250726    clang-22
hexagon               randconfig-002-20250726    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250726    gcc-12
i386        buildonly-randconfig-002-20250726    gcc-12
i386        buildonly-randconfig-003-20250726    clang-20
i386        buildonly-randconfig-004-20250726    gcc-12
i386        buildonly-randconfig-005-20250726    clang-20
i386        buildonly-randconfig-006-20250726    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250726    gcc-15.1.0
loongarch             randconfig-002-20250726    gcc-14.3.0
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
nios2                 randconfig-001-20250726    gcc-8.5.0
nios2                 randconfig-002-20250726    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                 simple_smp_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250726    gcc-8.5.0
parisc                randconfig-002-20250726    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250726    clang-16
powerpc               randconfig-002-20250726    gcc-11.5.0
powerpc               randconfig-003-20250726    gcc-8.5.0
powerpc64             randconfig-001-20250726    clang-22
powerpc64             randconfig-002-20250726    gcc-10.5.0
powerpc64             randconfig-003-20250726    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250726    gcc-11.5.0
riscv                 randconfig-002-20250726    clang-17
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250726    clang-22
s390                  randconfig-002-20250726    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                        edosk7760_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250726    gcc-12.5.0
sh                    randconfig-002-20250726    gcc-9.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250726    gcc-8.5.0
sparc                 randconfig-002-20250726    gcc-15.1.0
sparc64                          alldefconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250726    clang-22
sparc64               randconfig-002-20250726    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250726    gcc-12
um                    randconfig-002-20250726    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250726    gcc-12
x86_64      buildonly-randconfig-002-20250726    gcc-12
x86_64      buildonly-randconfig-003-20250726    gcc-12
x86_64      buildonly-randconfig-004-20250726    clang-20
x86_64      buildonly-randconfig-005-20250726    clang-20
x86_64      buildonly-randconfig-006-20250726    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250726    gcc-8.5.0
xtensa                randconfig-002-20250726    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

