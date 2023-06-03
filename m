Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 895AC720DF8
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Jun 2023 07:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjFCFnY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Jun 2023 01:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjFCFnX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Jun 2023 01:43:23 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F51DE55
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jun 2023 22:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685771002; x=1717307002;
  h=date:from:to:cc:subject:message-id;
  bh=UkQZ6k54Be+EROqgUx0T9AznDkMt9DtwVaZi0JdRVU0=;
  b=TPQNYJe0eEv132CToLyAFLneSZcAqFJQkinhnm94nMdq/DLU+sqRulJZ
   VGyXb3yOSDmAe/XsAZRcxnuoeSv4oDdw8HACzIwIm/i2oST6BSFJizlVF
   ZNK3D5ovpAAgpGPH6iNtuFJveur/3UhBfGAQ3Ye7ztVxBU+sxH39dCutP
   Iwp1bdkHCGfYGn5QWovRufjqdb8y7g+y1LgfXO70kWm/sXqaCuO1bwuPE
   Up4GEZHtNpYBHxxl6U9BAYKNcvstzZSh8PaEY9/DOiVDUJ9GGTH+2scn5
   5O/xuXuSA3oXccyQY30PFZEyxoXYbQsG+89oj2eR5MC6zCzxSuFge2iln
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="335656750"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="335656750"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 22:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="852389828"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="852389828"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2023 22:43:20 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q5K2q-0001L3-03;
        Sat, 03 Jun 2023 05:43:20 +0000
Date:   Sat, 03 Jun 2023 13:43:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD REGRESSION
 cf5dec80c4e23ac1677b8ef9aafe5a7b87bb18c3
