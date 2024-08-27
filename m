Return-Path: <linux-gpio+bounces-9209-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 792BA960731
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 12:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0913A1F27067
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 10:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB7E1A0704;
	Tue, 27 Aug 2024 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqrGDAb2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A7D1A00D0
	for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753599; cv=none; b=BGccNZbquz7wOyr1TiUxuqJ+4zqQAXW4kLg+xGAw03skJIynDQZJ6wcndQNTITLaHIOGx1vWh+THvb7taMQsAeVc1q9DdC5oJhI7UUZwZF5B9XtzRkKoVMWmX2vbya/59cQxrL7iooHJCpiIopyScTuYyBOWmgnJTGim5/WvEgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753599; c=relaxed/simple;
	bh=FdajFHUT76LYZBk99B5N5SPUL5DMyNsYd1XbqbAM2V8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rRLzlpkVbBrDiwHYFLMTW8tUZOfrM0HxMNbTPxW8Qgn3QiTSoMmkmc6kirf6fo5eI1VP5+QD6NwbvIJtzZMJ4oHIG+RGo3zTmcnHZrAdfVssm1EHG1ov3BSzfg3cYyWhmoDA/RgMky+AB12OCsOmR4Gin9Z93iDMW4KboJpTHyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqrGDAb2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724753596; x=1756289596;
  h=date:from:to:cc:subject:message-id;
  bh=FdajFHUT76LYZBk99B5N5SPUL5DMyNsYd1XbqbAM2V8=;
  b=hqrGDAb24xvoOwEIDlJD8bRXQZ4s5qeTTVi4HMnkfAnDSreb7DYWE0xi
   YnCxvF19Esc3weO5OWWkh6G3hVYFwTaP0Lri0obxcUPo358/6/6AsPniR
   4Csg7vKf0zdlikhldCvgFlnb15ubEhb8jh2PRxK+0jiLJdytaXGyzPQU0
   ulXwPZrjcaeWdRn/wDwmh6CQpxQAXatqUXuTFuBv7FXK74fXMN7ebzbhz
   1p0i+GCtbt5/y/mX3Evv0yAUnCyJrYPi2+ZYL5bV2ykyAx2Dfrs/lMakH
   Dn/p7SeKbECkWg1OxY8AeKzD+ymyCSrLQBK52Z5olehragzv22FA5h2/U
   g==;
X-CSE-ConnectionGUID: 8XeIjipsQa2qmwIVvNWzNg==
X-CSE-MsgGUID: w90UCrAqRkGCMU2fyd2GqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="27018248"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="27018248"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 03:13:16 -0700
X-CSE-ConnectionGUID: wArjEvOBTDmhPK9dg5vNWQ==
X-CSE-MsgGUID: rLhFjxVDSemOBg3y7jxpTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="67644067"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Aug 2024 03:13:15 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sitCK-000IV6-1i;
	Tue, 27 Aug 2024 10:13:12 +0000
Date: Tue, 27 Aug 2024 18:12:18 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:ib-sophgo-pintrl] BUILD REGRESSION
 e7a4141f4420879720f9d2c99974e269044c7597
