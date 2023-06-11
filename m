Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1502A72B095
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jun 2023 09:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjFKHOA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Jun 2023 03:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232870AbjFKHN7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Jun 2023 03:13:59 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52FF30D0
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jun 2023 00:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686467637; x=1718003637;
  h=date:from:to:cc:subject:message-id;
  bh=SNci8RHuEdcclcLjY8LH+mrBxCrj0a/S1IgeGzi8RrM=;
  b=CkGjcl6Y8RqjuJutMKnscYYdbcAFnySICQZ8+1dDea9BDy6wyedzzMGA
   Vwp7e289dRc9TE3J6iEFlt8jHqb1rPMfvlGFkQ28w8ngGCngg2oreicaP
   zDw38rx0aYCVu6KCa+IcD9m1Bjg5cslkyHOlr8h+VCZb+nwRi/vwOcWSC
   ELGWrLAOWOKNr0mkaLWNgpz3z6HIF9+amLxbpZ4nPFbUrb7CgA8dK1JpF
   pWO15E2IZv/RHvyLh3hO7cqZQ+E/D4Gn+sm4Or1Sgm2FiV3bsD10hUUeY
   D4slDMJUW2vMqWD1adqm+AOUBDLbh32bM3xeRNnyLk8AWcDCPkGtefCYn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="421429724"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="421429724"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 00:13:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="885044430"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="885044430"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Jun 2023 00:13:53 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q8FGq-000AiT-23;
        Sun, 11 Jun 2023 07:13:52 +0000
Date:   Sun, 11 Jun 2023 15:13:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 386ea42924875c63ae9559a4c8ac94152b85fcf5
Message-ID: <202306111535.3PhmJfQR-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 386ea42924875c63ae9559a4c8ac94152b85fcf5  Merge branch 'devel' into for-next

elapsed time: 723m

configs tested: 123
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r033-20230611   gcc  
arc                              allyesconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230611   gcc  
arc                  randconfig-r043-20230611   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                                 defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                            mmp2_defconfig   clang
arm                        multi_v5_defconfig   clang
arm                             mxs_defconfig   clang
arm                       netwinder_defconfig   clang
arm                          pxa3xx_defconfig   gcc  
arm                  randconfig-r014-20230611   gcc  
arm                  randconfig-r034-20230611   clang
arm                  randconfig-r046-20230611   gcc  
arm                       versatile_defconfig   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r004-20230611   gcc  
arm64                               defconfig   gcc  
csky                             alldefconfig   gcc  
csky                                defconfig   gcc  
hexagon      buildonly-randconfig-r002-20230611   clang
hexagon              randconfig-r001-20230611   clang
hexagon              randconfig-r041-20230611   clang
hexagon              randconfig-r045-20230611   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r005-20230611   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230611   gcc  
i386                 randconfig-i002-20230611   gcc  
i386                 randconfig-i003-20230611   gcc  
i386                 randconfig-i004-20230611   gcc  
i386                 randconfig-i005-20230611   gcc  
i386                 randconfig-i006-20230611   gcc  
i386                 randconfig-i011-20230611   clang
i386                 randconfig-i012-20230611   clang
i386                 randconfig-i013-20230611   clang
i386                 randconfig-i014-20230611   clang
i386                 randconfig-i015-20230611   clang
i386                 randconfig-i016-20230611   clang
i386                 randconfig-r024-20230611   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r013-20230611   gcc  
microblaze           randconfig-r036-20230611   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips                    maltaup_xpa_defconfig   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r016-20230611   gcc  
parisc                           allyesconfig   gcc  
parisc       buildonly-randconfig-r001-20230611   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230611   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc              randconfig-r025-20230611   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230611   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r015-20230611   clang
s390                 randconfig-r044-20230611   clang
sh                               allmodconfig   gcc  
sh                            migor_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230611   gcc  
sparc                randconfig-r031-20230611   gcc  
sparc64      buildonly-randconfig-r006-20230611   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230611   gcc  
x86_64               randconfig-a002-20230611   gcc  
x86_64               randconfig-a003-20230611   gcc  
x86_64               randconfig-a004-20230611   gcc  
x86_64               randconfig-a005-20230611   gcc  
x86_64               randconfig-a006-20230611   gcc  
x86_64               randconfig-a011-20230611   clang
x86_64               randconfig-a012-20230611   clang
x86_64               randconfig-a013-20230611   clang
x86_64               randconfig-a014-20230611   clang
x86_64               randconfig-a015-20230611   clang
x86_64               randconfig-a016-20230611   clang
x86_64               randconfig-r021-20230611   clang
x86_64               randconfig-r022-20230611   clang
x86_64               randconfig-r032-20230611   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r003-20230611   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa               randconfig-r002-20230611   gcc  
xtensa               randconfig-r003-20230611   gcc  
xtensa               randconfig-r006-20230611   gcc  
xtensa               randconfig-r012-20230611   gcc  
xtensa               randconfig-r035-20230611   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
