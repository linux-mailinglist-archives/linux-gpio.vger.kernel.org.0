Return-Path: <linux-gpio+bounces-10767-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB8798E88D
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 04:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE0D31F252C2
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 02:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4B417BA3;
	Thu,  3 Oct 2024 02:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MnLSzL9h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257E91DFFC
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 02:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727923975; cv=none; b=Gj94uvffF5xLSvelRCEPVwYjHEHtzWtZgRhkzPc7DQUhFJwPutJPMZl6FSxXxZ9InWN1PFnHu/lpOjPERedEf+9RzWRfJEzpNpZquGk6Qy1Gm0/6UOAneysKt0/zFpa5sf7rXfZYCG+BLa60vPc91B6HCcVGOHHEF8FX7DRrHEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727923975; c=relaxed/simple;
	bh=8/uXlKHZbmMbFVIaQw3MiZyZFbrJXx9ldPkJ1mGvs10=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mhY3A4JEnu6pvNPM+lMrXeYGrP3Gj5fRuaBZ+Er0wjYMy8vFGMyrtC11Yoz0Jp2DaFHNARHaHDN4ZVYUrBmxpxs2X6EIG8wWmk9WOFf3pcqwh2Ql2J6lHT7Oj3XsaYjQu9vDG4NC7wtNSbvxzllXbsesj2szqj0F5yiMFI45CCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MnLSzL9h; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727923973; x=1759459973;
  h=date:from:to:cc:subject:message-id;
  bh=8/uXlKHZbmMbFVIaQw3MiZyZFbrJXx9ldPkJ1mGvs10=;
  b=MnLSzL9hUu8+LOT08kHEV4MmOhbJ8aQQ+K/o3XQP0ROUubRkz0dcNUyy
   VoQzHzhlK/sA+roiWbME81Un8g6CnkkRNedvRlgHVEpaV9G56lhtYxkyC
   SM271OFfBUHLaSmij31qcUHFSiOW0ikxe6O44JPpVvtwXUGj2klvpnlFj
   iiJkYtgLmZyl7QXeHj+Gq51K60s/+w+URze3wNQQNp5r9jEpawxmHmrb8
   3ev5i/an6pCKhlCRSTdeg2gpvuzmEn7SPUmBWMK2dGX3+9eTZvDuiFjjo
   qHboUtgyd1UySpRLEZEgTIimAmAwldD6VKyhOGvmA0RTVWNPvld2czBYm
   A==;
X-CSE-ConnectionGUID: xOROwoc7TsegAYcf73WzhQ==
X-CSE-MsgGUID: MfK8U1zASVCZHvZv6WkPZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="14727718"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="14727718"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 19:52:52 -0700
X-CSE-ConnectionGUID: AmAAPxwIQX6vb+6ZZevY7w==
X-CSE-MsgGUID: NDvxbK8ZQNuadjguswjbCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="74324399"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Oct 2024 19:52:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swBxR-000Urd-0r;
	Thu, 03 Oct 2024 02:52:49 +0000
Date: Thu, 03 Oct 2024 10:52:25 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 393c554093c0c4cbc8e2f178d36df169016384da
Message-ID: <202410031013.shWeH0NE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 393c554093c0c4cbc8e2f178d36df169016384da  pinctrl: aw9523: add missing mutex_destroy

elapsed time: 735m

