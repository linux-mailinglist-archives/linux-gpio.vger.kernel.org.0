Return-Path: <linux-gpio+bounces-8154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C89592CBA9
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 09:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22B592826EA
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 07:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70D281AC3;
	Wed, 10 Jul 2024 07:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2v/Hfbj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DAE7E799
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 07:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720595421; cv=none; b=AMRM6hEfFsAdeDeYU7kS9GaooOKGJnyAo28nAPOI2BxWfyy3/x9kFzakhe/cM1c3RwAJMyXFBkWxQ8WGm/vmxP+TCcUgw9rqfp1nLBJaXAmpxH41OuGpEik8oG+HzUnLKRlLncAN5wk/ogFNpgzw9RJcm+JHWW/QOTXj6xf5Rhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720595421; c=relaxed/simple;
	bh=vpXy+gQnWCDGfww3iEIB/CFaa4Q7lvDmSVHyk3jlytg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BLpcv0/zyw25e/MFUnnxwkYIhJY0eagMJGChA0N4Yo1pS1a3e0YQ0Ymc24Bxmtheydc8DXaSJqcDdi5VCCFfg1ksUXD08WAzJoAGL6hLHxx/g+pGyEtAHnhYCh1joS/AnjFXMT+v8knhvRkB872HeE+1QWHjDHfDMFd1v5Y44B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2v/Hfbj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720595420; x=1752131420;
  h=date:from:to:cc:subject:message-id;
  bh=vpXy+gQnWCDGfww3iEIB/CFaa4Q7lvDmSVHyk3jlytg=;
  b=N2v/HfbjXz5ir5CrAnB9bXwbajHISP62aKuz7zGGhKlQ7qWhyHw5Lna1
   KOQ+HG45MzSW0Bqb7FCwjc2GCLdtdy62BoW1wIfvjQQgU6rw4H1YtjBlJ
   3zgaYhrDo1PTLTyZB9RtsVMWEY/Bh0eO0RWTiS4o+a7FRRWyAOK2MDm2E
   8bTJ9T85Zjru0MTAUlSGz96IGfp1xWgxf/3lGrbDzlEDnymIw1nE4X1Jh
   VG1po7HOuoaQsmCndgG7tn05SSMl/0B6ENWpdf5WLN8pzR7mfcY1MfwBN
   zHpLWAKkVrzrQZjTXosz9+NHs4fqqLFt809lEWlN1ar7XFT7tpsT6N6Ok
   Q==;
X-CSE-ConnectionGUID: QUFbIVX1QB+a/NGD4iyXvA==
X-CSE-MsgGUID: gCGJReWwTQiNMcVvE4EajQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="35328145"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="35328145"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 00:10:19 -0700
X-CSE-ConnectionGUID: FbfF1aq7QRqFCGROTluJwQ==
X-CSE-MsgGUID: aZT0bkOnQ3qrC261q/29RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="48209047"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jul 2024 00:10:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRRSx-000XaC-1k;
	Wed, 10 Jul 2024 07:10:15 +0000
Date: Wed, 10 Jul 2024 15:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS WITH WARNING
 337049890b8cbbb4fb527c58976ea19f4dc747a0
Message-ID: <202407101529.74XMAAWa-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 337049890b8cbbb4fb527c58976ea19f4dc747a0  dt-bindings: gpio: convert Atmel GPIO to json-schema

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202407092245.BPnW2mr6-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/gpio/gpio-virtuser.c:400:24: warning: variable 'trimmed' set but not used [-Wunused-but-set-variable]

Unverified Warning (likely false positive, please contact us if interested):

