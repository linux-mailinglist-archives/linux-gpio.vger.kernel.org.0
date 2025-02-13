Return-Path: <linux-gpio+bounces-15900-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 017FAA33B14
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 10:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50CC518841E5
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 09:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B427120CCD6;
	Thu, 13 Feb 2025 09:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GvkwGXlz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EED820B7E8
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 09:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739438412; cv=none; b=rRRVjk8Ab0P0nPlWcturUd36Wva0ucRFhJK3jKWDJLKPgR7OgnzVpVQ2Z2Ly/jxzkrltmS6F6HT1M+lNLDRDAEI854zzzVvjV/TU/K3M74JmBni2JWXZFFTn4ZTdw/7od6twJGp2LYqOKgsCTKzxvb3EJekrGyOf0LY/tbOdqBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739438412; c=relaxed/simple;
	bh=iKdvW+6xNtJtUfAo2BNm+TYSSFkkeptA8S8l+7Xavuc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a5iCfmbXVWUO1r3mjQ3cM5pdt8ItcmZmaeb2QE/+oVxxMTk/58exXbscIY9B51ckFMtO9jPidnDWZOwN/Hi0Qs+rhdYvUy+Qhsc8YTbLVnQMJeaw4AreARW1EcyzkiE/fBC/kIdjfvOWTd2L8uLm3FbSx/CZI/x9WCfgZ53VfZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GvkwGXlz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739438411; x=1770974411;
  h=date:from:to:cc:subject:message-id;
  bh=iKdvW+6xNtJtUfAo2BNm+TYSSFkkeptA8S8l+7Xavuc=;
  b=GvkwGXlzqPqsYx4IrqwPKSu/1RQNlieYWf2aDi6Fn6De0/bCRnocKSOD
   +tERIPouXxg1Djk0Brw7jW6egmQmHncnPcVdNP5Dh0kyLl5YR86Th9I4T
   B+bI5tvCXOppndIp1XnNYzSt7tzhL0+mhTpnTD1hpPuSJMpsTOD2HDShx
   QPIJIm7Rw/SQghsUiSFA26KMufOGxmy536fSDKaXNNA03kuCJ6G8a+35Q
   MbU0/wa3kt1btkNU9d64AkhddLvEW7LV1F0P+6ueK9LtBFgpQfaEWE+6C
   Z/bKUK93VeF+DdjO1i/4mVI3TiKf85VR2KjgPbYUDhMhHlDJsn1wK0Exe
   g==;
X-CSE-ConnectionGUID: VVBM5GEXRvK7wYUtOvNPVA==
X-CSE-MsgGUID: e76MyJGBSLqHYz4O0XG7RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39360645"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="39360645"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 01:20:10 -0800
X-CSE-ConnectionGUID: m30XASF3QjerO2He9AYyqw==
X-CSE-MsgGUID: BFCJdDIjT4CndBU5L/vl4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113571016"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Feb 2025 01:20:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiVOA-0016rX-04;
	Thu, 13 Feb 2025 09:20:06 +0000
Date: Thu, 13 Feb 2025 17:20:03 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/set-array-helper] BUILD SUCCESS
 91931af18bd22437e08e2471f5484d6fbdd8ab93
Message-ID: <202502131757.9oHJCXpD-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/set-array-helper
branch HEAD: 91931af18bd22437e08e2471f5484d6fbdd8ab93  gpiolib: add gpiod_multi_set_value_cansleep()

elapsed time: 1357m

