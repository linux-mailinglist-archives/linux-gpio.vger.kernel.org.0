Return-Path: <linux-gpio+bounces-8589-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4167D948410
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 23:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9FC41F21D46
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 21:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C668616BE31;
	Mon,  5 Aug 2024 21:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="No+odbmJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EEB13CF86
	for <linux-gpio@vger.kernel.org>; Mon,  5 Aug 2024 21:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722892751; cv=none; b=Gz7DofSOYZMMCcxKq/6anKHuHviyD97cmcq0Acsnr0SgkHcsN9w+BXh2LEbrnM05rWbeoEjdU+wx8e5N93AaMIAqbLnXy16C2GpS3ZoAxuvG5lqI3+OCFuUXRDUeoLnwCbdZ1sKdADOU1Ab69ahZKvMdzIp2BBGd3Va1nfGQ9KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722892751; c=relaxed/simple;
	bh=dn++FEyCvYcyKKWSSn713T7Z1PO4c12aanbvuMv8k3g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EOAGY4D/oyP847/MS87VIKbIU0CXFuF7ryH/UqCbAUL3e/ok4KdShkRviNksandxkdudgg4Eb2esMZSks3s+xRXC0qtL7gM+zxDnU78BFfq78NIkPoavNlAyl/YHWm8EGGPgDNikrBlaKLtDP7pFLlFWo58gFgdk4OSf76h7Q/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=No+odbmJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722892749; x=1754428749;
  h=date:from:to:cc:subject:message-id;
  bh=dn++FEyCvYcyKKWSSn713T7Z1PO4c12aanbvuMv8k3g=;
  b=No+odbmJwPvu5bIOAQRC4RkT9IZ/r3Gsou4+q4R2vp/3n0lFSRGvU+Pv
   Qy9x474g3iBeQLMCMKz2i22xnfXTprUnF6/ew2S70XTbYqVoTkPhsHx5n
   0/lCNPIT8gZ2sTlTzYI04L6qCGiYw6T6HuieEghRhZ2gAO09z1iepKHPH
   DLC5fhyFVOtPY/YZzhEwq0RMrIq+398iEE17zZLMuxnDAgnhQ7vFCYDpm
   Owk3Kv3buEJOu9tIbt9PCWrZVXixAMj7SA6R7fC6FHfMJSufzI0pwhNQ4
   WuCDA7rNScXFjsHyiL879ebDn3er7rUrn3kFC598suyBQ4tuALU/U66RW
   Q==;
X-CSE-ConnectionGUID: 4eDCaaCYROuz+06hAdPqEQ==
X-CSE-MsgGUID: WEzhfp+fS5GMhwzNVMFMrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24671469"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="24671469"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 14:19:09 -0700
X-CSE-ConnectionGUID: T3l4+W9LTfKrXiBieXuJ0Q==
X-CSE-MsgGUID: rFGhYcx/Sj2faIfdx5AnPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="61141345"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 05 Aug 2024 14:19:07 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb56f-0003k4-1N;
	Mon, 05 Aug 2024 21:19:05 +0000
Date: Tue, 06 Aug 2024 05:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/asoc-tas-gpios] BUILD REGRESSION
 fdef6b7abff7f4cfe98c3bc496210885c9b26292
Message-ID: <202408060518.HNAN9ffE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/asoc-tas-gpios
branch HEAD: fdef6b7abff7f4cfe98c3bc496210885c9b26292  ASoC: tas*: Drop unused GPIO includes

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202408052045.Xpi6dIIm-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202408052250.05n5ih5t-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

