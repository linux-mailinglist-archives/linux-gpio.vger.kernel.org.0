Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99330752BAD
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jul 2023 22:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbjGMUbU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jul 2023 16:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbjGMUbT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jul 2023 16:31:19 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D72A72127
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jul 2023 13:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689280274; x=1720816274;
  h=date:from:to:cc:subject:message-id;
  bh=IyNarda0uJ2Uik/h9GVJopPbZlWgcgPj2mANo8Z+Xzg=;
  b=MRw+npd9Nav5DT/RrkRenso4foAhjSYnMtMVGcmhKUtAU4GkNbR03zNA
   rWiFapaBx3oXoBac2q3U9rN3Tk0qKKL/f2PNS3DSun38Y4LjRXyO+d6Xn
   kYp0gw539H8ayJA2bn1eA/gd3MZydwJFZkfL6yTuvodBfzeyIqJs7nY3M
   NC27IPJt645/0EMhD8AJmxMEVEOM2KAwZtC1R0d3iZvS7qeD4gpx+uWmg
   Tw4d7uc/ulO921aV7pZUM/u+GblDAL/1/fDxop0g5Sq44YXy/b7eT+2JW
   7Wcc1dgmpdq+qfGmICyNTMyfVlHKH7ax8Wl1NRvhED8X4GjWHGjtgDADv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="365345441"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="365345441"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 13:31:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="792189488"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="792189488"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jul 2023 13:31:08 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qK2xw-0006t9-0X;
        Thu, 13 Jul 2023 20:31:08 +0000
Date:   Fri, 14 Jul 2023 04:30:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 0f93a345aa42c40e2145c3719d878e7daa4eb6ee
Message-ID: <202307140439.dcd1HQhu-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 0f93a345aa42c40e2145c3719d878e7daa4eb6ee  gpiolib: order includes alphabetically in gpiolib.h

elapsed time: 720m

configs tested: 130
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                  randconfig-r043-20230713   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                                 defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                       imx_v6_v7_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                  randconfig-r031-20230713   gcc  
arm                  randconfig-r046-20230713   clang
arm                          sp7021_defconfig   clang
arm                           tegra_defconfig   gcc  
arm                        vexpress_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230713   clang
arm64                randconfig-r034-20230713   clang
csky                                defconfig   gcc  
csky                 randconfig-r026-20230713   gcc  
hexagon              randconfig-r016-20230713   clang
hexagon              randconfig-r035-20230713   clang
hexagon              randconfig-r041-20230713   clang
hexagon              randconfig-r045-20230713   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230713   clang
i386         buildonly-randconfig-r005-20230713   clang
i386         buildonly-randconfig-r006-20230713   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230713   clang
i386                 randconfig-i002-20230713   clang
i386                 randconfig-i003-20230713   clang
i386                 randconfig-i004-20230713   clang
i386                 randconfig-i005-20230713   clang
i386                 randconfig-i006-20230713   clang
i386                 randconfig-i011-20230713   gcc  
i386                 randconfig-i012-20230713   gcc  
i386                 randconfig-i013-20230713   gcc  
i386                 randconfig-i014-20230713   gcc  
i386                 randconfig-i015-20230713   gcc  
i386                 randconfig-i016-20230713   gcc  
i386                 randconfig-r014-20230713   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r036-20230713   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                 randconfig-r033-20230713   gcc  
microblaze           randconfig-r011-20230713   gcc  
microblaze           randconfig-r013-20230713   gcc  
microblaze           randconfig-r015-20230713   gcc  
microblaze           randconfig-r023-20230713   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                            ar7_defconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                         bigsur_defconfig   gcc  
mips                      maltaaprp_defconfig   clang
nios2                               defconfig   gcc  
openrisc             randconfig-r022-20230713   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230713   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc                     tqm8541_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                randconfig-r042-20230713   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r006-20230713   clang
s390                 randconfig-r021-20230713   gcc  
s390                 randconfig-r044-20230713   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230713   gcc  
sh                   randconfig-r012-20230713   gcc  
sh                   randconfig-r025-20230713   gcc  
sh                          rsk7201_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc64_defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230713   clang
x86_64       buildonly-randconfig-r002-20230713   clang
x86_64       buildonly-randconfig-r003-20230713   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230713   gcc  
x86_64               randconfig-x002-20230713   gcc  
x86_64               randconfig-x003-20230713   gcc  
x86_64               randconfig-x004-20230713   gcc  
x86_64               randconfig-x005-20230713   gcc  
x86_64               randconfig-x006-20230713   gcc  
x86_64               randconfig-x011-20230713   clang
x86_64               randconfig-x012-20230713   clang
x86_64               randconfig-x013-20230713   clang
x86_64               randconfig-x014-20230713   clang
x86_64               randconfig-x015-20230713   clang
x86_64               randconfig-x016-20230713   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r032-20230713   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
