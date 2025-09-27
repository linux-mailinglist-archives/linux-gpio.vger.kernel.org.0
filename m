Return-Path: <linux-gpio+bounces-26644-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 562B4BA5DF9
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Sep 2025 12:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00BD12A6B0F
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Sep 2025 10:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1525E2D9EFE;
	Sat, 27 Sep 2025 10:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3cHKdOd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C2919922D
	for <linux-gpio@vger.kernel.org>; Sat, 27 Sep 2025 10:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758970149; cv=none; b=rP1nmu8e7j8j6+O9jZkl66zsiB3Fkvy3f0FiA16CQz0aQ6A964C0gtb4YXHHcGk8nFh9ppVrdXQVsiLTKJgOusG3Tk6MMEJw3ixfGYMK94o2mcIsgce9vRrxxTyLgELg+x5xrerDU2osbjFtdsL0z9NYsfuJ+G0HdV/LXseJ8HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758970149; c=relaxed/simple;
	bh=hhWrTqUJtfzLTj0vwIqL+myvURMRk5KPnYX+6bpQJXs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iIIvssIRJkswQc5g1fXvXtlGrwg4Kd6kqvEa8DFaP+OPWTjd+cXHOhfev/oQE5BEjpfmS5HQgTPwJGENdm/xZ+7upfgfSFNlwnPHyiH16s6Ks6HfGy9HJFqr+X+0uzsxwBozemsrQw5TIpD9bB5NHE4qfV+8+xFDVNHKTIAul18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3cHKdOd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758970148; x=1790506148;
  h=date:from:to:cc:subject:message-id;
  bh=hhWrTqUJtfzLTj0vwIqL+myvURMRk5KPnYX+6bpQJXs=;
  b=K3cHKdOdhHS4j5IFVk4GgZQ7/iI4KOhKX2mlxS1SKGXC1utHi42SxG+H
   wGUifBYckd+TIQ+TtCWO7JF+VZwSf8EYEyG2jZjRQAMha24FLnKhPqwnh
   n+rzuWO48cjbBoeW6NH8CblaSQh6ROEB85Tmq/liZMrN9JNx+ezfIDJoH
   ppzu3eBw8hzSn97RixMDfi2xaEG3Lg23lbIYqcL6dMqn4XwAIlkXvXF4v
   AFv3VzWYYsOaDwsTADR6zI0OAVv/xpoDnF/vGVz4eQg6BIT+BJgqwJ7H7
   RNSfdYKqDkuHy+hriaMU6mH8vlEurlZo5rNDn7gqiRwtPchFW2+ECToLE
   A==;
X-CSE-ConnectionGUID: B+xN9IpxQLqKmuAUr77HEQ==
X-CSE-MsgGUID: k79tRSlSRjidAlnM+zzXXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61332756"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="61332756"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 03:49:07 -0700
X-CSE-ConnectionGUID: xFYkZ/79Q2+ReyHn7xzivQ==
X-CSE-MsgGUID: 4YjqJZfsTfOJTKETcJA6aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="176946144"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Sep 2025 03:49:06 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2SUA-0006zX-30;
	Sat, 27 Sep 2025 10:49:02 +0000
Date: Sat, 27 Sep 2025 18:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 bc061143637532c08d9fc657eec93fdc2588068e
Message-ID: <202509271801.cgsrNdIo-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: bc061143637532c08d9fc657eec93fdc2588068e  gpio: mpfs: fix setting gpio direction to output

elapsed time: 1467m

configs tested: 116
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                            hsdk_defconfig    gcc-15.1.0
arc                   randconfig-001-20250926    gcc-8.5.0
arc                   randconfig-002-20250926    gcc-9.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                       multi_v4t_defconfig    clang-16
arm                       netwinder_defconfig    gcc-15.1.0
arm                   randconfig-001-20250926    clang-22
arm                   randconfig-002-20250926    clang-17
arm                   randconfig-003-20250926    clang-22
arm                   randconfig-004-20250926    clang-22
arm                        realview_defconfig    clang-16
arm                         socfpga_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250926    gcc-8.5.0
arm64                 randconfig-002-20250926    gcc-12.5.0
arm64                 randconfig-003-20250926    gcc-9.5.0
arm64                 randconfig-004-20250926    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250926    gcc-15.1.0
csky                  randconfig-002-20250926    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250926    clang-22
hexagon               randconfig-002-20250926    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20250926    clang-20
i386        buildonly-randconfig-002-20250926    clang-20
i386        buildonly-randconfig-003-20250926    clang-20
i386        buildonly-randconfig-004-20250926    clang-20
i386        buildonly-randconfig-005-20250926    clang-20
i386        buildonly-randconfig-006-20250926    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250926    gcc-15.1.0
loongarch             randconfig-002-20250926    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250926    gcc-11.5.0
nios2                 randconfig-002-20250926    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250926    gcc-10.5.0
parisc                randconfig-002-20250926    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20250926    clang-22
powerpc               randconfig-002-20250926    clang-18
powerpc               randconfig-003-20250926    clang-22
powerpc64             randconfig-001-20250926    clang-22
powerpc64             randconfig-002-20250926    clang-16
powerpc64             randconfig-003-20250926    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250926    clang-22
riscv                 randconfig-002-20250926    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250926    clang-22
s390                  randconfig-002-20250926    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                        edosk7760_defconfig    gcc-15.1.0
sh                          kfr2r09_defconfig    gcc-15.1.0
sh                    randconfig-001-20250926    gcc-12.5.0
sh                    randconfig-002-20250926    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250926    gcc-14.3.0
sparc                 randconfig-002-20250926    gcc-15.1.0
sparc64               randconfig-001-20250926    gcc-12.5.0
sparc64               randconfig-002-20250926    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20250926    clang-22
um                    randconfig-002-20250926    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250926    clang-20
x86_64      buildonly-randconfig-002-20250926    clang-20
x86_64      buildonly-randconfig-003-20250926    gcc-14
x86_64      buildonly-randconfig-004-20250926    gcc-14
x86_64      buildonly-randconfig-005-20250926    gcc-14
x86_64      buildonly-randconfig-006-20250926    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250926    gcc-14.3.0
xtensa                randconfig-002-20250926    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

