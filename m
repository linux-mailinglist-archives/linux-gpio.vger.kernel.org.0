Return-Path: <linux-gpio+bounces-3024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFA984B465
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 13:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 137ED2840FF
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 12:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28E0130E37;
	Tue,  6 Feb 2024 12:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EW4jz5mk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36FE130E2B
	for <linux-gpio@vger.kernel.org>; Tue,  6 Feb 2024 12:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707220866; cv=none; b=nJ+2uik+6OhJ4HLNptfQpayoUmdVWl4roiMQR/Qi173H8DnvtCltwFv5qbPX4RGpQ4b3SpSshCb78f6yMHrxbX7UdqpQjwhGSFF44wB/dW6ksgniV8/p9byxw8+0RNAyd3RSw2nRUavejC46GjKFs4U9nVmy3J5+Bh1LhF42gag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707220866; c=relaxed/simple;
	bh=VOrFNjfV89yhuUWdBNGGX8EQ/p03GxIjR//F6QeVdms=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e/qEXWw0f5hQ3xXB1SyVg53pY6eXSH5HZz5HfgKRdBUgs9NnTU+GpHqdIU9IMHrb9TwotsUvJAclFARrbY0ykih5AlczQ52B7SU21EIemIwyMmKDt93XXFmWenYSvxX3N+3zpOFsUtdki8ccAYthLqBzfaa0X1KP3zvIhShkDoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EW4jz5mk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707220864; x=1738756864;
  h=date:from:to:cc:subject:message-id;
  bh=VOrFNjfV89yhuUWdBNGGX8EQ/p03GxIjR//F6QeVdms=;
  b=EW4jz5mkvcM9IKoIselA0nUvH/mprYS4OF0s0lQKyIQNcAJP1GKs69lG
   ggOiMIX2DZiKvSif63KVko90SCj95xBX2d6pxpdnentR2H8uo9R6+An3M
   r2dc47qB0nhZbxVMgJo+CLq9SmB7SNYWzu8RcnuyU2LMCTSq1507mEn++
   /W5t/4WTVbXk6gYEnU/Yy94AGzTFvdd1vHMuwYbw/MbwVM3xgU2pKc1Di
   irD8GRQF6/kH+QuSm6zLofp2L51SyrubNR293NkqaMjhiqYnHSBd6oPvS
   y4DA/zpJ/zUFwKDWtQsMXlmbVyTxTUGCk2vfTwldwXeQAMcf8cWRJrhS2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="18150788"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="18150788"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 04:01:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="909618800"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="909618800"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2024 04:01:01 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXK8J-0001L8-16;
	Tue, 06 Feb 2024 12:00:59 +0000
Date: Tue, 06 Feb 2024 20:00:05 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 a875746f603b86134bd1924b7289fc3542fd45e7
Message-ID: <202402062002.NbKq9tSY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: a875746f603b86134bd1924b7289fc3542fd45e7  gpio: gpiolib: make gpio_bus_type const

elapsed time: 1494m

