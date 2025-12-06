Return-Path: <linux-gpio+bounces-29321-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BFDCAA41C
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Dec 2025 11:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84CF9300CBA8
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Dec 2025 10:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02CD2E5402;
	Sat,  6 Dec 2025 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVM4uFo+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754A9225775
	for <linux-gpio@vger.kernel.org>; Sat,  6 Dec 2025 10:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765016575; cv=none; b=Wo+gZzp5HXPNCxr4RhgH3t/hTPjFXV6CoAxdD3LgVVowOv2ruelKXXszZp9xqwm2UZB9lSKJC2rlE498z9MVjB1lKy4e9/I09DL/w07Vn6Tyii9ILUS6yNJ198SGkO+0+TTCf/9E2X6qfLSh9cTvnu77jxUBm1ktvL310RPnXBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765016575; c=relaxed/simple;
	bh=FMqCuOFuio1+IKigjmiaD3d422UyXkYAs1ZhcoVPcVg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ezM/JS/RjSdbd9YToX7M5dcGWou2kZYKY4hVWeOeAs4BMtgU7+uo3HJ8uJtccYhCBhm9mNeVvRJtymLaADsEA3Lf6OytZnbiWpuBlX5wc4UfJSFVGIE04XgzUhLpbsqoP7y0CVG9eiZNDXEjYZ4VGMC0KMdy415L+IMr7mXQqe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVM4uFo+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765016574; x=1796552574;
  h=date:from:to:cc:subject:message-id;
  bh=FMqCuOFuio1+IKigjmiaD3d422UyXkYAs1ZhcoVPcVg=;
  b=MVM4uFo+TdGV45agAuAVXf2/7dMOvQhyTak7TboXvGeLgHrDTizEgeOk
   k+17WOWljgTXlndPUQxzGDvI31i4Lj70xcMVUlGaeDNQvcKuR1YLvUO23
   kWIK3CtDo4sDSVCVBvGX7GBBKmSrOgCkp7jVtF1XfvRYw1MlLFc7Kzv5Y
   4ee5Sc69rWAIl+ErNYmfd8ywHVQ0Q93jsfEZVVfbfAQedtK5swWEM61y9
   bxdAImjUJirXUcPFjcvYd0ZB8fBkPzH/Nhv+SIDVuuo4Yuh8ekYoW0Kuw
   JwZ2et3RJqs06U2KpRHr6h9sKmCF9mk78XdhmSF2TowccSsEwt388kJkF
   g==;
X-CSE-ConnectionGUID: 8wkUeLTnQiaR2fL4adg2lQ==
X-CSE-MsgGUID: OJzENdjmRhO1f7rPbq/rUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="77659619"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="77659619"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 02:22:53 -0800
X-CSE-ConnectionGUID: GoQeU0WgSLOt0TOH3uriYw==
X-CSE-MsgGUID: zlnNm+IWRx+rWsGFeetqaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="200431365"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Dec 2025 02:22:51 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRpRB-00000000G57-2qD4;
	Sat, 06 Dec 2025 10:22:49 +0000
Date: Sat, 06 Dec 2025 18:22:16 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 db9c67bfca8585bb7f00f289056e7b83502861c8
Message-ID: <202512061810.C2fOw5s5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: db9c67bfca8585bb7f00f289056e7b83502861c8  gpio: qixis: select CONFIG_REGMAP_MMIO

elapsed time: 1463m

