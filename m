Return-Path: <linux-gpio+bounces-24953-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B75EFB354FB
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 09:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E22D97A977B
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 07:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07861D5178;
	Tue, 26 Aug 2025 07:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VV+t8q/Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2704611713
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 07:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756191799; cv=none; b=q5n2Wa5am0MqGd1u6mIqbVFToXpquM2PbuAxfq7syYitbdno+R9U5RsXBG4+srVIFFf3VpB13yBZn1k5hnbtSMVOczY5BSzZh38WVek857ep3K4Lh7RbpTWmwbFzlzRk3IC5Ye24J36cv2KSbT3PprEnuq4xnS7LzbpQa+29fhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756191799; c=relaxed/simple;
	bh=Lu8uknp1uaa4V1z3akwo6VrSMojaeH+j5v7qX7DYQcE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VckkR8p4t6mLrg0AzJThXCblI+666Lop3FX9xfR+CKujv5YHx65rKwEmFkACFV3nvbhiFjpsFoQ6Eq3JETyxU3ljXMqzRPQ8hF7nioWMxYsl6ospAwtajmhtggg5D9CCDV0RtFsj2XKWqBhLmJ2SxefZOXLzI5T46h22UtWKnSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VV+t8q/Z; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756191798; x=1787727798;
  h=date:from:to:cc:subject:message-id;
  bh=Lu8uknp1uaa4V1z3akwo6VrSMojaeH+j5v7qX7DYQcE=;
  b=VV+t8q/ZBSrtM3tCQIs5FPcGakSGX9f/WhgfuN27b0XLANPj+XkMLgNR
   LAf1j3nz7osyF6AniWEheZ3j8npIiogBlxYeZigxwA6RTKOPz23RbWDIq
   EY4iwm1nhQGRZdJJf6mHLAL4MKrZkBikCOcVe07UZR7iEsCv1M6VANJxL
   hHg/BZwvCKskYmuUsLqTz18m2x6B5H0vZM+YQDKUuykbYdQ5swLt3sWZf
   4cF9MGmlqEyp+G8aT3F112BGEWDCSWQ6o2zNC5e5hrNn/h/y0qch/j0so
   7qu0qL9uNq/v3+Wf059s63Ez7F3FT9r3nm0YrAq5AQRRGsTebls/yzZI7
   w==;
X-CSE-ConnectionGUID: drJF6I5DTx2izdhbfJJ0vg==
X-CSE-MsgGUID: cWDJVB59TFmUvkoTPeTqkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58351465"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="58351465"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 00:03:17 -0700
X-CSE-ConnectionGUID: 4dRYoLxGTtij2eqdNYzaYg==
X-CSE-MsgGUID: lhgwlObpQcOPKLhdmszX3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="200449777"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2025 00:03:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqnhy-000OI3-2Q;
	Tue, 26 Aug 2025 07:03:06 +0000
Date: Tue, 26 Aug 2025 15:02:34 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 894751730a0d1674e43167b187e6605371667c8b
Message-ID: <202508261528.HTMjenlP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 894751730a0d1674e43167b187e6605371667c8b  dt-bindings: pinctrl: qcom,sc7280-lpass-lpi-pinctrl: Document the clock property

elapsed time: 1035m

