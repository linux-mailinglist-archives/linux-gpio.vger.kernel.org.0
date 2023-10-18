Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5FE7CD5DF
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Oct 2023 10:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbjJRIB2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Oct 2023 04:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjJRIB1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Oct 2023 04:01:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920ADBC
        for <linux-gpio@vger.kernel.org>; Wed, 18 Oct 2023 01:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697616085; x=1729152085;
  h=date:from:to:cc:subject:message-id;
  bh=ANHnNcR+kEz0BRwRMwqzTy16s5+NlitDLICL+Uo5WAM=;
  b=IERq3VfPUdM3hkiL+ykNt3mOzOoN1pDpHj0OWdEoRpbx5fVqFW/gPgcO
   1k+vOlLysI82g8r2MyLouRMtjYo2dbBCBoFJAEUc/suWIRciuctrmZChM
   oxGv5loUS7ZXB2fZKPhKf2ni1786gsXy7AxL1pLq8K1u+nQna3vMOLz9A
   00oJcAt5awQs56NTSFtAikZlhzw/aGXDfsoo8FFg6Gcdf4nhSPdU8RbfF
   ttZZdJySL9Nw8NusOElVU3rkijbut02IX33GulpM5Mb//yNSwG+X7pDIp
   PZ1m9HMIJyGbCvcYuo9nY223B31otb5+9O9vlqSCDO853UEWWDZ3PNqkl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="388826397"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="388826397"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 01:01:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="847162140"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="847162140"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Oct 2023 01:01:23 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qt1UX-00006K-1W;
        Wed, 18 Oct 2023 08:01:21 +0000
Date:   Wed, 18 Oct 2023 16:00:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [brgl:gpio/devel] BUILD SUCCESS
 25d0d2280a42f210d2ec6d13ae0e7593caa4b1cb
Message-ID: <202310181623.p00bYS7v-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
branch HEAD: 25d0d2280a42f210d2ec6d13ae0e7593caa4b1cb  pinctrl: tegra: drop the wrapper around pinctrl_gpio_request()

elapsed time: 946m

configs tested: 128
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231018   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231018   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231018   gcc  
i386         buildonly-randconfig-002-20231018   gcc  
i386         buildonly-randconfig-003-20231018   gcc  
i386         buildonly-randconfig-004-20231018   gcc  
i386         buildonly-randconfig-005-20231018   gcc  
i386         buildonly-randconfig-006-20231018   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231018   gcc  
i386                  randconfig-002-20231018   gcc  
i386                  randconfig-003-20231018   gcc  
i386                  randconfig-004-20231018   gcc  
i386                  randconfig-005-20231018   gcc  
i386                  randconfig-006-20231018   gcc  
i386                  randconfig-011-20231018   gcc  
i386                  randconfig-012-20231018   gcc  
i386                  randconfig-013-20231018   gcc  
i386                  randconfig-014-20231018   gcc  
i386                  randconfig-015-20231018   gcc  
i386                  randconfig-016-20231018   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231018   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231018   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231018   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231018   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231018   gcc  
x86_64       buildonly-randconfig-002-20231018   gcc  
x86_64       buildonly-randconfig-003-20231018   gcc  
x86_64       buildonly-randconfig-004-20231018   gcc  
x86_64       buildonly-randconfig-005-20231018   gcc  
x86_64       buildonly-randconfig-006-20231018   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231018   gcc  
x86_64                randconfig-002-20231018   gcc  
x86_64                randconfig-003-20231018   gcc  
x86_64                randconfig-004-20231018   gcc  
x86_64                randconfig-005-20231018   gcc  
x86_64                randconfig-006-20231018   gcc  
x86_64                randconfig-011-20231018   gcc  
x86_64                randconfig-012-20231018   gcc  
x86_64                randconfig-013-20231018   gcc  
x86_64                randconfig-014-20231018   gcc  
x86_64                randconfig-015-20231018   gcc  
x86_64                randconfig-016-20231018   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
