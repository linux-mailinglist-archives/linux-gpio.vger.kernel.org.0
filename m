Return-Path: <linux-gpio+bounces-8040-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA5C927439
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 12:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB24828392B
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 10:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8D31ABC49;
	Thu,  4 Jul 2024 10:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DWZGFloq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B1A15538C
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jul 2024 10:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720089727; cv=none; b=Dl3bIpZ88bhB47QuQLFlwiwtmvik1A4lnGGYSKndDGGwkAPpNWjnvE+tChEYxnshXNVKr7Rx2EoaCfjPdCdDhJlU70qReVpmbrDoRbNfqixAkzUihDMwZICLUP/moMaBRxWOPOTLhesG7yg5XmPOvCHdlN2qTXbyTHfz650unWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720089727; c=relaxed/simple;
	bh=E6sMlxvKFtSDZ8lXJ5h0CpDZ8ph1FvGB5t1CGrGR8Iw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TFYm5f5wksp/TkfLtRvhbDMQiwp35W+GyZBXdWlLsDoFQCkGj0BMZzFH7Y8rMTLHb+FgJqNZks01cLG/89ycXOkaId6BjmuFzzFPYt4+G8ffvmZveRHHVPpQLjAHt0IplUU8EadzfC9uIr9sxeFcp3Xy0JKF/ZLvTVAQgzGL8us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DWZGFloq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720089726; x=1751625726;
  h=date:from:to:cc:subject:message-id;
  bh=E6sMlxvKFtSDZ8lXJ5h0CpDZ8ph1FvGB5t1CGrGR8Iw=;
  b=DWZGFloqgXnjuN8ZOX74XYkiXbTwD6eQw8azhieVUSvJGFGVXVHhO/Hc
   rUDdNPpAMx7eDGqeoqWJBE58muuz0Hg232el6P9HK1XwBBZMwAUZLaDEW
   ntg+H3O7rVoh/nsNyx8HmyK4eP0E3qCMtyrpmI4QrMR82+uanlT3wdfMP
   War3Mk2/kTgYSyvbEa7aT/FsSPEiEHfY58uTFJRh+2JuVlbBlG3SYoTLe
   ZevPQOJlJvV6dqAEJHlWcAVo6W6tsSm+RDye+d3LepgtSDUKGcVuf1vdo
   0luEApJUGxdsPh1kAegrcFEQaPV8RbSSYWjR5Yi9xVOoyht8WknuLbtVi
   Q==;
X-CSE-ConnectionGUID: B/Ec25A5Tua9HZjeQy6nEg==
X-CSE-MsgGUID: xEloxHuoTiyLKHHpRyJwpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17491050"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17491050"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 03:42:06 -0700
X-CSE-ConnectionGUID: oGfjD2jwQfKgXPuLVGT0AQ==
X-CSE-MsgGUID: 1syD6yhwRSqhHxWZ6Ktbag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46498117"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Jul 2024 03:42:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPJuc-000Qsf-0c;
	Thu, 04 Jul 2024 10:42:02 +0000
Date: Thu, 04 Jul 2024 18:41:30 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:at24/for-next] BUILD SUCCESS
 3a9ba4e32230df6c48cda1fd5cbca6facacc74c2
Message-ID: <202407041828.rku5ykue-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git at24/for-next
branch HEAD: 3a9ba4e32230df6c48cda1fd5cbca6facacc74c2  dt-bindings: eeprom: at24: Add compatible for ONSemi N24S64B

elapsed time: 1451m