configs tested: 173
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    clang-14
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241003    gcc-14.1.0
arc                   randconfig-002-20241003    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                        multi_v5_defconfig    clang-14
arm                        neponset_defconfig    clang-14
arm                   randconfig-001-20241003    gcc-14.1.0
arm                   randconfig-002-20241003    gcc-14.1.0
arm                   randconfig-003-20241003    gcc-14.1.0
arm                   randconfig-004-20241003    gcc-14.1.0
arm                        shmobile_defconfig    clang-14
arm                           tegra_defconfig    clang-14
arm                    vt8500_v6_v7_defconfig    clang-14
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241003    gcc-14.1.0
arm64                 randconfig-002-20241003    gcc-14.1.0
arm64                 randconfig-003-20241003    gcc-14.1.0
arm64                 randconfig-004-20241003    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241003    gcc-14.1.0
csky                  randconfig-002-20241003    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241003    gcc-14.1.0
hexagon               randconfig-002-20241003    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241003    gcc-12
i386        buildonly-randconfig-002-20241003    gcc-12
i386        buildonly-randconfig-003-20241003    gcc-12
i386        buildonly-randconfig-004-20241003    gcc-12
i386        buildonly-randconfig-005-20241003    gcc-12
i386        buildonly-randconfig-006-20241003    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241003    gcc-12
i386                  randconfig-002-20241003    gcc-12
i386                  randconfig-003-20241003    gcc-12
i386                  randconfig-004-20241003    gcc-12
i386                  randconfig-005-20241003    gcc-12
i386                  randconfig-006-20241003    gcc-12
i386                  randconfig-011-20241003    gcc-12
i386                  randconfig-012-20241003    gcc-12
i386                  randconfig-013-20241003    gcc-12
i386                  randconfig-014-20241003    gcc-12
i386                  randconfig-015-20241003    gcc-12
i386                  randconfig-016-20241003    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch                 loongson3_defconfig    clang-14
loongarch             randconfig-001-20241003    gcc-14.1.0
loongarch             randconfig-002-20241003    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                       bvme6000_defconfig    clang-14
m68k                                defconfig    gcc-14.1.0
m68k                           virt_defconfig    clang-14
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                      maltaaprp_defconfig    clang-14
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241003    gcc-14.1.0
nios2                 randconfig-002-20241003    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    clang-14
parisc                randconfig-001-20241003    gcc-14.1.0
parisc                randconfig-002-20241003    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                   motionpro_defconfig    clang-14
powerpc                 mpc832x_rdb_defconfig    clang-14
powerpc               randconfig-001-20241003    gcc-14.1.0
powerpc               randconfig-002-20241003    gcc-14.1.0
powerpc               randconfig-003-20241003    gcc-14.1.0
powerpc64             randconfig-001-20241003    gcc-14.1.0
powerpc64             randconfig-002-20241003    gcc-14.1.0
powerpc64             randconfig-003-20241003    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241003    gcc-14.1.0
riscv                 randconfig-002-20241003    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241003    gcc-14.1.0
s390                  randconfig-002-20241003    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                         apsh4a3a_defconfig    clang-14
sh                                  defconfig    gcc-12
sh                        dreamcast_defconfig    clang-14
sh                    randconfig-001-20241003    gcc-14.1.0
sh                    randconfig-002-20241003    gcc-14.1.0
sh                          rsk7264_defconfig    clang-14
sh                          sdk7780_defconfig    clang-14
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241003    gcc-14.1.0
sparc64               randconfig-002-20241003    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241003    gcc-14.1.0
um                    randconfig-002-20241003    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241003    clang-18
x86_64      buildonly-randconfig-002-20241003    clang-18
x86_64      buildonly-randconfig-003-20241003    clang-18
x86_64      buildonly-randconfig-004-20241003    clang-18
x86_64      buildonly-randconfig-005-20241003    clang-18
x86_64      buildonly-randconfig-006-20241003    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241003    clang-18
x86_64                randconfig-002-20241003    clang-18
x86_64                randconfig-003-20241003    clang-18
x86_64                randconfig-004-20241003    clang-18
x86_64                randconfig-005-20241003    clang-18
x86_64                randconfig-006-20241003    clang-18
x86_64                randconfig-011-20241003    clang-18
x86_64                randconfig-012-20241003    clang-18
x86_64                randconfig-013-20241003    clang-18
x86_64                randconfig-014-20241003    clang-18
x86_64                randconfig-015-20241003    clang-18
x86_64                randconfig-016-20241003    clang-18
x86_64                randconfig-071-20241003    clang-18
x86_64                randconfig-072-20241003    clang-18
x86_64                randconfig-073-20241003    clang-18
x86_64                randconfig-074-20241003    clang-18
x86_64                randconfig-075-20241003    clang-18
x86_64                randconfig-076-20241003    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241003    gcc-14.1.0
xtensa                randconfig-002-20241003    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

