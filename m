Return-Path: <linux-gpio+bounces-25018-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ED6B37ABC
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 08:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79F34177192
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 06:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F3E1DEFF5;
	Wed, 27 Aug 2025 06:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GuFU6pbu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D1229CB48
	for <linux-gpio@vger.kernel.org>; Wed, 27 Aug 2025 06:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756277195; cv=none; b=Ue0EwRrlNDB0GxyRM9lKkFxxm73enYZIwiPXjpFNCOEqOvmkGBmKiIlPXsLIcVPEyqTVDca3KdkexEpUOcyij9veqgHVsRDlglfmblP/drvEOc1XKjUAku7Tj4g6QEm7A187s+mgeMzI7xEQj+9GfzMUBc9PZtWvYkycZypnnp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756277195; c=relaxed/simple;
	bh=pnwiLspbQMnMMWzM8b0z0K8IDIWWRXR+HUJrruhqtZ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ba25ckS2AvWSOfhPW7c+zib+xL0asKyhrixfOQg1lg2gHL+KJyJox+KOhEKZdwO72ShI14qhiVwzo7H6mqpVeObsjvAjtM99PUla7n+rREjyDmbll7X5vvGanKAO76m+rqfLLT4dDURHDFLNadJSEzsjL2D1i3M4yi4ZtK/+WVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GuFU6pbu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756277193; x=1787813193;
  h=date:from:to:cc:subject:message-id;
  bh=pnwiLspbQMnMMWzM8b0z0K8IDIWWRXR+HUJrruhqtZ0=;
  b=GuFU6pbue8Yqh/i6pU5n4Bu/4y0WUeGt8hNrI7kCuR1qvwk+Is2G6l5E
   ihuqxeeD4ihbeOW+yonpuBngAr3tChCdsIH5HXXfvqJLkCMrWshRTpmNi
   gvuL8ur+YBRTIUp5UODF6hXwsquiHSaFbzlURI4URlPGOEyL8ClFmnqj9
   10jE++UZUl0/ehCIPqvQBR58m2G1g/8MuzWw3Pe0giQ8WgHzvdb5/86l9
   Hl9JpS6pj2wANLo8uM7hRvEFYmnhlCtFwTFObspUwXbl/IEXmRB0o5RNR
   ZSuyB2B7xQG8EYkSVRUBm/PiZKko9eZU66zIRrz0DPYw3E6oss0BaWvdE
   A==;
X-CSE-ConnectionGUID: wwwyPRgQRwOACzBR97KrDA==
X-CSE-MsgGUID: oTo1yfoQT2O8IjsgcwISPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58380393"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="58380393"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 23:46:32 -0700
X-CSE-ConnectionGUID: zYo+Lo/XS6SkYmmscI3kMg==
X-CSE-MsgGUID: tvBpgyR6RtCYy3Vb6OsRRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="200659304"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 Aug 2025 23:46:30 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ur9vK-000SkN-1M;
	Wed, 27 Aug 2025 06:46:24 +0000
Date: Wed, 27 Aug 2025 14:45:24 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 6fe31c8b53003134e5573cfb89aea85f96a43afd
Message-ID: <202508271409.0hqS04Oh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 6fe31c8b53003134e5573cfb89aea85f96a43afd  MAINTAINERS: Change Altera-PIO driver maintainer

elapsed time: 1173m

