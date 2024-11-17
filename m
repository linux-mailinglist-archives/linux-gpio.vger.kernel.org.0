Return-Path: <linux-gpio+bounces-13057-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 385D59D01E5
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Nov 2024 03:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6F0E285272
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Nov 2024 02:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA0ECA5A;
	Sun, 17 Nov 2024 02:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FdfVs8dx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E378831
	for <linux-gpio@vger.kernel.org>; Sun, 17 Nov 2024 02:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731811484; cv=none; b=asNiIwK2WXFpUzsi1HJ3I53XQfsfMTRHji4Ah9LrkfJpr1Jyae1D2jOixVVO3f1gESsKmoYZOVn+fLhHKIAe5fR0C77Pi5EDVPsqfmXmuWYbFozUuKAvuOnvhkG+7Aow1Yh9LvdOzoASpidOlmGt9zb7LsuPeVujnIShFmNpZfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731811484; c=relaxed/simple;
	bh=fzig8kWmy/x5VWWnr8eigwfXeQBSyYAZvXWrp6ZKkvc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fSBJs0NuR91JZHgTZRTSupOMtaJQ9yBQz6bxVFxuu+b6M9h5Qk7pNqApBspbfY76DTG8Z+M08J7z18lGxYiYOZ/bqOmHdUr+oiH5SNYvVMczdzAxw27cc7L47B08/iwaM8pViojO97aaA/SdvXRHeV5PCc+XiFgwiexsBu14i5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FdfVs8dx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731811483; x=1763347483;
  h=date:from:to:cc:subject:message-id;
  bh=fzig8kWmy/x5VWWnr8eigwfXeQBSyYAZvXWrp6ZKkvc=;
  b=FdfVs8dxZyHT5AB4kCDM0B72Z1OQGVFhrSQTULNrfzJW7G2D/8ntkFcu
   Tg1h1rov7/r9eKGka4rfTVze3R144loWgfaWyAM2+BzIZu793JFY8yd8t
   tn57bReyQ/oEWlUD0kKhXYjEtNcawNrlwYFoveEIabQ/wwhc8VWfRujJZ
   8Qu1xcg3Fht12WSxt/Qi5nLGH9njtco4tsiDs0qE0BTAabvcjVfF68SOe
   MN4XM7MWvRVMcQiGCr4j7WFF3QU36/8+JNy+UeYxq1dKrpExWOiQNaszJ
   qegjl9PZITw/1vEnvjrfAH4bN176/TRg9LoAJJTHXG51HUcXzwD6S0mto
   w==;
X-CSE-ConnectionGUID: rwsDCh2YRA2jg5/SZ91wyA==
X-CSE-MsgGUID: lhUgt/7TT8WgGRQ8Rk7caA==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42434197"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="42434197"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 18:44:42 -0800
X-CSE-ConnectionGUID: 5Z40aszUQtKOu4yOe7t8iA==
X-CSE-MsgGUID: xoPW8kpnRSegen50mXS5kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="112188638"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2024 18:44:35 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCVH7-0001G6-0m;
	Sun, 17 Nov 2024 02:44:33 +0000
Date: Sun, 17 Nov 2024 10:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 1b81e73e3babc88017232253f99ffdad6d370bd3
Message-ID: <202411171029.T44XxDla-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 1b81e73e3babc88017232253f99ffdad6d370bd3  gpio: tegra186: Allow to enable driver on Tegra234

elapsed time: 2282m

