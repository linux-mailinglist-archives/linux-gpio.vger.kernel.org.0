Return-Path: <linux-gpio+bounces-27252-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D42FBBEA8FD
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 18:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6A41946287
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 15:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EEF330B2F;
	Fri, 17 Oct 2025 15:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FrvJnbGG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02D8330B0F
	for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2025 15:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760715688; cv=none; b=O1+3N077NpEvm8i3jTg2HVz960mF+5sVetJTzix8kOc2N8qU0nK+pS7zHlXpvpwdRikTT4xgi1rSVIYTij9HJSoUTLVzvbFmjp1q0MymfHymO7mkPsjQadrrma8gs2AhO28nhXhGmrHkhJPfdxnHZ+J0OVha7O5EnBc0MbMi5W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760715688; c=relaxed/simple;
	bh=07FfYMvTYB5Vt/Ee+8p1RhzPkHSPCQDsAu33o360zFY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hh76TvoO/NkQM07BuVhiURiyisvm5PbtppSm9qQsXgyO5uecgZ+1xeDm4UTV8d09/HXeoVoP+or9qeWPnQzczicptYjZznjFg2ffBmxO5/jzJmBUiU2nPVoYeFOGdNxMOraY85wc5jjyzxR6l5x3YG/9fLCD8Z8UPo+7VHqx8cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FrvJnbGG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760715686; x=1792251686;
  h=date:from:to:cc:subject:message-id;
  bh=07FfYMvTYB5Vt/Ee+8p1RhzPkHSPCQDsAu33o360zFY=;
  b=FrvJnbGGJgVg4m/502sVJ2YUneYkjPekOzlWJPV4lc26itgKE6rIsc9u
   t02YReSki/aStq/EZQB0f3iY8pcIceoqnLU47Yl3xx3x+RnJRvU/TCHhe
   zCPRDp6dFDTfGEsL8Powt+q9ODDgHRrmIT2C4rb9F63fedDR9vQpDe5VL
   9ValXMbwlbvw+utiO1T4HftuTQzThrP5uaFGlVWbVLj2/VaKh4uoM/Lf1
   jQfUfhRkSzUbjULAlCMHmqXNNIpxc3H7CCcCHThhQ9FBZ8zqTV+fiMz7J
   QhQ202h5iF+G4igcXwtjx21qzbWqsq3Hl/EJtNyAxiWoBJmDhkuh+82FW
   Q==;
X-CSE-ConnectionGUID: E3/hmzzxTtSofihl58j1PA==
X-CSE-MsgGUID: HTT/n1kuScaGiZ81jP3PvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="62832163"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="62832163"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 08:41:26 -0700
X-CSE-ConnectionGUID: 22IC3TPATMyNqwGAnCP1Fg==
X-CSE-MsgGUID: AsvVezHfQ/eD9Nem1K/xpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="213728829"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Oct 2025 08:41:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9ma3-0006qF-00;
	Fri, 17 Oct 2025 15:41:23 +0000
Date: Fri, 17 Oct 2025 23:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 eba11116f39533d2e38cc5898014f2c95f32d23a
Message-ID: <202510172357.nkXMC1Cx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: eba11116f39533d2e38cc5898014f2c95f32d23a  gpiolib: of: Get rid of <linux/gpio/legacy-of-mm-gpiochip.h>

elapsed time: 1449m

