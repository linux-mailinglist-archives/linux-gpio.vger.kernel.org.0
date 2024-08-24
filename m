Return-Path: <linux-gpio+bounces-9123-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B2295DF07
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 18:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C060B21A98
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 16:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F21117A90F;
	Sat, 24 Aug 2024 16:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOksQdM9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4671714D9
	for <linux-gpio@vger.kernel.org>; Sat, 24 Aug 2024 16:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724517497; cv=none; b=btko5BUuh2I7HkECanEGgWZv/X3yDLK6KqV281rBPsG/gfzqV771+/On6pjY2ODvsS1X3UsykyiVS/LTQdXOdZxVjJw4WIW+wgjjelx1KYj1F0KybUOSv7Mv4GQxMW5XeayOtioMr9JvZiJiczN4OrQSeiKtAUfrCmDkiSwKd1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724517497; c=relaxed/simple;
	bh=189xdVnOmtl31STedvGg/JLkctd6NhQyIti80BhGXXQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uysS+xOjU5jkwyemHxPqqmgwg1mnRThNqNV2hZQl9gBV5GLHxImAUHXqw7vO8ozwiVCsGef49WE+Ihn0lbdvSUWk6rCMuv2FhoCHnpF3VIHBX38d5cR712rztO+reE6cCdGGBgAiVPYZydzVBnkjZecMx88BM3dBGktXT1W4i4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XOksQdM9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724517495; x=1756053495;
  h=date:from:to:cc:subject:message-id;
  bh=189xdVnOmtl31STedvGg/JLkctd6NhQyIti80BhGXXQ=;
  b=XOksQdM94QiQCGo96+26EosQkSXf02pwzVNY+uI67LZ2IyIjjbT86ZIC
   E113W8m15QZ21x5BJdCpApIWSUTrwyaDAIT3oSBXtumxRHT/x1MtU+FoS
   kuCkrEmLzS6T+myv994EmHXXnaPUFTPS/E+7ZV/XGmeNUFTQKVYoHcGmu
   tR2DFPAHUN6fBVulI9BO6G+Vd0ze7jfdfq+pRsidccUv9blqsNXJdw8Of
   k8pU/IuNXC/WL7xYvpjHhwNesb5i0IoGEGBEBj+uigH0s0kkiTY6WS9UY
   HuVup/wmhvjoEQSkbpKVLp2/Vdbl+OM/KxKy/79XKUeQYpKONtk1oJd2v
   g==;
X-CSE-ConnectionGUID: SfcufNUcTqaUJck4BNzfww==
X-CSE-MsgGUID: a3IPiTycQPSpZB56uWWDAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="22873524"
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="22873524"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 09:38:11 -0700
X-CSE-ConnectionGUID: y1jBS+QBTyuzivA1yqtGDg==
X-CSE-MsgGUID: PXkoMCsOT5iqvhfjceZr3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="62627154"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Aug 2024 09:38:09 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shtmB-000EcD-0M;
	Sat, 24 Aug 2024 16:38:07 +0000
Date: Sun, 25 Aug 2024 00:37:16 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 811e62c80a879d717f7bd4a293eb2c66ed4560ba
Message-ID: <202408250014.ouY49Yyp-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 811e62c80a879d717f7bd4a293eb2c66ed4560ba  pinctrl: imx: Switch to LATE_SYSTEM_SLEEP_PM_OPS()

elapsed time: 1449m

