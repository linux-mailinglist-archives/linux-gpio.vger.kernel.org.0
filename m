Return-Path: <linux-gpio+bounces-23071-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F14AFFE7B
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 11:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D50F3B3E2E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 09:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAE22D3EFC;
	Thu, 10 Jul 2025 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhtSfIgq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8BA2D3EF6
	for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 09:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752141114; cv=none; b=SC7yW9f7qTYTVKzsb3Xm54ZsqIZy+lJ8oKx/ldUMNH33vQHHkk5m/eF/dVohdcTD2gMgguDiwGzyI7ebP2B6pla4HcH6WSpk8SLbgcIbjEZGPTlxO5azvJ5q6eXHFkrUTS/vrdEnG+N6BJc6S1joZxWIFls/oXe7QwyE56P9Tp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752141114; c=relaxed/simple;
	bh=PllmbCKx/URGIMwfYD/sL+QQQqc0ok/vrANiPeDksV8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IUfcLe65H9ltGiRzixN9v1IedyM+P8Yl7JPhnCL3gYWi65QmZaDrU1VFFhzQgic3gvJqcK+kBYGqrsXv1d3+YNqfPlB2dVQ4TjrSDYrSiB41OCRRxJEn9B2fnnk1CPYbAoHmyZes2Gq50cNh1Pf2oKDpAH2X70wK0a0Ms0u1X7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhtSfIgq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752141112; x=1783677112;
  h=date:from:to:cc:subject:message-id;
  bh=PllmbCKx/URGIMwfYD/sL+QQQqc0ok/vrANiPeDksV8=;
  b=FhtSfIgqmv1Dnk8ic6408LSh79Hsh0u19Y+cJsi2N32hMr7P+B3y32xb
   EM4/ifOvKVsfloSEj3Wd+i9Fn/Bn0ybN4GQqs+0iY+woyE32j4jexFVVX
   4yAknS7HcQBpedfzeXY6qUBZ3pNVslbidZuNMLOv7dDrVpaqb7Fg9t0P7
   LW2RygJNHgGTBJh9EihDEFX3uBFFgAjIbz7OMvS8KuhEnsGSOSihOmNb6
   z16NOj2OjnrAmRHvQvItXCeO8ZZ/L+cwKP42B0tSMgK9OAfdZyVX6gS9a
   kr2ScM27pHQbDWzjiDUaBXWyrO3GI568qqBdL/q/myClVwG5z2kVIvM8s
   Q==;
X-CSE-ConnectionGUID: V6n6lAfbRuOylhwEfVHXSQ==
X-CSE-MsgGUID: PvMMBJpmS4eD2qMVK0kCxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="58221811"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="58221811"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 02:51:51 -0700
X-CSE-ConnectionGUID: J+VZr5G5QcGldcvBHS/xqg==
X-CSE-MsgGUID: muPe1BrYTfitZ2nZEY/Y+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="155796378"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Jul 2025 02:51:50 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZnwR-0004t1-2F;
	Thu, 10 Jul 2025 09:51:47 +0000
Date: Thu, 10 Jul 2025 17:51:43 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 d563e7f95c933816efe531c3a48e22bc099c0f55
Message-ID: <202507101731.iGs009lw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: d563e7f95c933816efe531c3a48e22bc099c0f55  gpio: of: initialize local variable passed to the .of_xlate() callback

elapsed time: 1132m

