Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D772777EE72
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Aug 2023 02:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347368AbjHQAuB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Aug 2023 20:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347380AbjHQAt0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Aug 2023 20:49:26 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7441726BC
        for <linux-gpio@vger.kernel.org>; Wed, 16 Aug 2023 17:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692233365; x=1723769365;
  h=date:from:to:cc:subject:message-id;
  bh=6VYl1hu/Oc8SRmTibrgtFbOfn1iZJ0W/9OzZ3EBGrxQ=;
  b=XoiXrtPaYvsj6u0WfvM94ogxxnHC0eRpCD8S4QUXfHYOW4/qpPaiXOsb
   Hj0hQSoWbeGDdLBySOxFCM5AYfRi9wI/56e3NbH1916ImjdBpyBLXL34S
   m7dhEp6OMzp1bxV7i2wRtTItGGCE7FicDNKrzHlToKbLmT2vVvLJ6Gfpz
   yQAi5X5vkT9db4zgjPH3H4SaG5h5VbTpBM1ceXLhXieH4ZRFboDkg1cRW
   sS0X7ve2y0eX9Iiu1GOD3EkMkYK6mzQ3NlziAm2rPq9+/8cMrE3Yv2IwR
   tnID588Q8CQrR7USdefn1h5siuztbVNa88aWCzTzsrAGfhYqn56w5ygkb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376415005"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="376415005"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 17:49:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763834348"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="763834348"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Aug 2023 17:49:23 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qWRCV-0000gH-05;
        Thu, 17 Aug 2023 00:49:23 +0000
Date:   Thu, 17 Aug 2023 08:49:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-current] BUILD SUCCESS
 3386fb86ecdef0d39ee3306aea8ec290e61b934f
Message-ID: <202308170813.zGivEQlO-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
branch HEAD: 3386fb86ecdef0d39ee3306aea8ec290e61b934f  gpiolib: fix reference leaks when removing GPIO chips still in use

elapsed time: 732m

configs tested: 173
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r012-20230816   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230816   gcc  
arc                  randconfig-r025-20230816   gcc  
arc                  randconfig-r035-20230817   gcc  
arc                  randconfig-r043-20230816   gcc  
arc                  randconfig-r043-20230817   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                       imx_v6_v7_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                  randconfig-r003-20230816   clang
arm                  randconfig-r012-20230817   clang
arm                  randconfig-r046-20230816   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r026-20230816   clang
arm64                randconfig-r034-20230816   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r022-20230816   gcc  
csky                 randconfig-r032-20230817   gcc  
csky                 randconfig-r036-20230817   gcc  
hexagon              randconfig-r001-20230817   clang
hexagon              randconfig-r032-20230816   clang
hexagon              randconfig-r041-20230816   clang
hexagon              randconfig-r045-20230816   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230816   gcc  
i386         buildonly-randconfig-r004-20230817   clang
i386         buildonly-randconfig-r005-20230816   gcc  
i386         buildonly-randconfig-r005-20230817   clang
i386         buildonly-randconfig-r006-20230816   gcc  
i386         buildonly-randconfig-r006-20230817   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230816   gcc  
i386                 randconfig-i001-20230817   clang
i386                 randconfig-i002-20230816   gcc  
i386                 randconfig-i002-20230817   clang
i386                 randconfig-i003-20230816   gcc  
i386                 randconfig-i003-20230817   clang
i386                 randconfig-i004-20230816   gcc  
i386                 randconfig-i004-20230817   clang
i386                 randconfig-i005-20230816   gcc  
i386                 randconfig-i005-20230817   clang
i386                 randconfig-i006-20230816   gcc  
i386                 randconfig-i006-20230817   clang
i386                 randconfig-i011-20230816   clang
i386                 randconfig-i011-20230817   gcc  
i386                 randconfig-i012-20230816   clang
i386                 randconfig-i012-20230817   gcc  
i386                 randconfig-i013-20230816   clang
i386                 randconfig-i013-20230817   gcc  
i386                 randconfig-i014-20230816   clang
i386                 randconfig-i014-20230817   gcc  
i386                 randconfig-i015-20230816   clang
i386                 randconfig-i015-20230817   gcc  
i386                 randconfig-i016-20230816   clang
i386                 randconfig-i016-20230817   gcc  
i386                 randconfig-r005-20230817   clang
i386                 randconfig-r021-20230817   gcc  
i386                 randconfig-r026-20230817   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r025-20230817   gcc  
m68k                 randconfig-r033-20230816   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze           randconfig-r022-20230817   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r014-20230817   clang
mips                 randconfig-r015-20230816   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230816   gcc  
nios2                randconfig-r024-20230817   gcc  
nios2                randconfig-r033-20230817   gcc  
openrisc             randconfig-r035-20230816   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r016-20230816   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc              randconfig-r005-20230816   gcc  
powerpc              randconfig-r006-20230817   clang
powerpc              randconfig-r013-20230816   clang
powerpc              randconfig-r024-20230816   clang
powerpc              randconfig-r026-20230817   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230817   clang
riscv                randconfig-r021-20230816   clang
riscv                randconfig-r021-20230817   gcc  
riscv                randconfig-r042-20230816   clang
riscv                randconfig-r042-20230817   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230817   clang
s390                 randconfig-r004-20230816   gcc  
s390                 randconfig-r014-20230816   clang
s390                 randconfig-r044-20230816   clang
s390                 randconfig-r044-20230817   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r023-20230817   gcc  
sparc                randconfig-r036-20230816   gcc  
sparc                       sparc64_defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230816   gcc  
x86_64       buildonly-randconfig-r001-20230817   clang
x86_64       buildonly-randconfig-r002-20230816   gcc  
x86_64       buildonly-randconfig-r002-20230817   clang
x86_64       buildonly-randconfig-r003-20230816   gcc  
x86_64       buildonly-randconfig-r003-20230817   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r006-20230817   clang
x86_64               randconfig-r023-20230816   clang
x86_64               randconfig-x001-20230816   clang
x86_64               randconfig-x001-20230817   gcc  
x86_64               randconfig-x002-20230816   clang
x86_64               randconfig-x002-20230817   gcc  
x86_64               randconfig-x003-20230816   clang
x86_64               randconfig-x003-20230817   gcc  
x86_64               randconfig-x004-20230816   clang
x86_64               randconfig-x004-20230817   gcc  
x86_64               randconfig-x005-20230816   clang
x86_64               randconfig-x005-20230817   gcc  
x86_64               randconfig-x006-20230816   clang
x86_64               randconfig-x006-20230817   gcc  
x86_64               randconfig-x011-20230816   gcc  
x86_64               randconfig-x011-20230817   clang
x86_64               randconfig-x012-20230816   gcc  
x86_64               randconfig-x012-20230817   clang
x86_64               randconfig-x013-20230816   gcc  
x86_64               randconfig-x013-20230817   clang
x86_64               randconfig-x014-20230816   gcc  
x86_64               randconfig-x014-20230817   clang
x86_64               randconfig-x015-20230816   gcc  
x86_64               randconfig-x015-20230817   clang
x86_64               randconfig-x016-20230816   gcc  
x86_64               randconfig-x016-20230817   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                          iss_defconfig   gcc  
xtensa               randconfig-r011-20230816   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
