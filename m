Return-Path: <linux-gpio+bounces-21132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C88EEAD2BA0
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 03:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83D1316D02F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 01:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776031A5BBC;
	Tue, 10 Jun 2025 01:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlVYG5nx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D8813790B
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 01:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749520431; cv=none; b=cNI0FjE4EkiljIZ5O4oNANRxsq04A6jGKOeHotQk8OkpoPrdwjDOLdDE4cWoc6H4HrNbOsw29OgFVK/BE6GZpBHqKfy1/mCSta3CYAryeMKPSvLt/wInDAZLyOAwDcMHDk3GDSBYyCmZrZ5bBeIbaY/wkUDgL17+55/s0E/0294=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749520431; c=relaxed/simple;
	bh=7oF/WHvCXi/d6PsvEQr+nHn0amuMQk/7Ksy7vmPZUeA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lLVUE4nQ9ulP9kGhRLWwBBL5Sm9Tv72yMf2gceI+DulH2zseRT19NWrb4CEymP82lqqMlOG1CuFQCPQ4cUBMXatjhLJYk1GRhU0gDcfKglk3siy7E6UgoPQEXdqoOEaUSbmNfGM2EmKocAJ6lInGusQfFLWGPdZhcCic5ka3XDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XlVYG5nx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749520429; x=1781056429;
  h=date:from:to:cc:subject:message-id;
  bh=7oF/WHvCXi/d6PsvEQr+nHn0amuMQk/7Ksy7vmPZUeA=;
  b=XlVYG5nxy1HAr6607Gv74EqVz8mYhN4QbuC/C4bmfCa4p4YCiahShNm0
   3oDQMfVgAHyXwqeqi5hW17bXph/zXDRr/1LRHup+su3tJA9ivY89EjxsU
   yxOilkcbnJc2IeDdUCWBXz2afa10FvfZum32Mvvm4wWnT5G7JcyBKg0rw
   o3fHovc1NGxQDeOsoq2SRB5BkxyoOK06w1g5GwYsLYMoD1YgA48v7dCgi
   5Ssp9NZFtt70RMBTohE8YMEaYBl8qPqNpJGIq59lYxIrvDNfaDUxAxkJE
   henVp8j3YS7lj0OOU3runqqsXK/hFrixr2gC0Fuwse3U626B8jYepwGxx
   Q==;
X-CSE-ConnectionGUID: 3wy9CUZIRg6BJaY0JmwlUg==
X-CSE-MsgGUID: GQeQTi0pTKes677XKDxH4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="39232705"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="39232705"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 18:53:48 -0700
X-CSE-ConnectionGUID: KXM4gnheTRaj56uGKfIl0Q==
X-CSE-MsgGUID: LSm+IKGyQKmN1XK3Cx7wHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="169861482"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jun 2025 18:53:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOoBN-0007cv-1E;
	Tue, 10 Jun 2025 01:53:45 +0000
Date: Tue, 10 Jun 2025 09:53:28 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 24b0277c1c539cd41539d9297baafc62df04464a
Message-ID: <202506100918.UDGMtwiP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 24b0277c1c539cd41539d9297baafc62df04464a  pinctrl: tb10x: Drop of_match_ptr for ID table

elapsed time: 968m

