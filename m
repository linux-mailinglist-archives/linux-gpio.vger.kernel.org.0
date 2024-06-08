Return-Path: <linux-gpio+bounces-7281-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C12C6901215
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 16:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB9491C20D56
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 14:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBB724B29;
	Sat,  8 Jun 2024 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a63OleYZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7B918E1D
	for <linux-gpio@vger.kernel.org>; Sat,  8 Jun 2024 14:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717857421; cv=none; b=m6UUsLWmyTl8HdXhsvD9VWbfdByhTg4ngu5r4CtxSp5GeHJnl+8v0mpYo9rcNGoGGNyw9/wTsQmVfolpQcxg5c3Lnkx1etgYdkGsrHgRaBe/6AEGoGeVfi1JI4LAUXS9REdxkfk3MMPf267h5uyEtGUkbQ3X0mJx3SM4oYAKiQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717857421; c=relaxed/simple;
	bh=3R2GaduFe9QbM+h19L8j1z1AEtbUvk0Uq/FZ+KXa8lQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VGhHWGVqC3o/sUU8SgMb83KjKR+BpPA4i4tXV+o2BPGqN6vtraX+TfazMIhLLdGpKfoObQLVj8XlpxMmr3ow6OeOlsf7Ej6OqfGjNeT/Q8vPzDjOTvaRWVlsMGKqHBAuPqGX/MsKbAMZfZhBkAZ4VXtUpyo6ibeVZZyq79Qa3OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a63OleYZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717857419; x=1749393419;
  h=date:from:to:cc:subject:message-id;
  bh=3R2GaduFe9QbM+h19L8j1z1AEtbUvk0Uq/FZ+KXa8lQ=;
  b=a63OleYZCEqze5QIybcKPskowAuDHTzUk13p+u2T4WpEIQc2BVd0rTPD
   DoRc2rhKxYbL+UEUWOIWXRmMEj91XKXCtp3MWLP2Pgixuhd9uL9VLb6xB
   Gg0KEb8DNANjgpWuxZNMWdCGPioolePpjYQquJUr7HVsIFbZTO9jc71dC
   zT4z6xSuw690zv4Kh9f8Nt9p3k4jZi5RRvd1aY38EWjO0rm//kuPqbEwV
   aQGYBpwwtNKwydqsQ02qPfFT6M/o6aiP8EhqniE1q5kxRlUwKjORA9R3s
   HLt0ehO75p5T9lKRrCRVP1IposnhFpDXJYTebqE4pPCZVwAMTWa2fPceo
   Q==;
X-CSE-ConnectionGUID: 6Gj4Jw9KTkuFhn++SQgPow==
X-CSE-MsgGUID: AsYVihpKQOC9NUbcx0ZE5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14526973"
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="14526973"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 07:36:59 -0700
X-CSE-ConnectionGUID: 8bDPTGCdSoOvqxyjBcuwwg==
X-CSE-MsgGUID: RHaD/BLiRI2lCnCeiz973w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="38548904"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Jun 2024 07:36:58 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFxBf-000038-2s;
	Sat, 08 Jun 2024 14:36:55 +0000
Date: Sat, 08 Jun 2024 22:36:42 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 64054eb716db52e4246527dc9414377c5bc5b01d
Message-ID: <202406082241.FPimcsXa-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 64054eb716db52e4246527dc9414377c5bc5b01d  gpio: add missing MODULE_DESCRIPTION() macros

elapsed time: 1818m

configs tested: 77
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240608   gcc  
arc                   randconfig-002-20240608   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                   randconfig-001-20240608   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386         buildonly-randconfig-001-20240608   gcc  
i386         buildonly-randconfig-002-20240608   clang
i386         buildonly-randconfig-003-20240608   gcc  
i386         buildonly-randconfig-004-20240608   gcc  
i386         buildonly-randconfig-005-20240608   clang
i386         buildonly-randconfig-006-20240608   gcc  
i386                  randconfig-001-20240608   clang
i386                  randconfig-002-20240608   gcc  
i386                  randconfig-003-20240608   gcc  
i386                  randconfig-004-20240608   clang
i386                  randconfig-005-20240608   gcc  
i386                  randconfig-006-20240608   gcc  
i386                  randconfig-011-20240608   clang
i386                  randconfig-012-20240608   clang
i386                  randconfig-013-20240608   clang
i386                  randconfig-014-20240608   gcc  
i386                  randconfig-015-20240608   clang
i386                  randconfig-016-20240608   clang
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                                defconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
s390                              allnoconfig   clang
s390                                defconfig   clang
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64       buildonly-randconfig-001-20240608   clang
x86_64       buildonly-randconfig-002-20240608   gcc  
x86_64       buildonly-randconfig-003-20240608   clang
x86_64       buildonly-randconfig-004-20240608   gcc  
x86_64       buildonly-randconfig-005-20240608   gcc  
x86_64                              defconfig   gcc  
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

