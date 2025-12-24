Return-Path: <linux-gpio+bounces-29873-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AD678CDBABF
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 09:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2CB7A300B8D6
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 08:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6E932E137;
	Wed, 24 Dec 2025 08:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4i7LrE+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443AB3054EF
	for <linux-gpio@vger.kernel.org>; Wed, 24 Dec 2025 08:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766564870; cv=none; b=Zq0TsJv1NVBs3lnBCpLdgBVWNZQjUWL6d43zHK9/uLgqzutfP6d/PeO1SFG4w9enslQbW3r9dF3vbClGSPgViVdsVegNYOLxh6bLKlyn7UtCvgXAiITP25WIt4Hrbdaid+GunqSC1AFvhF/ehbaINYBY3oMs1ThFWPiQWvwrvog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766564870; c=relaxed/simple;
	bh=888D6UykYqpIzmPETXBpCUANUV7AEY2nflOQmOMuC10=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hmpm+JsYxhvqXwgYF05MAIzC6N4b1lxl+yzQMl1GTrRC+ylyMEXc/w+w8wjV7w9UaA37XVZt8HWdRp/zTeKn2tm+iIAucDCk8xqzomEdW9E1l5mQ/C7a/XJQlI+BoUQl/DUiR/VP3dC3Bal+eUdCWqXYXLfGkwprGTWWPh23grI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4i7LrE+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766564868; x=1798100868;
  h=date:from:to:cc:subject:message-id;
  bh=888D6UykYqpIzmPETXBpCUANUV7AEY2nflOQmOMuC10=;
  b=m4i7LrE+OXwzfzdl5YbUt9nNKmLfseI1ORBIq4MMUUabexeb3Gu0ygqV
   AJD2CazoLbWd3K+o48RCJjBW1lWqssWvgK8HvyXZ1jAPAGvcJ14ref57I
   ARndmmyMf095l+obqIsfDG2xuyQ+MepVrAX76kHF4JIf6IoQjvzr1JUzs
   LNUL2+veTsTqrs+cllDw4ecgoo2O5NfQfr8Vl8xbIUV7EVNHO+tNTcpb8
   PbOBjApvPObYepZCb8Cbv7BJc/tvb9JokXpUyT9GRXUe33LPOCk14YDJk
   68j+ZzzWJVnt5k0L8T0FJJox2AKzafgYKbWK6Z82C8BSDSErbpn51gAbz
   A==;
X-CSE-ConnectionGUID: IS+pFg0fQ3GvGiVuibdQ1A==
X-CSE-MsgGUID: zUxCWP7RR5KdDCmKX7tuHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68163391"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="68163391"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 00:27:39 -0800
X-CSE-ConnectionGUID: DgeoHd3wRHOfmEn/25nL7A==
X-CSE-MsgGUID: Y5t6WPyTRWqEyIAA1+LFOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="204516191"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Dec 2025 00:27:37 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYKDR-000000002qf-21GA;
	Wed, 24 Dec 2025 08:27:31 +0000
Date: Wed, 24 Dec 2025 16:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 48befae0d6eee275c3e30d1cd45f39d6ba011e19
Message-ID: <202512241621.IBmCUWz3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 48befae0d6eee275c3e30d1cd45f39d6ba011e19  gpio: zynq: Simplify with device_get_match_data()

elapsed time: 1452m

