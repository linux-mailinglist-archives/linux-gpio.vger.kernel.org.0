Return-Path: <linux-gpio+bounces-27096-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8BCBD9E5E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 16:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5AA3546B16
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61178314D23;
	Tue, 14 Oct 2025 14:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIDacfhf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3363E314B8F
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 14:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760450826; cv=none; b=dYb509RLfDHItkZGl6gp5ZDMLtQRFWJ7FpWnLN+xQaWwzJqdouWh85DnU8ceonLZDFTmNkJBU/5v0X8b+vuBy9pQEQNGQkltwWH0fmXNthenuU8htt1HRrA6+Nwd3FgFbagGlNzNNeBo/qJaKcIB3KQk+l+xjrBh+OvTgQoChcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760450826; c=relaxed/simple;
	bh=0qxKmyTuqwbQMEVWIWETnkIB+NNjc0Uzxq7uYHnCL+c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KZeGFpW805SAYIZnHOohQPWZyhhuJrAI94eOJinjhq4BWKbpRvg3L35Yts2BAlnYIFXVrg5g3NLepKZuUmah3sdQmTbBT/gu6XoH1fHaquYGEUJrGCqdJmnzrKfumrnTVUFW/tAOO7uuDXh6+zsSctSk4hgWCilM60xlQ8WMRXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIDacfhf; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760450823; x=1791986823;
  h=date:from:to:cc:subject:message-id;
  bh=0qxKmyTuqwbQMEVWIWETnkIB+NNjc0Uzxq7uYHnCL+c=;
  b=GIDacfhfpoiwHN9QeQWMxez0s0breFADGyFdSG3PSUoZ/TmxQI0eJ6Dr
   RGKdSfV7NBWdXnzbfG8007RStw/+0eQlARXR/cvZTTesbsHIyR2CmeK7D
   i5ubSRTKnEkkaQIZl/IQpMBlr0bEYWkC4AAELA+6xGROjZuth3tQnIKaW
   j62ItCRVquHuDaE/4hZBFReg/WRCYTugEQhuLWorHo9YStPHYvkWsp1H3
   Tlaug1ucx4Xkv473u61UMWnTRluoHKDlz/BCKy4KQNGVpPoCToyvo7E/M
   PNasZoNRFAlg8Am+1foryu/Y04gYDCW22BG7nPrR1vTj+ugN4mOyJ1pl/
   w==;
X-CSE-ConnectionGUID: nlHuLvrATziO3Je+sJfGaA==
X-CSE-MsgGUID: OIzc1r4xQPyQVAJh9x3jdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62761369"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="62761369"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 07:07:02 -0700
X-CSE-ConnectionGUID: 2FqmstL+QgS64sdu5lCiDQ==
X-CSE-MsgGUID: /c2cA9O1TmC4lNK9M6LKVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="205595499"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 14 Oct 2025 07:06:59 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8ffT-0002rb-1v;
	Tue, 14 Oct 2025 14:06:50 +0000
Date: Tue, 14 Oct 2025 22:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 005a325480f418447949f43ace24a09a1fad5f09
Message-ID: <202510142215.IdNIzDj7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 005a325480f418447949f43ace24a09a1fad5f09  pinctrl: Demote subsystem banner message

elapsed time: 1449m

