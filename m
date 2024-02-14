Return-Path: <linux-gpio+bounces-3273-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4677F8546B3
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 10:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C94C1C22831
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 09:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465C414A8C;
	Wed, 14 Feb 2024 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ag3rAuVY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250521428A
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 09:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707904610; cv=none; b=DxRNKz0K2cwiRYCtnnBJPgVlTUJ7G08uK+2/uBKdvejXM4W4kktdll69Ga+zZpuTE8wlh2TKvu6y0qLfEsvFXNflYbBEVR3Zl/S5qKdiruRLMhpqK7fDONwjkvLF0lql5LGtP7lPbaujD+78cbIe5vYOPkNB77wZyEQR1maK8Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707904610; c=relaxed/simple;
	bh=knsiBYVR6k3mgdk53Q6379D20s0pCsDmtL7ZiLgSZy8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EQAs/w65XKqfMQJUgza/brwHr5TwBOi9vF1NKeVOur7xomZzHE9PT1/PFhaB9rDBtjDrh6qU3AF7cnXhT2+H3re21ry3bSm83beZgzyyDFcdI5xMrvrYtlJYWluzp9JD2wupD2C+ndQVu+pobmNcJukdgdSqYt9nTo4e+VmkY1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ag3rAuVY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707904607; x=1739440607;
  h=date:from:to:cc:subject:message-id;
  bh=knsiBYVR6k3mgdk53Q6379D20s0pCsDmtL7ZiLgSZy8=;
  b=Ag3rAuVYhiWWDgxwesItXB4ESVQERDUcCPkppv22LapI+HlpedQzVL9E
   kGYgcbaIp788PBtvdPLDZvs1CnLpEy6Ck6VVuGpmM2x3kUPGqIXupqlNN
   hwsixEWzCHe1u0rCakDkxXr6lvmUbAMEZ9n+FypVVKqFrWtBlA4zLGRcG
   v+l1nOqiDA+xjflPzNl2EBZUxJm/LbYBTfbCRvGkyUFGM9QgabqoF+Wgy
   gHQVmGV89/N+lze887iF0FNvaAsT+OlfiVZiqfK71wTpwuwdRolyASiyB
   VVk50b7+yZngU5dBxrhlnZVUjvhTr1IpKbzP61g5ZeIyoN68Xrl1pjVM8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2085258"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2085258"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:56:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3499821"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Feb 2024 01:56:47 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raC0R-0008fA-2Z;
	Wed, 14 Feb 2024 09:56:43 +0000
Date: Wed, 14 Feb 2024 17:55:59 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 fd141e173af0a98f8559d888567d84c73f63f09c
Message-ID: <202402141756.U2CmPmOS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: fd141e173af0a98f8559d888567d84c73f63f09c  Merge tag 'renesas-pinctrl-for-v6.9-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into devel

elapsed time: 1460m

