Return-Path: <linux-gpio+bounces-2851-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C08FC844AAE
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 23:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70C1328FFC3
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 22:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82D639AF0;
	Wed, 31 Jan 2024 22:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmzPNYJQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D896339AC8
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 22:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706738606; cv=none; b=ATmwupk6mnXCe6ugqtuf8UCucbNYMYyKWHbBNwXyMgz3LzVtnBGmmkSYGw7DbWMKYrN8LHOIT09AzH1/Fh+90sbOIMr2xa+AbmvmJPZDn4e/WxpGbtdwSrfSA97LerIqPusy+W4dtOMse0FZrdP3SY3+SM6CcKH4Mcs9g0RxUTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706738606; c=relaxed/simple;
	bh=0RA8OKrbtgZ8RlqUEmTjwA7qC+88JV1E2iGMdMNmik8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lalNw4/onQv75Mr0E0HeMVPhKGQrvCCykeq7j5bCkZn7kSLay1PDwxrg4UV1kbwkviwfC7nuc2aLbDWRun+yBuHgCU1xISXlp8E0/4f/ke9ZT+CuE3xEIGaITmS+2gZW6KYWBjC/jtuL7I9xgx5RZZL/Ve1s1n1+mwHmMocAb+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmzPNYJQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706738605; x=1738274605;
  h=date:from:to:cc:subject:message-id;
  bh=0RA8OKrbtgZ8RlqUEmTjwA7qC+88JV1E2iGMdMNmik8=;
  b=ZmzPNYJQ4ghNmsD0loQdYOLWbCvDpW0udYny39tDGuZKwpdYQFCMyCO1
   wtzbtd58/omKpQIA3wtvs0rbu7F8TO1YXRR62xiNTFl/miGaYlpYISlPr
   fQVJe+gfg5RMxNFtn87yoP4zmBoLstkhpsDCY+gE5k+djQH0hsJU2Mc2n
   HzPkhzbXvjHANHPK3Hu02aVcUKu7Qij5HBdeo7Q1+0V1RgbCMS6vv9JDP
   RqWkRKxZsgib6lSQHisQl4DGNFgUveJfAvwKzyonCUorR1ezTbYIOoeSG
   XK4MHtvnSqT2JNmXLD2T4arP0J0R0T/vOb2QY0cKv0q7dT3MrZ/sBZBhT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10373980"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="10373980"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 14:03:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="37013358"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 31 Jan 2024 14:03:23 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVIfw-00024a-2n;
	Wed, 31 Jan 2024 22:03:20 +0000
Date: Thu, 01 Feb 2024 06:02:40 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/descriptors-wireless] BUILD SUCCESS
 a1e4a09cb005819bd3eabd862c6d070421dea118
Message-ID: <202402010638.CmEfgVlX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-wireless
branch HEAD: a1e4a09cb005819bd3eabd862c6d070421dea118  wifi: cw1200: Convert to GPIO descriptors

elapsed time: 821m

configs tested: 142
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
arc                     haps_hs_smp_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240131   gcc  
arc                   randconfig-002-20240131   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   clang
arm                          gemini_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                        spear6xx_defconfig   gcc  
arm                           stm32_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240131   gcc  
csky                  randconfig-002-20240131   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386                                defconfig   gcc  
i386                  randconfig-011-20240131   gcc  
i386                  randconfig-011-20240201   clang
i386                  randconfig-012-20240131   gcc  
i386                  randconfig-012-20240201   clang
i386                  randconfig-013-20240131   gcc  
i386                  randconfig-013-20240201   clang
i386                  randconfig-014-20240131   gcc  
i386                  randconfig-014-20240201   clang
i386                  randconfig-015-20240131   gcc  
i386                  randconfig-015-20240201   clang
i386                  randconfig-016-20240131   gcc  
i386                  randconfig-016-20240201   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240131   gcc  
loongarch             randconfig-002-20240131   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240131   gcc  
nios2                 randconfig-002-20240131   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240131   gcc  
parisc                randconfig-002-20240131   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                    socrates_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240131   gcc  
s390                  randconfig-002-20240131   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                    randconfig-001-20240131   gcc  
sh                    randconfig-002-20240131   gcc  
sh                           se7721_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240131   gcc  
sparc64               randconfig-002-20240131   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                randconfig-001-20240131   gcc  
xtensa                randconfig-002-20240131   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

