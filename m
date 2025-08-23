Return-Path: <linux-gpio+bounces-24843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2D1B32866
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Aug 2025 13:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4E245E1C6B
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Aug 2025 11:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BB524DD0B;
	Sat, 23 Aug 2025 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFnpQxIV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215E71DE8BE
	for <linux-gpio@vger.kernel.org>; Sat, 23 Aug 2025 11:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755950097; cv=none; b=eKv0u4GOBzqt4NzzrSiwApqkFWK2a1wQMP62HSSuhviqaZ6Xs+y3yblczb5ZhdfB6HJuOty26OQaeRFSEG0AbAsLwSacvaWmq1tnsbxkpg2JisZkmmZxqa0xpSxRDANVUNN429K4cmY/EmmPkcPM3yO+AWrquvZGc8vnO9STn9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755950097; c=relaxed/simple;
	bh=hsYnU6d9YpD+zurcmGdcXgAtQ6UgAWQoBKyhHkE4PAk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lPM3d4nsejp04dCxsSZqrS1/NDSr3wDzU2adfRks+V4VMva9z3jjI8gPhZlIrAL1RH/HfI2FCKowu7IHf7qzFCKrjWjjMKuaPZCcV6uHtR0QmRoYKgR8c5I32ZNHqqHvZqTOvZMcp7IqPxbUPuiZ5KDQWRHsQBLyDmbQSpwXjuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFnpQxIV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755950096; x=1787486096;
  h=date:from:to:cc:subject:message-id;
  bh=hsYnU6d9YpD+zurcmGdcXgAtQ6UgAWQoBKyhHkE4PAk=;
  b=WFnpQxIVt5qRLDxj6iTKYsHqx83H9wWwjIt6et7Li1/bLHn5RWkwGXhn
   amzCRlFuE1VeOP0Dx8aIs2jX/uryza9nL8/AEBifX7jgOZ6AQ4NP+S23F
   hVfJTnDJjsdAo5Lor0jv5LwqgtB0NcPvt5icHOhH0jlmmQeoPeawr8RDg
   KmH1h3ZvQCZxt3thKVkxvbgj1Dwh4fbmRgZ4Usu7Q7656vPtHWe8fJ6W3
   2D004e5H5SM4FfhVZVK6pKyN2kjMzsLWSGowxF70WYOgee9QiNWOKPNOF
   s0gMJJN/Voxv/Gx/aS6C6fxuB75LRxT4Ca9xYi+f7RAqR3I+Y1eBcQthG
   g==;
X-CSE-ConnectionGUID: ETRE7jxeRM6MIWMA1K8fjg==
X-CSE-MsgGUID: PDrnQYKhQ8KMBD3Nu0JOyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68940071"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68940071"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 04:54:56 -0700
X-CSE-ConnectionGUID: +MU9mPLlTWSZnIqwaSnFSQ==
X-CSE-MsgGUID: TKzvRxXMT5ORuFWUnoQASA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173176161"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Aug 2025 04:54:54 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upmpg-000MHr-15;
	Sat, 23 Aug 2025 11:54:52 +0000
Date: Sat, 23 Aug 2025 19:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 7a399ce67e981f5f28afc1ff50772acd1f4e7bbf
Message-ID: <202508231922.uiyj8L2E-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 7a399ce67e981f5f28afc1ff50772acd1f4e7bbf  pinctrl: amd: Don't access irq_data's hwirq member directly

elapsed time: 1293m

configs tested: 120
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250823    gcc-9.5.0
arc                   randconfig-002-20250823    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                          exynos_defconfig    clang-22
arm                      jornada720_defconfig    clang-22
arm                   randconfig-001-20250823    clang-17
arm                   randconfig-002-20250823    gcc-15.1.0
arm                   randconfig-003-20250823    clang-20
arm                   randconfig-004-20250823    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250823    gcc-11.5.0
arm64                 randconfig-002-20250823    clang-22
arm64                 randconfig-003-20250823    clang-22
arm64                 randconfig-004-20250823    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250822    gcc-9.5.0
csky                  randconfig-002-20250822    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250822    clang-22
hexagon               randconfig-002-20250822    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250823    clang-20
i386        buildonly-randconfig-002-20250823    clang-20
i386        buildonly-randconfig-003-20250823    clang-20
i386        buildonly-randconfig-004-20250823    clang-20
i386        buildonly-randconfig-005-20250823    clang-20
i386        buildonly-randconfig-006-20250823    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250822    clang-22
loongarch             randconfig-002-20250822    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    clang-18
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250822    gcc-11.5.0
nios2                 randconfig-002-20250822    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250822    gcc-9.5.0
parisc                randconfig-002-20250822    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                    ge_imp3a_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250822    clang-22
powerpc               randconfig-002-20250822    gcc-11.5.0
powerpc               randconfig-003-20250822    clang-18
powerpc64             randconfig-001-20250822    gcc-13.4.0
powerpc64             randconfig-002-20250822    clang-22
powerpc64             randconfig-003-20250822    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250823    clang-22
riscv                 randconfig-002-20250823    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250823    gcc-9.5.0
s390                  randconfig-002-20250823    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250823    gcc-15.1.0
sh                    randconfig-002-20250823    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250823    gcc-8.5.0
sparc                 randconfig-002-20250823    gcc-8.5.0
sparc64               randconfig-001-20250823    gcc-8.5.0
sparc64               randconfig-002-20250823    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250823    clang-22
um                    randconfig-002-20250823    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250822    clang-20
x86_64      buildonly-randconfig-002-20250822    gcc-12
x86_64      buildonly-randconfig-003-20250822    clang-20
x86_64      buildonly-randconfig-004-20250822    clang-20
x86_64      buildonly-randconfig-005-20250822    clang-20
x86_64      buildonly-randconfig-006-20250822    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250823    gcc-15.1.0
xtensa                randconfig-002-20250823    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

