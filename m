Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE21E6DFE5E
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Apr 2023 21:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjDLTI2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Apr 2023 15:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjDLTI2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Apr 2023 15:08:28 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CBA84EF2
        for <linux-gpio@vger.kernel.org>; Wed, 12 Apr 2023 12:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681326506; x=1712862506;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=G/spJQF+88+7ZKv8Id2cZkIAdIdfhJwM4ii+7gp0bGk=;
  b=YrE3c8p/t3Q+jMmjw/0pTb11WXFrlnS2LIdpMG1XGsoh0354Hbys1ucl
   31bBEIGp9twhgPIv2V4BSeMqCfGwJnSr0Z6mXCQWD8ZyZKn0jTJjcgScj
   wRe1CTwuvc9jktMhSF8qnOXaX8SlC8gKRijwK1twMq1foh8CE4EjkvmDm
   UFmkAVBc5k+Z8CKI7nm+qQ/b6/brs3cgWmHTirLJEd7nldkQ7RZDgtR0C
   z4fprwS7/7ERbQVazU85j63yDXCjcsc4W/irpk+iDrblkLDGWfmbll8S0
   MMDCREtdM6yU4eWiVJafMKv/av7LhiIuEX7sissFnseOu/bcGDHdihHhl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="409137571"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="409137571"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 12:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="1018843573"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="1018843573"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 Apr 2023 12:08:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pmfpN-000Y0F-1X;
        Wed, 12 Apr 2023 19:08:21 +0000
Date:   Thu, 13 Apr 2023 03:07:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:fixes] BUILD SUCCESS
 534e465845ebfb4a97eb5459d3931a0b35e3b9a5
Message-ID: <6437017e.76lm4rsVkp+VoOSx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git fixes
branch HEAD: 534e465845ebfb4a97eb5459d3931a0b35e3b9a5  Revert "pinctrl: amd: Disable and mask interrupts on resume"

elapsed time: 1272m

configs tested: 99
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230409   gcc  
alpha        buildonly-randconfig-r006-20230410   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230410   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r035-20230409   clang
csky                                defconfig   gcc  
hexagon              randconfig-r033-20230409   clang
i386                             allyesconfig   gcc  
i386                         debian-10.3-func   gcc  
i386                   debian-10.3-kselftests   gcc  
i386                        debian-10.3-kunit   gcc  
i386                          debian-10.3-kvm   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230410   clang
i386                 randconfig-a002-20230410   clang
i386                 randconfig-a003-20230410   clang
i386                 randconfig-a004-20230410   clang
i386                 randconfig-a005-20230410   clang
i386                 randconfig-a006-20230410   clang
i386                 randconfig-a011-20230410   gcc  
i386                 randconfig-a012-20230410   gcc  
i386                 randconfig-a013-20230410   gcc  
i386                 randconfig-a014-20230410   gcc  
i386                 randconfig-a015-20230410   gcc  
i386                 randconfig-a016-20230410   gcc  
i386                 randconfig-r036-20230410   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r001-20230409   gcc  
ia64                 randconfig-r024-20230410   gcc  
ia64                 randconfig-r025-20230409   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r004-20230409   gcc  
loongarch            randconfig-r021-20230410   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r002-20230409   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r002-20230410   gcc  
mips                 randconfig-r005-20230410   gcc  
nios2                               defconfig   gcc  
parisc       buildonly-randconfig-r003-20230409   gcc  
parisc       buildonly-randconfig-r004-20230409   gcc  
parisc       buildonly-randconfig-r004-20230410   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r006-20230410   gcc  
parisc               randconfig-r022-20230409   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230410   gcc  
powerpc              randconfig-r034-20230409   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230409   gcc  
riscv        buildonly-randconfig-r005-20230410   gcc  
riscv        buildonly-randconfig-r006-20230409   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r023-20230409   gcc  
s390                 randconfig-r033-20230410   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r005-20230409   gcc  
sh                   randconfig-r023-20230410   gcc  
sh                   randconfig-r026-20230409   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r003-20230409   gcc  
sparc64              randconfig-r021-20230409   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230410   clang
x86_64               randconfig-a002-20230410   clang
x86_64               randconfig-a003-20230410   clang
x86_64               randconfig-a004-20230410   clang
x86_64               randconfig-a005-20230410   clang
x86_64               randconfig-a006-20230410   clang
x86_64                        randconfig-k001   clang
x86_64               randconfig-r025-20230410   gcc  
x86_64               randconfig-r034-20230410   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