arch/powerpc/boot/dts/mpc8308_p1m.dtb: gpio@c00: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/mpc8308rdb.dtb: gpio@c00: 'device_type' does not match any of the regexes: 'pinctrl-[0-9]+'
arch/powerpc/boot/dts/mpc8308rdb.dtb: gpio@c00: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/mpc8377_rdb.dtb: gpio-controller@c00: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/mpc8377_rdb.dtb: gpio-controller@d00: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/mpc8377_wlan.dtb: gpio-controller@c00: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/mpc8377_wlan.dtb: gpio-controller@d00: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/mpc8378_rdb.dtb: gpio-controller@c00: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/mpc8378_rdb.dtb: gpio-controller@d00: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/mpc8379_rdb.dtb: gpio-controller@c00: compatible: 'oneOf' conditional failed, one must be fixed:
arch/powerpc/boot/dts/mpc8379_rdb.dtb: gpio-controller@d00: compatible: 'oneOf' conditional failed, one must be fixed:

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allmodconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- alpha-allyesconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- arc-allmodconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- arc-allyesconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- arm-allmodconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- arm-allyesconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- arm64-allmodconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- hexagon-allmodconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- hexagon-allyesconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- i386-allmodconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- i386-allyesconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- loongarch-allmodconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- m68k-allmodconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- m68k-allyesconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- microblaze-allmodconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- microblaze-allyesconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- mips-allmodconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- mips-allyesconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- openrisc-allyesconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- parisc-allmodconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- parisc-allyesconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- powerpc-allmodconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- powerpc-allyesconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- powerpc-randconfig-051-20240708
|   |-- arch-powerpc-boot-dts-mpc8308_p1m.dtb:gpio-c00:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-powerpc-boot-dts-mpc8308rdb.dtb:gpio-c00:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-powerpc-boot-dts-mpc8308rdb.dtb:gpio-c00:device_type-does-not-match-any-of-the-regexes:pinctrl
|   |-- arch-powerpc-boot-dts-mpc8377_rdb.dtb:gpio-controller-c00:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-powerpc-boot-dts-mpc8377_rdb.dtb:gpio-controller-d00:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-powerpc-boot-dts-mpc8377_wlan.dtb:gpio-controller-c00:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-powerpc-boot-dts-mpc8377_wlan.dtb:gpio-controller-d00:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-powerpc-boot-dts-mpc8378_rdb.dtb:gpio-controller-c00:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-powerpc-boot-dts-mpc8378_rdb.dtb:gpio-controller-d00:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-powerpc-boot-dts-mpc8379_rdb.dtb:gpio-controller-c00:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   `-- arch-powerpc-boot-dts-mpc8379_rdb.dtb:gpio-controller-d00:compatible:oneOf-conditional-failed-one-must-be-fixed:
|-- riscv-allmodconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- riscv-allyesconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- s390-allmodconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- s390-allyesconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- sh-allmodconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- sh-allyesconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- sparc-allmodconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- sparc-allyesconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- um-allmodconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
|-- um-allyesconfig
|   `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used
`-- x86_64-allyesconfig
    `-- drivers-gpio-gpio-virtuser.c:warning:variable-trimmed-set-but-not-used

elapsed time: 1117m

