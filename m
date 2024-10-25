Return-Path: <linux-gpio+bounces-12126-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 713619B11A5
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 23:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68C95B21768
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 21:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3436E1D14FA;
	Fri, 25 Oct 2024 21:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XF0Ca4bJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4AC217F4C
	for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 21:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729892075; cv=none; b=HOpRvVfn+ZZZHsg6hFBPOFMdg18QBOrvTyyAId4q0S+bXsUrFpDcfpaCos/j2uHdBJZUKpEe2Bq8uAtSwkUmlEWi72nksoFkcNAMxvvA7E1+CfM9bbXrmkygZ3zm8rzbZ+RD8/3XlUE8MJvG4NLOzPCkxOfFcA4n6W1dFTfVTTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729892075; c=relaxed/simple;
	bh=iaOixxq1aR42BwVDwLDVEZVbBf/zUFFPU2Q8UuVkt1E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lzE5NWIGoPVdKLDEaDse9wIY4yL5SUMjKgMY352PY8Y8yOkARRqjPu2DaGbSF8AZ9cjF6aIMhOCTXVBn8CpDM678MTpVJyN1WtJWs9Kte7tcVZIw49fHh31rDf95rDZmTtcOEuN5pOAdod6Y0e78tmd1pMohgLmlTI1TIwe7IlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XF0Ca4bJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729892072; x=1761428072;
  h=date:from:to:cc:subject:message-id;
  bh=iaOixxq1aR42BwVDwLDVEZVbBf/zUFFPU2Q8UuVkt1E=;
  b=XF0Ca4bJWeWDMaemQtOJheiTjsYYWHgTkbkImV4Rp4lBTV5X2s7vOVpu
   6OVU1VqXrtqrzO1a/W7k7uRvyN8dsXaLVaZtFekuYeYIEBff1mUFEqJqp
   uicYLHIS31V75wybGGhTit7gkPU0szqT0+nQ+G9JbYPejQSJtOvm0qtZy
   oI42UiAazPT3UmwOIqkMa739hU0I5Ltm4AVBdyAIFCDsKanKVGyZUoVSh
   Xnc9pM/W3JF2tbGV/VInCEf3cLHaI1H4IomGsvHiTjpv9ckhrXHUI1lwx
   VJfVigKQbOStLY6nM03oTougYvbEU+QvMOZw7oGkRWkROCC1aXfrS7j8j
   Q==;
X-CSE-ConnectionGUID: Xwa24FJyT0SfjO/lDUSeSQ==
X-CSE-MsgGUID: nkkF7MD8SyWnxRVUNL4gTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29682050"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="29682050"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:34:32 -0700
X-CSE-ConnectionGUID: oS04BEPqQPyxhRovy61LmQ==
X-CSE-MsgGUID: SHVict9cT4GFvORIWCMnxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="85640498"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Oct 2024 14:34:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Rwy-000Yup-2Z;
	Fri, 25 Oct 2024 21:34:28 +0000
Date: Sat, 26 Oct 2024 05:33:40 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq/for-next] BUILD SUCCESS
 bd4c8bafcf50b6bd415c8bf04e98ebfba78071f9
Message-ID: <202410260532.3c4ydMQS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-next
branch HEAD: bd4c8bafcf50b6bd415c8bf04e98ebfba78071f9  power: sequencing: qcom-wcn: improve support for wcn6855

elapsed time: 812m

configs tested: 115
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
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                         lpc32xx_defconfig    gcc-14.1.0
arm                         s3c6400_defconfig    gcc-14.1.0
arm                          sp7021_defconfig    gcc-14.1.0
arm                    vt8500_v6_v7_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             alldefconfig    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241025    gcc-12
i386        buildonly-randconfig-002-20241025    gcc-12
i386        buildonly-randconfig-003-20241025    gcc-12
i386        buildonly-randconfig-004-20241025    gcc-12
i386        buildonly-randconfig-005-20241025    gcc-12
i386        buildonly-randconfig-006-20241025    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241025    gcc-12
i386                  randconfig-002-20241025    gcc-12
i386                  randconfig-003-20241025    gcc-12
i386                  randconfig-004-20241025    gcc-12
i386                  randconfig-005-20241025    gcc-12
i386                  randconfig-006-20241025    gcc-12
i386                  randconfig-011-20241025    gcc-12
i386                  randconfig-012-20241025    gcc-12
i386                  randconfig-013-20241025    gcc-12
i386                  randconfig-014-20241025    gcc-12
i386                  randconfig-015-20241025    gcc-12
i386                  randconfig-016-20241025    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                            gpr_defconfig    gcc-14.1.0
mips                           jazz_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                     sequoia_defconfig    gcc-14.1.0
powerpc                      tqm8xx_defconfig    gcc-14.1.0
powerpc                        warp_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    gcc-14.1.0
sh                        edosk7705_defconfig    gcc-14.1.0
sh                          kfr2r09_defconfig    gcc-14.1.0
sh                     magicpanelr2_defconfig    gcc-14.1.0
sh                           se7619_defconfig    gcc-14.1.0
sh                           se7705_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

