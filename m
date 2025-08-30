Return-Path: <linux-gpio+bounces-25234-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D49DFB3D034
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 01:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 862DD3BE2FB
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 23:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4CC51C5496;
	Sat, 30 Aug 2025 23:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBEB28/c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708354A1E
	for <linux-gpio@vger.kernel.org>; Sat, 30 Aug 2025 23:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756597040; cv=none; b=hSDad8knc29X0NiUPadR5ei42gv0UVffrsSdplpw2kexQJYmCGyRi9Ack+5ForhI1E/fT5jgCr8G+Irx3+fQ71OrqteHDEMpsJDaTZ8UNs9+tYvTufDkRI/G4BDuBWD3krWaiv9k2uvgg6Knky1cMiNwYR4SWdkBosL0x4JdorM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756597040; c=relaxed/simple;
	bh=/gu/src8A4q2cgEcTo7ENxqSDAG4Yx9scxHMNetF6Uc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mTKt6BgIAuh4ePpAYMKTzrPgSxMnTVlGv2oDpVbdS/nIdvMRBu5NIlrIA1b4bW/wfRSouAQVs2qcrGiN2zrDBFyG7iGdVPOmxfVg6Nc2NPIn38qSqnTLVJ8Dc1s7HGKyfK5jdxVeTn2atbZmm/Sanm0nY6ICZ97W4f43bru/pzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBEB28/c; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756597039; x=1788133039;
  h=date:from:to:cc:subject:message-id;
  bh=/gu/src8A4q2cgEcTo7ENxqSDAG4Yx9scxHMNetF6Uc=;
  b=eBEB28/cqIYPu8wlaZZdOppwmsFpROb7KcDplWXMnhmiJJxWnsFY6Pni
   IEqoq2yKKDSKCM63SVvQSv+U9EGnW09uFnHVG/QKDcm9nZVLmW5NfSlru
   ebC/diQ3IZFzw5+s2ZcrqbqDl8NRlsw2y+rQ37BUIUAfWyHomwOVkthJO
   blpdfthtOI8Tu8/TdlkiBglwwGiv7GAzRVITwbvcXBzkiQXuVs6pqMJXS
   LHv3VpjtGbp3AvwnNgf33trTiRvoRapAZ+oeb9X0JGF2sGf/p2d9OGz9v
   xlXAdOwfYlYpP4CqVqRo1adzFUOYvq9Q9OG0jGwWYzFJw+CbgmUCEVggr
   Q==;
X-CSE-ConnectionGUID: yH7mjYFJRm6qZ8EVLYZXWw==
X-CSE-MsgGUID: MyDoe2/QSBq2kw+4C6NomA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="46410991"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="46410991"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 16:37:18 -0700
X-CSE-ConnectionGUID: CRZtHhU3SL2+B9s9mEAZ5g==
X-CSE-MsgGUID: YGkMPwVNTH+qliASS4M+/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="175936661"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 30 Aug 2025 16:37:17 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usV7T-000VlL-1m;
	Sat, 30 Aug 2025 23:36:44 +0000
Date: Sun, 31 Aug 2025 07:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 050e711a48f18a6ce661ecf1b736dc07534f384a
Message-ID: <202508310717.wtq9sb2E-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 050e711a48f18a6ce661ecf1b736dc07534f384a  Merge tag 'renesas-pinctrl-for-v6.18-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into devel

elapsed time: 1450m

configs tested: 125
configs skipped: 4

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
arc                   randconfig-001-20250830    gcc-8.5.0
arc                   randconfig-002-20250830    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                                 defconfig    clang-22
arm                   randconfig-001-20250830    gcc-11.5.0
arm                   randconfig-002-20250830    clang-22
arm                   randconfig-003-20250830    clang-19
arm                   randconfig-004-20250830    clang-22
arm                        spear3xx_defconfig    clang-17
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250830    gcc-10.5.0
arm64                 randconfig-002-20250830    clang-22
arm64                 randconfig-003-20250830    gcc-8.5.0
arm64                 randconfig-004-20250830    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250830    gcc-10.5.0
csky                  randconfig-002-20250830    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250830    clang-22
hexagon               randconfig-002-20250830    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250830    clang-20
i386        buildonly-randconfig-002-20250830    clang-20
i386        buildonly-randconfig-003-20250830    clang-20
i386        buildonly-randconfig-004-20250830    gcc-12
i386        buildonly-randconfig-005-20250830    clang-20
i386        buildonly-randconfig-006-20250830    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250830    clang-22
loongarch             randconfig-002-20250830    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           jazz_defconfig    clang-17
nios2                            alldefconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250830    gcc-11.5.0
nios2                 randconfig-002-20250830    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                    or1ksim_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250830    gcc-10.5.0
parisc                randconfig-002-20250830    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      pcm030_defconfig    clang-22
powerpc               randconfig-001-20250830    gcc-15.1.0
powerpc               randconfig-002-20250830    clang-22
powerpc               randconfig-003-20250830    clang-22
powerpc                     sequoia_defconfig    clang-17
powerpc64             randconfig-001-20250830    clang-17
powerpc64             randconfig-002-20250830    gcc-14.3.0
powerpc64             randconfig-003-20250830    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250830    gcc-8.5.0
riscv                 randconfig-002-20250830    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250830    clang-22
s390                  randconfig-002-20250830    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250830    gcc-11.5.0
sh                    randconfig-002-20250830    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250830    gcc-13.4.0
sparc                 randconfig-002-20250830    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250830    gcc-11.5.0
sparc64               randconfig-002-20250830    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250830    gcc-12
um                    randconfig-002-20250830    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250830    clang-20
x86_64      buildonly-randconfig-002-20250830    gcc-12
x86_64      buildonly-randconfig-003-20250830    clang-20
x86_64      buildonly-randconfig-004-20250830    gcc-12
x86_64      buildonly-randconfig-005-20250830    gcc-12
x86_64      buildonly-randconfig-006-20250830    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250830    gcc-12.5.0
xtensa                randconfig-002-20250830    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

