Return-Path: <linux-gpio+bounces-9211-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAB8960741
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 12:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B46E1F2387D
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 10:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB0D19DF9F;
	Tue, 27 Aug 2024 10:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQHC1qN/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEA519B5BD
	for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 10:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753899; cv=none; b=IhdM3r1bIyXjwigiUkZ9JDQyNOSFrQWA2f0gN43w/KNFWQCfnRq5grYdju6PkUX9FjHHOVEaWJoIDJ1nXS+RYFIh/CFh/hboYyGtCn7NiKbdwvxgojRmnqVm5HiPJ42UsQQev3sMLRZJvLfTj/F8miDqpWxbLPLgqpUh9FtZNfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753899; c=relaxed/simple;
	bh=W+d2ltlKH6At9sXJLXBZ07c6sthdkwEAtppNq3bw9Uo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FJmqAOhllMaPqTjavlQRiPiNwD2qqEBrvEQsh3wQOCjpec1YvzDm1Hok9z0yv4RZ5C5yoCCL3RUJkCgslk9ncZMmoD/xWn4ppf2q9vHas4PTrQNEpug/pTKrFIaR7pJl8TKDR1IBu5uOj3AUTgyKGK1DR+9+D+KTJm6caKmcDKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZQHC1qN/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724753897; x=1756289897;
  h=date:from:to:cc:subject:message-id;
  bh=W+d2ltlKH6At9sXJLXBZ07c6sthdkwEAtppNq3bw9Uo=;
  b=ZQHC1qN/ZPLJ+aotf9HFajLiozPYK6HzDShCfCZpTiZTojXeSxw2xq0U
   ch5G0szQ2X25QHY9zeO+8yxbE00TUjnLWn2RZdB45j9U6BiAyDgwaHEN3
   KPyR/mgGrpNfQZ8IShwkShnjMGiMxZGesA0eRJEf2mCHegcWTVEk/zSR1
   Mh/LoBOZkqlpSUzvd0KXV4Vj2le9oX7AnKPynj2IdmYFrjhuFNTZjy5aO
   wbO+zpFu4rz/sjRcbh+fD3MviGAao/AE0qeFr/GypRwrnRHXI33iiianS
   TUetMwRcTYAirtJaZpcGh+Yawr2BYHlt6N/l3GBl7jRXQnCLp8Ohu0EFo
   A==;
X-CSE-ConnectionGUID: JQh8G13sQEKMNQ6NXLsf/Q==
X-CSE-MsgGUID: pv3KvKmJS1Kfj5Aac/lT4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23026125"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="23026125"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 03:18:17 -0700
X-CSE-ConnectionGUID: HMuFlop9TsyPZQboZYSxgw==
X-CSE-MsgGUID: iv9upS6CTZmYuwJGykE0jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="62978880"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Aug 2024 03:18:14 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sitHA-000IVY-2b;
	Tue, 27 Aug 2024 10:18:12 +0000
Date: Tue, 27 Aug 2024 18:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 00367afae6bd3640c2a810eeac78ea4b325315c9
Message-ID: <202408271852.CvhTgR9e-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 00367afae6bd3640c2a810eeac78ea4b325315c9  Merge branch 'devel' into for-next

elapsed time: 1474m

