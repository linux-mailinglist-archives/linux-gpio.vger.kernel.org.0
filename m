Return-Path: <linux-gpio+bounces-82-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 211677EA91B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 04:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5271C1C20963
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 03:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0B78C00;
	Tue, 14 Nov 2023 03:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8GeiWnD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5C38BE7
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 03:24:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A862891
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 19:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699932271; x=1731468271;
  h=date:from:to:cc:subject:message-id;
  bh=iH1RgJUW61mrdWU+UzLbJmF9fUA9Z+s01BJqGrtlfWs=;
  b=V8GeiWnDpO/FLTPT8HM6vvMu9xnbPfXdaU/KS2st8trfcGGSijO4K7UO
   hCaN3POhGUPDeVbSlU4717QRjkoKLv3Y3WmgSvnUrvMDAIkvEt6SMvPrp
   n2M5hG6LNBfc1iRRpy9/sF0A4ZuNh4OFpUZ/wD//+yteWkufeXfb+2y6N
   yYg366MQbie8YChK4v9silzLugSxTifO55WlVC1ydNNqv0G0+RJf3APVs
   W53CRWHsQM8QBVy9Wn78SZeQ9M6k/YNLIJ5u/FJpyNatyHBBVpBY9CHad
   drI7BFZWRj4Q7ze3wqMG2nxi3vKD5lMbUuYP2sNBAZIzTTSsFtfdFdv6R
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="387728278"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="387728278"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 19:24:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="12652081"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Nov 2023 19:24:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2k2N-000Cns-30;
	Tue, 14 Nov 2023 03:24:27 +0000
Date: Tue, 14 Nov 2023 11:24:11 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 22a4a9ed37d675c210d530f2de92cc6afbcf1daa
Message-ID: <202311141109.ug1G87tF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 22a4a9ed37d675c210d530f2de92cc6afbcf1daa  pinctrl: qcom: Introduce the SM8650 Top Level Mode Multiplexer driver

elapsed time: 732m

configs tested: 165
configs skipped: 2

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
arc                   randconfig-001-20231114   gcc  
arc                   randconfig-002-20231114   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231114   gcc  
arm                   randconfig-002-20231114   gcc  
arm                   randconfig-003-20231114   gcc  
arm                   randconfig-004-20231114   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231114   gcc  
arm64                 randconfig-002-20231114   gcc  
arm64                 randconfig-003-20231114   gcc  
arm64                 randconfig-004-20231114   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231114   gcc  
csky                  randconfig-002-20231114   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231114   gcc  
i386         buildonly-randconfig-002-20231114   gcc  
i386         buildonly-randconfig-003-20231114   gcc  
i386         buildonly-randconfig-004-20231114   gcc  
i386         buildonly-randconfig-005-20231114   gcc  
i386         buildonly-randconfig-006-20231114   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231114   gcc  
i386                  randconfig-002-20231114   gcc  
i386                  randconfig-003-20231114   gcc  
i386                  randconfig-004-20231114   gcc  
i386                  randconfig-005-20231114   gcc  
i386                  randconfig-006-20231114   gcc  
i386                  randconfig-011-20231114   gcc  
i386                  randconfig-012-20231114   gcc  
i386                  randconfig-013-20231114   gcc  
i386                  randconfig-014-20231114   gcc  
i386                  randconfig-015-20231114   gcc  
i386                  randconfig-016-20231114   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231114   gcc  
loongarch             randconfig-002-20231114   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231114   gcc  
nios2                 randconfig-002-20231114   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231114   gcc  
parisc                randconfig-002-20231114   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc               randconfig-001-20231114   gcc  
powerpc               randconfig-002-20231114   gcc  
powerpc               randconfig-003-20231114   gcc  
powerpc64             randconfig-001-20231114   gcc  
powerpc64             randconfig-002-20231114   gcc  
powerpc64             randconfig-003-20231114   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231114   gcc  
riscv                 randconfig-002-20231114   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231114   gcc  
s390                  randconfig-002-20231114   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231114   gcc  
sh                    randconfig-002-20231114   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231114   gcc  
sparc                 randconfig-002-20231114   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231114   gcc  
sparc64               randconfig-002-20231114   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231114   gcc  
um                    randconfig-002-20231114   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231114   gcc  
x86_64       buildonly-randconfig-002-20231114   gcc  
x86_64       buildonly-randconfig-003-20231114   gcc  
x86_64       buildonly-randconfig-004-20231114   gcc  
x86_64       buildonly-randconfig-005-20231114   gcc  
x86_64       buildonly-randconfig-006-20231114   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231114   gcc  
x86_64                randconfig-002-20231114   gcc  
x86_64                randconfig-003-20231114   gcc  
x86_64                randconfig-004-20231114   gcc  
x86_64                randconfig-005-20231114   gcc  
x86_64                randconfig-006-20231114   gcc  
x86_64                randconfig-011-20231114   gcc  
x86_64                randconfig-012-20231114   gcc  
x86_64                randconfig-013-20231114   gcc  
x86_64                randconfig-014-20231114   gcc  
x86_64                randconfig-015-20231114   gcc  
x86_64                randconfig-016-20231114   gcc  
x86_64                randconfig-071-20231114   gcc  
x86_64                randconfig-072-20231114   gcc  
x86_64                randconfig-073-20231114   gcc  
x86_64                randconfig-074-20231114   gcc  
x86_64                randconfig-075-20231114   gcc  
x86_64                randconfig-076-20231114   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                randconfig-001-20231114   gcc  
xtensa                randconfig-002-20231114   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

