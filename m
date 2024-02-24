Return-Path: <linux-gpio+bounces-3727-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D40B86227E
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Feb 2024 04:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C97531F25466
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Feb 2024 03:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29B813AC7;
	Sat, 24 Feb 2024 03:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUoN7BQ1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70D613AC9
	for <linux-gpio@vger.kernel.org>; Sat, 24 Feb 2024 03:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708744813; cv=none; b=IbdNwc3PMp1KvqabWi0xw8/AyQCpBIL9wHVqaXJ3qzRsdQUDXIPts8wP5HPZyxgBLCOJrzNcKOn0Mce+Ul1Ky74Y9onMp7wqAuNS0vV1vBIZkPFiwOq0nez5j9PVCpIH8v+1+7lZ2LEDZJrLFLC4Slwye/m6qnxlq0SVPiYJm4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708744813; c=relaxed/simple;
	bh=CYx62+TkxZ/lqCVySR+CKKzp+f6pHnRL/Luzbf94r7E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KCJWc9C9qbv2wbnOrOCz5rzt3rpbpJm2A2+nUJAzk/CMf5qGBW11U/eweV+xcRSKyDGalqm32LsCNT9JBRB+WGjZxGdK68b46EJ9FotzfCHmKrvn01gUjNRdyPSSpImaiqYtpZIPGCZWoNgFt4SSao5t9qtKLkVkUMNSShRh3bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUoN7BQ1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708744811; x=1740280811;
  h=date:from:to:cc:subject:message-id;
  bh=CYx62+TkxZ/lqCVySR+CKKzp+f6pHnRL/Luzbf94r7E=;
  b=JUoN7BQ1k6s0Ne2RuL4WmwfQNxOjv2QPWxUvd8DD8XtsPmFXNn308ikO
   Az++aFje/YfszU5ywSp8KkRDfhqwyEZp16JLFJLUHXLqTgQwjpxEEHwdk
   XlYSwOrCz2LYcSZxZk0uAIIkXdAp0XxYP0OEz86pUow+PNynBxj5enP3h
   M3gzVLVvV+lJ2qYAKnjpKZB7KSMQOLzeNBjif1+X6rtMUdzkJjErl53HX
   m5tiam5CjDLytPBP0dF6EWnyY/eSivfJRRdHDX+Pj49Ro8CYx5liONAbU
   zswaPZxspqM32RiNPeN2vhNGSqXGMwg3d3TVvuzCrZmPPpiB2rbOaa6FV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2967355"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="2967355"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 19:20:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6083576"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Feb 2024 19:20:09 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdiZw-00089W-15;
	Sat, 24 Feb 2024 03:20:01 +0000
Date: Sat, 24 Feb 2024 11:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD REGRESSION
 7bb5f3a7ca8856c5c1fa26a6e3f58a1254019dc0
