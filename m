Return-Path: <linux-gpio+bounces-14579-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C26A04947
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 19:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3418C1886F9A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 18:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD0A1F428A;
	Tue,  7 Jan 2025 18:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aa1/f0XA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACFC1F37DD
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jan 2025 18:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736274856; cv=none; b=INXq2VbarB0MkNNz8x6er7nda6gOuoCivXc8BD+0/QNfLmztu/VM02uzsCFcgNSk3O9jmWCcDKOmvxGusGoFyFfpJ5rPNZ1NdFyYGJW1t/haV6YiLiLQEQlUyi1WKtM5WbQq+5NZVXR/kty+2k/9Ua+QI98Aks61vjvK/ri0Jkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736274856; c=relaxed/simple;
	bh=1jsnuP91xkhzk2aIt6D5D6xjWI3Z7I9SVFm3v5lou7s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sG3Iqs2Xmc6TrJzuSRfkAVMjZlJicPBgNJ7LAMc5Bb6lvaTGGMxUkmWd1m7YRZ0qWtFWi3yof/JlyAcXcF9itmFtgphQQGsc6OdeWE/5gJoRHOyCgx/v1DoP17avazzX7UfMFRahEJBakHDRSmPd7j1Zg8cimwFm28Kv3OJ3Ht8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aa1/f0XA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736274854; x=1767810854;
  h=date:from:to:cc:subject:message-id;
  bh=1jsnuP91xkhzk2aIt6D5D6xjWI3Z7I9SVFm3v5lou7s=;
  b=Aa1/f0XAp8DMF/eSTrS6nZ1ldrxz4/wfiNMR/2qKrXc5LJVmvntiV0f8
   fZ+8vJUNxmZam+FLKxNZQSDcg8BwU8RiX6kvD5Y2WgUFS76mSFVnQU6g4
   cfpLyceCVZd+Wyr9/GX8cbuAU9XuNcBYKTceW1BERr/jmopg7nvW3PcPl
   X5l6RLDmp5SNAYk+ORg2sjgCx/5zmU7OTk+9/Hbcrxj548givd7vHb+q5
   1stugxJ1Aw3CncZgYRVaZquWBfnovvzLopVwgfS2ufaR2YhqQwQFuHDtl
   TOchfQ6dyKv23hPH+7jDYkjtVvhYNb/sTrsqMuJaBfj2sJaPqX5toaaIF
   A==;
X-CSE-ConnectionGUID: Y9eVEBS6RCSdvwPpaXLyiA==
X-CSE-MsgGUID: 6H+Ak0ZLRb2w2zLi9G+AXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47051990"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="47051990"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 10:34:13 -0800
X-CSE-ConnectionGUID: UjxUzbKES223v5OkDonA5w==
X-CSE-MsgGUID: wQ2SVefvSuuaoEjqN2WEEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107944744"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Jan 2025 10:34:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVEP4-000F62-1X;
	Tue, 07 Jan 2025 18:34:10 +0000
Date: Wed, 08 Jan 2025 02:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:at24/for-next] BUILD SUCCESS
 36036a164fac96727ed724a388dae38d2f5f21c1
Message-ID: <202501080200.Gv1b1M4l-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git at24/for-next
branch HEAD: 36036a164fac96727ed724a388dae38d2f5f21c1  dt-bindings: eeprom: at24: Add compatible for Puya P24C256C

elapsed time: 1257m

configs tested: 144
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                        nsimosci_defconfig    gcc-13.2.0
arc                   randconfig-001-20250107    gcc-13.2.0
arc                   randconfig-002-20250107    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250107    clang-20
arm                   randconfig-002-20250107    clang-19
arm                   randconfig-003-20250107    clang-20
arm                   randconfig-004-20250107    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250107    clang-15
arm64                 randconfig-002-20250107    clang-20
arm64                 randconfig-003-20250107    gcc-14.2.0
arm64                 randconfig-004-20250107    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250107    gcc-14.2.0
csky                  randconfig-002-20250107    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250107    clang-20
hexagon               randconfig-002-20250107    clang-20
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250107    clang-19
i386        buildonly-randconfig-001-20250108    gcc-12
i386        buildonly-randconfig-002-20250107    clang-19
i386        buildonly-randconfig-002-20250108    gcc-12
i386        buildonly-randconfig-003-20250107    clang-19
i386        buildonly-randconfig-003-20250108    gcc-12
i386        buildonly-randconfig-004-20250107    gcc-12
i386        buildonly-randconfig-004-20250108    gcc-12
i386        buildonly-randconfig-005-20250107    gcc-12
i386        buildonly-randconfig-005-20250108    gcc-12
i386        buildonly-randconfig-006-20250107    clang-19
i386        buildonly-randconfig-006-20250108    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250108    gcc-12
i386                  randconfig-002-20250108    gcc-12
i386                  randconfig-003-20250108    gcc-12
i386                  randconfig-004-20250108    gcc-12
i386                  randconfig-005-20250108    gcc-12
i386                  randconfig-006-20250108    gcc-12
i386                  randconfig-007-20250108    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250107    gcc-14.2.0
loongarch             randconfig-002-20250107    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250107    gcc-14.2.0
nios2                 randconfig-002-20250107    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250107    gcc-14.2.0
parisc                randconfig-002-20250107    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250107    gcc-14.2.0
powerpc               randconfig-002-20250107    gcc-14.2.0
powerpc               randconfig-003-20250107    clang-20
powerpc64             randconfig-001-20250107    clang-15
powerpc64             randconfig-002-20250107    clang-20
powerpc64             randconfig-003-20250107    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250107    clang-15
riscv                 randconfig-002-20250107    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250107    gcc-14.2.0
s390                  randconfig-002-20250107    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250107    gcc-14.2.0
sh                    randconfig-002-20250107    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250107    gcc-14.2.0
sparc                 randconfig-002-20250107    gcc-14.2.0
sparc64               randconfig-001-20250107    gcc-14.2.0
sparc64               randconfig-002-20250107    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250107    gcc-12
um                    randconfig-002-20250107    clang-20
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250107    clang-19
x86_64      buildonly-randconfig-001-20250108    gcc-12
x86_64      buildonly-randconfig-002-20250107    gcc-12
x86_64      buildonly-randconfig-002-20250108    gcc-12
x86_64      buildonly-randconfig-003-20250107    clang-19
x86_64      buildonly-randconfig-003-20250108    gcc-12
x86_64      buildonly-randconfig-004-20250107    gcc-12
x86_64      buildonly-randconfig-004-20250108    gcc-12
x86_64      buildonly-randconfig-005-20250107    clang-19
x86_64      buildonly-randconfig-005-20250108    gcc-12
x86_64      buildonly-randconfig-006-20250107    clang-19
x86_64      buildonly-randconfig-006-20250108    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-071-20250108    gcc-12
x86_64                randconfig-072-20250108    gcc-12
x86_64                randconfig-073-20250108    gcc-12
x86_64                randconfig-074-20250108    gcc-12
x86_64                randconfig-075-20250108    gcc-12
x86_64                randconfig-076-20250108    gcc-12
x86_64                randconfig-077-20250108    gcc-12
x86_64                randconfig-078-20250108    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                    rhel-9.4-kselftests    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250107    gcc-14.2.0
xtensa                randconfig-002-20250107    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

