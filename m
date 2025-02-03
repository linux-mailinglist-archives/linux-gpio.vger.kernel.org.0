Return-Path: <linux-gpio+bounces-15299-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 035C1A2676D
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 00:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B6D73A54CF
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 23:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CFB211707;
	Mon,  3 Feb 2025 23:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbbPysFi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21BA2116FA
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 23:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738623762; cv=none; b=bdiPhNoLuh0UAne8M58w1tG1k9rvts9cC0pG6k0UACY9whvHIydmcwwBMSONhwaWKnzwlmNLD8CD8g49YDksmZQbG4B6uUGSP8Xd2Jz8Ypvt/fy309YZpaqSCLZNf1P9rIIQu7cso8djrSc+zLS7s+sarUisF3GpECqVsZsDYU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738623762; c=relaxed/simple;
	bh=CoYdMRTwY2FYdZYgwRyEvBimOtxlC0B2//oilAxUJE4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QVYuJOHag8ZmUk+r7GHM+WyIlJLf5gUHBzf0nsH3SEYjjz5OfuavHU7IZEzWqwVbUQrkDmAGHQlEQH3s6nDBsPuDNRa69lr21IittPuo+7qRR4A7swWro53+vOTa9iCgEP22sz+WLUSYZwNXnu55J880diHygElfI1PZFpX7riY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KbbPysFi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738623758; x=1770159758;
  h=date:from:to:cc:subject:message-id;
  bh=CoYdMRTwY2FYdZYgwRyEvBimOtxlC0B2//oilAxUJE4=;
  b=KbbPysFivTm07Ei/rMj6/Z5FRQZBhUJEIdk437zgrszafukj96wcMvdU
   3iijQeCpCy0e4RknGvdDm70fCMIxKBxAo4twtcE0zJ6Srg6d55q20f0sD
   M1Xr57aYF6nt7b+HjNFUDKzZjI6M5BXZsQ7sRmigTHfFhgojDNPQUw3xV
   MgbbbxYkzbXom0pjKeRxfshbuNpZaC6HlAXCZBNaUKIb+KzUqZ7lyY1+b
   dQOe2xSPqKuRMMB7fej3N4I1+tSAA8QW7X3ecIeilJNYK+fEqPFT+0rpp
   P0AgVEHhVQEDxhBZzu4VeGcpozaeBB5g+v7Nj9YbeZNmIHFoW4g4U9BGi
   Q==;
X-CSE-ConnectionGUID: zJYlXLMFTZWZVWwLmY3ZxQ==
X-CSE-MsgGUID: xzyERxiGRkKS4m7aBHirgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50524390"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="50524390"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 15:02:37 -0800
X-CSE-ConnectionGUID: S06Rhw4rQ7+0he8NMmZLcg==
X-CSE-MsgGUID: 9MqXXINPQyuDDku5nd5DfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="110996072"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Feb 2025 15:02:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf5Sb-000reh-0V;
	Mon, 03 Feb 2025 23:02:33 +0000
Date: Tue, 04 Feb 2025 07:01:38 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:davinci/for-next] BUILD SUCCESS
 58abc69e479cf5b36c4fc4287a11c9d92d2ce4b8
Message-ID: <202502040727.lWw0DDIE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git davinci/for-next
branch HEAD: 58abc69e479cf5b36c4fc4287a11c9d92d2ce4b8  ARM: dts: ti: davinci: Align GPIO hog name with bindings

elapsed time: 888m

