Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92D656B347E
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Mar 2023 04:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjCJDG7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 22:06:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjCJDG6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 22:06:58 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD0DF8E79
        for <linux-gpio@vger.kernel.org>; Thu,  9 Mar 2023 19:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678417616; x=1709953616;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UZZNR8/joeSoZhRDivBSExorbjGqjTJAhTz+fvS0rLM=;
  b=M4ekNNUYsxhcupa7RE6bZnRScrQwJi96KYF1MMcLLztYvhY/dvS68E2D
   lS9FkabGdt0j2AH5N8fZ0a10aLr/6sC6OKR7AeuLn6Ih4KFDMTGSPtPRW
   F+kW/nNVaWdStdJXyO7h4K1taoB9WDvnHtgfBAfL2FeVCd63lJFT3Cx/C
   ITtvvTRkCZGjtegSAB3nE+YELUZgT5pdY/DEZblRbGAoncnMflJGbk/Uc
   QJKOqwo04cE3xVVy30mevZpR0KMTYruMoNR3GlPti4l2fzMSodKZ41hVF
   y4hz39z6cWvOieCppso3sG50A4UK99dS5QBv9OU8P2Re6Va67+5hBhqa3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="336651176"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="336651176"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 19:06:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="923510535"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="923510535"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Mar 2023 19:06:51 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1paT5m-0003QX-0q;
        Fri, 10 Mar 2023 03:06:50 +0000
Date:   Fri, 10 Mar 2023 11:05:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 df688eb8ea45cbe9c23fd17e395ad8dfa7feb3b6
Message-ID: <640a9e95.vg8A/rFGrP9G+4Wa%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: df688eb8ea45cbe9c23fd17e395ad8dfa7feb3b6  dt-bindings: pinctrl: k3: Introduce debounce select mux macros

elapsed time: 731m

configs tested: 101
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230308   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230309   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r023-20230308   gcc  
arc                  randconfig-r043-20230308   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r012-20230308   gcc  
arm                  randconfig-r046-20230308   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230308   clang
csky         buildonly-randconfig-r004-20230308   gcc  
csky         buildonly-randconfig-r006-20230308   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r031-20230308   gcc  
hexagon              randconfig-r032-20230308   clang
hexagon              randconfig-r041-20230308   clang
hexagon              randconfig-r045-20230308   clang
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
loongarch            randconfig-r001-20230309   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230309   gcc  
m68k                 randconfig-r024-20230308   gcc  
m68k                 randconfig-r034-20230308   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r002-20230308   clang
mips                 randconfig-r026-20230308   gcc  
nios2        buildonly-randconfig-r005-20230308   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230308   gcc  
nios2                randconfig-r016-20230308   gcc  
nios2                randconfig-r036-20230308   gcc  
openrisc             randconfig-r022-20230308   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230308   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r021-20230308   clang
s390                 randconfig-r025-20230308   clang
s390                 randconfig-r044-20230308   clang
sh                               allmodconfig   gcc  
sparc        buildonly-randconfig-r003-20230308   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r035-20230308   gcc  
sparc64              randconfig-r033-20230308   gcc  
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
xtensa               randconfig-r002-20230309   gcc  
xtensa               randconfig-r005-20230309   gcc  
xtensa               randconfig-r015-20230308   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
