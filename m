Return-Path: <linux-gpio+bounces-5206-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D4589CCF4
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 22:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EA4AB23007
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 20:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2DA14601D;
	Mon,  8 Apr 2024 20:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mwo1Sm1g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06987482
	for <linux-gpio@vger.kernel.org>; Mon,  8 Apr 2024 20:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712608446; cv=none; b=dsJZJNhCBsuSp7A7tETxC3pPQnqU7GNyxoZmgVLa+HZWbdHNWJAdMlH17DhoGTDvhIN179vtQvCY/N/fB+VAUvRr53E8QyKRcaP+A4Rx5GSwWF+C0Za5wOfb1ow33q7uYtHJpd/zj/ddNZ5pD/ncpMPl/kwUUPYCQO68104a1B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712608446; c=relaxed/simple;
	bh=KGhWvlbZpYxGmh/kcTzJhQLLMwYp0oaNVsDDcrgM3Mk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WI/auiiQLvbT9pOP556PBYSxFOpJSfhZnLJvaoXSPT3EoWegMXw0eOeMjPfqcKlbKjgQcjHg/t/kobV8/Il4aSL6WDlnUbWSy+CI8IfphYjBeuR80K6ReQd/+nT5drLWvZgSZrnWwwFCo/BokZFxfRXuzwnxwn2lFv5LvCBHxjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mwo1Sm1g; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712608444; x=1744144444;
  h=date:from:to:cc:subject:message-id;
  bh=KGhWvlbZpYxGmh/kcTzJhQLLMwYp0oaNVsDDcrgM3Mk=;
  b=Mwo1Sm1gCc5nXIV9jsltc9AHTPyLYu0SnPWnaOJS1ywXqKmvlTz18e1Z
   Ux6MjEJ5nQYOY2qdJB9o50Zx7ns6a9Rlv5ZsxONlLffAkxXdWNoyOHOz4
   t7RO/sk1IXrr3F04PL7K4uxUbCgJ2wFpJzKnWEykDNcfUP1kfrpZH81Hh
   M5N/Hr0FDjhhSvR+LLYtBKMbEmWpLIqRdIRHoxfhlHmnTMvwgeWK0EISa
   nbek3AdMH6scrpold+hVvOhCb9qETCuqoXPnsWY3PyYKsr7kBooMeGON7
   sxPK77oA5VV01GjLfO1en0w2fKSr3rd2cdNtOqKDNc2upAm0VnNvmVi59
   Q==;
X-CSE-ConnectionGUID: jGJT5pxITwKdW/aibTNhnw==
X-CSE-MsgGUID: bgZvtsCfTgm0BrX60zUSWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="18477203"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="18477203"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 13:34:04 -0700
X-CSE-ConnectionGUID: XU75chbsSWmnbB5cjQ06MQ==
X-CSE-MsgGUID: 1MzMHB/+TtqY1XlX8tobhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="20431082"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Apr 2024 13:34:03 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtvgm-0005TU-2D;
	Mon, 08 Apr 2024 20:34:00 +0000
Date: Tue, 09 Apr 2024 04:33:58 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 e43c2feb8f323b91c85ddbf23769c3586cd91010
Message-ID: <202404090456.kQbn5AGj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: e43c2feb8f323b91c85ddbf23769c3586cd91010  Merge tag 'intel-gpio-v6.9-1' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-current

elapsed time: 724m

configs tested: 194
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240408   gcc  
arc                   randconfig-002-20240408   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                      footbridge_defconfig   clang
arm                       omap2plus_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20240408   clang
arm                   randconfig-002-20240408   clang
arm                   randconfig-003-20240408   clang
arm                   randconfig-004-20240408   clang
arm                         s3c6400_defconfig   gcc  
arm                           sama5_defconfig   gcc  
arm                          sp7021_defconfig   gcc  
arm                    vt8500_v6_v7_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240408   clang
arm64                 randconfig-002-20240408   clang
arm64                 randconfig-003-20240408   gcc  
arm64                 randconfig-004-20240408   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240408   gcc  
csky                  randconfig-002-20240408   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240408   clang
hexagon               randconfig-002-20240408   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240408   gcc  
i386         buildonly-randconfig-002-20240408   gcc  
i386         buildonly-randconfig-003-20240408   gcc  
i386         buildonly-randconfig-004-20240408   clang
i386         buildonly-randconfig-005-20240408   clang
i386         buildonly-randconfig-006-20240408   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240408   clang
i386                  randconfig-002-20240408   clang
i386                  randconfig-003-20240408   clang
i386                  randconfig-004-20240408   clang
i386                  randconfig-005-20240408   gcc  
i386                  randconfig-006-20240408   clang
i386                  randconfig-011-20240408   clang
i386                  randconfig-012-20240408   gcc  
i386                  randconfig-013-20240408   clang
i386                  randconfig-014-20240408   gcc  
i386                  randconfig-015-20240408   gcc  
i386                  randconfig-016-20240408   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240408   gcc  
loongarch             randconfig-002-20240408   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips                     loongson2k_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240408   gcc  
nios2                 randconfig-002-20240408   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240408   gcc  
parisc                randconfig-002-20240408   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc                   microwatt_defconfig   gcc  
powerpc                     mpc5200_defconfig   clang
powerpc                 mpc836x_rdk_defconfig   clang
powerpc               randconfig-001-20240408   gcc  
powerpc               randconfig-002-20240408   clang
powerpc               randconfig-003-20240408   gcc  
powerpc                      tqm8xx_defconfig   clang
powerpc64             randconfig-001-20240408   clang
powerpc64             randconfig-002-20240408   gcc  
powerpc64             randconfig-003-20240408   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240408   clang
riscv                 randconfig-002-20240408   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240408   clang
s390                  randconfig-002-20240408   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240408   gcc  
sh                    randconfig-002-20240408   gcc  
sh                           se7722_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240408   gcc  
sparc64               randconfig-002-20240408   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240408   clang
um                    randconfig-002-20240408   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240408   clang
x86_64       buildonly-randconfig-002-20240408   clang
x86_64       buildonly-randconfig-003-20240408   clang
x86_64       buildonly-randconfig-004-20240408   clang
x86_64       buildonly-randconfig-005-20240408   clang
x86_64       buildonly-randconfig-006-20240408   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240408   gcc  
x86_64                randconfig-002-20240408   clang
x86_64                randconfig-003-20240408   clang
x86_64                randconfig-004-20240408   clang
x86_64                randconfig-005-20240408   clang
x86_64                randconfig-006-20240408   gcc  
x86_64                randconfig-011-20240408   clang
x86_64                randconfig-012-20240408   clang
x86_64                randconfig-013-20240408   gcc  
x86_64                randconfig-014-20240408   clang
x86_64                randconfig-015-20240408   clang
x86_64                randconfig-016-20240408   clang
x86_64                randconfig-071-20240408   gcc  
x86_64                randconfig-072-20240408   clang
x86_64                randconfig-073-20240408   clang
x86_64                randconfig-074-20240408   gcc  
x86_64                randconfig-075-20240408   gcc  
x86_64                randconfig-076-20240408   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                randconfig-001-20240408   gcc  
xtensa                randconfig-002-20240408   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

