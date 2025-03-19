Return-Path: <linux-gpio+bounces-17777-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E3AA689DE
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Mar 2025 11:45:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A4653BCCC9
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Mar 2025 10:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38D125486D;
	Wed, 19 Mar 2025 10:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLt18ig+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F6B1F8756
	for <linux-gpio@vger.kernel.org>; Wed, 19 Mar 2025 10:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742381110; cv=none; b=Lugzgs78FWYOTf2h+UbjYmDkm0O4rjs29rmPKuqMvi7bxOPLP4rBdVSe+t+2kTTqtf3QccrUhYr9BxvKpud7tcGJEgH2zv9dMxcI1HwhLSXzlgWCtAo0qfeg6tLz7Ec3daAgNyv+tYoqoNAAlJGGwndOZzd2q61lllYzO7tzm58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742381110; c=relaxed/simple;
	bh=S8vGshdn8RRbsZYn6J9oF2c66aklH17RHpt39QvXbN8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VpLpswkpqMmp6y+UAgJCYKud4id9v3v3VpRUaGyqq6V/4atYlXukeyv4QlDFjeE1x3kA2IQSr2NuiTtKrFD7KvtzGliSQDT8jqIQ/5Kg1fV/69nPWu91/sUWAPLa1LsWkauZ6BNsEOj47/ZKzdGI1zypVOH5r3DNe1qo7dN30Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLt18ig+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742381108; x=1773917108;
  h=date:from:to:cc:subject:message-id;
  bh=S8vGshdn8RRbsZYn6J9oF2c66aklH17RHpt39QvXbN8=;
  b=iLt18ig+EboSfc1H347TIIUr4iztAo4Kavy3DfWZ8WwaGmqPYds0dD8t
   Z+pH2C5xeWsukSJsr7wFAmCndZiJlpgfrj/hpTpMbFK2bx7hUzjTFf4as
   AWKdFl9LhqCndtoxIDMtaM8VgZcPxH8LOWz8/MC22iM03LUrIrPdFBGqi
   71tF7dPc2WYQVfJjZKe+bkH1pJWinolfQMP0GmQbQvKf04URkYCct0Cvu
   2ocophghR/MP3eDDeNckjLtqVjZdvJWHcg4hd0JBT0Luvcq5WKp/lOINr
   ynhEysRmolx43OdBd+We5FHNJFpZbCm91r+IEUfNS717fECg1eu1q+9Wq
   Q==;
X-CSE-ConnectionGUID: iyg/TtqXT4SS7dpLLxvVqA==
X-CSE-MsgGUID: DkVHBwfESGidBv8fcTZ4Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43483244"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="43483244"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 03:45:06 -0700
X-CSE-ConnectionGUID: 6dMDklN1Ri+v7BTeJIZtIA==
X-CSE-MsgGUID: MZKahlTQSoqmTRy2emdd0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="123317949"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 19 Mar 2025 03:45:05 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuqv0-000Ebp-2w;
	Wed, 19 Mar 2025 10:45:02 +0000
Date: Wed, 19 Mar 2025 18:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 8bbdb4baf4292bb5d6e2320bd2809da6ba51db78
Message-ID: <202503191820.RVKd10uh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 8bbdb4baf4292bb5d6e2320bd2809da6ba51db78  Merge branch 'devel' into for-next

elapsed time: 1445m

configs tested: 124
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-9.3.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-13.3.0
arc                              allyesconfig    gcc-10.5.0
arc                   randconfig-001-20250318    gcc-8.5.0
arc                   randconfig-002-20250318    gcc-8.5.0
arm                              allmodconfig    gcc-13.3.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          pxa910_defconfig    gcc-8.5.0
arm                   randconfig-001-20250318    gcc-14.2.0
arm                   randconfig-002-20250318    clang-21
arm                   randconfig-003-20250318    gcc-14.2.0
arm                   randconfig-004-20250318    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-8.5.0
arm64                 randconfig-001-20250318    clang-21
arm64                 randconfig-002-20250318    clang-14
arm64                 randconfig-003-20250318    gcc-13.3.0
arm64                 randconfig-004-20250318    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250318    gcc-14.2.0
csky                  randconfig-002-20250318    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250318    clang-21
hexagon               randconfig-002-20250318    clang-17
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250318    clang-20
i386        buildonly-randconfig-002-20250318    clang-20
i386        buildonly-randconfig-003-20250318    clang-20
i386        buildonly-randconfig-004-20250318    clang-20
i386        buildonly-randconfig-005-20250318    clang-20
i386        buildonly-randconfig-006-20250318    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250318    gcc-14.2.0
loongarch             randconfig-002-20250318    gcc-14.2.0
m68k                             allmodconfig    gcc-8.5.0
m68k                              allnoconfig    gcc-5.5.0
m68k                             allyesconfig    gcc-6.5.0
m68k                          hp300_defconfig    gcc-8.5.0
m68k                        mvme147_defconfig    gcc-5.5.0
microblaze                       allmodconfig    gcc-9.3.0
microblaze                        allnoconfig    gcc-11.5.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-10.5.0
mips                           ip27_defconfig    gcc-11.5.0
mips                        qi_lb60_defconfig    clang-21
nios2                             allnoconfig    gcc-8.5.0
nios2                 randconfig-001-20250318    gcc-9.3.0
nios2                 randconfig-002-20250318    gcc-5.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                  or1klitex_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-5.5.0
parisc                            allnoconfig    gcc-5.5.0
parisc                           allyesconfig    gcc-9.3.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250318    gcc-8.5.0
parisc                randconfig-002-20250318    gcc-14.2.0
powerpc                          allmodconfig    gcc-10.5.0
powerpc                           allnoconfig    gcc-8.5.0
powerpc                          allyesconfig    clang-21
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc               randconfig-001-20250318    clang-21
powerpc               randconfig-002-20250318    clang-21
powerpc               randconfig-003-20250318    gcc-14.2.0
powerpc64             randconfig-001-20250318    clang-21
powerpc64             randconfig-002-20250318    gcc-14.2.0
powerpc64             randconfig-003-20250318    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-7.5.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250318    clang-21
riscv                 randconfig-002-20250318    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-13.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250318    clang-15
s390                  randconfig-002-20250318    gcc-12.4.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-10.5.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-11.5.0
sh                    randconfig-001-20250318    gcc-14.2.0
sh                    randconfig-002-20250318    gcc-7.5.0
sh                           se7780_defconfig    gcc-7.5.0
sh                           sh2007_defconfig    gcc-9.3.0
sparc                            allmodconfig    gcc-6.5.0
sparc                             allnoconfig    gcc-6.5.0
sparc                 randconfig-001-20250318    gcc-14.2.0
sparc                 randconfig-002-20250318    gcc-14.2.0
sparc64                             defconfig    gcc-10.5.0
sparc64               randconfig-001-20250318    gcc-11.5.0
sparc64               randconfig-002-20250318    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250318    clang-21
um                    randconfig-002-20250318    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250318    clang-20
x86_64      buildonly-randconfig-002-20250318    clang-20
x86_64      buildonly-randconfig-003-20250318    clang-20
x86_64      buildonly-randconfig-004-20250318    clang-20
x86_64      buildonly-randconfig-005-20250318    gcc-12
x86_64      buildonly-randconfig-006-20250318    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250318    gcc-14.2.0
xtensa                randconfig-002-20250318    gcc-7.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

