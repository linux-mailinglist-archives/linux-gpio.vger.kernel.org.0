Return-Path: <linux-gpio+bounces-9999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2482976608
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2024 11:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C644284DB8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2024 09:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2FF319CC15;
	Thu, 12 Sep 2024 09:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lH/SBLF4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E1F19C554
	for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2024 09:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726134524; cv=none; b=aF2y9P6qTqh6GKGsaBcgjIx6BFjKn8HM35RiY2oaHblFQncvxweMzVI2QvFTnjOcrODloasMR/XDYFQ/kH8HNeV7dGzBtSuWLkc8FrpUzep5uLfQflpNdRMzmCcjJsm0qLgqpjMlD3GJXve5gKEVyKHKTkKq+6lBp+H8mYImQyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726134524; c=relaxed/simple;
	bh=6HPnKNo5+dFUwzw4fcJwxSPIoalcaFz/ZJHQThz0ufI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DdbcVKrX6j3ysB9SIEco9GIrEYXXwNCWKDW4hZz996dHRA92i1PK/1NXdqWvZR4cXK36sEfSgL75Pn8OxpLkw6hyV5pCerr9hqbeuBH/Qc3wrHavJPgUK1m0h5AWc7gaxR2n7lqv1i0yv6sidSRQKqakGuNc9RHmUOaFLvHdzcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lH/SBLF4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726134523; x=1757670523;
  h=date:from:to:cc:subject:message-id;
  bh=6HPnKNo5+dFUwzw4fcJwxSPIoalcaFz/ZJHQThz0ufI=;
  b=lH/SBLF4raH6jd1iV/v285inD4TeJH4ptLfu/1sVZd22ZKLwbBXoDd6x
   KXpbW9GVy6oWNd5g/HqqNgkliQ71iL8dTwgvTTkOrAzaCrlTVvUbDnOJJ
   Rd/4I1SsQbcDG+kL+j8we3CIVSZnTmrI9nXOEhUJlqsx0JiPIX7LWuduZ
   t9nUCZFYSPBrFvA0EYEeNOk3/D3GQGKtQOCX05IXO/SUsoNmYm3+AGZCQ
   GrMSrUHTnHBtFCFkk6CDhHNJHBbDB6XqYK5bCHQIzcpL/0+yaVsvzjQ9q
   vtv0sWXfmlpwWrRfmUpTqhv8DaiM/MpHQrL9fV4wOxHVDx3N3RS5eXxAx
   Q==;
X-CSE-ConnectionGUID: hiwrcmXVSvaIperzsaDgIA==
X-CSE-MsgGUID: cNTCiLLsT6OegU1qfiZKxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="42452595"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="42452595"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 02:48:42 -0700
X-CSE-ConnectionGUID: aOs6k5pHTeG8dwKuGB9JiQ==
X-CSE-MsgGUID: 6R4aQ0rqTH2vmjWwAedppQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="scan'208";a="67950959"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Sep 2024 02:48:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sogRK-0004mW-2v;
	Thu, 12 Sep 2024 09:48:38 +0000
Date: Thu, 12 Sep 2024 17:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 264c13114bd71ddfd7b25c7b94f6cda4587eca25
Message-ID: <202409121721.uVeQvDil-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 264c13114bd71ddfd7b25c7b94f6cda4587eca25  Merge tag 'intel-pinctrl-v6.12-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel

elapsed time: 1470m

configs tested: 119
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240912   gcc-13.2.0
arc                   randconfig-002-20240912   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                   randconfig-001-20240912   gcc-14.1.0
arm                   randconfig-002-20240912   clang-20
arm                   randconfig-003-20240912   gcc-14.1.0
arm                   randconfig-004-20240912   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240912   clang-20
arm64                 randconfig-002-20240912   clang-20
arm64                 randconfig-003-20240912   gcc-14.1.0
arm64                 randconfig-004-20240912   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240912   gcc-14.1.0
csky                  randconfig-002-20240912   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240912   clang-20
hexagon               randconfig-002-20240912   clang-20
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240912   gcc-12
i386         buildonly-randconfig-002-20240912   gcc-11
i386         buildonly-randconfig-003-20240912   gcc-12
i386         buildonly-randconfig-004-20240912   clang-18
i386         buildonly-randconfig-005-20240912   gcc-12
i386         buildonly-randconfig-006-20240912   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240912   gcc-12
i386                  randconfig-002-20240912   gcc-12
i386                  randconfig-003-20240912   gcc-11
i386                  randconfig-004-20240912   gcc-12
i386                  randconfig-005-20240912   clang-18
i386                  randconfig-006-20240912   clang-18
i386                  randconfig-011-20240912   clang-18
i386                  randconfig-012-20240912   gcc-12
i386                  randconfig-013-20240912   gcc-12
i386                  randconfig-014-20240912   gcc-12
i386                  randconfig-015-20240912   clang-18
i386                  randconfig-016-20240912   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240912   gcc-14.1.0
loongarch             randconfig-002-20240912   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240912   gcc-14.1.0
nios2                 randconfig-002-20240912   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240912   gcc-14.1.0
parisc                randconfig-002-20240912   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc               randconfig-001-20240912   clang-20
powerpc               randconfig-002-20240912   gcc-14.1.0
powerpc               randconfig-003-20240912   clang-20
powerpc64             randconfig-001-20240912   clang-14
powerpc64             randconfig-002-20240912   clang-20
powerpc64             randconfig-003-20240912   clang-16
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240912   gcc-14.1.0
riscv                 randconfig-002-20240912   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240912   clang-20
s390                  randconfig-002-20240912   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240912   gcc-14.1.0
sh                    randconfig-002-20240912   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240912   gcc-14.1.0
sparc64               randconfig-002-20240912   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240912   gcc-12
um                    randconfig-002-20240912   gcc-12
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240912   gcc-14.1.0
xtensa                randconfig-002-20240912   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

