Return-Path: <linux-gpio+bounces-13092-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFDC9D1CDF
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 02:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70F3B1F22522
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 01:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9001DDEA;
	Tue, 19 Nov 2024 01:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4ANkhZK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C808A450F2
	for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 01:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731978118; cv=none; b=cU55JbVowUOwf5ZJAHatCKkUi687z5Vlr5+x+hgzZkb63EEEtdFKXfL91S/GHwC8Pfs7/GxpNP3KyJyMX24naM31Mmal9uD7DykW0cs0NlVOepIZNaOO0qTGkqdtXqe4nTxHe6vcCyqlc6gpO11OcjpkGubR6Msore4M7DxDTPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731978118; c=relaxed/simple;
	bh=xP08TABPLeLGtC/SiOIv4cw03WyjeJd4SMa8clD88jI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NaGvtte9+BMuW/bKEkQYDJ9X/PvmfAGuqGiEglCZFAWEgEmDuwjuevwV8091OGfSFYc+FwrRgaXdfXLuXAo9VRdZEXgzTh/hoVHqpmeCDFFidJFVYxItxPoKBzPiwrNXE5FgFolpliElf9TtBV7R1aIs0lEPqpBenmhtpO/i+1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4ANkhZK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731978117; x=1763514117;
  h=date:from:to:cc:subject:message-id;
  bh=xP08TABPLeLGtC/SiOIv4cw03WyjeJd4SMa8clD88jI=;
  b=b4ANkhZKbrEf3s+Av/fzCGigRBI+z2pKRvjNITTlJwH7Dgk3kdIeqw6V
   T7Pk21CN/jof+in9Xw96hyTz/ekfZ+3MkbZG1wmfQOiAi2zpApO02MDi9
   4TtUrVYpgTF0wt5ctATB6SDpn/jI5a8V+2ctqAvgsGWJFa+Jrk3Lqg7Lj
   oNGH4/DRfMM+VfoT+uKTeG26kQ8NiiNZ9ZLJKpSWN3LyiktHn+WRkHi97
   tbx9qpuJ8loyNu0ZPbg/Ui57WGPnF3VhI+b5dNSjeX9d3XKgX7q/KIvi+
   6Wv/Rrl9d6kip2eSU/rlAYrxeHeoIS6PAf63A1dMq3ncJre2oDlmRbUBP
   A==;
