Return-Path: <linux-gpio+bounces-21296-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32440AD481C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 03:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A067A7AE4D1
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 01:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E717DA95;
	Wed, 11 Jun 2025 01:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdKISDSU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91C9127E18
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 01:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749605972; cv=none; b=tluB7DSvGCgQVxCvkqMIXGJ/HgG7QW8jq18CeEqjHivGcoYecYGQ3gPPLnuoewXbhVf+4EbVpB9VnQRHv16C35ZdqI0SXtnYNi3q0te6vs0fefcDPIlqOXkwbfFdX3eM/jF/uVKxdAIrU7wqZGfrNCuoHkkyVDXN5Q5MtmSiWEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749605972; c=relaxed/simple;
	bh=vkgBaQhai8NTrXfBgMLc+xINs/TJADCq/JIRC8N7at8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qQ2ytmg4dA1VD3lPt1A+P5WCys8X5HHeXklFaq6ZQP+/BKl92PiXAxtJgtELxfdj1F5vg6fwinEQCuBDwoo4kdaR8l52D6mVnublLlBSl941CtGyjtyybqY00wr6KsIJaIDnpcdCKKGwHQaGRp2XhySlB90lgXxD9EfQZhIeL1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdKISDSU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749605970; x=1781141970;
  h=date:from:to:cc:subject:message-id;
  bh=vkgBaQhai8NTrXfBgMLc+xINs/TJADCq/JIRC8N7at8=;
  b=RdKISDSUg6+hQjNhx9XXn6Lq0fCQO0c33VhWqelJmfOD8fJ45elLJGw/
   9SZHzoU3iO5jD9B4bXa9XVrZ7sI/WzswYf9bjT5HtE7Q3LAm0FCsfZykZ
   vxNdl/LOvJKCARNhpacY82AYheJg0iMB43p12FrMQ9oELpXrT8db2ab//
   D8lwvRiEKHhpRWqdsJZE/EMgs/6+IZLxMI6ftvDvJICfN5dn8D3HIJaxl
   5h0erbCseXZQ24kJnKc0eG25khZgvL1o1xkkOJ0TP5ODT0JNJjWl01j4D
   YWr3lbyPTLVLjpqMH3IJhEJTh2fJBzHg3sZpSKRvhPGIGPq8PSJ1gHLsN
   g==;
X-CSE-ConnectionGUID: YH3XL3sHRbyh7FyrzwW3Og==
X-CSE-MsgGUID: dxdXJGL2TO6BS04s3a8aMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51613368"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="51613368"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 18:39:20 -0700
X-CSE-ConnectionGUID: eACUHH8uRpuVTISxI1ggdw==
X-CSE-MsgGUID: pt2IPlotQ3WBrDy/4Jl71w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="147952849"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Jun 2025 18:39:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPAJ1-00090K-3B;
	Wed, 11 Jun 2025 01:31:07 +0000
Date: Wed, 11 Jun 2025 09:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 e0d4a0f1d066f14522049e827107a577444d9183
Message-ID: <202506110947.xjTJGLYi-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: e0d4a0f1d066f14522049e827107a577444d9183  MAINTAINERS: Update HiSilicon GPIO driver maintainer

elapsed time: 1035m

