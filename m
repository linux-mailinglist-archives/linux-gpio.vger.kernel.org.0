Return-Path: <linux-gpio+bounces-9503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EA396732C
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 21:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62A4A1F21B51
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 19:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AC7524F;
	Sat, 31 Aug 2024 19:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TDeA+IKr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF464A50
	for <linux-gpio@vger.kernel.org>; Sat, 31 Aug 2024 19:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725133700; cv=none; b=mGRcw8FJUjZUt2zAOVcwP0k/3d62+FP2vhNB3krZYAdUEeZjuN4Ne2nbS21v9JQVK03webvTe+MIsNh/e3+v6YFAj3OQ7uRTS+qnBOCkwqAyAm+4y0R06aWPQ9OryEB6PgLkdakS8f4Mo93OllQvT6Lxb2tlzUyQbrxizts+eHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725133700; c=relaxed/simple;
	bh=0qOlzXPGL0Mv9MWukW3Lr3pVME+JZiqZ8iAif+ffWL8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cH5wqJDvZR5GRnRmZbIb2MFPapj72ioKEpz+h3o1nEFgZcHBaHCTnNL9veNDzOQ0mIhUtdjOrnOGBVWZc3m+hxj27laKJAd9n8FtYuSDVVN9I8DBxNTixKsIbwoVW9SLYujgC2kqFeuw/ju6medtQGdcB6m6AmbgCd2u2LSZmts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TDeA+IKr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725133699; x=1756669699;
  h=date:from:to:cc:subject:message-id;
  bh=0qOlzXPGL0Mv9MWukW3Lr3pVME+JZiqZ8iAif+ffWL8=;
  b=TDeA+IKrU2OOoEkwyvGMmGtICMwaeuKDfOKk9t3Q5l7KGxZCEEA90aRs
   5g8XsgM/ospLW4ruGLZ5j/wDWDyaJy3vkpcyjpKc+sHMTnzwXyzowrU5V
   L9RDIyTfSPgmcwZSkoRjip+4RAa0NGH4KvxaqIPS0xHWcun/p79MPKHke
   H/uzavh5AFkniSdVg5M23z40mHlYTHWay15yDRJRcw00OfICW4lfqthna
   QjQXK1GrWUU7QVfuUko//2hAVCXXC30gN6rU37ZAMIY4WC3zb9jdVTKFR
   rH9ATMXOVGHSHUspQ5Mfn6KduY85yu44hk2yJ4pk6UXi8PoOwWhPJyQhc
   A==;
X-CSE-ConnectionGUID: DwW1fl3VRBSxthNivecKiA==
X-CSE-MsgGUID: ifQaoKZsQdiy8MBwYyUzXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="49141782"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="49141782"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 12:48:18 -0700
X-CSE-ConnectionGUID: nyxKSyhzQ5CLM6k+e/3u9Q==
X-CSE-MsgGUID: wIPv3jjbTIimJ6K9uO2VJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="63823122"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Aug 2024 12:48:17 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skU51-00033e-0g;
	Sat, 31 Aug 2024 19:48:15 +0000
Date: Sun, 01 Sep 2024 03:48:14 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 f33254db6c9dc255801b19d6d0272166779c4377
Message-ID: <202409010312.AQEBRwGY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: f33254db6c9dc255801b19d6d0272166779c4377  pinctrl: stmfx: Use string_choices API instead of ternary operator

elapsed time: 1181m

configs tested: 134
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                                 defconfig   gcc-14.1.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                          ep93xx_defconfig   clang-20
arm                             mxs_defconfig   clang-20
arm                         nhk8815_defconfig   clang-20
arm                          pxa3xx_defconfig   clang-20
arm                        realview_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   clang-20
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386                                defconfig   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          amiga_defconfig   clang-20
m68k                                defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                      bmips_stb_defconfig   clang-20
mips                          eyeq5_defconfig   clang-20
mips                           gcw0_defconfig   clang-20
mips                            gpr_defconfig   clang-20
mips                           ip28_defconfig   clang-20
mips                      malta_kvm_defconfig   clang-20
mips                         rt305x_defconfig   clang-20
nios2                         10m50_defconfig   clang-20
nios2                            alldefconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
openrisc                  or1klitex_defconfig   clang-20
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc                generic-64bit_defconfig   clang-20
parisc64                            defconfig   gcc-14.1.0
powerpc                    adder875_defconfig   clang-20
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                       eiger_defconfig   clang-20
powerpc                    gamecube_defconfig   clang-20
powerpc                       maple_defconfig   clang-20
powerpc                     mpc512x_defconfig   clang-20
powerpc                 mpc834x_itx_defconfig   clang-20
powerpc                     sequoia_defconfig   clang-20
powerpc                     skiroot_defconfig   clang-20
powerpc                     tqm8540_defconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
riscv                    nommu_k210_defconfig   clang-20
s390                             alldefconfig   clang-20
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                          kfr2r09_defconfig   clang-20
sh                           se7780_defconfig   clang-20
sh                   secureedge5410_defconfig   clang-20
sh                             shx3_defconfig   clang-20
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240831   clang-18
x86_64       buildonly-randconfig-002-20240831   clang-18
x86_64       buildonly-randconfig-003-20240831   clang-18
x86_64       buildonly-randconfig-004-20240831   clang-18
x86_64       buildonly-randconfig-005-20240831   clang-18
x86_64       buildonly-randconfig-006-20240831   clang-18
x86_64                              defconfig   clang-18
x86_64                                  kexec   gcc-12
x86_64                randconfig-001-20240831   clang-18
x86_64                randconfig-002-20240831   clang-18
x86_64                randconfig-003-20240831   clang-18
x86_64                randconfig-004-20240831   clang-18
x86_64                randconfig-005-20240831   clang-18
x86_64                randconfig-006-20240831   clang-18
x86_64                randconfig-011-20240831   clang-18
x86_64                randconfig-012-20240831   clang-18
x86_64                randconfig-013-20240831   clang-18
x86_64                randconfig-014-20240831   clang-18
x86_64                randconfig-015-20240831   clang-18
x86_64                randconfig-016-20240831   clang-18
x86_64                randconfig-071-20240831   clang-18
x86_64                randconfig-072-20240831   clang-18
x86_64                randconfig-073-20240831   clang-18
x86_64                randconfig-074-20240831   clang-18
x86_64                randconfig-075-20240831   clang-18
x86_64                randconfig-076-20240831   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0
xtensa                          iss_defconfig   clang-20

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