X-CSE-ConnectionGUID: Rs8hsKbiTCWddqsboXTwfw==
X-CSE-MsgGUID: 0GntQqEZQ9uqlZv2EQTSVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31885886"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="31885886"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 17:01:56 -0800
X-CSE-ConnectionGUID: 6MuGhRJuSS6rOrTe2gNmQA==
X-CSE-MsgGUID: McUNqM+WQ9anRS4bBozChQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89817044"
Received: from lkp-server01.sh.intel.com (HELO 64fdafcea91b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Nov 2024 16:57:45 -0800
Received: from kbuild by 64fdafcea91b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDCYg-00002j-1I;
	Tue, 19 Nov 2024 00:57:34 +0000
Date: Tue, 19 Nov 2024 08:56:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 bef29ca3a6458582ac13320d47bf2646e5734dc8
Message-ID: <202411190836.S9aF6oLJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: bef29ca3a6458582ac13320d47bf2646e5734dc8  gpio: tegra186: Allow to enable driver on Tegra234

elapsed time: 816m

configs tested: 277
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.2.0
arc                        nsimosci_defconfig    clang-15
arc                   randconfig-001-20241119    gcc-14.2.0
arc                   randconfig-002-20241119    gcc-14.2.0
arc                        vdk_hs38_defconfig    clang-20
arc                    vdk_hs38_smp_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                        clps711x_defconfig    clang-15
arm                                 defconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-20
arm                            hisi_defconfig    clang-20
arm                        keystone_defconfig    clang-20
arm                         lpc32xx_defconfig    clang-15
arm                   milbeaut_m10v_defconfig    clang-20
arm                            mmp2_defconfig    gcc-14.2.0
arm                         nhk8815_defconfig    clang-20
arm                       omap2plus_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    clang-20
arm                             pxa_defconfig    clang-20
arm                   randconfig-001-20241119    gcc-14.2.0
arm                   randconfig-002-20241119    gcc-14.2.0
arm                   randconfig-003-20241119    gcc-14.2.0
arm                   randconfig-004-20241119    gcc-14.2.0
arm                             rpc_defconfig    clang-20
arm                       spear13xx_defconfig    clang-20
arm                        spear3xx_defconfig    clang-15
arm                        spear6xx_defconfig    clang-20
arm                           u8500_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241119    gcc-14.2.0
arm64                 randconfig-002-20241119    gcc-14.2.0
arm64                 randconfig-003-20241119    gcc-14.2.0
arm64                 randconfig-004-20241119    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241119    gcc-14.2.0
csky                  randconfig-002-20241119    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241119    gcc-14.2.0
hexagon               randconfig-002-20241119    gcc-14.2.0
i386                             alldefconfig    clang-20
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241118    gcc-12
i386        buildonly-randconfig-001-20241119    clang-19
i386        buildonly-randconfig-002-20241118    gcc-12
i386        buildonly-randconfig-002-20241119    clang-19
i386        buildonly-randconfig-003-20241118    gcc-12
i386        buildonly-randconfig-003-20241119    clang-19
i386        buildonly-randconfig-004-20241118    gcc-12
i386        buildonly-randconfig-004-20241119    clang-19
i386        buildonly-randconfig-005-20241118    gcc-12
i386        buildonly-randconfig-005-20241119    clang-19
i386        buildonly-randconfig-006-20241118    gcc-12
i386        buildonly-randconfig-006-20241119    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241118    gcc-12
i386                  randconfig-001-20241119    clang-19
i386                  randconfig-002-20241118    gcc-12
i386                  randconfig-002-20241119    clang-19
i386                  randconfig-003-20241118    gcc-12
i386                  randconfig-003-20241119    clang-19
i386                  randconfig-004-20241118    gcc-12
i386                  randconfig-004-20241119    clang-19
i386                  randconfig-005-20241118    gcc-12
i386                  randconfig-005-20241119    clang-19
i386                  randconfig-006-20241118    gcc-12
i386                  randconfig-006-20241119    clang-19
i386                  randconfig-011-20241118    gcc-12
i386                  randconfig-011-20241119    clang-19
i386                  randconfig-012-20241118    gcc-12
i386                  randconfig-012-20241119    clang-19
i386                  randconfig-013-20241118    gcc-12
i386                  randconfig-013-20241119    clang-19
i386                  randconfig-014-20241118    gcc-12
i386                  randconfig-014-20241119    clang-19
i386                  randconfig-015-20241118    gcc-12
i386                  randconfig-015-20241119    clang-19
i386                  randconfig-016-20241118    gcc-12
i386                  randconfig-016-20241119    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241119    gcc-14.2.0
loongarch             randconfig-002-20241119    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          hp300_defconfig    clang-15
m68k                       m5208evb_defconfig    clang-20
m68k                       m5249evb_defconfig    clang-20
m68k                       m5275evb_defconfig    clang-15
m68k                        m5307c3_defconfig    clang-20
m68k                            mac_defconfig    clang-20
m68k                          multi_defconfig    gcc-14.2.0
m68k                        mvme147_defconfig    clang-20
m68k                            q40_defconfig    clang-20
m68k                            q40_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    clang-15
m68k                           virt_defconfig    clang-15
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-20
mips                          eyeq5_defconfig    clang-20
mips                           gcw0_defconfig    clang-15
mips                       rbtx49xx_defconfig    clang-20
mips                        vocore2_defconfig    clang-15
mips                           xway_defconfig    clang-20
nios2                         3c120_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241119    gcc-14.2.0
nios2                 randconfig-002-20241119    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241119    gcc-14.2.0
parisc                randconfig-002-20241119    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    clang-20
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                   bluestone_defconfig    gcc-14.2.0
powerpc                       eiger_defconfig    clang-20
powerpc                     ep8248e_defconfig    clang-15
powerpc                     ep8248e_defconfig    clang-20
powerpc                          g5_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                      mgcoge_defconfig    clang-15
powerpc                 mpc836x_rdk_defconfig    clang-15
powerpc                  mpc885_ads_defconfig    clang-20
powerpc                     ppa8548_defconfig    clang-15
powerpc                      ppc44x_defconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241119    gcc-14.2.0
powerpc               randconfig-002-20241119    gcc-14.2.0
powerpc               randconfig-003-20241119    gcc-14.2.0
powerpc                     redwood_defconfig    clang-20
powerpc                      tqm8xx_defconfig    clang-20
powerpc64             randconfig-001-20241119    gcc-14.2.0
powerpc64             randconfig-002-20241119    gcc-14.2.0
powerpc64             randconfig-003-20241119    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    clang-20
riscv                 randconfig-001-20241119    gcc-14.2.0
riscv                 randconfig-002-20241119    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241119    gcc-14.2.0
s390                  randconfig-002-20241119    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        dreamcast_defconfig    gcc-14.2.0
sh                             espt_defconfig    clang-20
sh                             espt_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    clang-20
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                    randconfig-001-20241119    gcc-14.2.0
sh                    randconfig-002-20241119    gcc-14.2.0
sh                           se7712_defconfig    clang-20
sh                           se7722_defconfig    clang-20
sh                           se7724_defconfig    clang-15
sh                        sh7763rdp_defconfig    clang-20
sh                             shx3_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc32_defconfig    clang-20
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241119    gcc-14.2.0
sparc64               randconfig-002-20241119    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    clang-15
um                             i386_defconfig    gcc-12
um                             i386_defconfig    gcc-14.2.0
um                    randconfig-001-20241119    gcc-14.2.0
um                    randconfig-002-20241119    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
um                           x86_64_defconfig    gcc-14.2.0
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241118    gcc-12
x86_64      buildonly-randconfig-001-20241119    gcc-12
x86_64      buildonly-randconfig-002-20241118    gcc-12
x86_64      buildonly-randconfig-002-20241119    gcc-12
x86_64      buildonly-randconfig-003-20241118    gcc-12
x86_64      buildonly-randconfig-003-20241119    gcc-12
x86_64      buildonly-randconfig-004-20241118    gcc-12
x86_64      buildonly-randconfig-004-20241119    gcc-12
x86_64      buildonly-randconfig-005-20241118    gcc-12
x86_64      buildonly-randconfig-005-20241119    gcc-12
x86_64      buildonly-randconfig-006-20241118    gcc-12
x86_64      buildonly-randconfig-006-20241119    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241118    gcc-12
x86_64                randconfig-001-20241119    gcc-12
x86_64                randconfig-002-20241118    gcc-12
x86_64                randconfig-002-20241119    gcc-12
x86_64                randconfig-003-20241118    gcc-12
x86_64                randconfig-003-20241119    gcc-12
x86_64                randconfig-004-20241118    gcc-12
x86_64                randconfig-004-20241119    gcc-12
x86_64                randconfig-005-20241118    gcc-12
x86_64                randconfig-005-20241119    gcc-12
x86_64                randconfig-006-20241118    gcc-12
x86_64                randconfig-006-20241119    gcc-12
x86_64                randconfig-011-20241118    gcc-12
x86_64                randconfig-011-20241119    gcc-12
x86_64                randconfig-012-20241118    gcc-12
x86_64                randconfig-012-20241119    gcc-12
x86_64                randconfig-013-20241118    gcc-12
x86_64                randconfig-013-20241119    gcc-12
x86_64                randconfig-014-20241118    gcc-12
x86_64                randconfig-014-20241119    gcc-12
x86_64                randconfig-015-20241118    gcc-12
x86_64                randconfig-015-20241119    gcc-12
x86_64                randconfig-016-20241118    gcc-12
x86_64                randconfig-016-20241119    gcc-12
x86_64                randconfig-071-20241118    gcc-12
x86_64                randconfig-071-20241119    gcc-12
x86_64                randconfig-072-20241118    gcc-12
x86_64                randconfig-072-20241119    gcc-12
x86_64                randconfig-073-20241118    gcc-12
x86_64                randconfig-073-20241119    gcc-12
x86_64                randconfig-074-20241118    gcc-12
x86_64                randconfig-074-20241119    gcc-12
x86_64                randconfig-075-20241118    gcc-12
x86_64                randconfig-075-20241119    gcc-12
x86_64                randconfig-076-20241118    gcc-12
x86_64                randconfig-076-20241119    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241119    gcc-14.2.0
xtensa                randconfig-002-20241119    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

