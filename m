Return-Path: <linux-gpio+bounces-8977-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B1A95B2F9
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 12:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44D091C22EED
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 10:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE3717CA19;
	Thu, 22 Aug 2024 10:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GlbKZCTt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C86F17DE16
	for <linux-gpio@vger.kernel.org>; Thu, 22 Aug 2024 10:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724322905; cv=none; b=SGciMldBg53NYhmESNMJR0H1JrMC1Gi0/6sp5fBtchs1ZeDZ+mpJu6M5D6PnnqfU6S0snchwQWK2GyZwWY2jwCyDSBF0OZkOhi35FLfqRdsBdonEME3cE6cPgE4ekXOeGdmwSkeHygQfJj1GUDKQBsTEKIGXyu+E1IlGbKWtv9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724322905; c=relaxed/simple;
	bh=Po6qK+KjUlU1qqcL3CUPU9Up/Oid0AJqskmyhxnUlxU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L5eFrrtjelU3QlxMJqW0MqS03l4ywnkjt1G2ZUN3QvqFkaRPedGxwqErj9mGS3dAZOcLOCHAb46Er9H9aPnwxB6dDEgousEUvs0hrI7yA2Z2WaeQQyZkmwUgGCDhPP2xJdAt7RSHQg+4zWnPGffCcnUfGrsE7+0lYgFHhAuvtWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GlbKZCTt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724322903; x=1755858903;
  h=date:from:to:cc:subject:message-id;
  bh=Po6qK+KjUlU1qqcL3CUPU9Up/Oid0AJqskmyhxnUlxU=;
  b=GlbKZCTtaWoS+Y3xZUDiGYBXA6PbUhQ8btWKNLBTCCinQRfLGVgOwU/W
   9duGI/6yOmF59kbE5jxbiSoNLVds2Ah5A0ppL7nXzRxILT+bVXV41mnz5
   kkz4BjEum5svlwYws0A9hE1/xRJbsrg2lexltIod8KVjVdILS9LDCdpQ3
   HzF8ALuaEP9K6gOag0hn042e/kn136TDeFreEJUCC5l3A5lOl2b1lqH3F
   PukpXVCIKZ17yapAAzHaVihW4LL2aBpq3QlR/qrP9Mtjy2F+2Z2FfKo6k
   KV+A8lstegz5wFSkSvtgBlvu3+VdfaFVYvowarF0mSa1DTQ3gPrK+/6Uk
   g==;
X-CSE-ConnectionGUID: W/t+ydG5TWqZIUDv3p3HTA==
X-CSE-MsgGUID: f/50VBRuTZS8Wuy1TH7dtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22858104"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="22858104"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 03:35:03 -0700
X-CSE-ConnectionGUID: m7zbwP4jTICrnYzO2GCujQ==
X-CSE-MsgGUID: vWbI2n8bToGYkKkq+8cVDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="98906168"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Aug 2024 03:35:02 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh59f-000Cfc-19;
	Thu, 22 Aug 2024 10:34:59 +0000
Date: Thu, 22 Aug 2024 18:34:18 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 b41a9bf2c64eea119bb6cbef420345f547b9a677
Message-ID: <202408221816.RjR0GkIV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: b41a9bf2c64eea119bb6cbef420345f547b9a677  gpio: pca953x: Print the error code on read/write failures

elapsed time: 1261m

