Return-Path: <linux-gpio+bounces-21912-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8260AE1555
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 09:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5B8C167059
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 07:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770EA23185D;
	Fri, 20 Jun 2025 07:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXCdEHfy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2028230D0D
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 07:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406269; cv=none; b=RfyAcA5atQHF2oRc1e5fXtKFpVGE6CxhVTxcXEB2EncJYea/HTEPS+wLtE6iajFUHF0TEkdm4FFo9kk6F2gDlLITlsPg8VIeBrEBdw69EynIeYBqVhi3hH6gz7awpFeiPKW0IRROg3Rzs7JtR4DKPwma/w+i/txn1Awqn/5FevI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406269; c=relaxed/simple;
	bh=2S3GA/ddaOC3b5bfEN47qFQsngaQ+nKHDmERfIYjrdQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bhrefMXebwq/tjXtRTLpdmZqcO5Wz7rryU7JjWTWobdA3sPefthpOSRmAxdNtclQwdKBRYdUWBEO2VS9r+RjXlEbn8Non7fPHgdsjm6RDPgCIugd49HI9htG6Lcx41GVLrqlv5PCPL1zSDQyarQ7EZVHHFIk2Swl9Ay/wMfD/4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXCdEHfy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750406267; x=1781942267;
  h=date:from:to:cc:subject:message-id;
  bh=2S3GA/ddaOC3b5bfEN47qFQsngaQ+nKHDmERfIYjrdQ=;
  b=PXCdEHfyTQ4VT+/60Q4MLlz0GEyEhYRGGrUOXLi+KeIn0shNfd7E7GRO
   gqrWyFHPGfjoDiiLkKSypfolroyPJJYhr0Vcg2gCF/PRbRmK1Bif65GoF
   t0JssDwzU3tqN2uKExpohUHu8O6N23Ou4C0cAYVmi6fvd7aZtObjR24nv
   nMObb8ec5m8UM8LcVVufJ87ac9ofwDH9QRqtSlVnJmFIHwLtmOVycR9Vi
   qDAy0/yFzVKuowqUzLuQgLetH9XjwAfvvGYXRitDi6KfoptPeM7fgoIJU
   WWKONwNoKS+a3JTDIxUhpCiPoey8k9bryU1c9XX6C4ENi1jvAmUy7FM1A
   w==;
X-CSE-ConnectionGUID: CKilqlHjTsu7xCawXiXYTw==
X-CSE-MsgGUID: b8vFz789Q7Sx4zoyfCsoiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70229360"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="70229360"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 00:57:46 -0700
X-CSE-ConnectionGUID: PbkwZ+hoTxOcqWrx2TGjRQ==
X-CSE-MsgGUID: NO2tFwOsR8O9BSRTvuU0Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="155130795"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jun 2025 00:57:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSWd5-000LUo-0W;
	Fri, 20 Jun 2025 07:57:43 +0000
Date: Fri, 20 Jun 2025 15:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 9da895e97057ad946b2e727694af3fa5ee51d527
Message-ID: <202506201519.afxFDlN0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 9da895e97057ad946b2e727694af3fa5ee51d527  platform: cznic: use new GPIO line value setter callbacks

elapsed time: 1453m

configs tested: 127
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250619    gcc-15.1.0
arc                   randconfig-002-20250619    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g5_defconfig    gcc-15.1.0
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                            mps2_defconfig    clang-21
arm                   randconfig-001-20250619    clang-21
arm                   randconfig-002-20250619    gcc-8.5.0
arm                   randconfig-003-20250619    gcc-8.5.0
arm                   randconfig-004-20250619    gcc-10.5.0
arm                        realview_defconfig    clang-16
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250619    gcc-8.5.0
arm64                 randconfig-002-20250619    gcc-9.5.0
arm64                 randconfig-003-20250619    gcc-10.5.0
arm64                 randconfig-004-20250619    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250619    gcc-11.5.0
csky                  randconfig-002-20250619    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250619    clang-21
hexagon               randconfig-002-20250619    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250619    gcc-12
i386        buildonly-randconfig-002-20250619    gcc-12
i386        buildonly-randconfig-003-20250619    clang-20
i386        buildonly-randconfig-004-20250619    clang-20
i386        buildonly-randconfig-005-20250619    clang-20
i386        buildonly-randconfig-006-20250619    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250619    gcc-15.1.0
loongarch             randconfig-002-20250619    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          atari_defconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                      mmu_defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    clang-21
mips                           ci20_defconfig    clang-21
mips                           ip22_defconfig    gcc-15.1.0
mips                           ip32_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250619    gcc-8.5.0
nios2                 randconfig-002-20250619    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250619    gcc-11.5.0
parisc                randconfig-002-20250619    gcc-8.5.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               mpc834x_itxgp_defconfig    clang-21
powerpc               randconfig-001-20250619    gcc-9.3.0
powerpc               randconfig-002-20250619    clang-21
powerpc               randconfig-003-20250619    gcc-10.5.0
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250619    gcc-11.5.0
powerpc64             randconfig-002-20250619    clang-21
powerpc64             randconfig-003-20250619    gcc-10.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250619    gcc-11.5.0
riscv                 randconfig-002-20250619    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250619    clang-19
s390                  randconfig-002-20250619    gcc-13.2.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                    randconfig-001-20250619    gcc-9.3.0
sh                    randconfig-002-20250619    gcc-9.3.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250619    gcc-14.3.0
sparc                 randconfig-002-20250619    gcc-10.3.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250619    gcc-13.3.0
sparc64               randconfig-002-20250619    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250619    clang-19
um                    randconfig-002-20250619    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250619    clang-20
x86_64      buildonly-randconfig-002-20250619    gcc-12
x86_64      buildonly-randconfig-003-20250619    clang-20
x86_64      buildonly-randconfig-004-20250619    gcc-12
x86_64      buildonly-randconfig-005-20250619    clang-20
x86_64      buildonly-randconfig-006-20250619    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250619    gcc-9.3.0
xtensa                randconfig-002-20250619    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

