Return-Path: <linux-gpio+bounces-10808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D4998FCEA
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 07:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1F8E1F21E63
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 05:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7044643B;
	Fri,  4 Oct 2024 05:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpT1KViI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC8C28F3
	for <linux-gpio@vger.kernel.org>; Fri,  4 Oct 2024 05:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728018610; cv=none; b=gNNquERMsHUkMrq8fdtWF8TtHcZxdWd0F7HAP/LRLE0fNQOqlAVyWqieV8JwrxAkiGPETUx80gKsxCF/wP+lwAwgsYRVyqkb/wAHBaLhzXNUXjDWzJi0JOYIrIByg869sif0G59c9DBtqVRaDxqQbdJEJn8YXIMxhULsYM2hC+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728018610; c=relaxed/simple;
	bh=lxSqoS6CMSNU0BEjILyYi2WTbwrGAITXXpOip/5NI2g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XtkjDeixLRD3mWm98L06/nh9QIOXgbPe/Aq5Dlib0Kt+NaeAMJorrqEGM6oyLvvlcrhnNcPRUzwRcEYSvxLKCfClJ5i3uMVNfYEsLijA0c6Ok8IURyz9oNnkwuILsiSOOUdRle31TXrOLfgT+qAnVP4ZUyf4xJ0vcoEGepilJYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpT1KViI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728018607; x=1759554607;
  h=date:from:to:cc:subject:message-id;
  bh=lxSqoS6CMSNU0BEjILyYi2WTbwrGAITXXpOip/5NI2g=;
  b=GpT1KViIi3lv/ZQrSAJMhl6wpEmKLA/iKdpLT3iYeod1YpgaACa8b+JQ
   IQl7pel7Pm5MGHXDRlXVXWRcdGg70gvYiBo1JciIlwSlcqtZWb5qE8tql
   ZkSL4DTfLGGktwTbgNobDXjhdBLRFGrBVSBMlMpzl++H8GtOtzl+IpfWO
   mWAfT4zEWFflndN9hCWekM9B2pkexN97s3IFdf/cLB2hEkKvE++Kgm1Ax
   07uKq+Bz/bw4hU/GAyeTVa6V1iblyw4llYxTouw69FPibhfzZzgbivvaA
   2S9qXfHqsbMplnj+DHvCks1LneiD+WiWqOH+gR/IIyodOB9ZjP1xQ1ig5
   Q==;
X-CSE-ConnectionGUID: JYMFfFKXSOGWuUSyXjhAIw==
X-CSE-MsgGUID: ulM14BHnRTqMBjH7KCT6bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="31028105"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="31028105"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 22:10:06 -0700
X-CSE-ConnectionGUID: z/qSawKbRCKWnRJfRrcYuA==
X-CSE-MsgGUID: qbxXo8ZvQNO/6M9keC0YJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="97914614"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Oct 2024 22:10:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swaZn-0001FM-0N;
	Fri, 04 Oct 2024 05:10:03 +0000
Date: Fri, 04 Oct 2024 13:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 c9560baef0fa95aa676b7c7a7532543a4c6ff80c
Message-ID: <202410041324.TefW3P9v-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: c9560baef0fa95aa676b7c7a7532543a4c6ff80c  Merge tag 'intel-pinctrl-v6.12-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into fixes

elapsed time: 787m

