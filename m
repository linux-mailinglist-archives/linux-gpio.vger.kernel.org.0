Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9549877A58B
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Aug 2023 10:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjHMIMe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Aug 2023 04:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjHMIMd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Aug 2023 04:12:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59E6E7
        for <linux-gpio@vger.kernel.org>; Sun, 13 Aug 2023 01:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691914355; x=1723450355;
  h=date:from:to:cc:subject:message-id;
  bh=b8LWNHQZn37UFLPOzjanyiSaJ0fJ9Cv54QEK+L8mG8M=;
  b=VXZpoWRWA1YZEtzJcMN+T4LuWfqTs/P/ZZcE2VY1jc7NyQ5vfv3I09CF
   ZWOUMOPKjzrKLJq+MlPZDkT58MJ3x3bPyt+Vc898eezGDtDiMABNOyung
   z/wrTd+pMatLJTlM0lfP+Movg7lNGRirDjGFBhzqq+G4y1gkkasKogMHa
   Jpxf6YEbKsen8HrU2AaFCINUA0v1LH8yw4fKoMAIRhdGSMMoYvLv2XvJr
   fTXLk9JWJi29CNC/6fNqTau9ih/YOeEySdIyyg8g6O40I1zDmtH0gD6+v
   MfFklUp9fzonwNIM2XysOhTUebuECTbLnPV2FkR6c9FGpFOMX0Y1Wb5KN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="351481843"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="351481843"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 01:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="856728051"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="856728051"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 13 Aug 2023 01:12:34 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qV6DB-00091Q-1o;
        Sun, 13 Aug 2023 08:12:33 +0000
Date:   Sun, 13 Aug 2023 16:12:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 a40fe1ffb69b709835a0623959f95d6c81ff38c1
Message-ID: <202308131600.DUnACRPa-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: a40fe1ffb69b709835a0623959f95d6c81ff38c1  gpio: sim: simplify gpio_sim_device_config_live_store()

elapsed time: 802m

configs tested: 93
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230813   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r012-20230813   gcc  
arc                  randconfig-r043-20230813   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230813   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r014-20230813   gcc  
hexagon              randconfig-r041-20230813   clang
hexagon              randconfig-r045-20230813   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230813   clang
i386                 randconfig-i002-20230813   clang
i386                 randconfig-i003-20230813   clang
i386                 randconfig-i004-20230813   clang
i386                 randconfig-i005-20230813   clang
i386                 randconfig-i006-20230813   clang
i386                 randconfig-i016-20230813   gcc  
i386                 randconfig-r011-20230813   gcc  
i386                 randconfig-r023-20230813   gcc  
i386                 randconfig-r035-20230813   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230813   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r013-20230813   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r016-20230813   clang
mips                 randconfig-r022-20230813   clang
mips                 randconfig-r025-20230813   clang
nios2                               defconfig   gcc  
openrisc             randconfig-r033-20230813   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230813   gcc  
parisc               randconfig-r031-20230813   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r015-20230813   gcc  
powerpc              randconfig-r024-20230813   gcc  
powerpc              randconfig-r036-20230813   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r006-20230813   clang
riscv                randconfig-r042-20230813   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230813   gcc  
sh                               allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r026-20230813   gcc  
x86_64               randconfig-x001-20230813   gcc  
x86_64               randconfig-x002-20230813   gcc  
x86_64               randconfig-x003-20230813   gcc  
x86_64               randconfig-x004-20230813   gcc  
x86_64               randconfig-x005-20230813   gcc  
x86_64               randconfig-x006-20230813   gcc  
x86_64               randconfig-x011-20230813   clang
x86_64               randconfig-x012-20230813   clang
x86_64               randconfig-x013-20230813   clang
x86_64               randconfig-x014-20230813   clang
x86_64               randconfig-x015-20230813   clang
x86_64               randconfig-x016-20230813   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
