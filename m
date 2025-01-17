Return-Path: <linux-gpio+bounces-14883-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0159FA14E52
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 12:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EADE188754B
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 11:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D1F1FCF47;
	Fri, 17 Jan 2025 11:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmxamqAF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0F01FC118
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2025 11:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737112772; cv=none; b=Bveccca6v1LOEmVXyoMNGyE1rQMc+bUpj65227OCUB/Udh4EQZR419GHMZQyz5rluyfC3dmyVy3mAY50cWzJOKIgT3xpZK25w2LfnjrTB/U0vfy38hHn/EqL5OIX9VP8MCcpUzOnb+5/+7wsREXtm07j0+O49E5h5rKEsKCxsOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737112772; c=relaxed/simple;
	bh=hDkq7kHD0azkh07R/DqQqMJG3qtP48VnBrIOiBa7Hk4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F6basQmF7iKNyWJ7lVnliyp6E2f8EQ9Q9opq8D/zdrdESOUL1wJLNwXymxfdzyize+EtG4YP9zIRZvYnPjHwGhpZFwTi/LI++oq3tRsx7gR3ERdCr7vByT9wIYw2idRJi1kaRmZUlB7JpihIaGdiRhBf9GJjWuGK6oKBiDf0n1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmxamqAF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737112771; x=1768648771;
  h=date:from:to:cc:subject:message-id;
  bh=hDkq7kHD0azkh07R/DqQqMJG3qtP48VnBrIOiBa7Hk4=;
  b=cmxamqAFrll10DappFRNjADnliScAOEfRRs7FbnSFj5k/ZFQ7CTQHpLJ
   V8ZbsjfjKDQ9bYlP0zaBPujz9e8A4pNQUWqkWHmqYTOaAWzJhqTeM9890
   fi9LIPdcDewJ9JWk03r3WaUr1GsnZhOcHbG/eKzjOqabMpG3XyNu/UTDh
   Yw/GDQOq7a9R93jbmTd6rj0vtid9F3Rh6XeCbOwO8OpMbmOgqFT/skB2q
   0I89c+WwyLIBjDdH+OpIyt4Mm9dvxPPM8/LgEixt/7dEKUcKw9BqRXLLF
   qCLTf1IE6ZOpAdPrRP/1A32+39+EQjUSel8oaJiVkOqqkdd+Hl6iRNgMF
   w==;
X-CSE-ConnectionGUID: 7lgRjhNkQh2rVHG3WsBEjQ==
X-CSE-MsgGUID: I98B0gjpTSmOonJ4P63gaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="25137640"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="25137640"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 03:19:30 -0800
X-CSE-ConnectionGUID: Qzp0wugsRVOPzHNhwk4+EQ==
X-CSE-MsgGUID: C3eS9fQOQd+6WXK7/IecNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105742490"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jan 2025 03:19:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYkNq-000T83-1g;
	Fri, 17 Jan 2025 11:19:26 +0000
Date: Fri, 17 Jan 2025 19:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 c9da9958ba14d89fdf360872c36dc89f4c70861f
Message-ID: <202501171914.AfOYYOxt-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: c9da9958ba14d89fdf360872c36dc89f4c70861f  dt-bindings: pinctrl: sunxi: add compatible for V853

elapsed time: 1447m

configs tested: 101
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250116    gcc-13.2.0
arc                   randconfig-002-20250116    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-15
arm                   randconfig-001-20250116    gcc-14.2.0
arm                   randconfig-002-20250116    clang-15
arm                   randconfig-003-20250116    gcc-14.2.0
arm                   randconfig-004-20250116    gcc-14.2.0
arm                         socfpga_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250116    gcc-14.2.0
arm64                 randconfig-002-20250116    gcc-14.2.0
arm64                 randconfig-003-20250116    clang-15
arm64                 randconfig-004-20250116    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250116    gcc-14.2.0
csky                  randconfig-002-20250116    gcc-14.2.0
hexagon                          alldefconfig    clang-15
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250116    clang-20
hexagon               randconfig-002-20250116    clang-20
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250116    clang-19
i386        buildonly-randconfig-002-20250116    clang-19
i386        buildonly-randconfig-003-20250116    clang-19
i386        buildonly-randconfig-004-20250116    clang-19
i386        buildonly-randconfig-005-20250116    clang-19
i386        buildonly-randconfig-006-20250116    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250116    gcc-14.2.0
loongarch             randconfig-002-20250116    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250116    gcc-14.2.0
nios2                 randconfig-002-20250116    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250116    gcc-14.2.0
parisc                randconfig-002-20250116    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250116    clang-20
powerpc               randconfig-002-20250116    gcc-14.2.0
powerpc               randconfig-003-20250116    clang-20
powerpc64             randconfig-001-20250116    clang-19
powerpc64             randconfig-002-20250116    clang-20
powerpc64             randconfig-003-20250116    clang-15
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250116    gcc-14.2.0
riscv                 randconfig-002-20250116    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250116    gcc-14.2.0
s390                  randconfig-002-20250116    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250116    gcc-14.2.0
sh                    randconfig-002-20250116    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250116    gcc-14.2.0
sparc                 randconfig-002-20250116    gcc-14.2.0
sparc64               randconfig-001-20250116    gcc-14.2.0
sparc64               randconfig-002-20250116    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20250116    clang-19
um                    randconfig-002-20250116    gcc-12
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250116    gcc-12
x86_64      buildonly-randconfig-002-20250116    gcc-12
x86_64      buildonly-randconfig-003-20250116    gcc-12
x86_64      buildonly-randconfig-004-20250116    clang-19
x86_64      buildonly-randconfig-005-20250116    clang-19
x86_64      buildonly-randconfig-006-20250116    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250116    gcc-14.2.0
xtensa                randconfig-002-20250116    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