configs tested: 273
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20240205   gcc  
arc                   randconfig-001-20240206   gcc  
arc                   randconfig-002-20240205   gcc  
arc                   randconfig-002-20240206   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                        mvebu_v5_defconfig   gcc  
arm                        mvebu_v7_defconfig   clang
arm                        neponset_defconfig   gcc  
arm                       netwinder_defconfig   gcc  
arm                   randconfig-001-20240205   clang
arm                   randconfig-002-20240205   gcc  
arm                   randconfig-002-20240206   gcc  
arm                   randconfig-003-20240205   clang
arm                   randconfig-003-20240206   gcc  
arm                   randconfig-004-20240205   clang
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240205   gcc  
arm64                 randconfig-001-20240206   gcc  
arm64                 randconfig-002-20240205   gcc  
arm64                 randconfig-003-20240205   gcc  
arm64                 randconfig-003-20240206   gcc  
arm64                 randconfig-004-20240205   gcc  
arm64                 randconfig-004-20240206   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240205   gcc  
csky                  randconfig-001-20240206   gcc  
csky                  randconfig-002-20240205   gcc  
csky                  randconfig-002-20240206   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240205   clang
hexagon               randconfig-002-20240205   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240205   clang
i386         buildonly-randconfig-002-20240205   clang
i386         buildonly-randconfig-003-20240205   clang
i386         buildonly-randconfig-003-20240206   gcc  
i386         buildonly-randconfig-004-20240205   clang
i386         buildonly-randconfig-005-20240205   clang
i386         buildonly-randconfig-005-20240206   gcc  
i386         buildonly-randconfig-006-20240205   clang
i386         buildonly-randconfig-006-20240206   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240205   clang
i386                  randconfig-002-20240205   clang
i386                  randconfig-003-20240205   clang
i386                  randconfig-004-20240205   gcc  
i386                  randconfig-005-20240205   clang
i386                  randconfig-006-20240205   gcc  
i386                  randconfig-011-20240205   gcc  
i386                  randconfig-012-20240205   clang
i386                  randconfig-012-20240206   gcc  
i386                  randconfig-013-20240205   gcc  
i386                  randconfig-014-20240205   gcc  
i386                  randconfig-014-20240206   gcc  
i386                  randconfig-015-20240205   clang
i386                  randconfig-015-20240206   gcc  
i386                  randconfig-016-20240205   gcc  
i386                  randconfig-016-20240206   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240205   gcc  
loongarch             randconfig-001-20240206   gcc  
loongarch             randconfig-002-20240205   gcc  
loongarch             randconfig-002-20240206   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          malta_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                           mtx1_defconfig   clang
mips                           rs90_defconfig   gcc  
mips                   sb1250_swarm_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240205   gcc  
nios2                 randconfig-001-20240206   gcc  
nios2                 randconfig-002-20240205   gcc  
nios2                 randconfig-002-20240206   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240205   gcc  
parisc                randconfig-001-20240206   gcc  
parisc                randconfig-002-20240205   gcc  
parisc                randconfig-002-20240206   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc                   currituck_defconfig   clang
powerpc                  iss476-smp_defconfig   gcc  
powerpc                   microwatt_defconfig   gcc  
powerpc                 mpc832x_rdb_defconfig   gcc  
powerpc                     powernv_defconfig   gcc  
powerpc                     ppa8548_defconfig   gcc  
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-001-20240205   clang
powerpc               randconfig-002-20240205   clang
powerpc               randconfig-002-20240206   gcc  
powerpc               randconfig-003-20240205   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240205   clang
powerpc64             randconfig-001-20240206   gcc  
powerpc64             randconfig-002-20240205   clang
powerpc64             randconfig-003-20240205   clang
powerpc64             randconfig-003-20240206   gcc  
riscv                            alldefconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240205   clang
riscv                 randconfig-001-20240206   gcc  
riscv                 randconfig-002-20240205   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240205   clang
s390                  randconfig-002-20240205   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                    randconfig-001-20240205   gcc  
sh                    randconfig-001-20240206   gcc  
sh                    randconfig-002-20240205   gcc  
sh                    randconfig-002-20240206   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240205   gcc  
sparc64               randconfig-001-20240206   gcc  
sparc64               randconfig-002-20240205   gcc  
sparc64               randconfig-002-20240206   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240205   clang
um                    randconfig-002-20240205   gcc  
um                    randconfig-002-20240206   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240205   clang
x86_64       buildonly-randconfig-001-20240206   gcc  
x86_64       buildonly-randconfig-002-20240205   clang
x86_64       buildonly-randconfig-002-20240206   clang
x86_64       buildonly-randconfig-003-20240205   gcc  
x86_64       buildonly-randconfig-003-20240206   gcc  
x86_64       buildonly-randconfig-004-20240205   gcc  
x86_64       buildonly-randconfig-004-20240206   gcc  
x86_64       buildonly-randconfig-005-20240205   gcc  
x86_64       buildonly-randconfig-005-20240206   gcc  
x86_64       buildonly-randconfig-006-20240205   gcc  
x86_64       buildonly-randconfig-006-20240206   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240205   gcc  
x86_64                randconfig-001-20240206   clang
x86_64                randconfig-002-20240205   gcc  
x86_64                randconfig-002-20240206   clang
x86_64                randconfig-003-20240205   clang
x86_64                randconfig-003-20240206   gcc  
x86_64                randconfig-004-20240205   gcc  
x86_64                randconfig-004-20240206   gcc  
x86_64                randconfig-005-20240205   gcc  
x86_64                randconfig-005-20240206   gcc  
x86_64                randconfig-006-20240205   gcc  
x86_64                randconfig-006-20240206   clang
x86_64                randconfig-011-20240205   gcc  
x86_64                randconfig-011-20240206   gcc  
x86_64                randconfig-012-20240205   gcc  
x86_64                randconfig-012-20240206   clang
x86_64                randconfig-013-20240205   clang
x86_64                randconfig-013-20240206   gcc  
x86_64                randconfig-014-20240205   clang
x86_64                randconfig-014-20240206   clang
x86_64                randconfig-015-20240205   gcc  
x86_64                randconfig-015-20240206   gcc  
x86_64                randconfig-016-20240205   clang
x86_64                randconfig-016-20240206   clang
x86_64                randconfig-071-20240205   clang
x86_64                randconfig-071-20240206   gcc  
x86_64                randconfig-072-20240205   gcc  
x86_64                randconfig-072-20240206   gcc  
x86_64                randconfig-073-20240205   clang
x86_64                randconfig-073-20240206   gcc  
x86_64                randconfig-074-20240205   clang
x86_64                randconfig-074-20240206   gcc  
x86_64                randconfig-075-20240205   gcc  
x86_64                randconfig-075-20240206   clang
x86_64                randconfig-076-20240205   clang
x86_64                randconfig-076-20240206   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240206   gcc  
xtensa                randconfig-002-20240205   gcc  
xtensa                randconfig-002-20240206   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