configs tested: 149
configs skipped: 1

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240710   gcc-13.2.0
arc                   randconfig-002-20240710   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-13.2.0
arm                            hisi_defconfig   gcc-13.2.0
arm                          ixp4xx_defconfig   gcc-13.2.0
arm                          pxa910_defconfig   gcc-13.2.0
arm                   randconfig-001-20240710   clang-19
arm                   randconfig-002-20240710   gcc-13.2.0
arm                   randconfig-003-20240710   clang-19
arm                   randconfig-004-20240710   gcc-13.2.0
arm                        realview_defconfig   clang-19
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240710   clang-19
arm64                 randconfig-002-20240710   clang-19
arm64                 randconfig-003-20240710   clang-17
arm64                 randconfig-004-20240710   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240710   gcc-13.2.0
csky                  randconfig-002-20240710   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240710   clang-19
hexagon               randconfig-002-20240710   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240710   clang-18
i386         buildonly-randconfig-002-20240710   gcc-13
i386         buildonly-randconfig-003-20240710   gcc-11
i386         buildonly-randconfig-004-20240710   gcc-11
i386         buildonly-randconfig-005-20240710   clang-18
i386         buildonly-randconfig-006-20240710   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240710   clang-18
i386                  randconfig-002-20240710   gcc-11
i386                  randconfig-003-20240710   gcc-13
i386                  randconfig-004-20240710   clang-18
i386                  randconfig-005-20240710   clang-18
i386                  randconfig-006-20240710   clang-18
i386                  randconfig-011-20240710   gcc-13
i386                  randconfig-012-20240710   gcc-12
i386                  randconfig-013-20240710   gcc-12
i386                  randconfig-014-20240710   gcc-13
i386                  randconfig-015-20240710   gcc-8
i386                  randconfig-016-20240710   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240710   gcc-13.2.0
loongarch             randconfig-002-20240710   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                       m5249evb_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240710   gcc-13.2.0
nios2                 randconfig-002-20240710   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                randconfig-001-20240710   gcc-13.2.0
parisc                randconfig-002-20240710   gcc-13.2.0
parisc64                         alldefconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
powerpc                      katmai_defconfig   clang-19
powerpc               randconfig-001-20240710   gcc-13.2.0
powerpc               randconfig-002-20240710   clang-19
powerpc               randconfig-003-20240710   gcc-13.2.0
powerpc                     tqm8548_defconfig   clang-19
powerpc64             randconfig-001-20240710   gcc-13.2.0
powerpc64             randconfig-002-20240710   clang-15
powerpc64             randconfig-003-20240710   clang-19
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   clang-19
riscv                    nommu_virt_defconfig   clang-19
riscv                 randconfig-001-20240710   clang-19
riscv                 randconfig-002-20240710   clang-19
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                  randconfig-001-20240710   gcc-13.2.0
s390                  randconfig-002-20240710   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                        dreamcast_defconfig   gcc-13.3.0
sh                        edosk7705_defconfig   gcc-13.3.0
sh                    randconfig-001-20240710   gcc-13.2.0
sh                    randconfig-002-20240710   gcc-13.2.0
sh                          rsk7264_defconfig   gcc-13.3.0
sh                           se7780_defconfig   gcc-13.3.0
sh                            titan_defconfig   gcc-13.3.0
sparc                            allmodconfig   gcc-13.2.0
sparc64               randconfig-001-20240710   gcc-13.2.0
sparc64               randconfig-002-20240710   gcc-13.2.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                    randconfig-001-20240710   gcc-13
um                    randconfig-002-20240710   clang-19
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240710   clang-18
x86_64       buildonly-randconfig-002-20240710   clang-18
x86_64       buildonly-randconfig-003-20240710   clang-18
x86_64       buildonly-randconfig-004-20240710   clang-18
x86_64       buildonly-randconfig-005-20240710   gcc-13
x86_64       buildonly-randconfig-006-20240710   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240710   gcc-13
x86_64                randconfig-002-20240710   clang-18
x86_64                randconfig-003-20240710   gcc-12
x86_64                randconfig-004-20240710   clang-18
x86_64                randconfig-005-20240710   clang-18
x86_64                randconfig-006-20240710   gcc-13
x86_64                randconfig-011-20240710   clang-18
x86_64                randconfig-012-20240710   clang-18
x86_64                randconfig-013-20240710   clang-18
x86_64                randconfig-014-20240710   clang-18
x86_64                randconfig-015-20240710   clang-18
x86_64                randconfig-016-20240710   gcc-13
x86_64                randconfig-071-20240710   gcc-13
x86_64                randconfig-072-20240710   clang-18
x86_64                randconfig-073-20240710   clang-18
x86_64                randconfig-074-20240710   gcc-7
x86_64                randconfig-075-20240710   clang-18
x86_64                randconfig-076-20240710   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240710   gcc-13.2.0
xtensa                randconfig-002-20240710   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

