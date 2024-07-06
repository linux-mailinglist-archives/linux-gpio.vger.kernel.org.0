Return-Path: <linux-gpio+bounces-8078-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EDE929266
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jul 2024 12:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F30D31C20E37
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Jul 2024 10:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C524D8A7;
	Sat,  6 Jul 2024 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxQoHozJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEA9383A9
	for <linux-gpio@vger.kernel.org>; Sat,  6 Jul 2024 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720260281; cv=none; b=pPw22u8RMLhzKMOMto4tYL/8F0NfX+ll6h+cwEsG1ZweZK/+tUr/gm3Y+ZxH6zpAlLz5+q+48gEwsQhpy9EqFF2T3FJgVQ3UpzkjJTvZD9dehY+7VPzz7KdcZfPPf4sq79HLzg/EN8NRQuqva0gaufFG1tpNHOrhB5TdQnxIH6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720260281; c=relaxed/simple;
	bh=mqdhm5nIFSt0XrztHcDWGUHoWkjEbDpY/Y599pF7Rbs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mAaMY41RZbrU88cdFizLPh0dSFbTCxGznAgJ/L17lmRgsY8XNKfHiVzMrEx3yQ/Hxt1gLtxJP/m1n+WJnRoBttPelz2zZyHowtynkWn02dAVX3mACrPzdDxv5sD3r4UNPzmFMdIEGmy1So23/mtFI9/2H6po7pCaxyrXT5v0doM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxQoHozJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720260279; x=1751796279;
  h=date:from:to:cc:subject:message-id;
  bh=mqdhm5nIFSt0XrztHcDWGUHoWkjEbDpY/Y599pF7Rbs=;
  b=AxQoHozJbDHS7Q/YgTsGGN8aDkRi423CSIUojFKjeoAWZ6qMuocOXPdH
   gHFrsFQ01AZLMIQYzioDwJ8XnIWCk6aQ+PhqK0jURsquEyU1cJwnee1es
   c16HwE7Szmj1hLTPkG0pu83g7eymZl0Cx2rW7Ip4+XERuCd+tWq4vpDAU
   PYsNPoyC+0UC7Oxbd2Z9Rpe/feAqIlouCMFAog3iMUo+FZCoE13sIOJeV
   mZT3Y1LCNbkaFaufcfKXboPc94DmxGAH1XX5+2xO7JoXnCdN46nj1OJYn
   +v2jWCAw3FaTrcZ9nHqSSyTD0PFtGj+CuU5jSCiFw3IU9iCv217slQT6Z
   Q==;
X-CSE-ConnectionGUID: XQTjZkMGSFyPrzGbi7DGOw==
X-CSE-MsgGUID: RvRCikspQKaMiBIbVhijfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28682467"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="28682467"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 03:04:39 -0700
X-CSE-ConnectionGUID: D1KAhkcbQN6aTPGNxNQsXg==
X-CSE-MsgGUID: yTTrCTIFTtujKeawOIFSkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="51669375"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Jul 2024 03:04:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQ2HT-000TbN-2Z;
	Sat, 06 Jul 2024 10:04:35 +0000
Date: Sat, 06 Jul 2024 18:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 f8d76c2c313c56d5cb894a243dff4550f048278d
Message-ID: <202407061831.i5i4JSRf-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: f8d76c2c313c56d5cb894a243dff4550f048278d  gpiolib: of: add polarity quirk for TSC2005

elapsed time: 1447m

