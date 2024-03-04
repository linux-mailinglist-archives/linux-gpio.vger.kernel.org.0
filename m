Return-Path: <linux-gpio+bounces-4086-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A431686F851
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Mar 2024 02:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AE30B20B24
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Mar 2024 01:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE810EDF;
	Mon,  4 Mar 2024 01:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9GHEuAn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D433A31
	for <linux-gpio@vger.kernel.org>; Mon,  4 Mar 2024 01:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709516862; cv=none; b=fcakefdrw5nbwh3nEN6X4oP22lcr15Lqh1n1F1NzaoM3FE4/okyrdwXtG8AGVHEdJfGMYYIMI+hUALXgLvV6HeBIzfa4XyRi10mX271UAeWMO+oQWEjW+LKV+pnOmz2GD/4V34Pa+EtAdOFFwCeBNTlkORn76TtdZKU9Ulzdesw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709516862; c=relaxed/simple;
	bh=Ff+mx7bst9A3X8dXN7CRMLfBq+rOAysb6s6Y3bD9U6g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=huepDQ1/a3glAakvuYrHiQHhMIlpe/Gjuq4Ta6vFRZePXahIODw5PvyG88H9j0Nq/8XVnZKye7e5lsCERCYKk/NqCJePpBihY55WcTcdspnMbxNPofkapHntPAT5gMnVyb7kFWTtDi/lio+/cAnyS9iEeJ9JoK3sJPo9NZviABg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9GHEuAn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709516860; x=1741052860;
  h=date:from:to:cc:subject:message-id;
  bh=Ff+mx7bst9A3X8dXN7CRMLfBq+rOAysb6s6Y3bD9U6g=;
  b=G9GHEuAnj8ZQfgVvrKz0QDbuGkpigmfV14Rpm5B/3bMWwDSiE88Cdjo9
   oBkGuGeBZTYayQj/ESWasF0kFhPsT1FgnlYnKdFrgWt8+wKMh+UfVe5Ej
   P1hj7sbCYRzMD4ptyU8CCHAyq6sVPNdFJXwYC7iWPYYfpiMGn3hgOzVNE
   wUAIoZPfYAGE1X3TZXePj3XNIi6xSS/5q+DbD69p5RLWnHDJ/SeE1/75z
   Lkmt4dOEbhdx1ABfOgOLjD7yTdyD4j3SHjMOND/3Yzf6SJZj6yTQtQ2R5
   bk2LRt2SNR2klmbuf4AGJ/irGvCIvpKir2tgFkm2OjcxyuQZ5xLKjsPn2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4156730"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4156730"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 17:47:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="13494295"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Mar 2024 17:47:38 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgxQV-0002G3-0f;
	Mon, 04 Mar 2024 01:47:35 +0000
Date: Mon, 04 Mar 2024 09:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:ib-nomadik-gpio] BUILD SUCCESS
 caddc92c57451d983c7e31e60b961c5aae4ece63
Message-ID: <202403040919.1HJb4svA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-nomadik-gpio
branch HEAD: caddc92c57451d983c7e31e60b961c5aae4ece63  gpio: nomadik: Finish conversion to use firmware node APIs

elapsed time: 1007m

