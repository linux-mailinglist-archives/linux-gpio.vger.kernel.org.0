Return-Path: <linux-gpio+bounces-23358-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAA3B0772E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 15:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE7E01897AF5
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 13:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D16A1C6FE9;
	Wed, 16 Jul 2025 13:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llEN5Py1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9111C5D44
	for <linux-gpio@vger.kernel.org>; Wed, 16 Jul 2025 13:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752673349; cv=none; b=XfhXK5/lk2UpzDfo5fkdN3ZYPeIzO5M4blZ2Jvf9V8RJ70uM34l/UMA9cmxyRMq1qXR6iL285fPRXFtH6Q0SUXHInar81xC1SzrRvsbb8p+467LwMeYJPd9SvH2Og+VgmWwl1Mx+t9UfwCom9bDshE96XEcK1kfJbGC9FFe8/TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752673349; c=relaxed/simple;
	bh=CbO3J8lrGfatM8YPfBm2K36NUwPjCmwUsCsJa5fza4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HG+x5vze/b0E+T7vwxhUFznk0pa6voABy4tHTx2vQ0o+kpSAK95fNaN3vSeGsn21mM5g/rKGUJzKk5jeHxmvWi8ywXf3U+IaWKuJhWRCji3GbTh+yIrguaJugCgAtEb0g2fIICXZ1/XBJiovhfSxMO821Sa5sGE9uy7Htwv30zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=llEN5Py1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752673348; x=1784209348;
  h=date:from:to:cc:subject:message-id;
  bh=CbO3J8lrGfatM8YPfBm2K36NUwPjCmwUsCsJa5fza4c=;
  b=llEN5Py1KBq2UDbTkNg/4NtCUcYJj+5sI3UJ6QQ0AOlsNxDm9ZkQ7eMA
   pCKQo14sRi78AQMklaBfsU2vrgspTrDZMjpaEkTUBZOBxlN468QJqdj+x
   zrbf3/PbVq4ZazKmLsK/Z9N7DWd3zOWQ8BG91ZWGZvW+AtUAHPHmIgF+c
   GlCdjEJ9XRPfF1IaB0OF0iZAclxiUoOS+urM5U+vnwboMm/ivBRE2l/Ud
   z9zGgsJuAbRd+MVC59UcGvtP6WiYd8rRDxcuEPaO94z+P18dspScldjJW
   d2unRcG/gDdBkTHbFgaQWJJyzEeFUJjh06KpMkT8iDdsFaoHNj8ZFJcyh
   w==;
X-CSE-ConnectionGUID: tTrKN+AtR6ye9tsDSPaRSw==
X-CSE-MsgGUID: fnJSiikAQjC6supe/bYR4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55040710"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="55040710"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 06:42:27 -0700
X-CSE-ConnectionGUID: pl8PNL9rTy61wzB8rFLj/Q==
X-CSE-MsgGUID: nkyebd6KRn+EFd6a93Ql/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="181198826"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jul 2025 06:42:25 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uc2Ot-000CSD-0p;
	Wed, 16 Jul 2025 13:42:23 +0000
Date: Wed, 16 Jul 2025 21:41:49 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 214f42ff67514df3bf2edf8b1c79862a83b1a2c7
Message-ID: <202507162137.Vxp6CYlu-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 214f42ff67514df3bf2edf8b1c79862a83b1a2c7  Merge branch 'devel' into for-next

elapsed time: 1416m

configs tested: 119
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250715    gcc-8.5.0
arc                   randconfig-002-20250715    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g4_defconfig    clang-21
arm                            qcom_defconfig    clang-21
arm                   randconfig-001-20250715    clang-21
arm                   randconfig-002-20250715    gcc-10.5.0
arm                   randconfig-003-20250715    clang-21
arm                   randconfig-004-20250715    gcc-12.4.0
arm                       spear13xx_defconfig    gcc-15.1.0
arm                        vexpress_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250715    clang-16
arm64                 randconfig-002-20250715    gcc-12.3.0
arm64                 randconfig-003-20250715    gcc-8.5.0
arm64                 randconfig-004-20250715    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250715    gcc-9.3.0
csky                  randconfig-002-20250715    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250715    clang-18
hexagon               randconfig-002-20250715    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250715    gcc-12
i386        buildonly-randconfig-002-20250715    gcc-12
i386        buildonly-randconfig-003-20250715    gcc-12
i386        buildonly-randconfig-004-20250715    clang-20
i386        buildonly-randconfig-005-20250715    clang-20
i386        buildonly-randconfig-006-20250715    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250715    clang-21
loongarch             randconfig-002-20250715    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                     loongson1b_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250715    gcc-11.5.0
nios2                 randconfig-002-20250715    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250715    gcc-10.5.0
parisc                randconfig-002-20250715    gcc-9.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250715    clang-21
powerpc               randconfig-002-20250715    clang-21
powerpc               randconfig-003-20250715    gcc-8.5.0
powerpc64             randconfig-001-20250715    clang-21
powerpc64             randconfig-003-20250715    clang-17
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250716    gcc-8.5.0
riscv                 randconfig-002-20250716    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250716    gcc-11.5.0
s390                  randconfig-002-20250716    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20250716    gcc-15.1.0
sh                    randconfig-002-20250716    gcc-14.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250716    gcc-8.5.0
sparc                 randconfig-002-20250716    gcc-14.3.0
sparc64               randconfig-001-20250716    clang-20
sparc64               randconfig-002-20250716    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250716    gcc-11
um                    randconfig-002-20250716    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250716    gcc-12
x86_64      buildonly-randconfig-002-20250716    clang-20
x86_64      buildonly-randconfig-003-20250716    clang-20
x86_64      buildonly-randconfig-004-20250716    clang-20
x86_64      buildonly-randconfig-005-20250716    clang-20
x86_64      buildonly-randconfig-006-20250716    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250716    gcc-9.3.0
xtensa                randconfig-002-20250716    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