configs tested: 255
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250609    gcc-12.4.0
arc                   randconfig-001-20250610    gcc-12.4.0
arc                   randconfig-002-20250609    gcc-10.5.0
arc                   randconfig-002-20250610    gcc-12.4.0
arc                           tb10x_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                          collie_defconfig    gcc-15.1.0
arm                     davinci_all_defconfig    gcc-15.1.0
arm                          exynos_defconfig    clang-21
arm                      footbridge_defconfig    clang-17
arm                      integrator_defconfig    gcc-15.1.0
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                         lpc32xx_defconfig    gcc-15.1.0
arm                        multi_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20250609    clang-21
arm                   randconfig-001-20250610    gcc-12.4.0
arm                   randconfig-002-20250609    clang-17
arm                   randconfig-002-20250610    gcc-12.4.0
arm                   randconfig-003-20250609    clang-21
arm                   randconfig-003-20250610    gcc-12.4.0
arm                   randconfig-004-20250609    gcc-8.5.0
arm                   randconfig-004-20250610    gcc-12.4.0
arm                             rpc_defconfig    gcc-15.1.0
arm                         s3c6400_defconfig    gcc-15.1.0
arm                           sama5_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250609    clang-21
arm64                 randconfig-001-20250610    gcc-12.4.0
arm64                 randconfig-002-20250609    clang-21
arm64                 randconfig-002-20250610    gcc-12.4.0
arm64                 randconfig-003-20250609    gcc-14.3.0
arm64                 randconfig-003-20250610    gcc-12.4.0
arm64                 randconfig-004-20250609    gcc-9.5.0
arm64                 randconfig-004-20250610    gcc-12.4.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250609    gcc-15.1.0
csky                  randconfig-001-20250610    gcc-15.1.0
csky                  randconfig-002-20250609    gcc-12.4.0
csky                  randconfig-002-20250610    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250609    clang-20
hexagon               randconfig-001-20250610    gcc-15.1.0
hexagon               randconfig-002-20250609    clang-21
hexagon               randconfig-002-20250610    gcc-15.1.0
i386                             alldefconfig    gcc-12
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250609    clang-20
i386        buildonly-randconfig-001-20250610    clang-20
i386        buildonly-randconfig-002-20250609    clang-20
i386        buildonly-randconfig-002-20250610    clang-20
i386        buildonly-randconfig-003-20250609    clang-20
i386        buildonly-randconfig-003-20250610    clang-20
i386        buildonly-randconfig-004-20250609    clang-20
i386        buildonly-randconfig-004-20250610    clang-20
i386        buildonly-randconfig-005-20250609    clang-20
i386        buildonly-randconfig-005-20250610    clang-20
i386        buildonly-randconfig-006-20250609    gcc-12
i386        buildonly-randconfig-006-20250610    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250610    clang-20
i386                  randconfig-002-20250610    clang-20
i386                  randconfig-003-20250610    clang-20
i386                  randconfig-004-20250610    clang-20
i386                  randconfig-005-20250610    clang-20
i386                  randconfig-006-20250610    clang-20
i386                  randconfig-007-20250610    clang-20
i386                  randconfig-011-20250610    clang-20
i386                  randconfig-012-20250610    clang-20
i386                  randconfig-013-20250610    clang-20
i386                  randconfig-014-20250610    clang-20
i386                  randconfig-015-20250610    clang-20
i386                  randconfig-016-20250610    clang-20
i386                  randconfig-017-20250610    clang-20
loongarch                        alldefconfig    gcc-15.1.0
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                 loongson3_defconfig    gcc-15.1.0
loongarch             randconfig-001-20250609    gcc-15.1.0
loongarch             randconfig-001-20250610    gcc-15.1.0
loongarch             randconfig-002-20250609    gcc-12.4.0
loongarch             randconfig-002-20250610    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          atari_defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         db1xxx_defconfig    gcc-15.1.0
mips                        qi_lb60_defconfig    clang-21
nios2                         10m50_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                 randconfig-001-20250609    gcc-8.5.0
nios2                 randconfig-001-20250610    gcc-15.1.0
nios2                 randconfig-002-20250609    gcc-8.5.0
nios2                 randconfig-002-20250610    gcc-15.1.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20250609    gcc-8.5.0
parisc                randconfig-001-20250610    gcc-15.1.0
parisc                randconfig-002-20250609    gcc-8.5.0
parisc                randconfig-002-20250610    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    gcc-15.1.0
powerpc                     mpc512x_defconfig    gcc-15.1.0
powerpc                  mpc866_ads_defconfig    gcc-15.1.0
powerpc                      ppc6xx_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250609    clang-21
powerpc               randconfig-001-20250610    gcc-15.1.0
powerpc               randconfig-002-20250609    clang-21
powerpc               randconfig-002-20250610    gcc-15.1.0
powerpc               randconfig-003-20250609    gcc-9.3.0
powerpc               randconfig-003-20250610    gcc-15.1.0
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc                     tqm8560_defconfig    gcc-15.1.0
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250609    clang-21
powerpc64             randconfig-001-20250610    gcc-15.1.0
powerpc64             randconfig-002-20250609    clang-21
powerpc64             randconfig-002-20250610    gcc-15.1.0
powerpc64             randconfig-003-20250609    clang-21
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20250609    gcc-12.4.0
riscv                 randconfig-001-20250610    gcc-9.3.0
riscv                 randconfig-002-20250609    clang-21
riscv                 randconfig-002-20250610    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250609    clang-21
s390                  randconfig-001-20250610    gcc-9.3.0
s390                  randconfig-002-20250609    clang-21
s390                  randconfig-002-20250610    gcc-9.3.0
s390                       zfcpdump_defconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                               j2_defconfig    gcc-15.1.0
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                     magicpanelr2_defconfig    gcc-15.1.0
sh                    randconfig-001-20250609    gcc-11.5.0
sh                    randconfig-001-20250610    gcc-9.3.0
sh                    randconfig-002-20250609    gcc-13.3.0
sh                    randconfig-002-20250610    gcc-9.3.0
sh                   rts7751r2dplus_defconfig    gcc-15.1.0
sh                          urquell_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250609    gcc-15.1.0
sparc                 randconfig-001-20250610    gcc-9.3.0
sparc                 randconfig-002-20250609    gcc-15.1.0
sparc                 randconfig-002-20250610    gcc-9.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250609    gcc-12.4.0
sparc64               randconfig-001-20250610    gcc-9.3.0
sparc64               randconfig-002-20250609    gcc-9.3.0
sparc64               randconfig-002-20250610    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250609    clang-21
um                    randconfig-001-20250610    gcc-9.3.0
um                    randconfig-002-20250609    gcc-12
um                    randconfig-002-20250610    gcc-9.3.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250609    clang-20
x86_64      buildonly-randconfig-001-20250610    gcc-12
x86_64      buildonly-randconfig-002-20250609    gcc-12
x86_64      buildonly-randconfig-002-20250610    gcc-12
x86_64      buildonly-randconfig-003-20250609    clang-20
x86_64      buildonly-randconfig-003-20250610    gcc-12
x86_64      buildonly-randconfig-004-20250609    clang-20
x86_64      buildonly-randconfig-004-20250610    gcc-12
x86_64      buildonly-randconfig-005-20250609    clang-20
x86_64      buildonly-randconfig-005-20250610    gcc-12
x86_64      buildonly-randconfig-006-20250609    gcc-12
x86_64      buildonly-randconfig-006-20250610    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250610    clang-20
x86_64                randconfig-002-20250610    clang-20
x86_64                randconfig-003-20250610    clang-20
x86_64                randconfig-004-20250610    clang-20
x86_64                randconfig-005-20250610    clang-20
x86_64                randconfig-006-20250610    clang-20
x86_64                randconfig-007-20250610    clang-20
x86_64                randconfig-008-20250610    clang-20
x86_64                randconfig-071-20250610    clang-20
x86_64                randconfig-072-20250610    clang-20
x86_64                randconfig-073-20250610    clang-20
x86_64                randconfig-074-20250610    clang-20
x86_64                randconfig-075-20250610    clang-20
x86_64                randconfig-076-20250610    clang-20
x86_64                randconfig-077-20250610    clang-20
x86_64                randconfig-078-20250610    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250609    gcc-11.5.0
xtensa                randconfig-001-20250610    gcc-9.3.0
xtensa                randconfig-002-20250609    gcc-8.5.0
xtensa                randconfig-002-20250610    gcc-9.3.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

