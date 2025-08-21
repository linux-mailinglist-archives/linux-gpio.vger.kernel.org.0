Return-Path: <linux-gpio+bounces-24705-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E638AB2EE16
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 08:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BD603B8CF8
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 06:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D127261B70;
	Thu, 21 Aug 2025 06:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0d7Mxcj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394B114B06C
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 06:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755757242; cv=none; b=QTAa9s4HfiVHF0OiLmP2sGhloHz+1CGMAndgUyGsp71IAzHI/R7xWyHt3GWNCb0nducil0r1w67L3GZXsghWqEsO8nDWzxSfME8y0QTiDC0hYzIjRYcIZUiKCx7hTgVVsc0lg8fDSCVmjugTg1JwGEwCv3vfHcbc4B0LwpabOZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755757242; c=relaxed/simple;
	bh=BJqhaTJQXFuZvQ1/S6CCShLpwzukAZhyOtXvwLTiWRM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JG1DS0AnUFCk783YC6JUHRa91CcQMaFIEfUtuvRMsjsqPWTgXnt2D/bW45kfwPhSQG/XFKg8YAIyfTD/lM7d/+7MZhJufWBGcquFQ2Qht4kr/Vt7VDy2S9YcudwzVmxBzBvOD3JcbqyyUGhvFuSXgo7eACrQAroeu/7CKOjDe0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0d7Mxcj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755757240; x=1787293240;
  h=date:from:to:cc:subject:message-id;
  bh=BJqhaTJQXFuZvQ1/S6CCShLpwzukAZhyOtXvwLTiWRM=;
  b=A0d7MxcjcpYre2cLOm6PpxjJQMiEUrxd6xqeJVxvVPWY80noUFOYKXoG
   VBvyqfpFT8tfLPiv6ITV3H+svw89QDHKR8Et38HCkR31VWfIcAwyqvKP0
   /Kr0dOT72ZgSQ2E06BChWNl+auYolizmcZDfT0PFrXf7ypzuu6/e+Ideb
   fd5+2MKFZzRZBIMbSXrYKPMXghVZ/fsC8d/4Y5vDLj70B+PZBRfvuhX68
   e9cgZ/qUb7cvkaMBkVAF2Tl4rK4IN9GoFfBWE3rXgNACEGouL18HeJhh5
   yDLTX0JfwxNNZAGG5+tKB55H5/1gMYgSnqmph5WYt196AsK1ylhKIu3qi
   g==;
X-CSE-ConnectionGUID: Es4PzI7HRCmpG4cvjJFung==
X-CSE-MsgGUID: rJY39RrQT06cKozOgm7hRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57962359"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57962359"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 23:20:39 -0700
X-CSE-ConnectionGUID: KnNE6IinRvOCXSpklo7smw==
X-CSE-MsgGUID: /GO/GKKvSVaWrKbYTgvOpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="167836357"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 20 Aug 2025 23:20:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoyf6-000K0F-1N;
	Thu, 21 Aug 2025 06:20:36 +0000
Date: Thu, 21 Aug 2025 14:19:53 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 b8dc2302544b66367bedec19ee16477ff5a25a92
Message-ID: <202508211446.B9S012FB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: b8dc2302544b66367bedec19ee16477ff5a25a92  pinctrl: stm32: Constify static 'pinctrl_desc'

elapsed time: 1368m

