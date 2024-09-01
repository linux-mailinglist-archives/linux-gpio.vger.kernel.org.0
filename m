Return-Path: <linux-gpio+bounces-9506-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C801B96762E
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Sep 2024 13:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F37D1F215A2
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Sep 2024 11:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0241531E1;
	Sun,  1 Sep 2024 11:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tp2DEO2U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA1F15250F
	for <linux-gpio@vger.kernel.org>; Sun,  1 Sep 2024 11:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725190005; cv=none; b=Rf9IzgrKYdWYvq4cvHM3X52ndcqQcRdYB3W8Pz0I7ficfTsyCvob+91JpHfbpW5INv3OK5xDRi5W5pUsdLelGSffVHIuxG7mg8BAgJjYK9bbYb5oJ8tMiNUKNbc1oOVOIG5cpm7t6Pft6W2gklJQELCxHENo1zBAgRfyHnx7Neg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725190005; c=relaxed/simple;
	bh=hMzyS9pgMQG6eXT/sLF8I05snuQBfptrdi/MFVz6fds=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jyrvRtviY2kK0wfSaKjMaoqhjldVN8aEw+PpR2kWRqCHcDsunVpbjS/QLSOLIpw5VtxWpVIdBYoQ/pMVoFGfGg+KHdD7wEn0CllJKRhlctluqtvafNkXapHJgd9se1mPiz1+YK5RG2MCoh4gi/PTchsikQI94/MTO97mW9RAKgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tp2DEO2U; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725190003; x=1756726003;
  h=date:from:to:cc:subject:message-id;
  bh=hMzyS9pgMQG6eXT/sLF8I05snuQBfptrdi/MFVz6fds=;
  b=Tp2DEO2UNAzM9ciK/SktU1KTVWGkkLOfS4QxYYms1c6gwpLkymUIouYk
   GJjV9cDACjffR8zRuMhP6Gx0XdFfQQjU3rV/E+OblVU4jHftoDe/N7Wcf
   QNfo7IG0ZNnfm41m2jW3oeXuOALbGrEkIokTciCbCTUJDJXEGewHWz+56
   e1Ofk439aGUbsS/BCcBttBRcNnJFPnLoju6Y16klJrFQFBighgpkSXyAx
   p5cPC5eiFgCnFz18h03sW59x4pZELKJg5j6zkgpmqljM2dTO4leA2/DBD
   Pa5mafzxa3Qczbya4ZPPRdVGM46VM9zMvCoOnwdVWLt3GVPl0MGXutxmv
   g==;
X-CSE-ConnectionGUID: lDQE8WfTTx20PUazefZtDg==
X-CSE-MsgGUID: rcWqltKuTHGfNejJCe6IGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23963643"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="23963643"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 04:26:43 -0700
X-CSE-ConnectionGUID: 0a5bXWExRIWxcwW+AZRrtA==
X-CSE-MsgGUID: MD2uZJQ5TAWMfHOkKZr1EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="87569905"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Sep 2024 04:26:41 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skij9-0003cK-2e;
	Sun, 01 Sep 2024 11:26:39 +0000
Date: Sun, 01 Sep 2024 19:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 5213518d5ab7d5191490b93a306bbc6f2356d3c1
Message-ID: <202409011946.6hsq1tcj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 5213518d5ab7d5191490b93a306bbc6f2356d3c1  pinctrl: sophgo: cv18xx: fix missed __iomem type identifier

elapsed time: 724m

