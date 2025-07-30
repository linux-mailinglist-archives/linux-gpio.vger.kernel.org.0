Return-Path: <linux-gpio+bounces-23887-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A066EB15694
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 02:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C093A3A6242
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 00:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756DD7E0E4;
	Wed, 30 Jul 2025 00:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WNuYrlho"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8CB801
	for <linux-gpio@vger.kernel.org>; Wed, 30 Jul 2025 00:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753835679; cv=none; b=mK7QXKCygeTSf5TGHTlTJXeBhvCmRULvPi7aeDPYUK07RGARwuWe09adNYdHc+Bpai8VcFrBT3XXrfnxBSxpaB6oc9FXzWRaWXLTcPvQaqydy3wB0sBDhBNIqq9c1N1H6CnLDGNM1ON8hPOfxWwLu6ejHvSchD36IxK93jJTUO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753835679; c=relaxed/simple;
	bh=MQ46U6SujRxqd1T4w2hJgtIeIlCtn0lW4StCnwDBo+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QXb68KzSr/ypeYiRJPY6qdAnbtgosk3dQqLutQF4ZFLmiaUowKEc4SoOAx448tf1/2YDyxlkRezLJrkuEGRyyxcV5yb6Y2WVVPB1sIlVkXKCF9KFhH3Rd0EypUabkY061DJsp/W6bnt4DqsLgUTktiL0Be/+db3bgSuOfCUU0qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WNuYrlho; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753835677; x=1785371677;
  h=date:from:to:cc:subject:message-id;
  bh=MQ46U6SujRxqd1T4w2hJgtIeIlCtn0lW4StCnwDBo+M=;
  b=WNuYrlhoR9e/4cHhUyYsC3MER1eEFAOIcsLb9C9rz9y3w3BMQCKRVNTC
   +bh3tlC8n9IBiGPCmvC/cuVBl+62hCqTdDzH3TB1uEg79qZWq+vZVFxMj
   3SnUIPiFObbRZyW5ROkWBTHG/ZKPJRKemjyIRltQ9NeV7WO+Lkb4M+POB
   DbDhOcGzk3L/HyIYAsKLZC0ndBdMK+WWq4So8lZ/UxbNzX/ryoj1vMtPV
   1sa2j0Wsd+ul59y/U9d/Tb8w9Hsz9ZWQify+FbE4xfvLzBrPPW4dXhE6o
   7dYGcVKvIFZrnJq6OgY+Tv2bPsHMaBAYHnmyEM2SDBvIWR9kDbp0FMEF7
   Q==;
X-CSE-ConnectionGUID: jOE8VVcPRqGWtmoeNpfZQA==
X-CSE-MsgGUID: zpDtn06vTXGlvvZc5LpqkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55334046"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="55334046"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 17:34:36 -0700
X-CSE-ConnectionGUID: 5x503z8+ScyG1TrnZAt7Vg==
X-CSE-MsgGUID: W0OIMYZcTmuFq8nAjEd3FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="193838498"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Jul 2025 17:34:34 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugum8-0001oB-1B;
	Wed, 30 Jul 2025 00:34:32 +0000
Date: Wed, 30 Jul 2025 08:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/devel] BUILD SUCCESS
 2d60c5cf5e896f133b75e823cdda50c995fbfb55
Message-ID: <202507300850.trVBPhuQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
branch HEAD: 2d60c5cf5e896f133b75e823cdda50c995fbfb55  treewide: rename GPIO set callbacks back to their original names

elapsed time: 1000m

configs tested: 126
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250729    gcc-8.5.0
arc                   randconfig-002-20250729    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        clps711x_defconfig    clang-22
arm                       imx_v6_v7_defconfig    clang-16
arm                   randconfig-001-20250729    gcc-15.1.0
arm                   randconfig-002-20250729    clang-19
arm                   randconfig-003-20250729    clang-22
arm                   randconfig-004-20250729    clang-22
arm                           tegra_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250729    clang-17
arm64                 randconfig-002-20250729    gcc-10.5.0
arm64                 randconfig-003-20250729    clang-22
arm64                 randconfig-004-20250729    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250729    gcc-15.1.0
csky                  randconfig-002-20250729    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250729    clang-22
hexagon               randconfig-002-20250729    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250729    gcc-12
i386        buildonly-randconfig-002-20250729    clang-20
i386        buildonly-randconfig-003-20250729    clang-20
i386        buildonly-randconfig-004-20250729    clang-20
i386        buildonly-randconfig-005-20250729    gcc-12
i386        buildonly-randconfig-006-20250729    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250729    gcc-15.1.0
loongarch             randconfig-002-20250729    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        mvme16x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
mips                        omega2p_defconfig    clang-22
nios2                         10m50_defconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250729    gcc-8.5.0
nios2                 randconfig-002-20250729    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250729    gcc-10.5.0
parisc                randconfig-002-20250729    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250729    clang-22
powerpc               randconfig-002-20250729    gcc-8.5.0
powerpc               randconfig-003-20250729    gcc-11.5.0
powerpc64             randconfig-001-20250729    clang-22
powerpc64             randconfig-002-20250729    clang-16
powerpc64             randconfig-003-20250729    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250729    clang-22
riscv                 randconfig-002-20250729    clang-17
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250729    gcc-8.5.0
s390                  randconfig-002-20250729    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250729    gcc-14.3.0
sh                    randconfig-002-20250729    gcc-9.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250729    gcc-8.5.0
sparc                 randconfig-002-20250729    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250729    clang-22
sparc64               randconfig-002-20250729    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250729    gcc-12
um                    randconfig-002-20250729    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250729    gcc-12
x86_64      buildonly-randconfig-002-20250729    gcc-12
x86_64      buildonly-randconfig-003-20250729    clang-20
x86_64      buildonly-randconfig-004-20250729    gcc-12
x86_64      buildonly-randconfig-005-20250729    clang-20
x86_64      buildonly-randconfig-006-20250729    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250729    gcc-8.5.0
xtensa                randconfig-002-20250729    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

