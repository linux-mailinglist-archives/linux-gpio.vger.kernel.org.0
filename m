Return-Path: <linux-gpio+bounces-22907-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAB7AFBF1A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 02:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4EAD42274A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 00:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FF463CF;
	Tue,  8 Jul 2025 00:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLz2Ve4E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554036FBF
	for <linux-gpio@vger.kernel.org>; Tue,  8 Jul 2025 00:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751933329; cv=none; b=jyIKYpIsb4PQEIqMW4O39VLLGCs4zZq+9f5167M8Sk3vTo4Lw8ziADxKNkbCnR2cO+gh+bsYoCrKkywcej8YxE9HlfU9xPV6wIQPr8OFLQY6exIlukLhzDhm40oStqPT+f2kMj9+FhSX7GK0Bt2eoL1TQfWyRU7X3n+Hw57+IZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751933329; c=relaxed/simple;
	bh=WiJ5QmuVoWUTkX3yauxQW2cGTXXNHPfw/xvARS7+cvY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jIM8LmYoXIfuWyL9fRPU9naHeCGyjABVjMmcusxB+cM8FaHnctia0H6CdctJZitZ2KUm28WLZXa65XZ11ocd/bq/avaF3ucFkIlevcmr/443aYEzNs7UPcYeZA8txcf6VB8uXp7CZwGMpdV/HEfoHHeornLDwbywdd84hX6U5mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLz2Ve4E; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751933327; x=1783469327;
  h=date:from:to:cc:subject:message-id;
  bh=WiJ5QmuVoWUTkX3yauxQW2cGTXXNHPfw/xvARS7+cvY=;
  b=aLz2Ve4EczMh0iXbHK/VGVNbi/Bi75wwsIn19dF4LWAu/uuVUyczie75
   IGD82+B2jZyieutABM0roOq5f0NN/m/gwSmqopN7mvetHdCtgqwuMUFf8
   vXqV4suRy+DKqq5Ephh1wNH+a7DR0FeLVZU5KZjCVYud9kmfiVDM4GlUd
   aYJlqlVa3Ki8BDZc32LZdeLFSL551q2ZKxJS7QHROnRqJSY3L0sa3TPP4
   ualLEap30+hSwMHBjTcAdsXhXVv89w/9AtSxWn8fKaaO3EdVixodrWOLO
   WP6rn9UCrqLvuG0nwK68s+yP4klUaEAOsO9/xIWLqjs74RfV8YQLeRD6+
   Q==;
X-CSE-ConnectionGUID: 05+PfE9aRmqtQQ+Mq966LQ==
X-CSE-MsgGUID: gL6vnxUUSmSRkN276eWM0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="79596403"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="79596403"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 17:08:47 -0700
X-CSE-ConnectionGUID: Ei035rAhQCasH/3bLRDsGQ==
X-CSE-MsgGUID: tqyh9e9TQGivU18V4lKbSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="160892710"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Jul 2025 17:08:45 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYvt5-0000pz-2k;
	Tue, 08 Jul 2025 00:08:43 +0000
Date: Tue, 08 Jul 2025 08:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/mmio-remove-bgpio-pdata] BUILD SUCCESS
 9bad4bec5daddbb296481af759f9d56c849ba96f
Message-ID: <202507080846.3VMYV5TV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/mmio-remove-bgpio-pdata
branch HEAD: 9bad4bec5daddbb296481af759f9d56c849ba96f  gpio: mmio: remove struct bgpio_pdata

elapsed time: 927m

configs tested: 127
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250707    gcc-15.1.0
arc                   randconfig-002-20250707    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                           imxrt_defconfig    clang-21
arm                   randconfig-001-20250707    gcc-10.5.0
arm                   randconfig-002-20250707    gcc-11.5.0
arm                   randconfig-003-20250707    clang-21
arm                   randconfig-004-20250707    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250707    gcc-8.5.0
arm64                 randconfig-002-20250707    gcc-11.5.0
arm64                 randconfig-003-20250707    gcc-12.3.0
arm64                 randconfig-004-20250707    gcc-14.3.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250707    gcc-15.1.0
csky                  randconfig-002-20250707    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250707    clang-21
hexagon               randconfig-002-20250707    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250707    gcc-12
i386        buildonly-randconfig-002-20250707    clang-20
i386        buildonly-randconfig-003-20250707    gcc-12
i386        buildonly-randconfig-004-20250707    gcc-12
i386        buildonly-randconfig-005-20250707    gcc-12
i386        buildonly-randconfig-006-20250707    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250707    clang-21
loongarch             randconfig-002-20250707    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    clang-21
mips                            gpr_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250707    gcc-10.5.0
nios2                 randconfig-002-20250707    gcc-12.4.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250707    gcc-8.5.0
parisc                randconfig-002-20250707    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                      mgcoge_defconfig    clang-21
powerpc               randconfig-001-20250707    gcc-8.5.0
powerpc               randconfig-002-20250707    clang-21
powerpc               randconfig-003-20250707    gcc-8.5.0
powerpc64             randconfig-001-20250707    gcc-8.5.0
powerpc64             randconfig-002-20250707    gcc-10.5.0
powerpc64             randconfig-003-20250707    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250707    clang-21
riscv                 randconfig-002-20250707    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250707    clang-21
s390                  randconfig-002-20250707    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250707    gcc-15.1.0
sh                    randconfig-002-20250707    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250707    gcc-12.4.0
sparc                 randconfig-002-20250707    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250707    clang-20
sparc64               randconfig-002-20250707    gcc-15.1.0
um                               alldefconfig    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250707    gcc-12
um                    randconfig-002-20250707    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250707    gcc-12
x86_64      buildonly-randconfig-002-20250707    gcc-12
x86_64      buildonly-randconfig-003-20250707    gcc-12
x86_64      buildonly-randconfig-004-20250707    clang-20
x86_64      buildonly-randconfig-005-20250707    gcc-12
x86_64      buildonly-randconfig-006-20250707    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250707    gcc-12.4.0
xtensa                randconfig-002-20250707    gcc-8.5.0
xtensa                    xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

