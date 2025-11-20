Return-Path: <linux-gpio+bounces-28862-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 806E4C71B39
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 02:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3525334A1F2
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 01:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB3A262FC0;
	Thu, 20 Nov 2025 01:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmyIp+4P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4D71534EC
	for <linux-gpio@vger.kernel.org>; Thu, 20 Nov 2025 01:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763603049; cv=none; b=fwJ79qLdzDhnub025u9e42OiQ6k3FUjNxhE0ZcyMfyPv7THcUkwGwYe0Lrm2drBg9QeotzMiII7xkX4+xQcdbXPD6EeXz1HBBa1OZh+6fMKZm4NMmmMj3FZo+KPnCX0ByKyfqoHWNqQXo85mbZlGygSTO0LjUWcrqQuewUtRXrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763603049; c=relaxed/simple;
	bh=FGknWrLGTE7mVbZ/8UmMRWrBjd/Yfbd4rSSy4BWTjDQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g1IVxMS4vIwwHTiuzS6CC1XC8/NXki7fvcDZLJUig/1KSqc5or0KonHik7a+40g2N2zlDgIfGi0FNdpEnrt4cROC3GtHQ79SZi1dKGUT2DRIfWwq7gziIZHePPXlz+BWSyil0zdrjmcou0+0uK49fxKJ0wktWdK4dumwBBsoZ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmyIp+4P; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763603047; x=1795139047;
  h=date:from:to:cc:subject:message-id;
  bh=FGknWrLGTE7mVbZ/8UmMRWrBjd/Yfbd4rSSy4BWTjDQ=;
  b=LmyIp+4PCOrM6Jdryb79NEVP00Ylq8AdMXb9vx9JD4JuA+ek7p6dG4Y3
   2tNGj6nh2LvF4qxkhDOdnvOq89XtOcv1ujhTaiY/cireBEy+XKsxESAzR
   gvBtjx4KCSAlcyk73y+YXWMCcmfXey1mjm68eXaiN1xIFzRrkeI+ONmxB
   E8YIKXJM29xVCwIM/vDCaCNLxDQiHNZ8rzoKJkZZAOVkPNpMaJzp4gUYq
   phQMvgrLth7XpcRV+rHzWicdK6/aLCzCNlMK6yP4Hjp6oIS8wUUNrdjf3
   M2y85vYS/GCS776QCCFazoe0b3vnojUeYcXAMOGqk3t9bUam/CAmmcjo+
   A==;
X-CSE-ConnectionGUID: oy4TtgClQzmax6+YUo5xIA==
X-CSE-MsgGUID: /d5ocn3vQhydwHR+lKqJQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="83282353"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="83282353"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 17:44:04 -0800
X-CSE-ConnectionGUID: 6nMtozwuS820gEpfxjG3ug==
X-CSE-MsgGUID: 9xe5SmB+TKipz357DdwFig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="191484294"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Nov 2025 17:44:03 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLtiL-0003V1-1N;
	Thu, 20 Nov 2025 01:44:01 +0000
Date: Thu, 20 Nov 2025 09:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 0341d1b1ebf10bcbb9f35e174e83dbb21068387d
Message-ID: <202511200959.kKQ7rA5f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 0341d1b1ebf10bcbb9f35e174e83dbb21068387d  pinctrl: airoha: Fix AIROHA_PINCTRL_CONFS_DRIVE_E2 in an7583_pinctrl_match_data

elapsed time: 1533m

configs tested: 123
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251119    gcc-10.5.0
arc                   randconfig-002-20251119    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                                 defconfig    clang-22
arm                            mmp2_defconfig    gcc-15.1.0
arm                            mps2_defconfig    clang-22
arm                   randconfig-001-20251119    gcc-8.5.0
arm                   randconfig-002-20251119    clang-16
arm                   randconfig-003-20251119    clang-22
arm                   randconfig-004-20251119    gcc-13.4.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251119    clang-22
arm64                 randconfig-002-20251119    gcc-8.5.0
arm64                 randconfig-003-20251119    clang-22
arm64                 randconfig-004-20251119    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251119    gcc-15.1.0
csky                  randconfig-002-20251119    gcc-10.5.0
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251120    clang-22
hexagon               randconfig-002-20251120    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251119    gcc-14
i386        buildonly-randconfig-002-20251119    clang-20
i386        buildonly-randconfig-003-20251119    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251120    gcc-14
i386                  randconfig-002-20251120    gcc-14
i386                  randconfig-003-20251120    clang-20
i386                  randconfig-004-20251120    clang-20
i386                  randconfig-005-20251120    clang-20
i386                  randconfig-006-20251120    clang-20
i386                  randconfig-007-20251120    gcc-14
i386                  randconfig-011-20251119    clang-20
i386                  randconfig-012-20251119    clang-20
i386                  randconfig-013-20251119    clang-20
i386                  randconfig-014-20251119    gcc-14
i386                  randconfig-015-20251119    gcc-14
i386                  randconfig-016-20251119    clang-20
i386                  randconfig-017-20251119    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251120    clang-22
loongarch             randconfig-002-20251120    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251120    gcc-9.5.0
nios2                 randconfig-002-20251120    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251119    gcc-8.5.0
parisc                randconfig-002-20251119    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251119    clang-16
powerpc               randconfig-002-20251119    clang-22
powerpc                  storcenter_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251119    clang-19
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251119    gcc-15.1.0
riscv                 randconfig-002-20251119    gcc-10.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251119    gcc-8.5.0
s390                  randconfig-002-20251119    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          landisk_defconfig    gcc-15.1.0
sh                    randconfig-001-20251119    gcc-11.5.0
sh                    randconfig-002-20251119    gcc-9.5.0
sh                           se7619_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251119    gcc-15.1.0
sparc                 randconfig-002-20251119    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251119    gcc-15.1.0
sparc64               randconfig-002-20251119    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251119    clang-16
um                    randconfig-002-20251119    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251119    gcc-14
x86_64      buildonly-randconfig-002-20251119    gcc-14
x86_64      buildonly-randconfig-003-20251119    clang-20
x86_64      buildonly-randconfig-004-20251119    clang-20
x86_64      buildonly-randconfig-005-20251119    gcc-14
x86_64      buildonly-randconfig-006-20251119    gcc-12
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251120    gcc-14
x86_64                randconfig-002-20251120    clang-20
x86_64                randconfig-003-20251120    clang-20
x86_64                randconfig-004-20251120    gcc-14
x86_64                randconfig-005-20251120    gcc-12
x86_64                randconfig-006-20251120    gcc-14
x86_64                randconfig-011-20251120    clang-20
x86_64                randconfig-012-20251120    gcc-13
x86_64                randconfig-013-20251120    gcc-14
x86_64                randconfig-014-20251120    gcc-14
x86_64                randconfig-015-20251120    gcc-14
x86_64                randconfig-016-20251120    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251119    gcc-8.5.0
xtensa                randconfig-002-20251119    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

