Return-Path: <linux-gpio+bounces-11895-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 631A59AD959
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 03:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABD7FB22246
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 01:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB6628377;
	Thu, 24 Oct 2024 01:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="botS+xPj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0025334CDD
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 01:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729733973; cv=none; b=SvrTEyn3M2wxkcENGhXK2ErU9TuhQzlad1r0V36dSlnorSO8h/ijqheDDhY7e1T+WVAjrp0nLemKQeChUBuH4NeYy1JR1n4F8fTGuwi17mWqSKAi+kn8KYlFDhO9U/lUCkTtXWXwWaLIGssQO7Xxt9drSXQPYQTFSC28F1DuaHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729733973; c=relaxed/simple;
	bh=UGHCiqyWEfdo5/0uihXMh/Bc4eY7/XH+pglkLctq35c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MKqktr0RFaNDuwScNlN0iHOZgO/eTYMvUnxZ3TKmw4PAmcN7hDtchtC30mWcPwte7PhXZ39fOSONqfNIul0/TpxLevQi8S9h9/12paBMtWyrNkdLDeFDujfYC4fs9IQH1vhwROc/gvyfYQYrjSsEE8Ml0M9Y3QpCUloH9EEEFtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=botS+xPj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729733971; x=1761269971;
  h=date:from:to:cc:subject:message-id;
  bh=UGHCiqyWEfdo5/0uihXMh/Bc4eY7/XH+pglkLctq35c=;
  b=botS+xPjZarrg1FQS13kTmpfEKERxssoQrrD21SCCTS8LSGClo1zhBkd
   2qRWW0rx2927p0jqUDPfgfbkZ8UX5cxYHnzzuabT+AnLzHi3pFvaVXyVG
   Znc9oYQaDj5TEOhYSQGWl2+Q7qte41kSDTpV1h+Buz06g4A+01ME45XtV
   2HsaTCLjcoEDxsqYG5m32OmkJQw4/DCsc0V0rDX7Zgy6ycTF5yAH9QuO/
   nQ3Ad+n8OBurGHOB2/pv5YkaBHt4ZQv0+6AldH8pcqN0tirSwsZ2Qp05b
   nUGQFJJ4XvG3I0cVCBZZ3p99FiXYP349c3DHdk/5YmfnXK/uyKKKL+nT3
   g==;
X-CSE-ConnectionGUID: vhGM9Ic1RLW5IlDRja8hAw==
X-CSE-MsgGUID: PC6QIJN3RpiwtlcipnpMlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29279677"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29279677"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 18:39:30 -0700
X-CSE-ConnectionGUID: 9fAOqdINSqOUjHYRQACPGQ==
X-CSE-MsgGUID: t3HWmnYxSOqzJyLtBeYjbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="80750667"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Oct 2024 18:39:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3mox-000Vo2-03;
	Thu, 24 Oct 2024 01:39:27 +0000
Date: Thu, 24 Oct 2024 09:38:32 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:pwrseq/for-next] BUILD SUCCESS
 f82bf3c5796e1630d553669fb451e6c9d4070512
Message-ID: <202410240923.Kc9EOR2R-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git pwrseq/for-next
branch HEAD: f82bf3c5796e1630d553669fb451e6c9d4070512  power: sequencing: make the QCom PMU pwrseq driver depend on CONFIG_OF

elapsed time: 981m

