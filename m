Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 301937B00BA
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 11:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjI0Jk1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 05:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbjI0JkX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 05:40:23 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F9581A6
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 02:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695807622; x=1727343622;
  h=date:from:to:cc:subject:message-id;
  bh=hIEn0gjXxt2VnuEh6xjcICVm4teXBQRQYC3YlaZKJf4=;
  b=HVc34OXcmkmY3ZnXavDUhCWm1MYyu077JLtyThqPUA5Tgd55TcnJujgM
   +WKkcEAUs21tPs2ofFuAtbxZMlgX4iSGk+JaXADuII204hWUFF1VXdnba
   yahhNV/80cleNJ5V+ojniZpequInTxxYGbJzXOGPULZdZHEI4FNnV6K8s
   tF75kjq8sYuc5oFHNtWR+kLi2eW8t9fMbWo551n3vRXNUZbvzCLp+gLBV
   IK4PIivq2w5qgy5fJItyUq+JZZIt0uqxRhHBfteqhilY+PhQLJe6YQIOz
   pJFKok85t0ornnxH4zfjqt0rTngVfWq5Q1rLnN3/XVfHdGf477caH4nGm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="379059521"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="379059521"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 02:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="819360194"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="819360194"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 27 Sep 2023 02:40:18 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qlR1k-00003A-1E;
        Wed, 27 Sep 2023 09:40:16 +0000
Date:   Wed, 27 Sep 2023 17:40:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 b5d808409c2006eeded1dbcb63c9e45fa5af4522
Message-ID: <202309271702.UaCAQHQ0-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: b5d808409c2006eeded1dbcb63c9e45fa5af4522  Merge branch 'devel' into for-next

elapsed time: 1463m

configs tested: 187
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
arc                   randconfig-001-20230926   gcc  
arc                   randconfig-001-20230927   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230926   gcc  
arm                   randconfig-001-20230927   gcc  
arm                           sama5_defconfig   gcc  
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
i386         buildonly-randconfig-001-20230926   gcc  
i386         buildonly-randconfig-001-20230927   gcc  
i386         buildonly-randconfig-002-20230926   gcc  
i386         buildonly-randconfig-002-20230927   gcc  
i386         buildonly-randconfig-003-20230926   gcc  
i386         buildonly-randconfig-003-20230927   gcc  
i386         buildonly-randconfig-004-20230926   gcc  
i386         buildonly-randconfig-004-20230927   gcc  
i386         buildonly-randconfig-005-20230926   gcc  
i386         buildonly-randconfig-005-20230927   gcc  
i386         buildonly-randconfig-006-20230926   gcc  
i386         buildonly-randconfig-006-20230927   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230927   gcc  
i386                  randconfig-002-20230927   gcc  
i386                  randconfig-003-20230927   gcc  
i386                  randconfig-004-20230927   gcc  
i386                  randconfig-005-20230927   gcc  
i386                  randconfig-006-20230927   gcc  
i386                  randconfig-011-20230926   gcc  
i386                  randconfig-011-20230927   gcc  
i386                  randconfig-012-20230926   gcc  
i386                  randconfig-012-20230927   gcc  
i386                  randconfig-013-20230926   gcc  
i386                  randconfig-013-20230927   gcc  
i386                  randconfig-014-20230926   gcc  
i386                  randconfig-014-20230927   gcc  
i386                  randconfig-015-20230926   gcc  
i386                  randconfig-015-20230927   gcc  
i386                  randconfig-016-20230926   gcc  
i386                  randconfig-016-20230927   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230926   gcc  
loongarch             randconfig-001-20230927   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       lemote2f_defconfig   clang
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
powerpc                      ppc44x_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230926   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230926   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         microdev_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230927   gcc  
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
x86_64       buildonly-randconfig-001-20230926   gcc  
x86_64       buildonly-randconfig-001-20230927   gcc  
x86_64       buildonly-randconfig-002-20230926   gcc  
x86_64       buildonly-randconfig-002-20230927   gcc  
x86_64       buildonly-randconfig-003-20230926   gcc  
x86_64       buildonly-randconfig-003-20230927   gcc  
x86_64       buildonly-randconfig-004-20230926   gcc  
x86_64       buildonly-randconfig-004-20230927   gcc  
x86_64       buildonly-randconfig-005-20230926   gcc  
x86_64       buildonly-randconfig-005-20230927   gcc  
x86_64       buildonly-randconfig-006-20230926   gcc  
x86_64       buildonly-randconfig-006-20230927   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230926   gcc  
x86_64                randconfig-001-20230927   gcc  
x86_64                randconfig-002-20230926   gcc  
x86_64                randconfig-002-20230927   gcc  
x86_64                randconfig-003-20230926   gcc  
x86_64                randconfig-003-20230927   gcc  
x86_64                randconfig-004-20230926   gcc  
x86_64                randconfig-004-20230927   gcc  
x86_64                randconfig-005-20230926   gcc  
x86_64                randconfig-005-20230927   gcc  
x86_64                randconfig-006-20230926   gcc  
x86_64                randconfig-006-20230927   gcc  
x86_64                randconfig-011-20230926   gcc  
x86_64                randconfig-011-20230927   gcc  
x86_64                randconfig-012-20230926   gcc  
x86_64                randconfig-012-20230927   gcc  
x86_64                randconfig-013-20230926   gcc  
x86_64                randconfig-013-20230927   gcc  
x86_64                randconfig-014-20230926   gcc  
x86_64                randconfig-014-20230927   gcc  
x86_64                randconfig-015-20230926   gcc  
x86_64                randconfig-015-20230927   gcc  
x86_64                randconfig-016-20230926   gcc  
x86_64                randconfig-016-20230927   gcc  
x86_64                randconfig-071-20230926   gcc  
x86_64                randconfig-071-20230927   gcc  
x86_64                randconfig-072-20230926   gcc  
x86_64                randconfig-072-20230927   gcc  
x86_64                randconfig-073-20230926   gcc  
x86_64                randconfig-073-20230927   gcc  
x86_64                randconfig-074-20230926   gcc  
x86_64                randconfig-074-20230927   gcc  
x86_64                randconfig-075-20230926   gcc  
x86_64                randconfig-075-20230927   gcc  
x86_64                randconfig-076-20230926   gcc  
x86_64                randconfig-076-20230927   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