configs tested: 228
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                      axs103_smp_defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                     haps_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20251206    clang-16
arc                   randconfig-001-20251206    gcc-8.5.0
arc                   randconfig-002-20251206    clang-16
arc                   randconfig-002-20251206    gcc-14.3.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20251206    clang-16
arm                   randconfig-001-20251206    clang-22
arm                   randconfig-002-20251206    clang-16
arm                   randconfig-002-20251206    clang-22
arm                   randconfig-003-20251206    clang-16
arm                   randconfig-004-20251206    clang-16
arm                   randconfig-004-20251206    clang-20
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251206    clang-22
arm64                 randconfig-002-20251206    clang-22
arm64                 randconfig-003-20251206    clang-22
arm64                 randconfig-004-20251206    clang-22
csky                             alldefconfig    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251206    clang-22
csky                  randconfig-002-20251206    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251206    clang-16
hexagon               randconfig-001-20251206    gcc-15.1.0
hexagon               randconfig-002-20251206    clang-22
hexagon               randconfig-002-20251206    gcc-15.1.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251206    clang-20
i386        buildonly-randconfig-001-20251206    gcc-14
i386        buildonly-randconfig-002-20251206    clang-20
i386        buildonly-randconfig-002-20251206    gcc-14
i386        buildonly-randconfig-003-20251206    clang-20
i386        buildonly-randconfig-004-20251206    clang-20
i386        buildonly-randconfig-005-20251206    clang-20
i386        buildonly-randconfig-006-20251206    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251206    gcc-14
i386                  randconfig-002-20251206    gcc-14
i386                  randconfig-003-20251206    gcc-14
i386                  randconfig-004-20251206    gcc-14
i386                  randconfig-005-20251206    gcc-14
i386                  randconfig-006-20251206    gcc-14
i386                  randconfig-007-20251206    gcc-14
i386                  randconfig-011-20251206    clang-20
i386                  randconfig-012-20251206    gcc-14
i386                  randconfig-013-20251206    gcc-14
i386                  randconfig-014-20251206    clang-20
i386                  randconfig-015-20251206    clang-20
i386                  randconfig-016-20251206    gcc-14
i386                  randconfig-017-20251206    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251206    gcc-15.1.0
loongarch             randconfig-002-20251206    gcc-12.5.0
loongarch             randconfig-002-20251206    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                           xway_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251206    gcc-15.1.0
nios2                 randconfig-001-20251206    gcc-8.5.0
nios2                 randconfig-002-20251206    gcc-15.1.0
nios2                 randconfig-002-20251206    gcc-8.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251206    clang-22
parisc                randconfig-001-20251206    gcc-11.5.0
parisc                randconfig-002-20251206    clang-22
parisc                randconfig-002-20251206    gcc-15.1.0
parisc64                            defconfig    clang-19
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     rainier_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251206    clang-22
powerpc               randconfig-001-20251206    gcc-11.5.0
powerpc               randconfig-002-20251206    clang-22
powerpc64             randconfig-001-20251206    clang-22
powerpc64             randconfig-001-20251206    gcc-15.1.0
powerpc64             randconfig-002-20251206    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251206    clang-22
riscv                 randconfig-002-20251206    clang-19
riscv                 randconfig-002-20251206    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251206    clang-22
s390                  randconfig-002-20251206    clang-22
s390                  randconfig-002-20251206    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251206    clang-22
sh                    randconfig-001-20251206    gcc-15.1.0
sh                    randconfig-002-20251206    clang-22
sh                    randconfig-002-20251206    gcc-15.1.0
sh                           se7780_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251206    gcc-14
sparc                 randconfig-002-20251206    gcc-14
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251206    gcc-14
sparc64               randconfig-002-20251206    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251206    gcc-14
um                    randconfig-002-20251206    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251206    clang-20
x86_64      buildonly-randconfig-001-20251206    gcc-14
x86_64      buildonly-randconfig-002-20251206    gcc-14
x86_64      buildonly-randconfig-003-20251206    clang-20
x86_64      buildonly-randconfig-003-20251206    gcc-14
x86_64      buildonly-randconfig-004-20251206    clang-20
x86_64      buildonly-randconfig-004-20251206    gcc-14
x86_64      buildonly-randconfig-005-20251206    gcc-13
x86_64      buildonly-randconfig-005-20251206    gcc-14
x86_64      buildonly-randconfig-006-20251206    clang-20
x86_64      buildonly-randconfig-006-20251206    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251206    clang-20
x86_64                randconfig-001-20251206    gcc-14
x86_64                randconfig-002-20251206    gcc-14
x86_64                randconfig-003-20251206    gcc-14
x86_64                randconfig-004-20251206    gcc-14
x86_64                randconfig-005-20251206    gcc-14
x86_64                randconfig-006-20251206    gcc-14
x86_64                randconfig-011-20251206    clang-20
x86_64                randconfig-011-20251206    gcc-14
x86_64                randconfig-012-20251206    clang-20
x86_64                randconfig-013-20251206    clang-20
x86_64                randconfig-013-20251206    gcc-14
x86_64                randconfig-014-20251206    clang-20
x86_64                randconfig-015-20251206    clang-20
x86_64                randconfig-016-20251206    clang-20
x86_64                randconfig-071-20251206    clang-20
x86_64                randconfig-071-20251206    gcc-14
x86_64                randconfig-072-20251206    clang-20
x86_64                randconfig-072-20251206    gcc-14
x86_64                randconfig-073-20251206    gcc-14
x86_64                randconfig-074-20251206    gcc-14
x86_64                randconfig-075-20251206    gcc-14
x86_64                randconfig-076-20251206    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251206    gcc-14
xtensa                randconfig-002-20251206    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