configs tested: 109
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                       allnoconfig    gcc-14.1.0
alpha                      allyesconfig    clang-20
alpha                         defconfig    gcc-14.1.0
arc                        allmodconfig    clang-20
arc                         allnoconfig    gcc-14.1.0
arc                        allyesconfig    clang-20
arc                           defconfig    gcc-14.1.0
arc              vdk_hs38_smp_defconfig    gcc-14.1.0
arm                        allmodconfig    clang-20
arm                         allnoconfig    gcc-14.1.0
arm                        allyesconfig    clang-20
arm                           defconfig    gcc-14.1.0
arm                    ep93xx_defconfig    clang-20
arm                jornada720_defconfig    clang-20
arm                    moxart_defconfig    clang-20
arm                  shmobile_defconfig    clang-20
arm                  spear3xx_defconfig    gcc-14.1.0
arm                  spear6xx_defconfig    clang-20
arm                     stm32_defconfig    gcc-14.1.0
arm64                      allmodconfig    clang-20
arm64                       allnoconfig    gcc-14.1.0
arm64                         defconfig    gcc-14.1.0
csky                       alldefconfig    gcc-14.1.0
csky                        allnoconfig    gcc-14.1.0
csky                          defconfig    gcc-14.1.0
hexagon                    allmodconfig    clang-20
hexagon                     allnoconfig    gcc-14.1.0
hexagon                    allyesconfig    clang-20
hexagon                       defconfig    gcc-14.1.0
i386                       allmodconfig    clang-18
i386                       allmodconfig    gcc-12
i386                        allnoconfig    clang-18
i386                        allnoconfig    gcc-12
i386                       allyesconfig    clang-18
i386                       allyesconfig    gcc-12
i386                          defconfig    clang-18
loongarch                  allmodconfig    gcc-14.1.0
loongarch                   allnoconfig    gcc-14.1.0
loongarch                     defconfig    gcc-14.1.0
m68k                       allmodconfig    gcc-14.1.0
m68k                        allnoconfig    gcc-14.1.0
m68k                       allyesconfig    gcc-14.1.0
m68k                          defconfig    gcc-14.1.0
m68k                  m5272c3_defconfig    gcc-14.1.0
m68k                 m5275evb_defconfig    gcc-14.1.0
m68k                    multi_defconfig    clang-20
m68k                  stmark2_defconfig    clang-20
m68k                     virt_defconfig    gcc-14.1.0
microblaze                 allmodconfig    gcc-14.1.0
microblaze                  allnoconfig    gcc-14.1.0
microblaze                 allyesconfig    gcc-14.1.0
microblaze                    defconfig    gcc-14.1.0
mips                        allnoconfig    gcc-14.1.0
nios2                       allnoconfig    gcc-14.1.0
nios2                         defconfig    gcc-14.1.0
openrisc                    allnoconfig    clang-20
openrisc                   allyesconfig    gcc-14.1.0
openrisc                      defconfig    gcc-12
parisc                     allmodconfig    gcc-14.1.0
parisc                      allnoconfig    clang-20
parisc                     allyesconfig    gcc-14.1.0
parisc                        defconfig    gcc-12
parisc64                      defconfig    gcc-14.1.0
powerpc                    allmodconfig    gcc-14.1.0
powerpc                     allnoconfig    clang-20
powerpc                    allyesconfig    gcc-14.1.0
powerpc                arches_defconfig    clang-20
powerpc                mgcoge_defconfig    gcc-14.1.0
powerpc               mpc5200_defconfig    clang-20
powerpc         mpc834x_itxgp_defconfig    gcc-14.1.0
powerpc                   ps3_defconfig    clang-20
powerpc               tqm8541_defconfig    clang-20
riscv                      allmodconfig    gcc-14.1.0
riscv                       allnoconfig    clang-20
riscv                      allyesconfig    gcc-14.1.0
riscv                         defconfig    gcc-12
riscv       nommu_k210_sdcard_defconfig    clang-20
s390                       allmodconfig    gcc-14.1.0
s390                        allnoconfig    clang-20
s390                       allyesconfig    gcc-14.1.0
s390                          defconfig    gcc-12
sh                         allmodconfig    gcc-14.1.0
sh                          allnoconfig    gcc-14.1.0
sh                         allyesconfig    gcc-14.1.0
sh                  apsh4ad0a_defconfig    clang-20
sh                            defconfig    gcc-12
sh          ecovec24-romimage_defconfig    gcc-14.1.0
sh                  edosk7760_defconfig    gcc-14.1.0
sh                     se7712_defconfig    gcc-14.1.0
sh                     se7751_defconfig    gcc-14.1.0
sh             sh7724_generic_defconfig    gcc-14.1.0
sparc                      allmodconfig    gcc-14.1.0
sparc64                       defconfig    gcc-12
um                         allmodconfig    clang-20
um                          allnoconfig    clang-20
um                         allyesconfig    clang-20
um                            defconfig    gcc-12
um                       i386_defconfig    gcc-12
um                     x86_64_defconfig    gcc-12
x86_64                      allnoconfig    clang-18
x86_64                     allyesconfig    clang-18
x86_64                        defconfig    clang-18
x86_64                        defconfig    gcc-11
x86_64                            kexec    clang-18
x86_64                            kexec    gcc-12
x86_64                         rhel-8.3    gcc-12
xtensa                      allnoconfig    gcc-14.1.0
xtensa            cadence_csp_defconfig    gcc-14.1.0
xtensa          generic_kc705_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

