Return-Path: <linux-gpio+bounces-10792-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A9B98F031
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 15:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4913328292D
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 13:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4008E19B5A7;
	Thu,  3 Oct 2024 13:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAJIHR9c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593C119B3ED
	for <linux-gpio@vger.kernel.org>; Thu,  3 Oct 2024 13:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727961586; cv=none; b=Wh4yHqHEReDyock2HGkP3dBHd7YMuxUU07Jyg7oOaIKJPE/8bO7WzhzDIVJ6rXyRs4YrkPd1RcB2f2H1fuds0dhY3svNu6Yq7DDIZArEFl7NvCtt3m2J365CGTtqXmmYv3Um3bYgb6qUaTllggQymQP0b55J6KBC95RvP2ROaR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727961586; c=relaxed/simple;
	bh=L/fUFM6UX0tB9SNiVrHmJhnNhbYt5sMNy25aas6GR2Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mEtCkdNDRAXqg/RpE5C70JC4oynfOrnY9Phz/8/umcIoEBkyPCsu8XI4rrqed9x543wNku29h3OkKCSes7xsoqKdA2VUgIjUjpc87OZVOt9537fHz4QyltNrMyQFrfGUmZ1N9ypMZ0S+vbsoEbR0HKchtF6eQVZpU77NR6JzU6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAJIHR9c; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727961584; x=1759497584;
  h=date:from:to:cc:subject:message-id;
  bh=L/fUFM6UX0tB9SNiVrHmJhnNhbYt5sMNy25aas6GR2Y=;
  b=dAJIHR9c3lFLiRScRao1PEjTaF7a7Bt3FizmVTOGb6hq9xh4EqTT/PWI
   r03wyux/9VeSKoxPoGyOAYHi0thIGtoiePqi9V6ascGEZAC4FwihWikbg
   zxqkQx9HhuJFKwgIC/YYT5VoTSQ827T/OwspZTfJucb8A1A0zu1V59b6T
   EOO8jS/6WOIIYo6DQRUW+d3XSYXXe1pTzNdWnY3x5iqDuk/uYJREwod3T
   UagHBqa4+Pbkl9nIljFUVgmU8KBGVIn/WSKgIajO35LdggrtiU67PzKMn
   6dHaPsa+jBA6Nmke8T74dOpPs7Qqgff6YbVaCOUrEjOqCnYjS2MZJJB/5
   g==;
X-CSE-ConnectionGUID: wawRFhOhRcmQKZEvcLIjJw==
X-CSE-MsgGUID: tZYlsRHvQjmHv4uDB8+9/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27028554"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27028554"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 06:11:33 -0700
X-CSE-ConnectionGUID: 7mhj4M0KTASJWLXZWLjfcQ==
X-CSE-MsgGUID: shkv3UpiSQCWzvLurszWzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74021631"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Oct 2024 06:11:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swLc8-0000Re-2N;
	Thu, 03 Oct 2024 13:11:28 +0000
Date: Thu, 03 Oct 2024 21:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/fix-imx-pc] BUILD SUCCESS
 beeec05a32b3f13629afb43bc55c057354c8be69
Message-ID: <202410032121.lfreKZ4X-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/fix-imx-pc
branch HEAD: beeec05a32b3f13629afb43bc55c057354c8be69  pinctrl: imx1: Fix too generic defines

elapsed time: 918m