configs tested: 266
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251224    gcc-10.5.0
arc                   randconfig-001-20251224    gcc-12.5.0
arc                   randconfig-002-20251224    gcc-10.5.0
arm                              alldefconfig    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                           omap1_defconfig    clang-22
arm                   randconfig-001-20251224    gcc-10.5.0
arm                   randconfig-001-20251224    gcc-8.5.0
arm                   randconfig-002-20251224    gcc-10.5.0
arm                   randconfig-002-20251224    gcc-8.5.0
arm                   randconfig-003-20251224    gcc-10.5.0
arm                   randconfig-003-20251224    gcc-12.5.0
arm                   randconfig-004-20251224    clang-22
arm                   randconfig-004-20251224    gcc-10.5.0
arm                           sama5_defconfig    clang-22
arm                           spitz_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251223    clang-17
arm64                 randconfig-001-20251224    gcc-15.1.0
arm64                 randconfig-002-20251223    clang-22
arm64                 randconfig-002-20251224    gcc-15.1.0
arm64                 randconfig-003-20251223    clang-18
arm64                 randconfig-003-20251224    gcc-15.1.0
arm64                 randconfig-004-20251223    gcc-9.5.0
arm64                 randconfig-004-20251224    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251223    gcc-11.5.0
csky                  randconfig-001-20251224    gcc-15.1.0
csky                  randconfig-002-20251223    gcc-15.1.0
csky                  randconfig-002-20251224    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251223    clang-22
hexagon               randconfig-001-20251224    clang-22
hexagon               randconfig-002-20251223    clang-22
hexagon               randconfig-002-20251224    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251224    clang-20
i386        buildonly-randconfig-001-20251224    gcc-14
i386        buildonly-randconfig-002-20251224    gcc-14
i386        buildonly-randconfig-003-20251224    clang-20
i386        buildonly-randconfig-003-20251224    gcc-14
i386        buildonly-randconfig-004-20251224    gcc-12
i386        buildonly-randconfig-004-20251224    gcc-14
i386        buildonly-randconfig-005-20251224    gcc-14
i386        buildonly-randconfig-006-20251224    clang-20
i386        buildonly-randconfig-006-20251224    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251224    clang-20
i386                  randconfig-001-20251224    gcc-14
i386                  randconfig-002-20251224    clang-20
i386                  randconfig-002-20251224    gcc-14
i386                  randconfig-003-20251224    clang-20
i386                  randconfig-003-20251224    gcc-14
i386                  randconfig-004-20251224    clang-20
i386                  randconfig-004-20251224    gcc-12
i386                  randconfig-005-20251224    clang-20
i386                  randconfig-006-20251224    clang-20
i386                  randconfig-007-20251224    clang-20
i386                  randconfig-007-20251224    gcc-14
i386                  randconfig-011-20251224    clang-20
i386                  randconfig-012-20251224    clang-20
i386                  randconfig-013-20251224    clang-20
i386                  randconfig-014-20251224    clang-20
i386                  randconfig-015-20251224    clang-20
i386                  randconfig-016-20251224    clang-20
i386                  randconfig-017-20251224    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251223    gcc-15.1.0
loongarch             randconfig-001-20251224    gcc-15.1.0
loongarch             randconfig-002-20251224    gcc-12.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                         apollo_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                          ath25_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251223    gcc-11.5.0
nios2                 randconfig-001-20251224    gcc-11.5.0
nios2                 randconfig-002-20251223    gcc-11.5.0
nios2                 randconfig-002-20251224    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251224    clang-22
parisc                randconfig-001-20251224    gcc-8.5.0
parisc                randconfig-002-20251224    clang-22
parisc                randconfig-002-20251224    gcc-9.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                        cell_defconfig    gcc-15.1.0
powerpc                     mpc5200_defconfig    clang-22
powerpc               randconfig-001-20251224    clang-22
powerpc               randconfig-002-20251224    clang-22
powerpc                     skiroot_defconfig    clang-22
powerpc                     tqm8548_defconfig    clang-22
powerpc64             randconfig-001-20251224    clang-22
powerpc64             randconfig-001-20251224    gcc-8.5.0
powerpc64             randconfig-002-20251224    clang-22
powerpc64             randconfig-002-20251224    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251224    gcc-15.1.0
riscv                 randconfig-001-20251224    gcc-8.5.0
riscv                 randconfig-002-20251224    clang-22
riscv                 randconfig-002-20251224    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    clang-22
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251224    gcc-10.5.0
s390                  randconfig-001-20251224    gcc-15.1.0
s390                  randconfig-002-20251224    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                        edosk7760_defconfig    clang-22
sh                    randconfig-001-20251224    gcc-14.3.0
sh                    randconfig-001-20251224    gcc-15.1.0
sh                    randconfig-002-20251224    gcc-10.5.0
sh                    randconfig-002-20251224    gcc-15.1.0
sh                          rsk7269_defconfig    gcc-15.1.0
sh                        sh7763rdp_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251224    gcc-14
sparc                 randconfig-001-20251224    gcc-8.5.0
sparc                 randconfig-002-20251224    gcc-14
sparc                 randconfig-002-20251224    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251224    gcc-14
sparc64               randconfig-001-20251224    gcc-8.5.0
sparc64               randconfig-002-20251224    clang-20
sparc64               randconfig-002-20251224    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251224    gcc-14
um                    randconfig-002-20251224    gcc-14
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251224    clang-20
x86_64      buildonly-randconfig-002-20251224    gcc-14
x86_64      buildonly-randconfig-003-20251224    gcc-14
x86_64      buildonly-randconfig-004-20251224    clang-20
x86_64      buildonly-randconfig-005-20251224    gcc-14
x86_64      buildonly-randconfig-006-20251224    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251224    clang-20
x86_64                randconfig-001-20251224    gcc-14
x86_64                randconfig-002-20251224    gcc-14
x86_64                randconfig-003-20251224    clang-20
x86_64                randconfig-003-20251224    gcc-14
x86_64                randconfig-004-20251224    gcc-14
x86_64                randconfig-005-20251224    gcc-14
x86_64                randconfig-006-20251224    gcc-14
x86_64                randconfig-011-20251224    gcc-14
x86_64                randconfig-012-20251224    gcc-14
x86_64                randconfig-013-20251224    clang-20
x86_64                randconfig-013-20251224    gcc-14
x86_64                randconfig-014-20251224    gcc-14
x86_64                randconfig-015-20251224    gcc-14
x86_64                randconfig-016-20251224    gcc-14
x86_64                randconfig-071-20251224    clang-20
x86_64                randconfig-072-20251224    gcc-14
x86_64                randconfig-073-20251224    clang-20
x86_64                randconfig-074-20251224    gcc-14
x86_64                randconfig-075-20251224    clang-20
x86_64                randconfig-076-20251224    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251224    gcc-14
xtensa                randconfig-001-20251224    gcc-15.1.0
xtensa                randconfig-002-20251224    gcc-14
xtensa                randconfig-002-20251224    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