Message-ID: <202402241136.CNZTebQf-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 7bb5f3a7ca8856c5c1fa26a6e3f58a1254019dc0  gpio: sim: use for_each_hwgpio()

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202402232058.4eDf4GRs-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpio/gpio-mmio.c:100: undefined reference to `ioread64'
drivers/gpio/gpio-mmio.c:127: undefined reference to `iowrite64be'
drivers/gpio/gpio-mmio.c:132: undefined reference to `ioread64be'
drivers/gpio/gpio-mmio.c:95: undefined reference to `iowrite64'
gpio-mmio.c:(.text+0x12e1): undefined reference to `iowrite64'
gpio-mmio.c:(.text+0x131d): undefined reference to `ioread64'
gpio-mmio.c:(.text+0x1361): undefined reference to `iowrite64be'
gpio-mmio.c:(.text+0x139d): undefined reference to `ioread64be'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- (.text):undefined-reference-to-ioread64be
|   |-- (.text):undefined-reference-to-iowrite64be
|   |-- alpha-linux-ld:(.text):undefined-reference-to-ioread64be
|   `-- alpha-linux-ld:(.text):undefined-reference-to-iowrite64be
|-- powerpc64-randconfig-001-20240224
|   |-- gpio-mmio.c:(.text):undefined-reference-to-ioread64
|   |-- gpio-mmio.c:(.text):undefined-reference-to-ioread64be
|   |-- gpio-mmio.c:(.text):undefined-reference-to-iowrite64
|   `-- gpio-mmio.c:(.text):undefined-reference-to-iowrite64be
|-- powerpc64-randconfig-003-20240224
|   |-- gpio-mmio.c:(.text):undefined-reference-to-ioread64
|   |-- gpio-mmio.c:(.text):undefined-reference-to-ioread64be
|   |-- gpio-mmio.c:(.text):undefined-reference-to-iowrite64
|   `-- gpio-mmio.c:(.text):undefined-reference-to-iowrite64be
|-- um-allyesconfig
|   |-- gpio-mmio.c:(.text):undefined-reference-to-ioread64
|   |-- gpio-mmio.c:(.text):undefined-reference-to-ioread64be
|   |-- gpio-mmio.c:(.text):undefined-reference-to-iowrite64
|   `-- gpio-mmio.c:(.text):undefined-reference-to-iowrite64be
`-- x86_64-randconfig-001-20240223
    |-- drivers-gpio-gpio-mmio.c:undefined-reference-to-ioread64
    |-- drivers-gpio-gpio-mmio.c:undefined-reference-to-ioread64be
    |-- drivers-gpio-gpio-mmio.c:undefined-reference-to-iowrite64
    `-- drivers-gpio-gpio-mmio.c:undefined-reference-to-iowrite64be

elapsed time: 1078m

configs tested: 143
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240224   gcc  
arc                   randconfig-002-20240224   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240224   gcc  
arm                   randconfig-002-20240224   gcc  
arm                   randconfig-003-20240224   gcc  
arm                   randconfig-004-20240224   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240224   gcc  
arm64                 randconfig-002-20240224   gcc  
arm64                 randconfig-003-20240224   clang
arm64                 randconfig-004-20240224   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240224   gcc  
csky                  randconfig-002-20240224   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240224   clang
hexagon               randconfig-002-20240224   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240224   gcc  
i386         buildonly-randconfig-002-20240224   clang
i386         buildonly-randconfig-003-20240224   gcc  
i386         buildonly-randconfig-004-20240224   gcc  
i386         buildonly-randconfig-005-20240224   clang
i386         buildonly-randconfig-006-20240224   clang
i386                                defconfig   clang
i386                  randconfig-001-20240224   gcc  
i386                  randconfig-002-20240224   clang
i386                  randconfig-003-20240224   clang
i386                  randconfig-004-20240224   gcc  
i386                  randconfig-005-20240224   gcc  
i386                  randconfig-006-20240224   gcc  
i386                  randconfig-011-20240224   gcc  
i386                  randconfig-012-20240224   gcc  
i386                  randconfig-013-20240224   clang
i386                  randconfig-014-20240224   clang
i386                  randconfig-015-20240224   clang
i386                  randconfig-016-20240224   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240224   gcc  
loongarch             randconfig-002-20240224   gcc  
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
nios2                 randconfig-001-20240224   gcc  
nios2                 randconfig-002-20240224   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240224   gcc  
parisc                randconfig-002-20240224   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240224   clang
powerpc               randconfig-002-20240224   clang
powerpc               randconfig-003-20240224   clang
powerpc64             randconfig-001-20240224   gcc  
powerpc64             randconfig-002-20240224   clang
powerpc64             randconfig-003-20240224   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240224   gcc  
riscv                 randconfig-002-20240224   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240224   gcc  
s390                  randconfig-002-20240224   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240224   gcc  
sh                    randconfig-002-20240224   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240224   gcc  
sparc64               randconfig-002-20240224   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240224   gcc  
um                    randconfig-002-20240224   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240224   clang
x86_64       buildonly-randconfig-002-20240224   clang
x86_64       buildonly-randconfig-003-20240224   clang
x86_64       buildonly-randconfig-004-20240224   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240224   gcc  
xtensa                randconfig-002-20240224   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

