Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D54D76837A
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jul 2023 04:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjG3CkV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jul 2023 22:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjG3CkU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jul 2023 22:40:20 -0400
Received: from mgamail.intel.com (unknown [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 526A62D47
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jul 2023 19:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690684819; x=1722220819;
  h=date:from:to:cc:subject:message-id;
  bh=rNUwurhVt6yBOaiqgygTKAMIgKx8qciIKYgI6VXrsWg=;
  b=UspPNXxULDjUhjgHruFftTzRFHZjaGjLK70aCZJCzxCpDWn3uZ92vAci
   3Y4Nz8O6LfFnJuY4Cu41jEPytfV2KBV+1dCcWcrw7X5jFzSqP2D8sZN+6
   zPvA2ID0TWbIGiItore1uLvJMG3RF+Zx+Q8QILVKNMNIc535cRCZ6xIle
   YCQSanmK1KxjzkvRF9x52EeMloamZYmcyD2+gL5TZtcX0+GgObGLk+9Rq
   BlzAMNEvFWySu/b5D9ABKAVgbFuymyUqw+EXg5BOUHVwmUj+WgqKAXJK6
   8ePrtHCZUhbhiiBnhpe6xigr0l3FDU01PjprxHcyMXS3InncR57P8ZIEL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="353713874"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="353713874"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 19:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="1058544009"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="1058544009"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jul 2023 19:40:17 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPwLx-0004OR-0F;
        Sun, 30 Jul 2023 02:40:17 +0000
Date:   Sun, 30 Jul 2023 10:40:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 c456c4d9707a0bd484a1af30188f5c416fc394f0
Message-ID: <202307301002.n4qSfR6C-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: c456c4d9707a0bd484a1af30188f5c416fc394f0  gpio: eic-sprd: remove unneeded platform_set_drvdata() call

elapsed time: 720m

configs tested: 115
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r022-20230729   gcc  
alpha                randconfig-r025-20230729   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230729   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r005-20230729   gcc  
arm                  randconfig-r046-20230729   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r032-20230729   clang
csky                                defconfig   gcc  
csky                 randconfig-r006-20230729   gcc  
hexagon                             defconfig   clang
hexagon              randconfig-r002-20230729   clang
hexagon              randconfig-r033-20230729   clang
hexagon              randconfig-r041-20230729   clang
hexagon              randconfig-r045-20230729   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230728   gcc  
i386         buildonly-randconfig-r005-20230728   gcc  
i386         buildonly-randconfig-r006-20230728   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230729   clang
i386                 randconfig-i002-20230729   clang
i386                 randconfig-i003-20230729   clang
i386                 randconfig-i004-20230729   clang
i386                 randconfig-i005-20230729   clang
i386                 randconfig-i006-20230729   clang
i386                 randconfig-i011-20230729   gcc  
i386                 randconfig-i012-20230729   gcc  
i386                 randconfig-i013-20230729   gcc  
i386                 randconfig-i014-20230729   gcc  
i386                 randconfig-i015-20230729   gcc  
i386                 randconfig-i016-20230729   gcc  
i386                 randconfig-r021-20230729   gcc  
i386                 randconfig-r023-20230729   gcc  
i386                 randconfig-r036-20230729   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r034-20230729   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                 randconfig-r026-20230729   clang
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230729   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc             randconfig-r013-20230729   gcc  
openrisc             randconfig-r024-20230729   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230729   gcc  
parisc               randconfig-r035-20230729   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc              randconfig-r001-20230729   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230729   gcc  
riscv                          rv32_defconfig   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r015-20230729   gcc  
s390                 randconfig-r044-20230729   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r031-20230729   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r016-20230729   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230728   gcc  
x86_64       buildonly-randconfig-r002-20230728   gcc  
x86_64       buildonly-randconfig-r003-20230728   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230728   clang
x86_64               randconfig-x002-20230728   clang
x86_64               randconfig-x003-20230728   clang
x86_64               randconfig-x004-20230728   clang
x86_64               randconfig-x005-20230728   clang
x86_64               randconfig-x006-20230728   clang
x86_64               randconfig-x011-20230728   gcc  
x86_64               randconfig-x012-20230728   gcc  
x86_64               randconfig-x013-20230728   gcc  
x86_64               randconfig-x014-20230728   gcc  
x86_64               randconfig-x015-20230728   gcc  
x86_64               randconfig-x016-20230728   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                       common_defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa               randconfig-r012-20230729   gcc  
xtensa               randconfig-r014-20230729   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
