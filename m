Return-Path: <linux-gpio+bounces-3666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD42986044E
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 22:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93973287BAC
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 21:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61E77175E;
	Thu, 22 Feb 2024 21:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJIQd7gE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27D110A05
	for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 21:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708635906; cv=none; b=RGbZpuq4KvLEc9Rp1BDl/h1MhmHmP0Gprws+XLJ4/+v+/NH7yorZ8hm5D5t5Nm3AR/dlNPNIIwD8zV6ZuglX9VP2bCaEj8Lb7s6S/JI5IYcPW0C7R/3zfkVpjExv/+y9DCOq5lssbKhrcgtn8rbdFejkFE95A4vHXag5P/BkBRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708635906; c=relaxed/simple;
	bh=qWboPcsYBrUMQIjIcq2mgfAimqYzG211IQCByTAF4W4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XdaRgessrcpKLbV64527lJIiXW8DnqadAkdYTetHXn+RrGi9taOeVXn7InZn5/BP0NwNL8MyuhNfkvwv1mhAP1LxmErlR7X9SW1xzsVreA0b9UsY5un3sKWRe0ShZkkpKutxmhh/zyYRUQvHR7+RN97hcgrodiCiJTlm12T0LmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJIQd7gE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708635905; x=1740171905;
  h=date:from:to:cc:subject:message-id;
  bh=qWboPcsYBrUMQIjIcq2mgfAimqYzG211IQCByTAF4W4=;
  b=RJIQd7gE9lqvuwdkpCbPJvIQTVtJ7b++ouww++KgtHFxpUxJy20qb3Zm
   8ohHmzFlb769iGQpZoGmqCcct/i/GZFKwJn4oYAnzQ0pX3au2X8P9aB0D
   OgPI7a3DnZX0zxbxWDE7pTD1d+IAq71DGmdV1ctdObOIWVHoj7XqzY/1A
   i+FEmyahQd0rsfWCIiSqZMDlxgNn4rog0L1n5A4Z7pS0iR/dB2Xsp6iae
   oetXk5JLpSRsVw/p3lIuDTSprG1a+XK168xihrKd05j0Jd6JhrYl+BUWB
   fvUovOUkevE6onfhrkrl8m8ZKNdcT129fnk2YBE4MGDfi2SwUyLiRPIUD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="13455487"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="13455487"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 13:05:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="10346321"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Feb 2024 13:02:53 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdGDD-0006hu-2a;
	Thu, 22 Feb 2024 21:02:39 +0000
Date: Fri, 23 Feb 2024 05:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 47847b9bcdb13c2da1829323a66651ef63047b77
Message-ID: <202402230526.YrW3H5Rk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 47847b9bcdb13c2da1829323a66651ef63047b77  pinctrl: qcom: sm8650-lpass-lpi: correct Kconfig name

elapsed time: 1334m

configs tested: 143
configs skipped: 3

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
arc                   randconfig-001-20240222   gcc  
arc                   randconfig-002-20240222   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   gcc  
arm                                 defconfig   clang
arm                        multi_v7_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20240222   gcc  
arm                   randconfig-002-20240222   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-002-20240222   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240222   gcc  
csky                  randconfig-002-20240222   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-002-20240222   clang
i386         buildonly-randconfig-003-20240222   clang
i386         buildonly-randconfig-005-20240222   clang
i386                                defconfig   clang
i386                  randconfig-001-20240222   clang
i386                  randconfig-002-20240222   clang
i386                  randconfig-004-20240222   clang
i386                  randconfig-006-20240222   clang
i386                  randconfig-012-20240222   clang
i386                  randconfig-015-20240222   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240222   gcc  
loongarch             randconfig-002-20240222   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       alldefconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      pic32mzda_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240222   gcc  
nios2                 randconfig-002-20240222   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240222   gcc  
parisc                randconfig-002-20240222   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc64             randconfig-003-20240222   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240222   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240222   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240222   gcc  
sh                    randconfig-002-20240222   gcc  
sh                          rsk7264_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240222   gcc  
sparc64               randconfig-002-20240222   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-003-20240222   gcc  
x86_64       buildonly-randconfig-005-20240222   gcc  
x86_64       buildonly-randconfig-006-20240222   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-005-20240222   gcc  
x86_64                randconfig-006-20240222   gcc  
x86_64                randconfig-012-20240222   gcc  
x86_64                randconfig-014-20240222   gcc  
x86_64                randconfig-074-20240222   gcc  
x86_64                randconfig-075-20240222   gcc  
x86_64                randconfig-076-20240222   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240222   gcc  
xtensa                randconfig-002-20240222   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

