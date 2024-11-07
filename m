Return-Path: <linux-gpio+bounces-12691-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 374679C125F
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 00:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBD3F285522
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 23:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D782194B3;
	Thu,  7 Nov 2024 23:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MS90B+JC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272B0218923
	for <linux-gpio@vger.kernel.org>; Thu,  7 Nov 2024 23:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731022061; cv=none; b=fLLSYMfaShfqiHhE819d6cGcO72E2MgMtF8v8POlOwFCYH/9ep2pc4xprIppN1BvL2eJCo1U1YgO1qH29epSqiUB246re69O1BLLenKgF2FURLDQ1X2nbC0OdTGIZlyVs8VMuevZPcVQGOFtYWHsMbq8/l4ayY0qMIpq3CBLDxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731022061; c=relaxed/simple;
	bh=TAaQ7EZG+zrOm+eErjqxaBvhdyYjU4AvaFBK0U/hWf8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K2bHa3+Hdix8voqy9ayX5+OHiXv/B59E4ysEgD31N3h5ALBJeSdeaBUrgrX8A0M/h3u7+/dGKb2nc6k54NUqBkVus3LK71QF3UIrhgeTbFOGle0jtNnJcvtR279txeVW+OfSE4cEek313GoF2+tHk/N1lXVWL0ieqBeh/Lqzgco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MS90B+JC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731022059; x=1762558059;
  h=date:from:to:cc:subject:message-id;
  bh=TAaQ7EZG+zrOm+eErjqxaBvhdyYjU4AvaFBK0U/hWf8=;
  b=MS90B+JCUWCbi7BWRiX6VJlr2tMdP7HUr0J7o5pJ/gC/P1iz4A1D1Jzp
   DABF0UtoHippBm5HTJ/4cSU5OL56ig8Eu/zGODcxoA1DANwDboaJysAoZ
   PIyQ4z2okYQATcLIc+OS6AZZJ2kMZw32JS/WWBd5snKMU0QU/fEJcJo6O
   w0tqhPqIP0kDB+IA6IROXAUh3LJWRqzcCq8YkC4Pzq+snpEBuIDijDnj1
   5/X6tyksWW7GD5S3Vgl2REEPQGtylZY1Hinw99TBvHvW6HWM94Aa8+bPe
   WeFySK9IlebN3yl6GsRaeZ/Tsn2bKVia63mmR3U8w11OuVtZNgZP1IxGF
   w==;
X-CSE-ConnectionGUID: kgUlIwuLRYufLFeWZ3qgOA==
X-CSE-MsgGUID: rPa8+HcPQhSHUMSY0LnLiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34584876"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34584876"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 15:27:38 -0800
X-CSE-ConnectionGUID: FWZ1r2IITKuqqyCRsNLBlA==
X-CSE-MsgGUID: ij/eGDvcTfGvnww+k7T8Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="85276806"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Nov 2024 15:27:37 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9BuY-000qmK-1f;
	Thu, 07 Nov 2024 23:27:34 +0000
Date: Fri, 08 Nov 2024 07:26:47 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 aca4d2218c9f1c49841a34e411926db1f99a4130
Message-ID: <202411080742.4Idwu3cj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: aca4d2218c9f1c49841a34e411926db1f99a4130  Merge tag 'intel-gpio-v6.13-1' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-next

elapsed time: 724m

