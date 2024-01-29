Return-Path: <linux-gpio+bounces-2687-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B421183FB9C
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jan 2024 02:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23C711F221D3
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jan 2024 01:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EC5D516;
	Mon, 29 Jan 2024 01:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVhllDI1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9A4D502
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jan 2024 01:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706490718; cv=none; b=t9qTD1277R/fd1X1vcGZLeyl2TNb86+LPeeAihbJenBPI0jIyp9dO+tF+wlbVETTtwE44BLiVjSmDQScoBm7CO/snfvW4wCxZX6h+wkoB1Cyxh359qdShiAAfIPjfzY4rxNQ6wGv5WgyX3323g6BITg7PwGJIKnWHjKqNzM7mAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706490718; c=relaxed/simple;
	bh=tgdbx2HOayz2TVun5489t4YeoqxhYCLvJ/4dlItdvPw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G5iq89ueMHi39XDPBC4HMc0JsJQXXsTVhhbGA+J/i8Qy38SnAPoSZk/3jDHqC1qnuILgBem77GnWGbyQLgKTUuJBtq2a9pBRgZyU/9hbot5z9wibmaIAVQA8DSodwBvNFqSpKdIAuKdogVNcYorMGhyEvDquqDP7lVYWaPb1HP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVhllDI1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706490717; x=1738026717;
  h=date:from:to:cc:subject:message-id;
  bh=tgdbx2HOayz2TVun5489t4YeoqxhYCLvJ/4dlItdvPw=;
  b=DVhllDI1T9RQu+AaMQU2xkdSz5KEc13fjzSAAlHJEfaVAcyUsaEte4mO
   J5BCw9uJ137eklBEYVSdz/tRy35Scd8r+k0LA+pIzLbLzRrGyC5UOFJKh
   Q+3xnSAlJqJqgUK1Fu9oayNurCtU2pQqArRnsyhjd4X1847Zca55gZ47G
   nV+s1R4NxA+5V/GzPHLyxWc1vroRql/y2ohHvyvBsAbImDLXJkgp5q/zs
   8ZKyOahynK72LxM75LS2uKJfcTsZTGz3gwGnANmYCMWSQGkwsnx+0gJt6
   v5hkDk7Fm5j40x00snNa4FjaqbFMZvpB83wt/zndnMHWWBku8wWuOJP71
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="9934161"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="9934161"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 17:11:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="960746669"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="960746669"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Jan 2024 17:11:54 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUGBj-0003uk-0p;
	Mon, 29 Jan 2024 01:11:51 +0000
Date: Mon, 29 Jan 2024 09:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 47eed1127d2af6fada49565efca4671a56e5839d
Message-ID: <202401290941.DAdKYJ1o-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 47eed1127d2af6fada49565efca4671a56e5839d  dt-bindings: pinctrl: amlogic: narrow regex for unit address to hex numbers

elapsed time: 1392m

