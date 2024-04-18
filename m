Return-Path: <linux-gpio+bounces-5652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D97CF8A964E
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Apr 2024 11:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D20BB22DFE
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Apr 2024 09:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BA415B13E;
	Thu, 18 Apr 2024 09:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSQH/Ouf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC3515B0FD
	for <linux-gpio@vger.kernel.org>; Thu, 18 Apr 2024 09:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713433016; cv=none; b=GiZf/R7+WIdHwgiMBzfOAybJzKI1BazHD8R0LjPFBSbI9Xj6JfrLrMG2xyt5HN54pB8hYaBB6dP3RkQ5QyeMr8iv/bLa6VAcBsM50tZi6P9vGdzE5R0PPWb8qWjBXOT5+0DZmyFujMvVOs/O0+I70WeqbWKDA15lqnOV/XgaRq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713433016; c=relaxed/simple;
	bh=egrTr8E+o3Mqynn6ibEr8xTnb8/8UJqBmFR5GF6e03M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q/AWG+ZpnZaiMSmx7yKWNohj0jczG77ZnEXlA1vd1Yhdw0aYE7yMUwgIvZ1tyZEB+JpgzujZvWq/Rc+vJZw28IKbLVBS+eHW8NXflBEvB9yeTr0AHCUN7Ie5pZUtbdbvEsT+U3wpbHJbT9I2r8DktZKvl18Oho+fJJXfyKdzKd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSQH/Ouf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713433015; x=1744969015;
  h=date:from:to:cc:subject:message-id;
  bh=egrTr8E+o3Mqynn6ibEr8xTnb8/8UJqBmFR5GF6e03M=;
  b=LSQH/Oufp2pr7KSiTTGMRURcjbqRPlKAUQU5N9CmQIfIeLww7OhVLXP6
   7ya/du6fF+wA9fCb6rqxB03Wz5mEk8qvOjpR1Am0Vju5gwDvzEOp5hPxu
   axl91ZWblAmz2MTyVY/Hpd6p5NNgy4KwbDXyBDEnvMEa271hzGcKwVr5x
   GFymM5fsfrg3CH1Hz5WmLirVL2ZZmP0IcgC6kPA/EICh9sCWuooDFGigt
   MA5GlaFVVZ+FHcDZJ/GHN3uQ5XnRh08zbYn9xLw93iaMgu8sDkMUkHxIc
   0jlGVt29NC1nHb0Ku5yRd1LTugmUIVgFKQvXReqw72ASCIkVU6iD+iEBI
   w==;
X-CSE-ConnectionGUID: OqFsE+KZTsGv4LSb1pFMsg==
X-CSE-MsgGUID: fQmPJHChTG6hXopsN93iUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20114198"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="20114198"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 02:36:55 -0700
X-CSE-ConnectionGUID: NRz/1jNyRPyrsrEkgN+i1w==
X-CSE-MsgGUID: mDVgr1IASsaaJ/ACpQ3NIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="27699627"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 Apr 2024 02:36:53 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxOCH-0007T3-2K;
	Thu, 18 Apr 2024 09:36:50 +0000
Date: Thu, 18 Apr 2024 17:36:28 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 8a7a6103258715857310253ec2193bcc4d1d7082
Message-ID: <202404181726.XzPWU1uM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 8a7a6103258715857310253ec2193bcc4d1d7082  gpiolib: Get rid of never false gpio_is_valid() calls

elapsed time: 740m

configs tested: 114
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
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240418   gcc  
i386         buildonly-randconfig-002-20240418   gcc  
i386         buildonly-randconfig-003-20240418   clang
i386         buildonly-randconfig-004-20240418   gcc  
i386         buildonly-randconfig-005-20240418   clang
i386         buildonly-randconfig-006-20240418   clang
i386                                defconfig   clang
i386                  randconfig-001-20240418   gcc  
i386                  randconfig-002-20240418   gcc  
i386                  randconfig-003-20240418   clang
i386                  randconfig-004-20240418   gcc  
i386                  randconfig-005-20240418   gcc  
i386                  randconfig-006-20240418   gcc  
i386                  randconfig-011-20240418   clang
i386                  randconfig-012-20240418   clang
i386                  randconfig-013-20240418   gcc  
i386                  randconfig-014-20240418   gcc  
i386                  randconfig-015-20240418   gcc  
i386                  randconfig-016-20240418   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240418   clang
x86_64       buildonly-randconfig-002-20240418   clang
x86_64       buildonly-randconfig-003-20240418   clang
x86_64       buildonly-randconfig-004-20240418   clang
x86_64       buildonly-randconfig-005-20240418   gcc  
x86_64       buildonly-randconfig-006-20240418   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240418   gcc  
x86_64                randconfig-002-20240418   clang
x86_64                randconfig-003-20240418   gcc  
x86_64                randconfig-004-20240418   clang
x86_64                randconfig-005-20240418   gcc  
x86_64                randconfig-006-20240418   gcc  
x86_64                randconfig-012-20240418   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

