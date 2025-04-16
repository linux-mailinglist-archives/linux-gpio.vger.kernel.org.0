Return-Path: <linux-gpio+bounces-18967-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A72A90690
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 16:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9ACB8A7D6F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 14:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512991A0BDB;
	Wed, 16 Apr 2025 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+PKx/ZV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1571AE005
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 14:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813750; cv=none; b=E8yKtnsL9mc1LUoGnleUeHzakD3K3bUle16TRTZ0nr1tGz5v9LDMffe9X6VzN+DEcGCKPwGXfTHz8TwBbN7RLJubD8pD6hHwU3ybvN4gfPWa8hMUUaMaD5cDTS0uimidXd5jZMTE/l8srjsHfIWO/PdsFmQ4xuAs0M5H1GqPC9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813750; c=relaxed/simple;
	bh=ThVKKlKFdv9Od96icTpGm6e9fnblQO4VFajmRuj8eCE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=heTJSEZobtTVhYXYgbWw+ZWm5aXsdch2XG8wzxrcgFXmmNISqC18NhqtEfAhiLlb9kqnoqeOQbGVPPg86NopgaV4T5VBpgoCLE98xa2cV7SQhLTwugcH4LqwjbTHOiJJnO5JLPHHDLFmZTKc9zheDnT1NhACmF6dTFsjZGBf0KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+PKx/ZV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744813748; x=1776349748;
  h=date:from:to:cc:subject:message-id;
  bh=ThVKKlKFdv9Od96icTpGm6e9fnblQO4VFajmRuj8eCE=;
  b=J+PKx/ZV9keCprvZj3VfkktbpxqAmzPh5cRoJiUc4e3WVsIReJ9PNgOc
   EAeTDB+x4BjnuJWqxdQNgOn+4Tx2I4q1p+el7Enfm4QuBFT/o+FS6hm+5
   xjn7VJGQZw4kbcwBSZKvWhIt1YjhiEpA9MqR40DPYxJ8oKAXzJxsLu+lp
   RDR2TRAsmmpiPh+hqEALMB1+vtc9wpYxXerjkrTBjDM89m3aafvFoTGbx
   u2Vty6MPTPAEoYaJqZo0L4TGR+hk4rymF9FVE83UFKQPb6xLR4bGzmZ6k
   J3/rl4bauZvJD1xthQg5Wibib0kFfAlSMbrC5Lj9L8KLP4ZE9Buo1hKqZ
   w==;
X-CSE-ConnectionGUID: YHcb3zdRTYmEH2aLzixlVg==
X-CSE-MsgGUID: hfPdG3/cR/quP7cWacha2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71756495"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="71756495"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 07:29:07 -0700
X-CSE-ConnectionGUID: Kv6774YbTJm58OP5xd3Z4g==
X-CSE-MsgGUID: KhvL/qMCRZa2qQNjn+4FQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135667728"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Apr 2025 07:29:06 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u53l9-000JsY-2p;
	Wed, 16 Apr 2025 14:29:03 +0000
Date: Wed, 16 Apr 2025 22:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 457d9772e8a5cdae64f66b5f7d5b0247365191ec
Message-ID: <202504162209.OEqOtgjF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 457d9772e8a5cdae64f66b5f7d5b0247365191ec  pinctrl: airoha: fix wrong PHY LED mapping and PHY2 LED defines

elapsed time: 1447m

