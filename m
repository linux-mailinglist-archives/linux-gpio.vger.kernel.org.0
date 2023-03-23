Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 566786C627D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Mar 2023 09:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjCWI4t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Mar 2023 04:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjCWI41 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2023 04:56:27 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F78196B7
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 01:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679561783; x=1711097783;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Q8lzcNMsefQWc6rfUg+91q2XUYlVUeChbchxiZ673gQ=;
  b=NTS/SOwKBEp+FqdcibMtQWGuqnE3kRrcLkPMYUYTlABcDFp1SwdP/XJh
   thtc2OKacxuLKzaxx3dMUpt83kuEV2uFFKuXJ97otHvFVsI022ftvswsR
   kXiFWa4JBQleiRwYdg5F0p41IDZ7V2ThwSRNrGiTev/WAMKM+36iqNiiL
   DxDIa8xLI7QYG0xACGVnnhB6AyH0JgsRvPZknxPenCBc7taR+D7XS2QJJ
   27j16wRLWufjC+ZUit6duKhU+tr5jWhuZJZVLP7GQ9wrFkm1fhdXEyFtv
   hVolopgV//AR+4MaVrV0x4UB6rYQV46cPBGbqDAwWT+/hckBHeSBsbQhV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="323280322"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="323280322"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 01:56:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="682236661"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="682236661"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Mar 2023 01:56:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pfGk6-000EBv-2b;
        Thu, 23 Mar 2023 08:56:18 +0000
Date:   Thu, 23 Mar 2023 16:56:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD REGRESSION
 16d6fa5a94b3873968941b701b99903abc4e5059
