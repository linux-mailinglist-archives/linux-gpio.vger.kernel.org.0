Return-Path: <linux-gpio+bounces-13881-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A76E49F1F30
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Dec 2024 15:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B62C41668B3
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Dec 2024 14:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DAC18FDBE;
	Sat, 14 Dec 2024 14:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M70PMnAa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A379D53C
	for <linux-gpio@vger.kernel.org>; Sat, 14 Dec 2024 14:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734185353; cv=none; b=F5IaMySEk1recJbbX7eOfyr00DG2/g7fSFO5tKSoS+7Inz3J/XpKOEPfnMn1Kx9B6IsQ7PqAmPPPWiN9CH+mcAnmw5jFWcOUXuGy0UgVTBKLEW3Uu6/UQbmNJCVM81bS3q/VW1Jt/2NGapohhdCH3Rm4iUKGhAxsdmYNFIJOV78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734185353; c=relaxed/simple;
	bh=TD2MLr62OtWH8VmdL78x2HOU5HD/gsVGjW6Yzltnhn4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N5+BhLXmyvr4f5r7w20zd4+GD+qjxF/z5BoA/8XBK/oLKApjsKS0WC5txHtzkjYWCG3dOZSjmvJ6FS369mTqYvfK5JuRonBxlXMmpXZ4PKw4z5DI7PKD951JQIo7r4cKQe9ke4DsmmdLiDG8BMiTKU3bo2YekS6K8TlkeZltMt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M70PMnAa; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734185351; x=1765721351;
  h=date:from:to:cc:subject:message-id;
  bh=TD2MLr62OtWH8VmdL78x2HOU5HD/gsVGjW6Yzltnhn4=;
  b=M70PMnAa+jjYnSF1cyAXm7AoOawLxvlDs7KH36l/KNbn3yO1Zbxe2lE1
   bPi+GxTeqPir/CiXuG4u1P4kXaZQ2pQPWMBqgQo1Oxa9lA2dE7BOt2ffN
   yEri9NljMoCfXxr/1k4DXLmG55YiDfc+tJkf+Dqp5JI7JTY8E43/iJA+G
   /Yd2hyiq2aM/J+wIR3XkIKL06gRA95MoPvw3wB+GNQT3kUFQemb3SgRnp
   XeW2rlftNXyr+pb4dYGsAgVBvYFimP05m5Wi6u6nTm5pMPwkuQitkvKjB
   lS25L59/Kof1hSDk8AKjVd2BHWrp2pLopjZKiyIoaCn2Tdbh/an2bM89T
   g==;
X-CSE-ConnectionGUID: 3fgJlr8XTj684+FQzpJDOQ==
X-CSE-MsgGUID: Xkk+kQR4S6eHBdBlENCg8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34773620"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="34773620"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 06:09:11 -0800
X-CSE-ConnectionGUID: 9y6oDWr3SMiIV524M0TZaw==
X-CSE-MsgGUID: 2F5znfUbTPKHvRYv1psNEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97219789"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Dec 2024 06:09:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMSpP-000CyB-0o;
	Sat, 14 Dec 2024 14:09:07 +0000
Date: Sat, 14 Dec 2024 22:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 934bacb6441afdb77093a46b3138f81cbcde7d81
Message-ID: <202412142235.OYlY1nku-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 934bacb6441afdb77093a46b3138f81cbcde7d81  gpio: omap: allow building the module with COMPILE_TEST=y

elapsed time: 1458m

configs tested: 55
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20241214    gcc-13.2.0
arc                  randconfig-002-20241214    gcc-13.2.0
arm                  randconfig-001-20241214    gcc-14.2.0
arm                  randconfig-002-20241214    clang-15
arm                  randconfig-003-20241214    gcc-14.2.0
arm                  randconfig-004-20241214    gcc-14.2.0
arm64                randconfig-001-20241214    clang-15
arm64                randconfig-002-20241214    clang-20
arm64                randconfig-003-20241214    clang-15
arm64                randconfig-004-20241214    gcc-14.2.0
csky                 randconfig-001-20241214    gcc-14.2.0
csky                 randconfig-002-20241214    gcc-14.2.0
hexagon              randconfig-001-20241214    clang-20
hexagon              randconfig-002-20241214    clang-14
i386       buildonly-randconfig-001-20241213    clang-19
i386       buildonly-randconfig-002-20241213    gcc-12
i386       buildonly-randconfig-003-20241213    gcc-12
i386       buildonly-randconfig-004-20241213    clang-19
i386       buildonly-randconfig-005-20241213    gcc-12
i386       buildonly-randconfig-006-20241213    gcc-12
loongarch            randconfig-001-20241214    gcc-14.2.0
loongarch            randconfig-002-20241214    gcc-14.2.0
nios2                randconfig-001-20241214    gcc-14.2.0
nios2                randconfig-002-20241214    gcc-14.2.0
parisc               randconfig-001-20241214    gcc-14.2.0
parisc               randconfig-002-20241214    gcc-14.2.0
powerpc              randconfig-001-20241214    clang-20
powerpc              randconfig-002-20241214    clang-15
powerpc              randconfig-003-20241214    clang-20
powerpc64            randconfig-001-20241214    gcc-14.2.0
powerpc64            randconfig-003-20241214    clang-20
riscv                randconfig-001-20241213    gcc-14.2.0
riscv                randconfig-002-20241213    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20241213    gcc-14.2.0
s390                 randconfig-002-20241213    clang-19
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20241213    gcc-14.2.0
sh                   randconfig-002-20241213    gcc-14.2.0
sparc                randconfig-001-20241213    gcc-14.2.0
sparc                randconfig-002-20241213    gcc-14.2.0
sparc64              randconfig-001-20241213    gcc-14.2.0
sparc64              randconfig-002-20241213    gcc-14.2.0
um                   randconfig-001-20241213    gcc-12
um                   randconfig-002-20241213    clang-16
x86_64     buildonly-randconfig-001-20241214    gcc-11
x86_64     buildonly-randconfig-002-20241214    clang-19
x86_64     buildonly-randconfig-003-20241214    gcc-12
x86_64     buildonly-randconfig-004-20241214    gcc-12
x86_64     buildonly-randconfig-005-20241214    gcc-12
x86_64     buildonly-randconfig-006-20241214    clang-19
xtensa               randconfig-001-20241213    gcc-14.2.0
xtensa               randconfig-002-20241213    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

