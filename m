Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6A6074BB7D
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jul 2023 04:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbjGHCxW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jul 2023 22:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjGHCxV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jul 2023 22:53:21 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8141F1999
        for <linux-gpio@vger.kernel.org>; Fri,  7 Jul 2023 19:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688784800; x=1720320800;
  h=date:from:to:cc:subject:message-id;
  bh=Yf6l7UqT4OZ88SR752ybqJWpgNGgKohiDhDsyASoYFY=;
  b=jVTHEOd0Qo85UdyRj+3hGKyxk4qSnYsHvvDJ24L/k6GIKoINnsePEOWE
   NeTdpGSreR6YkT95Rr/iWyHHDrEgvmAuYMoU9jM4RS3Oro3H4Aww10cFo
   QMyL99z+Mvfk5Z9+vrMSvOIgY+eu8VtzHZomltla3aRpGYyLn740h+3ms
   je7zoivXxt5Z6ke+x+uWsDa8PD+e2/xLm4anrirrxPZwQBzx56c8WGHBa
   Q3n68baw2T3q4eMO8f2OVQOq0FV9RAX+XnA98Wx01dslJpsAtBlgm72B+
   k2kt8E/pjR1FkpPokfi/hM4UzJRRPN0AbZ9p6paDiVN80XbOvwNev1hMf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="364061566"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="364061566"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 19:53:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="790175988"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="790175988"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Jul 2023 19:53:18 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qHy4U-0002Vm-0c;
        Sat, 08 Jul 2023 02:53:18 +0000
Date:   Sat, 08 Jul 2023 10:53:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 3bc551a3007a751a53bfba5b37fa16157f4fb861
Message-ID: <202307081008.pFNw7HBJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 3bc551a3007a751a53bfba5b37fa16157f4fb861  pinctrl: amd: Unify debounce handling into amd_pinconf_set()

elapsed time: 769m

configs tested: 174
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230707   gcc  
alpha                randconfig-r005-20230707   gcc  
alpha                randconfig-r024-20230707   gcc  
alpha                randconfig-r025-20230707   gcc  
alpha                randconfig-r033-20230707   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r043-20230707   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                         assabet_defconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                         bcm2835_defconfig   clang
arm                                 defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                       netwinder_defconfig   clang
arm                         nhk8815_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                            qcom_defconfig   gcc  
arm                  randconfig-r026-20230707   gcc  
arm                  randconfig-r032-20230707   clang
arm                  randconfig-r046-20230707   gcc  
arm                    vt8500_v6_v7_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r022-20230707   clang
arm64                randconfig-r036-20230707   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r025-20230707   gcc  
hexagon                          alldefconfig   clang
hexagon              randconfig-r033-20230707   clang
hexagon              randconfig-r041-20230707   clang
hexagon              randconfig-r045-20230707   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230707   gcc  
i386         buildonly-randconfig-r005-20230707   gcc  
i386         buildonly-randconfig-r006-20230707   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230707   gcc  
i386                 randconfig-i002-20230707   gcc  
i386                 randconfig-i003-20230707   gcc  
i386                 randconfig-i004-20230707   gcc  
i386                 randconfig-i005-20230707   gcc  
i386                 randconfig-i006-20230707   gcc  
i386                 randconfig-i011-20230707   clang
i386                 randconfig-i012-20230707   clang
i386                 randconfig-i013-20230707   clang
i386                 randconfig-i014-20230707   clang
i386                 randconfig-i015-20230707   clang
i386                 randconfig-i016-20230707   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230707   gcc  
loongarch            randconfig-r035-20230707   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                 randconfig-r015-20230707   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                            ar7_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                      maltaaprp_defconfig   clang
mips                        maltaup_defconfig   clang
mips                 randconfig-r014-20230707   gcc  
mips                 randconfig-r015-20230707   gcc  
mips                 randconfig-r023-20230707   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r023-20230707   gcc  
openrisc             randconfig-r011-20230707   gcc  
openrisc             randconfig-r012-20230707   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                       maple_defconfig   gcc  
powerpc                   microwatt_defconfig   clang
powerpc                    mvme5100_defconfig   clang
powerpc                      ppc40x_defconfig   gcc  
powerpc                       ppc64_defconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc              randconfig-r001-20230707   gcc  
powerpc                    socrates_defconfig   clang
powerpc                  storcenter_defconfig   gcc  
powerpc                     tqm8540_defconfig   clang
powerpc                     tqm8541_defconfig   gcc  
powerpc                     tqm8560_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r003-20230707   gcc  
riscv                randconfig-r042-20230707   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230707   gcc  
s390                 randconfig-r013-20230707   clang
s390                 randconfig-r014-20230707   clang
s390                 randconfig-r022-20230707   clang
s390                 randconfig-r044-20230707   clang
sh                               allmodconfig   gcc  
sh                               j2_defconfig   gcc  
sh                   randconfig-r003-20230707   gcc  
sh                           se7724_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230707   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64              randconfig-r006-20230707   gcc  
sparc64              randconfig-r031-20230707   gcc  
sparc64              randconfig-r032-20230707   gcc  
sparc64              randconfig-r034-20230707   gcc  
sparc64              randconfig-r035-20230707   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r016-20230707   gcc  
um                   randconfig-r026-20230707   gcc  
um                   randconfig-r036-20230707   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230707   gcc  
x86_64       buildonly-randconfig-r002-20230707   gcc  
x86_64       buildonly-randconfig-r003-20230707   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r002-20230707   gcc  
x86_64               randconfig-r006-20230707   gcc  
x86_64               randconfig-r021-20230707   clang
x86_64               randconfig-x001-20230707   clang
x86_64               randconfig-x002-20230707   clang
x86_64               randconfig-x003-20230707   clang
x86_64               randconfig-x004-20230707   clang
x86_64               randconfig-x005-20230707   clang
x86_64               randconfig-x006-20230707   clang
x86_64               randconfig-x011-20230707   gcc  
x86_64               randconfig-x012-20230707   gcc  
x86_64               randconfig-x013-20230707   gcc  
x86_64               randconfig-x014-20230707   gcc  
x86_64               randconfig-x015-20230707   gcc  
x86_64               randconfig-x016-20230707   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r004-20230707   gcc  
xtensa               randconfig-r011-20230707   gcc  
xtensa               randconfig-r016-20230707   gcc  
xtensa               randconfig-r021-20230707   gcc  
xtensa               randconfig-r024-20230707   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