configs tested: 278
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                          axs103_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    clang-20
arc                   randconfig-001-20241107    gcc-14.2.0
arc                   randconfig-001-20241108    gcc-14.2.0
arc                   randconfig-002-20241107    gcc-14.2.0
arc                   randconfig-002-20241108    gcc-14.2.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                          gemini_defconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                           imxrt_defconfig    gcc-14.2.0
arm                            mmp2_defconfig    clang-20
arm                       multi_v4t_defconfig    clang-20
arm                        multi_v5_defconfig    clang-20
arm                           omap1_defconfig    gcc-14.2.0
arm                         orion5x_defconfig    clang-20
arm                   randconfig-001-20241107    gcc-14.2.0
arm                   randconfig-001-20241108    gcc-14.2.0
arm                   randconfig-002-20241107    gcc-14.2.0
arm                   randconfig-002-20241108    gcc-14.2.0
arm                   randconfig-003-20241107    gcc-14.2.0
arm                   randconfig-003-20241108    gcc-14.2.0
arm                   randconfig-004-20241107    gcc-14.2.0
arm                   randconfig-004-20241108    gcc-14.2.0
arm                             rpc_defconfig    gcc-14.2.0
arm                           sama7_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    clang-20
arm                       versatile_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241107    gcc-14.2.0
arm64                 randconfig-001-20241108    gcc-14.2.0
arm64                 randconfig-002-20241107    gcc-14.2.0
arm64                 randconfig-002-20241108    gcc-14.2.0
arm64                 randconfig-003-20241107    gcc-14.2.0
arm64                 randconfig-003-20241108    gcc-14.2.0
arm64                 randconfig-004-20241107    gcc-14.2.0
arm64                 randconfig-004-20241108    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241107    gcc-14.2.0
csky                  randconfig-001-20241108    gcc-14.2.0
csky                  randconfig-002-20241107    gcc-14.2.0
csky                  randconfig-002-20241108    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241107    gcc-14.2.0
hexagon               randconfig-001-20241108    gcc-14.2.0
hexagon               randconfig-002-20241107    gcc-14.2.0
hexagon               randconfig-002-20241108    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241107    clang-19
i386        buildonly-randconfig-001-20241108    clang-19
i386        buildonly-randconfig-002-20241107    clang-19
i386        buildonly-randconfig-002-20241108    clang-19
i386        buildonly-randconfig-003-20241107    clang-19
i386        buildonly-randconfig-003-20241108    clang-19
i386        buildonly-randconfig-004-20241107    clang-19
i386        buildonly-randconfig-004-20241108    clang-19
i386        buildonly-randconfig-005-20241107    clang-19
i386        buildonly-randconfig-005-20241108    clang-19
i386        buildonly-randconfig-006-20241107    clang-19
i386        buildonly-randconfig-006-20241108    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241107    clang-19
i386                  randconfig-001-20241108    clang-19
i386                  randconfig-002-20241107    clang-19
i386                  randconfig-002-20241108    clang-19
i386                  randconfig-003-20241107    clang-19
i386                  randconfig-003-20241108    clang-19
i386                  randconfig-004-20241107    clang-19
i386                  randconfig-004-20241108    clang-19
i386                  randconfig-005-20241107    clang-19
i386                  randconfig-005-20241108    clang-19
i386                  randconfig-006-20241107    clang-19
i386                  randconfig-006-20241108    clang-19
i386                  randconfig-011-20241107    clang-19
i386                  randconfig-011-20241108    clang-19
i386                  randconfig-012-20241107    clang-19
i386                  randconfig-012-20241108    clang-19
i386                  randconfig-013-20241107    clang-19
i386                  randconfig-013-20241108    clang-19
i386                  randconfig-014-20241107    clang-19
i386                  randconfig-014-20241108    clang-19
i386                  randconfig-015-20241107    clang-19
i386                  randconfig-015-20241108    clang-19
i386                  randconfig-016-20241107    clang-19
i386                  randconfig-016-20241108    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20241107    gcc-14.2.0
loongarch             randconfig-001-20241108    gcc-14.2.0
loongarch             randconfig-002-20241107    gcc-14.2.0
loongarch             randconfig-002-20241108    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    clang-20
m68k                          multi_defconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                            gpr_defconfig    clang-20
mips                           ip30_defconfig    gcc-14.2.0
mips                         rt305x_defconfig    clang-20
nios2                         10m50_defconfig    clang-20
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241107    gcc-14.2.0
nios2                 randconfig-001-20241108    gcc-14.2.0
nios2                 randconfig-002-20241107    gcc-14.2.0
nios2                 randconfig-002-20241108    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           alldefconfig    clang-20
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241107    gcc-14.2.0
parisc                randconfig-001-20241108    gcc-14.2.0
parisc                randconfig-002-20241107    gcc-14.2.0
parisc                randconfig-002-20241108    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                   currituck_defconfig    clang-20
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                 linkstation_defconfig    clang-20
powerpc                  mpc885_ads_defconfig    clang-20
powerpc                      pcm030_defconfig    gcc-14.2.0
powerpc                      pmac32_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241107    gcc-14.2.0
powerpc               randconfig-001-20241108    gcc-14.2.0
powerpc               randconfig-002-20241107    gcc-14.2.0
powerpc               randconfig-002-20241108    gcc-14.2.0
powerpc               randconfig-003-20241107    gcc-14.2.0
powerpc               randconfig-003-20241108    gcc-14.2.0
powerpc                     sequoia_defconfig    gcc-14.2.0
powerpc                     skiroot_defconfig    gcc-14.2.0
powerpc                     tqm8541_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241108    gcc-14.2.0
powerpc64             randconfig-002-20241108    gcc-14.2.0
powerpc64             randconfig-003-20241107    gcc-14.2.0
powerpc64             randconfig-003-20241108    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241107    gcc-14.2.0
riscv                 randconfig-001-20241108    gcc-14.2.0
riscv                 randconfig-002-20241107    gcc-14.2.0
riscv                 randconfig-002-20241108    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241107    gcc-14.2.0
s390                  randconfig-001-20241108    gcc-14.2.0
s390                  randconfig-002-20241107    gcc-14.2.0
s390                  randconfig-002-20241108    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                          lboxre2_defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    clang-20
sh                    randconfig-001-20241107    gcc-14.2.0
sh                    randconfig-001-20241108    gcc-14.2.0
sh                    randconfig-002-20241107    gcc-14.2.0
sh                    randconfig-002-20241108    gcc-14.2.0
sh                   sh7770_generic_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241107    gcc-14.2.0
sparc64               randconfig-001-20241108    gcc-14.2.0
sparc64               randconfig-002-20241107    gcc-14.2.0
sparc64               randconfig-002-20241108    gcc-14.2.0
um                               alldefconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241107    gcc-14.2.0
um                    randconfig-001-20241108    gcc-14.2.0
um                    randconfig-002-20241107    gcc-14.2.0
um                    randconfig-002-20241108    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241107    clang-19
x86_64      buildonly-randconfig-001-20241108    clang-19
x86_64      buildonly-randconfig-002-20241107    clang-19
x86_64      buildonly-randconfig-002-20241108    clang-19
x86_64      buildonly-randconfig-003-20241107    clang-19
x86_64      buildonly-randconfig-003-20241108    clang-19
x86_64      buildonly-randconfig-004-20241107    clang-19
x86_64      buildonly-randconfig-004-20241108    clang-19
x86_64      buildonly-randconfig-005-20241107    clang-19
x86_64      buildonly-randconfig-005-20241108    clang-19
x86_64      buildonly-randconfig-006-20241107    clang-19
x86_64      buildonly-randconfig-006-20241108    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241107    clang-19
x86_64                randconfig-001-20241108    clang-19
x86_64                randconfig-002-20241107    clang-19
x86_64                randconfig-002-20241108    clang-19
x86_64                randconfig-003-20241107    clang-19
x86_64                randconfig-003-20241108    clang-19
x86_64                randconfig-004-20241107    clang-19
x86_64                randconfig-004-20241108    clang-19
x86_64                randconfig-005-20241107    clang-19
x86_64                randconfig-005-20241108    clang-19
x86_64                randconfig-006-20241107    clang-19
x86_64                randconfig-006-20241108    clang-19
x86_64                randconfig-011-20241107    clang-19
x86_64                randconfig-011-20241108    clang-19
x86_64                randconfig-012-20241107    clang-19
x86_64                randconfig-012-20241108    clang-19
x86_64                randconfig-013-20241107    clang-19
x86_64                randconfig-013-20241108    clang-19
x86_64                randconfig-014-20241107    clang-19
x86_64                randconfig-014-20241108    clang-19
x86_64                randconfig-015-20241107    clang-19
x86_64                randconfig-015-20241108    clang-19
x86_64                randconfig-016-20241107    clang-19
x86_64                randconfig-016-20241108    clang-19
x86_64                randconfig-071-20241107    clang-19
x86_64                randconfig-071-20241108    clang-19
x86_64                randconfig-072-20241107    clang-19
x86_64                randconfig-072-20241108    clang-19
x86_64                randconfig-073-20241107    clang-19
x86_64                randconfig-073-20241108    clang-19
x86_64                randconfig-074-20241107    clang-19
x86_64                randconfig-074-20241108    clang-19
x86_64                randconfig-075-20241107    clang-19
x86_64                randconfig-075-20241108    clang-19
x86_64                randconfig-076-20241107    clang-19
x86_64                randconfig-076-20241108    clang-19
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  nommu_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241107    gcc-14.2.0
xtensa                randconfig-001-20241108    gcc-14.2.0
xtensa                randconfig-002-20241107    gcc-14.2.0
xtensa                randconfig-002-20241108    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

