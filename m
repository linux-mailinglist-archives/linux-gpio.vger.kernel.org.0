Return-Path: <linux-gpio+bounces-3276-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E10FD85479A
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 11:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11D2E1C2746A
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Feb 2024 10:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32DEF18AEE;
	Wed, 14 Feb 2024 10:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQXsoZJ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5336199A7
	for <linux-gpio@vger.kernel.org>; Wed, 14 Feb 2024 10:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707908153; cv=none; b=Phzs93SzbCFG2IwLtU+B7aM20PxvjYSmJoYtzhd9tfKWA8FjVsSWIXHbnsglpPfN2h19Hw+OAk14q+iuiroxHFJ7ghLWr89Vhb//dWZQ7oi6XU4hOXibzALYIAFMKK/yfo2Fn5lnwshAWbp6xmZM8mX6vClvd6gf4uHegqtp5kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707908153; c=relaxed/simple;
	bh=7owfjwNaoMM4H1w+/FDmhz4feTVPq0ofum49P014E60=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hubpk63Hthjrae1o7W1s2YV+kuC+Uqx+UY3Wbi/zqx8U5xiOgfQkLHDUCr2SUTCLUIHnUksNO3MNZYkM99e/S6/eH6jsTjsQMRc3Ju9egER8xjMHxCnrRvEG+Ux3i6wb2LJ+2qh+vPwI9ZXZXw/uCkmhToXcmzbWxjip2hfgViQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQXsoZJ2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707908151; x=1739444151;
  h=date:from:to:cc:subject:message-id;
  bh=7owfjwNaoMM4H1w+/FDmhz4feTVPq0ofum49P014E60=;
  b=YQXsoZJ2/2MFvWbb8OPRAl7a9p0kagOqHIXI2uR4tnCLzvlhg4xwbe8f
   heMaRGRevz9JORegtdLN11m4Xa18E9Yb1WxHjm/D18DOfcoG3pwPQK/Sa
   DDT8p1OleVPolOB1eRJCaOBpFGY5crl/iE5AeIjlixZiUkKV2wJdFJXp4
   QaAtTz1NG5fiXjPfpVN5cSKCN7YopWe0W0PHJEWTGN7ffJH3WCrPB9qGG
   HJbmm5O7Nd/xUIwXM/dkz88Q8ecIIVAx6w9LzprzEkIMnIkYuVULdP8kW
   GtkZ2ErNxLfqVXA+XPo41xc6iqwKyKB8iHtWFF+OYMQw3/RaL5lY7oW7s
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13334990"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="13334990"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 02:55:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3476737"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Feb 2024 02:55:49 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raCvZ-0008h3-3C;
	Wed, 14 Feb 2024 10:55:45 +0000
Date: Wed, 14 Feb 2024 18:54:49 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/driver-h-stubs] BUILD SUCCESS
 2df8aa3cad407044f2febdbbdf220c6dae839c79
Message-ID: <202402141847.wNKk8roq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/driver-h-stubs
branch HEAD: 2df8aa3cad407044f2febdbbdf220c6dae839c79  gpiolib: add gpio_device_get_label() stub for !GPIOLIB

elapsed time: 1452m

configs tested: 244
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
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240213   gcc  
arc                   randconfig-001-20240214   gcc  
arc                   randconfig-002-20240213   gcc  
arc                   randconfig-002-20240214   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                   randconfig-001-20240213   gcc  
arm                   randconfig-001-20240214   clang
arm                   randconfig-002-20240213   gcc  
arm                   randconfig-002-20240214   gcc  
arm                   randconfig-003-20240213   gcc  
arm                   randconfig-003-20240214   clang
arm                   randconfig-004-20240213   clang
arm                   randconfig-004-20240214   clang
arm                    vt8500_v6_v7_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240213   gcc  
arm64                 randconfig-001-20240214   clang
arm64                 randconfig-002-20240213   gcc  
arm64                 randconfig-002-20240214   clang
arm64                 randconfig-003-20240213   gcc  
arm64                 randconfig-003-20240214   gcc  
arm64                 randconfig-004-20240213   gcc  
arm64                 randconfig-004-20240214   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240213   gcc  
csky                  randconfig-001-20240214   gcc  
csky                  randconfig-002-20240213   gcc  
csky                  randconfig-002-20240214   gcc  
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
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240213   gcc  
loongarch             randconfig-001-20240214   gcc  
loongarch             randconfig-002-20240213   gcc  
loongarch             randconfig-002-20240214   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                      pic32mzda_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240213   gcc  
nios2                 randconfig-001-20240214   gcc  
nios2                 randconfig-002-20240213   gcc  
nios2                 randconfig-002-20240214   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240213   gcc  
parisc                randconfig-001-20240214   gcc  
parisc                randconfig-002-20240213   gcc  
parisc                randconfig-002-20240214   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        icon_defconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20240213   clang
powerpc               randconfig-001-20240214   clang
powerpc               randconfig-002-20240213   gcc  
powerpc               randconfig-002-20240214   clang
powerpc               randconfig-003-20240213   gcc  
powerpc               randconfig-003-20240214   clang
powerpc                     tqm8560_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
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
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240213   gcc  
s390                  randconfig-001-20240214   clang
s390                  randconfig-002-20240213   clang
s390                  randconfig-002-20240214   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                    randconfig-001-20240213   gcc  
sh                    randconfig-001-20240214   gcc  
sh                    randconfig-002-20240213   gcc  
sh                    randconfig-002-20240214   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          alldefconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240213   gcc  
sparc64               randconfig-001-20240214   gcc  
sparc64               randconfig-002-20240213   gcc  
sparc64               randconfig-002-20240214   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240213   clang
um                    randconfig-001-20240214   clang
um                    randconfig-002-20240213   gcc  
um                    randconfig-002-20240214   gcc  
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
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240213   gcc  
xtensa                randconfig-001-20240214   gcc  
xtensa                randconfig-002-20240213   gcc  
xtensa                randconfig-002-20240214   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

