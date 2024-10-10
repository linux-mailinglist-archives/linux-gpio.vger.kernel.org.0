Return-Path: <linux-gpio+bounces-11138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9581599821E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 11:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87CCAB2BBCD
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 09:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78901C3F15;
	Thu, 10 Oct 2024 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cD8YAHhC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB24B25745
	for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728551525; cv=none; b=IUx3oE6aBMk9Eie6XMCtnkrbjfGJJnxwbq1A+3Na56rMfUqS5A5h+RozaKu1Pn4I5uWe5eBU2GfAQVU/Q/zKZCGdr7nvuMKwCJH/o5SL+yWBZN6JF/LfVBH28Q6YIvIcb0HLw5wA+TNcsKaADanBj8qxUptc1qaSYyMxjLqxcBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728551525; c=relaxed/simple;
	bh=xchZ8vfUqZ3APOK/YoKWxoLRAFg9jWljLX0to40d90E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jrNws+sO3cJAmBu/4TJzVEc+JbaFGtghZv9BIbIU7HJ74QgeAvAECGdr+66kM2ptqMk+0ZkVQCk6Ltx5bHAeA5MlnCK/SNXp0fjwG3/UFFqaVFZ8pkMy8BUYiLvb5ICsdLEYEL9sl6vUyt+seVH53s/KnNzEzN9YdwAoBKV3FLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cD8YAHhC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728551525; x=1760087525;
  h=date:from:to:cc:subject:message-id;
  bh=xchZ8vfUqZ3APOK/YoKWxoLRAFg9jWljLX0to40d90E=;
  b=cD8YAHhCFXUwvrpjg3HSWXurJ4WJ/rQX20/fR2O+fQg3Zfe+EA1jsBu1
   RusFMrAh3kTf6v6PrpYXEQSorBYg6kqJW/y1/TO1T5wp3ICAM08SIkBJl
   U8ktV+J9EncT5wtl5zkmJWadsQe6sjXrMREdwWm3O54oOoD+/W/xkXkdj
   KYlzS9WWwnpiWyuxlSBXgZ75fOpTuXy6h77kC+MMzbHboyqMLbKK1tYYt
   xbFV6waSwrCoAKwsFtq2g3UMJadAZIYj9keEYQ+dT4iSkGP3JOX4+w5JA
   xiDxrKNNdd18SdAC/EX9nmL7L6JfGwHjUY2fktQrnsHObjFLKZOGEcBWb
   g==;
X-CSE-ConnectionGUID: QGDClec7SbGKXigUltBFwQ==
X-CSE-MsgGUID: WiKVP8xTTWG+l6CDtxFewQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28028092"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="28028092"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 02:12:04 -0700
X-CSE-ConnectionGUID: C+FZAVTUTJWZTDcPGdyvLw==
X-CSE-MsgGUID: NyrVwZHbQVmB1qqJMzNJ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="76191218"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Oct 2024 02:12:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sypDE-000AXx-0l;
	Thu, 10 Oct 2024 09:12:00 +0000
Date: Thu, 10 Oct 2024 17:11:36 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 343dc93c233b1047565e85124272417cd214eb80
Message-ID: <202410101730.SIHKatPf-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 343dc93c233b1047565e85124272417cd214eb80  Merge branch 'devel' into for-next

elapsed time: 982m

configs tested: 173
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                          axs101_defconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241010    clang-20
arc                   randconfig-002-20241010    clang-20
arc                           tb10x_defconfig    gcc-14.1.0
arc                        vdk_hs38_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                   randconfig-001-20241010    clang-20
arm                   randconfig-002-20241010    clang-20
arm                   randconfig-003-20241010    clang-20
arm                   randconfig-004-20241010    clang-20
arm                         wpcm450_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241010    clang-20
arm64                 randconfig-002-20241010    clang-20
arm64                 randconfig-003-20241010    clang-20
arm64                 randconfig-004-20241010    clang-20
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241010    clang-20
csky                  randconfig-002-20241010    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241010    clang-20
hexagon               randconfig-002-20241010    clang-20
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241010    clang-18
i386        buildonly-randconfig-002-20241010    clang-18
i386        buildonly-randconfig-003-20241010    clang-18
i386        buildonly-randconfig-004-20241010    clang-18
i386        buildonly-randconfig-005-20241010    clang-18
i386        buildonly-randconfig-006-20241010    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241010    clang-18
i386                  randconfig-002-20241010    clang-18
i386                  randconfig-003-20241010    clang-18
i386                  randconfig-004-20241010    clang-18
i386                  randconfig-005-20241010    clang-18
i386                  randconfig-006-20241010    clang-18
i386                  randconfig-011-20241010    clang-18
i386                  randconfig-012-20241010    clang-18
i386                  randconfig-013-20241010    clang-18
i386                  randconfig-014-20241010    clang-18
i386                  randconfig-015-20241010    clang-18
i386                  randconfig-016-20241010    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241010    clang-20
loongarch             randconfig-002-20241010    clang-20
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ci20_defconfig    gcc-14.1.0
mips                     cu1830-neo_defconfig    gcc-14.1.0
mips                          malta_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241010    clang-20
nios2                 randconfig-002-20241010    clang-20
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241010    clang-20
parisc                randconfig-002-20241010    clang-20
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    gcc-14.1.0
powerpc                     mpc83xx_defconfig    gcc-14.1.0
powerpc                      ppc6xx_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241010    clang-20
powerpc               randconfig-002-20241010    clang-20
powerpc               randconfig-003-20241010    clang-20
powerpc                     tqm8541_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241010    clang-20
powerpc64             randconfig-002-20241010    clang-20
powerpc64             randconfig-003-20241010    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.1.0
riscv                 randconfig-001-20241010    clang-20
riscv                 randconfig-002-20241010    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241010    clang-20
s390                  randconfig-002-20241010    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    gcc-14.1.0
sh                            hp6xx_defconfig    gcc-14.1.0
sh                    randconfig-001-20241010    clang-20
sh                    randconfig-002-20241010    clang-20
sh                   sh7770_generic_defconfig    gcc-14.1.0
sh                        sh7785lcr_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241010    clang-20
sparc64               randconfig-002-20241010    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241010    clang-20
um                    randconfig-002-20241010    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    gcc-14.1.0
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241010    gcc-12
x86_64      buildonly-randconfig-002-20241010    gcc-12
x86_64      buildonly-randconfig-003-20241010    gcc-12
x86_64      buildonly-randconfig-004-20241010    gcc-12
x86_64      buildonly-randconfig-005-20241010    gcc-12
x86_64      buildonly-randconfig-006-20241010    gcc-12
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241010    gcc-12
x86_64                randconfig-002-20241010    gcc-12
x86_64                randconfig-003-20241010    gcc-12
x86_64                randconfig-004-20241010    gcc-12
x86_64                randconfig-005-20241010    gcc-12
x86_64                randconfig-006-20241010    gcc-12
x86_64                randconfig-011-20241010    gcc-12
x86_64                randconfig-012-20241010    gcc-12
x86_64                randconfig-013-20241010    gcc-12
x86_64                randconfig-014-20241010    gcc-12
x86_64                randconfig-015-20241010    gcc-12
x86_64                randconfig-016-20241010    gcc-12
x86_64                randconfig-071-20241010    gcc-12
x86_64                randconfig-072-20241010    gcc-12
x86_64                randconfig-073-20241010    gcc-12
x86_64                randconfig-074-20241010    gcc-12
x86_64                randconfig-075-20241010    gcc-12
x86_64                randconfig-076-20241010    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241010    clang-20
xtensa                randconfig-002-20241010    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