Message-ID: <641c1425.k1Lq59Zzmefa1peo%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 16d6fa5a94b3873968941b701b99903abc4e5059  gpio: xlp: Convert to immutable irq_chip

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202303230922.hLLAnLQ6-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303230924.cF2c6S05-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpio/gpio-pci-idio-16.c:106:31: error: incomplete definition of type 'struct idio_16'
drivers/gpio/gpio-pci-idio-16.c:106:45: error: invalid use of undefined type 'struct idio_16'
drivers/gpio/gpio-pci-idio-16.c:248:2: error: call to undeclared function 'idio_16_state_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/gpio/gpio-pci-idio-16.c:248:2: error: implicit declaration of function 'idio_16_state_init' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
drivers/gpio/gpio-pci-idio-16.c:248:9: error: implicit declaration of function 'idio_16_state_init'; did you mean 'file_ra_state_init'? [-Werror=implicit-function-declaration]
drivers/gpio/gpio-pci-idio-16.c:32:23: error: field has incomplete type 'struct idio_16_state'
drivers/gpio/gpio-pci-idio-16.c:32:30: error: field 'state' has incomplete type
drivers/gpio/gpio-pci-idio-16.c:39:13: error: implicit declaration of function 'idio_16_get_direction'; did you mean 'idio_16_gpio_get_direction'? [-Werror=implicit-function-declaration]
drivers/gpio/gpio-pci-idio-16.c:39:6: error: call to undeclared function 'idio_16_get_direction'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/gpio/gpio-pci-idio-16.c:39:6: error: implicit declaration of function 'idio_16_get_direction' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
drivers/gpio/gpio-pci-idio-16.c:62:16: error: implicit declaration of function 'idio_16_get'; did you mean 'idio_16_gpio_get'? [-Werror=implicit-function-declaration]
drivers/gpio/gpio-pci-idio-16.c:62:9: error: call to undeclared function 'idio_16_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/gpio/gpio-pci-idio-16.c:62:9: error: implicit declaration of function 'idio_16_get' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
drivers/gpio/gpio-pci-idio-16.c:70:2: error: call to undeclared function 'idio_16_get_multiple'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/gpio/gpio-pci-idio-16.c:70:2: error: implicit declaration of function 'idio_16_get_multiple' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
drivers/gpio/gpio-pci-idio-16.c:70:9: error: implicit declaration of function 'idio_16_get_multiple'; did you mean 'idio_16_gpio_get_multiple'? [-Werror=implicit-function-declaration]
drivers/gpio/gpio-pci-idio-16.c:79:2: error: call to undeclared function 'idio_16_set'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/gpio/gpio-pci-idio-16.c:79:2: error: implicit declaration of function 'idio_16_set' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
drivers/gpio/gpio-pci-idio-16.c:79:9: error: implicit declaration of function 'idio_16_set'; did you mean 'idio_16_gpio_set'? [-Werror=implicit-function-declaration]
drivers/gpio/gpio-pci-idio-16.c:87:2: error: call to undeclared function 'idio_16_set_multiple'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/gpio/gpio-pci-idio-16.c:87:2: error: implicit declaration of function 'idio_16_set_multiple' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
drivers/gpio/gpio-pci-idio-16.c:87:9: error: implicit declaration of function 'idio_16_set_multiple'; did you mean 'idio_16_gpio_set_multiple'? [-Werror=implicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-randconfig-r026-20230322
|   |-- drivers-gpio-gpio-pci-idio-.c:error:field-state-has-incomplete-type
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_direction
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_multiple
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_set
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_set_multiple
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_state_init
|   `-- drivers-gpio-gpio-pci-idio-.c:error:invalid-use-of-undefined-type-struct-idio_16
|-- arc-randconfig-r035-20230322
|   |-- drivers-gpio-gpio-pci-idio-.c:error:field-state-has-incomplete-type
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_direction
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_multiple
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_set
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_set_multiple
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_state_init
|   `-- drivers-gpio-gpio-pci-idio-.c:error:invalid-use-of-undefined-type-struct-idio_16
|-- i386-randconfig-a001
|   |-- drivers-gpio-gpio-pci-idio-.c:error:field-state-has-incomplete-type
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_direction
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_multiple
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_set
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_set_multiple
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_state_init
|   `-- drivers-gpio-gpio-pci-idio-.c:error:invalid-use-of-undefined-type-struct-idio_16
|-- ia64-allmodconfig
|   |-- drivers-gpio-gpio-pci-idio-.c:error:field-state-has-incomplete-type
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_direction
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_multiple
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_set
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_set_multiple
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_state_init
|   `-- drivers-gpio-gpio-pci-idio-.c:error:invalid-use-of-undefined-type-struct-idio_16
|-- riscv-allmodconfig
|   |-- drivers-gpio-gpio-pci-idio-.c:error:field-state-has-incomplete-type
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_direction
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_multiple
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_set
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_set_multiple
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_state_init
|   `-- drivers-gpio-gpio-pci-idio-.c:error:invalid-use-of-undefined-type-struct-idio_16
|-- riscv-randconfig-r022-20230322
|   |-- drivers-gpio-gpio-pci-idio-.c:error:field-state-has-incomplete-type
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_direction
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_multiple
clang_recent_errors
|-- arm-randconfig-r023-20230322
|   |-- drivers-gpio-gpio-pci-idio-.c:error:call-to-undeclared-function-idio_16_get-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpio-gpio-pci-idio-.c:error:call-to-undeclared-function-idio_16_get_direction-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpio-gpio-pci-idio-.c:error:call-to-undeclared-function-idio_16_get_multiple-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpio-gpio-pci-idio-.c:error:call-to-undeclared-function-idio_16_set-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpio-gpio-pci-idio-.c:error:call-to-undeclared-function-idio_16_set_multiple-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpio-gpio-pci-idio-.c:error:call-to-undeclared-function-idio_16_state_init-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpio-gpio-pci-idio-.c:error:field-has-incomplete-type-struct-idio_16_state
|   `-- drivers-gpio-gpio-pci-idio-.c:error:incomplete-definition-of-type-struct-idio_16
|-- i386-randconfig-a004
|   |-- drivers-gpio-gpio-pci-idio-.c:error:field-has-incomplete-type-struct-idio_16_state
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_direction-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_multiple-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_set-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_set_multiple-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_state_init-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   `-- drivers-gpio-gpio-pci-idio-.c:error:incomplete-definition-of-type-struct-idio_16
|-- i386-randconfig-a013
|   |-- drivers-gpio-gpio-pci-idio-.c:error:field-has-incomplete-type-struct-idio_16_state
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_direction-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_multiple-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_set-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_set_multiple-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_state_init-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   `-- drivers-gpio-gpio-pci-idio-.c:error:incomplete-definition-of-type-struct-idio_16
|-- s390-randconfig-r001-20230322
|   |-- drivers-gpio-gpio-pci-idio-.c:error:call-to-undeclared-function-idio_16_get-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpio-gpio-pci-idio-.c:error:call-to-undeclared-function-idio_16_get_direction-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpio-gpio-pci-idio-.c:error:call-to-undeclared-function-idio_16_get_multiple-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpio-gpio-pci-idio-.c:error:call-to-undeclared-function-idio_16_set-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpio-gpio-pci-idio-.c:error:call-to-undeclared-function-idio_16_set_multiple-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpio-gpio-pci-idio-.c:error:call-to-undeclared-function-idio_16_state_init-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-gpio-gpio-pci-idio-.c:error:field-has-incomplete-type-struct-idio_16_state
|   `-- drivers-gpio-gpio-pci-idio-.c:error:incomplete-definition-of-type-struct-idio_16
|-- x86_64-randconfig-a012
|   |-- drivers-gpio-gpio-pci-idio-.c:error:field-has-incomplete-type-struct-idio_16_state
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_direction-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_multiple-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_set-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_set_multiple-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_state_init-is-invalid-in-C99-Werror-Wimplicit-function-declaration
|   `-- drivers-gpio-gpio-pci-idio-.c:error:incomplete-definition-of-type-struct-idio_16
`-- x86_64-randconfig-a014
    |-- drivers-gpio-gpio-pci-idio-.c:error:field-has-incomplete-type-struct-idio_16_state
    |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get-is-invalid-in-C99-Werror-Wimplicit-function-declaration
    |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_direction-is-invalid-in-C99-Werror-Wimplicit-function-declaration
    |-- drivers-gpio-gpio-pci-idio-.c:error:implicit-declaration-of-function-idio_16_get_multiple-is-invalid-in-C99-Werror-Wimplicit-function-declaration

elapsed time: 729m

configs tested: 99
configs skipped: 7

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r026-20230322   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r035-20230322   gcc  
arc                  randconfig-r043-20230322   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r011-20230322   clang
arm                  randconfig-r023-20230322   clang
arm                  randconfig-r046-20230322   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230322   clang
arm64                randconfig-r031-20230322   clang
csky         buildonly-randconfig-r001-20230322   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230322   clang
hexagon              randconfig-r045-20230322   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r004-20230322   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r004-20230322   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230322   gcc  
microblaze           randconfig-r036-20230322   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r021-20230322   clang
nios2                               defconfig   gcc  
nios2                randconfig-r034-20230322   gcc  
openrisc             randconfig-r014-20230322   gcc  
openrisc             randconfig-r024-20230322   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r013-20230322   gcc  
powerpc              randconfig-r015-20230322   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r022-20230322   gcc  
riscv                randconfig-r042-20230322   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r005-20230322   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230322   clang
s390                 randconfig-r044-20230322   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r006-20230322   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r016-20230322   gcc  
sparc64              randconfig-r033-20230322   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r012-20230322   gcc  
xtensa               randconfig-r025-20230322   gcc  
xtensa               randconfig-r032-20230322   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
