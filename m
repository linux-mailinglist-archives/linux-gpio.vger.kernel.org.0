Return-Path: <linux-gpio+bounces-23520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DE5B0B397
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 07:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A20EE3BFC05
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 05:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B34B19994F;
	Sun, 20 Jul 2025 05:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdaAcT3K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6727A937
	for <linux-gpio@vger.kernel.org>; Sun, 20 Jul 2025 05:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752988239; cv=none; b=RN45/MHePG0W+iUEH2dC0EHKRFiCHgCCye7a/sBKGHJs7d4hFlN4j9lSra8sm+Xc+lB3HL1x7fb1JtNuLfKA26RaHWxshP5YrzOtA+FSIPnY17HX/aqM54uJRx+1lwWZhaoaynSJhjfIBUTY9eEvRPCG5AYGTVKNZkicml9SK2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752988239; c=relaxed/simple;
	bh=XaV9Bs04VVSfcdcpqcDUMEovKMSH1ZE0nowiUfpD7ko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PnDjZCQitsoQSd1RIlMic9cCl2NWd4HPcEnCF/fxF10LDRvBZqx8lpsbrZmJr3D37UzxbhoMzsl1+WFUPr9AkmUVPn9YQUCoHrlTg23QSsPErenxGe9RdcT6NFslQZF+VNfh/uJD2lNxZ/WKjaaeKNDbW3hnKYYLuUIRkuJ8kCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdaAcT3K; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752988238; x=1784524238;
  h=date:from:to:cc:subject:message-id;
  bh=XaV9Bs04VVSfcdcpqcDUMEovKMSH1ZE0nowiUfpD7ko=;
  b=cdaAcT3KiqzGhxecxRJ15Ek3qSKkaynWeIoSLhVe48VcAg34tXq6QmGf
   Y5kB+EFBOcInawA51zYGTXjViR2kXeKkF0vOtayHTew0Z3ZAGnrNDhKjT
   mih/rxZX16Yzd2czWsvBc4I1Z/aReYcM5vAVBRPCYLUInCb3RXloiwdB6
   Bnf6SYyRLx/2+n6dpIx7dbFVmrFA3F7nR3onjVQVX0kGAhrY8fJAnM0PY
   nEjA7rfLc3MrKl4mC3yFZRBRhesKEXAwdLsqGQkvNUr4SdZI7vWPNTZZ9
   4u2i2w0j1tjHDMhXl1PSB+k+UEDB0i9us08M0kDC7ALRU9WIPXNFLrtkY
   w==;
X-CSE-ConnectionGUID: FnW9NqYFT+adFwerRVAvRQ==
X-CSE-MsgGUID: lId/+6k9SCSOE0O/ePpT7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="80675420"
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="80675420"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 22:10:37 -0700
X-CSE-ConnectionGUID: NKcYFfznSwGTLJJzBngL7Q==
X-CSE-MsgGUID: YF4MZiKBTvKvEA+GoaI+wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="159248174"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Jul 2025 22:10:36 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udMJm-000FwD-0k;
	Sun, 20 Jul 2025 05:10:34 +0000
Date: Sun, 20 Jul 2025 13:09:39 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 0bbd90c2c6b2dc5b1211cc461a144c6c8808605d
Message-ID: <202507201326.hMWcYhCY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 0bbd90c2c6b2dc5b1211cc461a144c6c8808605d  pinctrl: ingenic: use pinmux_generic_add_pinfunction()

elapsed time: 726m

configs tested: 125
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                     haps_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250720    gcc-11.5.0
arc                   randconfig-002-20250720    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g5_defconfig    gcc-15.1.0
arm                   randconfig-001-20250720    gcc-15.1.0
arm                   randconfig-002-20250720    gcc-15.1.0
arm                   randconfig-003-20250720    gcc-10.5.0
arm                   randconfig-004-20250720    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250720    gcc-15.1.0
arm64                 randconfig-002-20250720    gcc-12.5.0
arm64                 randconfig-003-20250720    clang-21
arm64                 randconfig-004-20250720    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250720    gcc-15.1.0
csky                  randconfig-002-20250720    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250720    clang-21
hexagon               randconfig-002-20250720    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250720    clang-20
i386        buildonly-randconfig-002-20250720    gcc-12
i386        buildonly-randconfig-003-20250720    gcc-12
i386        buildonly-randconfig-004-20250720    clang-20
i386        buildonly-randconfig-005-20250720    gcc-12
i386        buildonly-randconfig-006-20250720    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250720    clang-18
loongarch             randconfig-002-20250720    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         db1xxx_defconfig    clang-21
mips                           ip22_defconfig    gcc-15.1.0
mips                           mtx1_defconfig    clang-21
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250720    gcc-9.5.0
nios2                 randconfig-002-20250720    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250720    gcc-8.5.0
parisc                randconfig-002-20250720    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250720    gcc-10.5.0
powerpc               randconfig-002-20250720    gcc-8.5.0
powerpc               randconfig-003-20250720    gcc-11.5.0
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250720    gcc-10.5.0
powerpc64             randconfig-002-20250720    gcc-8.5.0
powerpc64             randconfig-003-20250720    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250720    clang-21
riscv                 randconfig-002-20250720    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250720    clang-21
s390                  randconfig-002-20250720    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                            hp6xx_defconfig    gcc-15.1.0
sh                    randconfig-001-20250720    gcc-15.1.0
sh                    randconfig-002-20250720    gcc-13.4.0
sh                           se7750_defconfig    gcc-15.1.0
sh                           sh2007_defconfig    gcc-15.1.0
sh                        sh7785lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250720    gcc-8.5.0
sparc                 randconfig-002-20250720    gcc-8.5.0
sparc64               randconfig-001-20250720    gcc-8.5.0
sparc64               randconfig-002-20250720    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250720    gcc-11
um                    randconfig-002-20250720    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250720    gcc-12
x86_64      buildonly-randconfig-002-20250720    gcc-12
x86_64      buildonly-randconfig-003-20250720    gcc-12
x86_64      buildonly-randconfig-004-20250720    clang-20
x86_64      buildonly-randconfig-005-20250720    gcc-11
x86_64      buildonly-randconfig-006-20250720    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250720    gcc-8.5.0
xtensa                randconfig-002-20250720    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