Message-ID: <202408271814.hLhK0nJV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-sophgo-pintrl
branch HEAD: e7a4141f4420879720f9d2c99974e269044c7597  pinctrl: sophgo: add support for SG2002 SoC

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202408270140.L6Hm1sNo-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202408270540.4jPYshgO-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/pinctrl/sophgo/pinctrl-cv18xx.c:544:14: error: 'PIN_CONFIG_INPUT_SCHMITT_UV' undeclared (first use in this function); did you mean 'PIN_CONFIG_INPUT_SCHMITT'?
drivers/pinctrl/sophgo/pinctrl-cv18xx.c:544:7: error: use of undeclared identifier 'PIN_CONFIG_INPUT_SCHMITT_UV'; did you mean 'PIN_CONFIG_INPUT_SCHMITT'?

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:PIN_CONFIG_INPUT_SCHMITT_UV-undeclared-(first-use-in-this-function)
|-- arc-allmodconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:PIN_CONFIG_INPUT_SCHMITT_UV-undeclared-(first-use-in-this-function)
|-- arc-allyesconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:PIN_CONFIG_INPUT_SCHMITT_UV-undeclared-(first-use-in-this-function)
|-- arm-allmodconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:PIN_CONFIG_INPUT_SCHMITT_UV-undeclared-(first-use-in-this-function)
|-- arm-allyesconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:PIN_CONFIG_INPUT_SCHMITT_UV-undeclared-(first-use-in-this-function)
|-- arm64-allmodconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:use-of-undeclared-identifier-PIN_CONFIG_INPUT_SCHMITT_UV
|-- hexagon-allmodconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:use-of-undeclared-identifier-PIN_CONFIG_INPUT_SCHMITT_UV
|-- hexagon-allyesconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:use-of-undeclared-identifier-PIN_CONFIG_INPUT_SCHMITT_UV
|-- i386-allmodconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:PIN_CONFIG_INPUT_SCHMITT_UV-undeclared-(first-use-in-this-function)
|-- i386-allyesconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:PIN_CONFIG_INPUT_SCHMITT_UV-undeclared-(first-use-in-this-function)
|-- m68k-allmodconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:PIN_CONFIG_INPUT_SCHMITT_UV-undeclared-(first-use-in-this-function)
|-- microblaze-allmodconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:PIN_CONFIG_INPUT_SCHMITT_UV-undeclared-(first-use-in-this-function)
|-- microblaze-allyesconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:PIN_CONFIG_INPUT_SCHMITT_UV-undeclared-(first-use-in-this-function)
|-- openrisc-allyesconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:PIN_CONFIG_INPUT_SCHMITT_UV-undeclared-(first-use-in-this-function)
|-- parisc-allmodconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:PIN_CONFIG_INPUT_SCHMITT_UV-undeclared-(first-use-in-this-function)
|-- parisc-allyesconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:PIN_CONFIG_INPUT_SCHMITT_UV-undeclared-(first-use-in-this-function)
|-- powerpc-allmodconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:PIN_CONFIG_INPUT_SCHMITT_UV-undeclared-(first-use-in-this-function)
|-- s390-allmodconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:use-of-undeclared-identifier-PIN_CONFIG_INPUT_SCHMITT_UV
|-- sh-allmodconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:PIN_CONFIG_INPUT_SCHMITT_UV-undeclared-(first-use-in-this-function)
|-- sparc-allmodconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:PIN_CONFIG_INPUT_SCHMITT_UV-undeclared-(first-use-in-this-function)
|-- um-allmodconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:use-of-undeclared-identifier-PIN_CONFIG_INPUT_SCHMITT_UV
|-- um-allyesconfig
|   `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:PIN_CONFIG_INPUT_SCHMITT_UV-undeclared-(first-use-in-this-function)
`-- xtensa-allyesconfig
    `-- drivers-pinctrl-sophgo-pinctrl-cv18xx.c:error:PIN_CONFIG_INPUT_SCHMITT_UV-undeclared-(first-use-in-this-function)

elapsed time: 1468m

configs tested: 201
configs skipped: 5

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240827   gcc-13.2.0
arc                   randconfig-002-20240827   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                      footbridge_defconfig   clang-20
arm                         nhk8815_defconfig   clang-20
arm                           omap1_defconfig   clang-20
arm                   randconfig-001-20240827   clang-20
arm                   randconfig-001-20240827   gcc-13.2.0
arm                   randconfig-002-20240827   gcc-13.2.0
arm                   randconfig-002-20240827   gcc-14.1.0
arm                   randconfig-003-20240827   clang-20
arm                   randconfig-003-20240827   gcc-13.2.0
arm                   randconfig-004-20240827   gcc-13.2.0
arm                   randconfig-004-20240827   gcc-14.1.0
arm                         s5pv210_defconfig   clang-20
arm                          sp7021_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240827   gcc-13.2.0
arm64                 randconfig-001-20240827   gcc-14.1.0
arm64                 randconfig-002-20240827   clang-14
arm64                 randconfig-002-20240827   gcc-13.2.0
arm64                 randconfig-003-20240827   clang-14
arm64                 randconfig-003-20240827   gcc-13.2.0
arm64                 randconfig-004-20240827   clang-20
arm64                 randconfig-004-20240827   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240827   gcc-13.2.0
csky                  randconfig-001-20240827   gcc-14.1.0
csky                  randconfig-002-20240827   gcc-13.2.0
csky                  randconfig-002-20240827   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-002-20240827   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240827   gcc-12
i386         buildonly-randconfig-002-20240827   clang-18
i386         buildonly-randconfig-002-20240827   gcc-12
i386         buildonly-randconfig-003-20240827   gcc-12
i386         buildonly-randconfig-004-20240827   clang-18
i386         buildonly-randconfig-004-20240827   gcc-12
i386         buildonly-randconfig-005-20240827   clang-18
i386         buildonly-randconfig-005-20240827   gcc-12
i386         buildonly-randconfig-006-20240827   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240827   gcc-12
i386                  randconfig-002-20240827   gcc-12
i386                  randconfig-003-20240827   gcc-12
i386                  randconfig-004-20240827   gcc-12
i386                  randconfig-005-20240827   gcc-12
i386                  randconfig-006-20240827   clang-18
i386                  randconfig-006-20240827   gcc-12
i386                  randconfig-011-20240827   clang-18
i386                  randconfig-011-20240827   gcc-12
i386                  randconfig-012-20240827   clang-18
i386                  randconfig-012-20240827   gcc-12
i386                  randconfig-013-20240827   clang-18
i386                  randconfig-013-20240827   gcc-12
i386                  randconfig-014-20240827   gcc-12
i386                  randconfig-015-20240827   gcc-12
i386                  randconfig-016-20240827   clang-18
i386                  randconfig-016-20240827   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240827   gcc-13.2.0
loongarch             randconfig-001-20240827   gcc-14.1.0
loongarch             randconfig-002-20240827   gcc-13.2.0
loongarch             randconfig-002-20240827   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                           ci20_defconfig   clang-20
mips                  maltasmvp_eva_defconfig   clang-20
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240827   gcc-13.2.0
nios2                 randconfig-001-20240827   gcc-14.1.0
nios2                 randconfig-002-20240827   gcc-13.2.0
nios2                 randconfig-002-20240827   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240827   gcc-13.2.0
parisc                randconfig-001-20240827   gcc-14.1.0
parisc                randconfig-002-20240827   gcc-13.2.0
parisc                randconfig-002-20240827   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                        cell_defconfig   clang-20
powerpc                        icon_defconfig   clang-20
powerpc               randconfig-001-20240827   gcc-13.2.0
powerpc               randconfig-002-20240827   gcc-13.2.0
powerpc               randconfig-003-20240827   gcc-13.2.0
powerpc                     sequoia_defconfig   clang-20
powerpc64             randconfig-001-20240827   gcc-13.2.0
powerpc64             randconfig-002-20240827   gcc-13.2.0
powerpc64             randconfig-003-20240827   gcc-13.2.0
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240827   gcc-13.2.0
riscv                 randconfig-002-20240827   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240827   gcc-13.2.0
s390                  randconfig-002-20240827   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240827   gcc-13.2.0
sh                    randconfig-002-20240827   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240827   gcc-13.2.0
sparc64               randconfig-002-20240827   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240827   gcc-13.2.0
um                    randconfig-002-20240827   gcc-13.2.0
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240827   clang-18
x86_64       buildonly-randconfig-002-20240827   clang-18
x86_64       buildonly-randconfig-003-20240827   clang-18
x86_64       buildonly-randconfig-004-20240827   clang-18
x86_64       buildonly-randconfig-005-20240827   clang-18
x86_64       buildonly-randconfig-006-20240827   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240827   clang-18
x86_64                randconfig-002-20240827   clang-18
x86_64                randconfig-003-20240827   clang-18
x86_64                randconfig-004-20240827   clang-18
x86_64                randconfig-005-20240827   clang-18
x86_64                randconfig-006-20240827   clang-18
x86_64                randconfig-011-20240827   clang-18
x86_64                randconfig-012-20240827   clang-18
x86_64                randconfig-013-20240827   clang-18
x86_64                randconfig-014-20240827   clang-18
x86_64                randconfig-015-20240827   clang-18
x86_64                randconfig-016-20240827   clang-18
x86_64                randconfig-071-20240827   clang-18
x86_64                randconfig-072-20240827   clang-18
x86_64                randconfig-073-20240827   clang-18
x86_64                randconfig-074-20240827   clang-18
x86_64                randconfig-075-20240827   clang-18
x86_64                randconfig-076-20240827   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240827   gcc-13.2.0
xtensa                randconfig-002-20240827   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