configs tested: 212
configs skipped: 8

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
arc                   randconfig-001-20250610    gcc-12.4.0
arc                   randconfig-002-20250610    gcc-14.3.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                          exynos_defconfig    clang-21
arm                        neponset_defconfig    gcc-15.1.0
arm                          pxa168_defconfig    gcc-15.1.0
arm                   randconfig-001-20250610    clang-19
arm                   randconfig-002-20250610    gcc-8.5.0
arm                   randconfig-003-20250610    clang-21
arm                   randconfig-004-20250610    clang-16
arm                          sp7021_defconfig    clang-21
arm                        spear3xx_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250610    clang-21
arm64                 randconfig-002-20250610    gcc-11.5.0
arm64                 randconfig-003-20250610    clang-21
arm64                 randconfig-004-20250610    clang-18
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250610    gcc-12.4.0
csky                  randconfig-002-20250610    gcc-14.3.0
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250610    clang-21
hexagon               randconfig-002-20250610    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250610    clang-20
i386        buildonly-randconfig-001-20250611    clang-20
i386        buildonly-randconfig-002-20250610    clang-20
i386        buildonly-randconfig-002-20250611    clang-20
i386        buildonly-randconfig-003-20250610    clang-20
i386        buildonly-randconfig-003-20250611    clang-20
i386        buildonly-randconfig-004-20250610    gcc-12
i386        buildonly-randconfig-004-20250611    clang-20
i386        buildonly-randconfig-005-20250610    clang-20
i386        buildonly-randconfig-005-20250611    clang-20
i386        buildonly-randconfig-006-20250610    clang-20
i386        buildonly-randconfig-006-20250611    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250611    clang-20
i386                  randconfig-002-20250611    clang-20
i386                  randconfig-003-20250611    clang-20
i386                  randconfig-004-20250611    clang-20
i386                  randconfig-005-20250611    clang-20
i386                  randconfig-006-20250611    clang-20
i386                  randconfig-007-20250611    clang-20
i386                  randconfig-011-20250611    gcc-12
i386                  randconfig-012-20250611    gcc-12
i386                  randconfig-013-20250611    gcc-12
i386                  randconfig-014-20250611    gcc-12
i386                  randconfig-015-20250611    gcc-12
i386                  randconfig-016-20250611    gcc-12
i386                  randconfig-017-20250611    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250610    gcc-15.1.0
loongarch             randconfig-002-20250610    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         apollo_defconfig    clang-21
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        qi_lb60_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250610    gcc-8.5.0
nios2                 randconfig-002-20250610    gcc-13.3.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250610    gcc-10.5.0
parisc                randconfig-002-20250610    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      ep88xc_defconfig    clang-21
powerpc                       holly_defconfig    clang-21
powerpc               randconfig-001-20250610    gcc-10.5.0
powerpc               randconfig-002-20250610    gcc-8.5.0
powerpc               randconfig-003-20250610    clang-21
powerpc64             randconfig-001-20250610    clang-21
powerpc64             randconfig-002-20250610    clang-21
riscv                            alldefconfig    clang-21
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250610    gcc-14.3.0
riscv                 randconfig-001-20250611    gcc-15.1.0
riscv                 randconfig-002-20250610    clang-16
riscv                 randconfig-002-20250611    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250610    gcc-8.5.0
s390                  randconfig-001-20250611    gcc-15.1.0
s390                  randconfig-002-20250610    gcc-14.3.0
s390                  randconfig-002-20250611    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250610    gcc-9.3.0
sh                    randconfig-001-20250611    gcc-15.1.0
sh                    randconfig-002-20250610    gcc-15.1.0
sh                    randconfig-002-20250611    gcc-15.1.0
sh                              ul2_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250610    gcc-15.1.0
sparc                 randconfig-001-20250611    gcc-15.1.0
sparc                 randconfig-002-20250610    gcc-12.4.0
sparc                 randconfig-002-20250611    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250610    gcc-8.5.0
sparc64               randconfig-001-20250611    gcc-15.1.0
sparc64               randconfig-002-20250610    gcc-8.5.0
sparc64               randconfig-002-20250611    gcc-15.1.0
um                               alldefconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250610    gcc-11
um                    randconfig-001-20250611    gcc-15.1.0
um                    randconfig-002-20250610    gcc-12
um                    randconfig-002-20250611    gcc-15.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250610    clang-20
x86_64      buildonly-randconfig-001-20250611    clang-20
x86_64      buildonly-randconfig-002-20250610    gcc-12
x86_64      buildonly-randconfig-002-20250611    clang-20
x86_64      buildonly-randconfig-003-20250610    clang-20
x86_64      buildonly-randconfig-003-20250611    clang-20
x86_64      buildonly-randconfig-004-20250610    clang-20
x86_64      buildonly-randconfig-004-20250611    clang-20
x86_64      buildonly-randconfig-005-20250610    gcc-12
x86_64      buildonly-randconfig-005-20250611    clang-20
x86_64      buildonly-randconfig-006-20250610    gcc-12
x86_64      buildonly-randconfig-006-20250611    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250611    clang-20
x86_64                randconfig-002-20250611    clang-20
x86_64                randconfig-003-20250611    clang-20
x86_64                randconfig-004-20250611    clang-20
x86_64                randconfig-005-20250611    clang-20
x86_64                randconfig-006-20250611    clang-20
x86_64                randconfig-007-20250611    clang-20
x86_64                randconfig-008-20250611    clang-20
x86_64                randconfig-071-20250611    gcc-12
x86_64                randconfig-072-20250611    gcc-12
x86_64                randconfig-073-20250611    gcc-12
x86_64                randconfig-074-20250611    gcc-12
x86_64                randconfig-075-20250611    gcc-12
x86_64                randconfig-076-20250611    gcc-12
x86_64                randconfig-077-20250611    gcc-12
x86_64                randconfig-078-20250611    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250610    gcc-11.5.0
xtensa                randconfig-001-20250611    gcc-15.1.0
xtensa                randconfig-002-20250610    gcc-12.4.0
xtensa                randconfig-002-20250611    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

