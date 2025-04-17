Return-Path: <linux-gpio+bounces-18995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AA3A9133C
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 07:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 530083AB146
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 05:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19971DE2DB;
	Thu, 17 Apr 2025 05:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbxofH/N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6940679C4
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 05:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744868887; cv=none; b=pEL74mdpkvD+zOEHpB1me7CtWpbmwRE2qgqgSl/pxQhE19faTeknrNu4mul0OSqBRTEc74Bj8m6yeqJ/ouVisAATKpvO2jXkptOZ9ud0c+HQliwH5FGaoM0lTzpqZeVVY7dR2G9pX46lGPW97lZFmUb8GJBeVyXEBfuIVq/modU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744868887; c=relaxed/simple;
	bh=OjFvbmLDT71VyrYqK00yzGOsGSOJSdh1yEjEYX0peCw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U/YhpwDsj/HVAZ9RrJNmG7u/JDA+D2EFPORUR3QjuHoa0JKBuP/GRBAlsW88lTA7aJK7MJiWIAgbUqIPOP4bYkAtNp1Gtrq9rkqZCh8xSeDRDhob90ea6raXzKcd3FKV4IdISShRiqLZuY43Q0kaGwwapJUO8xgaN0Akz2HwiBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IbxofH/N; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744868886; x=1776404886;
  h=date:from:to:cc:subject:message-id;
  bh=OjFvbmLDT71VyrYqK00yzGOsGSOJSdh1yEjEYX0peCw=;
  b=IbxofH/NdzpqIuRFAFkz9H74otC3jqL/e8e9cXNkqcn5XJlc6o/8sW4n
   2pxdJEaRPXNJV105NjAH3u/MFPmdFs73ZVU/5bxHdl0f2UjQ7LcCJfP46
   ny3TjT7PTlENglvSmXeQM9Oekh2ye1lOZmPk+DNVkF578EOK/6DFSjEkF
   1rMdsJRJ1j4kbA3XTDa9uPrN2Rdjslyr+qMF7g6avR240ss7BkjQls8KI
   KY1Bal5rDd095M4AM16r58Cn1GUm7T4veikUnqdGwN0dTlzVKmgcpdjFJ
   cdIB5r1mQ/sYhS2c/385uDeWM0v2atk0dEPeCZOxWSGo0TJtWjsOaeVVG
   A==;
X-CSE-ConnectionGUID: S1k4A8vRRNS3vcy1aztxaQ==
X-CSE-MsgGUID: OHf+FOWpRsuWUK3FLure8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50088862"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="50088862"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 22:48:05 -0700
X-CSE-ConnectionGUID: hE502j1aSji5H1SbEW1l4A==
X-CSE-MsgGUID: ohn5tt8CRz+V/yqzzU8ytw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="130685371"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Apr 2025 22:48:05 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5I6T-000LRt-2w;
	Thu, 17 Apr 2025 05:48:01 +0000
Date: Thu, 17 Apr 2025 13:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 370b7e8e4665052e0b6e883e44c4134cc3017fe5
Message-ID: <202504171323.9WEtKKuc-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 370b7e8e4665052e0b6e883e44c4134cc3017fe5  Merge branch 'devel' into for-next

elapsed time: 1469m

configs tested: 109
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250416    gcc-12.4.0
arc                   randconfig-002-20250416    gcc-10.5.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          collie_defconfig    gcc-14.2.0
arm                      footbridge_defconfig    clang-17
arm                       imx_v4_v5_defconfig    clang-21
arm                        mvebu_v7_defconfig    clang-21
arm                   randconfig-001-20250416    clang-17
arm                   randconfig-002-20250416    gcc-7.5.0
arm                   randconfig-003-20250416    clang-21
arm                   randconfig-004-20250416    clang-19
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250416    gcc-8.5.0
arm64                 randconfig-002-20250416    clang-21
arm64                 randconfig-003-20250416    gcc-6.5.0
arm64                 randconfig-004-20250416    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250416    gcc-14.2.0
csky                  randconfig-002-20250416    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250416    clang-21
hexagon               randconfig-002-20250416    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250416    clang-20
i386        buildonly-randconfig-002-20250416    gcc-12
i386        buildonly-randconfig-003-20250416    gcc-12
i386        buildonly-randconfig-004-20250416    gcc-11
i386        buildonly-randconfig-005-20250416    clang-20
i386        buildonly-randconfig-006-20250416    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250416    gcc-14.2.0
loongarch             randconfig-002-20250416    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250416    gcc-6.5.0
nios2                 randconfig-002-20250416    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250416    gcc-11.5.0
parisc                randconfig-002-20250416    gcc-7.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                      ppc64e_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250416    gcc-8.5.0
powerpc               randconfig-002-20250416    clang-21
powerpc               randconfig-003-20250416    clang-21
powerpc64             randconfig-001-20250416    clang-21
powerpc64             randconfig-002-20250416    clang-21
powerpc64             randconfig-003-20250416    gcc-6.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250416    clang-20
riscv                 randconfig-002-20250416    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250416    clang-21
s390                  randconfig-002-20250416    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250416    gcc-14.2.0
sh                    randconfig-002-20250416    gcc-6.5.0
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7780_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250416    gcc-11.5.0
sparc                 randconfig-002-20250416    gcc-11.5.0
sparc64               randconfig-001-20250416    gcc-5.5.0
sparc64               randconfig-002-20250416    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250416    clang-21
um                    randconfig-002-20250416    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250416    gcc-12
x86_64      buildonly-randconfig-002-20250416    gcc-12
x86_64      buildonly-randconfig-003-20250416    gcc-12
x86_64      buildonly-randconfig-004-20250416    clang-20
x86_64      buildonly-randconfig-005-20250416    clang-20
x86_64      buildonly-randconfig-006-20250416    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250416    gcc-7.5.0
xtensa                randconfig-002-20250416    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

