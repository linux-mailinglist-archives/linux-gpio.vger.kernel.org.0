Return-Path: <linux-gpio+bounces-6248-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E948C0374
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 19:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 677B01C208B4
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 17:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F02012D1EF;
	Wed,  8 May 2024 17:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CbJc++Oz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4C212C558
	for <linux-gpio@vger.kernel.org>; Wed,  8 May 2024 17:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715190159; cv=none; b=fV71EcLIXzgjfaY624gfTpqdRa4dlYPk9eL0AIhZS81Cc3627v+TfpQgiES1H2SNrKLidjNAE3kX/Z8NdHjEF95siigPBUDTDtCbtH10wSWaIlZuIqcP9bIxGGzLcPc0WeiimLu1t5An3d1V2pvXevVeqV0vRScY9n7LZjzUKXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715190159; c=relaxed/simple;
	bh=5R4Un7lmu0bdjwzcKNImYdmmznbX7qdwYJ07NR/PMBY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YBe44yMoGww9sWZQ7e5rwsgZqNyCve/KhOjkYVxhktLQLa3u2aP3jYzzeiuNBnnn5BOW0TBoxJvzRVajuqNKifLwVjmtnEZaD9zRg99yeFsKj1fd5bz817aBNp4HMYfdfo/c9Y5KtxjToTTFt1TGuWybbtT0Oh+7aVzABL35v2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CbJc++Oz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715190158; x=1746726158;
  h=date:from:to:cc:subject:message-id;
  bh=5R4Un7lmu0bdjwzcKNImYdmmznbX7qdwYJ07NR/PMBY=;
  b=CbJc++OzOd7XL1fIrwpDVEmeYODSKAuPQU3h6LNBlPyBUbb5Zixmek1z
   j5oj77yn/g1neCghK+8EWyMIl2f1w2Uzwr/qBsWiPfyTzEMZNh0O4nAJZ
   tUsalZX1a1kdOZbOiSQoNHG/vwK1rqe5ijgudzjOsvER3IBMH0IjDG/Mk
   SvQQANbwOzYTR3DQzO+ObJoevdq5hgZRgniNhai9wwmV/Utoy2ZqumD+Z
   4C43p6D3uDxmncnJ77FNwQJnXUhi6piF/Qz5dvKHHtXUiMn+qJjW5nzZd
   f4Me6pN0PLaFcv1MUKw2CNeJksNSqpdRPGwe+Wx5a99vFQuEQZsa037Aa
   Q==;
X-CSE-ConnectionGUID: v5qQMfKiR5ePZUIWBIqCAA==
X-CSE-MsgGUID: GmXEcKQlT1yV2kdL4xiCaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="10940217"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="10940217"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 10:42:37 -0700
X-CSE-ConnectionGUID: PetasB3tRPa3K8Bxh4nAdQ==
X-CSE-MsgGUID: vxZLts0oTsuirQDldB4f3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="28846250"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 May 2024 10:42:36 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4lJJ-0003yD-2G;
	Wed, 08 May 2024 17:42:33 +0000
Date: Thu, 09 May 2024 01:42:07 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 a86d27693066a34a29be86f394bbad847b2d1749
Message-ID: <202405090106.M22Gcsue-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: a86d27693066a34a29be86f394bbad847b2d1749  gpiolib: fix the speed of descriptor label setting with SRCU

elapsed time: 1481m

configs tested: 157
configs skipped: 4

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
arc                   randconfig-001-20240508   gcc  
arc                   randconfig-002-20240508   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   clang
arm                                 defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                          pxa168_defconfig   clang
arm                   randconfig-001-20240508   gcc  
arm                         s3c6400_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240508   gcc  
arm64                 randconfig-003-20240508   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240508   gcc  
csky                  randconfig-002-20240508   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240508   clang
i386         buildonly-randconfig-002-20240508   clang
i386         buildonly-randconfig-005-20240508   clang
i386                                defconfig   clang
i386                  randconfig-002-20240508   clang
i386                  randconfig-003-20240508   clang
i386                  randconfig-005-20240508   clang
i386                  randconfig-013-20240508   clang
i386                  randconfig-014-20240508   clang
i386                  randconfig-015-20240508   clang
i386                  randconfig-016-20240508   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240508   gcc  
loongarch             randconfig-002-20240508   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                           mtx1_defconfig   clang
mips                   sb1250_swarm_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240508   gcc  
nios2                 randconfig-002-20240508   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240508   gcc  
parisc                randconfig-002-20240508   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc                       ppc64_defconfig   clang
powerpc               randconfig-002-20240508   gcc  
powerpc64             randconfig-001-20240508   gcc  
powerpc64             randconfig-002-20240508   gcc  
powerpc64             randconfig-003-20240508   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240508   gcc  
riscv                 randconfig-002-20240508   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240508   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                    randconfig-001-20240508   gcc  
sh                    randconfig-002-20240508   gcc  
sh                           se7619_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240508   gcc  
sparc64               randconfig-002-20240508   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240508   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240508   clang
x86_64       buildonly-randconfig-002-20240508   clang
x86_64       buildonly-randconfig-003-20240508   clang
x86_64       buildonly-randconfig-004-20240508   clang
x86_64       buildonly-randconfig-006-20240508   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-002-20240508   clang
x86_64                randconfig-003-20240508   clang
x86_64                randconfig-011-20240508   clang
x86_64                randconfig-012-20240508   clang
x86_64                randconfig-015-20240508   clang
x86_64                randconfig-073-20240508   clang
x86_64                randconfig-076-20240508   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240508   gcc  
xtensa                randconfig-002-20240508   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

