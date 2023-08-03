Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC8676EF80
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 18:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233982AbjHCQbk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Aug 2023 12:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232768AbjHCQbj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2023 12:31:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8084E30D5
        for <linux-gpio@vger.kernel.org>; Thu,  3 Aug 2023 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691080298; x=1722616298;
  h=date:from:to:cc:subject:message-id;
  bh=opR6/FE49bjo3J6nHt651GLj22N49e5eCwo4jLTbs9g=;
  b=CD3jC5Gx/iHHZEPs0QlCkT7btxZ+zItgkyaRQSq3zEeUh8Mnt8Wbv4l5
   unYrt/0RzX97QVg//DZGP06ebKASm1Mf8dAJlNAvjPUtssL1vZf36jZis
   G3SkV2E8fjzvE29Nq48P9Wp5moup2H6uJWUSP6TjMKBKoIrF+M140jPVB
   XzE7KunanqRrpDB+KXA5S+C0lMvygpVUQqg0JwWc8OJYjE38X3ZR6iMZC
   Lvn/r1M9B53wpPFO/ytBtG17+5mccTM0osr3cyUvYbu3XcKnliFOspWz6
   Qgffi4kjq1jQw/EXncCJo89gpREGXZJ3bXfgPwowLlEFS8NuIpz/VdeLy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="373572811"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="373572811"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 09:31:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="903483038"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="903483038"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Aug 2023 09:26:43 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qRb9u-0002EJ-24;
        Thu, 03 Aug 2023 16:26:42 +0000
Date:   Fri, 04 Aug 2023 00:26:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD SUCCESS
 046d3546750a3e2f2e8e7d39318290604fe6f202
Message-ID: <202308040027.Rf61YiwP-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 046d3546750a3e2f2e8e7d39318290604fe6f202  Merge tag 'renesas-pinctrl-for-v6.6-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into devel

elapsed time: 960m

configs tested: 113
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r022-20230731   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230731   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r011-20230801   gcc  
arm                  randconfig-r031-20230731   clang
arm                  randconfig-r046-20230731   gcc  
arm                       versatile_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r021-20230731   clang
csky                                defconfig   gcc  
csky                 randconfig-r006-20230801   gcc  
hexagon              randconfig-r041-20230731   clang
hexagon              randconfig-r045-20230731   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230731   gcc  
i386         buildonly-randconfig-r005-20230731   gcc  
i386         buildonly-randconfig-r006-20230731   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230802   clang
i386                 randconfig-i002-20230802   clang
i386                 randconfig-i003-20230802   clang
i386                 randconfig-i004-20230802   clang
i386                 randconfig-i005-20230802   clang
i386                 randconfig-i006-20230802   clang
i386                 randconfig-i011-20230801   clang
i386                 randconfig-i012-20230801   clang
i386                 randconfig-i013-20230801   clang
i386                 randconfig-i014-20230801   clang
i386                 randconfig-i015-20230801   clang
i386                 randconfig-i016-20230801   clang
i386                 randconfig-r024-20230731   clang
i386                 randconfig-r026-20230731   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r016-20230801   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze           randconfig-r005-20230801   gcc  
microblaze           randconfig-r023-20230731   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                 randconfig-r001-20230801   clang
nios2                               defconfig   gcc  
openrisc             randconfig-r015-20230801   gcc  
openrisc             randconfig-r032-20230731   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r003-20230801   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r012-20230801   clang
riscv                randconfig-r042-20230731   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r035-20230731   gcc  
s390                 randconfig-r044-20230731   clang
sh                               allmodconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r036-20230731   gcc  
sparc64              randconfig-r002-20230801   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r014-20230801   gcc  
um                   randconfig-r025-20230731   gcc  
um                   randconfig-r033-20230731   clang
um                   randconfig-r034-20230731   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230731   gcc  
x86_64       buildonly-randconfig-r002-20230731   gcc  
x86_64       buildonly-randconfig-r003-20230731   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230731   clang
x86_64               randconfig-x002-20230731   clang
x86_64               randconfig-x003-20230731   clang
x86_64               randconfig-x004-20230731   clang
x86_64               randconfig-x005-20230731   clang
x86_64               randconfig-x006-20230731   clang
x86_64               randconfig-x011-20230802   clang
x86_64               randconfig-x012-20230802   clang
x86_64               randconfig-x013-20230802   clang
x86_64               randconfig-x014-20230802   clang
x86_64               randconfig-x015-20230802   clang
x86_64               randconfig-x016-20230802   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