configs tested: 164
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251017    clang-22
arc                   randconfig-001-20251017    gcc-8.5.0
arc                   randconfig-002-20251017    clang-22
arc                   randconfig-002-20251017    gcc-11.5.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251017    clang-22
arm                   randconfig-001-20251017    gcc-15.1.0
arm                   randconfig-002-20251017    clang-22
arm                   randconfig-003-20251017    clang-22
arm                   randconfig-004-20251017    clang-22
arm                         wpcm450_defconfig    gcc-15.1.0
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251017    clang-20
arm64                 randconfig-001-20251017    clang-22
arm64                 randconfig-002-20251017    clang-22
arm64                 randconfig-003-20251017    clang-22
arm64                 randconfig-003-20251017    gcc-15.1.0
arm64                 randconfig-004-20251017    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251017    gcc-15.1.0
csky                  randconfig-002-20251017    gcc-10.5.0
csky                  randconfig-002-20251017    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251017    clang-22
hexagon               randconfig-001-20251017    gcc-15.1.0
hexagon               randconfig-002-20251017    clang-22
hexagon               randconfig-002-20251017    gcc-15.1.0
i386        buildonly-randconfig-001-20251017    clang-20
i386        buildonly-randconfig-002-20251017    clang-20
i386        buildonly-randconfig-003-20251017    clang-20
i386        buildonly-randconfig-004-20251017    clang-20
i386        buildonly-randconfig-005-20251017    clang-20
i386        buildonly-randconfig-006-20251017    clang-20
i386                  randconfig-001-20251017    clang-20
i386                  randconfig-002-20251017    clang-20
i386                  randconfig-003-20251017    clang-20
i386                  randconfig-004-20251017    clang-20
i386                  randconfig-005-20251017    clang-20
i386                  randconfig-006-20251017    clang-20
i386                  randconfig-007-20251017    clang-20
i386                  randconfig-011-20251017    gcc-12
i386                  randconfig-012-20251017    gcc-12
i386                  randconfig-013-20251017    gcc-12
i386                  randconfig-014-20251017    gcc-12
i386                  randconfig-015-20251017    gcc-12
i386                  randconfig-016-20251017    gcc-12
i386                  randconfig-017-20251017    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251017    gcc-13.4.0
loongarch             randconfig-001-20251017    gcc-15.1.0
loongarch             randconfig-002-20251017    clang-18
loongarch             randconfig-002-20251017    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                       rbtx49xx_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251017    gcc-15.1.0
nios2                 randconfig-001-20251017    gcc-8.5.0
nios2                 randconfig-002-20251017    gcc-15.1.0
nios2                 randconfig-002-20251017    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-32bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20251017    gcc-12.5.0
parisc                randconfig-001-20251017    gcc-15.1.0
parisc                randconfig-002-20251017    gcc-15.1.0
parisc                randconfig-002-20251017    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251017    gcc-14.3.0
powerpc               randconfig-001-20251017    gcc-15.1.0
powerpc               randconfig-002-20251017    clang-22
powerpc               randconfig-002-20251017    gcc-15.1.0
powerpc               randconfig-003-20251017    gcc-11.5.0
powerpc               randconfig-003-20251017    gcc-15.1.0
powerpc64             randconfig-001-20251017    clang-20
powerpc64             randconfig-001-20251017    gcc-15.1.0
powerpc64             randconfig-002-20251017    gcc-15.1.0
powerpc64             randconfig-003-20251017    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251017    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251017    clang-22
s390                  randconfig-002-20251017    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20251017    gcc-14.3.0
sh                    randconfig-002-20251017    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sh                            titan_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251017    gcc-12.5.0
sparc                 randconfig-002-20251017    gcc-8.5.0
sparc64               randconfig-001-20251017    gcc-14.3.0
sparc64               randconfig-002-20251017    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20251017    gcc-14
um                    randconfig-002-20251017    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251017    clang-20
x86_64      buildonly-randconfig-001-20251017    gcc-14
x86_64      buildonly-randconfig-002-20251017    clang-20
x86_64      buildonly-randconfig-002-20251017    gcc-14
x86_64      buildonly-randconfig-003-20251017    clang-20
x86_64      buildonly-randconfig-004-20251017    clang-20
x86_64      buildonly-randconfig-004-20251017    gcc-14
x86_64      buildonly-randconfig-005-20251017    clang-20
x86_64      buildonly-randconfig-006-20251017    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251017    gcc-14
x86_64                randconfig-002-20251017    gcc-14
x86_64                randconfig-003-20251017    gcc-14
x86_64                randconfig-004-20251017    gcc-14
x86_64                randconfig-005-20251017    gcc-14
x86_64                randconfig-006-20251017    gcc-14
x86_64                randconfig-007-20251017    gcc-14
x86_64                randconfig-008-20251017    gcc-14
x86_64                randconfig-071-20251017    clang-20
x86_64                randconfig-072-20251017    clang-20
x86_64                randconfig-073-20251017    clang-20
x86_64                randconfig-074-20251017    clang-20
x86_64                randconfig-075-20251017    clang-20
x86_64                randconfig-076-20251017    clang-20
x86_64                randconfig-077-20251017    clang-20
x86_64                randconfig-078-20251017    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251017    gcc-12.5.0
xtensa                randconfig-002-20251017    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