configs tested: 234
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                      axs103_smp_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsim_700_defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240706   gcc-13.2.0
arc                   randconfig-002-20240706   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         bcm2835_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                       imx_v4_v5_defconfig   gcc-13.2.0
arm                      integrator_defconfig   gcc-13.2.0
arm                        keystone_defconfig   gcc-13.2.0
arm                       multi_v4t_defconfig   gcc-13.2.0
arm                   randconfig-001-20240706   gcc-13.2.0
arm                   randconfig-002-20240706   gcc-13.2.0
arm                   randconfig-003-20240706   gcc-13.2.0
arm                   randconfig-004-20240706   gcc-13.2.0
arm                         socfpga_defconfig   gcc-13.2.0
arm                          sp7021_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240706   gcc-13.2.0
arm64                 randconfig-002-20240706   gcc-13.2.0
arm64                 randconfig-003-20240706   gcc-13.2.0
arm64                 randconfig-004-20240706   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240706   gcc-13.2.0
csky                  randconfig-002-20240706   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240705   gcc-13
i386         buildonly-randconfig-001-20240706   clang-18
i386         buildonly-randconfig-002-20240705   gcc-9
i386         buildonly-randconfig-002-20240706   clang-18
i386         buildonly-randconfig-003-20240705   gcc-11
i386         buildonly-randconfig-003-20240706   clang-18
i386         buildonly-randconfig-004-20240705   clang-18
i386         buildonly-randconfig-004-20240706   clang-18
i386         buildonly-randconfig-005-20240705   clang-18
i386         buildonly-randconfig-005-20240706   clang-18
i386         buildonly-randconfig-006-20240705   clang-18
i386         buildonly-randconfig-006-20240706   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240705   gcc-13
i386                  randconfig-001-20240706   clang-18
i386                  randconfig-002-20240705   clang-18
i386                  randconfig-002-20240706   clang-18
i386                  randconfig-003-20240705   gcc-11
i386                  randconfig-003-20240706   clang-18
i386                  randconfig-004-20240705   gcc-13
i386                  randconfig-004-20240706   clang-18
i386                  randconfig-005-20240705   clang-18
i386                  randconfig-005-20240706   clang-18
i386                  randconfig-006-20240705   clang-18
i386                  randconfig-006-20240706   clang-18
i386                  randconfig-011-20240705   gcc-13
i386                  randconfig-011-20240706   clang-18
i386                  randconfig-012-20240705   gcc-13
i386                  randconfig-012-20240706   clang-18
i386                  randconfig-013-20240705   clang-18
i386                  randconfig-013-20240706   clang-18
i386                  randconfig-014-20240705   gcc-8
i386                  randconfig-014-20240706   clang-18
i386                  randconfig-015-20240705   gcc-10
i386                  randconfig-015-20240706   clang-18
i386                  randconfig-016-20240705   clang-18
i386                  randconfig-016-20240706   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240706   gcc-13.2.0
loongarch             randconfig-002-20240706   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                          amiga_defconfig   gcc-13.2.0
m68k                         apollo_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5475evb_defconfig   gcc-13.2.0
m68k                        stmark2_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           ci20_defconfig   gcc-13.2.0
mips                  decstation_64_defconfig   gcc-13.2.0
mips                      fuloong2e_defconfig   gcc-13.2.0
mips                           jazz_defconfig   gcc-13.2.0
mips                     loongson1b_defconfig   gcc-13.2.0
mips                      loongson3_defconfig   gcc-13.2.0
mips                          malta_defconfig   gcc-13.2.0
mips                       rbtx49xx_defconfig   gcc-13.2.0
nios2                            allmodconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                            allyesconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240706   gcc-13.2.0
nios2                 randconfig-002-20240706   gcc-13.2.0
openrisc                         allmodconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
openrisc                    or1ksim_defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240706   gcc-13.2.0
parisc                randconfig-002-20240706   gcc-13.2.0
parisc64                         alldefconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                     akebono_defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   gcc-13.2.0
powerpc                     asp8347_defconfig   gcc-13.2.0
powerpc                      bamboo_defconfig   gcc-13.2.0
powerpc                        fsp2_defconfig   gcc-13.2.0
powerpc                      mgcoge_defconfig   gcc-13.2.0
powerpc                  mpc866_ads_defconfig   gcc-13.2.0
powerpc                  mpc885_ads_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240706   gcc-13.2.0
powerpc               randconfig-002-20240706   gcc-13.2.0
powerpc                     sequoia_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240706   gcc-13.2.0
powerpc64             randconfig-002-20240706   gcc-13.2.0
powerpc64             randconfig-003-20240706   gcc-13.2.0
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv                 randconfig-001-20240706   gcc-13.2.0
riscv                 randconfig-002-20240706   gcc-13.2.0
s390                             alldefconfig   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240706   gcc-13.2.0
s390                  randconfig-002-20240706   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                ecovec24-romimage_defconfig   gcc-13.2.0
sh                         ecovec24_defconfig   gcc-13.2.0
sh                          r7785rp_defconfig   gcc-13.2.0
sh                    randconfig-001-20240706   gcc-13.2.0
sh                    randconfig-002-20240706   gcc-13.2.0
sh                          rsk7264_defconfig   gcc-13.2.0
sh                           se7343_defconfig   gcc-13.2.0
sh                           se7619_defconfig   gcc-13.2.0
sh                           se7722_defconfig   gcc-13.2.0
sh                           se7724_defconfig   gcc-13.2.0
sh                           se7751_defconfig   gcc-13.2.0
sh                     sh7710voipgw_defconfig   gcc-13.2.0
sh                        sh7785lcr_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc                            allyesconfig   gcc-13.2.0
sparc64                          allmodconfig   gcc-13.2.0
sparc64                          allyesconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240706   gcc-13.2.0
sparc64               randconfig-002-20240706   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240706   gcc-13.2.0
um                    randconfig-002-20240706   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240706   clang-18
x86_64       buildonly-randconfig-002-20240706   clang-18
x86_64       buildonly-randconfig-003-20240706   clang-18
x86_64       buildonly-randconfig-004-20240706   clang-18
x86_64       buildonly-randconfig-005-20240706   clang-18
x86_64       buildonly-randconfig-006-20240706   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                                  kexec   clang-18
x86_64                randconfig-001-20240706   clang-18
x86_64                randconfig-002-20240706   clang-18
x86_64                randconfig-003-20240706   clang-18
x86_64                randconfig-004-20240706   clang-18
x86_64                randconfig-005-20240706   clang-18
x86_64                randconfig-006-20240706   clang-18
x86_64                randconfig-011-20240706   clang-18
x86_64                randconfig-012-20240706   clang-18
x86_64                randconfig-013-20240706   clang-18
x86_64                randconfig-014-20240706   clang-18
x86_64                randconfig-015-20240706   clang-18
x86_64                randconfig-016-20240706   clang-18
x86_64                randconfig-071-20240706   clang-18
x86_64                randconfig-072-20240706   clang-18
x86_64                randconfig-073-20240706   clang-18
x86_64                randconfig-074-20240706   clang-18
x86_64                randconfig-075-20240706   clang-18
x86_64                randconfig-076-20240706   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                           allyesconfig   gcc-13.2.0
xtensa                  audio_kc705_defconfig   gcc-13.2.0
xtensa                       common_defconfig   gcc-13.2.0
xtensa                generic_kc705_defconfig   gcc-13.2.0
xtensa                  nommu_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240706   gcc-13.2.0
xtensa                randconfig-002-20240706   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

