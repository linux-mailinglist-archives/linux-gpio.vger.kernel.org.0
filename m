Return-Path: <linux-gpio+bounces-4239-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE62987774C
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Mar 2024 15:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53B25B213D7
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Mar 2024 14:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C762CCB4;
	Sun, 10 Mar 2024 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jG8rRBPD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB2D37163
	for <linux-gpio@vger.kernel.org>; Sun, 10 Mar 2024 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710080114; cv=none; b=Aep3kwEHDq293YfpWZqOrPQAMwvhcZn17Pwh+6SjK3LL9NhmfmhslfWzOH/4FKKaWI0Onqb0PiCWmAT5P0d5/05Qh6bX8/VuNIS3M23UN0j6dJWSxdlL6OXDKDgemcPSdnWE4bKcww/ktClmnjh7+KDJl4IUEIxGqTuBWzAH7tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710080114; c=relaxed/simple;
	bh=VzMk9cj4r0xfR5UzP/xnF5YZ8cZek0UNqVqjTWsV904=;
	h=Date:From:To:Cc:Subject:Message-ID; b=atJhDkGFNTo9J83NRtjRzoBsrspRIEX0/43cUaL9EFsE38fIpfFnUBt0nHx+rYLtLNwl/c8nSsCUYv/T9/Bsq1xbab9POjaERCGCfs2IxeWMiGIW9+LrjabbJkJUzvEHoqC/A2MqRnpxgnAu38+NYkLAR0MVzzlZQEQ+Uz78PGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jG8rRBPD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710080111; x=1741616111;
  h=date:from:to:cc:subject:message-id;
  bh=VzMk9cj4r0xfR5UzP/xnF5YZ8cZek0UNqVqjTWsV904=;
  b=jG8rRBPD6ticgIZdqZXF6x1fDXQ7txqwsHiGP8flmPZFVG23FazHkIiN
   i6knlxnIxCXhjXBUTKaaGwBphmSMjUkdaisUTjG/iVp8IeDUcrNfJXczf
   LTqXMw+ZbjhkTDHTPh60NLYB2KECSsJSfOOEPXylYUah175twffiYRYOl
   RZsRgum2cgZey/adK2z/D+xc84qHm4zdUiE3g3sKMSWXCXOS/BydiBQUF
   mqjSUUEgrVGz0jdjelxo2Q/+v/2hm/TVH3UtoGAY7LRFWBphc77oc7SRL
   d2jP0uioHahvAtOFpctNa6bK9zdVAvJPqfU/9ygDr7SSTg9VjMQ97lHf+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="16154805"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="16154805"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 07:15:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="41842418"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Mar 2024 07:15:09 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjJxD-0008Ib-0s;
	Sun, 10 Mar 2024 14:15:07 +0000
Date: Sun, 10 Mar 2024 22:14:19 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 ab4ca601bad180bee2109c5d0d1210a0ce75790c
Message-ID: <202403102215.4FoohTyY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: ab4ca601bad180bee2109c5d0d1210a0ce75790c  gpio: nomadik: Fix debugfs without debugfs

Unverified Warning (likely false positive, please contact us if interested):

drivers/pinctrl/pinctrl-aw9523.c:374 aw9523_pconf_set() error: uninitialized symbol 'rc'.
drivers/pinctrl/pinctrl-aw9523.c:645 aw9523_gpio_get_multiple() error: uninitialized symbol 'ret'.

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- powerpc-randconfig-r071-20240308
    |-- drivers-pinctrl-pinctrl-aw9523.c-aw9523_gpio_get_multiple()-error:uninitialized-symbol-ret-.
    `-- drivers-pinctrl-pinctrl-aw9523.c-aw9523_pconf_set()-error:uninitialized-symbol-rc-.

elapsed time: 817m

configs tested: 196
configs skipped: 4

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
arc                   randconfig-001-20240310   gcc  
arc                   randconfig-002-20240310   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                      jornada720_defconfig   clang
arm                   randconfig-001-20240310   gcc  
arm                   randconfig-002-20240310   gcc  
arm                   randconfig-003-20240310   gcc  
arm                   randconfig-004-20240310   gcc  
arm                        shmobile_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240310   clang
arm64                 randconfig-002-20240310   gcc  
arm64                 randconfig-003-20240310   clang
arm64                 randconfig-004-20240310   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240310   gcc  
csky                  randconfig-002-20240310   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240310   clang
hexagon               randconfig-002-20240310   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240310   clang
i386         buildonly-randconfig-002-20240310   clang
i386         buildonly-randconfig-003-20240310   clang
i386         buildonly-randconfig-004-20240310   clang
i386         buildonly-randconfig-005-20240310   gcc  
i386         buildonly-randconfig-006-20240310   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240310   gcc  
i386                  randconfig-002-20240310   gcc  
i386                  randconfig-003-20240310   clang
i386                  randconfig-004-20240310   gcc  
i386                  randconfig-005-20240310   gcc  
i386                  randconfig-006-20240310   gcc  
i386                  randconfig-011-20240310   clang
i386                  randconfig-012-20240310   clang
i386                  randconfig-013-20240310   clang
i386                  randconfig-014-20240310   clang
i386                  randconfig-015-20240310   clang
i386                  randconfig-016-20240310   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240310   gcc  
loongarch             randconfig-002-20240310   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                           ip22_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240310   gcc  
nios2                 randconfig-002-20240310   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240310   gcc  
parisc                randconfig-002-20240310   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     ksi8560_defconfig   gcc  
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                    mvme5100_defconfig   gcc  
powerpc               randconfig-001-20240310   gcc  
powerpc               randconfig-002-20240310   clang
powerpc               randconfig-003-20240310   clang
powerpc64             randconfig-001-20240310   gcc  
powerpc64             randconfig-002-20240310   gcc  
powerpc64             randconfig-003-20240310   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20240310   gcc  
riscv                 randconfig-002-20240310   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240310   clang
s390                  randconfig-002-20240310   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                    randconfig-001-20240310   gcc  
sh                    randconfig-002-20240310   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240310   gcc  
sparc64               randconfig-002-20240310   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240310   gcc  
um                    randconfig-002-20240310   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240310   clang
x86_64       buildonly-randconfig-002-20240310   gcc  
x86_64       buildonly-randconfig-003-20240310   clang
x86_64       buildonly-randconfig-004-20240310   gcc  
x86_64       buildonly-randconfig-005-20240310   clang
x86_64       buildonly-randconfig-006-20240310   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240310   clang
x86_64                randconfig-002-20240310   gcc  
x86_64                randconfig-003-20240310   gcc  
x86_64                randconfig-004-20240310   gcc  
x86_64                randconfig-005-20240310   clang
x86_64                randconfig-006-20240310   gcc  
x86_64                randconfig-011-20240310   gcc  
x86_64                randconfig-012-20240310   clang
x86_64                randconfig-013-20240310   clang
x86_64                randconfig-014-20240310   gcc  
x86_64                randconfig-015-20240310   clang
x86_64                randconfig-016-20240310   gcc  
x86_64                randconfig-071-20240310   gcc  
x86_64                randconfig-072-20240310   gcc  
x86_64                randconfig-073-20240310   gcc  
x86_64                randconfig-074-20240310   gcc  
x86_64                randconfig-075-20240310   clang
x86_64                randconfig-076-20240310   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                randconfig-001-20240310   gcc  
xtensa                randconfig-002-20240310   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

