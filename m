Return-Path: <linux-gpio+bounces-8590-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BB694870E
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2024 03:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAA351F233FA
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2024 01:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99094685;
	Tue,  6 Aug 2024 01:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QpiPoP6m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86743AD2F
	for <linux-gpio@vger.kernel.org>; Tue,  6 Aug 2024 01:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722908590; cv=none; b=cRZPYa5KSq0weQIlfd2bQX4FyUl9yJtKp0P387y837llf0vTGx615YdEv5xCCqk1GQe1VePBFv48Vh+mCJMSM7RKSxKKku4hDY0d16k+KvBTKvY5PvvjnJrvdb8Pk3dLlERvObvP8p1348alf4M4eBhWH4r/hSxSj9w5eLVe2MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722908590; c=relaxed/simple;
	bh=RDmoQiEXcYXyr7Y5Sj89q0ofLFUQugYrueBONWlOEIk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X7hoMpBwUbqEVOrFx80WnSSn/Cf33he/mi8z57KzEQbXlIFCkl3KQgySsEBwmS4aECYC/5FALljS4PeNGmcBL9uqaJ4DZ7VXHzhVLL4fCFCkVQTPu+9GXayKyiRQ7NcyplhK5k3SxfC6QUx9QvXFAtwT+vvn842QofwLzltAqpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QpiPoP6m; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722908589; x=1754444589;
  h=date:from:to:cc:subject:message-id;
  bh=RDmoQiEXcYXyr7Y5Sj89q0ofLFUQugYrueBONWlOEIk=;
  b=QpiPoP6mSzLuEdgG7zQaL9izErppuUShDtzBozxqshywxLyRrHnFD32C
   ajiCs4JuIxwixgqFhcW+ne+rkSzm9nzL7SPunTf0FTQiaLrwQs3WACtwd
   l0hbH5UTXEmgaMii40TXvhzjz8glgJvMh/ievxlEtGoiTa+E0lhgJiLkF
   L76qz9wXTIgb2vZZwjXpQVQFyMPQcJA9SVNMhqQCSsd2zYj3vYOXuTbiY
   KFg4embmD7dYbGoLDGbR4GhHjT0qjXSlspbW27AIuNe9oQ0SpUss47vuv
   p6LHUmcWxWdVufLIsV/FnBEeGjC8JZpVjH8jGIBG1VgOqleBzHzIfKXFQ
   A==;
X-CSE-ConnectionGUID: Zuls9grTR0OxtFBj9Lltdg==
X-CSE-MsgGUID: WM2neB/mQoWtdz870bgzNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="32056440"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="32056440"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 18:43:08 -0700
X-CSE-ConnectionGUID: HYoD9TRDSyaVkV9foScu/Q==
X-CSE-MsgGUID: pChktDtLQ6CKocVOIB+VOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="56442025"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 05 Aug 2024 18:43:06 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb9E8-00042W-20;
	Tue, 06 Aug 2024 01:43:04 +0000
Date: Tue, 06 Aug 2024 09:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 26b95b7b588d70b5075b597ff808543503d36ac6
Message-ID: <202408060933.STFVjNT8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 26b95b7b588d70b5075b597ff808543503d36ac6  gpio: vf610: add get_direction() support

elapsed time: 918m