configs tested: 176
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                     nsimosci_hs_defconfig   gcc-13.2.0
arc                   randconfig-001-20240822   gcc-13.2.0
arc                   randconfig-002-20240822   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                      footbridge_defconfig   gcc-13.2.0
arm                          ixp4xx_defconfig   gcc-13.2.0
arm                            mmp2_defconfig   gcc-13.2.0
arm                   randconfig-001-20240822   gcc-13.2.0
arm                   randconfig-002-20240822   gcc-13.2.0
arm                   randconfig-003-20240822   gcc-13.2.0
arm                   randconfig-004-20240822   gcc-13.2.0
arm                        shmobile_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240822   gcc-13.2.0
arm64                 randconfig-002-20240822   gcc-13.2.0
arm64                 randconfig-003-20240822   gcc-13.2.0
arm64                 randconfig-004-20240822   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240822   gcc-13.2.0
csky                  randconfig-002-20240822   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240822   gcc-12
i386         buildonly-randconfig-002-20240822   gcc-12
i386         buildonly-randconfig-003-20240822   gcc-12
i386         buildonly-randconfig-004-20240822   gcc-12
i386         buildonly-randconfig-005-20240822   gcc-12
i386         buildonly-randconfig-006-20240822   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240822   gcc-12
i386                  randconfig-002-20240822   gcc-12
i386                  randconfig-003-20240822   gcc-12
i386                  randconfig-004-20240822   gcc-12
i386                  randconfig-005-20240822   gcc-12
i386                  randconfig-006-20240822   gcc-12
i386                  randconfig-011-20240822   gcc-12
i386                  randconfig-012-20240822   gcc-12
i386                  randconfig-013-20240822   gcc-12
i386                  randconfig-014-20240822   gcc-12
i386                  randconfig-015-20240822   gcc-12
i386                  randconfig-016-20240822   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch                 loongson3_defconfig   gcc-13.2.0
loongarch             randconfig-001-20240822   gcc-13.2.0
loongarch             randconfig-002-20240822   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                            q40_defconfig   gcc-13.2.0
m68k                           virt_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240822   gcc-13.2.0
nios2                 randconfig-002-20240822   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240822   gcc-13.2.0
parisc                randconfig-002-20240822   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      bamboo_defconfig   gcc-13.2.0
powerpc                     kmeter1_defconfig   gcc-13.2.0
powerpc                 linkstation_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240822   gcc-13.2.0
powerpc64             randconfig-002-20240822   gcc-13.2.0
powerpc64             randconfig-003-20240822   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240822   gcc-13.2.0
riscv                 randconfig-002-20240822   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240822   gcc-13.2.0
s390                  randconfig-002-20240822   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                          landisk_defconfig   gcc-13.2.0
sh                    randconfig-001-20240822   gcc-13.2.0
sh                    randconfig-002-20240822   gcc-13.2.0
sh                           se7724_defconfig   gcc-13.2.0
sh                             sh03_defconfig   gcc-13.2.0
sh                   sh7770_generic_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240822   gcc-13.2.0
sparc64               randconfig-002-20240822   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240822   gcc-13.2.0
um                    randconfig-002-20240822   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240822   gcc-12
x86_64       buildonly-randconfig-002-20240822   gcc-12
x86_64       buildonly-randconfig-003-20240822   gcc-12
x86_64       buildonly-randconfig-004-20240822   gcc-12
x86_64       buildonly-randconfig-005-20240822   gcc-12
x86_64       buildonly-randconfig-006-20240822   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240822   gcc-12
x86_64                randconfig-002-20240822   gcc-12
x86_64                randconfig-003-20240822   gcc-12
x86_64                randconfig-004-20240822   gcc-12
x86_64                randconfig-005-20240822   gcc-12
x86_64                randconfig-006-20240822   gcc-12
x86_64                randconfig-011-20240822   gcc-12
x86_64                randconfig-012-20240822   gcc-12
x86_64                randconfig-013-20240822   gcc-12
x86_64                randconfig-014-20240822   gcc-12
x86_64                randconfig-015-20240822   gcc-12
x86_64                randconfig-016-20240822   gcc-12
x86_64                randconfig-071-20240822   gcc-12
x86_64                randconfig-072-20240822   gcc-12
x86_64                randconfig-073-20240822   gcc-12
x86_64                randconfig-074-20240822   gcc-12
x86_64                randconfig-075-20240822   gcc-12
x86_64                randconfig-076-20240822   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240822   gcc-13.2.0
xtensa                randconfig-002-20240822   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

