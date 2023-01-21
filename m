Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6156762B6
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Jan 2023 02:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjAUBgo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 20:36:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjAUBgn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 20:36:43 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B8047DF9A
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 17:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674265002; x=1705801002;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OXroPvBjYwqLxBV7wQ+phgQ0jA1pJCwaqeiZnYDWMxU=;
  b=OmMMP4cVULsRpPTlPmg++NwtsxYN8YQ0dZtruvXAwMiIyyTGIRtqeh2h
   OLSDHPKfdsOQ78BfLPYxgM++EAEX17Wf2kTz7yAPLuhcfH1wkzpNhfsHT
   3dNLxvYs9a79wjnSieMrWHF3ekfhqsXu/n5qod7JUa7m6v2KChKFI8dOU
   qBiEBCKnnzg9RjVmTGxKHVuuy7scyHDaWGA0vwJOKc3UrjAPxXprTgx7o
   6UzSKg5mluMbNZyHE8Y1jaBju3Fos/yVEF5WEKdqxbYqlbchkX85roA0y
   lyC5rzjMFxlaLZGGdEOK1id9qyF7vOZzNLR0MrCh+2g8ZiEJuszfvDkHV
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="388104667"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="388104667"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 17:36:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="691264400"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="691264400"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Jan 2023 17:36:39 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pJ2oA-0003Dz-0f;
        Sat, 21 Jan 2023 01:36:38 +0000
Date:   Sat, 21 Jan 2023 09:35:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD REGRESSION
 e464c96eae336dd2f81a1926c30523f061469f64
Message-ID: <63cb417a.5FoFU8+tk9fRk6G8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: e464c96eae336dd2f81a1926c30523f061469f64  gpio: Get rid of gpio_to_chip()

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202301210447.JPSHmqrO-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpio/gpio-zevio.c:174:33: error: incomplete definition of type 'struct platform_device'
drivers/gpio/gpio-zevio.c:178:2: error: call to undeclared function 'platform_set_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/gpio/gpio-zevio.c:184:19: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
drivers/gpio/gpio-zevio.c:184:21: error: call to undeclared function 'devm_platform_ioremap_resource'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/gpio/gpio-zevio.c:211:31: error: variable has incomplete type 'struct platform_driver'
drivers/gpio/gpio-zevio.c:219:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
drivers/gpio/gpio-zevio.c:219:25: error: a parameter list without types is only allowed in a function definition

Error/Warning ids grouped by kconfigs:

clang_recent_errors
|-- arm-randconfig-c002-20230120
|   |-- drivers-gpio-gpio-zevio.c:error:a-parameter-list-without-types-is-only-allowed-in-a-function-definition
|   |-- drivers-gpio-gpio-zevio.c:error:call-to-undeclared-function-devm_platform_ioremap_resource-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpio-gpio-zevio.c:error:call-to-undeclared-function-platform_set_drvdata-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpio-gpio-zevio.c:error:incompatible-integer-to-pointer-conversion-assigning-to-void-from-int
|   |-- drivers-gpio-gpio-zevio.c:error:incomplete-definition-of-type-struct-platform_device
|   |-- drivers-gpio-gpio-zevio.c:error:type-specifier-missing-defaults-to-int-ISO-C99-and-later-do-not-support-implicit-int
|   `-- drivers-gpio-gpio-zevio.c:error:variable-has-incomplete-type-struct-platform_driver
`-- arm-randconfig-r034-20230119
    |-- drivers-gpio-gpio-zevio.c:error:a-parameter-list-without-types-is-only-allowed-in-a-function-definition
    |-- drivers-gpio-gpio-zevio.c:error:call-to-undeclared-function-devm_platform_ioremap_resource-ISO-C99-and-later-do-not-support-implicit-function-declarations
    |-- drivers-gpio-gpio-zevio.c:error:call-to-undeclared-function-platform_set_drvdata-ISO-C99-and-later-do-not-support-implicit-function-declarations
    |-- drivers-gpio-gpio-zevio.c:error:incompatible-integer-to-pointer-conversion-assigning-to-void-from-int
    |-- drivers-gpio-gpio-zevio.c:error:incomplete-definition-of-type-struct-platform_device
    |-- drivers-gpio-gpio-zevio.c:error:type-specifier-missing-defaults-to-int-ISO-C99-and-later-do-not-support-implicit-int
    `-- drivers-gpio-gpio-zevio.c:error:variable-has-incomplete-type-struct-platform_driver

elapsed time: 728m

configs tested: 100
configs skipped: 2

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
arm                  randconfig-r046-20230119
arc                  randconfig-r043-20230119
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
sh                               allmodconfig
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                        randconfig-a002
mips                             allyesconfig
x86_64                        randconfig-a013
powerpc                          allmodconfig
m68k                             allyesconfig
x86_64                        randconfig-a011
m68k                             allmodconfig
x86_64                        randconfig-a006
arc                              allyesconfig
x86_64                           rhel-8.3-syz
alpha                            allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a015
x86_64                           rhel-8.3-kvm
ia64                             allmodconfig
x86_64                           rhel-8.3-bpf
i386                                defconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                             allyesconfig
sh                           se7724_defconfig
powerpc                      ppc6xx_defconfig
loongarch                        alldefconfig
sh                   sh7770_generic_defconfig
nios2                               defconfig
powerpc                   currituck_defconfig
i386                          randconfig-a016
sparc                       sparc32_defconfig
arm                           stm32_defconfig
arm64                            alldefconfig
arm                          exynos_defconfig
sh                        sh7757lcr_defconfig
m68k                        m5407c3_defconfig
arc                              alldefconfig
powerpc                       eiger_defconfig
sh                             espt_defconfig
i386                          randconfig-c001
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                            hisi_defconfig
arm                      footbridge_defconfig
mips                           ci20_defconfig
nios2                            allyesconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig

clang tested configs:
hexagon              randconfig-r045-20230119
hexagon              randconfig-r041-20230119
x86_64                          rhel-8.3-rust
s390                 randconfig-r044-20230119
riscv                randconfig-r042-20230119
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a005
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
mips                       lemote2f_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                     ksi8560_defconfig
i386                          randconfig-a015
powerpc                     tqm8540_defconfig
powerpc                    ge_imp3a_defconfig
arm                       spear13xx_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
