Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99DBB6EA249
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Apr 2023 05:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233919AbjDUDR3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Apr 2023 23:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233973AbjDUDQv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Apr 2023 23:16:51 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AB583AA5
        for <linux-gpio@vger.kernel.org>; Thu, 20 Apr 2023 20:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682047009; x=1713583009;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hRFrOuW+VZ2UAO+1bJErSGL2GmFSWxRdVa+wQeStjY0=;
  b=WVfbatOquGoLCy7qzishyWuKAAzf62utOdu8+7RzH8gIT6bZZWnAAM3R
   psDV9AQFMNqXqOIlVITkv5jS8wXzKg4Ckd+AmDFB/sUBtWhLTbsWBAl5A
   zT3abMzkJ3UuWErWBH5GUVn/KciUu7yp3qoym6s8t7EiXcI8J7SRs1Va5
   YaTBJQR78JJJ1vZjJmntByQn43V3FggJpavTUJpmL4OaWFuKUCRwwlEUs
   QpbxqM7rtvPCkba0H9G5vw94ZHciSc9Z5PuVGmEuyfDHyyx830QGpSoU/
   g9ToYI1WZuo9TGGstteQ8O2NEoNWnmylCkHRFEPiiSBW0EtJs6ENWgLVb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="325506819"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="325506819"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 20:16:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="761413864"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="761413864"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Apr 2023 20:16:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pphFh-000gGg-01;
        Fri, 21 Apr 2023 03:16:01 +0000
Date:   Fri, 21 Apr 2023 11:15:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 b203e264f3dd29a1050f5e72f38ca7c0e02f4089
Message-ID: <6441ffe5.Y2zgaC9UVryvdedt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: b203e264f3dd29a1050f5e72f38ca7c0e02f4089  Merge branch 'devel' into for-next

elapsed time: 725m

configs tested: 150
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230416   gcc  
alpha        buildonly-randconfig-r003-20230416   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r013-20230416   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230420   gcc  
arc                  randconfig-r021-20230416   gcc  
arc                  randconfig-r023-20230417   gcc  
arc                  randconfig-r043-20230416   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r031-20230418   gcc  
arm                  randconfig-r032-20230416   gcc  
arm                  randconfig-r046-20230416   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r024-20230418   gcc  
arm64                randconfig-r035-20230417   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r015-20230416   gcc  
csky                 randconfig-r021-20230417   gcc  
csky                 randconfig-r023-20230418   gcc  
csky                 randconfig-r032-20230417   gcc  
csky                 randconfig-r036-20230420   gcc  
hexagon      buildonly-randconfig-r002-20230418   clang
hexagon              randconfig-r005-20230420   clang
hexagon              randconfig-r006-20230420   clang
hexagon              randconfig-r025-20230419   clang
hexagon              randconfig-r041-20230416   clang
hexagon              randconfig-r045-20230416   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230417   gcc  
i386                 randconfig-a002-20230417   gcc  
i386                 randconfig-a003-20230417   gcc  
i386                 randconfig-a004-20230417   gcc  
i386                 randconfig-a005-20230417   gcc  
i386                 randconfig-a006-20230417   gcc  
i386                 randconfig-a011-20230417   clang
i386                 randconfig-a012-20230417   clang
i386                 randconfig-a013-20230417   clang
i386                 randconfig-a014-20230417   clang
i386                 randconfig-a015-20230417   clang
i386                 randconfig-a016-20230417   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r006-20230417   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r003-20230420   gcc  
ia64                 randconfig-r015-20230417   gcc  
ia64                 randconfig-r026-20230416   gcc  
ia64                 randconfig-r036-20230418   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230418   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230417   gcc  
loongarch            randconfig-r025-20230418   gcc  
loongarch            randconfig-r034-20230420   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r005-20230417   gcc  
m68k         buildonly-randconfig-r005-20230418   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230417   gcc  
m68k                 randconfig-r033-20230418   gcc  
microblaze           randconfig-r016-20230416   gcc  
microblaze           randconfig-r022-20230418   gcc  
microblaze           randconfig-r034-20230418   gcc  
microblaze           randconfig-r036-20230416   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r023-20230419   gcc  
mips                 randconfig-r024-20230417   gcc  
mips                 randconfig-r026-20230418   clang
mips                 randconfig-r026-20230419   gcc  
mips                 randconfig-r031-20230417   clang
mips                 randconfig-r033-20230416   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r021-20230418   gcc  
nios2                randconfig-r024-20230419   gcc  
openrisc             randconfig-r012-20230417   gcc  
openrisc             randconfig-r033-20230420   gcc  
parisc       buildonly-randconfig-r002-20230417   gcc  
parisc       buildonly-randconfig-r006-20230418   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r001-20230420   clang
powerpc              randconfig-r031-20230416   clang
powerpc              randconfig-r032-20230418   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230418   gcc  
riscv        buildonly-randconfig-r002-20230416   gcc  
riscv        buildonly-randconfig-r006-20230416   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r022-20230417   clang
riscv                randconfig-r025-20230416   gcc  
riscv                randconfig-r042-20230416   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r004-20230416   gcc  
s390         buildonly-randconfig-r004-20230418   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230420   clang
s390                 randconfig-r012-20230416   gcc  
s390                 randconfig-r022-20230416   gcc  
s390                 randconfig-r025-20230417   clang
s390                 randconfig-r026-20230417   clang
s390                 randconfig-r034-20230417   gcc  
s390                 randconfig-r044-20230416   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r024-20230416   gcc  
sh                   randconfig-r035-20230416   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r021-20230419   gcc  
sparc                randconfig-r022-20230419   gcc  
sparc                randconfig-r032-20230420   gcc  
sparc64              randconfig-r033-20230417   gcc  
sparc64              randconfig-r035-20230420   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r004-20230417   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230417   gcc  
x86_64               randconfig-a002-20230417   gcc  
x86_64               randconfig-a003-20230417   gcc  
x86_64               randconfig-a004-20230417   gcc  
x86_64               randconfig-a005-20230417   gcc  
x86_64               randconfig-a006-20230417   gcc  
x86_64               randconfig-a011-20230417   clang
x86_64               randconfig-a012-20230417   clang
x86_64               randconfig-a013-20230417   clang
x86_64               randconfig-a014-20230417   clang
x86_64               randconfig-a015-20230417   clang
x86_64               randconfig-a016-20230417   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r011-20230416   gcc  
xtensa               randconfig-r023-20230416   gcc  
xtensa               randconfig-r034-20230416   gcc  
xtensa               randconfig-r035-20230418   gcc  
xtensa               randconfig-r036-20230417   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