configs tested: 177
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsim_700_defconfig   gcc-13.2.0
arc                   randconfig-001-20240824   gcc-13.2.0
arc                   randconfig-002-20240824   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                       aspeed_g4_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                      footbridge_defconfig   gcc-13.2.0
arm                          gemini_defconfig   clang-20
arm                      integrator_defconfig   clang-20
arm                       multi_v4t_defconfig   gcc-13.2.0
arm                        mvebu_v5_defconfig   clang-20
arm                   randconfig-001-20240824   gcc-13.2.0
arm                   randconfig-002-20240824   gcc-13.2.0
arm                   randconfig-003-20240824   gcc-13.2.0
arm                   randconfig-004-20240824   gcc-13.2.0
arm                        spear3xx_defconfig   gcc-13.2.0
arm                           spitz_defconfig   clang-20
arm                           sunxi_defconfig   gcc-13.2.0
arm                        vexpress_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240824   gcc-13.2.0
arm64                 randconfig-002-20240824   gcc-13.2.0
arm64                 randconfig-003-20240824   gcc-13.2.0
arm64                 randconfig-004-20240824   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240824   gcc-13.2.0
csky                  randconfig-002-20240824   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240824   clang-18
i386         buildonly-randconfig-002-20240824   clang-18
i386         buildonly-randconfig-003-20240824   clang-18
i386         buildonly-randconfig-004-20240824   clang-18
i386         buildonly-randconfig-005-20240824   clang-18
i386         buildonly-randconfig-006-20240824   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240824   clang-18
i386                  randconfig-002-20240824   clang-18
i386                  randconfig-003-20240824   clang-18
i386                  randconfig-004-20240824   clang-18
i386                  randconfig-005-20240824   clang-18
i386                  randconfig-006-20240824   clang-18
i386                  randconfig-011-20240824   clang-18
i386                  randconfig-012-20240824   clang-18
i386                  randconfig-013-20240824   clang-18
i386                  randconfig-014-20240824   clang-18
i386                  randconfig-015-20240824   clang-18
i386                  randconfig-016-20240824   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240824   gcc-13.2.0
loongarch             randconfig-002-20240824   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                       bmips_be_defconfig   gcc-13.2.0
mips                         cobalt_defconfig   clang-20
mips                 decstation_r4k_defconfig   gcc-13.2.0
mips                      loongson3_defconfig   gcc-13.2.0
mips                          rb532_defconfig   clang-20
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240824   gcc-13.2.0
nios2                 randconfig-002-20240824   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240824   gcc-13.2.0
parisc                randconfig-002-20240824   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                    amigaone_defconfig   gcc-13.2.0
powerpc                      bamboo_defconfig   gcc-13.2.0
powerpc                      cm5200_defconfig   clang-20
powerpc                     ep8248e_defconfig   clang-20
powerpc                    gamecube_defconfig   clang-20
powerpc                      katmai_defconfig   clang-20
powerpc                 mpc837x_rdb_defconfig   gcc-13.2.0
powerpc                      pasemi_defconfig   clang-20
powerpc                      pcm030_defconfig   clang-20
powerpc                     powernv_defconfig   clang-20
powerpc                      ppc64e_defconfig   clang-20
powerpc               randconfig-001-20240824   gcc-13.2.0
powerpc                     tqm8548_defconfig   clang-20
powerpc                     tqm8555_defconfig   clang-20
powerpc                         wii_defconfig   clang-20
powerpc64             randconfig-001-20240824   gcc-13.2.0
powerpc64             randconfig-002-20240824   gcc-13.2.0
powerpc64             randconfig-003-20240824   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240824   gcc-13.2.0
riscv                 randconfig-002-20240824   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                          debug_defconfig   clang-20
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240824   gcc-13.2.0
s390                  randconfig-002-20240824   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sh                          landisk_defconfig   gcc-13.2.0
sh                    randconfig-001-20240824   gcc-13.2.0
sh                    randconfig-002-20240824   gcc-13.2.0
sh                          rsk7203_defconfig   gcc-13.2.0
sh                        sh7785lcr_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240824   gcc-13.2.0
sparc64               randconfig-002-20240824   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240824   gcc-13.2.0
um                    randconfig-002-20240824   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240824   clang-18
x86_64       buildonly-randconfig-002-20240824   clang-18
x86_64       buildonly-randconfig-003-20240824   clang-18
x86_64       buildonly-randconfig-004-20240824   clang-18
x86_64       buildonly-randconfig-005-20240824   clang-18
x86_64       buildonly-randconfig-006-20240824   clang-18
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240824   clang-18
x86_64                randconfig-002-20240824   clang-18
x86_64                randconfig-003-20240824   clang-18
x86_64                randconfig-004-20240824   clang-18
x86_64                randconfig-005-20240824   clang-18
x86_64                randconfig-006-20240824   clang-18
x86_64                randconfig-011-20240824   clang-18
x86_64                randconfig-012-20240824   clang-18
x86_64                randconfig-013-20240824   clang-18
x86_64                randconfig-014-20240824   clang-18
x86_64                randconfig-015-20240824   clang-18
x86_64                randconfig-016-20240824   clang-18
x86_64                randconfig-071-20240824   clang-18
x86_64                randconfig-072-20240824   clang-18
x86_64                randconfig-073-20240824   clang-18
x86_64                randconfig-074-20240824   clang-18
x86_64                randconfig-075-20240824   clang-18
x86_64                randconfig-076-20240824   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240824   gcc-13.2.0
xtensa                randconfig-002-20240824   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

