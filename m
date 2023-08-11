Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9B06778534
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 04:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbjHKCB3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 22:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbjHKCB2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 22:01:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC202D55
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 19:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691719288; x=1723255288;
  h=date:from:to:cc:subject:message-id;
  bh=BSVpO9MYAP/se/MfEyJfMMvhkDN68PURR4Iac4e9Kc0=;
  b=basTqwYeguPIc1dftvZErKHYcyKk8SH2IhaMqXRyLrjTi46O1zOZViX2
   JXqu4rvMcJ7zPFikHy8tNMHMbS2teeQrgD43I/fI6CNLUREsqqFeW45KW
   GHO84JyTdgbvEb1TxlxbbL/WVVyV+rbmZif0lmwtg+LTES30f0yTe1sUK
   6o7YP6xCUq9YmNzQfawIS2gMxxj3TMEBeU1z1XPQWFFw+Ww/Zc62DZpPP
   pdW1yAABj7YyodsjoSQXALXlFoLeTtyP0Kfp0ZHuBnSC9SYGxtNSbxk20
   smYm4za5tC4HyRb8hVDRytChg1g9zrvjifzFGraPZx9CwNoAPcN5ROiQo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="371576269"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="371576269"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 19:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="797826160"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="797826160"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Aug 2023 19:01:26 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qUHSw-0007Q4-03;
        Fri, 11 Aug 2023 02:01:26 +0000
Date:   Fri, 11 Aug 2023 10:00:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 c9b2572f488c3ed3974a0ff6885bb059b1751c86
Message-ID: <202308111025.BAQFdwvO-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: c9b2572f488c3ed3974a0ff6885bb059b1751c86  pinctrl: nsp-gpio: Silence probe deferral messages

elapsed time: 723m

configs tested: 102
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230810   gcc  
arc                  randconfig-r043-20230810   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230810   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r035-20230810   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230810   clang
hexagon              randconfig-r045-20230810   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230810   gcc  
i386         buildonly-randconfig-r005-20230810   gcc  
i386         buildonly-randconfig-r006-20230810   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230810   gcc  
i386                 randconfig-i002-20230810   gcc  
i386                 randconfig-i003-20230810   gcc  
i386                 randconfig-i004-20230810   gcc  
i386                 randconfig-i005-20230810   gcc  
i386                 randconfig-i006-20230810   gcc  
i386                 randconfig-i011-20230810   clang
i386                 randconfig-i012-20230810   clang
i386                 randconfig-i013-20230810   clang
i386                 randconfig-i014-20230810   clang
i386                 randconfig-i015-20230810   clang
i386                 randconfig-i016-20230810   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r005-20230810   gcc  
loongarch            randconfig-r033-20230810   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r012-20230810   gcc  
microblaze           randconfig-r015-20230810   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230810   gcc  
nios2                randconfig-r024-20230810   gcc  
openrisc             randconfig-r021-20230810   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r016-20230810   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r006-20230810   gcc  
riscv                randconfig-r042-20230810   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r013-20230810   clang
s390                 randconfig-r044-20230810   clang
sh                               allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r022-20230810   gcc  
sparc64              randconfig-r031-20230810   gcc  
sparc64              randconfig-r032-20230810   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r023-20230810   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230810   gcc  
x86_64       buildonly-randconfig-r002-20230810   gcc  
x86_64       buildonly-randconfig-r003-20230810   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r011-20230810   clang
x86_64               randconfig-x001-20230810   clang
x86_64               randconfig-x002-20230810   clang
x86_64               randconfig-x003-20230810   clang
x86_64               randconfig-x004-20230810   clang
x86_64               randconfig-x005-20230810   clang
x86_64               randconfig-x006-20230810   clang
x86_64               randconfig-x011-20230810   gcc  
x86_64               randconfig-x012-20230810   gcc  
x86_64               randconfig-x013-20230810   gcc  
x86_64               randconfig-x014-20230810   gcc  
x86_64               randconfig-x015-20230810   gcc  
x86_64               randconfig-x016-20230810   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
