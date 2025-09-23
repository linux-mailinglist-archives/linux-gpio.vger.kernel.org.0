Return-Path: <linux-gpio+bounces-26521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 218D1B94E44
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 09:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C88F116DF64
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 07:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3133164B7;
	Tue, 23 Sep 2025 07:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="an+oxnZo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283B21487F6
	for <linux-gpio@vger.kernel.org>; Tue, 23 Sep 2025 07:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758614392; cv=none; b=o1n9KuR/eeMvX18LDc/lh+EYn02SZNvYm5yR1BOgeHH1EMxfY6kkschB18LFzNIqWzyl0YmWNtBnZHmo0+H288wNAza1PaseLH/ttf530l2NsE4+xqbtbrXy/xr0Y144cPN+DNFMjUGyZzLAdD/0dsOI1stmWVSyuNK4c1D7hzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758614392; c=relaxed/simple;
	bh=cBtG6l4ISfSeG8j5N+7bql3+ME/wUGbN6GdbP+HFiEo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A4tEjGMhqlvudwFtdQqMqAA43ifgoX/tvN5CVQ2Q7/Dw7eGiknxjiDDs88lS5vPihrz33JbSrgl19G82cVC7ZF6i5M1ajn3K66kMDkbrn5DQV7MZEl7fXIHsqrDS9jNMeLQYCbgwUVPfP7u+qsHFqR4CYufrweuDb8HDnHcyhbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=an+oxnZo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758614391; x=1790150391;
  h=date:from:to:cc:subject:message-id;
  bh=cBtG6l4ISfSeG8j5N+7bql3+ME/wUGbN6GdbP+HFiEo=;
  b=an+oxnZoFGatsURv82iZaiam34MTri5Ng59qfy/cBdQctNFcXmhTUzlE
   R4wNF9VxZvDGyRVdXzwirOOAS5qvzhCVF0k+C6DzbF+FdouZZBPMEBrWg
   k6yBcDUQHcgB+DFZK5ghXhGMfNEtbiwLAR0TTWWIiiIte30rSRkSaVXkX
   sB2ltKOJOOvvPHckuih49yihji10IH5kq7vqBY6ukT/nFPq9+2SS53lJt
   cD9CPCeXJ5u1COiB2n4bS4/GG+7JT7bRsASzg6AKrJCedhi5N11KTU2xM
   dqx+YUN59qtdmBeXpwzRedBqCD2Sh71QIXEXuAkLSySj4P7j4HBl3axEw
   A==;
X-CSE-ConnectionGUID: yq4HnGqdRZG4Hsd1HEMufA==
X-CSE-MsgGUID: zuHIYiJ1SOOmF8TMoaGPYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60804518"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60804518"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 00:59:46 -0700
X-CSE-ConnectionGUID: 5NbH+XfQTTizkWOvB5xAdw==
X-CSE-MsgGUID: xnhHLVHeSRmnRowMJZ79eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="200400173"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Sep 2025 00:59:43 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0xvf-0002sj-1H;
	Tue, 23 Sep 2025 07:59:20 +0000
Date: Tue, 23 Sep 2025 15:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes-test] BUILD SUCCESS
 76c54b99c6cd84284fdb4ff8988c53f56fb73fe4
Message-ID: <202509231509.Befo55q6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes-test
branch HEAD: 76c54b99c6cd84284fdb4ff8988c53f56fb73fe4  pinctrl: airoha: fix wrong MDIO function bitmaks

elapsed time: 1368m

