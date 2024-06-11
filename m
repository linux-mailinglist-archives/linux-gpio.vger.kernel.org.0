Return-Path: <linux-gpio+bounces-7344-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D28F790369E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 10:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55F5628CBAF
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 08:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67D5174EEB;
	Tue, 11 Jun 2024 08:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fie7M9io"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC6F171E64
	for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 08:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718094909; cv=none; b=ZOav+21p3I7LaAvWS7UFlZ1e9Y/aa1azuUjdlR5JaB24sYVCOEfJy1D2ukbTwEEV461CEeJAw+pwI6zvhc/1zxRU2Kb4k5AGknnkFCSS7xzfSlZlIHP583+CfVNWtvqCS7maEw5PnIrAw26kGURZTlvKLE/dsj8Q0p/XizYlW9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718094909; c=relaxed/simple;
	bh=JTJ+qYfmBrp0LhBV5g9wturG1gPsoi9uitay5oAsDSE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RcyyzBdxw0EmTM4wO9ESGxGdabhz0PY5MTkX1cIyw/IdtmYCexYQa8YkGgXvTmn6TBfKZM58QqgvaBmtNLujsrK9QceUEqYsWXhknk6dECjFhDiCBkq6t5emlEbvv4OgATgasHKE3mntMhm9HVhT3ARajjQoPHKe9YA8B0anW3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fie7M9io; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718094908; x=1749630908;
  h=date:from:to:cc:subject:message-id;
  bh=JTJ+qYfmBrp0LhBV5g9wturG1gPsoi9uitay5oAsDSE=;
  b=fie7M9ioP6XHh6qSbOv2nFjHWoOrbenTAtuq59mdf6BFCJJJ+u5tH90P
   JCp8Bs6apZGOwuixkkRhS+4fINPGZoI/msXAxQEvE34iV4ZG+WVktGkTG
   RwfmLCxOBHpK3nqnxPfJPLa1gavghf7A3f9pwocCbcPKwu+pWZyvYWK5r
   qpK1AFcqQv2J9eP9MIadXoADi6izHorNuVMCm5T5fqElX9dndU0NPQqS7
   xrYg02WXJaJsplppfy1TphJHpHV8vTyNL7do51pHUedg6QXuU+EYYiArb
   /dvq7kn4c1FnY4O0tV/FMm8o0CT2+HsYugvD42p7+a/urrkVXi88adLxJ
   Q==;
X-CSE-ConnectionGUID: QJ82Qz7rTfOpU/zNSE7IpQ==
X-CSE-MsgGUID: neDzYVQ3T+2QaMc3UZd2kQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14917611"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="14917611"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 01:35:08 -0700
X-CSE-ConnectionGUID: GJOeVLEcRuyaWHJSfr/6TA==
X-CSE-MsgGUID: aaYzShOBS/2ayvm2fjKzsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="39435237"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2024 01:35:06 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGwy8-0000Dq-12;
	Tue, 11 Jun 2024 08:35:04 +0000
Date: Tue, 11 Jun 2024 16:34:29 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 7f1e45f4ae7671550e15354ef87194bccd99ecec
Message-ID: <202406111627.zU7c7x2w-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 7f1e45f4ae7671550e15354ef87194bccd99ecec  docs: gpio: prefer pread(2) for interrupt reading

elapsed time: 1466m

