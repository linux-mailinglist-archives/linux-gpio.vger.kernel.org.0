Return-Path: <linux-gpio+bounces-27080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 78776BD938B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D91604FF9EB
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 12:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E2D311950;
	Tue, 14 Oct 2025 12:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMgmwCT2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E148311593
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443517; cv=none; b=rjJLKljPCbnUUBtojEK9l1bNTT2+1RRaYTdz2tvt9g5QgWKgt3OUtxw2yIi7Oz8IwDugwznAbFBcYKQS1gaVGZsBdawXJa1Z5uOWMJ5Wm9H1IwfLjZWC/gC7l3nHDixIcQBIvVVYy1OrEDBVUuKA2yx14vhhdRJns/8IDeBYkng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443517; c=relaxed/simple;
	bh=3TLTCJUc0UZc+I03cYwPhullfrZuMcx7YPQOrEX2PzY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LiKwtDpmcFsTFvtrolmmbs9uY+hQnBxAaqZmoNX6NrVXCje79PpYYSgu4v1I9KisNyei1UROsjFP+mZ6+AtOXH0pNq4oHzdv3nfzt/W2jg1Q+4o5OSUYH4brgQNRT5GAMK1WG3lnvHkO2qB7QkcixAfme/LDM/vzVMZzcGmRz9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMgmwCT2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760443513; x=1791979513;
  h=date:from:to:cc:subject:message-id;
  bh=3TLTCJUc0UZc+I03cYwPhullfrZuMcx7YPQOrEX2PzY=;
  b=YMgmwCT248SulwgR2pIIBLyc1qTvC3G/HdJp9ZmUAYHUJz8Xe7DljApD
   u0a13f4oh9Kj6RQoU2/XG5dK6pArCtjH4fO6hZaFvCOMJegj9gruJ4N0Y
   KHCsgvB7vUIsIi0KoIcUUwj/6WUb5d6wFXNj5e5J8cfmdyXBJlLfjjRRs
   WYGp4rksLMaDMYt4TKZJSzUpJOldo/8yawzGLCF3r2Pw6BTwLs46uHAq8
   qEsxIUoWv3PP96hDhkBbF4933BavOqHEmYrs6t/OWYOIH6NfA8W2ttXL9
   J4xSY/JkQLhYFrl+ALDyNggEKrpdqecaqKj3fZNbUTMq7+U9IS9K23igU
   g==;
X-CSE-ConnectionGUID: ZaO8bt1vRyCkCIsLUujx4A==
X-CSE-MsgGUID: N7YANiO3RzOcRNZrOU0X2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73702070"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="73702070"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 05:05:11 -0700
X-CSE-ConnectionGUID: B8axhirQRqK0wHgqzzftVQ==
X-CSE-MsgGUID: SrkXfri6TEGA/it/Q1rKww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="181089708"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 14 Oct 2025 05:05:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8dm7-0002mN-2r;
	Tue, 14 Oct 2025 12:05:07 +0000
Date: Tue, 14 Oct 2025 20:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 411b39bd1ac68c44f9e3c7dce5e095f6a71598c1
Message-ID: <202510142032.Z05qdDl3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 411b39bd1ac68c44f9e3c7dce5e095f6a71598c1  gpio: grgpio: call request_irq after incrementing the reference count

elapsed time: 1181m