configs tested: 237
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
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240128   gcc  
arc                   randconfig-001-20240129   gcc  
arc                   randconfig-002-20240128   gcc  
arc                   randconfig-002-20240129   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                                 defconfig   clang
arm                            hisi_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                   randconfig-001-20240129   gcc  
arm                   randconfig-002-20240129   gcc  
arm                   randconfig-003-20240129   gcc  
arm                   randconfig-004-20240129   gcc  
arm                         s3c6400_defconfig   gcc  
arm                        shmobile_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240129   gcc  
arm64                 randconfig-002-20240129   gcc  
arm64                 randconfig-003-20240129   gcc  
arm64                 randconfig-004-20240129   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240128   gcc  
csky                  randconfig-001-20240129   gcc  
csky                  randconfig-002-20240128   gcc  
csky                  randconfig-002-20240129   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240128   clang
i386         buildonly-randconfig-002-20240128   clang
i386         buildonly-randconfig-003-20240128   clang
i386         buildonly-randconfig-004-20240128   clang
i386         buildonly-randconfig-005-20240128   clang
i386         buildonly-randconfig-006-20240128   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240128   clang
i386                  randconfig-002-20240128   clang
i386                  randconfig-003-20240128   clang
i386                  randconfig-004-20240128   clang
i386                  randconfig-005-20240128   clang
i386                  randconfig-006-20240128   clang
i386                  randconfig-011-20240128   gcc  
i386                  randconfig-012-20240128   gcc  
i386                  randconfig-013-20240128   gcc  
i386                  randconfig-014-20240128   gcc  
i386                  randconfig-015-20240128   gcc  
i386                  randconfig-016-20240128   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240128   gcc  
loongarch             randconfig-001-20240129   gcc  
loongarch             randconfig-002-20240128   gcc  
loongarch             randconfig-002-20240129   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                           xway_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240128   gcc  
nios2                 randconfig-001-20240129   gcc  
nios2                 randconfig-002-20240128   gcc  
nios2                 randconfig-002-20240129   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240128   gcc  
parisc                randconfig-001-20240129   gcc  
parisc                randconfig-002-20240128   gcc  
parisc                randconfig-002-20240129   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                       holly_defconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc                     ppa8548_defconfig   gcc  
powerpc               randconfig-001-20240129   gcc  
powerpc               randconfig-002-20240129   gcc  
powerpc               randconfig-003-20240129   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     tqm8548_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20240129   gcc  
powerpc64             randconfig-002-20240129   gcc  
powerpc64             randconfig-003-20240129   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240129   gcc  
riscv                 randconfig-002-20240129   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240128   gcc  
s390                  randconfig-002-20240128   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                    randconfig-001-20240128   gcc  
sh                    randconfig-001-20240129   gcc  
sh                    randconfig-002-20240128   gcc  
sh                    randconfig-002-20240129   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240128   gcc  
sparc64               randconfig-001-20240129   gcc  
sparc64               randconfig-002-20240128   gcc  
sparc64               randconfig-002-20240129   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240129   gcc  
um                    randconfig-002-20240129   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240128   clang
x86_64       buildonly-randconfig-001-20240129   gcc  
x86_64       buildonly-randconfig-002-20240128   clang
x86_64       buildonly-randconfig-002-20240129   gcc  
x86_64       buildonly-randconfig-003-20240128   clang
x86_64       buildonly-randconfig-003-20240129   gcc  
x86_64       buildonly-randconfig-004-20240128   clang
x86_64       buildonly-randconfig-004-20240129   gcc  
x86_64       buildonly-randconfig-005-20240128   clang
x86_64       buildonly-randconfig-005-20240129   gcc  
x86_64       buildonly-randconfig-006-20240128   clang
x86_64       buildonly-randconfig-006-20240129   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20240128   clang
x86_64                randconfig-011-20240129   gcc  
x86_64                randconfig-012-20240128   clang
x86_64                randconfig-012-20240129   gcc  
x86_64                randconfig-013-20240128   clang
x86_64                randconfig-013-20240129   gcc  
x86_64                randconfig-014-20240128   clang
x86_64                randconfig-014-20240129   gcc  
x86_64                randconfig-015-20240128   clang
x86_64                randconfig-015-20240129   gcc  
x86_64                randconfig-016-20240128   clang
x86_64                randconfig-016-20240129   gcc  
x86_64                randconfig-071-20240128   clang
x86_64                randconfig-071-20240129   gcc  
x86_64                randconfig-072-20240128   clang
x86_64                randconfig-072-20240129   gcc  
x86_64                randconfig-073-20240128   clang
x86_64                randconfig-073-20240129   gcc  
x86_64                randconfig-074-20240128   clang
x86_64                randconfig-074-20240129   gcc  
x86_64                randconfig-075-20240128   clang
x86_64                randconfig-075-20240129   gcc  
x86_64                randconfig-076-20240128   clang
x86_64                randconfig-076-20240129   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240128   gcc  
xtensa                randconfig-001-20240129   gcc  
xtensa                randconfig-002-20240128   gcc  
xtensa                randconfig-002-20240129   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

