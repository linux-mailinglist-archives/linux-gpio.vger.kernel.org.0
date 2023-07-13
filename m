Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43510751F16
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jul 2023 12:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234163AbjGMKi7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jul 2023 06:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234008AbjGMKiz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jul 2023 06:38:55 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB111BFA
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jul 2023 03:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689244734; x=1720780734;
  h=date:from:to:cc:subject:message-id;
  bh=blyyZCpTTmrDyti0REjK7IC+6kpT+tTlkfWHt/yAVxg=;
  b=abSIDErK2WlVhtMI9V1+dJNpsmkWtZ4vIH3H13rfdpk/ZUZA+aYRllZz
   7ihROwi2XjAYcS7mGHCacMgKAMxOcen/v5URRLq6wPZ75HejR+U7PoB9Y
   /vM+8MeIBsWEjQ4RWyfddHMrfBDoELrFa6nCoY1xfNIUg5NHiJQiAtusf
   F4gCXOi+PsB2MTBy/8RJnel0n1ucjFeuS4olfotszS6myKlhB5pW/8xLN
   9mLANXSq1+4LL3klrGN/BFkZdn2S60McEX8G7jXn5LOCY4uiV8ZpRYin+
   wCdu45uK1NIwUq0jJ5rUdlbgjJplLv0AEF10u0vswOjo6yZL7hOWXXTgr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="364016803"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="364016803"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 03:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="787404967"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="787404967"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Jul 2023 03:38:51 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qJtik-0006Y0-2L;
        Thu, 13 Jul 2023 10:38:50 +0000
Date:   Thu, 13 Jul 2023 18:38:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 04e601f2a71c804422a91df813e19fda5f4b845e
Message-ID: <202307131828.1vJG7bvy-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 04e601f2a71c804422a91df813e19fda5f4b845e  Merge tag 'renesas-pinctrl-fixes-for-v6.5-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into fixes

elapsed time: 725m

configs tested: 161
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230713   gcc  
alpha                randconfig-r025-20230712   gcc  
alpha                randconfig-r026-20230712   gcc  
alpha                randconfig-r032-20230713   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230713   gcc  
arc                  randconfig-r005-20230713   gcc  
arc                  randconfig-r043-20230712   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                                 defconfig   gcc  
arm                            dove_defconfig   clang
arm                           h3600_defconfig   gcc  
arm                      jornada720_defconfig   gcc  
arm                  randconfig-r001-20230713   gcc  
arm                  randconfig-r004-20230713   gcc  
arm                  randconfig-r016-20230713   clang
arm                  randconfig-r025-20230712   gcc  
arm                  randconfig-r046-20230712   gcc  
arm                             rpc_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r033-20230713   clang
arm64                randconfig-r034-20230713   clang
arm64                randconfig-r036-20230713   clang
csky                                defconfig   gcc  
hexagon              randconfig-r016-20230713   clang
hexagon              randconfig-r041-20230712   clang
hexagon              randconfig-r045-20230712   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230712   gcc  
i386         buildonly-randconfig-r005-20230712   gcc  
i386         buildonly-randconfig-r006-20230712   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230712   gcc  
i386                 randconfig-i002-20230712   gcc  
i386                 randconfig-i003-20230712   gcc  
i386                 randconfig-i004-20230712   gcc  
i386                 randconfig-i005-20230712   gcc  
i386                 randconfig-i006-20230712   gcc  
i386                 randconfig-i011-20230712   clang
i386                 randconfig-i011-20230713   gcc  
i386                 randconfig-i012-20230712   clang
i386                 randconfig-i012-20230713   gcc  
i386                 randconfig-i013-20230712   clang
i386                 randconfig-i013-20230713   gcc  
i386                 randconfig-i014-20230712   clang
i386                 randconfig-i014-20230713   gcc  
i386                 randconfig-i015-20230712   clang
i386                 randconfig-i015-20230713   gcc  
i386                 randconfig-i016-20230712   clang
i386                 randconfig-i016-20230713   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r011-20230713   gcc  
loongarch            randconfig-r015-20230713   gcc  
loongarch            randconfig-r035-20230713   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                 randconfig-r012-20230713   gcc  
m68k                 randconfig-r013-20230713   gcc  
m68k                 randconfig-r036-20230713   gcc  
microblaze           randconfig-r021-20230712   gcc  
microblaze           randconfig-r031-20230713   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                     loongson1c_defconfig   clang
mips                          malta_defconfig   clang
mips                 randconfig-r021-20230712   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r035-20230713   gcc  
openrisc             randconfig-r006-20230713   gcc  
openrisc             randconfig-r023-20230712   gcc  
openrisc             randconfig-r024-20230712   gcc  
openrisc             randconfig-r032-20230713   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230713   gcc  
parisc               randconfig-r022-20230712   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                       ebony_defconfig   clang
powerpc                      mgcoge_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      obs600_defconfig   clang
powerpc                      ppc6xx_defconfig   gcc  
powerpc              randconfig-r003-20230713   clang
powerpc                    sam440ep_defconfig   gcc  
powerpc                     skiroot_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                randconfig-r015-20230713   gcc  
riscv                randconfig-r023-20230712   clang
riscv                randconfig-r031-20230713   clang
riscv                randconfig-r042-20230712   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230713   clang
s390                 randconfig-r006-20230713   clang
s390                 randconfig-r014-20230713   gcc  
s390                 randconfig-r033-20230713   clang
s390                 randconfig-r044-20230712   clang
sh                               allmodconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                   randconfig-r005-20230713   gcc  
sh                   randconfig-r013-20230713   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r034-20230713   gcc  
sparc                       sparc32_defconfig   gcc  
um                               alldefconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230712   gcc  
x86_64       buildonly-randconfig-r002-20230712   gcc  
x86_64       buildonly-randconfig-r003-20230712   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r002-20230713   clang
x86_64               randconfig-r026-20230712   clang
x86_64               randconfig-x001-20230712   clang
x86_64               randconfig-x002-20230712   clang
x86_64               randconfig-x003-20230712   clang
x86_64               randconfig-x004-20230712   clang
x86_64               randconfig-x005-20230712   clang
x86_64               randconfig-x006-20230712   clang
x86_64               randconfig-x011-20230712   gcc  
x86_64               randconfig-x012-20230712   gcc  
x86_64               randconfig-x013-20230712   gcc  
x86_64               randconfig-x014-20230712   gcc  
x86_64               randconfig-x015-20230712   gcc  
x86_64               randconfig-x016-20230712   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r012-20230713   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
