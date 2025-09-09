Return-Path: <linux-gpio+bounces-25847-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0786AB508EC
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 00:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 746DA461014
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 22:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99A926C3AE;
	Tue,  9 Sep 2025 22:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsaVbJFi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3F41A0BD0
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 22:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757457472; cv=none; b=n1/GgbtwpWcosU9cx3uP3yhcUdnUo8Q9QcT5OIEKCLnFNaJHlWhv3PNNY42/DpAbBzjXeYxhxi/eVj9xZAo91eQf5dASJv74AoYJmuBD91iqzKfPFHkyMEuX/x20ruzNOeNa8YE/o8qnXvZRFv/Wxb147KX3Z8P8xL38iVfoMck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757457472; c=relaxed/simple;
	bh=ZTewR2hMR+G758VGiug/X9cNJVM4Dg08xXUMdSAL39s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uI8Hf17cU0FtYGClXR7lMgQGlQECZndht6Cz1pTH5iq7LJQj6DgWBCHphTpKJbPxPaF+Y5kFXdgBgHuwKbarDIurCKr1aclgxCOwn3OMnXoVjqQcQSuFtlfG1xpHyexhF5RRBVgb1HzHnFc/elteZATZuse1x+Lp1Yti05bIZn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsaVbJFi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757457470; x=1788993470;
  h=date:from:to:cc:subject:message-id;
  bh=ZTewR2hMR+G758VGiug/X9cNJVM4Dg08xXUMdSAL39s=;
  b=VsaVbJFi3HTnRAH54likqiLafjRr+/cB9wEeuQ104CeUIeCOTlzeiMLu
   F/zz50TYblFhD/XW8YuJo+iCsg9VNIheiBFqvKPP4H5769anQh7JEsWqb
   eMlJLoAc9A06tCUk3yeamimQF/c1DyhP2y77YeWWBCszFRe00BIo3ez/T
   qm8M+z1tuqFdpzyx6ekUpUvwigR9poHsFT3DJ8/Zmc2xWk+q4VyzWFVrO
   7Qf83Vec7qr8hSW1HuP67Ky4Bm/vJ74wPhYT+fRGv9slc7egxUN9E7AlB
   jFFnmZvJxhTOHc74qy2/4QVWXMGjG+jqiCT8RjDZK814k+TEzV3Y7dCvL
   g==;
X-CSE-ConnectionGUID: csW1z0mcQrS5QfIKh9hxGA==
X-CSE-MsgGUID: /zC/7G0pRLWq+1hTE4sVpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="85207388"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="85207388"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 15:37:49 -0700
X-CSE-ConnectionGUID: 0QrFPrFeTYG6Xr7EL+JSMA==
X-CSE-MsgGUID: 5v5eELS0RWyrcGTYrAfLGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="172377791"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Sep 2025 15:37:48 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uw6y9-0005Ko-2n;
	Tue, 09 Sep 2025 22:37:45 +0000
Date: Wed, 10 Sep 2025 06:37:29 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 a061e739d36220c002da8b2429d5f16f637eb59a
Message-ID: <202509100618.haTWleWw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: a061e739d36220c002da8b2429d5f16f637eb59a  pinctrl: airoha: fix wrong MDIO function bitmaks

elapsed time: 1482m