configs tested: 229
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250212    gcc-13.2.0
arc                   randconfig-001-20250213    gcc-14.2.0
arc                   randconfig-002-20250212    gcc-13.2.0
arc                   randconfig-002-20250213    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                   randconfig-001-20250212    clang-18
arm                   randconfig-001-20250213    gcc-14.2.0
arm                   randconfig-002-20250212    clang-16
arm                   randconfig-002-20250213    gcc-14.2.0
arm                   randconfig-003-20250212    clang-21
arm                   randconfig-003-20250213    gcc-14.2.0
arm                   randconfig-004-20250212    clang-16
arm                   randconfig-004-20250213    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250212    gcc-14.2.0
arm64                 randconfig-001-20250213    gcc-14.2.0
arm64                 randconfig-002-20250212    gcc-14.2.0
arm64                 randconfig-002-20250213    gcc-14.2.0
arm64                 randconfig-003-20250212    clang-16
arm64                 randconfig-003-20250213    gcc-14.2.0
arm64                 randconfig-004-20250212    gcc-14.2.0
arm64                 randconfig-004-20250213    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250212    gcc-14.2.0
csky                  randconfig-001-20250213    clang-21
csky                  randconfig-002-20250212    gcc-14.2.0
csky                  randconfig-002-20250213    clang-21
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250212    clang-21
hexagon               randconfig-001-20250213    clang-21
hexagon               randconfig-002-20250212    clang-21
hexagon               randconfig-002-20250213    clang-21
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250212    clang-19
i386        buildonly-randconfig-001-20250213    clang-19
i386        buildonly-randconfig-002-20250212    gcc-12
i386        buildonly-randconfig-002-20250213    clang-19
i386        buildonly-randconfig-003-20250212    gcc-12
i386        buildonly-randconfig-003-20250213    clang-19
i386        buildonly-randconfig-004-20250212    gcc-12
i386        buildonly-randconfig-004-20250213    clang-19
i386        buildonly-randconfig-005-20250212    gcc-12
i386        buildonly-randconfig-005-20250213    clang-19
i386        buildonly-randconfig-006-20250212    gcc-12
i386        buildonly-randconfig-006-20250213    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250213    clang-19
i386                  randconfig-002-20250213    clang-19
i386                  randconfig-003-20250213    clang-19
i386                  randconfig-004-20250213    clang-19
i386                  randconfig-005-20250213    clang-19
i386                  randconfig-006-20250213    clang-19
i386                  randconfig-007-20250213    clang-19
i386                  randconfig-011-20250213    gcc-12
i386                  randconfig-012-20250213    gcc-12
i386                  randconfig-013-20250213    gcc-12
i386                  randconfig-014-20250213    gcc-12
i386                  randconfig-015-20250213    gcc-12
i386                  randconfig-016-20250213    gcc-12
i386                  randconfig-017-20250213    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250212    gcc-14.2.0
loongarch             randconfig-001-20250213    clang-21
loongarch             randconfig-002-20250212    gcc-14.2.0
loongarch             randconfig-002-20250213    clang-21
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250212    gcc-14.2.0
nios2                 randconfig-001-20250213    clang-21
nios2                 randconfig-002-20250212    gcc-14.2.0
nios2                 randconfig-002-20250213    clang-21
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250212    gcc-14.2.0
parisc                randconfig-001-20250213    clang-21
parisc                randconfig-002-20250212    gcc-14.2.0
parisc                randconfig-002-20250213    clang-21
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc               randconfig-001-20250212    gcc-14.2.0
powerpc               randconfig-001-20250213    clang-21
powerpc               randconfig-002-20250212    clang-16
powerpc               randconfig-002-20250213    clang-21
powerpc               randconfig-003-20250212    gcc-14.2.0
powerpc               randconfig-003-20250213    clang-21
powerpc64             randconfig-001-20250212    clang-16
powerpc64             randconfig-001-20250213    clang-21
powerpc64             randconfig-002-20250212    gcc-14.2.0
powerpc64             randconfig-002-20250213    clang-21
powerpc64             randconfig-003-20250212    gcc-14.2.0
powerpc64             randconfig-003-20250213    clang-21
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250212    clang-21
riscv                 randconfig-001-20250213    clang-21
riscv                 randconfig-002-20250212    clang-18
riscv                 randconfig-002-20250213    clang-21
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250212    clang-15
s390                  randconfig-001-20250213    clang-21
s390                  randconfig-002-20250212    clang-17
s390                  randconfig-002-20250213    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250212    gcc-14.2.0
sh                    randconfig-001-20250213    clang-21
sh                    randconfig-002-20250212    gcc-14.2.0
sh                    randconfig-002-20250213    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250212    gcc-14.2.0
sparc                 randconfig-001-20250213    clang-21
sparc                 randconfig-002-20250212    gcc-14.2.0
sparc                 randconfig-002-20250213    clang-21
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250212    gcc-14.2.0
sparc64               randconfig-001-20250213    clang-21
sparc64               randconfig-002-20250212    gcc-14.2.0
sparc64               randconfig-002-20250213    clang-21
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250212    clang-16
um                    randconfig-001-20250213    clang-21
um                    randconfig-002-20250212    gcc-12
um                    randconfig-002-20250213    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250212    gcc-11
x86_64      buildonly-randconfig-001-20250213    gcc-12
x86_64      buildonly-randconfig-002-20250212    clang-19
x86_64      buildonly-randconfig-002-20250213    gcc-12
x86_64      buildonly-randconfig-003-20250212    clang-19
x86_64      buildonly-randconfig-003-20250213    gcc-12
x86_64      buildonly-randconfig-004-20250212    clang-19
x86_64      buildonly-randconfig-004-20250213    gcc-12
x86_64      buildonly-randconfig-005-20250212    gcc-12
x86_64      buildonly-randconfig-005-20250213    gcc-12
x86_64      buildonly-randconfig-006-20250212    clang-19
x86_64      buildonly-randconfig-006-20250213    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250213    clang-19
x86_64                randconfig-002-20250213    clang-19
x86_64                randconfig-003-20250213    clang-19
x86_64                randconfig-004-20250213    clang-19
x86_64                randconfig-005-20250213    clang-19
x86_64                randconfig-006-20250213    clang-19
x86_64                randconfig-007-20250213    clang-19
x86_64                randconfig-008-20250213    clang-19
x86_64                randconfig-071-20250213    gcc-12
x86_64                randconfig-072-20250213    gcc-12
x86_64                randconfig-073-20250213    gcc-12
x86_64                randconfig-074-20250213    gcc-12
x86_64                randconfig-075-20250213    gcc-12
x86_64                randconfig-076-20250213    gcc-12
x86_64                randconfig-077-20250213    gcc-12
x86_64                randconfig-078-20250213    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250212    gcc-14.2.0
xtensa                randconfig-001-20250213    clang-21
xtensa                randconfig-002-20250212    gcc-14.2.0
xtensa                randconfig-002-20250213    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

