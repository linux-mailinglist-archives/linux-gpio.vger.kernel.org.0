Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF65705E3B
	for <lists+linux-gpio@lfdr.de>; Wed, 17 May 2023 05:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbjEQDmy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 May 2023 23:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231530AbjEQDmy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 May 2023 23:42:54 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444AE35A5
        for <linux-gpio@vger.kernel.org>; Tue, 16 May 2023 20:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684294972; x=1715830972;
  h=date:from:to:cc:subject:message-id;
  bh=OjsmG/sWd+HGtF0XiXwqPbWNZdoEbkS3ti2ZHBRZrUU=;
  b=X2wbdwUDNaP9SlcV3hTH5pXWLJLOYrDQdWx9aCzPSJxTgDF5iDcnWZiX
   +ieriPnFS59BGYpgP6keYmGIXy+ZfvK9av/QHA2c77HOk+c+AzquuGfsV
   yle33mIdVXvwaf9G1HEuMfRwEkRsQqYplJy8MG3R+t4wSRQQ6RZPV4mId
   207Zs8QDWp004UM8/EuaQyNxbO0lg+QoVrPTCkCTLtc4PreZZWksxdMCG
   l6wdVGirUTKnqyf8y23GtFDvnaOCMFDs7Uhi5lafiFkRsAl87P0UYlG34
   Z7ptVYO6v8APrH4uZMoAJFa84DpEs9VF1dO9rE9xJJiCzVnuGN8OLhP86
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="341037686"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; 
   d="scan'208";a="341037686"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 20:42:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="732231292"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; 
   d="scan'208";a="732231292"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 May 2023 20:42:50 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pz83t-0008Bu-2E;
        Wed, 17 May 2023 03:42:49 +0000
Date:   Wed, 17 May 2023 11:42:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:at24/for-next] BUILD SUCCESS
 a3c10035d12f5ec10915d5c00c2e8f7d7c066182