configs tested: 229
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250826    gcc-11.5.0
arc                   randconfig-001-20250827    gcc-8.5.0
arc                   randconfig-002-20250826    gcc-8.5.0
arc                   randconfig-002-20250827    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                   randconfig-001-20250826    gcc-12.5.0
arm                   randconfig-001-20250827    gcc-8.5.0
arm                   randconfig-002-20250826    gcc-13.4.0
arm                   randconfig-002-20250827    gcc-8.5.0
arm                   randconfig-003-20250826    gcc-8.5.0
arm                   randconfig-003-20250827    gcc-8.5.0
arm                   randconfig-004-20250826    gcc-10.5.0
arm                   randconfig-004-20250827    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250826    clang-22
arm64                 randconfig-001-20250827    gcc-8.5.0
arm64                 randconfig-002-20250826    gcc-8.5.0
arm64                 randconfig-002-20250827    gcc-8.5.0
arm64                 randconfig-003-20250826    clang-22
arm64                 randconfig-003-20250827    gcc-8.5.0
arm64                 randconfig-004-20250826    gcc-8.5.0
arm64                 randconfig-004-20250827    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250826    gcc-15.1.0
csky                  randconfig-001-20250827    gcc-15.1.0
csky                  randconfig-002-20250826    gcc-11.5.0
csky                  randconfig-002-20250827    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250826    clang-19
hexagon               randconfig-001-20250827    gcc-15.1.0
hexagon               randconfig-002-20250826    clang-22
hexagon               randconfig-002-20250827    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250826    gcc-12
i386        buildonly-randconfig-002-20250826    gcc-12
i386        buildonly-randconfig-003-20250826    clang-20
i386        buildonly-randconfig-004-20250826    gcc-12
i386        buildonly-randconfig-005-20250826    clang-20
i386        buildonly-randconfig-006-20250826    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250827    clang-20
i386                  randconfig-002-20250827    clang-20
i386                  randconfig-003-20250827    clang-20
i386                  randconfig-004-20250827    clang-20
i386                  randconfig-005-20250827    clang-20
i386                  randconfig-006-20250827    clang-20
i386                  randconfig-007-20250827    clang-20
i386                  randconfig-011-20250827    clang-20
i386                  randconfig-012-20250827    clang-20
i386                  randconfig-013-20250827    clang-20
i386                  randconfig-014-20250827    clang-20
i386                  randconfig-015-20250827    clang-20
i386                  randconfig-016-20250827    clang-20
i386                  randconfig-017-20250827    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250826    gcc-14.3.0
loongarch             randconfig-001-20250827    gcc-15.1.0
loongarch             randconfig-002-20250826    gcc-14.3.0
loongarch             randconfig-002-20250827    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip22_defconfig    clang-22
mips                           ip27_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250826    gcc-8.5.0
nios2                 randconfig-001-20250827    gcc-15.1.0
nios2                 randconfig-002-20250826    gcc-10.5.0
nios2                 randconfig-002-20250827    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250826    gcc-8.5.0
parisc                randconfig-001-20250827    gcc-15.1.0
parisc                randconfig-002-20250826    gcc-15.1.0
parisc                randconfig-002-20250827    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                 canyonlands_defconfig    clang-22
powerpc                    ge_imp3a_defconfig    clang-22
powerpc                   lite5200b_defconfig    clang-22
powerpc                      pasemi_defconfig    clang-22
powerpc               randconfig-001-20250826    gcc-8.5.0
powerpc               randconfig-001-20250827    gcc-15.1.0
powerpc               randconfig-002-20250826    clang-22
powerpc               randconfig-002-20250827    gcc-15.1.0
powerpc               randconfig-003-20250826    gcc-13.4.0
powerpc               randconfig-003-20250827    gcc-15.1.0
powerpc64             randconfig-001-20250826    gcc-10.5.0
powerpc64             randconfig-001-20250827    gcc-15.1.0
powerpc64             randconfig-002-20250826    gcc-11.5.0
powerpc64             randconfig-002-20250827    gcc-15.1.0
powerpc64             randconfig-003-20250826    gcc-14.3.0
powerpc64             randconfig-003-20250827    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250826    gcc-8.5.0
riscv                 randconfig-001-20250827    gcc-11.5.0
riscv                 randconfig-002-20250826    gcc-11.5.0
riscv                 randconfig-002-20250827    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250826    clang-22
s390                  randconfig-001-20250827    gcc-11.5.0
s390                  randconfig-002-20250826    clang-18
s390                  randconfig-002-20250827    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250826    gcc-11.5.0
sh                    randconfig-001-20250827    gcc-11.5.0
sh                    randconfig-002-20250826    gcc-9.5.0
sh                    randconfig-002-20250827    gcc-11.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250826    gcc-13.4.0
sparc                 randconfig-001-20250827    gcc-11.5.0
sparc                 randconfig-002-20250826    gcc-8.5.0
sparc                 randconfig-002-20250827    gcc-11.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250826    gcc-8.5.0
sparc64               randconfig-001-20250827    gcc-11.5.0
sparc64               randconfig-002-20250826    clang-22
sparc64               randconfig-002-20250827    gcc-11.5.0
um                               alldefconfig    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250826    gcc-12
um                    randconfig-001-20250827    gcc-11.5.0
um                    randconfig-002-20250826    clang-17
um                    randconfig-002-20250827    gcc-11.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250826    clang-20
x86_64      buildonly-randconfig-001-20250827    clang-20
x86_64      buildonly-randconfig-002-20250826    clang-20
x86_64      buildonly-randconfig-002-20250827    clang-20
x86_64      buildonly-randconfig-003-20250826    gcc-12
x86_64      buildonly-randconfig-003-20250827    clang-20
x86_64      buildonly-randconfig-004-20250826    clang-20
x86_64      buildonly-randconfig-004-20250827    clang-20
x86_64      buildonly-randconfig-005-20250826    gcc-12
x86_64      buildonly-randconfig-005-20250827    clang-20
x86_64      buildonly-randconfig-006-20250826    gcc-12
x86_64      buildonly-randconfig-006-20250827    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                randconfig-001-20250827    clang-20
x86_64                randconfig-002-20250827    clang-20
x86_64                randconfig-003-20250827    clang-20
x86_64                randconfig-004-20250827    clang-20
x86_64                randconfig-005-20250827    clang-20
x86_64                randconfig-006-20250827    clang-20
x86_64                randconfig-007-20250827    clang-20
x86_64                randconfig-008-20250827    clang-20
x86_64                randconfig-071-20250827    clang-20
x86_64                randconfig-072-20250827    clang-20
x86_64                randconfig-073-20250827    clang-20
x86_64                randconfig-074-20250827    clang-20
x86_64                randconfig-075-20250827    clang-20
x86_64                randconfig-076-20250827    clang-20
x86_64                randconfig-077-20250827    clang-20
x86_64                randconfig-078-20250827    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250826    gcc-11.5.0
xtensa                randconfig-001-20250827    gcc-11.5.0
xtensa                randconfig-002-20250826    gcc-8.5.0
xtensa                randconfig-002-20250827    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

