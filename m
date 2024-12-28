Return-Path: <linux-gpio+bounces-14327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EFD9FD8C0
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Dec 2024 02:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F2021887960
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Dec 2024 01:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33721805E;
	Sat, 28 Dec 2024 01:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mW/myeHL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6202BAD24
	for <linux-gpio@vger.kernel.org>; Sat, 28 Dec 2024 01:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735348933; cv=none; b=e0YLvvn/R+ilw38sDexIt2SOQsVXhOsWb/kvAkSDMz6uOZw0RVjlcylDZm7bcBCRwHGJ1qJkekxMn5ykgRmNI8H7YAi8bDMNBTBJLDdGPAl/E55iDwlCgCMbX6syTYRMOqFpmzS8HZxoNX2eZF4HC0jA5lAowLiecMLRFax0xAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735348933; c=relaxed/simple;
	bh=0XIkrBNbLfz27yujEAJfT9bZlGUug2+KtFs1jsEc6eM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fpPcCa5vmFgfOt264HX+5dk7Uxs/aKqdGk+L/fb3gpinBaKczSPsSlR7yXwoh6V5hUKRAWZxjrUaWhwB44/ux3pEZKiEkqHMIcgifmjwfPXtoOULJZV9LiagqnVtvuY2JTbIbK1kWDifwmUp3CCCY4toeGvI+1AI2rckF8LlLUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mW/myeHL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735348931; x=1766884931;
  h=date:from:to:cc:subject:message-id;
  bh=0XIkrBNbLfz27yujEAJfT9bZlGUug2+KtFs1jsEc6eM=;
  b=mW/myeHLzvd67phweoMoBy4RUtKzquxD1P1nmLatxZBWwxIOdJYP6RgL
   S+tiWlzW12m/+opjMC7s3O6j8DWGssb+VaZitgcJ0O7YIzCKDj8XAe11P
   lMHanUrdZkaheBOKyiuDzxAscS7h0vYUkOl2Co/DeTvkj3jG0Xj70eyzf
   Ck6KhJz+Xvunx8NL60r20oq7VcRLK4Bj4sTO0r77Z8B+kP3hMTavQblQt
   Mkt0DbdU587qIk9SCpPAUiewPuc1DmXiXGWZ+CnurEADffevwAQwkHToD
   6t15h4k0lg7OS5zSbSagZfp9tosny3hm83MUEWYSu4FjODEig6YlcjJ0Y
   g==;
X-CSE-ConnectionGUID: rbYeJvy3ReKN6oYOHULZhA==
X-CSE-MsgGUID: 0nYJ1D33RUebDf+iqTYtdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="38578044"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="38578044"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 17:22:10 -0800
X-CSE-ConnectionGUID: idkYNCKOTHSyye/mWBc5kg==
X-CSE-MsgGUID: /N/rA0nESPqFJd2tF790LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="100398134"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Dec 2024 17:22:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRLWp-0003mK-1H;
	Sat, 28 Dec 2024 01:22:07 +0000
Date: Sat, 28 Dec 2024 09:21:29 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 e4ee0acff5b9909644e6b2cb7fb977f877f916c0
Message-ID: <202412280920.gHGG9RMb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: e4ee0acff5b9909644e6b2cb7fb977f877f916c0  dt-bindings: pinctrl: add binding for MT7988 SoC

elapsed time: 991m

