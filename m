Return-Path: <linux-gpio+bounces-18442-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 674EFA7F689
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 717E0189DD98
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3644264FA8;
	Tue,  8 Apr 2025 07:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kz6svKWP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44250264A96
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097810; cv=none; b=bBlFcm6rgRuGQLSvn4UZTJIBctf7JjLtWjxWai74RstYMKyJRdnW3WQZ85dE8pI7PU90zm4UDTCShx49eIKydCvfmdcETiAuPy/m6Rl79OifDC236d1ZfAjGWxGPVWpPYyeVC9lKjpD8GcYajDuxBmBdINAeXBPu2uMF9UGEgDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097810; c=relaxed/simple;
	bh=vY2VLFh3oJVSvBkKtJAneqXd98LaFmooDzHbvT8ewk8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i1/fPBR8icXotpI3bZgLuQXhdE3G2hSVresayDSNlSuTfu10BR5cS8XId7LRxr/UXHbAHI/lIKWiELryfuRwIPEpIYEmg4ySd0wWfJ+iZ2Gjjqr41wtGPZnd8tQyqKx0msRkuPigZvqB5sJGZSCsJf19isA6LYRfepx19NgdVI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kz6svKWP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744097808; x=1775633808;
  h=date:from:to:cc:subject:message-id;
  bh=vY2VLFh3oJVSvBkKtJAneqXd98LaFmooDzHbvT8ewk8=;
  b=kz6svKWPYUe6XJEBAKE4kCje5taflbwJLhnSxEVkui3dPXoYB5wXEGVJ
   AAMfT+vNTjpxfzYLSkxt8iNa3VvWoV2vabM8nw02+r9VW6Lfei+AFUQxz
   ilPA71Khoa/DVxYq6tTHylt3yQ1Hnv4qZBcT3oWM5v31jLx70X6SwhVwF
   yn63r2akoK2k4Yi8K0VwZ6iHbxxtj0S7Y06TenpsBpRhkHn918AJiX2U8
   y4JKCwObnwf2qCv/ENi9NOo2CyA8LjGQ1ZWvpyuVLJqI85swyjrHCXGx6
   8avLqpvRrnEU38TO8DCCpxG4xeLrvlRsBJf8VpqAfIoFV/qGwJji+kbCh
   w==;
X-CSE-ConnectionGUID: a2BId4XnQ7+wXptoQJx1/A==
X-CSE-MsgGUID: 93rj9eK+TTyyPfZyUapizg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49311206"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="49311206"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 00:36:48 -0700
X-CSE-ConnectionGUID: 2YFfOK+eSPa4AAdBpy5mlg==
X-CSE-MsgGUID: X3d3fsdPSjuwGTxUE5OS2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="151374573"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Apr 2025 00:36:46 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u23Vk-0004Fz-1q;
	Tue, 08 Apr 2025 07:36:44 +0000
Date: Tue, 08 Apr 2025 15:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 8323f3a69de6f6e96bf22f32dd8e2920766050c2
Message-ID: <202504081509.kvSRzKQO-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 8323f3a69de6f6e96bf22f32dd8e2920766050c2  gpio: tegra186: fix resource handling in ACPI probe path

elapsed time: 1470m

configs tested: 126
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              alldefconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250407    gcc-12.4.0
arc                   randconfig-002-20250407    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                       multi_v4t_defconfig    clang-16
arm                   randconfig-001-20250407    gcc-8.5.0
arm                   randconfig-002-20250407    clang-21
arm                   randconfig-003-20250407    gcc-8.5.0
arm                   randconfig-004-20250407    gcc-8.5.0
arm                           stm32_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250407    clang-21
arm64                 randconfig-002-20250407    gcc-6.5.0
arm64                 randconfig-003-20250407    gcc-8.5.0
arm64                 randconfig-004-20250407    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250407    gcc-14.2.0
csky                  randconfig-002-20250407    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250407    clang-21
hexagon               randconfig-002-20250407    clang-15
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250407    gcc-12
i386        buildonly-randconfig-002-20250407    gcc-12
i386        buildonly-randconfig-003-20250407    gcc-12
i386        buildonly-randconfig-004-20250407    clang-20
i386        buildonly-randconfig-005-20250407    gcc-12
i386        buildonly-randconfig-006-20250407    clang-20
i386                                defconfig    clang-20
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250407    gcc-14.2.0
loongarch             randconfig-002-20250407    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           jazz_defconfig    clang-17
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250407    gcc-6.5.0
nios2                 randconfig-002-20250407    gcc-8.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250407    gcc-7.5.0
parisc                randconfig-002-20250407    gcc-7.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250407    clang-21
powerpc               randconfig-002-20250407    clang-21
powerpc               randconfig-003-20250407    gcc-6.5.0
powerpc                         wii_defconfig    gcc-14.2.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250407    clang-21
powerpc64             randconfig-002-20250407    clang-17
powerpc64             randconfig-003-20250407    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250407    gcc-8.5.0
riscv                 randconfig-002-20250407    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250407    gcc-9.3.0
s390                  randconfig-002-20250407    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250407    gcc-12.4.0
sh                    randconfig-002-20250407    gcc-10.5.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250407    gcc-13.3.0
sparc                 randconfig-002-20250407    gcc-10.3.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250407    gcc-7.5.0
sparc64               randconfig-002-20250407    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250407    clang-18
um                    randconfig-002-20250407    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250407    gcc-11
x86_64      buildonly-randconfig-002-20250407    clang-20
x86_64      buildonly-randconfig-003-20250407    clang-20
x86_64      buildonly-randconfig-004-20250407    clang-20
x86_64      buildonly-randconfig-005-20250407    clang-20
x86_64      buildonly-randconfig-006-20250407    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250407    gcc-9.3.0
xtensa                randconfig-002-20250407    gcc-7.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