Message-ID: <20230603054301.bv2EZ%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: cf5dec80c4e23ac1677b8ef9aafe5a7b87bb18c3  gpio: Add gpio delay driver

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202306030340.PkL0Qly6-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpio/gpio-delay.c:133:17: error: 'struct gpio_chip' has no member named 'of_xlate'
drivers/gpio/gpio-delay.c:79:39: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- s390-allmodconfig
    |-- drivers-gpio-gpio-delay.c:error:struct-gpio_chip-has-no-member-named-of_gpio_n_cells
    `-- drivers-gpio-gpio-delay.c:error:struct-gpio_chip-has-no-member-named-of_xlate

elapsed time: 723m

configs tested: 169
configs skipped: 12

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230531   gcc  
alpha        buildonly-randconfig-r005-20230531   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230531   gcc  
alpha                randconfig-r002-20230531   gcc  
alpha                randconfig-r015-20230601   gcc  
alpha                randconfig-r031-20230531   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r005-20230531   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230531   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         bcm2835_defconfig   clang
arm                                 defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                  randconfig-r005-20230531   clang
arm                  randconfig-r021-20230531   gcc  
arm                  randconfig-r022-20230531   gcc  
arm                  randconfig-r034-20230602   clang
arm                  randconfig-r046-20230531   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky         buildonly-randconfig-r002-20230531   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r025-20230531   gcc  
csky                 randconfig-r035-20230531   gcc  
hexagon      buildonly-randconfig-r003-20230531   clang
hexagon              randconfig-r014-20230601   clang
hexagon              randconfig-r022-20230531   clang
hexagon              randconfig-r041-20230531   clang
hexagon              randconfig-r045-20230531   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r001-20230531   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230531   gcc  
i386                 randconfig-i002-20230531   gcc  
i386                 randconfig-i003-20230531   gcc  
i386                 randconfig-i004-20230531   gcc  
i386                 randconfig-i005-20230531   gcc  
i386                 randconfig-i006-20230531   gcc  
i386                 randconfig-i051-20230531   gcc  
i386                 randconfig-i051-20230602   gcc  
i386                 randconfig-i052-20230531   gcc  
i386                 randconfig-i052-20230602   gcc  
i386                 randconfig-i053-20230531   gcc  
i386                 randconfig-i053-20230602   gcc  
i386                 randconfig-i054-20230531   gcc  
i386                 randconfig-i054-20230602   gcc  
i386                 randconfig-i055-20230531   gcc  
i386                 randconfig-i055-20230602   gcc  
i386                 randconfig-i056-20230531   gcc  
i386                 randconfig-i056-20230602   gcc  
i386                 randconfig-i061-20230531   gcc  
i386                 randconfig-i061-20230602   gcc  
i386                 randconfig-i062-20230531   gcc  
i386                 randconfig-i062-20230602   gcc  
i386                 randconfig-i063-20230531   gcc  
i386                 randconfig-i063-20230602   gcc  
i386                 randconfig-i064-20230531   gcc  
i386                 randconfig-i064-20230602   gcc  
i386                 randconfig-i065-20230531   gcc  
i386                 randconfig-i065-20230602   gcc  
i386                 randconfig-i066-20230531   gcc  
i386                 randconfig-i066-20230602   gcc  
i386                 randconfig-r004-20230531   gcc  
i386                 randconfig-r032-20230602   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r001-20230531   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r011-20230601   gcc  
loongarch            randconfig-r016-20230601   gcc  
loongarch            randconfig-r023-20230531   gcc  
m68k                             allmodconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k         buildonly-randconfig-r004-20230531   gcc  
m68k         buildonly-randconfig-r006-20230531   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r016-20230601   gcc  
m68k                 randconfig-r021-20230531   gcc  
m68k                 randconfig-r034-20230531   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
microblaze           randconfig-r025-20230531   gcc  
microblaze           randconfig-r032-20230531   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ci20_defconfig   gcc  
mips                          malta_defconfig   clang
nios2                            alldefconfig   gcc  
nios2        buildonly-randconfig-r002-20230531   gcc  
nios2        buildonly-randconfig-r004-20230531   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230601   gcc  
nios2                randconfig-r024-20230531   gcc  
nios2                randconfig-r026-20230531   gcc  
openrisc     buildonly-randconfig-r003-20230531   gcc  
openrisc             randconfig-r002-20230531   gcc  
openrisc             randconfig-r031-20230602   gcc  
parisc       buildonly-randconfig-r005-20230531   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230531   gcc  
parisc               randconfig-r005-20230531   gcc  
parisc               randconfig-r006-20230531   gcc  
parisc               randconfig-r026-20230531   gcc  
parisc               randconfig-r035-20230602   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                      ppc44x_defconfig   clang
powerpc              randconfig-r025-20230531   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230531   clang
riscv                               defconfig   gcc  
riscv                randconfig-r036-20230531   gcc  
riscv                randconfig-r042-20230531   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230531   gcc  
s390                 randconfig-r011-20230601   gcc  
s390                 randconfig-r033-20230531   gcc  
s390                 randconfig-r044-20230531   clang
sh                               allmodconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r013-20230601   gcc  
sparc                randconfig-r015-20230601   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r003-20230531   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230531   gcc  
x86_64               randconfig-a002-20230531   gcc  
x86_64               randconfig-a003-20230531   gcc  
x86_64               randconfig-a004-20230531   gcc  
x86_64               randconfig-a005-20230531   gcc  
x86_64               randconfig-a006-20230531   gcc  
x86_64               randconfig-r006-20230531   gcc  
x86_64               randconfig-x051-20230603   gcc  
x86_64               randconfig-x052-20230603   gcc  
x86_64               randconfig-x053-20230603   gcc  
x86_64               randconfig-x054-20230603   gcc  
x86_64               randconfig-x055-20230603   gcc  
x86_64               randconfig-x056-20230603   gcc  
x86_64               randconfig-x061-20230601   gcc  
x86_64               randconfig-x062-20230601   gcc  
x86_64               randconfig-x063-20230601   gcc  
x86_64               randconfig-x064-20230601   gcc  
x86_64               randconfig-x065-20230601   gcc  
x86_64               randconfig-x066-20230601   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r023-20230531   gcc  
xtensa               randconfig-r033-20230602   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
