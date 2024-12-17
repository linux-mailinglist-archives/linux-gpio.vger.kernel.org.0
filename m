Return-Path: <linux-gpio+bounces-13938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE79B9F4584
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 08:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D83BC7A16DA
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 07:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3361CCEF8;
	Tue, 17 Dec 2024 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldjJY7da"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC578145B39
	for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 07:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734421993; cv=none; b=SBrit7guYCpBzNqDA09BzYCXLUaBobR3o80gWweq7KYoqy7jr2RmwAtP2jaHdAlM6LyS7lYPTf0NsTVDtJLXImAnkO4+6lYKcsZB6plo90lHyCcF23JyW8o35WXl4xDG9WPogmGRRLBYJKTe1oxqjpdm14CJAUPPfXaigfV9lX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734421993; c=relaxed/simple;
	bh=DNL2j32qUcIaV/SbZ1BjYR+4u2vMMxnSj3y1cEy9PsA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hho8qR/r6wO6bCDtDJ7dZ/DHDiDOuIyMsN0nULTTNVt4/+C3bS+Fu14myyOkUVd987sDO3BGCJ3K6K1SaLDwu1UaE+A9GZzEttres1UNvMxvCqtNV/TCoPjcd8uVETi5FGqvZEe5fkRbq5NQfcJx2fUA40Niar0kNes8fQg1wUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldjJY7da; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734421991; x=1765957991;
  h=date:from:to:cc:subject:message-id;
  bh=DNL2j32qUcIaV/SbZ1BjYR+4u2vMMxnSj3y1cEy9PsA=;
  b=ldjJY7dajN43ToDyfjAYzmS3XSLKGxM09ByHHHyhDJS9ky5PhxVsSTy1
   f9ztTT6jGLDx2ZQJJDpcGvUuO1+J1z91/avTgSvFs8xzfDm7rNtkcEocM
   WDDzW4lZ1Sy+UUQA6RN3QNmv3snitrHdfimOikiUDJs0f84SEEbcriUtO
   nVajs51XG0RPyKq+dPYPreXiOg6PzFh7clvCJjvsQajMrHgwuRAC+W/xj
   7/b5qq6OmOKjOecPprhFHr6eySLzwcgJHMwDv/kb/1g60SlIKfVGf7sQ5
   gJjpi3wb24zJ/8MvhVcKIDH0yErvWb4kVvrDAVvnfIwWwGnI91QqSUXfy
   A==;
X-CSE-ConnectionGUID: vawUVqqvRb+m7HHuf2U42A==
X-CSE-MsgGUID: Ofn2WgAtSf6bupvmrCjuHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34126664"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="34126664"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 23:53:11 -0800
X-CSE-ConnectionGUID: vTrr5+DGTR2wysjk9oJIJA==
X-CSE-MsgGUID: ObpkFqtTQCqmvVhxsRhXfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="102303653"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Dec 2024 23:53:10 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNSOB-000Eng-2u;
	Tue, 17 Dec 2024 07:53:07 +0000
Date: Tue, 17 Dec 2024 15:52:09 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 83a9752729c455a6bd9b7cf62198506180691931
Message-ID: <202412171503.NLBGaVKM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 83a9752729c455a6bd9b7cf62198506180691931  dt-bindings: gpio: brcmstb: permit gpio-line-names property

elapsed time: 1300m

configs tested: 111
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241216    gcc-13.2.0
arc                   randconfig-002-20241216    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                          pxa168_defconfig    clang-16
arm                   randconfig-001-20241216    clang-15
arm                   randconfig-002-20241216    gcc-14.2.0
arm                   randconfig-003-20241216    clang-20
arm                   randconfig-004-20241216    clang-17
arm                         s5pv210_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241216    gcc-14.2.0
arm64                 randconfig-002-20241216    clang-20
arm64                 randconfig-003-20241216    gcc-14.2.0
arm64                 randconfig-004-20241216    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241216    gcc-14.2.0
csky                  randconfig-002-20241216    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20241216    clang-20
hexagon               randconfig-002-20241216    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241216    clang-19
i386        buildonly-randconfig-002-20241216    clang-19
i386        buildonly-randconfig-003-20241216    clang-19
i386        buildonly-randconfig-004-20241216    clang-19
i386        buildonly-randconfig-005-20241216    clang-19
i386        buildonly-randconfig-006-20241216    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241216    gcc-14.2.0
loongarch             randconfig-002-20241216    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241216    gcc-14.2.0
nios2                 randconfig-002-20241216    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241216    gcc-14.2.0
parisc                randconfig-002-20241216    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241216    clang-20
powerpc               randconfig-002-20241216    clang-20
powerpc               randconfig-003-20241216    gcc-14.2.0
powerpc64             randconfig-001-20241216    clang-20
powerpc64             randconfig-002-20241216    clang-15
powerpc64             randconfig-003-20241216    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                    nommu_virt_defconfig    clang-20
riscv                 randconfig-001-20241216    clang-20
riscv                 randconfig-002-20241216    clang-15
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241216    gcc-14.2.0
s390                  randconfig-002-20241216    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241216    gcc-14.2.0
sh                    randconfig-002-20241216    gcc-14.2.0
sh                           se7750_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241216    gcc-14.2.0
sparc                 randconfig-002-20241216    gcc-14.2.0
sparc64               randconfig-001-20241216    gcc-14.2.0
sparc64               randconfig-002-20241216    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20241216    gcc-12
um                    randconfig-002-20241216    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241216    gcc-12
x86_64      buildonly-randconfig-002-20241216    gcc-12
x86_64      buildonly-randconfig-003-20241216    clang-19
x86_64      buildonly-randconfig-004-20241216    clang-19
x86_64      buildonly-randconfig-005-20241216    clang-19
x86_64      buildonly-randconfig-006-20241216    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241216    gcc-14.2.0
xtensa                randconfig-002-20241216    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