configs tested: 234
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250416    gcc-12.4.0
arc                   randconfig-001-20250416    gcc-7.5.0
arc                   randconfig-002-20250416    gcc-10.5.0
arc                   randconfig-002-20250416    gcc-7.5.0
arc                           tb10x_defconfig    clang-21
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    clang-21
arm                     davinci_all_defconfig    gcc-14.2.0
arm                             mxs_defconfig    clang-21
arm                   randconfig-001-20250416    clang-17
arm                   randconfig-001-20250416    gcc-7.5.0
arm                   randconfig-002-20250416    gcc-7.5.0
arm                   randconfig-003-20250416    clang-21
arm                   randconfig-003-20250416    gcc-7.5.0
arm                   randconfig-004-20250416    clang-19
arm                   randconfig-004-20250416    gcc-7.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                            allyesconfig    gcc-14.2.0
arm64                 randconfig-001-20250416    gcc-7.5.0
arm64                 randconfig-001-20250416    gcc-8.5.0
arm64                 randconfig-002-20250416    clang-21
arm64                 randconfig-002-20250416    gcc-7.5.0
arm64                 randconfig-003-20250416    gcc-6.5.0
arm64                 randconfig-003-20250416    gcc-7.5.0
arm64                 randconfig-004-20250416    gcc-7.5.0
arm64                 randconfig-004-20250416    gcc-8.5.0
csky                             allmodconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                             allyesconfig    gcc-14.2.0
csky                  randconfig-001-20250416    gcc-14.2.0
csky                  randconfig-001-20250416    gcc-7.5.0
csky                  randconfig-002-20250416    gcc-14.2.0
csky                  randconfig-002-20250416    gcc-7.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250416    clang-21
hexagon               randconfig-001-20250416    gcc-7.5.0
hexagon               randconfig-002-20250416    clang-21
hexagon               randconfig-002-20250416    gcc-7.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250415    clang-20
i386        buildonly-randconfig-001-20250416    clang-20
i386        buildonly-randconfig-002-20250415    clang-20
i386        buildonly-randconfig-002-20250416    clang-20
i386        buildonly-randconfig-003-20250415    clang-20
i386        buildonly-randconfig-003-20250416    clang-20
i386        buildonly-randconfig-004-20250415    clang-20
i386        buildonly-randconfig-004-20250416    clang-20
i386        buildonly-randconfig-005-20250415    gcc-12
i386        buildonly-randconfig-005-20250416    clang-20
i386        buildonly-randconfig-006-20250415    gcc-12
i386        buildonly-randconfig-006-20250416    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250416    clang-20
i386                  randconfig-002-20250416    clang-20
i386                  randconfig-003-20250416    clang-20
i386                  randconfig-004-20250416    clang-20
i386                  randconfig-005-20250416    clang-20
i386                  randconfig-006-20250416    clang-20
i386                  randconfig-007-20250416    clang-20
i386                  randconfig-011-20250416    gcc-12
i386                  randconfig-012-20250416    gcc-12
i386                  randconfig-013-20250416    gcc-12
i386                  randconfig-014-20250416    gcc-12
i386                  randconfig-015-20250416    gcc-12
i386                  randconfig-016-20250416    gcc-12
i386                  randconfig-017-20250416    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                        allyesconfig    gcc-14.2.0
loongarch             randconfig-001-20250416    gcc-14.2.0
loongarch             randconfig-001-20250416    gcc-7.5.0
loongarch             randconfig-002-20250416    gcc-14.2.0
loongarch             randconfig-002-20250416    gcc-7.5.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                             allmodconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                             allyesconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                          eyeq5_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250416    gcc-6.5.0
nios2                 randconfig-001-20250416    gcc-7.5.0
nios2                 randconfig-002-20250416    gcc-14.2.0
nios2                 randconfig-002-20250416    gcc-7.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250416    gcc-11.5.0
parisc                randconfig-001-20250416    gcc-7.5.0
parisc                randconfig-002-20250416    gcc-7.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250416    gcc-7.5.0
powerpc               randconfig-001-20250416    gcc-8.5.0
powerpc               randconfig-002-20250416    clang-21
powerpc               randconfig-002-20250416    gcc-7.5.0
powerpc               randconfig-003-20250416    clang-21
powerpc               randconfig-003-20250416    gcc-7.5.0
powerpc64             randconfig-001-20250416    clang-21
powerpc64             randconfig-001-20250416    gcc-7.5.0
powerpc64             randconfig-002-20250416    clang-21
powerpc64             randconfig-002-20250416    gcc-7.5.0
powerpc64             randconfig-003-20250416    gcc-6.5.0
powerpc64             randconfig-003-20250416    gcc-7.5.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    clang-21
riscv                 randconfig-001-20250415    gcc-14.2.0
riscv                 randconfig-001-20250416    gcc-14.2.0
riscv                 randconfig-002-20250415    gcc-9.3.0
riscv                 randconfig-002-20250416    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250415    clang-21
s390                  randconfig-001-20250416    gcc-14.2.0
s390                  randconfig-002-20250415    gcc-7.5.0
s390                  randconfig-002-20250416    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    gcc-14.2.0
sh                    randconfig-001-20250415    gcc-11.5.0
sh                    randconfig-001-20250416    gcc-14.2.0
sh                    randconfig-002-20250415    gcc-9.3.0
sh                    randconfig-002-20250416    gcc-14.2.0
sh                           se7721_defconfig    clang-21
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250415    gcc-6.5.0
sparc                 randconfig-001-20250416    gcc-14.2.0
sparc                 randconfig-002-20250415    gcc-12.4.0
sparc                 randconfig-002-20250416    gcc-14.2.0
sparc                       sparc64_defconfig    clang-21
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250415    gcc-14.2.0
sparc64               randconfig-001-20250416    gcc-14.2.0
sparc64               randconfig-002-20250415    gcc-12.4.0
sparc64               randconfig-002-20250416    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250415    clang-21
um                    randconfig-001-20250416    gcc-14.2.0
um                    randconfig-002-20250415    clang-21
um                    randconfig-002-20250416    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250416    clang-20
x86_64      buildonly-randconfig-001-20250416    gcc-12
x86_64      buildonly-randconfig-002-20250416    clang-20
x86_64      buildonly-randconfig-002-20250416    gcc-12
x86_64      buildonly-randconfig-003-20250416    clang-20
x86_64      buildonly-randconfig-003-20250416    gcc-12
x86_64      buildonly-randconfig-004-20250416    clang-20
x86_64      buildonly-randconfig-005-20250416    clang-20
x86_64      buildonly-randconfig-006-20250416    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250416    gcc-12
x86_64                randconfig-002-20250416    gcc-12
x86_64                randconfig-003-20250416    gcc-12
x86_64                randconfig-004-20250416    gcc-12
x86_64                randconfig-005-20250416    gcc-12
x86_64                randconfig-006-20250416    gcc-12
x86_64                randconfig-007-20250416    gcc-12
x86_64                randconfig-008-20250416    gcc-12
x86_64                randconfig-071-20250416    gcc-12
x86_64                randconfig-072-20250416    gcc-12
x86_64                randconfig-073-20250416    gcc-12
x86_64                randconfig-074-20250416    gcc-12
x86_64                randconfig-075-20250416    gcc-12
x86_64                randconfig-076-20250416    gcc-12
x86_64                randconfig-077-20250416    gcc-12
x86_64                randconfig-078-20250416    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    clang-18
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250415    gcc-6.5.0
xtensa                randconfig-001-20250416    gcc-14.2.0
xtensa                randconfig-002-20250415    gcc-10.5.0
xtensa                randconfig-002-20250416    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

