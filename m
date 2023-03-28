Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1D886CBC6A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Mar 2023 12:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjC1KUT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Mar 2023 06:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjC1KUT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2023 06:20:19 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5640D4EE8
        for <linux-gpio@vger.kernel.org>; Tue, 28 Mar 2023 03:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679998818; x=1711534818;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=992kA1wysFY98d8wCqhL0kdaIiWdhyItsKlFB1M5d6A=;
  b=Ak/TWSKsKKAynTJlFKPsEm7LF975ggv9uy3toa86pikws1wq7T4D5fYt
   KaFZSB7RTQWv2Sih8n1KXDyN2oZRLlul/6oMd0/IoTFw8Y1Gm7yroV+u5
   CBtpZ1lwnwCm5D2RHLFgYwsIxrqBBCohg28bZRM9ROqj0BQUWoM+vV2CR
   kDG3TroVxigKEKOqKmLql7mXcOr2irkvCnOJIEuAcaTE+sGrX3aMvE5LW
   4hTWGRF4UMCMWvsgMlPz0tIxTqYhw5qgxSnj8s7JnscylDIlxYvMvllDK
   0tCEglmuhZ14UJXdo6qapVMtlkuLxxKodvqAvl/MKAcZLlpbBW6KCfJPr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="342936757"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="342936757"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 03:20:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="773092815"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="773092815"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Mar 2023 03:20:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ph6Qq-000ITJ-1U;
        Tue, 28 Mar 2023 10:20:00 +0000
Date:   Tue, 28 Mar 2023 18:19:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 5278b8e458f38be91b502530573744ed59c97caa
Message-ID: <6422bf15.JbfAwArwR5mY7KVf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 5278b8e458f38be91b502530573744ed59c97caa  Merge branch 'devel' into for-next

elapsed time: 720m

configs tested: 131
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230327   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r016-20230327   gcc  
arc                  randconfig-r031-20230326   gcc  
arc                  randconfig-r043-20230326   gcc  
arc                  randconfig-r043-20230327   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r003-20230326   clang
arm                                 defconfig   gcc  
arm                  randconfig-r025-20230326   clang
arm                  randconfig-r046-20230326   clang
arm                  randconfig-r046-20230327   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230326   clang
arm64                               defconfig   gcc  
arm64                randconfig-r012-20230326   gcc  
arm64                randconfig-r013-20230327   clang
csky                                defconfig   gcc  
csky                 randconfig-r003-20230327   gcc  
hexagon              randconfig-r006-20230326   clang
hexagon              randconfig-r036-20230326   clang
hexagon              randconfig-r041-20230326   clang
hexagon              randconfig-r041-20230327   clang
hexagon              randconfig-r045-20230326   clang
hexagon              randconfig-r045-20230327   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230327   gcc  
i386                 randconfig-a002-20230327   gcc  
i386                 randconfig-a003-20230327   gcc  
i386                 randconfig-a004-20230327   gcc  
i386                 randconfig-a005-20230327   gcc  
i386                 randconfig-a006-20230327   gcc  
i386                 randconfig-a011-20230327   clang
i386                 randconfig-a012-20230327   clang
i386                 randconfig-a013-20230327   clang
i386                 randconfig-a014-20230327   clang
i386                 randconfig-a015-20230327   clang
i386                 randconfig-a016-20230327   clang
i386                 randconfig-r022-20230327   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r003-20230326   gcc  
ia64                 randconfig-r015-20230327   gcc  
ia64                 randconfig-r016-20230326   gcc  
ia64                 randconfig-r033-20230326   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230327   gcc  
m68k         buildonly-randconfig-r006-20230326   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230327   gcc  
m68k                 randconfig-r036-20230327   gcc  
microblaze           randconfig-r004-20230327   gcc  
microblaze           randconfig-r034-20230326   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r001-20230326   gcc  
mips         buildonly-randconfig-r006-20230327   clang
nios2                               defconfig   gcc  
nios2                randconfig-r006-20230327   gcc  
nios2                randconfig-r013-20230326   gcc  
openrisc     buildonly-randconfig-r005-20230327   gcc  
openrisc             randconfig-r004-20230326   gcc  
parisc       buildonly-randconfig-r002-20230327   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230327   gcc  
parisc               randconfig-r005-20230326   gcc  
parisc               randconfig-r026-20230326   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r012-20230327   clang
powerpc              randconfig-r024-20230326   gcc  
powerpc              randconfig-r031-20230327   gcc  
powerpc              randconfig-r032-20230327   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r024-20230327   clang
riscv                randconfig-r042-20230326   gcc  
riscv                randconfig-r042-20230327   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r014-20230326   gcc  
s390                 randconfig-r014-20230327   clang
s390                 randconfig-r022-20230326   gcc  
s390                 randconfig-r044-20230326   gcc  
s390                 randconfig-r044-20230327   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r035-20230326   gcc  
sparc        buildonly-randconfig-r001-20230327   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r021-20230326   gcc  
sparc                randconfig-r025-20230327   gcc  
sparc64      buildonly-randconfig-r004-20230326   gcc  
sparc64              randconfig-r026-20230327   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230327   gcc  
x86_64               randconfig-a002-20230327   gcc  
x86_64               randconfig-a003-20230327   gcc  
x86_64               randconfig-a004-20230327   gcc  
x86_64               randconfig-a005-20230327   gcc  
x86_64               randconfig-a006-20230327   gcc  
x86_64               randconfig-a011-20230327   clang
x86_64               randconfig-a012-20230327   clang
x86_64               randconfig-a013-20230327   clang
x86_64               randconfig-a014-20230327   clang
x86_64               randconfig-a015-20230327   clang
x86_64               randconfig-a016-20230327   clang
x86_64               randconfig-r002-20230327   gcc  
x86_64               randconfig-r021-20230327   clang
x86_64               randconfig-r033-20230327   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r011-20230326   gcc  
xtensa               randconfig-r011-20230327   gcc  
xtensa               randconfig-r035-20230327   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