configs tested: 265
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
alpha                               defconfig    gcc-14
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                          axs101_defconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250909    clang-16
arc                   randconfig-001-20250909    gcc-8.5.0
arc                   randconfig-002-20250909    clang-16
arc                   randconfig-002-20250909    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                   randconfig-001-20250909    clang-16
arm                   randconfig-001-20250909    clang-18
arm                   randconfig-002-20250909    clang-16
arm                   randconfig-002-20250909    clang-17
arm                   randconfig-003-20250909    clang-16
arm                   randconfig-003-20250909    clang-22
arm                   randconfig-004-20250909    clang-16
arm                   randconfig-004-20250909    clang-19
arm                         s3c6400_defconfig    gcc-14
arm                           spitz_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250909    clang-16
arm64                 randconfig-002-20250909    clang-16
arm64                 randconfig-002-20250909    gcc-11.5.0
arm64                 randconfig-003-20250909    clang-16
arm64                 randconfig-003-20250909    gcc-11.5.0
arm64                 randconfig-004-20250909    clang-16
arm64                 randconfig-004-20250909    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250909    gcc-15.1.0
csky                  randconfig-001-20250909    gcc-8.5.0
csky                  randconfig-001-20250910    clang-22
csky                  randconfig-002-20250909    gcc-15.1.0
csky                  randconfig-002-20250909    gcc-8.5.0
csky                  randconfig-002-20250910    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250909    clang-22
hexagon               randconfig-001-20250909    gcc-8.5.0
hexagon               randconfig-001-20250910    clang-22
hexagon               randconfig-002-20250909    clang-22
hexagon               randconfig-002-20250909    gcc-8.5.0
hexagon               randconfig-002-20250910    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250909    gcc-13
i386        buildonly-randconfig-001-20250910    clang-20
i386        buildonly-randconfig-002-20250909    clang-20
i386        buildonly-randconfig-002-20250910    clang-20
i386        buildonly-randconfig-003-20250909    clang-20
i386        buildonly-randconfig-003-20250910    clang-20
i386        buildonly-randconfig-004-20250909    clang-20
i386        buildonly-randconfig-004-20250910    clang-20
i386        buildonly-randconfig-005-20250909    clang-20
i386        buildonly-randconfig-005-20250910    clang-20
i386        buildonly-randconfig-006-20250909    clang-20
i386        buildonly-randconfig-006-20250910    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250909    clang-20
i386                  randconfig-002-20250909    clang-20
i386                  randconfig-003-20250909    clang-20
i386                  randconfig-004-20250909    clang-20
i386                  randconfig-005-20250909    clang-20
i386                  randconfig-006-20250909    clang-20
i386                  randconfig-007-20250909    clang-20
i386                  randconfig-011-20250909    gcc-14
i386                  randconfig-012-20250909    gcc-14
i386                  randconfig-013-20250909    gcc-14
i386                  randconfig-014-20250909    gcc-14
i386                  randconfig-015-20250909    gcc-14
i386                  randconfig-016-20250909    gcc-14
i386                  randconfig-017-20250909    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250909    gcc-15.1.0
loongarch             randconfig-001-20250909    gcc-8.5.0
loongarch             randconfig-001-20250910    clang-22
loongarch             randconfig-002-20250909    gcc-15.1.0
loongarch             randconfig-002-20250909    gcc-8.5.0
loongarch             randconfig-002-20250910    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250909    gcc-11.5.0
nios2                 randconfig-001-20250909    gcc-8.5.0
nios2                 randconfig-001-20250910    clang-22
nios2                 randconfig-002-20250909    gcc-8.5.0
nios2                 randconfig-002-20250910    clang-22
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250909    gcc-8.5.0
parisc                randconfig-001-20250910    clang-22
parisc                randconfig-002-20250909    gcc-12.5.0
parisc                randconfig-002-20250909    gcc-8.5.0
parisc                randconfig-002-20250910    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                        cell_defconfig    gcc-15.1.0
powerpc                     ep8248e_defconfig    gcc-14
powerpc                    ge_imp3a_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250909    clang-22
powerpc               randconfig-001-20250909    gcc-8.5.0
powerpc               randconfig-001-20250910    clang-22
powerpc               randconfig-002-20250909    clang-17
powerpc               randconfig-002-20250909    gcc-8.5.0
powerpc               randconfig-002-20250910    clang-22
powerpc               randconfig-003-20250909    gcc-8.5.0
powerpc               randconfig-003-20250910    clang-22
powerpc                     taishan_defconfig    gcc-14
powerpc64             randconfig-001-20250909    clang-20
powerpc64             randconfig-001-20250909    gcc-8.5.0
powerpc64             randconfig-002-20250909    gcc-10.5.0
powerpc64             randconfig-002-20250909    gcc-8.5.0
powerpc64             randconfig-002-20250910    clang-22
powerpc64             randconfig-003-20250909    gcc-8.5.0
powerpc64             randconfig-003-20250910    clang-22
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250909    clang-22
riscv                 randconfig-001-20250909    gcc-15.1.0
riscv                 randconfig-001-20250910    gcc-12.5.0
riscv                 randconfig-002-20250909    clang-22
riscv                 randconfig-002-20250909    gcc-15.1.0
riscv                 randconfig-002-20250910    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250909    gcc-11.5.0
s390                  randconfig-001-20250909    gcc-15.1.0
s390                  randconfig-001-20250910    gcc-12.5.0
s390                  randconfig-002-20250909    clang-18
s390                  randconfig-002-20250909    gcc-15.1.0
s390                  randconfig-002-20250910    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20250909    gcc-15.1.0
sh                    randconfig-001-20250910    gcc-12.5.0
sh                    randconfig-002-20250909    gcc-15.1.0
sh                    randconfig-002-20250909    gcc-9.5.0
sh                    randconfig-002-20250910    gcc-12.5.0
sh                   secureedge5410_defconfig    gcc-14
sh                        sh7785lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250909    gcc-15.1.0
sparc                 randconfig-001-20250909    gcc-8.5.0
sparc                 randconfig-001-20250910    gcc-12.5.0
sparc                 randconfig-002-20250909    gcc-15.1.0
sparc                 randconfig-002-20250910    gcc-12.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250909    clang-22
sparc64               randconfig-001-20250909    gcc-15.1.0
sparc64               randconfig-001-20250910    gcc-12.5.0
sparc64               randconfig-002-20250909    gcc-15.1.0
sparc64               randconfig-002-20250909    gcc-8.5.0
sparc64               randconfig-002-20250910    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250909    gcc-14
um                    randconfig-001-20250909    gcc-15.1.0
um                    randconfig-001-20250910    gcc-12.5.0
um                    randconfig-002-20250909    gcc-14
um                    randconfig-002-20250909    gcc-15.1.0
um                    randconfig-002-20250910    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250909    clang-20
x86_64      buildonly-randconfig-001-20250909    gcc-14
x86_64      buildonly-randconfig-002-20250909    clang-20
x86_64      buildonly-randconfig-002-20250909    gcc-14
x86_64      buildonly-randconfig-003-20250909    gcc-14
x86_64      buildonly-randconfig-004-20250909    clang-20
x86_64      buildonly-randconfig-004-20250909    gcc-14
x86_64      buildonly-randconfig-005-20250909    gcc-14
x86_64      buildonly-randconfig-006-20250909    clang-20
x86_64      buildonly-randconfig-006-20250909    gcc-14
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250909    gcc-14
x86_64                randconfig-002-20250909    gcc-14
x86_64                randconfig-003-20250909    gcc-14
x86_64                randconfig-004-20250909    gcc-14
x86_64                randconfig-005-20250909    gcc-14
x86_64                randconfig-006-20250909    gcc-14
x86_64                randconfig-007-20250909    gcc-14
x86_64                randconfig-008-20250909    gcc-14
x86_64                randconfig-071-20250909    gcc-14
x86_64                randconfig-072-20250909    gcc-14
x86_64                randconfig-073-20250909    gcc-14
x86_64                randconfig-074-20250909    gcc-14
x86_64                randconfig-075-20250909    gcc-14
x86_64                randconfig-076-20250909    gcc-14
x86_64                randconfig-077-20250909    gcc-14
x86_64                randconfig-078-20250909    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250909    gcc-15.1.0
xtensa                randconfig-001-20250909    gcc-8.5.0
xtensa                randconfig-001-20250910    gcc-12.5.0
xtensa                randconfig-002-20250909    gcc-15.1.0
xtensa                randconfig-002-20250910    gcc-12.5.0
xtensa                    smp_lx200_defconfig    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