configs tested: 222
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240805   gcc-13.2.0
arc                   randconfig-002-20240805   gcc-13.2.0
arc                           tb10x_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         axm55xx_defconfig   gcc-13.2.0
arm                         bcm2835_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                      jornada720_defconfig   gcc-13.2.0
arm                        keystone_defconfig   gcc-13.2.0
arm                         mv78xx0_defconfig   gcc-13.2.0
arm                         nhk8815_defconfig   gcc-13.2.0
arm                           omap1_defconfig   gcc-13.2.0
arm                   randconfig-001-20240805   gcc-13.2.0
arm                   randconfig-002-20240805   gcc-13.2.0
arm                   randconfig-003-20240805   gcc-13.2.0
arm                   randconfig-004-20240805   gcc-13.2.0
arm                             rpc_defconfig   gcc-13.2.0
arm                           sama5_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240805   gcc-13.2.0
arm64                 randconfig-002-20240805   gcc-13.2.0
arm64                 randconfig-003-20240805   gcc-13.2.0
arm64                 randconfig-004-20240805   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240805   gcc-13.2.0
csky                  randconfig-002-20240805   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240805   clang-18
i386         buildonly-randconfig-002-20240805   clang-18
i386         buildonly-randconfig-003-20240805   clang-18
i386         buildonly-randconfig-004-20240805   clang-18
i386         buildonly-randconfig-005-20240805   clang-18
i386         buildonly-randconfig-006-20240805   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240805   clang-18
i386                  randconfig-002-20240805   clang-18
i386                  randconfig-003-20240805   clang-18
i386                  randconfig-004-20240805   clang-18
i386                  randconfig-005-20240805   clang-18
i386                  randconfig-006-20240805   clang-18
i386                  randconfig-011-20240805   clang-18
i386                  randconfig-012-20240805   clang-18
i386                  randconfig-013-20240805   clang-18
i386                  randconfig-014-20240805   clang-18
i386                  randconfig-015-20240805   clang-18
i386                  randconfig-016-20240805   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240805   gcc-13.2.0
loongarch             randconfig-002-20240805   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5407c3_defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.2.0
m68k                           virt_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                       bmips_be_defconfig   gcc-13.2.0
mips                     cu1000-neo_defconfig   gcc-13.2.0
mips                         db1xxx_defconfig   gcc-13.2.0
mips                          eyeq6_defconfig   gcc-13.2.0
mips                           ip22_defconfig   gcc-13.2.0
mips                          malta_defconfig   gcc-13.2.0
mips                      maltasmvp_defconfig   gcc-13.2.0
mips                        vocore2_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240805   gcc-13.2.0
nios2                 randconfig-002-20240805   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
openrisc                       virt_defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240805   gcc-13.2.0
parisc                randconfig-002-20240805   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      chrp32_defconfig   gcc-13.2.0
powerpc                      cm5200_defconfig   gcc-13.2.0
powerpc                   currituck_defconfig   gcc-13.2.0
powerpc                        fsp2_defconfig   gcc-13.2.0
powerpc                 mpc8315_rdb_defconfig   gcc-13.2.0
powerpc                      pmac32_defconfig   gcc-13.2.0
powerpc                      ppc64e_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240805   gcc-13.2.0
powerpc                    socrates_defconfig   gcc-13.2.0
powerpc                     stx_gp3_defconfig   gcc-13.2.0
powerpc                     tqm8540_defconfig   gcc-13.2.0
powerpc                     tqm8555_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240805   gcc-13.2.0
powerpc64             randconfig-002-20240805   gcc-13.2.0
powerpc64             randconfig-003-20240805   gcc-13.2.0
riscv                            alldefconfig   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240805   gcc-13.2.0
riscv                 randconfig-002-20240805   gcc-13.2.0
s390                             alldefconfig   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240805   gcc-13.2.0
s390                  randconfig-002-20240805   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        edosk7705_defconfig   gcc-13.2.0
sh                    randconfig-001-20240805   gcc-13.2.0
sh                    randconfig-002-20240805   gcc-13.2.0
sh                           se7705_defconfig   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sh                     sh7710voipgw_defconfig   gcc-13.2.0
sh                  sh7785lcr_32bit_defconfig   gcc-13.2.0
sh                            shmin_defconfig   gcc-13.2.0
sh                            titan_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240805   gcc-13.2.0
sparc64               randconfig-002-20240805   gcc-13.2.0
um                               alldefconfig   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240805   gcc-13.2.0
um                    randconfig-002-20240805   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240805   gcc-12
x86_64       buildonly-randconfig-001-20240806   clang-18
x86_64       buildonly-randconfig-002-20240805   gcc-12
x86_64       buildonly-randconfig-002-20240806   clang-18
x86_64       buildonly-randconfig-003-20240805   gcc-12
x86_64       buildonly-randconfig-003-20240806   clang-18
x86_64       buildonly-randconfig-004-20240805   gcc-12
x86_64       buildonly-randconfig-004-20240806   clang-18
x86_64       buildonly-randconfig-005-20240805   gcc-12
x86_64       buildonly-randconfig-005-20240806   clang-18
x86_64       buildonly-randconfig-006-20240805   gcc-12
x86_64       buildonly-randconfig-006-20240806   clang-18
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240805   gcc-12
x86_64                randconfig-001-20240806   clang-18
x86_64                randconfig-002-20240805   gcc-12
x86_64                randconfig-002-20240806   clang-18
x86_64                randconfig-003-20240805   gcc-12
x86_64                randconfig-003-20240806   clang-18
x86_64                randconfig-004-20240805   gcc-12
x86_64                randconfig-004-20240806   clang-18
x86_64                randconfig-005-20240805   gcc-12
x86_64                randconfig-005-20240806   clang-18
x86_64                randconfig-006-20240805   gcc-12
x86_64                randconfig-006-20240806   clang-18
x86_64                randconfig-011-20240805   gcc-12
x86_64                randconfig-011-20240806   clang-18
x86_64                randconfig-012-20240805   gcc-12
x86_64                randconfig-012-20240806   clang-18
x86_64                randconfig-013-20240805   gcc-12
x86_64                randconfig-013-20240806   clang-18
x86_64                randconfig-014-20240805   gcc-12
x86_64                randconfig-014-20240806   clang-18
x86_64                randconfig-015-20240805   gcc-12
x86_64                randconfig-015-20240806   clang-18
x86_64                randconfig-016-20240805   gcc-12
x86_64                randconfig-016-20240806   clang-18
x86_64                randconfig-071-20240805   gcc-12
x86_64                randconfig-071-20240806   clang-18
x86_64                randconfig-072-20240805   gcc-12
x86_64                randconfig-072-20240806   clang-18
x86_64                randconfig-073-20240805   gcc-12
x86_64                randconfig-073-20240806   clang-18
x86_64                randconfig-074-20240805   gcc-12
x86_64                randconfig-074-20240806   clang-18
x86_64                randconfig-075-20240805   gcc-12
x86_64                randconfig-075-20240806   clang-18
x86_64                randconfig-076-20240805   gcc-12
x86_64                randconfig-076-20240806   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                generic_kc705_defconfig   gcc-13.2.0
xtensa                          iss_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240805   gcc-13.2.0
xtensa                randconfig-002-20240805   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

