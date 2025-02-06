Return-Path: <linux-gpio+bounces-15423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D89A2A3FC
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 10:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2660163278
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 09:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1477225A48;
	Thu,  6 Feb 2025 09:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dumv3aR/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEF7225A45
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 09:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738833476; cv=none; b=Plf+59TrALDilP20W4N29XW8Db/ey3W+K7uo0sx7kqzGE3J5s2MiNoKBP6WG6lJ6XHY9wSdbksFqG9aT9MoNA4lOSoLsMQCUZuajdadcBlCqbO/UZJ6HPMsefNL3DolNnMSJX16EcelLewk5vXpv8OUYmJ0QufjJbNsHkJPm844=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738833476; c=relaxed/simple;
	bh=CaOU75mX3YgoeknXvJgZ0RdZyrrDVKc0qqOI4Md6VEU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p9cIcar7LhYfDO2Y/uB9JncV/aXD6ilXQsCwBsuQzT2HEpwcGOWOEUPCW53G2kKDb4ph7xX2Mg34Kfb/xDH1DAi2q+YThLuW9heIAwdXmbABi9zHr6CIjwefSFTGZR16NaP3uuHseYubN0leBswMWy5DzBbkfqVat8jhln9uhVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dumv3aR/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738833475; x=1770369475;
  h=date:from:to:cc:subject:message-id;
  bh=CaOU75mX3YgoeknXvJgZ0RdZyrrDVKc0qqOI4Md6VEU=;
  b=dumv3aR/TwLjTxgD/1ZhKeVX/L3IBWuZZQW+sG8BOoAxfNDVBCeXvVeE
   JYDduVKq0HsaQnC+WTn7U2pZdcMEAOJYZfs+72gl6Jq2Fo6ixuYMGGFNV
   GOG61Proq+OykJZvxNvDPvnTQhE1kkj3do3ZRnGBXmEOalt9MGDjBjq7D
   oz9Q7FuuQqBokpzFc5TTKwJfpmSdwNx2axmseYZkJ0tQNOKBlWvP4mHra
   vK7P3XRALE61c6+BzmbSun0LbL4DLY0MT5tHkG83ApstLXvjWerYbGwpg
   Ky4oHiOFr+697ZObakcnkpfwCzZ4yJYqQP78LCS30JVw4uWPFikWj80Co
   w==;
X-CSE-ConnectionGUID: sDJHBX5SRJSWlnhlBwp71A==
X-CSE-MsgGUID: TPWN0ZXNQUuvvI+DYQjGpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61903409"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="61903409"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:17:54 -0800
X-CSE-ConnectionGUID: IWBEkoUCTeuDaSdwg2jLwA==
X-CSE-MsgGUID: CDPgNT7CQDOUbeTD/d3xlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134386195"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Feb 2025 01:17:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfy18-000wfL-1L;
	Thu, 06 Feb 2025 09:17:50 +0000
Date: Thu, 06 Feb 2025 17:17:19 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:at24/for-next] BUILD SUCCESS
 03480898cefe9cb5ba921dba9304703f7574b687
Message-ID: <202502061713.fyXhzQBH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git at24/for-next
branch HEAD: 03480898cefe9cb5ba921dba9304703f7574b687  dt-bindings: eeprom: at24: Add compatible for Giantec GT24P128E

elapsed time: 1450m

configs tested: 216
configs skipped: 4

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
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    clang-21
arm                         lpc18xx_defconfig    clang-19
arm                            mmp2_defconfig    clang-21
arm                            mmp2_defconfig    gcc-14.2.0
arm                   randconfig-001-20250205    gcc-14.2.0
arm                   randconfig-001-20250206    gcc-13.2.0
arm                   randconfig-002-20250205    gcc-14.2.0
arm                   randconfig-002-20250206    gcc-13.2.0
arm                   randconfig-003-20250205    clang-16
arm                   randconfig-003-20250206    gcc-13.2.0
arm                   randconfig-004-20250205    gcc-14.2.0
arm                   randconfig-004-20250206    gcc-13.2.0
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
csky                  randconfig-001-20250206    gcc-14.2.0
csky                  randconfig-002-20250205    gcc-14.2.0
csky                  randconfig-002-20250206    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250205    clang-17
hexagon               randconfig-001-20250206    gcc-14.2.0
hexagon               randconfig-002-20250205    clang-19
hexagon               randconfig-002-20250206    gcc-14.2.0
i386                             alldefconfig    gcc-12
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
loongarch             randconfig-001-20250206    gcc-14.2.0
loongarch             randconfig-002-20250205    gcc-14.2.0
loongarch             randconfig-002-20250206    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          rb532_defconfig    clang-17
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250205    gcc-14.2.0
nios2                 randconfig-001-20250206    gcc-14.2.0
nios2                 randconfig-002-20250205    gcc-14.2.0
nios2                 randconfig-002-20250206    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250205    gcc-14.2.0
parisc                randconfig-001-20250206    gcc-14.2.0
parisc                randconfig-002-20250205    gcc-14.2.0
parisc                randconfig-002-20250206    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    clang-16
powerpc                     asp8347_defconfig    clang-21
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                      ppc44x_defconfig    clang-21
powerpc               randconfig-001-20250205    clang-16
powerpc               randconfig-001-20250206    gcc-14.2.0
powerpc               randconfig-002-20250205    gcc-14.2.0
powerpc               randconfig-002-20250206    gcc-14.2.0
powerpc               randconfig-003-20250205    gcc-14.2.0
powerpc               randconfig-003-20250206    gcc-14.2.0
powerpc                  storcenter_defconfig    clang-21
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250205    clang-18
powerpc64             randconfig-001-20250206    gcc-14.2.0
powerpc64             randconfig-002-20250205    gcc-14.2.0
powerpc64             randconfig-002-20250206    gcc-14.2.0
powerpc64             randconfig-003-20250205    clang-18
powerpc64             randconfig-003-20250206    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250205    gcc-14.2.0
riscv                 randconfig-001-20250206    gcc-14.2.0
riscv                 randconfig-002-20250205    gcc-14.2.0
riscv                 randconfig-002-20250206    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
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
sh                    randconfig-001-20250205    gcc-14.2.0
sh                    randconfig-001-20250206    gcc-14.2.0
sh                    randconfig-002-20250205    gcc-14.2.0
sh                    randconfig-002-20250206    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    clang-21
sh                   secureedge5410_defconfig    gcc-14.2.0
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
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