configs tested: 219
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240213   gcc  
arc                   randconfig-002-20240213   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   clang
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                   milbeaut_m10v_defconfig   clang
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20240213   gcc  
arm                   randconfig-001-20240214   clang
arm                   randconfig-002-20240213   gcc  
arm                   randconfig-003-20240213   gcc  
arm                   randconfig-003-20240214   clang
arm                   randconfig-004-20240213   clang
arm                   randconfig-004-20240214   clang
arm                        realview_defconfig   clang
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240213   gcc  
arm64                 randconfig-001-20240214   clang
arm64                 randconfig-002-20240213   gcc  
arm64                 randconfig-002-20240214   clang
arm64                 randconfig-003-20240213   gcc  
arm64                 randconfig-004-20240213   gcc  
arm64                 randconfig-004-20240214   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240213   gcc  
csky                  randconfig-002-20240213   gcc  
hexagon                          alldefconfig   clang
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240213   clang
hexagon               randconfig-001-20240214   clang
hexagon               randconfig-002-20240213   clang
hexagon               randconfig-002-20240214   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240213   clang
i386         buildonly-randconfig-001-20240214   clang
i386         buildonly-randconfig-002-20240213   gcc  
i386         buildonly-randconfig-002-20240214   clang
i386         buildonly-randconfig-003-20240213   gcc  
i386         buildonly-randconfig-003-20240214   clang
i386         buildonly-randconfig-004-20240213   clang
i386         buildonly-randconfig-005-20240213   gcc  
i386         buildonly-randconfig-006-20240213   clang
i386         buildonly-randconfig-006-20240214   clang
i386                                defconfig   clang
i386                  randconfig-001-20240213   clang
i386                  randconfig-001-20240214   clang
i386                  randconfig-002-20240213   gcc  
i386                  randconfig-002-20240214   clang
i386                  randconfig-003-20240213   gcc  
i386                  randconfig-003-20240214   clang
i386                  randconfig-004-20240213   clang
i386                  randconfig-005-20240213   gcc  
i386                  randconfig-005-20240214   clang
i386                  randconfig-006-20240213   gcc  
i386                  randconfig-011-20240213   clang
i386                  randconfig-011-20240214   clang
i386                  randconfig-012-20240213   gcc  
i386                  randconfig-013-20240213   gcc  
i386                  randconfig-014-20240213   gcc  
i386                  randconfig-015-20240213   gcc  
i386                  randconfig-015-20240214   clang
i386                  randconfig-016-20240213   gcc  
i386                  randconfig-016-20240214   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240213   gcc  
loongarch             randconfig-002-20240213   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                           ip28_defconfig   gcc  
mips                           mtx1_defconfig   clang
mips                         rt305x_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240213   gcc  
nios2                 randconfig-002-20240213   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240213   gcc  
parisc                randconfig-002-20240213   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        icon_defconfig   gcc  
powerpc                  mpc885_ads_defconfig   clang
powerpc                       ppc64_defconfig   clang
powerpc               randconfig-001-20240213   clang
powerpc               randconfig-001-20240214   clang
powerpc               randconfig-002-20240213   gcc  
powerpc               randconfig-002-20240214   clang
powerpc               randconfig-003-20240213   gcc  
powerpc               randconfig-003-20240214   clang
powerpc                      walnut_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20240213   gcc  
powerpc64             randconfig-001-20240214   clang
powerpc64             randconfig-002-20240213   gcc  
powerpc64             randconfig-002-20240214   clang
powerpc64             randconfig-003-20240213   clang
powerpc64             randconfig-003-20240214   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240213   gcc  
riscv                 randconfig-001-20240214   clang
riscv                 randconfig-002-20240213   gcc  
riscv                 randconfig-002-20240214   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240213   gcc  
s390                  randconfig-001-20240214   clang
s390                  randconfig-002-20240213   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                    randconfig-001-20240213   gcc  
sh                    randconfig-002-20240213   gcc  
sh                          rsk7203_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240213   gcc  
sparc64               randconfig-002-20240213   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240213   clang
um                    randconfig-001-20240214   clang
um                    randconfig-002-20240213   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240214   gcc  
x86_64       buildonly-randconfig-002-20240214   clang
x86_64       buildonly-randconfig-003-20240214   gcc  
x86_64       buildonly-randconfig-004-20240214   gcc  
x86_64       buildonly-randconfig-005-20240214   gcc  
x86_64       buildonly-randconfig-006-20240214   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240214   clang
x86_64                randconfig-002-20240214   gcc  
x86_64                randconfig-003-20240214   clang
x86_64                randconfig-004-20240214   gcc  
x86_64                randconfig-005-20240214   clang
x86_64                randconfig-006-20240214   clang
x86_64                randconfig-011-20240214   clang
x86_64                randconfig-012-20240214   clang
x86_64                randconfig-013-20240214   gcc  
x86_64                randconfig-014-20240214   gcc  
x86_64                randconfig-015-20240214   clang
x86_64                randconfig-016-20240214   clang
x86_64                randconfig-071-20240214   gcc  
x86_64                randconfig-072-20240214   clang
x86_64                randconfig-073-20240214   gcc  
x86_64                randconfig-074-20240214   clang
x86_64                randconfig-075-20240214   clang
x86_64                randconfig-076-20240214   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240213   gcc  
xtensa                randconfig-002-20240213   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

