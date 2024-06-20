Return-Path: <linux-gpio+bounces-7575-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D38890FC14
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 06:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEB3A285ACA
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 04:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D400423774;
	Thu, 20 Jun 2024 04:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ykiv8ihc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB6A11CA1
	for <linux-gpio@vger.kernel.org>; Thu, 20 Jun 2024 04:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718859513; cv=none; b=BXI5yfXMSWge57lW8fjFwo5WKWnK7+jVLpe3Q8w/wCCko8S089dLdOcyB8+tpBx0+ApoFAwBuno1aHhGHHXa8uvodN1vLsjsfhUDi0BAv1iRykaQhL14TePulzlJ0vX05IRU/pFLkskn8Nk+vovn3XjBfMzP0APgEjrdg1PUT10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718859513; c=relaxed/simple;
	bh=pKnRmo9Nxj14NXzJXtxQV96M/2yCmSLbLtsc54uiZuo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d7tP9lnuGT6dyTSV5VYGZf22eQrzq5GHxYztNdlomyzV6hpfxbPZfsrQd4ILWtnDIwpSIAuhPBY8fVieogkh6zkzFJRgztJHPCNE7Icao4FCa545hl2Fr2MvgDCO+uvFX7hSdAqhq9LSoZn/YPY1C2G6eYDaCuvd+h53aUvLasY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ykiv8ihc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718859511; x=1750395511;
  h=date:from:to:cc:subject:message-id;
  bh=pKnRmo9Nxj14NXzJXtxQV96M/2yCmSLbLtsc54uiZuo=;
  b=Ykiv8ihcTJwQK/auivqG8hqdN82LR/raMg1Wh/RGTJ6sFhEdyAQLfpMZ
   QicGiYpmSl2YvolkNpaXOx+I7G+BvS6d2kaRq0zUPAIhi8Ym/IsTo9j9R
   4LCKW2eoFvNhWgdlhklCzHVIP1aYGulDpK0V5MOINXYwWCzhcmfg/9NKF
   eFBmnHVsjX9r0Pk85PY6OKKAxPCnPH4C+sMfDeYW8J6mC8piV8AVTmsOn
   dJfYasz2rYpeS33prj4mXQxSTMBK/F3zez6at1ZXl3T39PJZ9zbd4pk3O
   aB0QfITfyg+AzwkmkOV0wNwsF9JR2m+jiz4eb02ueWgxvwQKMy+TLK4jE
   Q==;
X-CSE-ConnectionGUID: 0Je5YF6lSceOUlM1TPpwsQ==
X-CSE-MsgGUID: lny/T2dDSYSXRZw45u3PoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26503300"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="26503300"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 21:58:30 -0700
X-CSE-ConnectionGUID: wIdaOdKMQJim/2Qqq8fQLw==
X-CSE-MsgGUID: zy9iEiZDTUOk59BjqcXnuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42807855"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jun 2024 21:58:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK9sP-0007Jd-23;
	Thu, 20 Jun 2024 04:58:25 +0000
Date: Thu, 20 Jun 2024 12:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 4ea4d4808e342ddf89ba24b93ffa2057005aaced
Message-ID: <202406201207.7qE4AlJS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 4ea4d4808e342ddf89ba24b93ffa2057005aaced  pinctrl: rockchip: fix pinmux reset in rockchip_pmx_set

elapsed time: 3383m

