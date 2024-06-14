Return-Path: <linux-gpio+bounces-7446-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6288F90878A
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 11:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE75A1F249F8
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 09:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39511922FC;
	Fri, 14 Jun 2024 09:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6+PJx+9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27011922FA
	for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2024 09:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718357631; cv=none; b=KoYRROZeUOzx2XQITMFfRbPG8Oam1hXQsmqRbzlONv+GiNsEw5yqNi7KgxRwtQlqaQZFgo4NjmFjDfc6O2Rc0iuegIoywAgsAqlQK62vhN52uvhgANtVHTnwxNoBMXV/ChG1eKTf02mUtKb4+z5KOeq5T3EA0gg2kKeQ7GjLJCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718357631; c=relaxed/simple;
	bh=E6rkGI586mroqWzRGbyQTgWjIct7146Zf9Pfi+e2NKo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IiHDnweG8sNaa5OpOqesSSgUSjhSUXzwaSZT/oOZd1WXpMrWcbCqOiGeBIMPfVpsdJxUyEhaZ3/OPnmDiM9IPbTge7hadqJZq/S9wLsEWIkjCkleHbGhKmotklkSWuf0YG3+CWqd2UrpqKbRC+qRF0ErbvCOIveafFEAehoRbBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6+PJx+9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718357631; x=1749893631;
  h=date:from:to:cc:subject:message-id;
  bh=E6rkGI586mroqWzRGbyQTgWjIct7146Zf9Pfi+e2NKo=;
  b=g6+PJx+9lgg6VkVZX3sw+iGDQc/8YL5QAhdLKwjo2VEGxij4bhBMcHSs
   Dr5m9YUG58Y3AnKcG/32O3b7/y8psaJllbXNHWghAEfRkKob509JiIHrq
   zBQHPiuy2tr6xZCele3zg5AUYklKZzknqIGhabQdQkT7SFPy++xS0Vbuq
   reuipdkhkLAOdHkQAiWt0lIOCDXRForBiR8pnlyaMO1yQpmNxus04rzMs
   sKgyFx1J2yDrN7J9JsUqm8Sv6w9kruxgAnyolX4ON4lnOwmi1VbsvVL6M
   PHH7hP03BekyjWwyy7wjwY/7DzaJGAbq2QzvcofaSEOiwWMnsrePTIXpu
   g==;
X-CSE-ConnectionGUID: 2Bk5c9+URaeYEJ0jouWQmg==
X-CSE-MsgGUID: IPncqdo4QKi3PoOaJBBR5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="37758853"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="37758853"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 02:33:50 -0700
X-CSE-ConnectionGUID: FEaskXXYQWqYnuKzdrKg+g==
X-CSE-MsgGUID: H7z15xBZQ0a7aUMVJs77Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="40547908"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jun 2024 02:33:48 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI3Ja-00015g-0l;
	Fri, 14 Jun 2024 09:33:46 +0000
Date: Fri, 14 Jun 2024 17:33:33 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 5c13cb42e074d27e79943e133863430acc4151ee
Message-ID: <202406141730.ExUV4j2k-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 5c13cb42e074d27e79943e133863430acc4151ee  pinctrl: keembay: Fixed missing member check

elapsed time: 1507m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240614   gcc-13.2.0
arc                   randconfig-002-20240614   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                                 defconfig   clang-14
arm                   randconfig-001-20240614   gcc-13.2.0
arm                   randconfig-002-20240614   gcc-13.2.0
arm                   randconfig-003-20240614   gcc-13.2.0
arm                   randconfig-004-20240614   clang-19
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240614   gcc-13.2.0
arm64                 randconfig-002-20240614   clang-19
arm64                 randconfig-003-20240614   gcc-13.2.0
arm64                 randconfig-004-20240614   clang-19
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240614   gcc-13.2.0
csky                  randconfig-002-20240614   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240614   clang-19
hexagon               randconfig-002-20240614   clang-19
i386         buildonly-randconfig-001-20240614   clang-18
i386         buildonly-randconfig-002-20240614   clang-18
i386         buildonly-randconfig-003-20240614   gcc-12
i386         buildonly-randconfig-004-20240614   gcc-8
i386         buildonly-randconfig-005-20240614   gcc-13
i386         buildonly-randconfig-006-20240614   gcc-10
i386                  randconfig-001-20240614   gcc-13
i386                  randconfig-002-20240614   gcc-8
i386                  randconfig-003-20240614   gcc-13
i386                  randconfig-004-20240614   clang-18
i386                  randconfig-005-20240614   gcc-13
i386                  randconfig-006-20240614   gcc-10
i386                  randconfig-011-20240614   gcc-13
i386                  randconfig-012-20240614   clang-18
i386                  randconfig-013-20240614   gcc-13
i386                  randconfig-014-20240614   gcc-13
i386                  randconfig-015-20240614   clang-18
i386                  randconfig-016-20240614   clang-18
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240614   gcc-13.2.0
loongarch             randconfig-002-20240614   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240614   gcc-13.2.0
nios2                 randconfig-002-20240614   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240614   gcc-13.2.0
parisc                randconfig-002-20240614   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240614   gcc-13.2.0
powerpc               randconfig-002-20240614   clang-19
powerpc               randconfig-003-20240614   gcc-13.2.0
powerpc64             randconfig-001-20240614   clang-19
powerpc64             randconfig-002-20240614   gcc-13.2.0
powerpc64             randconfig-003-20240614   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240614   gcc-13.2.0
riscv                 randconfig-002-20240614   clang-19
s390                              allnoconfig   clang-19
s390                                defconfig   clang-19
s390                  randconfig-001-20240614   gcc-13.2.0
s390                  randconfig-002-20240614   clang-19
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240614   gcc-13.2.0
sh                    randconfig-002-20240614   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240614   gcc-13.2.0
sparc64               randconfig-002-20240614   gcc-13.2.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240614   gcc-13
um                    randconfig-002-20240614   gcc-13
um                           x86_64_defconfig   clang-15
x86_64       buildonly-randconfig-001-20240614   clang-18
x86_64       buildonly-randconfig-002-20240614   gcc-8
x86_64       buildonly-randconfig-003-20240614   clang-18
x86_64       buildonly-randconfig-004-20240614   gcc-8
x86_64       buildonly-randconfig-005-20240614   gcc-10
x86_64       buildonly-randconfig-006-20240614   clang-18
x86_64                randconfig-001-20240614   clang-18
x86_64                randconfig-002-20240614   clang-18
x86_64                randconfig-003-20240614   clang-18
x86_64                randconfig-004-20240614   gcc-11
x86_64                randconfig-005-20240614   clang-18
x86_64                randconfig-006-20240614   clang-18
x86_64                randconfig-011-20240614   clang-18
x86_64                randconfig-012-20240614   clang-18
x86_64                randconfig-013-20240614   gcc-10
x86_64                randconfig-014-20240614   gcc-8
x86_64                randconfig-015-20240614   gcc-13
x86_64                randconfig-016-20240614   gcc-13
x86_64                randconfig-071-20240614   gcc-10
x86_64                randconfig-072-20240614   gcc-13
x86_64                randconfig-073-20240614   clang-18
x86_64                randconfig-074-20240614   gcc-10
x86_64                randconfig-075-20240614   gcc-13
x86_64                randconfig-076-20240614   gcc-13
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240614   gcc-13.2.0
xtensa                randconfig-002-20240614   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

