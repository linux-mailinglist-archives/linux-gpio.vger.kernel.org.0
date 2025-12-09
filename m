Return-Path: <linux-gpio+bounces-29403-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 903B4CAF001
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Dec 2025 07:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 020DD303171C
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Dec 2025 06:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B4B3203B4;
	Tue,  9 Dec 2025 06:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8pAUQOK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8783203A9
	for <linux-gpio@vger.kernel.org>; Tue,  9 Dec 2025 06:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765260558; cv=none; b=eBVop/WjEM9Q5vGXs6mY+2+tjV4V6aSnmeoYdBmMX6gg9u/c4PRemIYY09lCemvinsUy1prcVfBVKYVCobbs9q6f5IRcrZZcXKd6TlOXVRI2B+a0SS5Z+vlEyiCGP24cxSChHeNhOXyIY/3iV+IQW7IEIA5uQlTMyLPlL4u/uHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765260558; c=relaxed/simple;
	bh=UGrcrjXOZcltJ4AYsiof3r1DX/RsjzwIQCX50Ssy+tM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cTuFZwXyyBbpexL1RxbRi+ejpNh704JHQcLTWpvKWgvbHHHH+4jEKPZkuebSwX7YblVWM8gAjnFNds9it5VG0KULbR153+bOQky8PKfumUSpOTK9N54mmBNv2SG6EVNacgJ8I9lLfl66vfoTBb4of2WC3oHdn45tBGkLOpsGj0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8pAUQOK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765260556; x=1796796556;
  h=date:from:to:cc:subject:message-id;
  bh=UGrcrjXOZcltJ4AYsiof3r1DX/RsjzwIQCX50Ssy+tM=;
  b=X8pAUQOKPg5vLw/mPRTvTqGJ/dW1nEXAj0pzFknYQ7L3TFR7vIi3EyHD
   /lf/lmiIJ0dqqRR3gHyxZi6PJcamCljoy75/kUJfPlUvBrHiOSy2RH+Nd
   1stTg9iIFUzTCEOhiZr7L6CCVt/CR0V5ZTri96SB78GDuIgF9rahWcdsO
   V7Whn0EmSiDn+Y+QqSiSLNi22YrWbnIREqBVpZ/NTFLvcrDPFAYKTKNNT
   h1YeUGgQPX3/XfboVCgjEK/dKD1OJCywhRuhepzmUFOKbCGwf9ITmR//b
   c8RhLG/G+HAItbAW69NWIzgQQQGumi/zSSf8sBBlTux2bYIGpf2pzJWf6
   A==;
X-CSE-ConnectionGUID: WB47gYsSQYe3Mgdc6lDwmg==
X-CSE-MsgGUID: nxzkRT2jRnOdnPgjst4SpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67379794"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="67379794"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 22:09:15 -0800
X-CSE-ConnectionGUID: aUfNv4ZZRqS7wmbUAgG9wA==
X-CSE-MsgGUID: yjJ7vF8tQjO3+lhIFT3QSA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Dec 2025 22:09:14 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSquN-000000001Nh-3QwK;
	Tue, 09 Dec 2025 06:09:11 +0000
Date: Tue, 09 Dec 2025 14:08:30 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 2d967310c49ed93ac11cef408a55ddf15c3dd52e
Message-ID: <202512091424.95Q93igd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 2d967310c49ed93ac11cef408a55ddf15c3dd52e  gpiolib: acpi: Add quirk for Dell Precision 7780

elapsed time: 1454m

