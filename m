Return-Path: <linux-gpio+bounces-4875-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A64891FD1
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 16:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E28A1C28DEA
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Mar 2024 15:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF466A03E;
	Fri, 29 Mar 2024 14:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XuR0C6Ju"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FCA135A50
	for <linux-gpio@vger.kernel.org>; Fri, 29 Mar 2024 14:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711721996; cv=none; b=hpVenpGrua5JzsgvHVZPereTeDOgoOPZLf7gFPxnPL8fl67CoFF+0QRXZ6CaBzWOd+AlvIVKSCubVTUbwTHu4Bq73ehpvc4nurfBQUhXAHjo7745VQjuUhQDobNMTFyJqr1UGHCbZYYRVNw4TDMAPjY8AMIKmJqzqVUzBh/LSJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711721996; c=relaxed/simple;
	bh=fvjkEOuQRhI+5UNO/JAAYe3TOCi6MLEbycL2VtlfXrM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XHAwswKz2yNhIiv7UQEbx31htgCweQPBZFrQTFTldcybzo1SP8wqYjgcMrvP+NZcaFdLbykiXtHqgHpmg6EVAjriE7CbNmMZ/erhccD+eVEgGAwcNZB6Sf3qtwVCMN/YF28Jzwn/MFXEswtL+7mLw2NFcS/mhWvFHgEUwC8Kyik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XuR0C6Ju; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711721994; x=1743257994;
  h=date:from:to:cc:subject:message-id;
  bh=fvjkEOuQRhI+5UNO/JAAYe3TOCi6MLEbycL2VtlfXrM=;
  b=XuR0C6JuLOPWcMGh+GaUc3Ewkz+LwNZyMvK4CoFgDG/gzdgK2lEPzUB1
   +0RTQen/bN6b2TX+aO4dCTCFKUNpCi/nYCWpfBfskDac8SvlQg89xib5k
   oPDu9wmTBfHOG5Bzw24CDr7t1ROUVtPqP+OlRkzQdKl3mRb8A/yrOowsP
   6AakO2VniLtOXfjHKnG1n8aR1BlLk7qbjCSexdo6+eXahzz0q6XWlWDg7
   KHrEBWby69UXwKNw+vVGqZziYJeJ04Wqe1BRr3CC/HX0lCpm6LW/yksdJ
   9tQDOxfghLezVZYhxLiNsoyx5ySpADMdm9H8X4OnZkJNHrnZhDjI7eaUy
   Q==;
X-CSE-ConnectionGUID: 2WaDlICIRhWarQyihhbI0w==
X-CSE-MsgGUID: 2RwCTvPJSAOSU5uQSRjTjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="7505760"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="7505760"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 07:19:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="17057370"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Mar 2024 07:19:52 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqD5C-0003G8-0J;
	Fri, 29 Mar 2024 14:19:50 +0000
Date: Fri, 29 Mar 2024 22:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 85dfe458376c01282261bb3555f623f2afb1b203
Message-ID: <202403292200.cuKhBsTp-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 85dfe458376c01282261bb3555f623f2afb1b203  pinctrl: pinctrl-single: move suspend()/resume() callbacks to noirq

elapsed time: 851m

configs tested: 156
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
arc                   randconfig-001-20240329   gcc  
arc                   randconfig-002-20240329   gcc  
arc                           tb10x_defconfig   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240329   gcc  
arm                   randconfig-004-20240329   gcc  
arm                       spear13xx_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240329   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240329   gcc  
csky                  randconfig-002-20240329   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             alldefconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-002-20240329   clang
i386         buildonly-randconfig-003-20240329   clang
i386         buildonly-randconfig-004-20240329   clang
i386         buildonly-randconfig-005-20240329   clang
i386         buildonly-randconfig-006-20240329   clang
i386                                defconfig   clang
i386                  randconfig-001-20240329   clang
i386                  randconfig-002-20240329   clang
i386                  randconfig-003-20240329   clang
i386                  randconfig-004-20240329   clang
i386                  randconfig-005-20240329   clang
i386                  randconfig-006-20240329   clang
i386                  randconfig-011-20240329   clang
i386                  randconfig-012-20240329   clang
i386                  randconfig-016-20240329   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240329   gcc  
loongarch             randconfig-002-20240329   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                       lemote2f_defconfig   gcc  
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240329   gcc  
nios2                 randconfig-002-20240329   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240329   gcc  
parisc                randconfig-002-20240329   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        fsp2_defconfig   gcc  
powerpc                        icon_defconfig   gcc  
powerpc               randconfig-002-20240329   gcc  
powerpc                    socrates_defconfig   gcc  
powerpc64             randconfig-001-20240329   gcc  
powerpc64             randconfig-003-20240329   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240329   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240329   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240329   gcc  
sh                    randconfig-002-20240329   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240329   gcc  
sparc64               randconfig-002-20240329   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-002-20240329   gcc  
um                           x86_64_defconfig   clang
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240329   clang
x86_64       buildonly-randconfig-004-20240329   clang
x86_64       buildonly-randconfig-006-20240329   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-003-20240329   clang
x86_64                randconfig-005-20240329   clang
x86_64                randconfig-011-20240329   clang
x86_64                randconfig-013-20240329   clang
x86_64                randconfig-014-20240329   clang
x86_64                randconfig-016-20240329   clang
x86_64                randconfig-073-20240329   clang
x86_64                randconfig-075-20240329   clang
x86_64                randconfig-076-20240329   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240329   gcc  
xtensa                randconfig-002-20240329   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