configs tested: 116
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                   randconfig-001-20240618   gcc-13.2.0
arc                   randconfig-002-20240618   gcc-13.2.0
arm                         axm55xx_defconfig   clang-19
arm                        keystone_defconfig   gcc-13.2.0
arm                         nhk8815_defconfig   clang-19
arm                   randconfig-001-20240618   gcc-13.2.0
arm                   randconfig-002-20240618   gcc-13.2.0
arm                   randconfig-003-20240618   clang-19
arm                   randconfig-004-20240618   gcc-13.2.0
arm                          sp7021_defconfig   gcc-13.2.0
arm                         vf610m4_defconfig   gcc-13.2.0
arm64                 randconfig-001-20240618   clang-17
arm64                 randconfig-002-20240618   clang-19
arm64                 randconfig-003-20240618   clang-16
arm64                 randconfig-004-20240618   clang-19
csky                  randconfig-001-20240618   gcc-13.2.0
csky                  randconfig-002-20240618   gcc-13.2.0
hexagon               randconfig-001-20240618   clang-19
hexagon               randconfig-002-20240618   clang-19
i386         buildonly-randconfig-001-20240618   gcc-13
i386         buildonly-randconfig-002-20240618   gcc-12
i386         buildonly-randconfig-003-20240618   gcc-8
i386         buildonly-randconfig-004-20240618   gcc-10
i386         buildonly-randconfig-005-20240618   gcc-10
i386         buildonly-randconfig-006-20240618   gcc-10
i386                  randconfig-001-20240618   clang-18
i386                  randconfig-002-20240618   gcc-13
i386                  randconfig-003-20240618   gcc-13
i386                  randconfig-004-20240618   clang-18
i386                  randconfig-005-20240618   clang-18
i386                  randconfig-006-20240618   clang-18
i386                  randconfig-011-20240618   gcc-13
i386                  randconfig-012-20240618   gcc-11
i386                  randconfig-013-20240618   gcc-7
i386                  randconfig-014-20240618   gcc-11
i386                  randconfig-015-20240618   clang-18
i386                  randconfig-016-20240618   clang-18
loongarch             randconfig-001-20240618   gcc-13.2.0
loongarch             randconfig-002-20240618   gcc-13.2.0
m68k                       m5475evb_defconfig   gcc-13.2.0
nios2                 randconfig-001-20240618   gcc-13.2.0
nios2                 randconfig-002-20240618   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240618   gcc-13.2.0
parisc                randconfig-002-20240618   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                    gamecube_defconfig   clang-19
powerpc                    klondike_defconfig   gcc-13.2.0
powerpc               mpc834x_itxgp_defconfig   clang-14
powerpc               randconfig-001-20240618   gcc-13.2.0
powerpc               randconfig-002-20240618   clang-19
powerpc               randconfig-003-20240618   clang-19
powerpc                    sam440ep_defconfig   gcc-13.2.0
powerpc                    socrates_defconfig   gcc-13.2.0
powerpc                     tqm5200_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240618   clang-19
powerpc64             randconfig-002-20240618   clang-17
powerpc64             randconfig-003-20240618   clang-19
riscv                            alldefconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240618   gcc-13.2.0
riscv                 randconfig-002-20240618   clang-14
s390                              allnoconfig   clang-19
s390                          debug_defconfig   gcc-13.2.0
s390                                defconfig   clang-19
s390                  randconfig-001-20240618   clang-15
s390                  randconfig-002-20240618   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240618   gcc-13.2.0
sh                    randconfig-002-20240618   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240618   gcc-13.2.0
sparc64               randconfig-002-20240618   gcc-13.2.0
um                                allnoconfig   clang-17
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240618   clang-19
um                    randconfig-002-20240618   clang-19
um                           x86_64_defconfig   clang-15
x86_64       buildonly-randconfig-001-20240618   clang-18
x86_64       buildonly-randconfig-002-20240618   gcc-8
x86_64       buildonly-randconfig-003-20240618   clang-18
x86_64       buildonly-randconfig-004-20240618   gcc-13
x86_64       buildonly-randconfig-005-20240618   gcc-13
x86_64       buildonly-randconfig-006-20240618   gcc-12
x86_64                randconfig-001-20240618   clang-18
x86_64                randconfig-002-20240618   clang-18
x86_64                randconfig-003-20240618   gcc-11
x86_64                randconfig-004-20240618   clang-18
x86_64                randconfig-005-20240618   clang-18
x86_64                randconfig-006-20240618   clang-18
x86_64                randconfig-011-20240618   gcc-13
x86_64                randconfig-012-20240618   gcc-8
x86_64                randconfig-013-20240618   clang-18
x86_64                randconfig-014-20240618   clang-18
x86_64                randconfig-015-20240618   gcc-13
x86_64                randconfig-016-20240618   clang-18
x86_64                randconfig-071-20240618   gcc-13
x86_64                randconfig-072-20240618   clang-18
x86_64                randconfig-073-20240618   gcc-12
x86_64                randconfig-074-20240618   clang-18
x86_64                randconfig-075-20240618   gcc-8
x86_64                randconfig-076-20240618   gcc-13
xtensa                            allnoconfig   gcc-13.2.0
xtensa                  audio_kc705_defconfig   gcc-13.2.0
xtensa                generic_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240618   gcc-13.2.0
xtensa                randconfig-002-20240618   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

