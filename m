Return-Path: <linux-gpio+bounces-11227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C86E99B019
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 04:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94A0A284843
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 02:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767C311CAF;
	Sat, 12 Oct 2024 02:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+a8HZl+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F551DF51
	for <linux-gpio@vger.kernel.org>; Sat, 12 Oct 2024 02:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728700552; cv=none; b=mdI3anlbb1lWNQqrkRM5Er2o7V28M3Iwlpvs4D/mqpMB04tHs98r41b9nBeVrUvCROwNMyk6McXQsgUBjQPBAo5smGLkvR4CLY3vrakuFImTh7e/DRFdK6gS32s1qJvuSHSUrT9QsAI2uhOSAoJfn9rLxjMlNuTne4C0e0JmY3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728700552; c=relaxed/simple;
	bh=NHYuNTxjKs6AZEotF+fEoMTJrgEVhBmpWgem4yqx7OQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fnSH/ChkJV5x6CgrmpZ76N9Ca/zsBWkCe2kLQWRzxkpWob9ZQNNZeH8AGCnx6peXMfKFvxL/Gu02yZoVh1IBBAJOJpVkY9DNheXBvGlpZ4bpUu+lyVl5VAdCTDNF6+3pTdb9y50jqR0CY9AFX7KV7Ijb9gSTFLBvBDL4UDYHyhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+a8HZl+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728700550; x=1760236550;
  h=date:from:to:cc:subject:message-id;
  bh=NHYuNTxjKs6AZEotF+fEoMTJrgEVhBmpWgem4yqx7OQ=;
  b=V+a8HZl+hZ5kLG0a8ndT7SS6KfyXJ2TvvzVhLafoKKTjbzEBQL/qGp4B
   1PdFNbNf5STGtJJuy/tSfTTaJUH7jReGY0r/1iRbov45SDRx8GRpEEqJj
   WtsaaohhnzslmGRZv34LwLBybZP/G659KGUFtEguZ8cMtR5Q1iZcIJCGY
   +By6+89u80/KWWDdX0p2/NU7H9nZmyfOVFjM+PK+C3X2AV91nPubBdXbR
   m3T0yi2j+yG9qym2nLl4pKd/cw5VKvN8SYN8Gm//r+phYCkSOChAdWiyy
   GnRw5XgeOBnL7gHQpnHuxw5MltE2itNL+MnvVKSaLVqE1FctWPU4bS/mY
   A==;
X-CSE-ConnectionGUID: AkAgrrnIR0mFzCHpHRdXNg==
X-CSE-MsgGUID: wFtjSmjTSj6GL6INtfXW2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53536657"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="53536657"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 19:35:50 -0700
X-CSE-ConnectionGUID: 0zStjhnHT0SgGnk84IOnEg==
X-CSE-MsgGUID: jrYrXMP8RJmPCK131586Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="114536481"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Oct 2024 19:35:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szRys-000Cxj-1J;
	Sat, 12 Oct 2024 02:35:46 +0000
Date: Sat, 12 Oct 2024 10:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 4575962aeed63aca975756852ab0c550164f849f
Message-ID: <202410121045.H4A6EFfN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 4575962aeed63aca975756852ab0c550164f849f  pinctrl: sophgo: fix double free in cv1800_pctrl_dt_node_to_map()

elapsed time: 977m

configs tested: 94
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
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241012    gcc-12
i386        buildonly-randconfig-002-20241012    gcc-12
i386        buildonly-randconfig-003-20241012    gcc-12
i386        buildonly-randconfig-004-20241012    gcc-12
i386        buildonly-randconfig-005-20241012    gcc-12
i386        buildonly-randconfig-006-20241012    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241012    gcc-12
i386                  randconfig-002-20241012    gcc-12
i386                  randconfig-003-20241012    gcc-12
i386                  randconfig-004-20241012    gcc-12
i386                  randconfig-005-20241012    gcc-12
i386                  randconfig-006-20241012    gcc-12
i386                  randconfig-011-20241012    gcc-12
i386                  randconfig-012-20241012    gcc-12
i386                  randconfig-013-20241012    gcc-12
i386                  randconfig-014-20241012    gcc-12
i386                  randconfig-015-20241012    gcc-12
i386                  randconfig-016-20241012    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

