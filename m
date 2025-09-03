Return-Path: <linux-gpio+bounces-25458-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB1BB417BE
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 10:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 927687C3ADB
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 08:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102582D660B;
	Wed,  3 Sep 2025 08:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oxx+jc4S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE03E2AD2F
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 08:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886612; cv=none; b=dkaP3lqFmqO3E85jpnfU62M3vLN5Pkbpuk2fZRbF+rce+sPyphPjKrb8PHiIRNr8o9/Glx4p8vtvhQeuEmoy2FmGXixwtt3Px9RrzeyqpcK0CkQx+Uc4o1h5AMq+BVlOYA12NhH9Cg6ZZ4oGOJqZ/kCcoQUTHwjowVM0rzbzBBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886612; c=relaxed/simple;
	bh=QtsV7BJiuAVu/gZdfL/20RBWupLv8dupWL6lmQTvtuo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NyvxmKjo7Nn9a+M3tyUeDhL9aa31G1T3zzS+pa7DU4WbVQ+ChErlBQrhTwSBbDbyXBXuJKL1lddwUS9iUOeohRQYbujnExnznbnvgkTMiJFi71ksbOBnzk0Iy4Xt+rZOaujTpNK/lTrWArxfNCA6f7Fr2iqtKGsjmsJKLN84AXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oxx+jc4S; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756886611; x=1788422611;
  h=date:from:to:cc:subject:message-id;
  bh=QtsV7BJiuAVu/gZdfL/20RBWupLv8dupWL6lmQTvtuo=;
  b=Oxx+jc4SLkGs1/Si7NSVP1BzS2sRY3wnGY0eZZyFrKAU/1UTvbPur2dL
   iBcJQ/HU3hKHdU4A3fVhu330qd6u0iLJ7PVlaRxOXFk9vSLjNPtuo+38y
   nfPQVbOtXBwqRUKrnc9yONnFZ5nnTD7J/u8hjlSz3FlJtVxzRwzK8YX1K
   ZZGINEkhqbgc8kK0+Slo40VdxHmi9B1VIQ5TY+yl2V1au2ch0tfVkmk2l
   dFdeYllotoOFjJ6AU4wMuJZwTby1t0gbvVf1o8nsXWLfDYEhaU2jUVTK+
   egYqWreO8d01quoFtH9/Veyp8hOqMGqh0+RoZk4TEfEnfm8R57oy8BEU/
   Q==;
X-CSE-ConnectionGUID: lFKSs1X1SxyNNKHMKiK7lA==
X-CSE-MsgGUID: iZizdt9cQ2+2hj/gxb5zcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="76633681"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="76633681"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 01:03:31 -0700
X-CSE-ConnectionGUID: zjk3mjXcSSqpMsmu4AvTvg==
X-CSE-MsgGUID: ZT5eYkr3T02ZZgY4AcefFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="171486812"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 03 Sep 2025 01:03:28 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utiSE-0003YV-03;
	Wed, 03 Sep 2025 08:02:57 +0000
Date: Wed, 03 Sep 2025 16:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 ef9f21c3f370bcd45688a3a573b788e39b364e80
Message-ID: <202509031640.nmG7SEwt-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: ef9f21c3f370bcd45688a3a573b788e39b364e80  gpio: fix GPIO submenu in Kconfig

elapsed time: 1276m