configs tested: 228
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251014    clang-16
arc                   randconfig-001-20251014    gcc-15.1.0
arc                   randconfig-002-20251014    clang-16
arc                   randconfig-002-20251014    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                   milbeaut_m10v_defconfig    gcc-15.1.0
arm                        multi_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20251014    clang-16
arm                   randconfig-001-20251014    gcc-15.1.0
arm                   randconfig-002-20251014    clang-16
arm                   randconfig-002-20251014    gcc-13.4.0
arm                   randconfig-003-20251014    clang-16
arm                   randconfig-004-20251014    clang-16
arm                   randconfig-004-20251014    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251014    clang-16
arm64                 randconfig-001-20251014    gcc-9.5.0
arm64                 randconfig-002-20251014    clang-16
arm64                 randconfig-002-20251014    gcc-10.5.0
arm64                 randconfig-003-20251014    clang-16
arm64                 randconfig-003-20251014    gcc-14.3.0
arm64                 randconfig-004-20251014    clang-16
arm64                 randconfig-004-20251014    gcc-14.3.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251014    gcc-15.1.0
csky                  randconfig-001-20251014    gcc-8.5.0
csky                  randconfig-002-20251014    gcc-13.4.0
csky                  randconfig-002-20251014    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251014    clang-22
hexagon               randconfig-001-20251014    gcc-8.5.0
hexagon               randconfig-002-20251014    clang-22
hexagon               randconfig-002-20251014    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251014    gcc-14
i386        buildonly-randconfig-002-20251014    clang-20
i386        buildonly-randconfig-002-20251014    gcc-14
i386        buildonly-randconfig-003-20251014    clang-20
i386        buildonly-randconfig-003-20251014    gcc-14
i386        buildonly-randconfig-004-20251014    gcc-14
i386        buildonly-randconfig-005-20251014    gcc-14
i386        buildonly-randconfig-006-20251014    clang-20
i386        buildonly-randconfig-006-20251014    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251014    clang-20
i386                  randconfig-002-20251014    clang-20
i386                  randconfig-003-20251014    clang-20
i386                  randconfig-004-20251014    clang-20
i386                  randconfig-005-20251014    clang-20
i386                  randconfig-006-20251014    clang-20
i386                  randconfig-007-20251014    clang-20
i386                  randconfig-011-20251014    gcc-14
i386                  randconfig-012-20251014    gcc-14
i386                  randconfig-013-20251014    gcc-14
i386                  randconfig-014-20251014    gcc-14
i386                  randconfig-015-20251014    gcc-14
i386                  randconfig-016-20251014    gcc-14
i386                  randconfig-017-20251014    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251014    clang-18
loongarch             randconfig-001-20251014    gcc-8.5.0
loongarch             randconfig-002-20251014    gcc-15.1.0
loongarch             randconfig-002-20251014    gcc-8.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                   sb1250_swarm_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251014    gcc-11.5.0
nios2                 randconfig-001-20251014    gcc-8.5.0
nios2                 randconfig-002-20251014    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251014    gcc-11.5.0
parisc                randconfig-001-20251014    gcc-8.5.0
parisc                randconfig-002-20251014    gcc-8.5.0
parisc                randconfig-002-20251014    gcc-9.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20251014    gcc-8.5.0
powerpc               randconfig-001-20251014    gcc-9.5.0
powerpc               randconfig-002-20251014    clang-22
powerpc               randconfig-002-20251014    gcc-8.5.0
powerpc               randconfig-003-20251014    gcc-14.3.0
powerpc               randconfig-003-20251014    gcc-8.5.0
powerpc                     redwood_defconfig    gcc-15.1.0
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251014    gcc-8.5.0
powerpc64             randconfig-002-20251014    gcc-8.5.0
powerpc64             randconfig-003-20251014    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251014    gcc-10.5.0
riscv                 randconfig-002-20251014    gcc-10.5.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251014    clang-22
s390                  randconfig-001-20251014    gcc-10.5.0
s390                  randconfig-002-20251014    clang-19
s390                  randconfig-002-20251014    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251014    gcc-10.5.0
sh                    randconfig-001-20251014    gcc-14.3.0
sh                    randconfig-002-20251014    gcc-10.5.0
sh                    randconfig-002-20251014    gcc-11.5.0
sh                          sdk7786_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251014    gcc-10.5.0
sparc                 randconfig-001-20251014    gcc-15.1.0
sparc                 randconfig-002-20251014    gcc-10.5.0
sparc                 randconfig-002-20251014    gcc-15.1.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251014    clang-20
sparc64               randconfig-001-20251014    gcc-10.5.0
sparc64               randconfig-002-20251014    clang-22
sparc64               randconfig-002-20251014    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251014    gcc-10.5.0
um                    randconfig-001-20251014    gcc-14
um                    randconfig-002-20251014    gcc-10.5.0
um                    randconfig-002-20251014    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251014    gcc-14
x86_64      buildonly-randconfig-002-20251014    clang-20
x86_64      buildonly-randconfig-002-20251014    gcc-14
x86_64      buildonly-randconfig-003-20251014    gcc-14
x86_64      buildonly-randconfig-004-20251014    clang-20
x86_64      buildonly-randconfig-004-20251014    gcc-14
x86_64      buildonly-randconfig-005-20251014    clang-20
x86_64      buildonly-randconfig-005-20251014    gcc-14
x86_64      buildonly-randconfig-006-20251014    gcc-14
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251014    gcc-14
x86_64                randconfig-002-20251014    gcc-14
x86_64                randconfig-003-20251014    gcc-14
x86_64                randconfig-004-20251014    gcc-14
x86_64                randconfig-005-20251014    gcc-14
x86_64                randconfig-006-20251014    gcc-14
x86_64                randconfig-007-20251014    gcc-14
x86_64                randconfig-008-20251014    gcc-14
x86_64                randconfig-071-20251014    gcc-14
x86_64                randconfig-072-20251014    gcc-14
x86_64                randconfig-073-20251014    gcc-14
x86_64                randconfig-074-20251014    gcc-14
x86_64                randconfig-075-20251014    gcc-14
x86_64                randconfig-076-20251014    gcc-14
x86_64                randconfig-077-20251014    gcc-14
x86_64                randconfig-078-20251014    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251014    gcc-10.5.0
xtensa                randconfig-001-20251014    gcc-8.5.0
xtensa                randconfig-002-20251014    gcc-10.5.0
xtensa                randconfig-002-20251014    gcc-8.5.0
xtensa                         virt_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