configs tested: 229
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240827   gcc-13.2.0
arc                   randconfig-002-20240827   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                      footbridge_defconfig   clang-20
arm                         nhk8815_defconfig   clang-20
arm                           omap1_defconfig   clang-20
arm                   randconfig-001-20240827   clang-20
arm                   randconfig-001-20240827   gcc-13.2.0
arm                   randconfig-002-20240827   gcc-13.2.0
arm                   randconfig-002-20240827   gcc-14.1.0
arm                   randconfig-003-20240827   clang-20
arm                   randconfig-003-20240827   gcc-13.2.0
arm                   randconfig-004-20240827   gcc-13.2.0
arm                   randconfig-004-20240827   gcc-14.1.0
arm                         s5pv210_defconfig   clang-20
arm                          sp7021_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240827   gcc-13.2.0
arm64                 randconfig-001-20240827   gcc-14.1.0
arm64                 randconfig-002-20240827   gcc-13.2.0
arm64                 randconfig-003-20240827   gcc-13.2.0
arm64                 randconfig-004-20240827   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240827   gcc-13.2.0
csky                  randconfig-001-20240827   gcc-14.1.0
csky                  randconfig-002-20240827   gcc-13.2.0
csky                  randconfig-002-20240827   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240827   clang-20
hexagon               randconfig-002-20240827   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240827   gcc-12
i386         buildonly-randconfig-002-20240827   clang-18
i386         buildonly-randconfig-003-20240827   gcc-12
i386         buildonly-randconfig-004-20240827   clang-18
i386         buildonly-randconfig-005-20240827   clang-18
i386         buildonly-randconfig-006-20240827   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240827   gcc-12
i386                  randconfig-002-20240827   gcc-12
i386                  randconfig-003-20240827   gcc-12
i386                  randconfig-004-20240827   gcc-12
i386                  randconfig-005-20240827   gcc-12
i386                  randconfig-006-20240827   clang-18
i386                  randconfig-011-20240827   clang-18
i386                  randconfig-012-20240827   clang-18
i386                  randconfig-013-20240827   clang-18
i386                  randconfig-014-20240827   gcc-12
i386                  randconfig-015-20240827   gcc-12
i386                  randconfig-016-20240827   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240827   gcc-13.2.0
loongarch             randconfig-001-20240827   gcc-14.1.0
loongarch             randconfig-002-20240827   gcc-13.2.0
loongarch             randconfig-002-20240827   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                           ci20_defconfig   clang-20
mips                  maltasmvp_eva_defconfig   clang-20
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240827   gcc-13.2.0
nios2                 randconfig-001-20240827   gcc-14.1.0
nios2                 randconfig-002-20240827   gcc-13.2.0
nios2                 randconfig-002-20240827   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240827   gcc-13.2.0
parisc                randconfig-001-20240827   gcc-14.1.0
parisc                randconfig-002-20240827   gcc-13.2.0
parisc                randconfig-002-20240827   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                        cell_defconfig   clang-20
powerpc                        icon_defconfig   clang-20
powerpc               randconfig-001-20240827   clang-14
powerpc               randconfig-001-20240827   gcc-13.2.0
powerpc               randconfig-002-20240827   gcc-13.2.0
powerpc               randconfig-002-20240827   gcc-14.1.0
powerpc               randconfig-003-20240827   gcc-13.2.0
powerpc                     sequoia_defconfig   clang-20
powerpc64             randconfig-001-20240827   gcc-13.2.0
powerpc64             randconfig-001-20240827   gcc-14.1.0
powerpc64             randconfig-002-20240827   gcc-13.2.0
powerpc64             randconfig-002-20240827   gcc-14.1.0
powerpc64             randconfig-003-20240827   clang-14
powerpc64             randconfig-003-20240827   gcc-13.2.0
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240827   clang-20
riscv                 randconfig-001-20240827   gcc-13.2.0
riscv                 randconfig-002-20240827   gcc-13.2.0
riscv                 randconfig-002-20240827   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240827   clang-20
s390                  randconfig-001-20240827   gcc-13.2.0
s390                  randconfig-002-20240827   gcc-13.2.0
s390                  randconfig-002-20240827   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240827   gcc-13.2.0
sh                    randconfig-001-20240827   gcc-14.1.0
sh                    randconfig-002-20240827   gcc-13.2.0
sh                    randconfig-002-20240827   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240827   gcc-13.2.0
sparc64               randconfig-001-20240827   gcc-14.1.0
sparc64               randconfig-002-20240827   gcc-13.2.0
sparc64               randconfig-002-20240827   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240827   gcc-12
um                    randconfig-001-20240827   gcc-13.2.0
um                    randconfig-002-20240827   gcc-12
um                    randconfig-002-20240827   gcc-13.2.0
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240827   clang-18
x86_64       buildonly-randconfig-002-20240827   clang-18
x86_64       buildonly-randconfig-002-20240827   gcc-12
x86_64       buildonly-randconfig-003-20240827   clang-18
x86_64       buildonly-randconfig-003-20240827   gcc-12
x86_64       buildonly-randconfig-004-20240827   clang-18
x86_64       buildonly-randconfig-004-20240827   gcc-12
x86_64       buildonly-randconfig-005-20240827   clang-18
x86_64       buildonly-randconfig-006-20240827   clang-18
x86_64       buildonly-randconfig-006-20240827   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240827   clang-18
x86_64                randconfig-002-20240827   clang-18
x86_64                randconfig-002-20240827   gcc-12
x86_64                randconfig-003-20240827   clang-18
x86_64                randconfig-003-20240827   gcc-12
x86_64                randconfig-004-20240827   clang-18
x86_64                randconfig-004-20240827   gcc-12
x86_64                randconfig-005-20240827   clang-18
x86_64                randconfig-006-20240827   clang-18
x86_64                randconfig-006-20240827   gcc-12
x86_64                randconfig-011-20240827   clang-18
x86_64                randconfig-011-20240827   gcc-12
x86_64                randconfig-012-20240827   clang-18
x86_64                randconfig-012-20240827   gcc-12
x86_64                randconfig-013-20240827   clang-18
x86_64                randconfig-013-20240827   gcc-12
x86_64                randconfig-014-20240827   clang-18
x86_64                randconfig-015-20240827   clang-18
x86_64                randconfig-015-20240827   gcc-12
x86_64                randconfig-016-20240827   clang-18
x86_64                randconfig-016-20240827   gcc-12
x86_64                randconfig-071-20240827   clang-18
x86_64                randconfig-071-20240827   gcc-12
x86_64                randconfig-072-20240827   clang-18
x86_64                randconfig-072-20240827   gcc-11
x86_64                randconfig-073-20240827   clang-18
x86_64                randconfig-073-20240827   gcc-12
x86_64                randconfig-074-20240827   clang-18
x86_64                randconfig-074-20240827   gcc-12
x86_64                randconfig-075-20240827   clang-18
x86_64                randconfig-076-20240827   clang-18
x86_64                randconfig-076-20240827   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240827   gcc-13.2.0
xtensa                randconfig-001-20240827   gcc-14.1.0
xtensa                randconfig-002-20240827   gcc-13.2.0
xtensa                randconfig-002-20240827   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