configs tested: 214
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251208    gcc-8.5.0
arc                   randconfig-001-20251209    clang-22
arc                   randconfig-002-20251208    gcc-11.5.0
arc                   randconfig-002-20251209    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                           h3600_defconfig    gcc-15.1.0
arm                   randconfig-001-20251208    clang-22
arm                   randconfig-001-20251209    clang-22
arm                   randconfig-002-20251208    gcc-13.4.0
arm                   randconfig-002-20251209    clang-22
arm                   randconfig-003-20251208    clang-19
arm                   randconfig-003-20251209    clang-22
arm                   randconfig-004-20251208    clang-22
arm                   randconfig-004-20251209    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251208    clang-22
arm64                 randconfig-002-20251208    clang-18
arm64                 randconfig-003-20251208    gcc-13.4.0
arm64                 randconfig-004-20251208    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251208    gcc-14.3.0
csky                  randconfig-002-20251208    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251208    clang-22
hexagon               randconfig-001-20251209    clang-22
hexagon               randconfig-002-20251208    clang-22
hexagon               randconfig-002-20251209    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251208    clang-20
i386        buildonly-randconfig-002-20251208    gcc-13
i386        buildonly-randconfig-003-20251208    gcc-14
i386        buildonly-randconfig-004-20251208    clang-20
i386        buildonly-randconfig-005-20251208    gcc-14
i386        buildonly-randconfig-006-20251208    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251208    clang-20
i386                  randconfig-002-20251208    gcc-14
i386                  randconfig-003-20251208    clang-20
i386                  randconfig-004-20251208    clang-20
i386                  randconfig-005-20251208    clang-20
i386                  randconfig-006-20251208    clang-20
i386                  randconfig-007-20251208    gcc-14
i386                  randconfig-011-20251208    gcc-14
i386                  randconfig-012-20251208    clang-20
i386                  randconfig-013-20251208    gcc-14
i386                  randconfig-014-20251208    gcc-14
i386                  randconfig-015-20251208    clang-20
i386                  randconfig-016-20251208    gcc-12
i386                  randconfig-017-20251208    gcc-14
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251208    clang-22
loongarch             randconfig-001-20251209    clang-22
loongarch             randconfig-002-20251208    clang-18
loongarch             randconfig-002-20251209    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251208    gcc-8.5.0
nios2                 randconfig-001-20251209    clang-22
nios2                 randconfig-002-20251208    gcc-11.5.0
nios2                 randconfig-002-20251209    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251208    gcc-8.5.0
parisc                randconfig-001-20251209    gcc-15.1.0
parisc                randconfig-002-20251208    gcc-8.5.0
parisc                randconfig-002-20251209    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      ep88xc_defconfig    gcc-15.1.0
powerpc                     mpc5200_defconfig    clang-22
powerpc               randconfig-001-20251208    clang-22
powerpc               randconfig-001-20251209    gcc-15.1.0
powerpc               randconfig-002-20251208    gcc-14.3.0
powerpc               randconfig-002-20251209    gcc-15.1.0
powerpc                    sam440ep_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251208    gcc-14.3.0
powerpc64             randconfig-001-20251209    gcc-15.1.0
powerpc64             randconfig-002-20251208    clang-22
powerpc64             randconfig-002-20251209    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251208    clang-19
riscv                 randconfig-002-20251208    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251208    gcc-8.5.0
s390                  randconfig-002-20251208    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251208    gcc-15.1.0
sh                    randconfig-002-20251208    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251208    gcc-12.5.0
sparc                 randconfig-002-20251208    gcc-15.1.0
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251208    clang-20
sparc64               randconfig-002-20251208    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251208    gcc-14
um                    randconfig-002-20251208    clang-22
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251208    gcc-14
x86_64      buildonly-randconfig-001-20251209    gcc-14
x86_64      buildonly-randconfig-002-20251208    clang-20
x86_64      buildonly-randconfig-002-20251209    gcc-14
x86_64      buildonly-randconfig-003-20251208    gcc-14
x86_64      buildonly-randconfig-003-20251209    gcc-14
x86_64      buildonly-randconfig-004-20251208    gcc-14
x86_64      buildonly-randconfig-004-20251209    gcc-14
x86_64      buildonly-randconfig-005-20251208    gcc-13
x86_64      buildonly-randconfig-005-20251209    gcc-14
x86_64      buildonly-randconfig-006-20251208    gcc-14
x86_64      buildonly-randconfig-006-20251209    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251208    gcc-14
x86_64                randconfig-002-20251208    gcc-12
x86_64                randconfig-003-20251208    gcc-14
x86_64                randconfig-004-20251208    clang-20
x86_64                randconfig-005-20251208    gcc-14
x86_64                randconfig-006-20251208    clang-20
x86_64                randconfig-011-20251208    clang-20
x86_64                randconfig-012-20251208    clang-20
x86_64                randconfig-013-20251208    gcc-14
x86_64                randconfig-014-20251208    clang-20
x86_64                randconfig-015-20251208    gcc-14
x86_64                randconfig-016-20251208    clang-20
x86_64                randconfig-071-20251208    clang-20
x86_64                randconfig-071-20251209    gcc-14
x86_64                randconfig-072-20251208    clang-20
x86_64                randconfig-072-20251209    gcc-14
x86_64                randconfig-073-20251208    clang-20
x86_64                randconfig-073-20251209    gcc-14
x86_64                randconfig-074-20251208    clang-20
x86_64                randconfig-074-20251209    gcc-14
x86_64                randconfig-075-20251208    clang-20
x86_64                randconfig-075-20251209    gcc-14
x86_64                randconfig-076-20251208    clang-20
x86_64                randconfig-076-20251209    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251208    gcc-13.4.0
xtensa                randconfig-002-20251208    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

