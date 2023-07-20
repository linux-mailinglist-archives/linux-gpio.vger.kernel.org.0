Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E24A75A3A4
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 02:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjGTAtM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 20:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjGTAtL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 20:49:11 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 519C91BF7
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 17:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689814150; x=1721350150;
  h=date:from:to:cc:subject:message-id;
  bh=pI4LNsSJ3HOY7F0/18BPfAeaQZuawZAtJiXF7i9zY4M=;
  b=EK4byqtgAt299zfb84si4+/qZRpF40CF4+Zk0PgN32jRTUb8xdS/lzto
   D//2XF0idYoRXdWZ6F7pn+EdT3n9CsjfolRh/PG05tPaPBXP5Y1E1bXlq
   6GTwsfAx58829rZKSObZk4nResY55tzSqguccaKlRWmXD1zvb0Obp8Vy/
   UhQjd3RGKIQVbRY1O+jiXCCk1aqIQ5A/tqGQRq/vQIXgRBGRbDzrVGqtr
   48suEa9sgroqbrMltOq1idffLeUPNlrjcxZGBgTomDZIVlixTel6N6YSX
   VC7N0kiJjK/VU5dP6vdPJ5g+f9gwJtcC8YejLMfcmFdkGCn+a6L4lyaq2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="370173224"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="370173224"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 17:49:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="867673450"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2023 17:49:08 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qMHqs-0005dH-1l;
        Thu, 20 Jul 2023 00:49:06 +0000
Date:   Thu, 20 Jul 2023 08:48:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 1945063eb59e64d2919cb14d54d081476d9e53bb
Message-ID: <202307200836.1aegFNud-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 1945063eb59e64d2919cb14d54d081476d9e53bb  gpio: mvebu: Make use of devm_pwmchip_add

elapsed time: 720m

configs tested: 120
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230718   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r031-20230718   gcc  
arc                  randconfig-r043-20230718   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r003-20230718   clang
arm                  randconfig-r014-20230718   gcc  
arm                  randconfig-r026-20230718   gcc  
arm                  randconfig-r046-20230718   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230718   clang
arm64                randconfig-r012-20230718   clang
arm64                randconfig-r021-20230718   clang
csky                                defconfig   gcc  
csky                 randconfig-r001-20230718   gcc  
csky                 randconfig-r034-20230718   gcc  
hexagon              randconfig-r041-20230718   clang
hexagon              randconfig-r045-20230718   clang
i386                             allyesconfig   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230718   gcc  
i386         buildonly-randconfig-r005-20230718   gcc  
i386         buildonly-randconfig-r006-20230718   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230718   gcc  
i386                 randconfig-i002-20230718   gcc  
i386                 randconfig-i003-20230718   gcc  
i386                 randconfig-i004-20230718   gcc  
i386                 randconfig-i005-20230718   gcc  
i386                 randconfig-i006-20230718   gcc  
i386                 randconfig-i011-20230718   clang
i386                 randconfig-i012-20230718   clang
i386                 randconfig-i013-20230718   clang
i386                 randconfig-i014-20230718   clang
i386                 randconfig-i015-20230718   clang
i386                 randconfig-i016-20230718   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230718   gcc  
loongarch            randconfig-r024-20230718   gcc  
loongarch            randconfig-r031-20230718   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r033-20230718   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r005-20230718   clang
mips                       rbtx49xx_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230718   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r022-20230718   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r014-20230718   clang
powerpc              randconfig-r015-20230718   clang
powerpc              randconfig-r036-20230718   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230718   gcc  
riscv                randconfig-r015-20230718   clang
riscv                randconfig-r025-20230718   clang
riscv                randconfig-r042-20230718   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230718   gcc  
s390                 randconfig-r012-20230718   clang
s390                 randconfig-r044-20230718   clang
sh                               allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r016-20230718   gcc  
sparc64              randconfig-r023-20230718   gcc  
sparc64              randconfig-r036-20230718   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r002-20230718   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230718   gcc  
x86_64       buildonly-randconfig-r002-20230718   gcc  
x86_64       buildonly-randconfig-r003-20230718   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r032-20230718   gcc  
x86_64               randconfig-x001-20230718   clang
x86_64               randconfig-x002-20230718   clang
x86_64               randconfig-x003-20230718   clang
x86_64               randconfig-x004-20230718   clang
x86_64               randconfig-x005-20230718   clang
x86_64               randconfig-x006-20230718   clang
x86_64               randconfig-x011-20230718   gcc  
x86_64               randconfig-x012-20230718   gcc  
x86_64               randconfig-x013-20230718   gcc  
x86_64               randconfig-x014-20230718   gcc  
x86_64               randconfig-x015-20230718   gcc  
x86_64               randconfig-x016-20230718   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r034-20230718   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