Message-ID: <20230517034237.SRm9z%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: INFO setup_repo_specs: /db/releases/20230517104217/lkp-src/repo/*/brgl
https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git at24/for-next
branch HEAD: a3c10035d12f5ec10915d5c00c2e8f7d7c066182  eeprom: at24: Use dev_err_probe for nvmem register failure

elapsed time: 723m

configs tested: 348
configs skipped: 23

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r003-20230515   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230515   gcc  
alpha                randconfig-r011-20230515   gcc  
alpha                randconfig-r013-20230515   gcc  
alpha                randconfig-r025-20230515   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc          buildonly-randconfig-r006-20230515   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r001-20230515   gcc  
arc                  randconfig-r015-20230516   gcc  
arc                  randconfig-r022-20230516   gcc  
arc                  randconfig-r032-20230515   gcc  
arc                  randconfig-r043-20230515   gcc  
arc                  randconfig-r043-20230516   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                          collie_defconfig   clang
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                            qcom_defconfig   gcc  
arm                  randconfig-r033-20230515   gcc  
arm                  randconfig-r046-20230515   clang
arm                  randconfig-r046-20230516   gcc  
arm                  randconfig-r046-20230517   clang
arm                        shmobile_defconfig   gcc  
arm                         socfpga_defconfig   clang
arm64                            alldefconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r006-20230516   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230515   clang
arm64                randconfig-r014-20230515   gcc  
arm64                randconfig-r024-20230516   clang
csky                                defconfig   gcc  
csky                 randconfig-r006-20230515   gcc  
csky                 randconfig-r011-20230515   gcc  
csky                 randconfig-r012-20230516   gcc  
csky                 randconfig-r023-20230515   gcc  
csky                 randconfig-r026-20230517   gcc  
hexagon              randconfig-r006-20230515   clang
hexagon              randconfig-r025-20230516   clang
hexagon              randconfig-r026-20230516   clang
hexagon              randconfig-r031-20230515   clang
hexagon              randconfig-r041-20230515   clang
hexagon              randconfig-r041-20230516   clang
hexagon              randconfig-r041-20230517   clang
hexagon              randconfig-r045-20230515   clang
hexagon              randconfig-r045-20230516   clang
hexagon              randconfig-r045-20230517   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230515   clang
i386                 randconfig-a002-20230515   clang
i386                 randconfig-a003-20230515   clang
i386                 randconfig-a004-20230515   clang
i386                 randconfig-a005-20230515   clang
i386                 randconfig-a006-20230515   clang
i386                 randconfig-a011-20230515   gcc  
i386                          randconfig-a011   clang
i386                 randconfig-a012-20230515   gcc  
i386                          randconfig-a012   gcc  
i386                 randconfig-a013-20230515   gcc  
i386                          randconfig-a013   clang
i386                 randconfig-a014-20230515   gcc  
i386                          randconfig-a014   gcc  
i386                 randconfig-a015-20230515   gcc  
i386                          randconfig-a015   clang
i386                 randconfig-a016-20230515   gcc  
i386                          randconfig-a016   gcc  
i386                 randconfig-i051-20230515   clang
i386                 randconfig-i052-20230515   clang
i386                          randconfig-i052   clang
i386                 randconfig-i053-20230515   clang
i386                 randconfig-i054-20230515   clang
i386                          randconfig-i054   clang
i386                 randconfig-i055-20230515   clang
i386                 randconfig-i056-20230515   clang
i386                          randconfig-i056   clang
i386                 randconfig-i061-20230515   clang
i386                 randconfig-i062-20230515   clang
i386                          randconfig-i062   clang
i386                 randconfig-i063-20230515   clang
i386                 randconfig-i064-20230515   clang
i386                          randconfig-i064   clang
i386                 randconfig-i065-20230515   clang
i386                 randconfig-i066-20230515   clang
i386                          randconfig-i066   clang
i386                 randconfig-i071-20230515   gcc  
i386                          randconfig-i071   clang
i386                 randconfig-i072-20230515   gcc  
i386                 randconfig-i073-20230515   gcc  
i386                          randconfig-i073   clang
i386                 randconfig-i074-20230515   gcc  
i386                 randconfig-i075-20230515   gcc  
i386                          randconfig-i075   clang
i386                 randconfig-i076-20230515   gcc  
i386                 randconfig-i081-20230515   gcc  
i386                 randconfig-i082-20230515   gcc  
i386                          randconfig-i082   clang
i386                 randconfig-i083-20230515   gcc  
i386                 randconfig-i084-20230515   gcc  
i386                          randconfig-i084   clang
i386                 randconfig-i085-20230515   gcc  
i386                 randconfig-i086-20230515   gcc  
i386                          randconfig-i086   clang
i386                 randconfig-i091-20230515   clang
i386                 randconfig-i092-20230515   clang
i386                 randconfig-i093-20230515   clang
i386                 randconfig-i094-20230515   clang
i386                 randconfig-i095-20230515   clang
i386                 randconfig-i096-20230515   clang
i386                 randconfig-r014-20230515   gcc  
i386                 randconfig-r016-20230515   gcc  
ia64                             allmodconfig   gcc  
ia64                         bigsur_defconfig   gcc  
ia64         buildonly-randconfig-r001-20230516   gcc  
ia64         buildonly-randconfig-r002-20230516   gcc  
ia64         buildonly-randconfig-r003-20230515   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r005-20230515   gcc  
ia64                 randconfig-r013-20230515   gcc  
ia64                 randconfig-r024-20230516   gcc  
ia64                          tiger_defconfig   gcc  
ia64                            zx1_defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r021-20230515   gcc  
loongarch            randconfig-r023-20230516   gcc  
loongarch            randconfig-r033-20230515   gcc  
m68k                             allmodconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k         buildonly-randconfig-r001-20230515   gcc  
m68k         buildonly-randconfig-r002-20230515   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                            q40_defconfig   gcc  
m68k                 randconfig-r002-20230516   gcc  
m68k                 randconfig-r016-20230515   gcc  
m68k                 randconfig-r022-20230515   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze           randconfig-r012-20230515   gcc  
microblaze           randconfig-r015-20230515   gcc  
microblaze           randconfig-r021-20230515   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips         buildonly-randconfig-r004-20230515   gcc  
mips                           ip28_defconfig   clang
mips                     loongson1c_defconfig   clang
mips                      maltaaprp_defconfig   clang
mips                 randconfig-r002-20230515   gcc  
mips                 randconfig-r004-20230515   gcc  
nios2                         3c120_defconfig   gcc  
nios2        buildonly-randconfig-r003-20230516   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230515   gcc  
nios2                randconfig-r005-20230516   gcc  
nios2                randconfig-r011-20230515   gcc  
nios2                randconfig-r023-20230515   gcc  
nios2                randconfig-r034-20230515   gcc  
openrisc     buildonly-randconfig-r003-20230515   gcc  
openrisc     buildonly-randconfig-r006-20230515   gcc  
openrisc             randconfig-r014-20230515   gcc  
openrisc             randconfig-r015-20230515   gcc  
openrisc             randconfig-r036-20230515   gcc  
parisc                           alldefconfig   gcc  
parisc       buildonly-randconfig-r001-20230515   gcc  
parisc       buildonly-randconfig-r004-20230515   gcc  
parisc       buildonly-randconfig-r005-20230515   gcc  
parisc       buildonly-randconfig-r006-20230515   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230515   gcc  
parisc               randconfig-r006-20230516   gcc  
parisc               randconfig-r013-20230515   gcc  
parisc               randconfig-r015-20230515   gcc  
parisc               randconfig-r026-20230515   gcc  
parisc               randconfig-r026-20230516   gcc  
parisc               randconfig-r031-20230516   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                        icon_defconfig   clang
powerpc                      makalu_defconfig   gcc  
powerpc                 mpc832x_rdb_defconfig   clang
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                 mpc8560_ads_defconfig   clang
powerpc                     ppa8548_defconfig   clang
powerpc              randconfig-r001-20230515   clang
powerpc              randconfig-r004-20230515   clang
powerpc              randconfig-r025-20230517   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                    socrates_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230515   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230515   clang
riscv                randconfig-r004-20230516   gcc  
riscv                randconfig-r012-20230515   gcc  
riscv                randconfig-r022-20230517   gcc  
riscv                randconfig-r025-20230515   gcc  
riscv                randconfig-r036-20230516   gcc  
riscv                randconfig-r042-20230515   gcc  
riscv                randconfig-r042-20230516   clang
riscv                          rv32_defconfig   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r003-20230515   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230515   clang
s390                 randconfig-r005-20230515   clang
s390                 randconfig-r013-20230515   gcc  
s390                 randconfig-r022-20230516   clang
s390                 randconfig-r024-20230515   gcc  
s390                 randconfig-r026-20230516   clang
s390                 randconfig-r032-20230515   clang
s390                 randconfig-r033-20230515   clang
s390                 randconfig-r034-20230516   gcc  
s390                 randconfig-r044-20230515   gcc  
s390                 randconfig-r044-20230516   clang
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r005-20230515   gcc  
sh           buildonly-randconfig-r006-20230515   gcc  
sh                        dreamcast_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                   randconfig-r001-20230515   gcc  
sh                   randconfig-r011-20230516   gcc  
sh                   randconfig-r013-20230516   gcc  
sh                   randconfig-r015-20230515   gcc  
sh                   randconfig-r024-20230515   gcc  
sh                   randconfig-r032-20230515   gcc  
sh                   randconfig-r032-20230516   gcc  
sh                   randconfig-r035-20230515   gcc  
sh                   randconfig-r036-20230516   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc        buildonly-randconfig-r002-20230515   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r031-20230515   gcc  
sparc                randconfig-r033-20230516   gcc  
sparc                randconfig-r035-20230516   gcc  
sparc64      buildonly-randconfig-r004-20230515   gcc  
sparc64      buildonly-randconfig-r006-20230515   gcc  
sparc64              randconfig-r012-20230515   gcc  
sparc64              randconfig-r033-20230516   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230515   clang
x86_64                        randconfig-a001   clang
x86_64               randconfig-a002-20230515   clang
x86_64               randconfig-a003-20230515   clang
x86_64                        randconfig-a003   clang
x86_64               randconfig-a004-20230515   clang
x86_64               randconfig-a005-20230515   clang
x86_64                        randconfig-a005   clang
x86_64               randconfig-a006-20230515   clang
x86_64               randconfig-a011-20230515   gcc  
x86_64               randconfig-a012-20230515   gcc  
x86_64                        randconfig-a012   clang
x86_64               randconfig-a013-20230515   gcc  
x86_64               randconfig-a014-20230515   gcc  
x86_64                        randconfig-a014   clang
x86_64               randconfig-a015-20230515   gcc  
x86_64               randconfig-a016-20230515   gcc  
x86_64                        randconfig-a016   clang
x86_64               randconfig-k001-20230515   gcc  
x86_64               randconfig-r011-20230515   gcc  
x86_64               randconfig-r014-20230515   gcc  
x86_64               randconfig-r035-20230515   clang
x86_64               randconfig-x051-20230515   gcc  
x86_64               randconfig-x052-20230515   gcc  
x86_64                        randconfig-x052   clang
x86_64               randconfig-x053-20230515   gcc  
x86_64               randconfig-x054-20230515   gcc  
x86_64                        randconfig-x054   clang
x86_64               randconfig-x055-20230515   gcc  
x86_64               randconfig-x056-20230515   gcc  
x86_64                        randconfig-x056   clang
x86_64               randconfig-x061-20230515   gcc  
x86_64               randconfig-x062-20230515   gcc  
x86_64               randconfig-x063-20230515   gcc  
x86_64               randconfig-x064-20230515   gcc  
x86_64               randconfig-x065-20230515   gcc  
x86_64               randconfig-x066-20230515   gcc  
x86_64               randconfig-x071-20230515   clang
x86_64                        randconfig-x071   clang
x86_64               randconfig-x072-20230515   clang
x86_64               randconfig-x073-20230515   clang
x86_64                        randconfig-x073   clang
x86_64               randconfig-x074-20230515   clang
x86_64               randconfig-x075-20230515   clang
x86_64                        randconfig-x075   clang
x86_64               randconfig-x076-20230515   clang
x86_64               randconfig-x081-20230515   clang
x86_64               randconfig-x082-20230515   clang
x86_64                        randconfig-x082   clang
x86_64               randconfig-x083-20230515   clang
x86_64               randconfig-x084-20230515   clang
x86_64                        randconfig-x084   clang
x86_64               randconfig-x085-20230515   clang
x86_64               randconfig-x086-20230515   clang
x86_64                        randconfig-x086   clang
x86_64               randconfig-x091-20230515   gcc  
x86_64               randconfig-x092-20230515   gcc  
x86_64                        randconfig-x092   gcc  
x86_64               randconfig-x093-20230515   gcc  
x86_64               randconfig-x094-20230515   gcc  
x86_64                        randconfig-x094   gcc  
x86_64               randconfig-x095-20230515   gcc  
x86_64               randconfig-x096-20230515   gcc  
x86_64                        randconfig-x096   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230515   gcc  
xtensa       buildonly-randconfig-r004-20230515   gcc  
xtensa                       common_defconfig   gcc  
xtensa               randconfig-r021-20230517   gcc  
xtensa               randconfig-r036-20230515   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