configs tested: 222
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240303   gcc  
arc                   randconfig-001-20240304   gcc  
arc                   randconfig-002-20240303   gcc  
arc                   randconfig-002-20240304   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                          exynos_defconfig   clang
arm                          ixp4xx_defconfig   gcc  
arm                          moxart_defconfig   gcc  
arm                   randconfig-001-20240303   gcc  
arm                   randconfig-002-20240303   clang
arm                   randconfig-002-20240304   gcc  
arm                   randconfig-003-20240303   clang
arm                   randconfig-004-20240303   clang
arm                           stm32_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240303   clang
arm64                 randconfig-001-20240304   gcc  
arm64                 randconfig-002-20240303   gcc  
arm64                 randconfig-002-20240304   gcc  
arm64                 randconfig-003-20240303   gcc  
arm64                 randconfig-004-20240303   gcc  
arm64                 randconfig-004-20240304   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240303   gcc  
csky                  randconfig-001-20240304   gcc  
csky                  randconfig-002-20240303   gcc  
csky                  randconfig-002-20240304   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240303   clang
hexagon               randconfig-002-20240303   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240303   clang
i386         buildonly-randconfig-002-20240303   clang
i386         buildonly-randconfig-003-20240303   gcc  
i386         buildonly-randconfig-004-20240303   clang
i386         buildonly-randconfig-005-20240303   clang
i386         buildonly-randconfig-006-20240303   clang
i386                                defconfig   clang
i386                  randconfig-001-20240303   gcc  
i386                  randconfig-002-20240303   gcc  
i386                  randconfig-003-20240303   gcc  
i386                  randconfig-004-20240303   clang
i386                  randconfig-005-20240303   gcc  
i386                  randconfig-006-20240303   gcc  
i386                  randconfig-011-20240303   clang
i386                  randconfig-012-20240303   gcc  
i386                  randconfig-013-20240303   gcc  
i386                  randconfig-014-20240303   gcc  
i386                  randconfig-015-20240303   gcc  
i386                  randconfig-016-20240303   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240303   gcc  
loongarch             randconfig-001-20240304   gcc  
loongarch             randconfig-002-20240303   gcc  
loongarch             randconfig-002-20240304   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       rbtx49xx_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240303   gcc  
nios2                 randconfig-001-20240304   gcc  
nios2                 randconfig-002-20240303   gcc  
nios2                 randconfig-002-20240304   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240303   gcc  
parisc                randconfig-001-20240304   gcc  
parisc                randconfig-002-20240303   gcc  
parisc                randconfig-002-20240304   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                          g5_defconfig   gcc  
powerpc                    gamecube_defconfig   clang
powerpc                 mpc8313_rdb_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   clang
powerpc                      ppc64e_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc               randconfig-001-20240303   clang
powerpc               randconfig-002-20240303   gcc  
powerpc               randconfig-003-20240303   gcc  
powerpc                     stx_gp3_defconfig   clang
powerpc                     taishan_defconfig   clang
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-001-20240303   gcc  
powerpc64             randconfig-002-20240303   clang
powerpc64             randconfig-003-20240303   clang
powerpc64             randconfig-003-20240304   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240303   gcc  
riscv                 randconfig-002-20240303   clang
riscv                 randconfig-002-20240304   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240303   clang
s390                  randconfig-001-20240304   gcc  
s390                  randconfig-002-20240303   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                    randconfig-001-20240303   gcc  
sh                    randconfig-001-20240304   gcc  
sh                    randconfig-002-20240303   gcc  
sh                    randconfig-002-20240304   gcc  
sh                          rsk7269_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240303   gcc  
sparc64               randconfig-001-20240304   gcc  
sparc64               randconfig-002-20240303   gcc  
sparc64               randconfig-002-20240304   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240303   clang
um                    randconfig-001-20240304   gcc  
um                    randconfig-002-20240303   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240303   clang
x86_64       buildonly-randconfig-002-20240303   clang
x86_64       buildonly-randconfig-003-20240303   clang
x86_64       buildonly-randconfig-004-20240303   clang
x86_64       buildonly-randconfig-005-20240303   gcc  
x86_64       buildonly-randconfig-006-20240303   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240303   clang
x86_64                randconfig-002-20240303   gcc  
x86_64                randconfig-003-20240303   clang
x86_64                randconfig-004-20240303   clang
x86_64                randconfig-005-20240303   clang
x86_64                randconfig-006-20240303   gcc  
x86_64                randconfig-011-20240303   gcc  
x86_64                randconfig-012-20240303   gcc  
x86_64                randconfig-013-20240303   clang
x86_64                randconfig-014-20240303   gcc  
x86_64                randconfig-015-20240303   clang
x86_64                randconfig-016-20240303   gcc  
x86_64                randconfig-071-20240303   clang
x86_64                randconfig-072-20240303   gcc  
x86_64                randconfig-073-20240303   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240303   gcc  
xtensa                randconfig-001-20240304   gcc  
xtensa                randconfig-002-20240303   gcc  
xtensa                randconfig-002-20240304   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

