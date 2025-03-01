Return-Path: <linux-gpio+bounces-16868-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D510A4ACBF
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Mar 2025 17:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 570653B576A
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Mar 2025 16:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F048E1DF992;
	Sat,  1 Mar 2025 16:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUA8kqgC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B16165F13
	for <linux-gpio@vger.kernel.org>; Sat,  1 Mar 2025 16:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740845155; cv=none; b=LBLZQbvSCVEgc5Y70vywmDj1F1Isxa/Any5wJd9WQAkb1AyMVZdLk9eZeipuCcMzhd07omueACGF/3wtzqRvlbzxhFfWuTC9REC9Ga9/nTvbM02pdREhwv2Jrk//au0JJMihphpds2AHDyGS0tLFH2XqD0kHapSvG0ETsJF0GRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740845155; c=relaxed/simple;
	bh=29BPBsEtvj/8AOsDhXv8liyGZEYBo9tuIQFxASvmHzY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y4E3KG8VhrN00tkhqz7zEct8dSnFQgTEcXOuS8GMQNHkF1LzzfvA/hGptcalcZIluro70I71yqfy/6tKCIL1FOwC7g7Kld/FH8hRn+bqhqdOSDbox70Th65PfXc1E/WHDdFX0uLnSlAn2qUwxcrijoZ7Y0IL36cdyBx1qefhA6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZUA8kqgC; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740845153; x=1772381153;
  h=date:from:to:cc:subject:message-id;
  bh=29BPBsEtvj/8AOsDhXv8liyGZEYBo9tuIQFxASvmHzY=;
  b=ZUA8kqgC9/EDTrw7iuyAf/ey15FO6jXQqc0QpBk4JY+jgV/kOB58slIs
   Pqd2rtEfRRQuSkwe32t0ioCN8sLgRYC254wSc7tW5NiCbC8+iXAQD3AgG
   eefAw10qmWzt1UKB0p/25lpeL6xVX0biRvQPxEkhWL0Gu2i8JGbWMYUtx
   n450ZbsiJPaD2podvOJZrqBalFfZlzJ+nYfz9WlhzyaGuTg2RWH+K56Oa
   G06rcI7w9WNIYqxJtitx0K0kLIM+CZtt1OaVr+TT5sO+uenO97bDWloU4
   d6aYpIpJnS6Z7yJqDQvJPC2ly45Wxsp7DelAILz47ep+1nB8oVALxk9Rw
   A==;
X-CSE-ConnectionGUID: 1/87sS1wQx2e4e+6zc5Ecg==
X-CSE-MsgGUID: 2OKS2n6NSNeApzryh52oXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52394806"
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="52394806"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 08:05:53 -0800
X-CSE-ConnectionGUID: IfDv766cTD6fbTxaKoe0ZQ==
X-CSE-MsgGUID: RLdwVO5rRkOfaV4zUWq+gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118502615"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Mar 2025 08:05:52 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toPLZ-000GQE-1L;
	Sat, 01 Mar 2025 16:05:49 +0000
Date: Sun, 02 Mar 2025 00:04:52 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 64407f4b5807dc9dec8135e1bfd45d2cb11b4ea0
Message-ID: <202503020046.xpwOkfVP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 64407f4b5807dc9dec8135e1bfd45d2cb11b4ea0  gpiolib: Fix Oops in gpiod_direction_input_nonotify()

elapsed time: 1454m

configs tested: 68
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                           allyesconfig    gcc-14.2.0
arc                  randconfig-001-20250301    gcc-13.2.0
arc                  randconfig-002-20250301    gcc-13.2.0
arm                  randconfig-001-20250301    gcc-14.2.0
arm                  randconfig-002-20250301    gcc-14.2.0
arm                  randconfig-003-20250301    clang-21
arm                  randconfig-004-20250301    clang-21
arm64                randconfig-001-20250301    gcc-14.2.0
arm64                randconfig-002-20250301    clang-21
arm64                randconfig-003-20250301    clang-15
arm64                randconfig-004-20250301    clang-17
csky                 randconfig-001-20250301    gcc-14.2.0
csky                 randconfig-002-20250301    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250301    clang-21
hexagon              randconfig-002-20250301    clang-21
i386       buildonly-randconfig-001-20250301    clang-19
i386       buildonly-randconfig-002-20250301    clang-19
i386       buildonly-randconfig-003-20250301    clang-19
i386       buildonly-randconfig-004-20250301    clang-19
i386       buildonly-randconfig-005-20250301    gcc-12
i386       buildonly-randconfig-006-20250301    clang-19
loongarch            randconfig-001-20250301    gcc-14.2.0
loongarch            randconfig-002-20250301    gcc-14.2.0
nios2                randconfig-001-20250301    gcc-14.2.0
nios2                randconfig-002-20250301    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20250301    gcc-14.2.0
parisc               randconfig-002-20250301    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20250301    clang-17
powerpc              randconfig-002-20250301    clang-19
powerpc              randconfig-003-20250301    clang-21
powerpc64            randconfig-001-20250301    gcc-14.2.0
powerpc64            randconfig-002-20250301    clang-21
powerpc64            randconfig-003-20250301    gcc-14.2.0
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20250301    gcc-14.2.0
riscv                randconfig-002-20250301    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-15
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250301    clang-15
s390                 randconfig-002-20250301    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250301    gcc-14.2.0
sh                   randconfig-002-20250301    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250301    gcc-14.2.0
sparc                randconfig-002-20250301    gcc-14.2.0
sparc64              randconfig-001-20250301    gcc-14.2.0
sparc64              randconfig-002-20250301    gcc-14.2.0
um                              allmodconfig    clang-21
um                               allnoconfig    clang-18
um                              allyesconfig    gcc-12
um                   randconfig-001-20250301    gcc-12
um                   randconfig-002-20250301    gcc-12
x86_64     buildonly-randconfig-001-20250301    clang-19
x86_64     buildonly-randconfig-002-20250301    clang-19
x86_64     buildonly-randconfig-003-20250301    gcc-11
x86_64     buildonly-randconfig-004-20250301    gcc-12
x86_64     buildonly-randconfig-005-20250301    gcc-12
x86_64     buildonly-randconfig-006-20250301    clang-19
xtensa               randconfig-001-20250301    gcc-14.2.0
xtensa               randconfig-002-20250301    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

