Return-Path: <linux-gpio+bounces-27891-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 29547C246E2
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 11:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 898774EE8C7
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 10:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4145233B96C;
	Fri, 31 Oct 2025 10:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljNcWWZD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEFD2727FA
	for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2025 10:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761906145; cv=none; b=Fc7N0BXBVqoxHMiSxeVsEUNGa1qa4/P2Ay/QAHlixZBsqcJkMRvyQo/UJdMd9qN/+ZyBa4hA1B/VxozOmivrQBHx6fOmxiAJhzPHpM1ABG3bBpeHftvZZtAVFCj8YzzXvbWKxIrzjA03+t3xq3vYsiVtwn7ugTHDFXU6GlcJSeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761906145; c=relaxed/simple;
	bh=1cif6iKsvEeda7TuWPp/OUoqi+RENwZLxkcNFx5QE+I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r9aHdqFsMRnt6zV5wYGyutGeaA9Eyk4wdBJRckoQqHd2gr2lSAjfzFbDsOC5FkF9lmTDFuKUkyRMWSevRsJJe9xTC/FBjC0SdA4GYnrb6lG7J3p0Y4q/h2gPEHP+G4bKxEeKf2/+QkHuSwgxJzdoMdiy3w14A6IEEj77mv89YP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljNcWWZD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761906142; x=1793442142;
  h=date:from:to:cc:subject:message-id;
  bh=1cif6iKsvEeda7TuWPp/OUoqi+RENwZLxkcNFx5QE+I=;
  b=ljNcWWZDVx14sJAKVUYBYO7QembJVqAt+ufAr9TrLqzIKymfN/aTqggq
   v4XksufG+khc6hJKhf+u1UNtU/owksP+0z5HMsMZQnbblgCJwTliikmdX
   eeoHIJ3D6ri+mdxYdXePpC97zyVlSv33R3a+99crNS5A7MIi4rVT1iUxh
   gzqfXvVem8YWHUHF965GXm+3YRXHDUQWUo4P7wOeyT6z0OBADcbPT1aXb
   GxltdUcnjlQsuLEZe/Zi/E9+Riup/K+mBKiuV0NYKU6pzUxBtLlQbd/vO
   2qOJDkuuvSVKsXOilN5o8CiPz9R5Jh1Zyrcsx4255eTFRjuNtjHpuHgw4
   w==;
X-CSE-ConnectionGUID: 6l7l/fqyTnqXgFKlUhlecg==
X-CSE-MsgGUID: wSXxR6sdR9iSpNGC2IWVwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75414778"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="75414778"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 03:22:21 -0700
X-CSE-ConnectionGUID: zox/ldT6R8W8F/+peXO0aQ==
X-CSE-MsgGUID: bd+m0cCfQ32vIsVcT99aIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186081901"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 31 Oct 2025 03:22:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEmGP-000Mzg-2V;
	Fri, 31 Oct 2025 10:22:07 +0000
Date: Fri, 31 Oct 2025 18:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 bac88be0d2a83daf761129828e7ae3c79cc260c2
Message-ID: <202510311816.GvOt3WOA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: bac88be0d2a83daf761129828e7ae3c79cc260c2  gpio: mm-lantiq: update kernel docs

elapsed time: 1487m

configs tested: 101
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251030    gcc-11.5.0
arc                   randconfig-002-20251030    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                       aspeed_g4_defconfig    clang-22
arm                       imx_v4_v5_defconfig    clang-22
arm                         lpc32xx_defconfig    clang-17
arm                   randconfig-001-20251030    gcc-10.5.0
arm                   randconfig-002-20251030    clang-19
arm                   randconfig-003-20251030    clang-22
arm                   randconfig-004-20251030    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251031    gcc-8.5.0
arm64                 randconfig-002-20251031    clang-22
arm64                 randconfig-003-20251031    gcc-10.5.0
arm64                 randconfig-004-20251031    gcc-14.3.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251031    gcc-9.5.0
csky                  randconfig-002-20251031    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251030    clang-22
hexagon               randconfig-002-20251030    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251031    gcc-14
i386        buildonly-randconfig-002-20251031    gcc-14
i386        buildonly-randconfig-003-20251031    clang-20
i386        buildonly-randconfig-004-20251031    gcc-14
i386        buildonly-randconfig-005-20251031    clang-20
i386        buildonly-randconfig-006-20251031    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251030    clang-22
loongarch             randconfig-002-20251030    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5208evb_defconfig    gcc-15.1.0
m68k                           virt_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251030    gcc-8.5.0
nios2                 randconfig-002-20251030    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251031    gcc-14.3.0
parisc                randconfig-002-20251031    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251031    clang-22
powerpc               randconfig-002-20251031    gcc-12.5.0
powerpc64             randconfig-001-20251031    clang-22
powerpc64             randconfig-002-20251031    gcc-10.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251030    gcc-13.4.0
riscv                 randconfig-002-20251030    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251030    clang-17
s390                  randconfig-002-20251030    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251030    gcc-15.1.0
sh                    randconfig-002-20251030    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251031    gcc-8.5.0
sparc                 randconfig-002-20251031    gcc-8.5.0
sparc64               randconfig-001-20251031    gcc-8.5.0
sparc64               randconfig-002-20251031    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                    randconfig-001-20251031    gcc-14
um                    randconfig-002-20251031    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251031    clang-20
x86_64      buildonly-randconfig-002-20251031    gcc-14
x86_64      buildonly-randconfig-003-20251031    clang-20
x86_64      buildonly-randconfig-004-20251031    gcc-14
x86_64      buildonly-randconfig-005-20251031    gcc-14
x86_64      buildonly-randconfig-006-20251031    gcc-14
x86_64                randconfig-011-20251031    gcc-14
x86_64                randconfig-012-20251031    clang-20
x86_64                randconfig-013-20251031    gcc-14
x86_64                randconfig-014-20251031    gcc-14
x86_64                randconfig-015-20251031    gcc-14
x86_64                randconfig-073-20251031    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251031    gcc-13.4.0
xtensa                randconfig-002-20251031    gcc-8.5.0
xtensa                         virt_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