configs tested: 166
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              alldefconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-14.1.0
arc                     haps_hs_smp_defconfig   gcc-14.1.0
arm                              allmodconfig   clang-20
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                              allyesconfig   gcc-13.2.0
arm                       aspeed_g5_defconfig   clang-20
arm                         at91_dt_defconfig   clang-20
arm                        clps711x_defconfig   clang-20
arm                     davinci_all_defconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                          exynos_defconfig   clang-20
arm                       multi_v4t_defconfig   gcc-14.1.0
arm                        multi_v5_defconfig   gcc-14.1.0
arm                             mxs_defconfig   clang-20
arm                        neponset_defconfig   gcc-14.1.0
arm                         nhk8815_defconfig   clang-20
arm                       omap2plus_defconfig   gcc-14.1.0
arm                          pxa3xx_defconfig   clang-20
arm                        spear6xx_defconfig   gcc-14.1.0
arm64                            alldefconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240901   clang-18
i386         buildonly-randconfig-002-20240901   clang-18
i386         buildonly-randconfig-003-20240901   clang-18
i386         buildonly-randconfig-004-20240901   clang-18
i386         buildonly-randconfig-005-20240901   clang-18
i386         buildonly-randconfig-006-20240901   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240901   clang-18
i386                  randconfig-002-20240901   clang-18
i386                  randconfig-003-20240901   clang-18
i386                  randconfig-004-20240901   clang-18
i386                  randconfig-005-20240901   clang-18
i386                  randconfig-006-20240901   clang-18
i386                  randconfig-011-20240901   clang-18
i386                  randconfig-012-20240901   clang-18
i386                  randconfig-013-20240901   clang-18
i386                  randconfig-014-20240901   clang-18
i386                  randconfig-015-20240901   clang-18
i386                  randconfig-016-20240901   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
m68k                          hp300_defconfig   clang-20
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                      bmips_stb_defconfig   clang-20
mips                  cavium_octeon_defconfig   gcc-14.1.0
mips                           ci20_defconfig   clang-20
mips                          eyeq5_defconfig   clang-20
mips                           gcw0_defconfig   clang-20
mips                           ip28_defconfig   clang-20
nios2                         10m50_defconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
openrisc                    or1ksim_defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc64                            defconfig   gcc-14.1.0
powerpc                     akebono_defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                       eiger_defconfig   clang-20
powerpc                        fsp2_defconfig   clang-20
powerpc                       holly_defconfig   gcc-14.1.0
powerpc                     mpc512x_defconfig   clang-20
powerpc                     mpc512x_defconfig   gcc-14.1.0
powerpc                 mpc832x_rdb_defconfig   clang-20
powerpc                     sequoia_defconfig   clang-20
powerpc                     skiroot_defconfig   clang-20
powerpc                     tqm8540_defconfig   clang-20
powerpc                         wii_defconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
s390                             alldefconfig   clang-20
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                         apsh4a3a_defconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                         ecovec24_defconfig   clang-20
sh                               j2_defconfig   clang-20
sh                          kfr2r09_defconfig   clang-20
sh                  sh7785lcr_32bit_defconfig   gcc-14.1.0
sh                             shx3_defconfig   clang-20
sh                              ul2_defconfig   gcc-14.1.0
sh                          urquell_defconfig   clang-20
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240901   gcc-12
x86_64       buildonly-randconfig-002-20240901   gcc-12
x86_64       buildonly-randconfig-003-20240901   gcc-12
x86_64       buildonly-randconfig-004-20240901   gcc-12
x86_64       buildonly-randconfig-005-20240901   gcc-12
x86_64       buildonly-randconfig-006-20240901   gcc-12
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240901   gcc-12
x86_64                randconfig-002-20240901   gcc-12
x86_64                randconfig-003-20240901   gcc-12
x86_64                randconfig-004-20240901   gcc-12
x86_64                randconfig-005-20240901   gcc-12
x86_64                randconfig-006-20240901   gcc-12
x86_64                randconfig-011-20240901   gcc-12
x86_64                randconfig-012-20240901   gcc-12
x86_64                randconfig-013-20240901   gcc-12
x86_64                randconfig-014-20240901   gcc-12
x86_64                randconfig-015-20240901   gcc-12
x86_64                randconfig-016-20240901   gcc-12
x86_64                randconfig-071-20240901   gcc-12
x86_64                randconfig-072-20240901   gcc-12
x86_64                randconfig-073-20240901   gcc-12
x86_64                randconfig-074-20240901   gcc-12
x86_64                randconfig-075-20240901   gcc-12
x86_64                randconfig-076-20240901   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                          iss_defconfig   clang-20

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