configs tested: 174
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240704   gcc-13.2.0
arc                   randconfig-002-20240704   gcc-13.2.0
arc                        vdk_hs38_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                           h3600_defconfig   gcc-13.2.0
arm                             mxs_defconfig   gcc-13.2.0
arm                         orion5x_defconfig   gcc-13.2.0
arm                          pxa168_defconfig   gcc-13.2.0
arm                   randconfig-001-20240704   gcc-13.2.0
arm                   randconfig-002-20240704   gcc-13.2.0
arm                   randconfig-003-20240704   gcc-13.2.0
arm                   randconfig-004-20240704   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240704   gcc-13.2.0
arm64                 randconfig-002-20240704   gcc-13.2.0
arm64                 randconfig-003-20240704   gcc-13.2.0
arm64                 randconfig-004-20240704   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240704   gcc-13.2.0
csky                  randconfig-002-20240704   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240704   clang-18
i386         buildonly-randconfig-002-20240704   clang-18
i386         buildonly-randconfig-003-20240704   clang-18
i386         buildonly-randconfig-004-20240704   clang-18
i386         buildonly-randconfig-005-20240704   clang-18
i386         buildonly-randconfig-006-20240704   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240704   clang-18
i386                  randconfig-002-20240704   clang-18
i386                  randconfig-003-20240704   clang-18
i386                  randconfig-004-20240704   clang-18
i386                  randconfig-005-20240704   clang-18
i386                  randconfig-006-20240704   clang-18
i386                  randconfig-011-20240704   clang-18
i386                  randconfig-012-20240704   clang-18
i386                  randconfig-013-20240704   clang-18
i386                  randconfig-014-20240704   clang-18
i386                  randconfig-015-20240704   clang-18
i386                  randconfig-016-20240704   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240704   gcc-13.2.0
loongarch             randconfig-002-20240704   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                          atari_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                        stmark2_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                         db1xxx_defconfig   gcc-13.2.0
mips                           ip28_defconfig   gcc-13.2.0
mips                           mtx1_defconfig   gcc-13.2.0
mips                          rm200_defconfig   gcc-13.2.0
nios2                         3c120_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240704   gcc-13.2.0
nios2                 randconfig-002-20240704   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
openrisc                       virt_defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240704   gcc-13.2.0
parisc                randconfig-002-20240704   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   gcc-13.2.0
powerpc                     asp8347_defconfig   gcc-13.2.0
powerpc                     ep8248e_defconfig   gcc-13.2.0
powerpc                     ksi8560_defconfig   gcc-13.2.0
powerpc               mpc834x_itxgp_defconfig   gcc-13.2.0
powerpc                      ppc40x_defconfig   gcc-13.2.0
powerpc                    sam440ep_defconfig   gcc-13.2.0
powerpc                     sequoia_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240704   gcc-13.2.0
powerpc64             randconfig-002-20240704   gcc-13.2.0
powerpc64             randconfig-003-20240704   gcc-13.2.0
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv                 randconfig-001-20240704   gcc-13.2.0
riscv                 randconfig-002-20240704   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240704   gcc-13.2.0
s390                  randconfig-002-20240704   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                        edosk7760_defconfig   gcc-13.2.0
sh                    randconfig-001-20240704   gcc-13.2.0
sh                    randconfig-002-20240704   gcc-13.2.0
sh                          rsk7264_defconfig   gcc-13.2.0
sh                          rsk7269_defconfig   gcc-13.2.0
sh                        sh7757lcr_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240704   gcc-13.2.0
sparc64               randconfig-002-20240704   gcc-13.2.0
um                               allmodconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                               allyesconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240704   gcc-13.2.0
um                    randconfig-002-20240704   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240704   clang-18
x86_64       buildonly-randconfig-002-20240704   clang-18
x86_64       buildonly-randconfig-003-20240704   clang-18
x86_64       buildonly-randconfig-004-20240704   clang-18
x86_64       buildonly-randconfig-005-20240704   clang-18
x86_64       buildonly-randconfig-006-20240704   clang-18
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240704   clang-18
x86_64                randconfig-002-20240704   clang-18
x86_64                randconfig-003-20240704   clang-18
x86_64                randconfig-004-20240704   clang-18
x86_64                randconfig-005-20240704   clang-18
x86_64                randconfig-006-20240704   clang-18
x86_64                randconfig-011-20240704   clang-18
x86_64                randconfig-012-20240704   clang-18
x86_64                randconfig-013-20240704   clang-18
x86_64                randconfig-014-20240704   clang-18
x86_64                randconfig-015-20240704   clang-18
x86_64                randconfig-016-20240704   clang-18
x86_64                randconfig-071-20240704   clang-18
x86_64                randconfig-072-20240704   clang-18
x86_64                randconfig-073-20240704   clang-18
x86_64                randconfig-074-20240704   clang-18
x86_64                randconfig-075-20240704   clang-18
x86_64                randconfig-076-20240704   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                  nommu_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240704   gcc-13.2.0
xtensa                randconfig-002-20240704   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