sound/soc/codecs/tas2781-i2c.c:786:13: error: no member named 'irq_info' in 'struct tasdevice_priv'
sound/soc/codecs/tas2781-i2c.c:786:25: error: 'struct tasdevice_priv' has no member named 'irq_info'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-001-20240805
|   `-- sound-soc-codecs-tas2781-i2c.c:error:struct-tasdevice_priv-has-no-member-named-irq_info
|-- arm-randconfig-003-20240805
|   `-- sound-soc-codecs-tas2781-i2c.c:error:no-member-named-irq_info-in-struct-tasdevice_priv
|-- arm64-randconfig-002-20240805
|   `-- sound-soc-codecs-tas2781-i2c.c:error:no-member-named-irq_info-in-struct-tasdevice_priv
|-- arm64-randconfig-003-20240805
|   `-- sound-soc-codecs-tas2781-i2c.c:error:no-member-named-irq_info-in-struct-tasdevice_priv
|-- arm64-randconfig-004-20240805
|   `-- sound-soc-codecs-tas2781-i2c.c:error:struct-tasdevice_priv-has-no-member-named-irq_info
|-- hexagon-allmodconfig
|   `-- sound-soc-codecs-tas2781-i2c.c:error:no-member-named-irq_info-in-struct-tasdevice_priv
|-- hexagon-allyesconfig
|   `-- sound-soc-codecs-tas2781-i2c.c:error:no-member-named-irq_info-in-struct-tasdevice_priv
|-- i386-allmodconfig
|   `-- sound-soc-codecs-tas2781-i2c.c:error:struct-tasdevice_priv-has-no-member-named-irq_info
|-- loongarch-allmodconfig
|   `-- sound-soc-codecs-tas2781-i2c.c:error:struct-tasdevice_priv-has-no-member-named-irq_info
|-- m68k-allmodconfig
|   `-- sound-soc-codecs-tas2781-i2c.c:error:struct-tasdevice_priv-has-no-member-named-irq_info
|-- m68k-allyesconfig
|   `-- sound-soc-codecs-tas2781-i2c.c:error:struct-tasdevice_priv-has-no-member-named-irq_info
|-- microblaze-allmodconfig
|   `-- sound-soc-codecs-tas2781-i2c.c:error:struct-tasdevice_priv-has-no-member-named-irq_info
|-- microblaze-allyesconfig
|   `-- sound-soc-codecs-tas2781-i2c.c:error:struct-tasdevice_priv-has-no-member-named-irq_info
|-- parisc-randconfig-001-20240805
|   `-- sound-soc-codecs-tas2781-i2c.c:error:struct-tasdevice_priv-has-no-member-named-irq_info
|-- riscv-randconfig-002-20240805
|   `-- sound-soc-codecs-tas2781-i2c.c:error:no-member-named-irq_info-in-struct-tasdevice_priv
|-- s390-allyesconfig
|   `-- sound-soc-codecs-tas2781-i2c.c:error:struct-tasdevice_priv-has-no-member-named-irq_info
|-- sh-allmodconfig
|   `-- sound-soc-codecs-tas2781-i2c.c:error:struct-tasdevice_priv-has-no-member-named-irq_info
|-- sh-allyesconfig
|   `-- sound-soc-codecs-tas2781-i2c.c:error:struct-tasdevice_priv-has-no-member-named-irq_info
|-- sparc-allmodconfig
|   `-- sound-soc-codecs-tas2781-i2c.c:error:struct-tasdevice_priv-has-no-member-named-irq_info
|-- sparc-randconfig-001-20240805
|   `-- sound-soc-codecs-tas2781-i2c.c:error:struct-tasdevice_priv-has-no-member-named-irq_info
|-- um-allmodconfig
|   `-- sound-soc-codecs-tas2781-i2c.c:error:no-member-named-irq_info-in-struct-tasdevice_priv
|-- um-allyesconfig
|   `-- sound-soc-codecs-tas2781-i2c.c:error:struct-tasdevice_priv-has-no-member-named-irq_info
|-- x86_64-randconfig-001-20240805
|   `-- sound-soc-codecs-tas2781-i2c.c:error:struct-tasdevice_priv-has-no-member-named-irq_info
|-- x86_64-randconfig-004-20240805
|   `-- sound-soc-codecs-tas2781-i2c.c:error:struct-tasdevice_priv-has-no-member-named-irq_info
|-- x86_64-randconfig-006-20240805
|   `-- sound-soc-codecs-tas2781-i2c.c:error:struct-tasdevice_priv-has-no-member-named-irq_info
|-- x86_64-randconfig-011-20240805
|   `-- sound-soc-codecs-tas2781-i2c.c:error:no-member-named-irq_info-in-struct-tasdevice_priv
|-- x86_64-randconfig-012-20240805
|   `-- sound-soc-codecs-tas2781-i2c.c:error:no-member-named-irq_info-in-struct-tasdevice_priv
`-- x86_64-randconfig-015-20240805
    `-- sound-soc-codecs-tas2781-i2c.c:error:no-member-named-irq_info-in-struct-tasdevice_priv

elapsed time: 823m

configs tested: 149
configs skipped: 4

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                           tb10x_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         axm55xx_defconfig   gcc-13.2.0
arm                         bcm2835_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                      jornada720_defconfig   gcc-13.2.0
arm                        keystone_defconfig   gcc-13.2.0
arm                         nhk8815_defconfig   gcc-13.2.0
arm                           omap1_defconfig   gcc-13.2.0
arm                           sama5_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240805   clang-18
i386         buildonly-randconfig-002-20240805   clang-18
i386         buildonly-randconfig-003-20240805   clang-18
i386         buildonly-randconfig-004-20240805   clang-18
i386         buildonly-randconfig-005-20240805   clang-18
i386         buildonly-randconfig-006-20240805   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240805   clang-18
i386                  randconfig-002-20240805   clang-18
i386                  randconfig-003-20240805   clang-18
i386                  randconfig-004-20240805   clang-18
i386                  randconfig-005-20240805   clang-18
i386                  randconfig-006-20240805   clang-18
i386                  randconfig-011-20240805   clang-18
i386                  randconfig-012-20240805   clang-18
i386                  randconfig-013-20240805   clang-18
i386                  randconfig-014-20240805   clang-18
i386                  randconfig-015-20240805   clang-18
i386                  randconfig-016-20240805   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.2.0
m68k                           virt_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                     cu1000-neo_defconfig   gcc-13.2.0
mips                          malta_defconfig   gcc-13.2.0
mips                      maltasmvp_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      chrp32_defconfig   gcc-13.2.0
powerpc                      cm5200_defconfig   gcc-13.2.0
powerpc                   currituck_defconfig   gcc-13.2.0
powerpc                        fsp2_defconfig   gcc-13.2.0
powerpc                 mpc8315_rdb_defconfig   gcc-13.2.0
powerpc                      pmac32_defconfig   gcc-13.2.0
powerpc                      ppc64e_defconfig   gcc-13.2.0
powerpc                    socrates_defconfig   gcc-13.2.0
powerpc                     stx_gp3_defconfig   gcc-13.2.0
riscv                            alldefconfig   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        edosk7705_defconfig   gcc-13.2.0
sh                           se7705_defconfig   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sh                     sh7710voipgw_defconfig   gcc-13.2.0
sh                            shmin_defconfig   gcc-13.2.0
sh                            titan_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
um                               alldefconfig   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240805   gcc-12
x86_64       buildonly-randconfig-002-20240805   gcc-12
x86_64       buildonly-randconfig-003-20240805   gcc-12
x86_64       buildonly-randconfig-004-20240805   gcc-12
x86_64       buildonly-randconfig-005-20240805   gcc-12
x86_64       buildonly-randconfig-006-20240805   gcc-12
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240805   gcc-12
x86_64                randconfig-002-20240805   gcc-12
x86_64                randconfig-003-20240805   gcc-12
x86_64                randconfig-004-20240805   gcc-12
x86_64                randconfig-005-20240805   gcc-12
x86_64                randconfig-006-20240805   gcc-12
x86_64                randconfig-011-20240805   gcc-12
x86_64                randconfig-012-20240805   gcc-12
x86_64                randconfig-013-20240805   gcc-12
x86_64                randconfig-014-20240805   gcc-12
x86_64                randconfig-015-20240805   gcc-12
x86_64                randconfig-016-20240805   gcc-12
x86_64                randconfig-071-20240805   gcc-12
x86_64                randconfig-072-20240805   gcc-12
x86_64                randconfig-073-20240805   gcc-12
x86_64                randconfig-074-20240805   gcc-12
x86_64                randconfig-075-20240805   gcc-12
x86_64                randconfig-076-20240805   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