configs tested: 255
configs skipped: 4

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
arc                   randconfig-001-20251014    clang-16
arc                   randconfig-001-20251014    gcc-15.1.0
arc                   randconfig-002-20251014    clang-16
arc                   randconfig-002-20251014    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                   milbeaut_m10v_defconfig    gcc-15.1.0
arm                        multi_v5_defconfig    gcc-15.1.0
arm                         mv78xx0_defconfig    clang-19
arm                   randconfig-001-20251014    clang-16
arm                   randconfig-001-20251014    gcc-15.1.0
arm                   randconfig-002-20251014    clang-16
arm                   randconfig-002-20251014    gcc-13.4.0
arm                   randconfig-003-20251014    clang-16
arm                   randconfig-004-20251014    clang-16
arm                   randconfig-004-20251014    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251014    clang-16
arm64                 randconfig-001-20251014    gcc-9.5.0
arm64                 randconfig-002-20251014    clang-16
arm64                 randconfig-002-20251014    gcc-10.5.0
arm64                 randconfig-003-20251014    clang-16
arm64                 randconfig-003-20251014    gcc-14.3.0
arm64                 randconfig-004-20251014    clang-16
arm64                 randconfig-004-20251014    gcc-14.3.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251014    gcc-15.1.0
csky                  randconfig-001-20251014    gcc-8.5.0
csky                  randconfig-002-20251014    gcc-13.4.0
csky                  randconfig-002-20251014    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251014    clang-22
hexagon               randconfig-001-20251014    gcc-8.5.0
hexagon               randconfig-002-20251014    clang-22
hexagon               randconfig-002-20251014    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251013    gcc-13
i386        buildonly-randconfig-001-20251014    gcc-14
i386        buildonly-randconfig-002-20251013    clang-20
i386        buildonly-randconfig-002-20251014    gcc-14
i386        buildonly-randconfig-003-20251013    gcc-14
i386        buildonly-randconfig-003-20251014    gcc-14
i386        buildonly-randconfig-004-20251013    clang-20
i386        buildonly-randconfig-004-20251014    gcc-14
i386        buildonly-randconfig-005-20251013    gcc-14
i386        buildonly-randconfig-005-20251014    gcc-14
i386        buildonly-randconfig-006-20251013    gcc-14
i386        buildonly-randconfig-006-20251014    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251014    clang-20
i386                  randconfig-002-20251014    clang-20
i386                  randconfig-003-20251014    clang-20
i386                  randconfig-004-20251014    clang-20
i386                  randconfig-005-20251014    clang-20
i386                  randconfig-006-20251014    clang-20
i386                  randconfig-007-20251014    clang-20
i386                  randconfig-011-20251014    gcc-14
i386                  randconfig-012-20251014    gcc-14
i386                  randconfig-013-20251014    gcc-14
i386                  randconfig-014-20251014    gcc-14
i386                  randconfig-015-20251014    gcc-14
i386                  randconfig-016-20251014    gcc-14
i386                  randconfig-017-20251014    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251014    clang-18
loongarch             randconfig-001-20251014    gcc-8.5.0
loongarch             randconfig-002-20251014    gcc-15.1.0
loongarch             randconfig-002-20251014    gcc-8.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath79_defconfig    gcc-15.1.0
mips                            gpr_defconfig    clang-18
mips                   sb1250_swarm_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                            allyesconfig    clang-22
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251014    gcc-11.5.0
nios2                 randconfig-001-20251014    gcc-8.5.0
nios2                 randconfig-002-20251014    gcc-8.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251014    gcc-11.5.0
parisc                randconfig-001-20251014    gcc-8.5.0
parisc                randconfig-002-20251014    gcc-8.5.0
parisc                randconfig-002-20251014    gcc-9.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    clang-22
powerpc                        cell_defconfig    gcc-15.1.0
powerpc                        icon_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251014    gcc-8.5.0
powerpc               randconfig-001-20251014    gcc-9.5.0
powerpc               randconfig-002-20251014    clang-22
powerpc               randconfig-002-20251014    gcc-8.5.0
powerpc               randconfig-003-20251014    gcc-14.3.0
powerpc               randconfig-003-20251014    gcc-8.5.0
powerpc                     redwood_defconfig    gcc-15.1.0
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc                 xes_mpc85xx_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251014    gcc-8.5.0
powerpc64             randconfig-002-20251014    gcc-8.5.0
powerpc64             randconfig-003-20251014    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251014    gcc-10.5.0
riscv                 randconfig-002-20251014    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251014    clang-22
s390                  randconfig-001-20251014    gcc-10.5.0
s390                  randconfig-002-20251014    clang-19
s390                  randconfig-002-20251014    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251014    gcc-10.5.0
sh                    randconfig-001-20251014    gcc-14.3.0
sh                    randconfig-002-20251014    gcc-10.5.0
sh                    randconfig-002-20251014    gcc-11.5.0
sh                          sdk7786_defconfig    gcc-15.1.0
sh                           se7705_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251014    gcc-10.5.0
sparc                 randconfig-001-20251014    gcc-15.1.0
sparc                 randconfig-002-20251014    gcc-10.5.0
sparc                 randconfig-002-20251014    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                          allyesconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251014    clang-20
sparc64               randconfig-001-20251014    gcc-10.5.0
sparc64               randconfig-002-20251014    clang-22
sparc64               randconfig-002-20251014    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251014    gcc-10.5.0
um                    randconfig-001-20251014    gcc-14
um                    randconfig-002-20251014    gcc-10.5.0
um                    randconfig-002-20251014    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251014    gcc-14
x86_64      buildonly-randconfig-002-20251014    clang-20
x86_64      buildonly-randconfig-002-20251014    gcc-14
x86_64      buildonly-randconfig-003-20251014    gcc-14
x86_64      buildonly-randconfig-004-20251014    clang-20
x86_64      buildonly-randconfig-004-20251014    gcc-14
x86_64      buildonly-randconfig-005-20251014    clang-20
x86_64      buildonly-randconfig-005-20251014    gcc-14
x86_64      buildonly-randconfig-006-20251014    gcc-14
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251014    gcc-14
x86_64                randconfig-002-20251014    gcc-14
x86_64                randconfig-003-20251014    gcc-14
x86_64                randconfig-004-20251014    gcc-14
x86_64                randconfig-005-20251014    gcc-14
x86_64                randconfig-006-20251014    gcc-14
x86_64                randconfig-007-20251014    gcc-14
x86_64                randconfig-008-20251014    gcc-14
x86_64                randconfig-071-20251014    gcc-14
x86_64                randconfig-072-20251014    gcc-14
x86_64                randconfig-073-20251014    gcc-14
x86_64                randconfig-074-20251014    gcc-14
x86_64                randconfig-075-20251014    gcc-14
x86_64                randconfig-076-20251014    gcc-14
x86_64                randconfig-077-20251014    gcc-14
x86_64                randconfig-078-20251014    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251014    gcc-10.5.0
xtensa                randconfig-001-20251014    gcc-8.5.0
xtensa                randconfig-002-20251014    gcc-10.5.0
xtensa                randconfig-002-20251014    gcc-8.5.0
xtensa                         virt_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

