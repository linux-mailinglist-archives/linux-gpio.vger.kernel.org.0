Return-Path: <linux-gpio+bounces-12809-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 642689C3943
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 08:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21DC8280C7D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 07:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EB315DBAE;
	Mon, 11 Nov 2024 07:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOLIqZtp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEDF15B97E
	for <linux-gpio@vger.kernel.org>; Mon, 11 Nov 2024 07:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731311452; cv=none; b=d7U+8mgg/7UB/xPZdWt4cOKHzLxPAIDa19+24K8hb8XMBaRbseouWcvQEheqG88oOZa7xX84O3gzINCD0sZi7GcLwVZK6dY6zxfkOT5QSnCoVNai19OAmWVpQUKmF5QrtPpPQq9ahwOyxOn6cpws/JFCPQbGW4dzMFhqsONCS9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731311452; c=relaxed/simple;
	bh=avuZHYQvHMv1g1sHP0i05NUGGoenw8x7CtGCoOJDkn8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sjqt8ePOTrWiBcJ+vZMnHejNZL790senau34cHY5gCPjWBT6bueWyeTlOU62Ya3Fm2gads3EUYUDkRqKrzvrxvG2GhsJL6qRSVRaKSquU0fJmH54/NWhgijR7sC1v326P6M29jIa3PNrb0O3AE5egZysuH5A43Part6QPYelma4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOLIqZtp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731311450; x=1762847450;
  h=date:from:to:cc:subject:message-id;
  bh=avuZHYQvHMv1g1sHP0i05NUGGoenw8x7CtGCoOJDkn8=;
  b=DOLIqZtpxayQMRPh7snHOChjLkvwio19SWac/Tk3Ls6S1CKV4Ujz8vxf
   h9KkWDKpcITj67QyWMfPaEI+DroXRFVKvv7t8hQEKnLSO+IHWQf3iElIQ
   5LEwTWJpq14bmRjiuN6gCCJogzLaSW8EXOcpJxqNfmQK+8gRCZ6vQTHx9
   b/gbhGre0l1bhf38tfG9oYVf7FCdjuQ4ZJwQAFZZVCYduuPOzp6dLMe2k
   uW9SvjPiR9MUfxX7FMHbZL+H33EeiTjICdwZo0Uh9RvWFFG85DaMKzfXF
   Weyid9n/RVbgehIGHEa94IgIgt4BbB8dC6eYPUPB0dmUd21dNtS/2tlAH
   A==;
X-CSE-ConnectionGUID: L5NAKNOPToGEsFzRG/e1vQ==
X-CSE-MsgGUID: oK/ua6EOSii0f6GrFXv+vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="31329961"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="31329961"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 23:50:50 -0800
X-CSE-ConnectionGUID: OPT3ZwXiTJuphhWIhSh5jg==
X-CSE-MsgGUID: yG8SmWZqT0+kBFRuFdI6Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86380511"
Received: from lkp-server01.sh.intel.com (HELO dc8184e5aea1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Nov 2024 23:50:48 -0800
Received: from kbuild by dc8184e5aea1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAPCA-00005p-2S;
	Mon, 11 Nov 2024 07:50:46 +0000
Date: Mon, 11 Nov 2024 15:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 10287f0f9ee91f75a60ec1b19d962f459b18f589
Message-ID: <202411111504.UFAfpR3b-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 10287f0f9ee91f75a60ec1b19d962f459b18f589  MAINTAINERS: add gpio driver to PolarFire entry

elapsed time: 722m

configs tested: 145
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                          axs101_defconfig    clang-14
arc                          axs103_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                          ep93xx_defconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-14
arm                         lpc32xx_defconfig    clang-14
arm                        multi_v5_defconfig    clang-14
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241111    gcc-11
i386        buildonly-randconfig-002-20241111    gcc-11
i386        buildonly-randconfig-003-20241111    gcc-11
i386        buildonly-randconfig-004-20241111    gcc-11
i386        buildonly-randconfig-005-20241111    gcc-11
i386        buildonly-randconfig-006-20241111    gcc-11
i386                                defconfig    clang-19
i386                  randconfig-001-20241111    gcc-11
i386                  randconfig-002-20241111    gcc-11
i386                  randconfig-003-20241111    gcc-11
i386                  randconfig-004-20241111    gcc-11
i386                  randconfig-005-20241111    gcc-11
i386                  randconfig-006-20241111    gcc-11
i386                  randconfig-011-20241111    gcc-11
i386                  randconfig-012-20241111    gcc-11
i386                  randconfig-013-20241111    gcc-11
i386                  randconfig-014-20241111    gcc-11
i386                  randconfig-015-20241111    gcc-11
i386                  randconfig-016-20241111    gcc-11
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-14
mips                        bcm63xx_defconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-14
mips                      maltaaprp_defconfig    clang-14
mips                      maltaaprp_defconfig    gcc-14.2.0
mips                        vocore2_defconfig    clang-14
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                         alldefconfig    clang-14
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     asp8347_defconfig    gcc-14.2.0
powerpc                   bluestone_defconfig    clang-14
powerpc                       ebony_defconfig    clang-14
powerpc                     ksi8560_defconfig    clang-14
powerpc                 mpc834x_itx_defconfig    gcc-14.2.0
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc                     tqm5200_defconfig    clang-14
powerpc                     tqm8540_defconfig    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                          lboxre2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241111    gcc-12
x86_64      buildonly-randconfig-002-20241111    gcc-12
x86_64      buildonly-randconfig-003-20241111    gcc-12
x86_64      buildonly-randconfig-004-20241111    gcc-12
x86_64      buildonly-randconfig-005-20241111    gcc-12
x86_64      buildonly-randconfig-006-20241111    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241111    gcc-12
x86_64                randconfig-002-20241111    gcc-12
x86_64                randconfig-003-20241111    gcc-12
x86_64                randconfig-004-20241111    gcc-12
x86_64                randconfig-005-20241111    gcc-12
x86_64                randconfig-006-20241111    gcc-12
x86_64                randconfig-011-20241111    gcc-12
x86_64                randconfig-012-20241111    gcc-12
x86_64                randconfig-013-20241111    gcc-12
x86_64                randconfig-014-20241111    gcc-12
x86_64                randconfig-015-20241111    gcc-12
x86_64                randconfig-016-20241111    gcc-12
x86_64                randconfig-071-20241111    gcc-12
x86_64                randconfig-072-20241111    gcc-12
x86_64                randconfig-073-20241111    gcc-12
x86_64                randconfig-074-20241111    gcc-12
x86_64                randconfig-075-20241111    gcc-12
x86_64                randconfig-076-20241111    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    clang-14
xtensa                  cadence_csp_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