configs tested: 253
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                         haps_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20250820    gcc-8.5.0
arc                   randconfig-001-20250821    clang-22
arc                   randconfig-002-20250820    gcc-11.5.0
arc                   randconfig-002-20250821    clang-22
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                   randconfig-001-20250820    gcc-8.5.0
arm                   randconfig-001-20250821    clang-22
arm                   randconfig-002-20250820    gcc-15.1.0
arm                   randconfig-002-20250821    clang-22
arm                   randconfig-003-20250820    gcc-13.4.0
arm                   randconfig-003-20250821    clang-22
arm                   randconfig-004-20250820    clang-22
arm                   randconfig-004-20250821    clang-22
arm                           u8500_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250820    gcc-14.3.0
arm64                 randconfig-001-20250821    clang-22
arm64                 randconfig-002-20250820    gcc-14.3.0
arm64                 randconfig-002-20250821    clang-22
arm64                 randconfig-003-20250820    gcc-8.5.0
arm64                 randconfig-003-20250821    clang-22
arm64                 randconfig-004-20250820    gcc-14.3.0
arm64                 randconfig-004-20250821    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250820    gcc-15.1.0
csky                  randconfig-001-20250821    clang-22
csky                  randconfig-002-20250820    gcc-9.5.0
csky                  randconfig-002-20250821    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250820    clang-22
hexagon               randconfig-001-20250821    clang-22
hexagon               randconfig-002-20250820    clang-22
hexagon               randconfig-002-20250821    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250820    clang-20
i386        buildonly-randconfig-001-20250821    gcc-12
i386        buildonly-randconfig-002-20250820    gcc-12
i386        buildonly-randconfig-002-20250821    gcc-12
i386        buildonly-randconfig-003-20250820    gcc-12
i386        buildonly-randconfig-003-20250821    gcc-12
i386        buildonly-randconfig-004-20250820    clang-20
i386        buildonly-randconfig-004-20250821    gcc-12
i386        buildonly-randconfig-005-20250820    gcc-12
i386        buildonly-randconfig-005-20250821    gcc-12
i386        buildonly-randconfig-006-20250820    gcc-11
i386        buildonly-randconfig-006-20250821    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250821    gcc-11
i386                  randconfig-002-20250821    gcc-11
i386                  randconfig-003-20250821    gcc-11
i386                  randconfig-004-20250821    gcc-11
i386                  randconfig-005-20250821    gcc-11
i386                  randconfig-006-20250821    gcc-11
i386                  randconfig-007-20250821    gcc-11
i386                  randconfig-011-20250821    gcc-12
i386                  randconfig-012-20250821    gcc-12
i386                  randconfig-013-20250821    gcc-12
i386                  randconfig-014-20250821    gcc-12
i386                  randconfig-015-20250821    gcc-12
i386                  randconfig-016-20250821    gcc-12
i386                  randconfig-017-20250821    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250820    clang-18
loongarch             randconfig-001-20250821    clang-22
loongarch             randconfig-002-20250820    clang-22
loongarch             randconfig-002-20250821    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        mvme16x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250820    gcc-11.5.0
nios2                 randconfig-001-20250821    clang-22
nios2                 randconfig-002-20250820    gcc-10.5.0
nios2                 randconfig-002-20250821    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250820    gcc-8.5.0
parisc                randconfig-001-20250821    clang-22
parisc                randconfig-002-20250820    gcc-13.4.0
parisc                randconfig-002-20250821    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc                         ps3_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250820    gcc-12.5.0
powerpc               randconfig-001-20250821    clang-22
powerpc               randconfig-002-20250820    gcc-8.5.0
powerpc               randconfig-002-20250821    clang-22
powerpc               randconfig-003-20250820    gcc-13.4.0
powerpc               randconfig-003-20250821    clang-22
powerpc                     skiroot_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250820    clang-22
powerpc64             randconfig-002-20250820    clang-22
powerpc64             randconfig-002-20250821    clang-22
powerpc64             randconfig-003-20250820    gcc-15.1.0
powerpc64             randconfig-003-20250821    clang-22
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250820    clang-20
riscv                 randconfig-001-20250821    clang-18
riscv                 randconfig-002-20250820    clang-22
riscv                 randconfig-002-20250821    clang-18
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250820    clang-18
s390                  randconfig-001-20250821    clang-18
s390                  randconfig-002-20250820    clang-22
s390                  randconfig-002-20250821    clang-18
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250820    gcc-15.1.0
sh                    randconfig-001-20250821    clang-18
sh                    randconfig-002-20250820    gcc-15.1.0
sh                    randconfig-002-20250821    clang-18
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250820    gcc-8.5.0
sparc                 randconfig-001-20250821    clang-18
sparc                 randconfig-002-20250820    gcc-12.5.0
sparc                 randconfig-002-20250821    clang-18
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250820    clang-22
sparc64               randconfig-001-20250821    clang-18
sparc64               randconfig-002-20250820    clang-22
sparc64               randconfig-002-20250821    clang-18
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250820    gcc-12
um                    randconfig-001-20250821    clang-18
um                    randconfig-002-20250820    gcc-12
um                    randconfig-002-20250821    clang-18
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250820    clang-20
x86_64      buildonly-randconfig-001-20250821    clang-20
x86_64      buildonly-randconfig-002-20250820    gcc-11
x86_64      buildonly-randconfig-002-20250821    clang-20
x86_64      buildonly-randconfig-003-20250820    clang-20
x86_64      buildonly-randconfig-003-20250821    clang-20
x86_64      buildonly-randconfig-004-20250820    gcc-12
x86_64      buildonly-randconfig-004-20250821    clang-20
x86_64      buildonly-randconfig-005-20250820    clang-20
x86_64      buildonly-randconfig-005-20250821    clang-20
x86_64      buildonly-randconfig-006-20250820    gcc-12
x86_64      buildonly-randconfig-006-20250821    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250821    clang-20
x86_64                randconfig-002-20250821    clang-20
x86_64                randconfig-003-20250821    clang-20
x86_64                randconfig-004-20250821    clang-20
x86_64                randconfig-005-20250821    clang-20
x86_64                randconfig-006-20250821    clang-20
x86_64                randconfig-007-20250821    clang-20
x86_64                randconfig-008-20250821    clang-20
x86_64                randconfig-071-20250821    clang-20
x86_64                randconfig-072-20250821    clang-20
x86_64                randconfig-073-20250821    clang-20
x86_64                randconfig-074-20250821    clang-20
x86_64                randconfig-075-20250821    clang-20
x86_64                randconfig-076-20250821    clang-20
x86_64                randconfig-077-20250821    clang-20
x86_64                randconfig-078-20250821    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250820    gcc-8.5.0
xtensa                randconfig-001-20250821    clang-18
xtensa                randconfig-002-20250820    gcc-8.5.0
xtensa                randconfig-002-20250821    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

