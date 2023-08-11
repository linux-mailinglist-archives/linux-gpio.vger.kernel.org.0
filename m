Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26CCC778531
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 04:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjHKCAa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 22:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjHKCA3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 22:00:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5503E2D56
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 19:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691719228; x=1723255228;
  h=date:from:to:cc:subject:message-id;
  bh=UDNnCWTgt375qLhpojZuAMtSy4P5kVqF8cSkxDCCKBU=;
  b=BdP8EJNleKU3g2+2zdtMVGWFVxurP31g6vM+2cEMWQQMfEZjeFBVh2Xc
   5TVRP1BPOtVNPDcgp/3Q7HNgmSuGzhO8MAC/t+2S8gUb4oBhFVGz7bGvK
   wVy/5bxtmSKjr5GuQfoc1X0X8Pas965ypAf0VQK3EwKyVDDdHrBZ0HY8P
   WYzADBVEknIIfqWlhfhNpbO46tq0y9X+zMvwYtgS56V64dos2pfpECAuS
   HEmjWacXs1d9hp+FXhGqe8xfVbUyxtgurQiR8iudW75ANLUOB6QBENlsL
   PJDW4aJpbLK+kwI5TI++0vhcBw5OrKQAtQHoQVvb8uFTQ8mX/tivpdtl5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="369042664"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="369042664"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 19:00:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="906263816"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="906263816"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Aug 2023 19:00:26 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qUHRx-0007Po-2q;
        Fri, 11 Aug 2023 02:00:25 +0000
Date:   Fri, 11 Aug 2023 10:00:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 9757300d2750ef76f139aa6f5f7eadd61a0de0d3
Message-ID: <202308110947.ISfxXQZx-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 9757300d2750ef76f139aa6f5f7eadd61a0de0d3  pinctrl: qcom: Add intr_target_width field to support increased number of interrupt targets

elapsed time: 723m

configs tested: 109
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r013-20230810   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r014-20230810   gcc  
arc                  randconfig-r025-20230810   gcc  
arc                  randconfig-r043-20230810   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r011-20230810   gcc  
arm                  randconfig-r031-20230810   clang
arm                  randconfig-r046-20230810   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r004-20230810   clang
hexagon              randconfig-r022-20230810   clang
hexagon              randconfig-r041-20230810   clang
hexagon              randconfig-r045-20230810   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230810   gcc  
i386         buildonly-randconfig-r005-20230810   gcc  
i386         buildonly-randconfig-r006-20230810   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230810   gcc  
i386                 randconfig-i002-20230810   gcc  
i386                 randconfig-i003-20230810   gcc  
i386                 randconfig-i004-20230810   gcc  
i386                 randconfig-i005-20230810   gcc  
i386                 randconfig-i006-20230810   gcc  
i386                 randconfig-i011-20230810   clang
i386                 randconfig-i012-20230810   clang
i386                 randconfig-i013-20230810   clang
i386                 randconfig-i014-20230810   clang
i386                 randconfig-i015-20230810   clang
i386                 randconfig-i016-20230810   clang
i386                 randconfig-r034-20230810   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r005-20230810   gcc  
loongarch            randconfig-r036-20230810   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r002-20230810   clang
mips                 randconfig-r016-20230810   gcc  
mips                 randconfig-r024-20230810   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r033-20230810   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r026-20230810   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r023-20230810   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230810   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r012-20230810   clang
s390                 randconfig-r035-20230810   gcc  
s390                 randconfig-r044-20230810   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230810   gcc  
sh                   randconfig-r006-20230810   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r015-20230810   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230810   gcc  
x86_64       buildonly-randconfig-r002-20230810   gcc  
x86_64       buildonly-randconfig-r003-20230810   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r021-20230810   clang
x86_64               randconfig-r032-20230810   gcc  
x86_64               randconfig-x001-20230810   clang
x86_64               randconfig-x002-20230810   clang
x86_64               randconfig-x003-20230810   clang
x86_64               randconfig-x004-20230810   clang
x86_64               randconfig-x005-20230810   clang
x86_64               randconfig-x006-20230810   clang
x86_64               randconfig-x011-20230810   gcc  
x86_64               randconfig-x012-20230810   gcc  
x86_64               randconfig-x013-20230810   gcc  
x86_64               randconfig-x014-20230810   gcc  
x86_64               randconfig-x015-20230810   gcc  
x86_64               randconfig-x016-20230810   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r003-20230810   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
