Return-Path: <linux-gpio+bounces-23853-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C96B12F40
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 12:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CCFB1897478
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 10:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F541FC0E2;
	Sun, 27 Jul 2025 10:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XEqv/SbX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3CABA36
	for <linux-gpio@vger.kernel.org>; Sun, 27 Jul 2025 10:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753613971; cv=none; b=rVORLIgNQcwjxhqqeBN5keh+9OfeyWg5dzASgTa2S68Np5joXRLBS3bkKOHwwysygOL/A+1myWQ5IWrZSo1er9C/oSvQU0N9RWDdTaHKfUMMVcwOu8ZzBySlzHJoo2W9mjnrDMdCf3d37pE7fb2rpsNKSDMAB09RG9gN4btzg1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753613971; c=relaxed/simple;
	bh=QjirKW9h4BuLCyfQ29d0PN80tmEVwTlFhgz7SabCIgc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OnUQK3vWCZ0kI1STW/hmcDIRMlJJei467fvIXiHTpYYKuIkNSCkrLsWwoXo4blsQbuSw2soSfPeL2jokXEdhpIWis5DfeoaW5AW8W9x996a5wrLKKN+JG08mcwGNPVxomejfoIC+KHmYbRwmVJE+MLqNUNBPxvHsLSRNd7xMqUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XEqv/SbX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753613969; x=1785149969;
  h=date:from:to:cc:subject:message-id;
  bh=QjirKW9h4BuLCyfQ29d0PN80tmEVwTlFhgz7SabCIgc=;
  b=XEqv/SbXZNiS0+hYbmmBGvIsGRyLeyc1jtnoIyATml/pOG2M5MKTIutF
   dRJUjVWux3Z3ulYpPLjwh2sf1w6cEb1XKR6Z8tozcvytvx8RLYWXfJWWz
   ISah/dnfSAhw6rdpwmpwFhcXCepEnUfGQOAjYuXcHB+c3NcVhl2QsrydH
   y6HF1yk6bWFTMWgAk0wDYNMUZA/uY6v2s1NzumKWQMvwXH5nfVAzxYMaR
   SYg9aTq54FnNbHcFpR2OymuBaBaKoC/jn3PGJ4OCEgFlrmQJIwlocJPjR
   njfQKVPlfxvYHCy/QOytvfRi6+qlU1mVEIRsXpqa2IHsfGIKxttGhRpch
   g==;
X-CSE-ConnectionGUID: qnnKsF+PTo6D6tvVTqKERQ==
X-CSE-MsgGUID: E0NpMJCgR3yRgmMsLyVWpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56036083"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="56036083"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 03:59:29 -0700
X-CSE-ConnectionGUID: kM5NX3iBSa6Xf9tuw9vgVQ==
X-CSE-MsgGUID: cus0tf2wRI24OcDE8PUuWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162438506"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Jul 2025 03:59:28 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufz6D-000Mat-1b;
	Sun, 27 Jul 2025 10:59:25 +0000
Date: Sun, 27 Jul 2025 18:59:00 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 a3fe1324c3c5c292ec79bd756497c1c44ff247d2
Message-ID: <202507271848.5e9Svm69-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: a3fe1324c3c5c292ec79bd756497c1c44ff247d2  pinctrl: mediatek: Add pinctrl driver for mt8189

elapsed time: 728m

configs tested: 134
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250727    gcc-8.5.0
arc                   randconfig-002-20250727    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20250727    gcc-11.5.0
arm                   randconfig-002-20250727    gcc-14.3.0
arm                   randconfig-003-20250727    clang-22
arm                   randconfig-004-20250727    gcc-10.5.0
arm                         socfpga_defconfig    gcc-15.1.0
arm                        vexpress_defconfig    gcc-15.1.0
arm                         wpcm450_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250727    gcc-11.5.0
arm64                 randconfig-002-20250727    clang-18
arm64                 randconfig-003-20250727    clang-17
arm64                 randconfig-004-20250727    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250727    gcc-15.1.0
csky                  randconfig-002-20250727    gcc-12.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250727    clang-22
hexagon               randconfig-002-20250727    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250727    gcc-12
i386        buildonly-randconfig-002-20250727    gcc-12
i386        buildonly-randconfig-003-20250727    clang-20
i386        buildonly-randconfig-004-20250727    clang-20
i386        buildonly-randconfig-005-20250727    clang-20
i386        buildonly-randconfig-006-20250727    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250727    clang-22
loongarch             randconfig-002-20250727    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
m68k                        m5407c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip30_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250727    gcc-8.5.0
nios2                 randconfig-002-20250727    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250727    gcc-11.5.0
parisc                randconfig-002-20250727    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      bamboo_defconfig    clang-22
powerpc                  iss476-smp_defconfig    gcc-15.1.0
powerpc                         ps3_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250727    gcc-13.4.0
powerpc               randconfig-002-20250727    clang-22
powerpc               randconfig-003-20250727    clang-22
powerpc64                        alldefconfig    clang-22
powerpc64             randconfig-001-20250727    gcc-12.5.0
powerpc64             randconfig-002-20250727    clang-22
powerpc64             randconfig-003-20250727    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250727    clang-22
riscv                 randconfig-002-20250727    clang-20
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250727    clang-22
s390                  randconfig-002-20250727    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          polaris_defconfig    gcc-15.1.0
sh                    randconfig-001-20250727    gcc-15.1.0
sh                    randconfig-002-20250727    gcc-11.5.0
sh                           se7780_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250727    gcc-8.5.0
sparc                 randconfig-002-20250727    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250727    gcc-8.5.0
sparc64               randconfig-002-20250727    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250727    clang-22
um                    randconfig-002-20250727    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250727    gcc-12
x86_64      buildonly-randconfig-002-20250727    clang-20
x86_64      buildonly-randconfig-003-20250727    clang-20
x86_64      buildonly-randconfig-004-20250727    clang-20
x86_64      buildonly-randconfig-005-20250727    clang-20
x86_64      buildonly-randconfig-006-20250727    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250727    gcc-8.5.0
xtensa                randconfig-002-20250727    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

