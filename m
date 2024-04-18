Return-Path: <linux-gpio+bounces-5635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BB88A903B
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Apr 2024 03:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FA25B213F7
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Apr 2024 00:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5FD5CB0;
	Thu, 18 Apr 2024 00:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGeGmb38"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2B453AC
	for <linux-gpio@vger.kernel.org>; Thu, 18 Apr 2024 00:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713401995; cv=none; b=MlEz6MZNp0MaTGnwHg6HdReZfrYPoX6H+3ldNEIkChTZiq45oeEUA7glV7eAlahBiKiS7Z2om22QbYsruUXkwk467Kl1uGRP5Y7o0xk7+r2BjKy1GfMd8MNeQmZVCPbflp0tFLxM9T/Gr3jyex+OXI1vrPk0dcBM2UQg3GErsAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713401995; c=relaxed/simple;
	bh=Tjd0Lb1lr/G99cP9f9jGzBlN/t1Io9r6U5SbfRzVcB0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mahFO4Uj3JyjqKXDW8N8QKKxZapoaIIINEvNcuRERL/m4bJmLL0wlY1PftJgIJHTmOIgE7m71+8sVy6B9zLfIQqRkE1zQT96c4fs+KzTTR0VP0TQwch0SWOyNNlmiUimyginfALBW3u5rB9ssu/n+2d/CXyMdXCPEDSqQQPJ+Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGeGmb38; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713401994; x=1744937994;
  h=date:from:to:cc:subject:message-id;
  bh=Tjd0Lb1lr/G99cP9f9jGzBlN/t1Io9r6U5SbfRzVcB0=;
  b=IGeGmb38NIMV0G8WeDKW6KlFe/uDnsM2FFM0oUQphebjsbQgbaGEn4YO
   IoXio/X24oOo9bsmkomx3mcXjU/MUcacb23Tw8rZ4W3d9QFeCgfE2q5Ix
   j01VoWQy3OwlOqKS4QpZYoo0L7EfsrmIqGehzUfpoziY56tAoJ3R1StFi
   gXinY2X4hsc+/+xHvoqrmm88D6Vv/UxkGDx+tyoRrhEEmT/GrbU4O3REf
   GwDTQQqKYXUhhtjelrnkIMLQLbr7gXCTaBI2ZvNlnDodl5ZALzRtOa2jp
   Fj/bOPBDvshiY4pFKTngUufYoZSXs4llcSRhqWaIVZSOHvw4LGbzNOy/b
   Q==;
X-CSE-ConnectionGUID: +wJOi4joSEeLPrTweYH/Og==
X-CSE-MsgGUID: iKSQuUOyTX2NUL5AeEyCcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="11864208"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="11864208"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 17:59:53 -0700
X-CSE-ConnectionGUID: pAvyH6SXS5y8QTWbajQvNg==
X-CSE-MsgGUID: MmqzIGalTBKG1Ry17aUx6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="22892243"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Apr 2024 17:59:52 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxG7y-000794-0p;
	Thu, 18 Apr 2024 00:59:50 +0000
Date: Thu, 18 Apr 2024 08:58:58 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 398c9955bdead2cf027cc263c13e7bd75e9d9116
Message-ID: <202404180855.uyIzrNzK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 398c9955bdead2cf027cc263c13e7bd75e9d9116  Merge tag 'renesas-pinctrl-fixes-for-v6.9-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into fixes

elapsed time: 729m

configs tested: 101
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
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
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
i386         buildonly-randconfig-001-20240418   gcc  
i386         buildonly-randconfig-002-20240418   gcc  
i386         buildonly-randconfig-003-20240418   clang
i386         buildonly-randconfig-004-20240418   gcc  
i386         buildonly-randconfig-005-20240418   clang
i386         buildonly-randconfig-006-20240418   clang
i386                                defconfig   clang
i386                  randconfig-001-20240418   gcc  
i386                  randconfig-002-20240418   gcc  
i386                  randconfig-003-20240418   clang
i386                  randconfig-004-20240418   gcc  
i386                  randconfig-005-20240418   gcc  
i386                  randconfig-006-20240418   gcc  
i386                  randconfig-011-20240418   clang
i386                  randconfig-012-20240418   clang
i386                  randconfig-013-20240418   gcc  
i386                  randconfig-014-20240418   gcc  
i386                  randconfig-015-20240418   gcc  
i386                  randconfig-016-20240418   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
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
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
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
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