configs tested: 124
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                     allnoconfig    gcc-14.2.0
alpha                       defconfig    gcc-14.2.0
arc                      allmodconfig    gcc-13.2.0
arc                       allnoconfig    gcc-14.2.0
arc                      allyesconfig    gcc-13.2.0
arc                         defconfig    gcc-14.2.0
arc         nsimosci_hs_smp_defconfig    clang-20
arc           randconfig-001-20241117    clang-20
arc           randconfig-002-20241117    clang-20
arm                      allmodconfig    gcc-14.2.0
arm                       allnoconfig    gcc-14.2.0
arm                      allyesconfig    gcc-14.2.0
arm                         defconfig    gcc-14.2.0
arm              jornada720_defconfig    clang-20
arm                 lpc18xx_defconfig    clang-20
arm                multi_v7_defconfig    clang-20
arm           randconfig-001-20241117    clang-20
arm           randconfig-002-20241117    clang-20
arm           randconfig-003-20241117    clang-20
arm           randconfig-004-20241117    clang-20
arm                 s3c6400_defconfig    clang-20
arm                   spitz_defconfig    clang-20
arm64                    allmodconfig    clang-20
arm64                     allnoconfig    gcc-14.2.0
arm64                       defconfig    gcc-14.2.0
arm64         randconfig-001-20241117    clang-20
arm64         randconfig-002-20241117    clang-20
arm64         randconfig-003-20241117    clang-20
arm64         randconfig-004-20241117    clang-20
csky                      allnoconfig    gcc-14.2.0
csky                        defconfig    gcc-14.2.0
csky          randconfig-001-20241117    clang-20
csky          randconfig-002-20241117    clang-20
hexagon                   allnoconfig    gcc-14.2.0
hexagon                     defconfig    gcc-14.2.0
hexagon       randconfig-001-20241117    clang-20
hexagon       randconfig-002-20241117    clang-20
i386                     allmodconfig    clang-19
i386                     allmodconfig    gcc-12
i386                      allnoconfig    clang-19
i386                      allnoconfig    gcc-12
i386                     allyesconfig    clang-19
i386                     allyesconfig    gcc-12
i386                        defconfig    clang-19
loongarch                 allnoconfig    gcc-14.2.0
loongarch                   defconfig    gcc-14.2.0
loongarch     randconfig-001-20241117    clang-20
loongarch     randconfig-002-20241117    clang-20
m68k                      allnoconfig    gcc-14.2.0
m68k                        defconfig    gcc-14.2.0
microblaze                allnoconfig    gcc-14.2.0
microblaze                  defconfig    gcc-14.2.0
mips                      allnoconfig    gcc-14.2.0
mips                   jazz_defconfig    clang-20
nios2                     allnoconfig    gcc-14.2.0
nios2                       defconfig    gcc-14.2.0
nios2         randconfig-001-20241117    clang-20
nios2         randconfig-002-20241117    clang-20
openrisc                  allnoconfig    clang-20
openrisc                 allyesconfig    gcc-14.2.0
openrisc                    defconfig    gcc-12
parisc                   allmodconfig    gcc-14.2.0
parisc                    allnoconfig    clang-20
parisc                   allyesconfig    gcc-14.2.0
parisc                      defconfig    gcc-12
parisc        randconfig-001-20241117    clang-20
parisc        randconfig-002-20241117    clang-20
parisc64                    defconfig    gcc-14.2.0
powerpc                  allmodconfig    gcc-14.2.0
powerpc                   allnoconfig    clang-20
powerpc                  allyesconfig    gcc-14.2.0
powerpc              cm5200_defconfig    clang-20
powerpc              pmac32_defconfig    clang-20
powerpc                 ps3_defconfig    clang-20
powerpc       randconfig-001-20241117    clang-20
powerpc       randconfig-002-20241117    clang-20
powerpc       randconfig-003-20241117    clang-20
powerpc             tqm8560_defconfig    clang-20
powerpc              tqm8xx_defconfig    clang-20
powerpc64     randconfig-001-20241117    clang-20
powerpc64     randconfig-002-20241117    clang-20
powerpc64     randconfig-003-20241117    clang-20
riscv                    allmodconfig    gcc-14.2.0
riscv                     allnoconfig    clang-20
riscv                    allyesconfig    gcc-14.2.0
riscv                       defconfig    gcc-12
riscv            nommu_k210_defconfig    clang-20
riscv         randconfig-001-20241117    clang-20
riscv         randconfig-002-20241117    clang-20
s390                     allmodconfig    clang-20
s390                     allmodconfig    gcc-14.2.0
s390                      allnoconfig    clang-20
s390                     allyesconfig    gcc-14.2.0
s390                        defconfig    gcc-12
s390          randconfig-001-20241117    clang-20
s390          randconfig-002-20241117    clang-20
sh                       allmodconfig    gcc-14.2.0
sh                        allnoconfig    gcc-14.2.0
sh                       allyesconfig    gcc-14.2.0
sh                          defconfig    gcc-12
sh                     espt_defconfig    clang-20
sh            randconfig-001-20241117    clang-20
sh            randconfig-002-20241117    clang-20
sh                sh7757lcr_defconfig    clang-20
sparc                    allmodconfig    gcc-14.2.0
sparc64                     defconfig    gcc-12
sparc64       randconfig-001-20241117    clang-20
sparc64       randconfig-002-20241117    clang-20
um                        allnoconfig    clang-20
um                          defconfig    gcc-12
um                     i386_defconfig    gcc-12
um            randconfig-001-20241117    clang-20
um            randconfig-002-20241117    clang-20
um                   x86_64_defconfig    gcc-12
x86_64                    allnoconfig    clang-19
x86_64                   allyesconfig    clang-19
x86_64                      defconfig    clang-19
x86_64                      defconfig    gcc-11
x86_64                          kexec    clang-19
x86_64                          kexec    gcc-12
x86_64                       rhel-8.3    gcc-12
xtensa                    allnoconfig    gcc-14.2.0
xtensa        randconfig-001-20241117    clang-20
xtensa        randconfig-002-20241117    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

