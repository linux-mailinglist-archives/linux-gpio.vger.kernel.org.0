Return-Path: <linux-gpio+bounces-8011-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B8A9261A4
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 15:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CFE6282A61
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 13:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A4116F827;
	Wed,  3 Jul 2024 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJI9BEsO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B4F171095
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jul 2024 13:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720012721; cv=none; b=hiixbcIJJ0rPOw8KicmGRRTce9fMt+t81+Yb/hUd08+UX/xmEee7JmJWYHhFuvVJsFPVs8kVnSR86/MeiEwUfEXiRMoNIme1tDivHhmA7dF/olUIirHBc1fn4ESeDkvXyCfdnT4b3xIy/ujpsGtybuVNzvchlneP7Cf+rrpz/3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720012721; c=relaxed/simple;
	bh=dEgwjX/awsP8M0cKoVOJ9S1Fh+QNjWp1e9QPLdWaceY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lTAFPsTPZwT3i94lblrkz4y+4POihd07aDBbqT/tNvVGMKjBy6+4So792l/PP7yRBnldPEzQxrXHMPU3c3HXLFFua59p3xmn+mzWp/uFv1DszsF4iqJE13bkOWhbXDnFCM+wZLQ6txyZ9KwjjTsJK3MIAW2AyMEIsbFzo/dnn24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJI9BEsO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720012719; x=1751548719;
  h=date:from:to:cc:subject:message-id;
  bh=dEgwjX/awsP8M0cKoVOJ9S1Fh+QNjWp1e9QPLdWaceY=;
  b=ZJI9BEsO4s/2h1FhgfM5fjOFLQQfvK6RIWSDFjJWHqonnNS7qnR+RcOg
   knDBfNcaQo+FKZrG6pS2K+QyOFcB7pLroN8eVElr9Ai6ZNzH8NhRNDnmd
   z6dz98hhxFeAt1+BS6IAxJAzB35Pg/jHWckL9dtMZxZJ9qjVefl7HYuCH
   Ks9hfwjyrtc/8WyP4kQowxBpp9tp45oX2qus47PyCsW+vzLAIU1EwwgIZ
   aT0EDgvlDCFNr1i+cEVTl00r/u0OfZfFd7FxdzJfwzwr1RuQS9EE4gkfK
   tSdH1VfBm9FkS43mCRU/2QZNejx37mJMwOYE47g3rEt2DToxYtwZLoMQH
   w==;
X-CSE-ConnectionGUID: E/1BKNLLQfOQYTAT1SBnVA==
X-CSE-MsgGUID: VU+9L5wcTkqpY4TXFjc6cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17449832"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="17449832"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 06:18:39 -0700
X-CSE-ConnectionGUID: +VegVMwARlaHSMHqTzMMXQ==
X-CSE-MsgGUID: oi/8/rJHQVCl7rEpJWxs/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="50691958"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jul 2024 06:18:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOzsa-000Pks-0L;
	Wed, 03 Jul 2024 13:18:36 +0000
Date: Wed, 03 Jul 2024 21:17:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 3645ffaf2b334abaf5f53e5ca0f47465d91e69d2
Message-ID: <202407032155.EHlIKS7c-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 3645ffaf2b334abaf5f53e5ca0f47465d91e69d2  gpiolib: of: fix lookup quirk for MIPS Lantiq

elapsed time: 1802m

configs tested: 103
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                         haps_hs_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                          collie_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                          gemini_defconfig   gcc-13.2.0
arm                           imxrt_defconfig   gcc-13.2.0
arm                       netwinder_defconfig   gcc-13.2.0
arm                        spear3xx_defconfig   gcc-13.2.0
arm                         wpcm450_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240703   clang-18
i386         buildonly-randconfig-002-20240703   gcc-13
i386         buildonly-randconfig-003-20240703   gcc-13
i386         buildonly-randconfig-004-20240703   gcc-13
i386         buildonly-randconfig-005-20240703   clang-18
i386         buildonly-randconfig-006-20240703   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240703   gcc-13
i386                  randconfig-002-20240703   clang-18
i386                  randconfig-003-20240703   gcc-13
i386                  randconfig-004-20240703   gcc-11
i386                  randconfig-005-20240703   clang-18
i386                  randconfig-006-20240703   gcc-7
i386                  randconfig-011-20240703   gcc-13
i386                  randconfig-012-20240703   gcc-13
i386                  randconfig-013-20240703   gcc-13
i386                  randconfig-014-20240703   gcc-13
i386                  randconfig-015-20240703   gcc-13
i386                  randconfig-016-20240703   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   gcc-13.2.0
powerpc                   motionpro_defconfig   gcc-13.2.0
powerpc                 mpc8315_rdb_defconfig   gcc-13.2.0
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                                defconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                         ap325rxa_defconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                          polaris_defconfig   gcc-13.2.0
sh                   rts7751r2dplus_defconfig   gcc-13.2.0
sh                              ul2_defconfig   gcc-13.2.0
sparc                       sparc64_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
um                               allmodconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                               allyesconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                           alldefconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                       common_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