configs tested: 186
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20241227    gcc-13.2.0
arc                   randconfig-002-20241227    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-20
arm                         lpc18xx_defconfig    clang-19
arm                   randconfig-001-20241227    gcc-14.2.0
arm                   randconfig-002-20241227    gcc-14.2.0
arm                   randconfig-003-20241227    clang-18
arm                   randconfig-004-20241227    clang-16
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241227    clang-16
arm64                 randconfig-002-20241227    clang-18
arm64                 randconfig-003-20241227    gcc-14.2.0
arm64                 randconfig-004-20241227    clang-18
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241227    gcc-14.2.0
csky                  randconfig-002-20241227    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241227    clang-19
hexagon               randconfig-002-20241227    clang-17
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241227    gcc-12
i386        buildonly-randconfig-002-20241227    gcc-12
i386        buildonly-randconfig-003-20241227    gcc-11
i386        buildonly-randconfig-004-20241227    gcc-12
i386        buildonly-randconfig-005-20241227    gcc-12
i386        buildonly-randconfig-006-20241227    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241228    clang-19
i386                  randconfig-002-20241228    clang-19
i386                  randconfig-003-20241228    clang-19
i386                  randconfig-004-20241228    clang-19
i386                  randconfig-005-20241228    clang-19
i386                  randconfig-006-20241228    clang-19
i386                  randconfig-007-20241228    clang-19
i386                  randconfig-011-20241228    clang-19
i386                  randconfig-012-20241228    clang-19
i386                  randconfig-013-20241228    clang-19
i386                  randconfig-014-20241228    clang-19
i386                  randconfig-015-20241228    clang-19
i386                  randconfig-016-20241228    clang-19
i386                  randconfig-017-20241228    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241227    gcc-14.2.0
loongarch             randconfig-002-20241227    gcc-14.2.0
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
nios2                 randconfig-001-20241227    gcc-14.2.0
nios2                 randconfig-002-20241227    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241227    gcc-14.2.0
parisc                randconfig-002-20241227    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                        icon_defconfig    clang-20
powerpc                     mpc5200_defconfig    clang-20
powerpc                 mpc837x_rdb_defconfig    clang-20
powerpc                  mpc866_ads_defconfig    clang-20
powerpc                  mpc885_ads_defconfig    clang-18
powerpc               randconfig-001-20241227    gcc-14.2.0
powerpc               randconfig-002-20241227    gcc-14.2.0
powerpc               randconfig-003-20241227    clang-20
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                      tqm8xx_defconfig    clang-20
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241227    gcc-14.2.0
powerpc64             randconfig-002-20241227    gcc-14.2.0
powerpc64             randconfig-003-20241227    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241227    gcc-14.2.0
riscv                 randconfig-001-20241228    clang-20
riscv                 randconfig-002-20241228    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20241227    gcc-14.2.0
s390                  randconfig-001-20241228    clang-20
s390                  randconfig-002-20241227    gcc-14.2.0
s390                  randconfig-002-20241228    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20241227    gcc-14.2.0
sh                    randconfig-001-20241228    clang-20
sh                    randconfig-002-20241228    clang-20
sh                             sh03_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241228    clang-20
sparc                 randconfig-002-20241228    clang-20
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241228    clang-20
sparc64               randconfig-002-20241228    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241228    clang-20
um                    randconfig-002-20241228    clang-20
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241227    gcc-12
x86_64      buildonly-randconfig-002-20241227    clang-19
x86_64      buildonly-randconfig-003-20241227    gcc-12
x86_64      buildonly-randconfig-004-20241227    clang-19
x86_64      buildonly-randconfig-005-20241227    gcc-12
x86_64      buildonly-randconfig-006-20241227    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241228    clang-19
x86_64                randconfig-002-20241228    clang-19
x86_64                randconfig-003-20241228    clang-19
x86_64                randconfig-004-20241228    clang-19
x86_64                randconfig-005-20241228    clang-19
x86_64                randconfig-006-20241228    clang-19
x86_64                randconfig-007-20241228    clang-19
x86_64                randconfig-008-20241228    clang-19
x86_64                randconfig-071-20241228    gcc-11
x86_64                randconfig-072-20241228    gcc-11
x86_64                randconfig-073-20241228    gcc-11
x86_64                randconfig-074-20241228    gcc-11
x86_64                randconfig-075-20241228    gcc-11
x86_64                randconfig-076-20241228    gcc-11
x86_64                randconfig-077-20241228    gcc-11
x86_64                randconfig-078-20241228    gcc-11
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241228    clang-20
xtensa                randconfig-002-20241228    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