configs tested: 224
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-21
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                   randconfig-001-20250710    clang-21
arc                   randconfig-001-20250710    gcc-15.1.0
arc                   randconfig-002-20250710    clang-21
arc                   randconfig-002-20250710    gcc-12.4.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                   randconfig-001-20250710    clang-21
arm                   randconfig-001-20250710    gcc-8.5.0
arm                   randconfig-002-20250710    clang-21
arm                   randconfig-003-20250710    clang-21
arm                   randconfig-004-20250710    clang-21
arm                   randconfig-004-20250710    gcc-8.5.0
arm                           spitz_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-21
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250710    clang-21
arm64                 randconfig-002-20250710    clang-21
arm64                 randconfig-003-20250710    clang-21
arm64                 randconfig-003-20250710    gcc-8.5.0
arm64                 randconfig-004-20250710    clang-21
csky                              allnoconfig    clang-21
csky                                defconfig    clang-19
csky                  randconfig-001-20250710    gcc-15.1.0
csky                  randconfig-002-20250710    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250710    clang-21
hexagon               randconfig-001-20250710    gcc-15.1.0
hexagon               randconfig-002-20250710    clang-21
hexagon               randconfig-002-20250710    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250710    clang-20
i386        buildonly-randconfig-001-20250710    gcc-12
i386        buildonly-randconfig-002-20250710    clang-20
i386        buildonly-randconfig-002-20250710    gcc-12
i386        buildonly-randconfig-003-20250710    clang-20
i386        buildonly-randconfig-004-20250710    clang-20
i386        buildonly-randconfig-004-20250710    gcc-11
i386        buildonly-randconfig-005-20250710    clang-20
i386        buildonly-randconfig-006-20250710    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250710    gcc-12
i386                  randconfig-002-20250710    gcc-12
i386                  randconfig-003-20250710    gcc-12
i386                  randconfig-004-20250710    gcc-12
i386                  randconfig-005-20250710    gcc-12
i386                  randconfig-006-20250710    gcc-12
i386                  randconfig-007-20250710    gcc-12
i386                  randconfig-011-20250710    clang-20
i386                  randconfig-012-20250710    clang-20
i386                  randconfig-013-20250710    clang-20
i386                  randconfig-014-20250710    clang-20
i386                  randconfig-015-20250710    clang-20
i386                  randconfig-016-20250710    clang-20
i386                  randconfig-017-20250710    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250710    gcc-14.3.0
loongarch             randconfig-001-20250710    gcc-15.1.0
loongarch             randconfig-002-20250710    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                         apollo_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                       m5249evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    gcc-15.1.0
mips                 decstation_r4k_defconfig    gcc-15.1.0
mips                           rs90_defconfig    gcc-15.1.0
mips                   sb1250_swarm_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                            allyesconfig    clang-21
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250710    gcc-15.1.0
nios2                 randconfig-001-20250710    gcc-9.3.0
nios2                 randconfig-002-20250710    gcc-12.4.0
nios2                 randconfig-002-20250710    gcc-15.1.0
openrisc                         allmodconfig    clang-21
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250710    gcc-15.1.0
parisc                randconfig-001-20250710    gcc-8.5.0
parisc                randconfig-002-20250710    gcc-15.1.0
parisc                randconfig-002-20250710    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20250710    gcc-12.4.0
powerpc               randconfig-001-20250710    gcc-15.1.0
powerpc               randconfig-002-20250710    gcc-15.1.0
powerpc               randconfig-002-20250710    gcc-9.3.0
powerpc               randconfig-003-20250710    gcc-15.1.0
powerpc               randconfig-003-20250710    gcc-8.5.0
powerpc64             randconfig-001-20250710    gcc-11.5.0
powerpc64             randconfig-001-20250710    gcc-15.1.0
powerpc64             randconfig-002-20250710    clang-17
powerpc64             randconfig-002-20250710    gcc-15.1.0
powerpc64             randconfig-003-20250710    gcc-14.3.0
powerpc64             randconfig-003-20250710    gcc-15.1.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250710    gcc-12.4.0
riscv                 randconfig-001-20250710    gcc-15.1.0
riscv                 randconfig-002-20250710    gcc-10.5.0
riscv                 randconfig-002-20250710    gcc-12.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250710    gcc-12.4.0
s390                  randconfig-001-20250710    gcc-14.3.0
s390                  randconfig-002-20250710    clang-17
s390                  randconfig-002-20250710    gcc-12.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250710    gcc-12.4.0
sh                    randconfig-001-20250710    gcc-15.1.0
sh                    randconfig-002-20250710    gcc-12.4.0
sh                    randconfig-002-20250710    gcc-13.4.0
sh                           se7780_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    clang-21
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250710    gcc-12.4.0
sparc                 randconfig-001-20250710    gcc-13.4.0
sparc                 randconfig-002-20250710    gcc-12.4.0
sparc                 randconfig-002-20250710    gcc-14.3.0
sparc64                          allmodconfig    clang-21
sparc64                          allyesconfig    clang-21
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250710    gcc-12.4.0
sparc64               randconfig-001-20250710    gcc-8.5.0
sparc64               randconfig-002-20250710    gcc-12.4.0
sparc64               randconfig-002-20250710    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250710    gcc-11
um                    randconfig-001-20250710    gcc-12.4.0
um                    randconfig-002-20250710    clang-16
um                    randconfig-002-20250710    gcc-12.4.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250710    clang-20
x86_64      buildonly-randconfig-001-20250710    gcc-12
x86_64      buildonly-randconfig-002-20250710    clang-20
x86_64      buildonly-randconfig-002-20250710    gcc-12
x86_64      buildonly-randconfig-003-20250710    clang-20
x86_64      buildonly-randconfig-003-20250710    gcc-12
x86_64      buildonly-randconfig-004-20250710    clang-20
x86_64      buildonly-randconfig-005-20250710    clang-20
x86_64      buildonly-randconfig-006-20250710    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250710    gcc-12
x86_64                randconfig-002-20250710    gcc-12
x86_64                randconfig-003-20250710    gcc-12
x86_64                randconfig-004-20250710    gcc-12
x86_64                randconfig-005-20250710    gcc-12
x86_64                randconfig-006-20250710    gcc-12
x86_64                randconfig-007-20250710    gcc-12
x86_64                randconfig-008-20250710    gcc-12
x86_64                randconfig-071-20250710    gcc-11
x86_64                randconfig-072-20250710    gcc-11
x86_64                randconfig-073-20250710    gcc-11
x86_64                randconfig-074-20250710    gcc-11
x86_64                randconfig-075-20250710    gcc-11
x86_64                randconfig-076-20250710    gcc-11
x86_64                randconfig-077-20250710    gcc-11
x86_64                randconfig-078-20250710    gcc-11
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-21
xtensa                randconfig-001-20250710    gcc-12.4.0
xtensa                randconfig-002-20250710    gcc-12.4.0
xtensa                randconfig-002-20250710    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

