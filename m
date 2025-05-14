Return-Path: <linux-gpio+bounces-20186-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A80C1AB7960
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 01:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C825B3ABFC4
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 23:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E551FBE87;
	Wed, 14 May 2025 23:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7D9T06j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E119426AC3
	for <linux-gpio@vger.kernel.org>; Wed, 14 May 2025 23:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747264713; cv=none; b=Zhx1J88YThLysKBgvPHSipup1yrXKV5u4eqWbkY0D0tLYu5UFgWLYmBHwO+vBQX1s/WJDnvc/ajhxsUXluCtMCKXwEenkYXp3GcTpQcgAxBTZ7qeEKeB8E5lDKwBYGwJdna2+OH9+6+JORrVmeJDpIYOIK1J7oxWotxUkQivKek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747264713; c=relaxed/simple;
	bh=W3V9cn7pJoEAO3ghfVkpZM5uxOcw2FMD7U3c12ajs3Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ERdFviH02nOmKU5GURdr/3BuQiSi3xsnrVLKlhiv5vkIuk/MoqGB0Nkcvgx44h99FYrtna7SHq+BfgHJzD6XbXDkznMF9lRw4VrHi5ScFJlKitW8YOlYDn98VgT6e+zM28JxUCAh9YuvFWEOUr6vmv+ANdnKwZjIgB6LwVpe3Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7D9T06j; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747264711; x=1778800711;
  h=date:from:to:cc:subject:message-id;
  bh=W3V9cn7pJoEAO3ghfVkpZM5uxOcw2FMD7U3c12ajs3Q=;
  b=c7D9T06j5zpSQ7Zbe9hYMfEIdCCy0TvASpHAbE8J6pzTU9sL+K2qNRap
   +yNTwRFthGvB5EVxO3JHI8mvOh6mhpsj5Tq7Jcuw5cJNjplPLRQ7HXDcC
   heUtcDfOCy8OSilDlr7HzakP6wg7ANO984za1fU/vhsQxhuLKJATCf85P
   juX9yLH3C76KD29gv0/rVZkwtPoZxojNhr9rMgba3GVLuQP67/7NgP+k1
   8iGMuw4ssD/aopEuVSgp0XF7vg5sRAr2Apfizv17kOJ6poD6/oX/wXrg7
   riM631N8nMQUUa9w2s63+h7XFjOJxODysBXw9Jm9CMU6DbHRuXHBkg3c5
   Q==;
X-CSE-ConnectionGUID: 8Xvwm0kATlu7eZ6C6fqggg==
X-CSE-MsgGUID: sZsto6zkTkiiouJocVZNBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="51823541"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="51823541"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 16:18:30 -0700
X-CSE-ConnectionGUID: 1L53n798SvCYtMEaR8kQLw==
X-CSE-MsgGUID: csvQHJRjSM2ixmawSdR2rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="175314135"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 May 2025 16:18:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFLMm-000Hfz-25;
	Wed, 14 May 2025 23:18:24 +0000
Date: Thu, 15 May 2025 07:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 8f5a1cb2e8aa3953220637ad2836be4163ca8b6e
Message-ID: <202505150739.5lk8mFmJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 8f5a1cb2e8aa3953220637ad2836be4163ca8b6e  Merge branch 'devel' into for-next

elapsed time: 1453m

configs tested: 123
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250514    gcc-13.3.0
arc                   randconfig-002-20250514    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250514    clang-21
arm                   randconfig-002-20250514    clang-21
arm                   randconfig-003-20250514    gcc-7.5.0
arm                   randconfig-004-20250514    gcc-7.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250514    clang-17
arm64                 randconfig-002-20250514    gcc-5.5.0
arm64                 randconfig-003-20250514    gcc-5.5.0
arm64                 randconfig-004-20250514    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250514    gcc-13.3.0
csky                  randconfig-002-20250514    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250514    clang-21
hexagon               randconfig-002-20250514    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250514    clang-20
i386        buildonly-randconfig-002-20250514    gcc-12
i386        buildonly-randconfig-003-20250514    clang-20
i386        buildonly-randconfig-004-20250514    clang-20
i386        buildonly-randconfig-005-20250514    gcc-12
i386        buildonly-randconfig-006-20250514    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250514    gcc-14.2.0
loongarch             randconfig-002-20250514    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip32_defconfig    clang-21
mips                   sb1250_swarm_defconfig    gcc-14.2.0
mips                        vocore2_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250514    gcc-7.5.0
nios2                 randconfig-002-20250514    gcc-11.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250514    gcc-12.4.0
parisc                randconfig-002-20250514    gcc-10.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                      katmai_defconfig    clang-21
powerpc                     mpc5200_defconfig    clang-21
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                      pcm030_defconfig    clang-21
powerpc               randconfig-001-20250514    clang-17
powerpc               randconfig-002-20250514    gcc-5.5.0
powerpc               randconfig-003-20250514    gcc-7.5.0
powerpc64             randconfig-001-20250514    gcc-10.5.0
powerpc64             randconfig-002-20250514    clang-19
powerpc64             randconfig-003-20250514    gcc-5.5.0
riscv                             allnoconfig    gcc-14.2.0
riscv                               defconfig    clang-21
riscv                    nommu_k210_defconfig    clang-21
riscv                 randconfig-001-20250514    gcc-7.5.0
riscv                 randconfig-002-20250514    gcc-14.2.0
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250514    clang-21
s390                  randconfig-002-20250514    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250514    gcc-11.5.0
sh                    randconfig-002-20250514    gcc-9.3.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250514    gcc-8.5.0
sparc                 randconfig-002-20250514    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250514    gcc-14.2.0
sparc64               randconfig-002-20250514    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250514    gcc-12
um                    randconfig-002-20250514    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250514    clang-20
x86_64      buildonly-randconfig-002-20250514    gcc-12
x86_64      buildonly-randconfig-003-20250514    gcc-12
x86_64      buildonly-randconfig-004-20250514    gcc-12
x86_64      buildonly-randconfig-005-20250514    clang-20
x86_64      buildonly-randconfig-006-20250514    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250514    gcc-10.5.0
xtensa                randconfig-002-20250514    gcc-12.4.0
xtensa                         virt_defconfig    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