configs tested: 203
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                      axs103_smp_defconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250825    gcc-8.5.0
arc                   randconfig-001-20250826    gcc-8.5.0
arc                   randconfig-002-20250825    gcc-12.5.0
arc                   randconfig-002-20250826    gcc-8.5.0
arm                              alldefconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                   milbeaut_m10v_defconfig    gcc-15.1.0
arm                   randconfig-001-20250825    gcc-12.5.0
arm                   randconfig-001-20250826    gcc-8.5.0
arm                   randconfig-002-20250825    gcc-13.4.0
arm                   randconfig-002-20250826    gcc-8.5.0
arm                   randconfig-003-20250825    gcc-8.5.0
arm                   randconfig-003-20250826    gcc-8.5.0
arm                   randconfig-004-20250825    clang-22
arm                   randconfig-004-20250826    gcc-8.5.0
arm                       versatile_defconfig    gcc-15.1.0
arm                        vexpress_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250825    gcc-8.5.0
arm64                 randconfig-001-20250826    gcc-8.5.0
arm64                 randconfig-002-20250825    gcc-8.5.0
arm64                 randconfig-002-20250826    gcc-8.5.0
arm64                 randconfig-003-20250825    clang-22
arm64                 randconfig-003-20250826    gcc-8.5.0
arm64                 randconfig-004-20250825    clang-22
arm64                 randconfig-004-20250826    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250825    gcc-12.5.0
csky                  randconfig-001-20250826    gcc-14.3.0
csky                  randconfig-002-20250825    gcc-11.5.0
csky                  randconfig-002-20250826    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250825    clang-18
hexagon               randconfig-001-20250826    gcc-14.3.0
hexagon               randconfig-002-20250825    clang-22
hexagon               randconfig-002-20250826    gcc-14.3.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250825    gcc-12
i386        buildonly-randconfig-002-20250825    clang-20
i386        buildonly-randconfig-003-20250825    clang-20
i386        buildonly-randconfig-004-20250825    gcc-12
i386        buildonly-randconfig-005-20250825    gcc-12
i386        buildonly-randconfig-006-20250825    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250826    gcc-11
i386                  randconfig-002-20250826    gcc-11
i386                  randconfig-003-20250826    gcc-11
i386                  randconfig-004-20250826    gcc-11
i386                  randconfig-005-20250826    gcc-11
i386                  randconfig-006-20250826    gcc-11
i386                  randconfig-007-20250826    gcc-11
i386                  randconfig-011-20250826    gcc-12
i386                  randconfig-012-20250826    gcc-12
i386                  randconfig-013-20250826    gcc-12
i386                  randconfig-014-20250826    gcc-12
i386                  randconfig-015-20250826    gcc-12
i386                  randconfig-016-20250826    gcc-12
i386                  randconfig-017-20250826    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250825    gcc-12.5.0
loongarch             randconfig-001-20250826    gcc-14.3.0
loongarch             randconfig-002-20250825    clang-18
loongarch             randconfig-002-20250826    gcc-14.3.0
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
mips                           ip30_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250825    gcc-8.5.0
nios2                 randconfig-001-20250826    gcc-14.3.0
nios2                 randconfig-002-20250825    gcc-9.5.0
nios2                 randconfig-002-20250826    gcc-14.3.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250825    gcc-8.5.0
parisc                randconfig-001-20250826    gcc-14.3.0
parisc                randconfig-002-20250825    gcc-9.5.0
parisc                randconfig-002-20250826    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250825    clang-22
powerpc               randconfig-001-20250826    gcc-14.3.0
powerpc               randconfig-002-20250825    clang-22
powerpc               randconfig-002-20250826    gcc-14.3.0
powerpc               randconfig-003-20250825    clang-22
powerpc               randconfig-003-20250826    gcc-14.3.0
powerpc                      tqm8xx_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250825    gcc-13.4.0
powerpc64             randconfig-001-20250826    gcc-14.3.0
powerpc64             randconfig-002-20250825    gcc-15.1.0
powerpc64             randconfig-002-20250826    gcc-14.3.0
powerpc64             randconfig-003-20250825    clang-20
powerpc64             randconfig-003-20250826    gcc-14.3.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250825    clang-18
riscv                 randconfig-002-20250825    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250825    gcc-12.5.0
s390                  randconfig-002-20250825    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250825    gcc-14.3.0
sh                    randconfig-002-20250825    gcc-13.4.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250825    gcc-15.1.0
sparc                 randconfig-002-20250825    gcc-14.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250825    clang-22
sparc64               randconfig-002-20250825    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250825    clang-22
um                    randconfig-002-20250825    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250825    clang-20
x86_64      buildonly-randconfig-002-20250825    gcc-12
x86_64      buildonly-randconfig-003-20250825    gcc-12
x86_64      buildonly-randconfig-004-20250825    clang-20
x86_64      buildonly-randconfig-005-20250825    clang-20
x86_64      buildonly-randconfig-006-20250825    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                randconfig-001-20250826    gcc-12
x86_64                randconfig-002-20250826    gcc-12
x86_64                randconfig-003-20250826    gcc-12
x86_64                randconfig-004-20250826    gcc-12
x86_64                randconfig-005-20250826    gcc-12
x86_64                randconfig-006-20250826    gcc-12
x86_64                randconfig-007-20250826    gcc-12
x86_64                randconfig-008-20250826    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250825    gcc-8.5.0
xtensa                randconfig-002-20250825    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

