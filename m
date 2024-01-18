Return-Path: <linux-gpio+bounces-2329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DC6831841
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jan 2024 12:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81F52289A80
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jan 2024 11:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADA123766;
	Thu, 18 Jan 2024 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XsYjRiwn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AF12375A
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2024 11:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705576516; cv=none; b=Hz567Wy+EJ6TABCWKk7BYQOTjMIAFjUXl5MeesXSbkrxYYduwEUXkz3Dkk7qHp5euyvCPUZZWe+F2wNXwnvLPWR+oeDHOh5tVjEn1DMs+7Vl0t76LUkr5VA/rCyfoSIpa1vYogBkNSW7x2GD1cBrZcjSceSFTf0F1wHGYONxa6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705576516; c=relaxed/simple;
	bh=JNypjUotroq/s2BGhFIDxcVcsk60ks6RiI5QFzts+dQ=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 User-Agent; b=AvDMuzzAFLO0NxgByX64/dzheUmQOcwD4RNV4qQTdehfZBkt79sk9HUD/7TmvI6Yp3+Ahu1XvW0G5Q69dXdRHRovdULwUo4h94rcu2/9q+gkiAhlofTgjWMu1iTJ19dQE5JrBoFb90eFFvZmIlJgWCSfckCKei2v9Lc+JJMEcPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XsYjRiwn; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705576514; x=1737112514;
  h=date:from:to:cc:subject:message-id;
  bh=JNypjUotroq/s2BGhFIDxcVcsk60ks6RiI5QFzts+dQ=;
  b=XsYjRiwnLT/t9oriZkNIY/bUdlpqcxM8tvFKKPqR3nJxd3DZBZBdSSDR
   hA+UI+DyPZOCqLJG+yEBGYPffGAW6MRgkUTWjntWvqyggs5sZyiMnWi7K
   NtqnJUAJ5oFsuUQ0G2TD+W4jq1itm6Ff7XB+Y4ObziGQbNVy1cQ0Fa8/6
   610rdRvnlKJNz14UraKEiRbrOh/5Vu+U0q+j5NDAaOFmitg1ahAbOmwiW
   DmkZIC/N1Sgj8OoqzdbSZGZyNelH9cjGNXTKY2JyVu9PKxZZDFvg9zEwB
   v8M6m/X5WUmhMAns84QwuOS/L382TULwMnPB+BfU9cWdPSFKDvLz9+VUY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="397578170"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="397578170"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 03:15:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="334184"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Jan 2024 03:15:13 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQQMY-0002vd-2p;
	Thu, 18 Jan 2024 11:15:10 +0000
Date: Thu, 18 Jan 2024 19:14:24 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 efb8235bfdbe661c460f803150b50840a73b5f03
Message-ID: <202401181922.BN4OaXAE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: efb8235bfdbe661c460f803150b50840a73b5f03  gpiolib: revert the attempt to protect the GPIO device list with an rwsem

elapsed time: 1517m

configs tested: 103
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240118   gcc  
arc                   randconfig-002-20240118   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240118   clang
arm                   randconfig-002-20240118   clang
arm                   randconfig-003-20240118   clang
arm                   randconfig-004-20240118   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                 randconfig-001-20240118   clang
arm64                 randconfig-002-20240118   clang
arm64                 randconfig-003-20240118   clang
arm64                 randconfig-004-20240118   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240118   gcc  
csky                  randconfig-002-20240118   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240118   clang
hexagon               randconfig-002-20240118   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240117   gcc  
i386         buildonly-randconfig-002-20240117   gcc  
i386         buildonly-randconfig-003-20240117   gcc  
i386         buildonly-randconfig-004-20240117   gcc  
i386         buildonly-randconfig-005-20240117   gcc  
i386         buildonly-randconfig-006-20240117   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240117   gcc  
i386                  randconfig-002-20240117   gcc  
i386                  randconfig-003-20240117   gcc  
i386                  randconfig-004-20240117   gcc  
i386                  randconfig-005-20240117   gcc  
i386                  randconfig-006-20240117   gcc  
i386                  randconfig-011-20240117   clang
i386                  randconfig-012-20240117   clang
i386                  randconfig-013-20240117   clang
i386                  randconfig-014-20240117   clang
i386                  randconfig-015-20240117   clang
i386                  randconfig-016-20240117   clang
loongarch                        allmodconfig   gcc  
loongarch             randconfig-001-20240118   gcc  
loongarch             randconfig-002-20240118   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                 randconfig-001-20240118   gcc  
nios2                 randconfig-002-20240118   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20240118   gcc  
parisc                randconfig-002-20240118   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240118   clang
powerpc               randconfig-002-20240118   clang
powerpc               randconfig-003-20240118   clang
powerpc64             randconfig-001-20240118   clang
powerpc64             randconfig-002-20240118   clang
powerpc64             randconfig-003-20240118   clang
riscv                 randconfig-001-20240118   clang
riscv                 randconfig-002-20240118   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20240118   gcc  
s390                  randconfig-002-20240118   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20240118   gcc  
sh                    randconfig-002-20240118   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20240118   gcc  
sparc64               randconfig-002-20240118   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                    randconfig-001-20240118   clang
um                    randconfig-002-20240118   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20240118   gcc  
xtensa                randconfig-002-20240118   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

