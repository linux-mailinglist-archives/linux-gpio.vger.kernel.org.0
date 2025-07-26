Return-Path: <linux-gpio+bounces-23837-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE49B12844
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jul 2025 02:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7716F3AFEDC
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jul 2025 00:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE5B188006;
	Sat, 26 Jul 2025 00:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMrLgA8I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2631813635E
	for <linux-gpio@vger.kernel.org>; Sat, 26 Jul 2025 00:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753491085; cv=none; b=C16wXt7b0msihHIjRzIkpE9eXbgQcFM7T4tYfS50hzbLfNoafb2C5p9Bj2jg0XA83kT13Mjl1rydEME9K4F7l0rWrPqLtS88e4vEaHZCTTweQrPjN6EKIUgvUbrJCgYGd5daT3y3Uq2HGvVCuRRnhOO1QTLtUGfH3AEodj0i+mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753491085; c=relaxed/simple;
	bh=Tg54Z/5FMnxNyg3Z0ogSVjtKCcuLDkmrqzlpJad0bxU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e7zNrSl5jqV3gjq3prk9kKfIM8adrBWQuG2eSdNq8F9rbPhtEALbIgYnamNwaUg+0AO2f68jssDqTsujFZawElJYtVDnBiJ5jM1ZgUPUTsMO/yQtuqTlA/Vy6JtVfvRpYQKt3sWHeccjuoaEjEifr/+RHlPop/W8abdDh0aSAFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMrLgA8I; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753491083; x=1785027083;
  h=date:from:to:cc:subject:message-id;
  bh=Tg54Z/5FMnxNyg3Z0ogSVjtKCcuLDkmrqzlpJad0bxU=;
  b=NMrLgA8Iu5huZIfDQ30yuxgaqdvQVIbb0K+Ibw90nsRxWgRbNHuzJpEk
   4Ku5DAFFCms07GlK8w1OF8JJPfz17mWvQK2aA7uvs6Ft4ye03ssAbyGv0
   BMhtVZqhauOV6rUGiO8wH/EN/uc3G38XdvIHQC45OQDjZjm4q5Sb/mY+J
   Il/pU2ZCxfYIu3Mr6ZXmHzIfNRfftFvprLc4zCnCsDmBoN7vjMvxaGhvg
   DXFS/b86dAJg6+DcIKTrlBxk3YIFV/jh6FvvmAhfqAkAOY7h8ivG4sGBi
   sg2bWpL4fZ7Anfv41Bf39YEPE1Fa40V7Axz3sOC5T+hziZY3EaXeJGQ6q
   w==;
X-CSE-ConnectionGUID: iiaduDB3QcW8Ed2Q6MR1YA==
X-CSE-MsgGUID: /MV9sYLxSQyeUsXTM5kPXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="66907169"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66907169"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 17:51:22 -0700
X-CSE-ConnectionGUID: veqi9lZvQEG9Nh5KHxo4wQ==
X-CSE-MsgGUID: kMsMX5YFRcOJO/Fk9LuFTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161449836"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Jul 2025 17:51:21 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufT8B-000Ldf-0V;
	Sat, 26 Jul 2025 00:51:19 +0000
Date: Sat, 26 Jul 2025 08:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/devel] BUILD SUCCESS
 e27a47cfa1fdbfa754664ae3dbac450008831fa0
Message-ID: <202507260802.7AUPr0hJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
branch HEAD: e27a47cfa1fdbfa754664ae3dbac450008831fa0  treewide: rename GPIO set callbacks back to their original names

elapsed time: 1028m

configs tested: 102
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250725    gcc-13.4.0
arc                   randconfig-002-20250725    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250725    gcc-15.1.0
arm                   randconfig-002-20250725    clang-22
arm                   randconfig-003-20250725    clang-20
arm                   randconfig-004-20250725    clang-22
arm64                            allmodconfig    clang-19
arm64                 randconfig-001-20250725    clang-22
arm64                 randconfig-002-20250725    gcc-12.5.0
arm64                 randconfig-003-20250725    gcc-14.3.0
arm64                 randconfig-004-20250725    clang-22
csky                  randconfig-001-20250725    gcc-11.5.0
csky                  randconfig-002-20250725    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250725    clang-22
hexagon               randconfig-002-20250725    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250725    gcc-12
i386        buildonly-randconfig-002-20250725    clang-20
i386        buildonly-randconfig-003-20250725    clang-20
i386        buildonly-randconfig-004-20250725    clang-20
i386        buildonly-randconfig-005-20250725    clang-20
i386        buildonly-randconfig-006-20250725    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch             randconfig-001-20250725    gcc-15.1.0
loongarch             randconfig-002-20250725    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250725    gcc-9.5.0
nios2                 randconfig-002-20250725    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20250725    gcc-15.1.0
parisc                randconfig-002-20250725    gcc-8.5.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250725    gcc-8.5.0
powerpc               randconfig-002-20250725    clang-22
powerpc               randconfig-003-20250725    gcc-8.5.0
powerpc64             randconfig-001-20250725    clang-22
powerpc64             randconfig-002-20250725    gcc-8.5.0
powerpc64             randconfig-003-20250725    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250725    gcc-10.5.0
riscv                 randconfig-002-20250725    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250725    gcc-8.5.0
s390                  randconfig-002-20250725    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250725    gcc-15.1.0
sh                    randconfig-002-20250725    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250725    gcc-8.5.0
sparc                 randconfig-002-20250725    gcc-11.5.0
sparc64               randconfig-001-20250725    gcc-8.5.0
sparc64               randconfig-002-20250725    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250725    clang-22
um                    randconfig-002-20250725    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250725    clang-20
x86_64      buildonly-randconfig-002-20250725    clang-20
x86_64      buildonly-randconfig-003-20250725    clang-20
x86_64      buildonly-randconfig-004-20250725    clang-20
x86_64      buildonly-randconfig-005-20250725    gcc-12
x86_64      buildonly-randconfig-006-20250725    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250725    gcc-13.4.0
xtensa                randconfig-002-20250725    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

