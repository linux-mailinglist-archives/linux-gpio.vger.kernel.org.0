Return-Path: <linux-gpio+bounces-4185-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A0387466D
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Mar 2024 03:56:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80F2B1F216DD
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Mar 2024 02:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B225C8B;
	Thu,  7 Mar 2024 02:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsBLNe03"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E44F4E2
	for <linux-gpio@vger.kernel.org>; Thu,  7 Mar 2024 02:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709780204; cv=none; b=db/o2C9/x1lRMD3MdTiOd8dWQlq5z//23DnaMDRhUYFpEbHE+8itZk3IaucioOPN9Dwo2x6eJ1oNBbZYN/RTtlUxPn1qbfabCs4j9GzGhYOtUKJwqthupckJbi248QLwC03Fb6RVRuxENCILr8OMosXBDWowokfgQp+RdzLkKOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709780204; c=relaxed/simple;
	bh=654XNqTo5qVNDLPVq0VfoKOX5AMMYSbTfcCzlMDN34c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UAy0yTtvsndar/fm0Ndf9ZujH+lBw3xFvMTRJ1VrEyu2560A93bdHszBOdj0oDAChRyqTFvEsn2LkUJ8HzVC1ArrstIHbw2QZkJV+5w5Z6ch69YrRNTlMAHBxLhZsvyetwQ1k0enEEcZdOoJecSY/DftCimbAqQN+juxGcyPIUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsBLNe03; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709780203; x=1741316203;
  h=date:from:to:cc:subject:message-id;
  bh=654XNqTo5qVNDLPVq0VfoKOX5AMMYSbTfcCzlMDN34c=;
  b=lsBLNe03YtYv6iVvTBFP9hwg/4HPF9TPc/GG/g4s+0mhWncqLbY4GuTw
   KgIKn6sh+Tu5xSpt0phdVqtY5mqXgiaMsOP34gawFXAmC2VYGfEyNBV3J
   R1N4hm7dzsER3nmPK0kbpeoMwei5LaUwIIGluhuZTzVpOWtXPyI7AWQGw
   zUn0Fg9hDpFJYxcaBlAoQ7N9vTgZMBzs5QwUdhcC+2aafXD+TMgA/F/JJ
   JaaFSGbS/1ANNAXLAdk2dyUGIFOvSDgZe87K5A/KMh7w313DwMA8D42RG
   aHlNcpg8VQRsmYUczqzotYvXPQO/VKmlZimwkznHuR9JtXEgIXlOYZY8P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15839762"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="15839762"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 18:56:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="14523886"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Mar 2024 18:56:41 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ri3vy-0004jZ-39;
	Thu, 07 Mar 2024 02:56:38 +0000
Date: Thu, 07 Mar 2024 10:56:23 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/fix-aw9523-terminator] BUILD SUCCESS
 681692503d2e64cb5ec4afc84cbd13abbe598331
Message-ID: <202403071019.Dryg9A38-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/fix-aw9523-terminator
branch HEAD: 681692503d2e64cb5ec4afc84cbd13abbe598331  pinctrl: aw9523: Add proper terminator

elapsed time: 1125m

configs tested: 178
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
arc                          axs101_defconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            hisi_defconfig   gcc  
arm                          ixp4xx_defconfig   gcc  
arm                       netwinder_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                        realview_defconfig   clang
arm                         s3c6400_defconfig   gcc  
arm                         socfpga_defconfig   gcc  
arm                       spear13xx_defconfig   gcc  
arm                           spitz_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm                       versatile_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240306   clang
i386         buildonly-randconfig-001-20240307   clang
i386         buildonly-randconfig-002-20240306   clang
i386         buildonly-randconfig-003-20240307   clang
i386         buildonly-randconfig-004-20240306   clang
i386         buildonly-randconfig-005-20240306   clang
i386         buildonly-randconfig-006-20240307   clang
i386                                defconfig   clang
i386                  randconfig-002-20240306   clang
i386                  randconfig-003-20240306   clang
i386                  randconfig-003-20240307   clang
i386                  randconfig-004-20240306   clang
i386                  randconfig-006-20240306   clang
i386                  randconfig-006-20240307   clang
i386                  randconfig-011-20240306   clang
i386                  randconfig-011-20240307   clang
i386                  randconfig-012-20240306   clang
i386                  randconfig-013-20240307   clang
i386                  randconfig-014-20240307   clang
i386                  randconfig-015-20240306   clang
i386                  randconfig-015-20240307   clang
i386                  randconfig-016-20240306   clang
i386                  randconfig-016-20240307   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                         db1xxx_defconfig   clang
mips                           ip27_defconfig   gcc  
mips                      malta_kvm_defconfig   gcc  
mips                           rs90_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 canyonlands_defconfig   clang
powerpc                     ksi8560_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   clang
powerpc                    mvme5100_defconfig   gcc  
powerpc                     taishan_defconfig   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240306   clang
x86_64       buildonly-randconfig-002-20240306   clang
x86_64       buildonly-randconfig-003-20240306   clang
x86_64       buildonly-randconfig-004-20240306   clang
x86_64       buildonly-randconfig-004-20240307   clang
x86_64       buildonly-randconfig-006-20240306   clang
x86_64       buildonly-randconfig-006-20240307   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240306   clang
x86_64                randconfig-002-20240306   clang
x86_64                randconfig-003-20240307   clang
x86_64                randconfig-005-20240306   clang
x86_64                randconfig-006-20240306   clang
x86_64                randconfig-006-20240307   clang
x86_64                randconfig-011-20240306   clang
x86_64                randconfig-012-20240306   clang
x86_64                randconfig-013-20240306   clang
x86_64                randconfig-014-20240307   clang
x86_64                randconfig-015-20240306   clang
x86_64                randconfig-015-20240307   clang
x86_64                randconfig-016-20240307   clang
x86_64                randconfig-071-20240306   clang
x86_64                randconfig-072-20240306   clang
x86_64                randconfig-073-20240306   clang
x86_64                randconfig-073-20240307   clang
x86_64                randconfig-074-20240306   clang
x86_64                randconfig-075-20240306   clang
x86_64                randconfig-075-20240307   clang
x86_64                randconfig-076-20240306   clang
x86_64                randconfig-076-20240307   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