configs tested: 281
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250922    gcc-8.5.0
arc                   randconfig-001-20250923    gcc-12.5.0
arc                   randconfig-002-20250922    gcc-9.5.0
arc                   randconfig-002-20250923    gcc-12.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                          collie_defconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                                 defconfig    clang-22
arm                        mvebu_v7_defconfig    gcc-15.1.0
arm                       omap2plus_defconfig    gcc-15.1.0
arm                             pxa_defconfig    gcc-15.1.0
arm                   randconfig-001-20250922    clang-22
arm                   randconfig-001-20250923    gcc-12.5.0
arm                   randconfig-002-20250922    gcc-12.5.0
arm                   randconfig-002-20250923    gcc-12.5.0
arm                   randconfig-003-20250922    clang-17
arm                   randconfig-003-20250923    gcc-12.5.0
arm                   randconfig-004-20250922    gcc-8.5.0
arm                   randconfig-004-20250923    gcc-12.5.0
arm                        spear6xx_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250922    gcc-8.5.0
arm64                 randconfig-001-20250923    gcc-12.5.0
arm64                 randconfig-002-20250922    gcc-15.1.0
arm64                 randconfig-002-20250923    gcc-12.5.0
arm64                 randconfig-003-20250922    clang-22
arm64                 randconfig-003-20250923    gcc-12.5.0
arm64                 randconfig-004-20250922    clang-22
arm64                 randconfig-004-20250923    gcc-12.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250922    gcc-15.1.0
csky                  randconfig-001-20250923    gcc-10.5.0
csky                  randconfig-002-20250922    gcc-15.1.0
csky                  randconfig-002-20250923    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250922    clang-20
hexagon               randconfig-001-20250923    gcc-10.5.0
hexagon               randconfig-002-20250922    clang-19
hexagon               randconfig-002-20250923    gcc-10.5.0
i386                             alldefconfig    gcc-14
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250922    clang-20
i386        buildonly-randconfig-001-20250923    gcc-14
i386        buildonly-randconfig-002-20250922    gcc-14
i386        buildonly-randconfig-002-20250923    gcc-14
i386        buildonly-randconfig-003-20250922    gcc-14
i386        buildonly-randconfig-003-20250923    gcc-14
i386        buildonly-randconfig-004-20250922    gcc-14
i386        buildonly-randconfig-004-20250923    gcc-14
i386        buildonly-randconfig-005-20250922    clang-20
i386        buildonly-randconfig-005-20250923    gcc-14
i386        buildonly-randconfig-006-20250922    clang-20
i386        buildonly-randconfig-006-20250923    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20250923    gcc-14
i386                  randconfig-002-20250923    gcc-14
i386                  randconfig-003-20250923    gcc-14
i386                  randconfig-004-20250923    gcc-14
i386                  randconfig-005-20250923    gcc-14
i386                  randconfig-006-20250923    gcc-14
i386                  randconfig-007-20250923    gcc-14
i386                  randconfig-011-20250923    gcc-14
i386                  randconfig-012-20250923    gcc-14
i386                  randconfig-013-20250923    gcc-14
i386                  randconfig-014-20250923    gcc-14
i386                  randconfig-015-20250923    gcc-14
i386                  randconfig-016-20250923    gcc-14
i386                  randconfig-017-20250923    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250922    clang-22
loongarch             randconfig-001-20250923    gcc-10.5.0
loongarch             randconfig-002-20250922    clang-18
loongarch             randconfig-002-20250923    gcc-10.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    gcc-15.1.0
m68k                           virt_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq5_defconfig    gcc-15.1.0
mips                        maltaup_defconfig    gcc-15.1.0
nios2                         10m50_defconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250922    gcc-11.5.0
nios2                 randconfig-001-20250923    gcc-10.5.0
nios2                 randconfig-002-20250922    gcc-8.5.0
nios2                 randconfig-002-20250923    gcc-10.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250922    gcc-8.5.0
parisc                randconfig-001-20250923    gcc-10.5.0
parisc                randconfig-002-20250922    gcc-9.5.0
parisc                randconfig-002-20250923    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                 canyonlands_defconfig    clang-22
powerpc                  iss476-smp_defconfig    gcc-15.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250922    clang-22
powerpc               randconfig-001-20250923    gcc-10.5.0
powerpc               randconfig-002-20250922    gcc-12.5.0
powerpc               randconfig-002-20250923    gcc-10.5.0
powerpc               randconfig-003-20250922    clang-17
powerpc               randconfig-003-20250923    gcc-10.5.0
powerpc                        warp_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250923    gcc-10.5.0
powerpc64             randconfig-002-20250922    clang-20
powerpc64             randconfig-002-20250923    gcc-10.5.0
powerpc64             randconfig-003-20250922    clang-17
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-14
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20250922    clang-22
riscv                 randconfig-001-20250923    gcc-12.5.0
riscv                 randconfig-002-20250922    clang-22
riscv                 randconfig-002-20250923    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-14
s390                  randconfig-001-20250922    gcc-8.5.0
s390                  randconfig-001-20250923    gcc-12.5.0
s390                  randconfig-002-20250922    gcc-11.5.0
s390                  randconfig-002-20250923    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                    randconfig-001-20250922    gcc-15.1.0
sh                    randconfig-001-20250923    gcc-12.5.0
sh                    randconfig-002-20250922    gcc-11.5.0
sh                    randconfig-002-20250923    gcc-12.5.0
sh                          rsk7201_defconfig    gcc-15.1.0
sh                          sdk7786_defconfig    gcc-15.1.0
sh                           se7780_defconfig    gcc-15.1.0
sh                          urquell_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250922    gcc-15.1.0
sparc                 randconfig-001-20250923    gcc-12.5.0
sparc                 randconfig-002-20250922    gcc-14.3.0
sparc                 randconfig-002-20250923    gcc-12.5.0
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250922    gcc-12.5.0
sparc64               randconfig-001-20250923    gcc-12.5.0
sparc64               randconfig-002-20250922    gcc-14.3.0
sparc64               randconfig-002-20250923    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250922    gcc-14
um                    randconfig-001-20250923    gcc-12.5.0
um                    randconfig-002-20250922    clang-22
um                    randconfig-002-20250923    gcc-12.5.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           alldefconfig    gcc-15.1.0
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250922    clang-20
x86_64      buildonly-randconfig-001-20250923    clang-20
x86_64      buildonly-randconfig-002-20250922    gcc-13
x86_64      buildonly-randconfig-002-20250923    clang-20
x86_64      buildonly-randconfig-003-20250922    gcc-13
x86_64      buildonly-randconfig-003-20250923    clang-20
x86_64      buildonly-randconfig-004-20250922    clang-20
x86_64      buildonly-randconfig-004-20250923    clang-20
x86_64      buildonly-randconfig-005-20250922    clang-20
x86_64      buildonly-randconfig-005-20250923    clang-20
x86_64      buildonly-randconfig-006-20250922    clang-20
x86_64      buildonly-randconfig-006-20250923    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250923    gcc-14
x86_64                randconfig-002-20250923    gcc-14
x86_64                randconfig-003-20250923    gcc-14
x86_64                randconfig-004-20250923    gcc-14
x86_64                randconfig-005-20250923    gcc-14
x86_64                randconfig-006-20250923    gcc-14
x86_64                randconfig-007-20250923    gcc-14
x86_64                randconfig-008-20250923    gcc-14
x86_64                randconfig-071-20250923    clang-20
x86_64                randconfig-072-20250923    clang-20
x86_64                randconfig-073-20250923    clang-20
x86_64                randconfig-074-20250923    clang-20
x86_64                randconfig-075-20250923    clang-20
x86_64                randconfig-076-20250923    clang-20
x86_64                randconfig-077-20250923    clang-20
x86_64                randconfig-078-20250923    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250922    gcc-9.5.0
xtensa                randconfig-001-20250923    gcc-12.5.0
xtensa                randconfig-002-20250922    gcc-11.5.0
xtensa                randconfig-002-20250923    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

