Return-Path: <linux-gpio+bounces-2444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F732838D41
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jan 2024 12:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 740631C22589
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jan 2024 11:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9645DF13;
	Tue, 23 Jan 2024 11:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2Epvhtc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A025D917
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jan 2024 11:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706008639; cv=none; b=rQjROoKEOPeHgu/wzO36xhSgNxAYNWq02n9BcYXn+mrZqAX0ek7kDRMBffpFAGVDae4EABDffj5DvVAKZK6DqZ/FbdbbCQz8kMUKeZ7BreUzIncoN+SRqMuvpxx7l8SkR5v5xqHU3rrVzrIjY0lNNARV9vzhIGPtCn/ttcEF/Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706008639; c=relaxed/simple;
	bh=YHs109OiqLHkW03yh0koGLAacTkDO3YXrYSakJCuQRM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DT+z2KoEx9/9U2W+pn/Sq56CpcfUA30NAUWuf/kbTahj19WalIrlYTYp+/f/3fcHiun7giWXqI2lBcsk+kB91huUlZp85kiGKCg37m8RZPVy3LEHIeeMsB0Wuhiw7cTXz+pui5/OlTTXHHqVZbzlmEnzfxB+4bNILbny/xiUPQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2Epvhtc; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706008637; x=1737544637;
  h=date:from:to:cc:subject:message-id;
  bh=YHs109OiqLHkW03yh0koGLAacTkDO3YXrYSakJCuQRM=;
  b=K2EpvhtcszB3mFFmbvN7W76p6mTAdx6wAHwgsB91U6I3dB9AFwMTur2O
   cjlq4tuVC8JWP73kDdcSbBPE3KaZ/6euU8OKyvChDrak6JRR4L67r0Dsv
   dYYJ9wKenK1iAfuAeF9Wra2jJvxBE+PuWlcn/UCzvxDrpMznWQRRkFNZq
   2VfZZaHvIJKepOQrDH0mUH6LvfVE1sJOjZJVRC31wsIeL7nBJuHvfZwXV
   ItqC97vRV5YXdpBO03UxKhumM7k8yZJK7P4KdsCW2q3Gof7vpuPTDWWiT
   chjDbP1nUjwYhOTU8TIjhotUteVpzeHGV1L5ZPpANys1uTi9P5YBlNLge
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="432648421"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="432648421"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 03:17:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="20299155"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jan 2024 03:17:15 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSEmH-0007Nn-0a;
	Tue, 23 Jan 2024 11:17:13 +0000
Date: Tue, 23 Jan 2024 19:16:53 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 84aef4ed59705585d629e81d633a83b7d416f5fb
Message-ID: <202401231951.tphxnbxF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 84aef4ed59705585d629e81d633a83b7d416f5fb  gpio: eic-sprd: Clear interrupt after set the interrupt type

elapsed time: 1459m

configs tested: 151
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240123   gcc  
arc                   randconfig-002-20240123   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                       imx_v6_v7_defconfig   gcc  
arm                         lpc32xx_defconfig   clang
arm                            mmp2_defconfig   clang
arm                        neponset_defconfig   clang
arm                         orion5x_defconfig   clang
arm                   randconfig-001-20240123   gcc  
arm                   randconfig-002-20240123   gcc  
arm                   randconfig-003-20240123   gcc  
arm                   randconfig-004-20240123   gcc  
arm                          sp7021_defconfig   clang
arm64                            alldefconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240123   gcc  
arm64                 randconfig-002-20240123   gcc  
arm64                 randconfig-003-20240123   gcc  
arm64                 randconfig-004-20240123   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240123   gcc  
csky                  randconfig-002-20240123   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240123   clang
hexagon               randconfig-002-20240123   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240122   clang
i386         buildonly-randconfig-002-20240122   clang
i386         buildonly-randconfig-003-20240122   clang
i386         buildonly-randconfig-004-20240122   clang
i386         buildonly-randconfig-005-20240122   clang
i386         buildonly-randconfig-006-20240122   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240122   clang
i386                  randconfig-002-20240122   clang
i386                  randconfig-003-20240122   clang
i386                  randconfig-004-20240122   clang
i386                  randconfig-005-20240122   clang
i386                  randconfig-006-20240122   clang
i386                  randconfig-011-20240122   gcc  
i386                  randconfig-012-20240122   gcc  
i386                  randconfig-013-20240122   gcc  
i386                  randconfig-014-20240122   gcc  
i386                  randconfig-015-20240122   gcc  
i386                  randconfig-016-20240122   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240123   gcc  
loongarch             randconfig-002-20240123   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                     loongson2k_defconfig   gcc  
mips                        maltaup_defconfig   clang
mips                    maltaup_xpa_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240123   gcc  
nios2                 randconfig-002-20240123   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240123   gcc  
parisc                randconfig-002-20240123   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                   lite5200b_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc               randconfig-001-20240123   gcc  
powerpc               randconfig-002-20240123   gcc  
powerpc               randconfig-003-20240123   gcc  
powerpc                     tqm8541_defconfig   gcc  
powerpc64             randconfig-001-20240123   gcc  
powerpc64             randconfig-002-20240123   gcc  
powerpc64             randconfig-003-20240123   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240123   gcc  
riscv                 randconfig-002-20240123   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240123   clang
s390                  randconfig-002-20240123   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240123   gcc  
sh                    randconfig-002-20240123   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240123   gcc  
sparc64               randconfig-002-20240123   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240123   gcc  
um                    randconfig-002-20240123   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240123   gcc  
x86_64       buildonly-randconfig-002-20240123   gcc  
x86_64       buildonly-randconfig-003-20240123   gcc  
x86_64       buildonly-randconfig-004-20240123   gcc  
x86_64       buildonly-randconfig-005-20240123   gcc  
x86_64       buildonly-randconfig-006-20240123   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240123   clang
x86_64                randconfig-002-20240123   clang
x86_64                randconfig-003-20240123   clang
x86_64                randconfig-004-20240123   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240123   gcc  
xtensa                randconfig-002-20240123   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

