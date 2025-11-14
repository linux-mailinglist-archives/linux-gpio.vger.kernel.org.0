Return-Path: <linux-gpio+bounces-28463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F87C5BA78
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 08:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 84BAC4F4041
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 06:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1132D7818;
	Fri, 14 Nov 2025 06:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILyfmDHl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743D22F5A24
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 06:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763103364; cv=none; b=Zl4dvHxl6ZichVIPLQPhlaGVc/cqjigymI8TAZrqsaMLlD+xi/pfjnIB2Zu3fOGsKqMutzTUf0oEuBiT1snZEgP5/yT7v0FfjBOEaEqOjcP5IG87eC9Glv/Q4lbBNiUignpPhg4r0Rcbn2fOEicOShvoSWmS7hpxX/mjwUkQo0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763103364; c=relaxed/simple;
	bh=IZsRKVPtBc1cejbJrxsd9TAzUfLKPpiBpL3lWTn1tZU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HEQuYCTSDc1BCTDqK+OLvfpk8n2R/wwn7pxB0mR7tMwtVao0oVBvUUZgvX2ZlRdJkH+NdId5Cf5rlRLEQVH6aHevjCqnLbPsXzWua7FDb9CH0noDvevkj9vfKQ8SXeuHrv5186JW8PEKoNygyeNDZLBz7f5eY6iVWciLyJzi6p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILyfmDHl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763103363; x=1794639363;
  h=date:from:to:cc:subject:message-id;
  bh=IZsRKVPtBc1cejbJrxsd9TAzUfLKPpiBpL3lWTn1tZU=;
  b=ILyfmDHlcj/KjRrbCGA0H62Wk96KtsGBjiio7YmvnieX3g8LsiPlQdTv
   z0+CIuLRVxfHg6zIrEeeKT9scmUKCSNgfZOXkhfCMXsALz2dAb8ZQvBn4
   amB9Daj6mbb8/c9+rIEpY/EjVVpvXGEY0QvRTrwpfclgiqT19Va9neU82
   /IEq0LdGMiJ1FUTj5K7+u/skCgmiVeUUAh0WVHWp8iVn6jt3CLoK42end
   P96sjn6j88SDOskWXEJuDmlT9zTmMKp06lNsItXmf96jzygG6e1JvIMTZ
   ZfuO4UYkIZNh9wGgtJM53trnRVcfWZ23LF6NR8ENiXnY5kIgXXMCABHUX
   Q==;
X-CSE-ConnectionGUID: n5A2ngqiQMaRixKn43oqNQ==
X-CSE-MsgGUID: bo/Om4NgQUCC4hZtj4DikA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="69061568"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="69061568"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:56:02 -0800
X-CSE-ConnectionGUID: KGEopfvCQq2ulTLQrH9ccA==
X-CSE-MsgGUID: mv1Rnu/AQESP4mPJGkmM+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="194845198"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Nov 2025 22:56:01 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJniw-0006Gp-1o;
	Fri, 14 Nov 2025 06:55:58 +0000
Date: Fri, 14 Nov 2025 14:54:59 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 1c2e70397b4125022dba80f6111271a37fb36bae
Message-ID: <202511141453.UQGJaNgd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 1c2e70397b4125022dba80f6111271a37fb36bae  pinctrl: qcom: msm: Fix deadlock in pinmux configuration

elapsed time: 1867m

configs tested: 106
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251113    gcc-8.5.0
arc                   randconfig-002-20251113    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                           h3600_defconfig    gcc-15.1.0
arm                   randconfig-001-20251113    gcc-10.5.0
arm                   randconfig-002-20251113    clang-22
arm                   randconfig-003-20251113    clang-22
arm                   randconfig-004-20251113    clang-22
arm                           sama7_defconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251114    gcc-8.5.0
arm64                 randconfig-002-20251114    clang-22
arm64                 randconfig-003-20251114    clang-22
arm64                 randconfig-004-20251114    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251114    gcc-10.5.0
csky                  randconfig-002-20251114    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251114    clang-22
hexagon               randconfig-002-20251114    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251114    gcc-14
i386        buildonly-randconfig-003-20251114    clang-20
i386        buildonly-randconfig-004-20251114    gcc-14
i386                  randconfig-011-20251114    gcc-12
i386                  randconfig-012-20251114    gcc-14
i386                  randconfig-013-20251114    gcc-14
i386                  randconfig-014-20251114    clang-20
i386                  randconfig-015-20251114    gcc-14
i386                  randconfig-016-20251114    gcc-14
i386                  randconfig-017-20251114    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251114    clang-18
loongarch             randconfig-002-20251114    clang-22
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        mvme147_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           xway_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251114    gcc-10.5.0
nios2                 randconfig-002-20251114    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251114    gcc-12.5.0
parisc                randconfig-002-20251114    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                        icon_defconfig    gcc-15.1.0
powerpc                 mpc8313_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251114    clang-17
powerpc               randconfig-002-20251114    clang-22
powerpc                     tqm8560_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251114    gcc-8.5.0
powerpc64             randconfig-002-20251114    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251114    gcc-13.4.0
riscv                 randconfig-002-20251114    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251114    gcc-8.5.0
s390                  randconfig-002-20251114    gcc-11.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251114    gcc-10.5.0
sh                    randconfig-002-20251114    gcc-15.1.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251114    gcc-14.3.0
sparc                 randconfig-002-20251114    gcc-12.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251114    gcc-8.5.0
sparc64               randconfig-002-20251114    gcc-14.3.0
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251114    gcc-13
um                    randconfig-002-20251114    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251114    clang-20
x86_64      buildonly-randconfig-002-20251114    gcc-14
x86_64      buildonly-randconfig-003-20251114    gcc-14
x86_64      buildonly-randconfig-004-20251114    clang-20
x86_64      buildonly-randconfig-005-20251114    clang-20
x86_64      buildonly-randconfig-006-20251114    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251114    clang-20
x86_64                randconfig-012-20251114    clang-20
x86_64                randconfig-013-20251114    gcc-13
x86_64                randconfig-014-20251114    clang-20
x86_64                randconfig-015-20251114    gcc-13
x86_64                randconfig-016-20251114    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251114    gcc-14.3.0
xtensa                randconfig-002-20251114    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