configs tested: 165
configs skipped: 119

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
arc                              allmodconfig    clang-18
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                           tb10x_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250203    clang-18
arm                   randconfig-002-20250203    gcc-14.2.0
arm                   randconfig-003-20250203    clang-18
arm                   randconfig-004-20250203    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250203    gcc-14.2.0
csky                  randconfig-002-20250203    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250203    gcc-14.2.0
hexagon               randconfig-002-20250203    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20250204    gcc-12
i386        buildonly-randconfig-002-20250204    gcc-12
i386        buildonly-randconfig-003-20250204    gcc-12
i386        buildonly-randconfig-004-20250204    gcc-12
i386        buildonly-randconfig-005-20250204    gcc-12
i386        buildonly-randconfig-006-20250204    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250204    clang-19
i386                  randconfig-002-20250204    clang-19
i386                  randconfig-003-20250204    clang-19
i386                  randconfig-004-20250204    clang-19
i386                  randconfig-005-20250204    clang-19
i386                  randconfig-006-20250204    clang-19
i386                  randconfig-007-20250204    clang-19
i386                  randconfig-011-20250203    clang-19
i386                  randconfig-011-20250204    clang-19
i386                  randconfig-012-20250203    clang-19
i386                  randconfig-012-20250204    clang-19
i386                  randconfig-013-20250203    clang-19
i386                  randconfig-013-20250204    clang-19
i386                  randconfig-014-20250203    clang-19
i386                  randconfig-014-20250204    clang-19
i386                  randconfig-015-20250203    clang-19
i386                  randconfig-015-20250204    clang-19
i386                  randconfig-016-20250203    clang-19
i386                  randconfig-016-20250204    clang-19
i386                  randconfig-017-20250203    clang-19
i386                  randconfig-017-20250204    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250203    gcc-14.2.0
loongarch             randconfig-002-20250203    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip32_defconfig    gcc-14.2.0
mips                      maltasmvp_defconfig    gcc-14.2.0
mips                        omega2p_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250203    gcc-14.2.0
nios2                 randconfig-002-20250203    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250203    gcc-14.2.0
parisc                randconfig-002-20250203    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      pasemi_defconfig    gcc-14.2.0
powerpc                      pmac32_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250203    gcc-14.2.0
powerpc               randconfig-002-20250203    gcc-14.2.0
powerpc               randconfig-003-20250203    gcc-14.2.0
powerpc64             randconfig-001-20250203    gcc-14.2.0
powerpc64             randconfig-002-20250203    gcc-14.2.0
powerpc64             randconfig-003-20250203    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250203    gcc-14.2.0
riscv                 randconfig-002-20250203    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250203    gcc-14.2.0
s390                  randconfig-002-20250203    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250203    gcc-14.2.0
sh                    randconfig-002-20250203    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250203    gcc-14.2.0
sparc                 randconfig-002-20250203    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250203    gcc-14.2.0
sparc64               randconfig-002-20250203    gcc-14.2.0
um                               allmodconfig    clang-21
um                               allyesconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250203    gcc-14.2.0
um                    randconfig-002-20250203    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250203    gcc-12
x86_64      buildonly-randconfig-002-20250203    gcc-12
x86_64      buildonly-randconfig-003-20250203    gcc-12
x86_64      buildonly-randconfig-004-20250203    gcc-12
x86_64      buildonly-randconfig-005-20250203    gcc-12
x86_64      buildonly-randconfig-006-20250203    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250203    gcc-12
x86_64                randconfig-002-20250203    gcc-12
x86_64                randconfig-003-20250203    gcc-12
x86_64                randconfig-004-20250203    gcc-12
x86_64                randconfig-005-20250203    gcc-12
x86_64                randconfig-006-20250203    gcc-12
x86_64                randconfig-007-20250203    gcc-12
x86_64                randconfig-008-20250203    gcc-12
x86_64                randconfig-071-20250203    gcc-12
x86_64                randconfig-071-20250204    gcc-12
x86_64                randconfig-072-20250203    gcc-12
x86_64                randconfig-072-20250204    gcc-12
x86_64                randconfig-073-20250203    gcc-12
x86_64                randconfig-073-20250204    gcc-12
x86_64                randconfig-074-20250203    gcc-12
x86_64                randconfig-074-20250204    gcc-12
x86_64                randconfig-075-20250203    gcc-12
x86_64                randconfig-075-20250204    gcc-12
x86_64                randconfig-076-20250203    gcc-12
x86_64                randconfig-076-20250204    gcc-12
x86_64                randconfig-077-20250203    gcc-12
x86_64                randconfig-077-20250204    gcc-12
x86_64                randconfig-078-20250203    gcc-12
x86_64                randconfig-078-20250204    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250203    gcc-14.2.0
xtensa                randconfig-002-20250203    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

