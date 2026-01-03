Return-Path: <linux-gpio+bounces-30091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C5FCEFE49
	for <lists+linux-gpio@lfdr.de>; Sat, 03 Jan 2026 11:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBC493022AA1
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Jan 2026 10:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E946130B51B;
	Sat,  3 Jan 2026 10:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBT4lgIC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F4C22D4E9
	for <linux-gpio@vger.kernel.org>; Sat,  3 Jan 2026 10:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767437312; cv=none; b=uAqBQkLQL3vYFh8JLW5dTWGSXB6S4rEaoawlVg00P+5Ydx78T/Qs3AIOt0Jz6poCWfIe1+Peq3eBbBHamyXzmxheB7EvnHFe+/RG/+EfLRGInCBnnqdNluBpT2RBRPdLzwVplBSUoI/qLHT3aZ+ZtF8eRHeR6scyUVDkLFNfVPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767437312; c=relaxed/simple;
	bh=itUynhADnAjbqvIQPltMDkrfzGPxXtVmKZ2O3stCiu0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a+/1AvVOoFmGiwursCbs8vrbG4cdr3o5PVvNoCqolBm4tJMq1khHJ4ieGljDSFyidu6QnA34JaUEICFcs3CzvddGS+xyyj1OXQl3j3o39n1IrE1pY2kepN6FbpNNQFQFfmc/pausiHCy9ZAwzMZJ7MOOoP1+yRRBJoysdG5pDG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBT4lgIC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767437310; x=1798973310;
  h=date:from:to:cc:subject:message-id;
  bh=itUynhADnAjbqvIQPltMDkrfzGPxXtVmKZ2O3stCiu0=;
  b=BBT4lgICSuPOTKP4zNh782UoL1j9cLk808CSEVb3nvxAPPaG3eKZLwSF
   t56NVO/UlkBm1fekmOzNz8CpuqHvu9HfbJHIuNy4BVlH/XMa0leXDf255
   XrY8xzDVltFGkjV2uTiA3N8zN3cnhdKhYAjF/AWepZnqs/9FxoVtj3qCX
   AdnTo75OBGyzupXRoRsDhHClzuPkPJQ4k8PRyWKduxDZb2xaw84t1FCjH
   Z/Gj/Or5gK1zRh9VTC5psWWwhhhi88wYtFS+PvCqfDUHjQ+1qf13uJOMR
   pz9lIiFz8+uaPgQrw0u7WoiQx26TFZmA42EGRbUnBL19wmZLT2ckM8OGf
   w==;
X-CSE-ConnectionGUID: KrUKl3PiT4qtTmfJQKs1KA==
X-CSE-MsgGUID: A7i70ENVTNOG0x6dJIXhQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68965598"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="68965598"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 02:48:30 -0800
X-CSE-ConnectionGUID: dhVkpMAhT42pQb0l1s6dWA==
X-CSE-MsgGUID: LYa5UlXiQ26rqs7U17KMXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="206474056"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jan 2026 02:48:29 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbzBK-000000002gj-33eL;
	Sat, 03 Jan 2026 10:48:26 +0000
Date: Sat, 03 Jan 2026 18:47:49 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 1e876e5a0875e71e34148c9feb2eedd3bf6b2b43
Message-ID: <202601031841.N6ITqZuf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 1e876e5a0875e71e34148c9feb2eedd3bf6b2b43  gpio: mpsse: fix reference leak in gpio_mpsse_probe() error paths

elapsed time: 1482m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20260103    gcc-8.5.0
arc                   randconfig-002-20260103    gcc-12.5.0
arm                               allnoconfig    clang-22
arm                                 defconfig    clang-22
arm                   randconfig-001-20260103    gcc-10.5.0
arm                   randconfig-002-20260103    gcc-15.1.0
arm                   randconfig-003-20260103    gcc-11.5.0
arm                   randconfig-004-20260103    gcc-8.5.0
arm                             rpc_defconfig    clang-18
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20260103    clang-22
arm64                 randconfig-002-20260103    gcc-8.5.0
arm64                 randconfig-003-20260103    gcc-15.1.0
arm64                 randconfig-004-20260103    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20260103    gcc-15.1.0
csky                  randconfig-002-20260103    gcc-13.4.0
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20260103    clang-22
hexagon               randconfig-002-20260103    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20260103    gcc-14
i386        buildonly-randconfig-002-20260103    gcc-14
i386        buildonly-randconfig-003-20260103    gcc-14
i386        buildonly-randconfig-004-20260103    clang-20
i386        buildonly-randconfig-005-20260103    clang-20
i386        buildonly-randconfig-006-20260103    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20260103    gcc-14
i386                  randconfig-002-20260103    gcc-14
i386                  randconfig-003-20260103    gcc-14
i386                  randconfig-004-20260103    gcc-14
i386                  randconfig-005-20260103    clang-20
i386                  randconfig-006-20260103    clang-20
i386                  randconfig-007-20260103    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260103    gcc-15.1.0
loongarch             randconfig-002-20260103    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          rm200_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260103    gcc-8.5.0
nios2                 randconfig-002-20260103    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20260103    gcc-8.5.0
parisc                randconfig-002-20260103    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                       eiger_defconfig    clang-22
powerpc               randconfig-001-20260103    gcc-14.3.0
powerpc               randconfig-002-20260103    clang-17
powerpc64             randconfig-001-20260103    gcc-14.3.0
powerpc64             randconfig-002-20260103    gcc-13.4.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20260103    clang-22
riscv                 randconfig-002-20260103    gcc-13.4.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20260103    gcc-12.5.0
s390                  randconfig-002-20260103    gcc-8.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          polaris_defconfig    gcc-15.1.0
sh                    randconfig-001-20260103    gcc-12.5.0
sh                    randconfig-002-20260103    gcc-15.1.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20260103    gcc-12.5.0
sparc                 randconfig-002-20260103    gcc-12.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260103    clang-22
sparc64               randconfig-002-20260103    gcc-13.4.0
um                               alldefconfig    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260103    gcc-14
um                    randconfig-002-20260103    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20260103    gcc-14
x86_64      buildonly-randconfig-002-20260103    clang-20
x86_64      buildonly-randconfig-003-20260103    clang-20
x86_64      buildonly-randconfig-004-20260103    gcc-14
x86_64      buildonly-randconfig-006-20260103    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260103    clang-20
x86_64                randconfig-002-20260103    clang-20
x86_64                randconfig-003-20260103    clang-20
x86_64                randconfig-004-20260103    clang-20
x86_64                randconfig-005-20260103    gcc-14
x86_64                randconfig-006-20260103    clang-20
x86_64                randconfig-011-20260103    gcc-14
x86_64                randconfig-012-20260103    gcc-14
x86_64                randconfig-013-20260103    gcc-14
x86_64                randconfig-014-20260103    gcc-14
x86_64                randconfig-015-20260103    gcc-14
x86_64                randconfig-016-20260103    clang-20
x86_64                randconfig-071-20260103    gcc-14
x86_64                randconfig-072-20260103    gcc-14
x86_64                randconfig-073-20260103    clang-20
x86_64                randconfig-074-20260103    clang-20
x86_64                randconfig-075-20260103    clang-20
x86_64                randconfig-076-20260103    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20260103    gcc-9.5.0
xtensa                randconfig-002-20260103    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