configs tested: 177
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                        nsimosci_defconfig    clang-20
arc                   randconfig-001-20241004    gcc-14.1.0
arc                   randconfig-002-20241004    gcc-14.1.0
arm                              alldefconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          gemini_defconfig    clang-20
arm                        multi_v5_defconfig    clang-20
arm                   randconfig-001-20241004    gcc-14.1.0
arm                   randconfig-002-20241004    gcc-14.1.0
arm                   randconfig-003-20241004    gcc-14.1.0
arm                   randconfig-004-20241004    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241004    gcc-14.1.0
arm64                 randconfig-002-20241004    gcc-14.1.0
arm64                 randconfig-003-20241004    gcc-14.1.0
arm64                 randconfig-004-20241004    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241004    gcc-14.1.0
csky                  randconfig-002-20241004    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241004    gcc-14.1.0
hexagon               randconfig-002-20241004    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241004    clang-18
i386        buildonly-randconfig-002-20241004    clang-18
i386        buildonly-randconfig-003-20241004    clang-18
i386        buildonly-randconfig-004-20241004    clang-18
i386        buildonly-randconfig-005-20241004    clang-18
i386        buildonly-randconfig-006-20241004    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241004    clang-18
i386                  randconfig-002-20241004    clang-18
i386                  randconfig-003-20241004    clang-18
i386                  randconfig-004-20241004    clang-18
i386                  randconfig-005-20241004    clang-18
i386                  randconfig-006-20241004    clang-18
i386                  randconfig-011-20241004    clang-18
i386                  randconfig-012-20241004    clang-18
i386                  randconfig-013-20241004    clang-18
i386                  randconfig-014-20241004    clang-18
i386                  randconfig-015-20241004    clang-18
i386                  randconfig-016-20241004    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241004    gcc-14.1.0
loongarch             randconfig-002-20241004    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        mvme16x_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           jazz_defconfig    clang-20
mips                    maltaup_xpa_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241004    gcc-14.1.0
nios2                 randconfig-002-20241004    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241004    gcc-14.1.0
parisc                randconfig-002-20241004    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                 mpc836x_rdk_defconfig    clang-20
powerpc                  mpc866_ads_defconfig    clang-20
powerpc               randconfig-001-20241004    gcc-14.1.0
powerpc               randconfig-002-20241004    gcc-14.1.0
powerpc               randconfig-003-20241004    gcc-14.1.0
powerpc                     tqm8560_defconfig    clang-20
powerpc                      tqm8xx_defconfig    clang-20
powerpc64             randconfig-001-20241004    gcc-14.1.0
powerpc64             randconfig-002-20241004    gcc-14.1.0
powerpc64             randconfig-003-20241004    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241004    gcc-14.1.0
riscv                 randconfig-002-20241004    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241004    gcc-14.1.0
s390                  randconfig-002-20241004    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                               j2_defconfig    clang-20
sh                    randconfig-001-20241004    gcc-14.1.0
sh                    randconfig-002-20241004    gcc-14.1.0
sh                          rsk7264_defconfig    clang-20
sh                          sdk7786_defconfig    clang-20
sh                           se7751_defconfig    clang-20
sh                   sh7770_generic_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241004    gcc-14.1.0
sparc64               randconfig-002-20241004    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241004    gcc-14.1.0
um                    randconfig-002-20241004    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241004    clang-18
x86_64      buildonly-randconfig-002-20241004    clang-18
x86_64      buildonly-randconfig-003-20241004    clang-18
x86_64      buildonly-randconfig-004-20241004    clang-18
x86_64      buildonly-randconfig-005-20241004    clang-18
x86_64      buildonly-randconfig-006-20241004    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241004    clang-18
x86_64                randconfig-002-20241004    clang-18
x86_64                randconfig-003-20241004    clang-18
x86_64                randconfig-004-20241004    clang-18
x86_64                randconfig-005-20241004    clang-18
x86_64                randconfig-006-20241004    clang-18
x86_64                randconfig-011-20241004    clang-18
x86_64                randconfig-012-20241004    clang-18
x86_64                randconfig-013-20241004    clang-18
x86_64                randconfig-014-20241004    clang-18
x86_64                randconfig-015-20241004    clang-18
x86_64                randconfig-016-20241004    clang-18
x86_64                randconfig-071-20241004    clang-18
x86_64                randconfig-072-20241004    clang-18
x86_64                randconfig-073-20241004    clang-18
x86_64                randconfig-074-20241004    clang-18
x86_64                randconfig-075-20241004    clang-18
x86_64                randconfig-076-20241004    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241004    gcc-14.1.0
xtensa                randconfig-002-20241004    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

