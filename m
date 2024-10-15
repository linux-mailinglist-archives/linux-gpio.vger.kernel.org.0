Return-Path: <linux-gpio+bounces-11347-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 854FC99E0F3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 10:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46584282E7E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400BA1C7B99;
	Tue, 15 Oct 2024 08:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kpRJMXPm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CBA18A6A5
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 08:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728980682; cv=none; b=hl/HdnJaACLXJPFueXBLJE5TlwvBIsSVh9fxegOcWtLBvvaNJ9z/Ke5AE1frTwuwxzROlRcN5bcyL7mPgMzYWFnk6hEgYrF42GideMuX+kA+tmvlFwlFn5GqE+44MDHCU6jguAO3KKGBJ71pkjzICDAkhYN6V6kY/YPaWs4LAfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728980682; c=relaxed/simple;
	bh=nbB7/2WIrUNwER+4sckkYPVcyv21cQaLGvUkQqAfZIM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=APNDe0A17VWxfrhwXQAQYVUb4Ggxz7dd71X29wThv+GCEJuK3cPHD2aruECx8qFWKO3YrYKst06BkV8j/mooaUY2eFx6vtqKCzdcsOl8k0aHQOKvEMZD4Znw76hB86yLi5ToMWi0tZU70tDR7CWIuazFILfcz8DAoNzh251FDlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kpRJMXPm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728980680; x=1760516680;
  h=date:from:to:cc:subject:message-id;
  bh=nbB7/2WIrUNwER+4sckkYPVcyv21cQaLGvUkQqAfZIM=;
  b=kpRJMXPm84lHuqHlhEP7GDwdsIz1TGQ3PgyCUMpJgcQD9jFnpoT57q4c
   D3LgvOOddm2/+kAf6K9n2Kk+I3PZpEaz7qya6hEx2XoDPdEybqu4e9zg0
   zmQ5qvoUPR5onUTnJK3ibGbCQfM8Qyvo6otCFlbdGq/X5Pqe298lR/tXz
   sv97HNufvy6/ejk3dZs1N3Gf8klImmvP0tfQIa7vFHUl0lY4NKs2dKn9M
   OJMQkofvWftIj9UVHeYRkES2UF/sQ+gC79bn918+uGJ/T9TFSz6uDPeIo
   jAzgYzDksieyCgaC6o2OIb8uI14aQ1T7LAtIUVBeQEOIuyJ2TN1ykv6dx
   A==;
X-CSE-ConnectionGUID: mMJOqNE4RRGqJrlt4lZYAA==
X-CSE-MsgGUID: wbZr09qWSR6RZTdmIQQo1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28311505"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28311505"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 01:24:39 -0700
X-CSE-ConnectionGUID: r6+4tPsWQb+Sl1i+rw8Aww==
X-CSE-MsgGUID: a11sD68AT5CzYNHej9wC4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="108551555"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Oct 2024 01:24:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0cr6-000HoZ-01;
	Tue, 15 Oct 2024 08:24:36 +0000
Date: Tue, 15 Oct 2024 16:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 476f18c0895df7b281eb84b3e687e6101c844338
Message-ID: <202410151609.Z2kgnGTw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 476f18c0895df7b281eb84b3e687e6101c844338  gpio: ljca: use devm_mutex_init() to simplify the error path and remove()

elapsed time: 1428m

configs tested: 112
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
arc                 nsimosci_hs_smp_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          moxart_defconfig    gcc-14.1.0
arm                        mvebu_v5_defconfig    gcc-14.1.0
arm                           spitz_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386                                defconfig    clang-18
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
mips                          ath25_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    gcc-14.1.0
powerpc                   lite5200b_defconfig    gcc-14.1.0
powerpc                 mpc836x_rdk_defconfig    gcc-14.1.0
powerpc                      ppc64e_defconfig    gcc-14.1.0
powerpc64                        alldefconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
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
sh                          sdk7780_defconfig    gcc-14.1.0
sh                             sh03_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
um                           x86_64_defconfig    gcc-14.1.0
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241015    clang-18
x86_64      buildonly-randconfig-002-20241015    clang-18
x86_64      buildonly-randconfig-003-20241015    clang-18
x86_64      buildonly-randconfig-004-20241015    clang-18
x86_64      buildonly-randconfig-005-20241015    clang-18
x86_64      buildonly-randconfig-006-20241015    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241015    clang-18
x86_64                randconfig-002-20241015    clang-18
x86_64                randconfig-003-20241015    clang-18
x86_64                randconfig-004-20241015    clang-18
x86_64                randconfig-005-20241015    clang-18
x86_64                randconfig-006-20241015    clang-18
x86_64                randconfig-011-20241015    clang-18
x86_64                randconfig-012-20241015    clang-18
x86_64                randconfig-013-20241015    clang-18
x86_64                randconfig-014-20241015    clang-18
x86_64                randconfig-015-20241015    clang-18
x86_64                randconfig-016-20241015    clang-18
x86_64                randconfig-071-20241015    clang-18
x86_64                randconfig-072-20241015    clang-18
x86_64                randconfig-073-20241015    clang-18
x86_64                randconfig-074-20241015    clang-18
x86_64                randconfig-075-20241015    clang-18
x86_64                randconfig-076-20241015    clang-18
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

