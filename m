Return-Path: <linux-gpio+bounces-16392-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C16ACA3F77E
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 15:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB1F1860D9B
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 14:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BECA20E33A;
	Fri, 21 Feb 2025 14:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLDd2hR3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18A420E019
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 14:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740148875; cv=none; b=oeOHkCHjEG97DuL+OCZjYvKGmZ71IJHKsaM4bUdOLfqvrqeF1yJi/HL/Hd02qvnNXXf6lbhSlx+DU8nsG9QmJp17I3nk0/gi6IHR9rUZV9oOtvFVkLoC92gxLQalkYGkhKwC587TYYhfl4AzeTrx5+XZ7Oun2+WKKvalsw4V1G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740148875; c=relaxed/simple;
	bh=eFHEOdurooV0c2GoP/xtLgCeavL84wB0vDKwhLTx6EA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Oh+ArPKl6eUbkpv0xxfh5axUCiIRarHnKczHKfaHZWsFQwFk4319gtJuGmMo8yd0DQ/E+omBY6uGdvcmqhcBC847ko/TbgdVE83F7sz52K3e9+Ps87WpAyePt5rGzT0V7J3RtB/szNAM3n/MGNJO6yR6rVrjTPP+4c/oRWaqdOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLDd2hR3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740148874; x=1771684874;
  h=date:from:to:cc:subject:message-id;
  bh=eFHEOdurooV0c2GoP/xtLgCeavL84wB0vDKwhLTx6EA=;
  b=ZLDd2hR3f7FViZZa6bAj6P0vjyrUY1gI/iH65XyTNiify15MT8K5P46v
   YxhOMfE/9oB/uttbJzV6YuYZzO0nHtA0b5Ckl0ZkXFRiJgYVuc08/pf9g
   XqEpI07cIhe+6gh0uXXMoaZQuS38BwlCWJDSn9DMxahNDaXPNxdlNZfE2
   o54NRSxDawyDye3nvYXq5dxMNNkxyrd/EqjK+JGYU8jf2Cemo7nK0YrqP
   gbfxTPd8uW4Og/GPtoSZxWmvY9EdRkDxd8F2DJp/XqIyHBZNFlM0sL2PC
   bGCNZQqmt6rdgGSn60f1p0eCIzek/3QkdWQn/5202Nlke6mSqvyJGoxIR
   Q==;
X-CSE-ConnectionGUID: JmJBZ2KKS3qR9iTLR3S8ow==
X-CSE-MsgGUID: jdkLhfJZQDKMsFEGpBUJ+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41092379"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="41092379"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 06:41:13 -0800
X-CSE-ConnectionGUID: NZChxYd3Syq+hKXnOsDsSQ==
X-CSE-MsgGUID: fFTfSysJSA6+CGaltua/fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="116022869"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Feb 2025 06:41:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlUDA-0005cd-0B;
	Fri, 21 Feb 2025 14:41:05 +0000
Date: Fri, 21 Feb 2025 22:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 96fa9ec477ff60bed87e1441fd43e003179f3253
Message-ID: <202502212208.h2waL4qv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 96fa9ec477ff60bed87e1441fd43e003179f3253  gpiolib: don't bail out if get_direction() fails in gpiochip_add_data()

elapsed time: 1461m

configs tested: 88
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250221    gcc-13.2.0
arc                   randconfig-002-20250221    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250221    gcc-14.2.0
arm                   randconfig-002-20250221    clang-19
arm                   randconfig-003-20250221    gcc-14.2.0
arm                   randconfig-004-20250221    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250221    clang-15
arm64                 randconfig-002-20250221    clang-21
arm64                 randconfig-003-20250221    clang-21
arm64                 randconfig-004-20250221    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250221    gcc-14.2.0
csky                  randconfig-002-20250221    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250221    clang-21
hexagon               randconfig-002-20250221    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250220    gcc-12
i386        buildonly-randconfig-002-20250220    gcc-12
i386        buildonly-randconfig-003-20250220    gcc-12
i386        buildonly-randconfig-004-20250220    clang-19
i386        buildonly-randconfig-005-20250220    clang-19
i386        buildonly-randconfig-006-20250220    clang-19
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250221    gcc-14.2.0
loongarch             randconfig-002-20250221    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250221    gcc-14.2.0
nios2                 randconfig-002-20250221    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                randconfig-001-20250221    gcc-14.2.0
parisc                randconfig-002-20250221    gcc-14.2.0
powerpc               randconfig-001-20250221    clang-21
powerpc               randconfig-002-20250221    clang-21
powerpc               randconfig-003-20250221    clang-17
powerpc64             randconfig-001-20250221    clang-21
powerpc64             randconfig-002-20250221    clang-21
powerpc64             randconfig-003-20250221    clang-19
riscv                 randconfig-001-20250220    gcc-14.2.0
riscv                 randconfig-002-20250220    clang-21
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250220    clang-19
s390                  randconfig-002-20250220    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250220    gcc-14.2.0
sh                    randconfig-002-20250220    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250220    gcc-14.2.0
sparc                 randconfig-002-20250220    gcc-14.2.0
sparc64               randconfig-001-20250220    gcc-14.2.0
sparc64               randconfig-002-20250220    gcc-14.2.0
um                               allmodconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250220    gcc-12
um                    randconfig-002-20250220    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250220    gcc-12
x86_64      buildonly-randconfig-002-20250220    gcc-12
x86_64      buildonly-randconfig-003-20250220    gcc-12
x86_64      buildonly-randconfig-004-20250220    gcc-12
x86_64      buildonly-randconfig-005-20250220    gcc-12
x86_64      buildonly-randconfig-006-20250220    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250220    gcc-14.2.0
xtensa                randconfig-002-20250220    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

