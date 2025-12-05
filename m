Return-Path: <linux-gpio+bounces-29274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB303CA5EC7
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 03:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2C5830BDABF
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 02:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6F52DEA89;
	Fri,  5 Dec 2025 02:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifcTNz+0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F3A2C21C7
	for <linux-gpio@vger.kernel.org>; Fri,  5 Dec 2025 02:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764902693; cv=none; b=sfpLdXHOIFoqEkVKTxhzqNkxFn7GMkrBtIf3s26XKPNo07XUFpPe+ncqpwdgHWUax4reeNxXnnN9h1EOeVz/vzuSLLiVm3sLsFWopweVGqOwhw7oSXcjjdUEnIF5OA8yio/EDas5lEQeTCpTm1HgrwWh0cBUnxVL1bXyYkAjz9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764902693; c=relaxed/simple;
	bh=wuXMqLJvv1Py1lXHzMX89xupZ1fUPoZ07eX6Ah6uE0E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dX4XPkkYHFV5cNwImAVCp57Mdk68Hx0B7OAmrDTshh2DR+kVSHeVdzM7KgVSsqsiwgF7AvU9Yv4fKp7XJvFXqpf8QTUW5i5iqImKdSdihKnB7W7ysKGFTj4nhuaDP0LWz/8hohw9/kYT7aEBnpncuXRX8vDN4tn774lJbfiE0Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifcTNz+0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764902692; x=1796438692;
  h=date:from:to:cc:subject:message-id;
  bh=wuXMqLJvv1Py1lXHzMX89xupZ1fUPoZ07eX6Ah6uE0E=;
  b=ifcTNz+0IA28MDOnbmSqYksT1coCiedShe0a03L2OB0CL1YOcftnUua2
   HkGyjz2/0YXnmpkQsS6t7Yl4WDT+ny1PBbIt5Lk4L3oJYp8x4t2NImqr2
   EOSiyoI+9XezGsEiOpmBxeF7QmmLOMNuGhPag9UFEfyhlTwjLFpaCxpUI
   uDxNYWcqffkp/2xErbnQRS2qzxtEbXrgWeG61OcOuj7DMBBaxlM46Ksov
   /elZncKw3KraZJgAxluGEOjbvEmpeAr2N+Bgo5QVMRexkwUaCrlUR/q6u
   JefMQebK0zCl0gxCNiUcxFxfJU/PpuSwAVXfUCdI0KiZGKh68BYbRbrXa
   Q==;
X-CSE-ConnectionGUID: YMz3lQkORuKjB17HE/wLfA==
X-CSE-MsgGUID: TUmBioWOSW+ksHPeNWSe5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="89585405"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="89585405"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 18:44:52 -0800
X-CSE-ConnectionGUID: 5eMvO/q9Q4GH9u5cGqZnTg==
X-CSE-MsgGUID: BiC8eGFqSFiBXuuwuyCCPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="225824373"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Dec 2025 18:44:51 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRLoO-00000000EUz-3R4D;
	Fri, 05 Dec 2025 02:44:48 +0000
Date: Fri, 05 Dec 2025 10:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/linusw-kernelorg-email] BUILD SUCCESS
 085b802353c63524580dc70dac031cf8fc8ef640
Message-ID: <202512051021.2IToJ8Ag-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/linusw-kernelorg-email
branch HEAD: 085b802353c63524580dc70dac031cf8fc8ef640  MAINTAINERS: Change Linus Walleij mail address

elapsed time: 1564m

configs tested: 102
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251205    gcc-8.5.0
arc                   randconfig-002-20251205    gcc-9.5.0
arm                       aspeed_g4_defconfig    clang-22
arm                                 defconfig    clang-22
arm                   randconfig-001-20251205    gcc-8.5.0
arm                   randconfig-002-20251205    gcc-8.5.0
arm                   randconfig-003-20251205    gcc-13.4.0
arm                   randconfig-004-20251205    gcc-8.5.0
arm                           spitz_defconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251205    clang-22
arm64                 randconfig-002-20251205    clang-22
arm64                 randconfig-003-20251205    gcc-8.5.0
arm64                 randconfig-004-20251205    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251205    gcc-15.1.0
csky                  randconfig-002-20251205    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251205    clang-22
hexagon               randconfig-002-20251205    clang-22
i386                             allmodconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251204    gcc-14
i386        buildonly-randconfig-002-20251204    clang-20
i386        buildonly-randconfig-003-20251204    clang-20
i386        buildonly-randconfig-004-20251204    gcc-14
i386        buildonly-randconfig-005-20251204    clang-20
i386        buildonly-randconfig-006-20251204    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251205    clang-20
i386                  randconfig-002-20251205    gcc-14
i386                  randconfig-003-20251205    clang-20
i386                  randconfig-004-20251205    clang-20
i386                  randconfig-005-20251205    gcc-14
i386                  randconfig-006-20251205    clang-20
i386                  randconfig-007-20251205    gcc-14
loongarch             randconfig-001-20251205    clang-22
loongarch             randconfig-002-20251205    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5407c3_defconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251205    gcc-10.5.0
nios2                 randconfig-002-20251205    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251205    gcc-8.5.0
parisc                randconfig-002-20251205    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251205    clang-18
powerpc               randconfig-002-20251205    clang-18
powerpc64             randconfig-001-20251205    gcc-15.1.0
powerpc64             randconfig-002-20251205    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20251205    gcc-13.4.0
riscv                 randconfig-002-20251205    gcc-8.5.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251205    gcc-11.5.0
s390                  randconfig-002-20251205    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251205    gcc-13.4.0
sh                    randconfig-002-20251205    gcc-12.5.0
sparc                             allnoconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251205    gcc-8.5.0
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251205    clang-20
x86_64      buildonly-randconfig-002-20251205    gcc-14
x86_64      buildonly-randconfig-003-20251205    gcc-12
x86_64      buildonly-randconfig-004-20251205    clang-20
x86_64      buildonly-randconfig-005-20251205    clang-20
x86_64      buildonly-randconfig-006-20251205    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251205    clang-20
x86_64                randconfig-002-20251205    gcc-14
x86_64                randconfig-003-20251205    gcc-14
x86_64                randconfig-004-20251205    clang-20
x86_64                randconfig-005-20251205    gcc-14
x86_64                randconfig-006-20251205    clang-20
x86_64                randconfig-012-20251205    clang-20
x86_64                randconfig-014-20251205    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

