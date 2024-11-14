Return-Path: <linux-gpio+bounces-12991-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D22F9C82B3
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 06:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54DCD1F212C4
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 05:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52C433FE;
	Thu, 14 Nov 2024 05:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9cuXIFM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD3B1494CC
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 05:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731562615; cv=none; b=SrfGZVdn6L/baLF+M0jiZXFT0Qw6WfKIZIzCJe9A1ZJ6hDNQjiaGUgUkPKoBuAJ7KcnrrItGxvOioWDbny5muPMIn3Vqf917sIuxpfXmc2l4IunbYhcOmiG+x7tXJMFoVy0KBvZhf6b00eXzcMwISpwV4pP/AYxxCAK+My8tbXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731562615; c=relaxed/simple;
	bh=nns0jEyVKASBZ+XQZkcKf8t411I7n5EiqW3SQ6JnNpQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mw4z+gEHR7tF1uZ8WmgWtSv3+enahY6EeoL21J7GK6qX1GQil2S5+D8NlgYl480nZ1MPFLol5b7TTkd91gnYy+5qHq3OiMwoYYOd4P/pMQE5xPFa/2sfN7tlNW3kwkgcjKyBDX27cjD35A77tbJeYykQBOXOt4Am9LGMDzr+j7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9cuXIFM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731562614; x=1763098614;
  h=date:from:to:cc:subject:message-id;
  bh=nns0jEyVKASBZ+XQZkcKf8t411I7n5EiqW3SQ6JnNpQ=;
  b=D9cuXIFMIvK6qklF+Jq18M1FH0P40c8ae5/4TLs8HWL4YVApPZt2S1qY
   QnsLzLN4MyGTA7IKYKRNAhY3EjlmxAd7XD8PV/wfXiZ3ZXu3tiF8GcCAa
   kv81bc8JKzcB/bWE7gmL0RmUq72jSWTRbB+/chWelCgl047p/12I36CBP
   hnyaWvuiYT+ierYDAQYFnrhGnKZCHCLtH9pKE3HddIA7O7f6cBXZlhmcc
   tLP/DFdPnjTobVq26oS9r99jWuBvAZovFMt/pVVH70MTQmFoD1JTfY33+
   tJP0uWqmB8moqApkPIJZKj8AHoTm/qGnKZpq3FbZoiI1WaRc8Y9BL94yG
   w==;
X-CSE-ConnectionGUID: 5Dg5ddO7QmqI6vtOPllAHw==
X-CSE-MsgGUID: hZsH5xnNSaWFc+ZI8Km0lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42906134"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="42906134"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 21:36:54 -0800
X-CSE-ConnectionGUID: 4y6VncQLSPSzJxOXn0zJWg==
X-CSE-MsgGUID: KPqS+EYxR/C0pu+PtG+EXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="92145590"
Received: from lkp-server01.sh.intel.com (HELO b014a344d658) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Nov 2024 21:36:52 -0800
Received: from kbuild by b014a344d658 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBSXC-0000AX-0o;
	Thu, 14 Nov 2024 05:36:50 +0000
Date: Thu, 14 Nov 2024 13:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 400913bd4edd76ef1775bfd95543846bd6f5ed71
Message-ID: <202411141336.0svB1Cce-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 400913bd4edd76ef1775bfd95543846bd6f5ed71  i2c: qup: use generic device property accessors

elapsed time: 770m

configs tested: 146
configs skipped: 20

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20241114    gcc-13.2.0
arc                   randconfig-002-20241114    gcc-13.2.0
arc                        vdk_hs38_defconfig    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    clang-20
arm                         nhk8815_defconfig    clang-20
arm                   randconfig-001-20241114    gcc-14.2.0
arm                   randconfig-002-20241114    gcc-14.2.0
arm                   randconfig-003-20241114    gcc-14.2.0
arm                   randconfig-004-20241114    clang-14
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241114    clang-20
arm64                 randconfig-002-20241114    gcc-14.2.0
arm64                 randconfig-003-20241114    gcc-14.2.0
arm64                 randconfig-004-20241114    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241114    gcc-14.2.0
csky                  randconfig-002-20241114    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241114    clang-20
hexagon               randconfig-002-20241114    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241114    clang-19
i386        buildonly-randconfig-002-20241114    gcc-11
i386        buildonly-randconfig-003-20241114    gcc-12
i386        buildonly-randconfig-004-20241114    gcc-12
i386        buildonly-randconfig-005-20241114    gcc-12
i386        buildonly-randconfig-006-20241114    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241114    gcc-12
i386                  randconfig-002-20241114    gcc-12
i386                  randconfig-003-20241114    clang-19
i386                  randconfig-004-20241114    gcc-12
i386                  randconfig-005-20241114    clang-19
i386                  randconfig-006-20241114    clang-19
i386                  randconfig-011-20241114    clang-19
i386                  randconfig-012-20241114    gcc-12
i386                  randconfig-013-20241114    clang-19
i386                  randconfig-014-20241114    clang-19
i386                  randconfig-015-20241114    gcc-12
i386                  randconfig-016-20241114    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241114    gcc-14.2.0
loongarch             randconfig-002-20241114    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241114    gcc-14.2.0
nios2                 randconfig-002-20241114    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241114    gcc-14.2.0
parisc                randconfig-002-20241114    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc               randconfig-001-20241114    gcc-14.2.0
powerpc               randconfig-002-20241114    clang-14
powerpc               randconfig-003-20241114    gcc-14.2.0
powerpc64             randconfig-001-20241114    gcc-14.2.0
powerpc64             randconfig-002-20241114    clang-20
powerpc64             randconfig-003-20241114    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-20
riscv                 randconfig-001-20241114    gcc-14.2.0
riscv                 randconfig-002-20241114    clang-14
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-20
s390                  randconfig-001-20241114    gcc-14.2.0
s390                  randconfig-002-20241114    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20241114    gcc-14.2.0
sh                    randconfig-002-20241114    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241114    gcc-12
x86_64      buildonly-randconfig-002-20241114    gcc-12
x86_64      buildonly-randconfig-003-20241114    gcc-11
x86_64      buildonly-randconfig-004-20241114    gcc-12
x86_64      buildonly-randconfig-005-20241114    gcc-12
x86_64      buildonly-randconfig-006-20241114    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241114    gcc-12
x86_64                randconfig-002-20241114    gcc-12
x86_64                randconfig-003-20241114    gcc-12
x86_64                randconfig-004-20241114    clang-19
x86_64                randconfig-005-20241114    clang-19
x86_64                randconfig-006-20241114    gcc-12
x86_64                randconfig-011-20241114    clang-19
x86_64                randconfig-012-20241114    gcc-12
x86_64                randconfig-013-20241114    gcc-12
x86_64                randconfig-014-20241114    gcc-12
x86_64                randconfig-015-20241114    clang-19
x86_64                randconfig-016-20241114    gcc-12
x86_64                randconfig-071-20241114    gcc-11
x86_64                randconfig-072-20241114    gcc-12
x86_64                randconfig-073-20241114    gcc-12
x86_64                randconfig-074-20241114    gcc-12
x86_64                randconfig-075-20241114    clang-19
x86_64                randconfig-076-20241114    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