configs tested: 193
configs skipped: 4

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
arc                   randconfig-001-20250902    gcc-11.5.0
arc                   randconfig-001-20250903    gcc-8.5.0
arc                   randconfig-002-20250902    gcc-9.5.0
arc                   randconfig-002-20250903    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250902    gcc-15.1.0
arm                   randconfig-001-20250903    gcc-8.5.0
arm                   randconfig-002-20250902    gcc-8.5.0
arm                   randconfig-002-20250903    gcc-8.5.0
arm                   randconfig-003-20250902    clang-22
arm                   randconfig-003-20250903    gcc-8.5.0
arm                   randconfig-004-20250902    clang-22
arm                   randconfig-004-20250903    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250902    gcc-8.5.0
arm64                 randconfig-001-20250903    gcc-8.5.0
arm64                 randconfig-002-20250902    clang-22
arm64                 randconfig-002-20250903    gcc-8.5.0
arm64                 randconfig-003-20250902    gcc-12.5.0
arm64                 randconfig-003-20250903    gcc-8.5.0
arm64                 randconfig-004-20250902    clang-22
arm64                 randconfig-004-20250903    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250902    gcc-14.3.0
csky                  randconfig-002-20250902    gcc-12.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250902    clang-18
hexagon               randconfig-002-20250902    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-13
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-13
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-13
i386        buildonly-randconfig-001-20250902    clang-20
i386        buildonly-randconfig-001-20250903    clang-20
i386        buildonly-randconfig-002-20250902    clang-20
i386        buildonly-randconfig-002-20250903    clang-20
i386        buildonly-randconfig-003-20250902    gcc-12
i386        buildonly-randconfig-003-20250903    clang-20
i386        buildonly-randconfig-004-20250902    clang-20
i386        buildonly-randconfig-004-20250903    clang-20
i386        buildonly-randconfig-005-20250902    gcc-12
i386        buildonly-randconfig-005-20250903    clang-20
i386        buildonly-randconfig-006-20250902    clang-20
i386        buildonly-randconfig-006-20250903    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250903    gcc-12
i386                  randconfig-002-20250903    gcc-12
i386                  randconfig-003-20250903    gcc-12
i386                  randconfig-004-20250903    gcc-12
i386                  randconfig-005-20250903    gcc-12
i386                  randconfig-006-20250903    gcc-12
i386                  randconfig-007-20250903    gcc-12
i386                  randconfig-011-20250903    gcc-12
i386                  randconfig-012-20250903    gcc-12
i386                  randconfig-013-20250903    gcc-12
i386                  randconfig-014-20250903    gcc-12
i386                  randconfig-015-20250903    gcc-12
i386                  randconfig-016-20250903    gcc-12
i386                  randconfig-017-20250903    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250902    clang-22
loongarch             randconfig-002-20250902    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250902    gcc-9.5.0
nios2                 randconfig-002-20250902    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250902    gcc-8.5.0
parisc                randconfig-002-20250902    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20250902    gcc-9.5.0
powerpc               randconfig-002-20250902    gcc-8.5.0
powerpc               randconfig-003-20250902    gcc-11.5.0
powerpc64             randconfig-001-20250902    gcc-12.5.0
powerpc64             randconfig-002-20250902    clang-22
powerpc64             randconfig-003-20250902    clang-22
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                 randconfig-001-20250902    gcc-13.4.0
riscv                 randconfig-002-20250902    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250902    clang-22
s390                  randconfig-002-20250902    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250902    gcc-12.5.0
sh                    randconfig-002-20250902    gcc-12.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250902    gcc-14.3.0
sparc                 randconfig-002-20250902    gcc-8.5.0
sparc64               randconfig-001-20250902    clang-20
sparc64               randconfig-002-20250902    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                    randconfig-001-20250902    gcc-12
um                    randconfig-002-20250902    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250902    clang-20
x86_64      buildonly-randconfig-001-20250903    clang-20
x86_64      buildonly-randconfig-002-20250902    clang-20
x86_64      buildonly-randconfig-002-20250903    clang-20
x86_64      buildonly-randconfig-003-20250902    clang-20
x86_64      buildonly-randconfig-003-20250903    clang-20
x86_64      buildonly-randconfig-004-20250902    gcc-12
x86_64      buildonly-randconfig-004-20250903    clang-20
x86_64      buildonly-randconfig-005-20250902    gcc-12
x86_64      buildonly-randconfig-005-20250903    clang-20
x86_64      buildonly-randconfig-006-20250902    gcc-12
x86_64      buildonly-randconfig-006-20250903    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250903    clang-20
x86_64                randconfig-002-20250903    clang-20
x86_64                randconfig-003-20250903    clang-20
x86_64                randconfig-004-20250903    clang-20
x86_64                randconfig-005-20250903    clang-20
x86_64                randconfig-006-20250903    clang-20
x86_64                randconfig-007-20250903    clang-20
x86_64                randconfig-008-20250903    clang-20
x86_64                randconfig-071-20250903    clang-20
x86_64                randconfig-072-20250903    clang-20
x86_64                randconfig-073-20250903    clang-20
x86_64                randconfig-074-20250903    clang-20
x86_64                randconfig-075-20250903    clang-20
x86_64                randconfig-076-20250903    clang-20
x86_64                randconfig-077-20250903    clang-20
x86_64                randconfig-078-20250903    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250902    gcc-9.5.0
xtensa                randconfig-002-20250902    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

