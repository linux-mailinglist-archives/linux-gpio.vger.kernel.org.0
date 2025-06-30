Return-Path: <linux-gpio+bounces-22460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A30AEEABD
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 01:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A1DA7ADDC0
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 23:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5DCA23F417;
	Mon, 30 Jun 2025 23:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WCsh5uvc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0337123ABB5
	for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 23:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751324481; cv=none; b=bH0+PeX0fA1XSCRk5bAlqmAATXizL726K5NGwEix5kzsJManpLNKtupDhQ9XAlqk0yng/jjYizWzmx9q5IEObtVyEriUTlAD5/9PWLlNiJliEYG87Q3ZkNTBrLFC8MiZXQKYmz5QmL7wec3nUQuoIqgIK6kU4eeioAEFoapMRbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751324481; c=relaxed/simple;
	bh=LTpPfy1hYCdHxUKL+y9pGSyYfAzNB8nIzCwsIqzEIsA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ekpRpreyYVFKxRswG9pT9l9QFCWAx80z9+9+WEYhEts7nZisGxwBSmEiIDzvdNeNxopVaX/FfHOFtRyQ2w7GRfr6+V7gJEKwAkXgtVWrmG8mqQGxogiqV0dHNy2tuDVIoJPBFRgEH8vkxNGeGjKLv6TvpwCucuLTP6v9KhyiH3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WCsh5uvc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751324480; x=1782860480;
  h=date:from:to:cc:subject:message-id;
  bh=LTpPfy1hYCdHxUKL+y9pGSyYfAzNB8nIzCwsIqzEIsA=;
  b=WCsh5uvctvNYc6XwaO46O4Uh5LVG/lMphwhNic1+FueuuRLjy6EB8C6C
   04tev+4vueP4FI2hpd1fYDgo4rwOXXEia+x3i9ZuWdoIZ0zfkbqjx/9Nn
   gJZUFXNeWbEDLxh25uq+fO1aIjW0kLO+rRwyvv0p0iRkQKGnuX2Ghk4A3
   uynP2GrXckOpce/SrRxhiD+BnAeA8rE2FSjlONFFzaVNk9QbxOFDuI5i4
   EhbfyoNn7GxrN6C+3W7Tv60CEh829nTDn4GqxkVKbAoXvkIYnceyXyuxl
   Z3zWqsVtfEPuwte+tHQPEESQrxJX+czbhlnmSE410n8CW6/pgHj7eMJXD
   g==;
X-CSE-ConnectionGUID: D9BdOO+/QoSRhFQbZtzfEQ==
X-CSE-MsgGUID: 6eSKyXOMSWijtDh85JlrgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53527518"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="53527518"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 16:01:19 -0700
X-CSE-ConnectionGUID: RLRM3VbcRCC67Bz21pkeJg==
X-CSE-MsgGUID: P5mdQMQDT8OURo3dDEtLPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="190762491"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Jun 2025 16:01:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWNUy-000ZQs-1O;
	Mon, 30 Jun 2025 23:01:16 +0000
Date: Tue, 01 Jul 2025 07:00:49 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 26981e8906bb5c902e2d34874f64ecfa975d28c8
Message-ID: <202507010739.CMYfYJN9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 26981e8906bb5c902e2d34874f64ecfa975d28c8  gpio: make gpiod_is_equal() arguments stricter

elapsed time: 936m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250630    gcc-10.5.0
arc                   randconfig-002-20250630    gcc-12.4.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-21
arm                          gemini_defconfig    clang-20
arm                   randconfig-001-20250630    clang-21
arm                   randconfig-002-20250630    gcc-12.4.0
arm                   randconfig-003-20250630    gcc-14.3.0
arm                   randconfig-004-20250630    clang-21
arm                        realview_defconfig    clang-16
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250630    gcc-9.5.0
arm64                 randconfig-002-20250630    gcc-14.3.0
arm64                 randconfig-003-20250630    clang-21
arm64                 randconfig-004-20250630    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250630    gcc-15.1.0
csky                  randconfig-002-20250630    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250630    clang-16
hexagon               randconfig-002-20250630    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250630    clang-20
i386        buildonly-randconfig-002-20250630    gcc-12
i386        buildonly-randconfig-003-20250630    clang-20
i386        buildonly-randconfig-004-20250630    gcc-12
i386        buildonly-randconfig-005-20250630    gcc-12
i386        buildonly-randconfig-006-20250630    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250630    gcc-15.1.0
loongarch             randconfig-002-20250630    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    clang-18
mips                       bmips_be_defconfig    gcc-15.1.0
mips                           ip32_defconfig    clang-21
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250630    gcc-14.2.0
nios2                 randconfig-002-20250630    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250630    gcc-8.5.0
parisc                randconfig-002-20250630    gcc-8.5.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          g5_defconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    clang-21
powerpc                      pcm030_defconfig    clang-21
powerpc               randconfig-001-20250630    clang-18
powerpc               randconfig-002-20250630    clang-21
powerpc               randconfig-003-20250630    gcc-13.3.0
powerpc                  storcenter_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250630    gcc-10.5.0
powerpc64             randconfig-002-20250630    gcc-14.3.0
powerpc64             randconfig-003-20250630    gcc-10.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250630    gcc-8.5.0
riscv                 randconfig-002-20250630    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250630    gcc-8.5.0
s390                  randconfig-002-20250630    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                     magicpanelr2_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250630    gcc-15.1.0
sh                    randconfig-002-20250630    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sh                           se7750_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250630    gcc-8.5.0
sparc                 randconfig-002-20250630    gcc-8.5.0
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64               randconfig-001-20250630    gcc-8.5.0
sparc64               randconfig-002-20250630    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250630    clang-21
um                    randconfig-002-20250630    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250630    gcc-12
x86_64      buildonly-randconfig-002-20250630    clang-20
x86_64      buildonly-randconfig-003-20250630    clang-20
x86_64      buildonly-randconfig-004-20250630    clang-20
x86_64      buildonly-randconfig-005-20250630    gcc-12
x86_64      buildonly-randconfig-006-20250630    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250630    gcc-13.3.0
xtensa                randconfig-002-20250630    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