configs tested: 172
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                          axs103_defconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arc                            hsdk_defconfig    gcc-14.1.0
arc                   randconfig-001-20241003    gcc-14.1.0
arc                   randconfig-002-20241003    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                        clps711x_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                         lpc18xx_defconfig    gcc-14.1.0
arm                         orion5x_defconfig    gcc-14.1.0
arm                   randconfig-001-20241003    gcc-14.1.0
arm                   randconfig-002-20241003    gcc-14.1.0
arm                   randconfig-003-20241003    gcc-14.1.0
arm                   randconfig-004-20241003    gcc-14.1.0
arm                        realview_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241003    gcc-14.1.0
arm64                 randconfig-002-20241003    gcc-14.1.0
arm64                 randconfig-003-20241003    gcc-14.1.0
arm64                 randconfig-004-20241003    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241003    gcc-14.1.0
csky                  randconfig-002-20241003    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241003    gcc-14.1.0
hexagon               randconfig-002-20241003    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241003    gcc-12
i386        buildonly-randconfig-002-20241003    gcc-12
i386        buildonly-randconfig-003-20241003    gcc-12
i386        buildonly-randconfig-004-20241003    gcc-12
i386        buildonly-randconfig-005-20241003    gcc-12
i386        buildonly-randconfig-006-20241003    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241003    gcc-12
i386                  randconfig-002-20241003    gcc-12
i386                  randconfig-003-20241003    gcc-12
i386                  randconfig-004-20241003    gcc-12
i386                  randconfig-005-20241003    gcc-12
i386                  randconfig-006-20241003    gcc-12
i386                  randconfig-011-20241003    gcc-12
i386                  randconfig-012-20241003    gcc-12
i386                  randconfig-013-20241003    gcc-12
i386                  randconfig-014-20241003    gcc-12
i386                  randconfig-015-20241003    gcc-12
i386                  randconfig-016-20241003    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241003    gcc-14.1.0
loongarch             randconfig-002-20241003    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5275evb_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm63xx_defconfig    gcc-14.1.0
mips                     loongson1b_defconfig    gcc-14.1.0
mips                        qi_lb60_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241003    gcc-14.1.0
nios2                 randconfig-002-20241003    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241003    gcc-14.1.0
parisc                randconfig-002-20241003    gcc-14.1.0
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                   currituck_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241003    gcc-14.1.0
powerpc               randconfig-002-20241003    gcc-14.1.0
powerpc               randconfig-003-20241003    gcc-14.1.0
powerpc64             randconfig-001-20241003    gcc-14.1.0
powerpc64             randconfig-002-20241003    gcc-14.1.0
powerpc64             randconfig-003-20241003    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241003    gcc-14.1.0
riscv                 randconfig-002-20241003    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                                defconfig    gcc-14.1.0
s390                  randconfig-001-20241003    gcc-14.1.0
s390                  randconfig-002-20241003    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          kfr2r09_defconfig    gcc-14.1.0
sh                    randconfig-001-20241003    gcc-14.1.0
sh                    randconfig-002-20241003    gcc-14.1.0
sh                           se7750_defconfig    gcc-14.1.0
sh                            shmin_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241003    gcc-14.1.0
sparc64               randconfig-002-20241003    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241003    gcc-14.1.0
um                    randconfig-002-20241003    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241003    clang-18
x86_64      buildonly-randconfig-002-20241003    clang-18
x86_64      buildonly-randconfig-003-20241003    clang-18
x86_64      buildonly-randconfig-004-20241003    clang-18
x86_64      buildonly-randconfig-005-20241003    clang-18
x86_64      buildonly-randconfig-006-20241003    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241003    clang-18
x86_64                randconfig-002-20241003    clang-18
x86_64                randconfig-003-20241003    clang-18
x86_64                randconfig-004-20241003    clang-18
x86_64                randconfig-005-20241003    clang-18
x86_64                randconfig-006-20241003    clang-18
x86_64                randconfig-011-20241003    clang-18
x86_64                randconfig-012-20241003    clang-18
x86_64                randconfig-013-20241003    clang-18
x86_64                randconfig-014-20241003    clang-18
x86_64                randconfig-015-20241003    clang-18
x86_64                randconfig-016-20241003    clang-18
x86_64                randconfig-071-20241003    clang-18
x86_64                randconfig-072-20241003    clang-18
x86_64                randconfig-073-20241003    clang-18
x86_64                randconfig-074-20241003    clang-18
x86_64                randconfig-075-20241003    clang-18
x86_64                randconfig-076-20241003    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241003    gcc-14.1.0
xtensa                randconfig-002-20241003    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

