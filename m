Return-Path: <linux-gpio+bounces-23293-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C64B059E1
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 14:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 629B574185D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 12:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1C52E040E;
	Tue, 15 Jul 2025 12:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNANxI3l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAD72DE6E7
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 12:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752582010; cv=none; b=jSjkCC2WZTDMnMLF0aPRoZ/7iRX8EmN8I/qWVQGodxYzyPao1Ac13+zcyFiNTgKWP1DkLNjZCGRNewqZX3/9AR60NBkHGPRbkF/v/ogefLtT9kLmxdnwwFe4na7Vs4blncriOqqmCmS2SBpQCgb30zoCPoP/izJYUW5K3PRu9PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752582010; c=relaxed/simple;
	bh=XOViqbdzd1g1f0nmq07CeP1cxaskXf3NO6K3OrD3rM8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DGo68Dhx3SkQsLuZKgbsCANZ4xCsK/O4BNSPzYTYSranQW5IsmfGOWEZgpmjiUOA7xtevbuGYLkNFOxZRtobO6p15Mf6T1p8dgUkauT1HiV/7Xw2Rv7y3eMNANcnlp2+h7QRDLuFtZiJekHbgL653y/DymHChGY1PHXrNEudnfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNANxI3l; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752582008; x=1784118008;
  h=date:from:to:cc:subject:message-id;
  bh=XOViqbdzd1g1f0nmq07CeP1cxaskXf3NO6K3OrD3rM8=;
  b=XNANxI3lVznVGPBpLOe1x+yS/DiGEiw/2i//OIrzErlpp5oajnj/VTlc
   82YQTqnVEp1BxWlh1y10hpaiyfFUTfZFdDzZ7EngrBtdSiLA2tEH0LSKV
   RGsFJ7xIY/jsIFQal3LgBHQcrkmk9Mp2AQbsS5I9a8RIt6YLNDLZgp6c0
   hKsA+eUIMoZXitMguWBGWCOX1G2RdKv5rTX1wDC9JPctM5iuUIyb0sxC8
   4JERpndLJlaIeu4iqAFN1Ruq4276QrCM7kyhu+8kmz5EFPgrrWcGAdu2K
   luPKRDiw8J1AW+CGipKjxpJvB0w05s/yw9LHY6ZUlFMCF3DZyWFaJR79+
   A==;
X-CSE-ConnectionGUID: qKsXwzomTY61gRaD3SjoBQ==
X-CSE-MsgGUID: smjhQTBgR1C0J4E6lVH16Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="72250370"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="72250370"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 05:20:08 -0700
X-CSE-ConnectionGUID: AhQlmtMuTo+W6eP3djpkwA==
X-CSE-MsgGUID: +YTjEjCCT+S4vOj8qTvvNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="157301992"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Jul 2025 05:20:06 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubedg-000A2S-1W;
	Tue, 15 Jul 2025 12:20:04 +0000
Date: Tue, 15 Jul 2025 20:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 a1459bbb75f9d84890493e35eccd545bb9acb52f
Message-ID: <202507152008.U529CaTh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: a1459bbb75f9d84890493e35eccd545bb9acb52f  Merge branch 'devel' into for-next

elapsed time: 1177m

configs tested: 127
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
arc                          axs103_defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250715    gcc-8.5.0
arc                   randconfig-002-20250715    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g4_defconfig    clang-21
arm                          collie_defconfig    gcc-15.1.0
arm                        mvebu_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20250715    clang-21
arm                   randconfig-002-20250715    gcc-10.5.0
arm                   randconfig-003-20250715    clang-21
arm                   randconfig-004-20250715    gcc-12.4.0
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
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
microblaze                      mmu_defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip30_defconfig    gcc-15.1.0
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
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc               randconfig-001-20250715    clang-21
powerpc               randconfig-002-20250715    clang-21
powerpc               randconfig-003-20250715    gcc-8.5.0
powerpc64             randconfig-001-20250715    clang-21
powerpc64             randconfig-003-20250715    clang-17
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250715    clang-21
riscv                 randconfig-002-20250715    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250715    gcc-8.5.0
s390                  randconfig-002-20250715    gcc-12.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250715    gcc-11.5.0
sh                    randconfig-002-20250715    gcc-15.1.0
sh                            titan_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250715    gcc-8.5.0
sparc                 randconfig-002-20250715    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250715    clang-20
sparc64               randconfig-002-20250715    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                    randconfig-001-20250715    gcc-12
um                    randconfig-002-20250715    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250715    clang-20
x86_64      buildonly-randconfig-002-20250715    gcc-12
x86_64      buildonly-randconfig-003-20250715    gcc-12
x86_64      buildonly-randconfig-004-20250715    gcc-11
x86_64      buildonly-randconfig-005-20250715    gcc-12
x86_64      buildonly-randconfig-006-20250715    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250715    gcc-8.5.0
xtensa                randconfig-002-20250715    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