configs tested: 150
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   alpha
allyesconfig                            alpha   defconfig
arc                               allnoconfig   arc  
defconfig                                 arc   randconfig-001-20240611
arc                   randconfig-002-20240611   arm  
allnoconfig                               arm   defconfig
arm                   randconfig-001-20240611   arm  
randconfig-002-20240611                              arm   randconfig-003-20240611
arm                   randconfig-004-20240611   arm64
allnoconfig                             arm64   defconfig
arm64                 randconfig-001-20240611   arm64
randconfig-002-20240611                            arm64   randconfig-003-20240611
arm64                 randconfig-004-20240611   csky 
allnoconfig                              csky   defconfig
csky                  randconfig-001-20240611   csky 
randconfig-002-20240611                          hexagon   allmodconfig
hexagon                           allnoconfig   hexagon
allyesconfig                          hexagon   defconfig
hexagon               randconfig-001-20240611   hexagon
randconfig-002-20240611                             i386   buildonly-randconfig-001-20240610
i386         buildonly-randconfig-003-20240611   i386 
buildonly-randconfig-004-20240610                             i386   buildonly-randconfig-006-20240610
i386                  randconfig-001-20240611   i386 
randconfig-004-20240611                             i386   randconfig-005-20240610
i386                  randconfig-006-20240611   i386 
randconfig-011-20240610                             i386   randconfig-011-20240611
i386                  randconfig-012-20240610   i386 
randconfig-013-20240610                             i386   randconfig-013-20240611
i386                  randconfig-014-20240610   i386 
randconfig-015-20240610                             i386   randconfig-015-20240611
i386                  randconfig-016-20240610   i386 
randconfig-016-20240611                        loongarch   allmodconfig
loongarch                         allnoconfig   loongarch
defconfig                           loongarch   randconfig-001-20240611
loongarch             randconfig-002-20240611   m68k 
allmodconfig                             m68k   allnoconfig
m68k                             allyesconfig   m68k 
defconfig                          microblaze   allmodconfig
microblaze                        allnoconfig   microblaze
allyesconfig                       microblaze   defconfig
mips                              allnoconfig   mips 
allyesconfig                            nios2   allmodconfig
nios2                             allnoconfig   nios2
allyesconfig                            nios2   defconfig
nios2                 randconfig-001-20240611   nios2
randconfig-002-20240611                         openrisc   allnoconfig
openrisc                         allyesconfig   openrisc
defconfig                              parisc   allmodconfig
parisc                            allnoconfig   parisc
allyesconfig                           parisc   defconfig
parisc                randconfig-001-20240611   parisc
randconfig-002-20240611                         parisc64   defconfig
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   powerpc
allyesconfig                         clang-19   powerpc
randconfig-001-20240611                          powerpc   randconfig-002-20240611
powerpc               randconfig-003-20240611   powerpc64
randconfig-001-20240611                        powerpc64   randconfig-002-20240611
powerpc64             randconfig-003-20240611   riscv
allmodconfig                         clang-19   riscv
allnoconfig                             riscv   allyesconfig
clang-19                                riscv   defconfig
riscv                 randconfig-001-20240611   riscv
randconfig-002-20240611                         clang-19   s390 
allmodconfig                             s390   allnoconfig
s390                             allyesconfig   s390 
defconfig                                s390   randconfig-001-20240611
s390                  randconfig-002-20240611   gcc-13.2.0
sh                               allmodconfig   sh   
allnoconfig                                sh   allyesconfig
sh                                  defconfig   sh   
randconfig-001-20240611                       gcc-13.2.0   sh   
randconfig-002-20240611                       gcc-13.2.0   sparc
allmodconfig                            sparc   allnoconfig
sparc                               defconfig   sparc64
allmodconfig                          sparc64   allyesconfig
sparc64                             defconfig   sparc64
randconfig-001-20240611                       gcc-13.2.0   sparc64
randconfig-002-20240611                       gcc-13.2.0   um   
allmodconfig                               um   allnoconfig
um                               allyesconfig   um   
defconfig                                  um   i386_defconfig
um                    randconfig-001-20240611   gcc-11
um                    randconfig-002-20240611   gcc-13
um                           x86_64_defconfig   x86_64
allnoconfig                            x86_64   buildonly-randconfig-001-20240611
x86_64       buildonly-randconfig-002-20240611   x86_64
buildonly-randconfig-003-20240611                           x86_64   buildonly-randconfig-004-20240611
x86_64       buildonly-randconfig-005-20240611   x86_64
buildonly-randconfig-006-20240611                           x86_64   defconfig
x86_64                randconfig-001-20240611   x86_64
randconfig-002-20240611                           x86_64   randconfig-003-20240611
x86_64                randconfig-004-20240611   x86_64
randconfig-005-20240611                           x86_64   randconfig-006-20240611
x86_64                randconfig-011-20240611   x86_64
randconfig-012-20240611                           x86_64   randconfig-013-20240611
x86_64                randconfig-014-20240611   x86_64
randconfig-015-20240611                           x86_64   randconfig-016-20240611
x86_64                randconfig-071-20240611   x86_64
randconfig-072-20240611                           x86_64   randconfig-073-20240611
x86_64                randconfig-074-20240611   x86_64
randconfig-075-20240611                           x86_64   randconfig-076-20240611
xtensa                            allnoconfig   xtensa
randconfig-001-20240611                       gcc-13.2.0   xtensa
randconfig-002-20240611                       gcc-13.2.0        

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

