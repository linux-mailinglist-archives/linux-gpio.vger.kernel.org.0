Return-Path: <linux-gpio+bounces-9896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8754396F70B
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 16:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D141BB221FA
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 14:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDFD1CF7AD;
	Fri,  6 Sep 2024 14:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZzMFNB6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48EF1DFEF
	for <linux-gpio@vger.kernel.org>; Fri,  6 Sep 2024 14:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725633451; cv=none; b=GqcQ1WQl7OtK5Gv3FUgvM+7YAlZL9PHSuP+3ol/El4FpS0T+lvoRgjG+sGpouQP7RBt7CyI12D8VKazTADRsHGgtpZNYnMGO7BeqMDLtiIAYiyBWiauqcepSip/qyfNzCDFc6Ss5Ne2fIs1QKKoYlt9+IxD9+j8fRPQI8Cf5d88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725633451; c=relaxed/simple;
	bh=bHA0OJkR+tJSjXhjfRa1HbQ8+JCxgzHYNRhn+v7yu2Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qubiJlBliqDWXyvYHbIpwby5QWrloz7o1lq7ZQTCfnszh0kVJgyk3zIpuVEyO+AIS+eo6H2g1XGcEWNTTC5PWMWJZs73cQknCbD1VkZ+uiIw/xJXVU+qop9cxzidOYorngDZkQhs4GxvUJPRu7VG0t4D540HGOmTFurZzH0UJV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZzMFNB6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725633449; x=1757169449;
  h=date:from:to:cc:subject:message-id;
  bh=bHA0OJkR+tJSjXhjfRa1HbQ8+JCxgzHYNRhn+v7yu2Q=;
  b=KZzMFNB6Hexoa7TVSDnWH1GFJbeddzp2iWCF2d6LWkTG/25ZP/4lobW+
   5Cm10lFa9Zig2dKdnICqthyQZXN3t6qyjuUMRUV15CVzMBzmKPqDYK6aH
   PLjlcVYKOd8OXCu+5RqV8s+vi2ILAqOjPXk/Um0ilxYJhtmquZWBgJy9M
   MLOIb7NmlksVmg+gX+uZhR4HP3YWuU1xVxhLJMSwq4rW8NQqftH547gWF
   x2IQzlZFRpInf/0fydlJf0ROBPV30lhZTlVtoHngGVfozpVWLPxa0AVdw
   n/SyP2sBMoS+ujzJyarA3tbjmeBGLZBLumy+mSdeU0MdoTKyWHOhanbc5
   Q==;
X-CSE-ConnectionGUID: m04Sxy2lTl2FlkW4rQanZA==
X-CSE-MsgGUID: QklqVfjaSTevSPJTN+z/sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24343218"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="24343218"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 07:37:27 -0700
X-CSE-ConnectionGUID: 2KLIuj+EROWI/yYt/EWzCw==
X-CSE-MsgGUID: uRSXynXeTruyh7MJs2ILig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="70548894"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Sep 2024 07:37:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sma5U-000BMT-0c;
	Fri, 06 Sep 2024 14:37:24 +0000
Date: Fri, 06 Sep 2024 22:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 b1ad05164ecab735d905571d70723368a9c39989
Message-ID: <202409062206.32OmcIZ0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: b1ad05164ecab735d905571d70723368a9c39989  Merge branch 'devel' into for-next

elapsed time: 1481m

configs tested: 112
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                         bcm2835_defconfig   clang-20
arm                      footbridge_defconfig   clang-20
arm                         nhk8815_defconfig   clang-20
arm                         s5pv210_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240906   gcc-12
i386         buildonly-randconfig-002-20240906   gcc-12
i386         buildonly-randconfig-003-20240906   gcc-12
i386         buildonly-randconfig-004-20240906   gcc-12
i386         buildonly-randconfig-005-20240906   gcc-12
i386         buildonly-randconfig-006-20240906   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240906   gcc-12
i386                  randconfig-002-20240906   gcc-12
i386                  randconfig-003-20240906   gcc-12
i386                  randconfig-004-20240906   gcc-12
i386                  randconfig-005-20240906   gcc-12
i386                  randconfig-006-20240906   gcc-12
i386                  randconfig-011-20240906   gcc-12
i386                  randconfig-012-20240906   gcc-12
i386                  randconfig-013-20240906   gcc-12
i386                  randconfig-014-20240906   gcc-12
i386                  randconfig-015-20240906   gcc-12
i386                  randconfig-016-20240906   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                     loongson1c_defconfig   clang-20
mips                      malta_kvm_defconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                            defconfig   gcc-12
parisc                            allnoconfig   clang-20
parisc                              defconfig   gcc-12
powerpc                           allnoconfig   clang-20
powerpc                      arches_defconfig   clang-20
powerpc                   bluestone_defconfig   clang-20
powerpc                 linkstation_defconfig   clang-20
powerpc                 mpc8315_rdb_defconfig   clang-20
powerpc                      ppc44x_defconfig   clang-20
powerpc                      tqm8xx_defconfig   clang-20
riscv                             allnoconfig   clang-20
riscv                               defconfig   gcc-12
s390                              allnoconfig   clang-20
s390                                defconfig   gcc-12
sh                                allnoconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                          landisk_defconfig   clang-20
sh                          sdk7780_defconfig   clang-20
sh                             sh03_defconfig   clang-20
sh                     sh7710voipgw_defconfig   clang-20
sh                            titan_defconfig   clang-20
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240906   clang-18
x86_64       buildonly-randconfig-002-20240906   clang-18
x86_64       buildonly-randconfig-003-20240906   clang-18
x86_64       buildonly-randconfig-004-20240906   clang-18
x86_64       buildonly-randconfig-005-20240906   clang-18
x86_64       buildonly-randconfig-006-20240906   clang-18
x86_64                              defconfig   clang-18
x86_64                                  kexec   gcc-12
x86_64                randconfig-001-20240906   clang-18
x86_64                randconfig-002-20240906   clang-18
x86_64                randconfig-003-20240906   clang-18
x86_64                randconfig-004-20240906   clang-18
x86_64                randconfig-005-20240906   clang-18
x86_64                randconfig-006-20240906   clang-18
x86_64                randconfig-011-20240906   clang-18
x86_64                randconfig-012-20240906   clang-18
x86_64                randconfig-013-20240906   clang-18
x86_64                randconfig-014-20240906   clang-18
x86_64                randconfig-015-20240906   clang-18
x86_64                randconfig-016-20240906   clang-18
x86_64                randconfig-071-20240906   clang-18
x86_64                randconfig-072-20240906   clang-18
x86_64                randconfig-073-20240906   clang-18
x86_64                randconfig-074-20240906   clang-18
x86_64                randconfig-075-20240906   clang-18
x86_64                randconfig-076-20240906   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

